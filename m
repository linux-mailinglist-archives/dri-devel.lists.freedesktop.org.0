Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113A29AB04
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 12:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A0B6EB5B;
	Tue, 27 Oct 2020 11:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4C76EB5B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 11:40:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09RBeHX6030879;
 Tue, 27 Oct 2020 06:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603798817;
 bh=nfRhkoLnLUOvgtAdlZjcju3oync9ao17Pky8vmQ0ce0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=G2vHeSaaJ99cw7lLwkzmt4NkeB67wjH9bEkc+L/wIOU7E7ysCeKEoqS/8hh7JTOyR
 XHLyZ2m4SFnP4dKCAMA7+kx8rO0UV/ve/FQoIC18ji/96rq+oYqnMqXKynWz+vXzdB
 OUeABjeohJWDelXBqIXu9Q/Wn+0BceMgukJrMPCc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09RBeHD7078112
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Oct 2020 06:40:17 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 27
 Oct 2020 06:40:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 27 Oct 2020 06:40:16 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09RBeDIb126547;
 Tue, 27 Oct 2020 06:40:13 -0500
Subject: Re: [PATCH] drm: bridge: cdns: Kconfig: Switch over dependency to
 ARCH_K3
To: Nishanth Menon <nm@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>, Jyri
 Sarha <jsarha@ti.com>, Yuti Amonkar <yamonkar@cadence.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>
References: <20201026165441.22894-1-nm@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <82d5e520-e223-71c3-b6e0-22b8e1eda8bf@ti.com>
Date: Tue, 27 Oct 2020 13:40:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026165441.22894-1-nm@ti.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ssantosh@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/10/2020 18:54, Nishanth Menon wrote:
> With the integration of chip-id detection scheme in kernel[1], there
> is no specific need to maintain multitudes of SoC specific config
> options, discussed as per [2], we have deprecated the usage in other
> places for v5.10-rc1. Fix the missing user so that we can clean up the
> configs in v5.11.
> 
> [1] drivers/soc/ti/k3-socinfo.c commit 907a2b7e2fc7 ("soc: ti: add k3 platforms chipid module driver")
> [2] https://lore.kernel.org/linux-arm-kernel/20200908112534.t5bgrjf7y3a6l2ss@akan/
> 
> Fixes: afba7e6c5fc1 ("rm: bridge: cdns-mhdp8546: Add TI J721E wrapper")
> Cc: Swapnil Jakhade <sjakhade@cadence.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Yuti Amonkar <yamonkar@cadence.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
> index 511d67b16d14..ef8c230e0f62 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -13,7 +13,7 @@ config DRM_CDNS_MHDP8546
>  if DRM_CDNS_MHDP8546
>  
>  config DRM_CDNS_MHDP8546_J721E
> -	depends on ARCH_K3_J721E_SOC || COMPILE_TEST
> +	depends on ARCH_K3 || COMPILE_TEST
>  	bool "J721E Cadence DPI/DP wrapper support"
>  	default y
>  	help
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
