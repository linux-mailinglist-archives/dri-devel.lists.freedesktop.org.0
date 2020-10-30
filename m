Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF929FE75
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 08:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505C16E958;
	Fri, 30 Oct 2020 07:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966F76E958
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 07:30:53 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09U7UlT5084759;
 Fri, 30 Oct 2020 02:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604043047;
 bh=q0LrOKK60Lb5YC+OuxMnYLTDR0WNwNoRFy1TbK33A34=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cpI9VqyeqrmeCYFAqaekPeCMkYuOEUDWYznfA59JYiV23uW46bdyoqjoSW/cG6OvI
 ud13hzO18X60lObkWIma49Qi/+pKsF4V5SAsL9rrXogbdHZBgMa9m2JRtQb3/lPfbT
 KRcwLSK71MhXRwlkuVYeOKj5MorWbvY6nYHy4UV4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09U7Uk9h066329
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Oct 2020 02:30:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 02:30:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 02:30:04 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09U7U2VO040704;
 Fri, 30 Oct 2020 02:30:03 -0500
Subject: Re: [PATCH 3/5] drm: bridge: Propagate the bus flags from
 bridge->timings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar
 <nikhil.nd@ti.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-4-nikhil.nd@ti.com>
 <fd65aa92-bc89-2420-bbc1-e131db1f6c25@ti.com>
 <20201028143453.njt3lak542wwx6jb@NiksLab>
 <20201029224817.GH15024@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <dfb643a6-cb73-c915-21ff-387faa177c94@ti.com>
Date: Fri, 30 Oct 2020 09:30:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029224817.GH15024@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/10/2020 00:48, Laurent Pinchart wrote:

>>> And, hmm... It's too easy to get confused with these, but... If the bridge defines timings, and
>>> timings->input_bus_flags != 0, should we always pick that, even if we got something via
>>> output_flags? Logic being, if this bridge defines timings->input_bus_flags, it probably wants that
>>> to be used regardless whether we got something from the next bridge.
> 
> timings->input_bus_flags is an API that predates format and flags
> propagation along the pipeline. I would assume that drivers that
> implement propagation should do so in a way that prioritize that API,
> and either not report flags in the timings (in which case giving
> priority to one or another wouldn't make a difference as both would
> never be provided together), or would report flags in the timings as a
> best effort fallback for display controller drivers that would look at
> them exclusively without supporting the new API. I would thus think that
> the flags obtained through format negotiation should be prioritized.

What do you mean "drivers that implement propagation"? Doesn't that come from the framework, not
from the drivers?

Say, we have two bridges, A -> B. A has timings->input_bus_flags.

When propagating the flags, we get something as B's input flags. Should A use B's input flags as A's
input flags, or should A use its timings->input_bus_flags? I was suggesting the latter. Nikhil's
patch does the latter, but only if B's input flags was 0.

A can override its input flags manually in atomic_check, but if the timings->input_bus_flags exists,
isn't it a sane choice to just pick that by default?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
