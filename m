Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AC27516CB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 05:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE4E10E053;
	Thu, 13 Jul 2023 03:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3949010E053
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 03:35:23 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-78360b822abso6357739f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 20:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689219322; x=1691811322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2QV7vh1ogKfJf1Qa4ERBfjeAWDEN5HhFP3tvUsoJaZI=;
 b=YXOvx/QCIwWe/mnLJSqx4+w5eNIQZp13Z42w1IjSiMAnUZ60UNsNEegI7Ntzf/7LHu
 AWgiBL447GRQUwI/ofnzRDDkSG089pghzB44RTgWz07FnbqRoE7w19nIwW1KZIk9eI8A
 E91XIUbh/iZH8iS7CppKKWWvZAmeTKWc7UY50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689219322; x=1691811322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2QV7vh1ogKfJf1Qa4ERBfjeAWDEN5HhFP3tvUsoJaZI=;
 b=Z1YGgYqrw9ovuYN+k5Ov+DbWXvuerh3+A+4asGn51y2c3x7YgyUPi1SoHpJcQ0AQCh
 Up0ZKeeVa/OrSQMjoBdOqLjO+l0VsSxX4K5xaNU1rJQsB5dDW6HAowHvK/tqqZYTueGl
 T4Q+qE9PwLeyG812If3/9+MIa4/KwT/KIRlbep9Wd3sbfGHH1p0Mf2V3PeIB4gjmJNLg
 M0lxl+isZWNgDhuzf5cK4iKLM2P/JMFp0+JDzTTYa+w2SRv4cBywcm8LbumCrMo5kHQj
 sUPsPkUlz1XrUp5gH4RGngRAr5EOBibfsAcbBMK8mulW6dWQgJsh8rEGTsAJ59FnD7lF
 dbEg==
X-Gm-Message-State: ABy/qLZDPhuvq2F+t/y6OgdmjPbYyb322meoe3a36Fl2MI6Xr/poLBr5
 ZTrjIqDQ89aU++DqR25LW1Sl1epdX3uwvMm3e20=
X-Google-Smtp-Source: APBJJlG3OZjN/NL9oew0+0aK0MnD2rLaIy/DOgUJi4c3hlIXGcymeDXjMqciZ+t85xDfPA9Ya7gUVw==
X-Received: by 2002:a6b:e918:0:b0:783:40ef:c9f6 with SMTP id
 u24-20020a6be918000000b0078340efc9f6mr658852iof.19.1689219321889; 
 Wed, 12 Jul 2023 20:35:21 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 h12-20020a056638062c00b0042bbfe3dc42sm1585227jar.173.2023.07.12.20.35.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 20:35:21 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-78666f06691so6805339f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 20:35:21 -0700 (PDT)
X-Received: by 2002:a05:6602:18c:b0:786:2125:a034 with SMTP id
 m12-20020a056602018c00b007862125a034mr572395ioo.18.1689219320748; Wed, 12 Jul
 2023 20:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230421021609.7730-1-nancy.lin@mediatek.com>
In-Reply-To: <20230421021609.7730-1-nancy.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 11:34:44 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj2Mwfbs_fgzcMsauhjaWdj0_0=t2F708i4F=u0oGgo-w@mail.gmail.com>
Message-ID: <CAC=S1nj2Mwfbs_fgzcMsauhjaWdj0_0=t2F708i4F=u0oGgo-w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: fix uninitialized symbol
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 10:16=E2=80=AFAM Nancy.Lin <nancy.lin@mediatek.com>=
 wrote:
>
> fix Smatch static checker warning
>   - uninitialized symbol comp_pdev in mtk_ddp_comp_init.
>
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT=
8195")
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

This seems to be unnoticed and I just want to get some attention for
it. Any action items here?

Regards,
Fei

> ---
> v2: add Fixes tag
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index f114da4d36a9..e987ac4481bc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -546,7 +546,7 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struc=
t drm_device *drm,
>  int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *com=
p,
>                       unsigned int comp_id)
>  {
> -       struct platform_device *comp_pdev;
> +       struct platform_device *comp_pdev =3D NULL;
>         enum mtk_ddp_comp_type type;
>         struct mtk_ddp_comp_dev *priv;
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> @@ -588,6 +588,9 @@ int mtk_ddp_comp_init(struct device_node *node, struc=
t mtk_ddp_comp *comp,
>             type =3D=3D MTK_DSI)
>                 return 0;
>
> +       if (!comp_pdev)
> +               return -EPROBE_DEFER;
> +
>         priv =3D devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
> --
> 2.18.0
>
>
