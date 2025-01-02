Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772679FFA2E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 15:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F1910E705;
	Thu,  2 Jan 2025 14:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tTFk1NXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B6410E705
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 14:09:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E494D5C5F87
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 14:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB786C4CEE1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735826976;
 bh=PnfUdqriKM0fSfAEgGEyzxBSHRDzsPuhyp22VEzJ+zE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tTFk1NXgn9EDZKfXF5BDaSQc8HhbOAu8ZruvzIuIuCUlR4fUnlVw5TR2WE9iW5aV7
 Zd/xOpRCFJ3ZYigX3p30GKw61oNjrZQv6UzaaL9IFcnrlkkJ7TRdAPgHZjg/QAPkwG
 rItz6XSzx4gdkC33RxMcKTIw1BZv2XAIbhBvFUtrSuOgaaCS0MTAgnCqMkmMCahNkM
 3AyBSv5vyQgaKPXC0m9PyY6asR1UGyDEin8bK4sKtkOXfKg/1cW36oBa2rIP9z9lCH
 E9EdOU9hDUB1jePNSnQNDN6AdmFHXp3iuT/2mdzmVCwGxCw1xAIc5XrV1ry6txbcFp
 fUa8UukIdbmsw==
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ef748105deso12081099a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 06:09:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUT4mpwiDunV7CqwWHe/9bs2RjpkFfpxcz/0vtUtqvIAH0oPLlzw0x8jWPloNtXo/eJzr9h9x/Z8WY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSgaKExpK2Z3wUZOICdSwkOxxXf1ZBX+TKiNBbcKm96zplUws8
 59Cbrg+em/VxrcmX+nGTRLTkNHhE55hu6259OSp9d4uKdq7JVdYyYkLvLdzwOofWJQzBmkHlKhV
 uJRc30L4FQcUjeXEJhvDVBphCkA==
X-Google-Smtp-Source: AGHT+IEzcCxeAv7vqklDx1+zkkQeCdgFDrbxA+g+5yLSP75q6XuPDjVTFmZURNL7tgRYY48Ut4xg8mgh0ofdN4VVFek=
X-Received: by 2002:a17:90a:d448:b0:2f4:43ce:dcea with SMTP id
 98e67ed59e1d1-2f452ee5e95mr61497972a91.25.1735826976248; Thu, 02 Jan 2025
 06:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20241218113448.2992-1-liankun.yang@mediatek.com>
In-Reply-To: <20241218113448.2992-1-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 2 Jan 2025 22:10:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY__JXYfCRTBh_TYWCNy1d0hcNXOzeR8Czk=KiauEs6xcXQ@mail.gmail.com>
Message-ID: <CAAOTY__JXYfCRTBh_TYWCNy1d0hcNXOzeR8Czk=KiauEs6xcXQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/mediatek: Add return value check when reading
 DPCD
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
 granquet@baylibre.com, dmitry.osipenko@collabora.com, 
 rex-bc.chen@mediatek.com, jitao.shi@mediatek.com, mac.shen@mediatek.com, 
 peng.liu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
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

Liankun Yang <liankun.yang@mediatek.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=88=
18=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:35=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Returns the number of bytes transferred (1) on success.
> Check the return value to confirm that AUX communication is successful.
>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
> Changes in V3:
> - Using drm_dp_read_sink_count() to improve patch.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20241128030940.=
25657-1-liankun.yang@mediatek.com/
>
> Changes in V2:
> - Modify Fixes in Commit Message.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.=
5385-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 36713c176cfc..b26dad8783be 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2100,7 +2100,6 @@ static enum drm_connector_status mtk_dp_bdg_detect(=
struct drm_bridge *bridge)
>         struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
>         enum drm_connector_status ret =3D connector_status_disconnected;
>         bool enabled =3D mtk_dp->enabled;
> -       u8 sink_count =3D 0;
>
>         if (!mtk_dp->train_info.cable_plugged_in)
>                 return ret;
> @@ -2115,8 +2114,8 @@ static enum drm_connector_status mtk_dp_bdg_detect(=
struct drm_bridge *bridge)
>          * function, we just need to check the HPD connection to check
>          * whether we connect to a sink device.
>          */
> -       drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
> -       if (DP_GET_SINK_COUNT(sink_count))
> +
> +       if (drm_dp_read_sink_count(&mtk_dp->aux))

if (drm_dp_read_sink_count(&mtk_dp->aux) > 0)

With this fix-up, applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>                 ret =3D connector_status_connected;
>
>         if (!enabled)
> --
> 2.45.2
>
