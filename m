Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EE171787B
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 09:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777F610E498;
	Wed, 31 May 2023 07:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3618D89233
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 07:43:26 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-625a9e2bf6bso28830736d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 00:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685519003; x=1688111003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hCCJrsaz/NjGrHJ94qpM3huv+xsF2o6fZiZu7/z8AY=;
 b=VgW5pvZ3wqpWZIFiq2dd7Bfobqfflrkuq1mJb47cnl5/aQQxXhGgkRBV+EjtQexHxd
 lJZWjBXAxCLvKTbwl27X2FfjdySA+Jwm64MC+9lvyp1mBq4kYsmUet2vBoCNCscQBHV0
 XZoYE0Gq4tiQumSoLTu79fhV4aTBeW4GO+O1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685519003; x=1688111003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hCCJrsaz/NjGrHJ94qpM3huv+xsF2o6fZiZu7/z8AY=;
 b=dCPnYZOcB2BYNuD2yKfWTrY9Xe/TiIlgVjl5iswGno4EjRj16XiJgJa/p4nHo04dHt
 w8Ia1qPYdXDzMnVNNAZxGMTjBqn5NW9Y99BYL/NP370WTRabMTWeGl9ClUiq3fZS02dL
 z6e1sfBST3jKG3iLyBUpow/Xq01fR7q9O1hlU6Fo+JUUWi2e6p6WPr5mw3/4DX87afTW
 HleqcB2fjN7MYVSWgEDUPOJ+tJ9mfyWnpGkPo765K4TSTveliRfygDyukuopeZW8dX20
 x2kDVovbWtC7q4kNf2Zz1j0sWccCmCDd7AvGKrmBuYKek3NkZ4uTDhRaDECZfAfokuFQ
 OJvQ==
X-Gm-Message-State: AC+VfDylcD+sa6Q3KSrWhVF09qNI6VseKah3XDneGwbmqn0STn93hnGW
 vP3T3NAHSmH0akgFit7mB7lC+P60S+60D7N1SF3urA==
X-Google-Smtp-Source: ACHHUZ55CaO/7pKYADZLoW2cfgMbio+kJB5f8rUaty9cLHbxEhYWcWalPWE0GNlEOIgz74JZcSTB8c25FAlzJvkwUKw=
X-Received: by 2002:a05:6214:528d:b0:625:7802:f36d with SMTP id
 kj13-20020a056214528d00b006257802f36dmr4655699qvb.24.1685519003409; Wed, 31
 May 2023 00:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230306080659.15261-1-jason-jh.lin@mediatek.com>
 <20230306080659.15261-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230306080659.15261-3-jason-jh.lin@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 31 May 2023 15:43:12 +0800
Message-ID: <CAGXv+5EPktjMABhtWf9dL-25dAe=Mf4=BSMmE+=4m2WisDXXFQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

On Mon, Mar 6, 2023 at 4:07=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek.=
com> wrote:
>
> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

CK didn't pick up this patch. Since the other patch already got picked up
in v6.4-rc1, could you merge this for v6.5?


Thanks
ChenYu


> ---
>  include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/m=
ediatek/mtk-mmsys.h
> index dc2963a0a0f7..8eb5846985b4 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -27,8 +27,7 @@ enum mtk_ddp_comp_id {
>         DDP_COMPONENT_CCORR,
>         DDP_COMPONENT_COLOR0,
>         DDP_COMPONENT_COLOR1,
> -       DDP_COMPONENT_DITHER,
> -       DDP_COMPONENT_DITHER0 =3D DDP_COMPONENT_DITHER,
> +       DDP_COMPONENT_DITHER0,
>         DDP_COMPONENT_DITHER1,
>         DDP_COMPONENT_DP_INTF0,
>         DDP_COMPONENT_DP_INTF1,
> --
> 2.18.0
>
