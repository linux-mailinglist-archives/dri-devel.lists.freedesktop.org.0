Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3485125E6B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CD56EAF6;
	Thu, 19 Dec 2019 10:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117DA6EAF5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:01:43 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJA1as2071874;
 Thu, 19 Dec 2019 04:01:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576749696;
 bh=kbcL5CQIAPy8fIpetsCo5bruTuCq9ndEvy/yDUsihxE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=H666eOeBbZtt0HKfL24pP0mZDIo1ubQbJnklWIsCOuGwXmn1hpr3E9EzbVywfOELl
 zv1xZO4uMjHFjGf/zD112jVq61Mq1W2yR5Zj7Ftkt7yW3AJuSUF3LFX56VmJACPLv8
 jyKdhJus27SAWolCKgjvQdFf8WI+DjkIgoPSxWe4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJA1af5086642;
 Thu, 19 Dec 2019 04:01:36 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 04:01:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 04:01:36 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJA1YtK102583;
 Thu, 19 Dec 2019 04:01:34 -0600
Subject: Re: [PATCH v3 45/50] drm/omap: dpi: Register a drm_bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-46-laurent.pinchart@ideasonboard.com>
 <8f7e454b-4d63-37cf-ef83-77e23e90e07d@ti.com>
 <20191219094013.GA15002@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6727b9aa-37de-68f8-d2e1-eb4cc2c471ad@ti.com>
Date: Thu, 19 Dec 2019 12:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219094013.GA15002@pendragon.ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/12/2019 11:40, Laurent Pinchart wrote:

>> Do we ever get drm_bridge_funcs calls from multiple threads at the
>> same time? Is there a difference between having a single DPI output,
>> or multiple DPI outputs (i.e. can two different DPI outputs get calls
>> simultaneously?).
> 
> I'll drop the lock, it's not needed. The core should serialize calls to
> the bridge, at least per output. For different outputs, there's a
> possibility I believe of atomic commits being handled concurrently if
> they don't share any resource.

I don't think we do much locking with resource handling. E.g. we have single registers with mux 
settings for multiple outputs. If DPI (or any other dss output) gets called concurrently for 
different outputs, we might get a race.

I wonder if that concurrency is opt-in...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
