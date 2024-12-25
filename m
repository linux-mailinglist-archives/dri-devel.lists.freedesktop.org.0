Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF69FC578
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 14:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8F810E2C3;
	Wed, 25 Dec 2024 13:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rXWfY6Ph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDB610E2C3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 13:38:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7CDDD5C5DBC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 13:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D43C4CEE0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735133881;
 bh=3vp4CKpd8ESTDsu6bu1UxWJdXeo8s2CdWgw9zFnQGyk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rXWfY6Ph5u9D6yUzFeU1G7WfxI5ZgDNOXUI1gEun9GVsBSpOIlLEbXgTWWpTEK+Ua
 1Y5HgQClzhapskwF9tP2ytrHrrpIL+D4sSRKP/oKFZ2l/FTdFdiZcJ92hoiHlLqv+B
 N+QI2+l46xGzTQxy7HIzz2kdBAQsaZYMc6lfA76hfFrT+peWdoJJkGgnOkhVShoX8V
 +yT7sjumnB+Prl5eDAG71AcJKdM51gJaKD6bJv1byazGg7FQN4whRjZTVWIscmWZNv
 WHfqUep5haiNm7XxAy9wbqKqR2hzrjC2gLnWuJtxIxOjLjPupOa2gZnBSr6E5eGMxs
 twMobvsVMBE2w==
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2ee67e9287fso6338140a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 05:38:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXB6g+bOOGUG6Wv5u4kaib/8D7axxvYN/jyKAg+Ie+LE7ioVBoQyT5SxIPzIkoAqwHUuFVBmLXIZXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeAyE5UdzAcNTNgKAuDlLiY7HKQ+pSw2Zh1zOAfDJCPFLI7tWB
 wxTQnMoIx1u+TaWXRWeDl0F/rTQi97igYrOd5MWTKXFd8mvcBlnmmhhkxMaPgxQx6DVRPq6W6dT
 ipv/hpzDX3xYXvStcvxMRp6/8fg==
X-Google-Smtp-Source: AGHT+IFnZi1NtQQv9dj8a3jgcoYTjJpfp/YWEkT5/4IPrfik/YKvJdKHM45+WkcKaOEyw9dWlTYx69mcNgYit5wx2V0=
X-Received: by 2002:a17:90b:2cc7:b0:2ee:53b3:3f1c with SMTP id
 98e67ed59e1d1-2f452debcdamr32176458a91.5.1735133881217; Wed, 25 Dec 2024
 05:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20241128023733.16294-1-liankun.yang@mediatek.com>
In-Reply-To: <20241128023733.16294-1-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 21:38:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-0cw+OEi7bq4QLdRE1JuLVRevgH6Rj7stT1H=RpD9dKQ@mail.gmail.com>
Message-ID: <CAAOTY_-0cw+OEi7bq4QLdRE1JuLVRevgH6Rj7stT1H=RpD9dKQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] drm/mediatek: dp: Add sdp path reset
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, jitao.shi@mediatek.com, 
 mac.shen@mediatek.com, peng.liu@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi, Liankun:

Liankun Yang <liankun.yang@mediatek.com> =E6=96=BC 2024=E5=B9=B411=E6=9C=88=
28=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:37=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> When using type-c to type-c to connect to the monitor,
> the sound plays normally. If you unplug the type-c and
> connect the type-c to hdmi dongle to the monitor, there will be noise.
>
> By capturing the audio data, it is found that
> the data position is messy, and there is no error in the data.
>
> Through experiments, it can be restored by resetting the SDP path
> when unplugging it.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> Changes in V4:
> - Fix align to the right of '('.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240925064854.=
23065-1-liankun.yang@mediatek.com/
>
> Changes in V3:
> - No change.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240923132521.=
22785-1-liankun.yang@mediatek.com/
>
> Changes in V2:
> - Fix build error.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240923133610.=
23728-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 15 +++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  1 +
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 1cc916b16471..4f4233bd83f7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1135,6 +1135,18 @@ static void mtk_dp_digital_sw_reset(struct mtk_dp =
*mtk_dp)
>                            0, DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0);
>  }
>
> +static void mtk_dp_sdp_path_reset(struct mtk_dp *mtk_dp)
> +{
> +       mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
> +                          SDP_RESET_SW_DP_ENC0_P0,
> +                          SDP_RESET_SW_DP_ENC0_P0);
> +
> +       /* Wait for sdp path reset to complete */
> +       usleep_range(1000, 5000);
> +       mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
> +                          0, SDP_RESET_SW_DP_ENC0_P0);
> +}
> +
>  static void mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
>  {
>         mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35F0,
> @@ -2397,6 +2409,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm=
_bridge *bridge,
>                            DP_PWR_STATE_BANDGAP_TPLL,
>                            DP_PWR_STATE_MASK);
>
> +       /* SDP path reset sw*/
> +       mtk_dp_sdp_path_reset(mtk_dp);
> +
>         /* Ensure the sink is muted */
>         msleep(20);
>  }
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/medi=
atek/mtk_dp_reg.h
> index 709b79480693..8ad7a9cc259e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -86,6 +86,7 @@
>  #define MTK_DP_ENC0_P0_3004                    0x3004
>  #define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK               BIT(8)
>  #define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0           BIT(9)
> +#define SDP_RESET_SW_DP_ENC0_P0                                BIT(13)
>  #define MTK_DP_ENC0_P0_3010                    0x3010
>  #define HTOTAL_SW_DP_ENC0_P0_MASK                      GENMASK(15, 0)
>  #define MTK_DP_ENC0_P0_3014                    0x3014
> --
> 2.45.2
>
