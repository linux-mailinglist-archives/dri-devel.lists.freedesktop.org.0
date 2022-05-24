Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E91532474
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 09:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDAD10E9DF;
	Tue, 24 May 2022 07:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC6710E9DF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 07:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1653378786; x=1684914786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D0B5gdtY97BkKUCFaukFM3dwipo4RNF9srhmfCq7dp0=;
 b=DnRsh0tASOENA+M1O9IZclQUHH4vlj3OU6tJnijuddsIf2SIiuQE2K+7
 i8uiatwFmc9ajvzM8XeBB5brIz+invm5kKumq7570xY4NjazI7aHVe6mN
 BAAqhNK8qTfXencDFtRICU8sFSQeh3WwaXGIQ4k7dT4ZKnlqYbnfqiTKc
 cR9qeF0esN2mZ9mfOgzhHpQl/Dkbcp/AOdnmiBBbjrmfqFrd0oDWVLx2P
 VRUU6o9ap37/rF1KhuT111D6stA5z4PxRNIC1eagw9rHUn6CLaRGoEGMN
 GA6TxHpgsrJxW3sTn0IYB/1Z3lnLSIMjf74HMYMbJDr6OutqnW4Vjbi7k w==;
X-IronPort-AV: E=Sophos;i="5.91,248,1647298800"; d="scan'208";a="24052937"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 24 May 2022 09:53:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 24 May 2022 09:53:04 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 24 May 2022 09:53:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1653378784; x=1684914784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D0B5gdtY97BkKUCFaukFM3dwipo4RNF9srhmfCq7dp0=;
 b=mOpBg/z8j5PBKESg93sD7VjivrM7bq1zP+6kVOACZSbojHH+ZrPbJPcO
 gmPvWE+nCYTJ9RM93SfnovmRQb7MGM6moWuy5Bbc6ygPQANdJW9chGwdl
 bTc6wAjMOTBs123cKcxS9+q/tKI9HZvF9ZmSFXIkKKtxCVTvTpVV4JNvd
 TNbLv3OaLzVw/ZzMYrzBZszPlBliknLAC0DJygiFyrAeT5fI8SaEv42Y3
 UKFfYZuzS1PYYXRj+S9kwddPdTfB5AZM+CibNEue/Vwll8FtQAT6//QiM
 mP1NfP7DiHXDinCcguQcGxYU0hAaMxEdvry3AKkO8Hl6KQu4w495wIvn9 Q==;
X-IronPort-AV: E=Sophos;i="5.91,248,1647298800"; d="scan'208";a="24052936"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 May 2022 09:53:04 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 58D59280070;
 Tue, 24 May 2022 09:53:04 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v4 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Date: Tue, 24 May 2022 09:53:02 +0200
Message-ID: <2107017.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <0bf5532b-f4d9-fbf5-0037-61887fc8512e@denx.de>
References: <20220519114849.69918-1-marex@denx.de>
 <4403432.LvFx2qVVIh@steina-w> <0bf5532b-f4d9-fbf5-0037-61887fc8512e@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 martyn.welch@collabora.com, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 24. Mai 2022, 09:29:43 CEST schrieb Marek Vasut:
> On 5/24/22 09:09, Alexander Stein wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Am Donnerstag, 19. Mai 2022, 13:48:49 CEST schrieb Marek Vasut:
> >> Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
> >> completely different from the LCDIFv3 found in i.MX23 in that it has
> >> a completely scrambled register layout compared to all previous LCDIF
> >> variants. The new LCDIFv3 also supports 36bit address space.
> >> 
> >> Add a separate driver which is really a fork of MXSFB driver with the
> >> i.MX8MP LCDIF variant handling filled in.
> >> 
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Lucas Stach <l.stach@pengutronix.de>
> >> Cc: Peng Fan <peng.fan@nxp.com>
> >> Cc: Robby Cai <robby.cai@nxp.com>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Stefan Agner <stefan@agner.ch>
> >> ---
> >> V2: - Drop the pitch check from lcdif_fb_create()
> >> 
> >>      - Drop connector caching
> >>      - Wait for shadow load bit to be cleared in IRQ handler
> >>      - Make all clock mandatory and grab them all by name
> >>      - Wait for EN to be cleared in lcdif_disable_controller
> >>      - Rename to imx-lcdif
> >>      - Move shadow load to atomic_flush
> >> 
> >> V3: - Invert DE polarity to match MX8MPRM datasheet
> >> 
> >>      - Enable CSC in RGB to YUV mode for MEDIA_BUS_FMT_UYVY8_1X16
> >> 
> >> V4: - Drop lcdif_overlay_plane_formats, it is unused
> > 
> > Thanks for the update. With your change in V3 my HDMI output works now
> > without that hack mentioned. weston screen as well as 'fb-test -p 5'
> > output seems sensible.
> > Unfortunately this isn't the case for LVDS output on LCDIF2. I somehow
> > managed to get the DT nodes for LCDIF and LDB done. Also the necessary
> > addition to imx8m-blk-ctl. So eventually I can see some output. But the
> > screen is cutoff on the right side of about 15-20% and the screen is
> > flickering slighty. This is especially visible in 'fb-test -p 5'. The red
> > bars are only visible to less than 1/3 and the text as well as the
> > diagonal lines are flickering. Colors are correct though.
> > For the record: I am using a 'tianma,tm070jvhg33' panel.
> 
> Does LDB start working if you apply:
> 
>   static const struct drm_bridge_funcs funcs = {
>          .attach = fsl_ldb_attach,
> -       .atomic_check = fsl_ldb_atomic_check,
>          .atomic_enable = fsl_ldb_atomic_enable,
>          .atomic_disable = fsl_ldb_atomic_disable,
>          .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 
> to
> 
> drivers/gpu/drm/bridge/fsl-ldb.c

Thanks for the suggestion, but this doesn't change anything. For some reason 
bridge_state->output_bus_cfg.flags is 0, rendering this function as a no-op 
anyway. Why do we need to invert the DE signal polarity anyway?

I have a hunch this isn't related to data enable, I suspect this would lead to 
completly borked colors. But as this is correct, I think something about HSYNC 
is borked. VSYNC seems to be correct as the top and bottom lines are fine as 
expected.

Best regards,
Alexander


