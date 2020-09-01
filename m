Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38401258A03
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 10:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3CF6E5B4;
	Tue,  1 Sep 2020 08:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB3C6E5B4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 08:03:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08183U9n038807;
 Tue, 1 Sep 2020 03:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598947410;
 bh=rTdSKw6jc2hIcyQD34V8CbUn0PeOh3Lnz/RojDEQl28=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=P7+W7+njHjsDoAJNb7Bq8ex3fOF316aSw/LTChMzasA/ZxG+qD3lIeGf5tb/erTxs
 y0HuN8y5mM+QxMUiZBrQk/aNwOEIUkbM7Yhqsi6CCn+jCp0ARuSm413t1pHbD1hoWG
 7TuyuY3QnlujSButsKyhNmrTAh0tU0cpTuKte/4Y=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08183UL6058781
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Sep 2020 03:03:30 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 03:03:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 03:03:29 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08183Pql056860;
 Tue, 1 Sep 2020 03:03:26 -0500
Subject: Re: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
 DPI/DP bridge
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Swapnil Jakhade <sjakhade@cadence.com>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
References: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
 <1598862215-10222-3-git-send-email-sjakhade@cadence.com>
 <71452de7-80e7-0144-4802-e3370c00854b@ti.com>
Message-ID: <44d5f9de-61e6-9345-d65b-b56f804e6550@ti.com>
Date: Tue, 1 Sep 2020 11:03:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <71452de7-80e7-0144-4802-e3370c00854b@ti.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 jsarha@ti.com, a.hajda@samsung.com, robh+dt@kernel.org, nikhil.nd@ti.com,
 mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2020 10:46, Tomi Valkeinen wrote:

> I think the above suggests that the driver is not properly updating all the registers based on the
> new mode and link. I tried adding cdns_mhdp_validate_mode_params() call to
> cdns_mhdp_atomic_enable(), so that tu-size etc will be calculated, but that did not fix the problem.

Oh, it actually did fix the problem. It was just that my first hack updated the old state, but after
changing the code to call cdns_mhdp_atomic_enable() with new_state I see it helps with the issue.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
