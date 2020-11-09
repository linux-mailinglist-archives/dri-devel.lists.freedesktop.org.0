Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552D32AB249
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827AF894DE;
	Mon,  9 Nov 2020 08:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D012894DE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:18:35 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A98IKKH040946;
 Mon, 9 Nov 2020 02:18:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604909900;
 bh=gV1BYWshFtiy/uc5LwABIQEEdkgG8l02qDntiHzOkuo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qcI9k3szWJRLYMI2kHwkSDN593ECg/QtQOmQdZXGeE8323jw/sUuTD2ttuY+vnfJv
 if4uVbMVeu3AKmm3RA09BkYASKgcBSWjeo4zuMZPSnUKxGe+55im8pbhAdCn2rjms+
 4PtAZ7KQPodETPy476wj8wovlCMZo28f3jdwV//s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A98IKw1001264
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 02:18:20 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 02:18:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 02:18:19 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A98IHNj113540;
 Mon, 9 Nov 2020 02:18:18 -0600
Subject: Re: [PATCH v3 09/56] drm/omap: dsi: drop virtual channel logic
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-10-tomi.valkeinen@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <38a4a943-668f-0b81-7fc8-1ae119ee77d9@ti.com>
Date: Mon, 9 Nov 2020 10:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105120333.947408-10-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/11/2020 14:02, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> This drops the virtual channel logic. Afterwards DSI clients
> request their channel number and get the virtual channel with
> the same number or -EBUSY if already in use.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 11 ++---
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 46 ++++---------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 +-
>  3 files changed, 12 insertions(+), 49 deletions(-)

A comment about this (and other virtual channel logic changes): When Sebastian sent the series in
Feb, I commented that the VC change is not correct. That's still true, and I did not fix it as I'm
not sure how to fix it, and however it is fixed has to be fully inside dsi.c (so it doesn't affect
e.g. the panel drivers).

However, it works just fine. The case where things will break is when we need to use multiple VCs
(OMAP DSI's "configuration blocks", not virtual channel ID numbers). Command mode panels don't need
this. Video mode panels might need it, but it's not quite clear to me if it's strictly needed, or is
it just an optimization.

I hope to get a board with video mode panel soonish, or help Nikolaus to debug this.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
