Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F90F5A0253
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A59C4E1F;
	Wed, 24 Aug 2022 19:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D15C99F36
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 06:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1661149490; x=1692685490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=01hb5RIN5yMoN2QFxQXX61jjHj0pSZByu5nlRcQ2MRI=;
 b=CV+QDyxe3xe8QYBuPAnm//kE4yK8SWcfv1TuyduC/fKAWXEKZ67j18EU
 4ZV2XFw63oCeTO/j40x+I5YupVOqmv1mPIZGGX+A8h7FmBTb8udXQ9kOQ
 BbaoNsFoIoVMsDrxKzVBZ18LsKrHVRUR8kxznDtsESH8BGfNfeHpTcUTx
 d8z2sjLWi/kFtD03JmQIRqyjpP/Eph0nac6l+vZVd/Bh985L5sR1rrV2C
 Faa5UY3el9cj6HyTpGSlpkhKF7gD+2s35GxRV5McEoLXNUTAqL2ZOjuIC
 6EN6YXJfFdfimTIV3uKWneSMoexV5scbQZleOQ2mD3u9a8m1jgGloioD5 A==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654552800"; d="scan'208";a="25717329"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 22 Aug 2022 08:24:48 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 22 Aug 2022 08:24:48 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 22 Aug 2022 08:24:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1661149488; x=1692685488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=01hb5RIN5yMoN2QFxQXX61jjHj0pSZByu5nlRcQ2MRI=;
 b=oKRDEdAhgoOj89Q2YbyPI2SlhI6xGmg1HTGB30rlOktdZEuMHOZvAfPf
 4E5eaMmUArk8ScNukBp8hDCCQl/ebZRWNK5FMLd87b8tNAC87dioHbf6k
 e6hTCxik/EpPBvq9da+afXFYatFEHBA43ecK8MouUnxt6HKUyY6vRkhcK
 COIW/Pe+GiJ3LLYND1T4tCgMrHYbbkzZqdchN/pV1QhdEdYb5uBFaR9wG
 i/go4a4Zbf3cUrAMB8OOF4cSFVfAKrMFenUQnT/SVUUp3lwkLFQLpcZTE
 Vy5oFkqvF7WxMumFAs5DJXWn+G7iOn7Qo+YyH609TDM3b9erkLasaXjqp w==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654552800"; d="scan'208";a="25717328"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 22 Aug 2022 08:24:48 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 38431280056;
 Mon, 22 Aug 2022 08:24:48 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v5 3/4] drm/lcdif: Clean up debug prints and comments
Date: Mon, 22 Aug 2022 08:24:45 +0200
Message-ID: <2254228.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220819140852.255187-3-marex@denx.de>
References: <20220819140852.255187-1-marex@denx.de>
 <20220819140852.255187-3-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, robert.foss@linaro.org,
 Liu Ying <victor.liu@oss.nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Marek,

Am Freitag, 19. August 2022, 16:08:51 CEST schrieb Marek Vasut:
> Update debug print to report bridge timings over connector ones.
> Drop missed comment commit from mxsfb.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reported-by: Liu Ying <victor.liu@oss.nxp.com>
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: Add RB from Liu
> V3: Add TB from Martyn from V1
> V4: Add AB from Sam from V2
> V5: Rebase on current drm-misc-next
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c index db7a90e5497c6..b1092aab14231
> 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -203,7 +203,7 @@ static void lcdif_crtc_mode_set_nofb(struct
> lcdif_drm_private *lcdif, DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock:
> %dkHz (actual: %dkHz)\n", m->crtc_clock,
>  			     (int)(clk_get_rate(lcdif->clk) / 1000));
> -	DRM_DEV_DEBUG_DRIVER(drm->dev, "Connector bus_flags: 0x%08X\n",
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
>  			     bus_flags);
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);

Is there any benefit to explicitly state it is the bridge input flags?
Anyway:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



