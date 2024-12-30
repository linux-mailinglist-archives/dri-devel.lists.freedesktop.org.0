Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE79FE750
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 15:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A3A10E502;
	Mon, 30 Dec 2024 14:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wz0whRTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B2710E502
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:53:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A76FE5C5BF6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9814EC4CEE2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735570432;
 bh=WDFEw3OsZJJ8Sq6HsWUnnhd0lqswD+wj97EUubtix7k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wz0whRTmwKap/vP8QsLGjspq7fE5V7xrYvevZur3NBIp2TZ9m09F8z3RY2FL+JZQP
 H0w5hh4Snc6FNPBgp+zqMrYZGYq0cTy9nW5WByM87MOwcoRrbY8Mnn5ZtG5oDru0PW
 zRsjAfpl3BUodZrbCz5UnmnQcH+AS/xWlxqRUbA3PkQHBDgcn8Z6bExxniREx66GrQ
 1lJrn2O7pWqfwxVbaAvPGfiInSD3bekhco+CR2M0uAyCRTNpGxihmqWmIxmzsOHR2p
 0kR55W0HJDX1SJSn6e7PLfykVFJj94UH6QmAKN0YHoqYnTfs3dtnu701lIZ41LnSyb
 TEydaqKfuKVpA==
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ef8c012913so9371285a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 06:53:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXbbPba58ut+JajEOphSeeQscxgoXQRXPUTw6ERh4oMTPHlkUhSipR+2fr3NMTsNezt6BwPwUyQaxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4288dWoQr7Td0v2yx6qZ0kkAFwzF6Vo113T/VSFbEURQJSduU
 fdgRNZ8tZSolwwFo4dpxBtNJ+PtYMBRUvkgUpcVTJ9gD+3NESF5Hqc92eaZCb5n6e32p6YGv/q1
 LUykJwclr33t5cYIlk6NrO+FmSQ==
X-Google-Smtp-Source: AGHT+IHWVxToWBIQDV5+6IDtpEaGWg3Z6eUwvEqRbNXBop4eB6WUWI7Yn024Nknp9WTDicmflHwCHCjFlUdP+kf7CQw=
X-Received: by 2002:a17:90b:2e0b:b0:2ee:f550:3848 with SMTP id
 98e67ed59e1d1-2f452deb50bmr56119082a91.5.1735570432073; Mon, 30 Dec 2024
 06:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20241219112733.47907-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241219112733.47907-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 30 Dec 2024 22:54:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__7-3Y_dyp2u=SXA2Cq6xxeyrzrvwvvLE7GeR39Gi6r5A@mail.gmail.com>
Message-ID: <CAAOTY__7-3Y_dyp2u=SXA2Cq6xxeyrzrvwvvLE7GeR39Gi6r5A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add registers to pdata to fix
 MT8186/MT8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, rex-bc.chen@mediatek.com, 
 xinlei.lee@mediatek.com, shuijing.li@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B412=E6=9C=8819=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:=
27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Registers DSI_VM_CMD and DSI_SHADOW_DEBUG start at different
> addresses in both MT8186 and MT8188 compared to the older IPs.
>
> Add two members in struct mtk_dsi_driver_data to specify the
> offsets for these two registers on a per-SoC basis, then do
> specify those in all of the currently present SoC driver data.
>
> This fixes writes to the Video Mode Command Packet Control
> register, fixing enablement of command packet transmission
> (VM_CMD_EN) and allowance of this transmission during the
> VFP period (TS_VFP_EN) on both MT8186 and MT8188.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 03d7adc41027 ("drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.=
c")
> Fixes: 814d5341f314 ("drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.=
c")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index e61b9bc68e9a..978332cd52f5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -139,11 +139,11 @@
>  #define CLK_HS_POST                    GENMASK(15, 8)
>  #define CLK_HS_EXIT                    GENMASK(23, 16)
>
> -#define DSI_VM_CMD_CON         0x130
> +/* DSI_VM_CMD_CON */
>  #define VM_CMD_EN                      BIT(0)
>  #define TS_VFP_EN                      BIT(5)
>
> -#define DSI_SHADOW_DEBUG       0x190U
> +/* DSI_SHADOW_DEBUG */
>  #define FORCE_COMMIT                   BIT(0)
>  #define BYPASS_SHADOW                  BIT(1)
>
> @@ -187,6 +187,8 @@ struct phy;
>
>  struct mtk_dsi_driver_data {
>         const u32 reg_cmdq_off;
> +       const u32 reg_vm_cmd_off;
> +       const u32 reg_shadow_dbg_off;
>         bool has_shadow_ctl;
>         bool has_size_ctl;
>         bool cmdq_long_packet_ctl;
> @@ -367,8 +369,8 @@ static void mtk_dsi_set_mode(struct mtk_dsi *dsi)
>
>  static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
>  {
> -       mtk_dsi_mask(dsi, DSI_VM_CMD_CON, VM_CMD_EN, VM_CMD_EN);
> -       mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
> +       mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, VM_CMD_EN, VM=
_CMD_EN);
> +       mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, TS_VFP_EN, TS=
_VFP_EN);
>  }
>
>  static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
> @@ -714,7 +716,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>
>         if (dsi->driver_data->has_shadow_ctl)
>                 writel(FORCE_COMMIT | BYPASS_SHADOW,
> -                      dsi->regs + DSI_SHADOW_DEBUG);
> +                      dsi->regs + dsi->driver_data->reg_shadow_dbg_off);
>
>         mtk_dsi_reset_engine(dsi);
>         mtk_dsi_phy_timconfig(dsi);
> @@ -1263,26 +1265,36 @@ static void mtk_dsi_remove(struct platform_device=
 *pdev)
>
>  static const struct mtk_dsi_driver_data mt8173_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0x200,
> +       .reg_vm_cmd_off =3D 0x130,
> +       .reg_shadow_dbg_off =3D 0x190
>  };
>
>  static const struct mtk_dsi_driver_data mt2701_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0x180,
> +       .reg_vm_cmd_off =3D 0x130,
> +       .reg_shadow_dbg_off =3D 0x190
>  };
>
>  static const struct mtk_dsi_driver_data mt8183_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0x200,
> +       .reg_vm_cmd_off =3D 0x130,
> +       .reg_shadow_dbg_off =3D 0x190,
>         .has_shadow_ctl =3D true,
>         .has_size_ctl =3D true,
>  };
>
>  static const struct mtk_dsi_driver_data mt8186_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0xd00,
> +       .reg_vm_cmd_off =3D 0x200,
> +       .reg_shadow_dbg_off =3D 0xc00,
>         .has_shadow_ctl =3D true,
>         .has_size_ctl =3D true,
>  };
>
>  static const struct mtk_dsi_driver_data mt8188_dsi_driver_data =3D {
>         .reg_cmdq_off =3D 0xd00,
> +       .reg_vm_cmd_off =3D 0x200,
> +       .reg_shadow_dbg_off =3D 0xc00,
>         .has_shadow_ctl =3D true,
>         .has_size_ctl =3D true,
>         .cmdq_long_packet_ctl =3D true,
> --
> 2.47.0
>
