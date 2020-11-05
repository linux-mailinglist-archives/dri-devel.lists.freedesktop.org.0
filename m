Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00E2A822D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 16:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5767B6ED93;
	Thu,  5 Nov 2020 15:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582246ED93
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 15:27:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5FRlJT018919;
 Thu, 5 Nov 2020 09:27:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604590067;
 bh=lw01xnVBw+ZhFtaw2mkO3RWRWnosJJIxR4NS35rfHxg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=HST4tMQsGkfeBicfjA/KfXhBaaU0q9QNF23xItyB1rOfAONay5Ft2MWeu+VVTtUkG
 xgIMqMspz6ndKoQvOLNePXvUxCzbCiX6csdEzOPSqnAAGvcoZzTLUb5xKftCo7aGfj
 x+QyqkPBHXbDqLXscaqrpCD8uezeu0NU/62Mr7oI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5FRlJ3043494
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 09:27:47 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 09:27:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 09:27:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5FRib2018580;
 Thu, 5 Nov 2020 09:27:45 -0600
Subject: Re: [PATCH v3 40/56] drm/panel: Move OMAP's DSI command mode panel
 driver
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-41-tomi.valkeinen@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <122ead7e-ec4a-72dc-f216-e833a1a01fd2@ti.com>
Date: Thu, 5 Nov 2020 17:27:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105120333.947408-41-tomi.valkeinen@ti.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/11/2020 14:03, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The panel driver is no longer using any OMAP specific APIs, so
> let's move it into the generic panel directory.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/omapdrm/Kconfig                        |  1 -
>  drivers/gpu/drm/omapdrm/Makefile                       |  1 -
>  drivers/gpu/drm/omapdrm/displays/Kconfig               | 10 ----------
>  drivers/gpu/drm/omapdrm/displays/Makefile              |  2 --
>  drivers/gpu/drm/panel/Kconfig                          |  9 +++++++++
>  drivers/gpu/drm/panel/Makefile                         |  1 +
>  .../gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c |  0
>  7 files changed, 10 insertions(+), 14 deletions(-)
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/Kconfig
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/Makefile
>  rename drivers/gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c (100%)

Just a note, I already have a few more cleanups for this driver. And I think we need to discuss how
to make this a properly generic DSI command mode driver, or should we just make this a driver for a
subset of drivers, used on OMAP platforms.

But I think that work is easier if the panel driver is in its proper place, as done in this patch.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
