Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F3F3F3CEF
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 03:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B36D6E047;
	Sun, 22 Aug 2021 01:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC996E047
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 01:14:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F287861266
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 01:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629594877;
 bh=zCzuD/gSEAZz6whQU8OxleDxwzLhRBG1uIqnRGpvqP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=o7jAL41cV1Q05ea7fZSRvzv0vZ5APxyLyXwqZQX5/Qab2O1tdaSDk66vm/LNZy8fo
 U0wrcOc69+Sfa1T/XIcGMMf8oR5/fPHm+Vk+TDsqcrYosh8V+5qdko8InUVg+19TwD
 zWTmsHpkn+PPv4mbUgW6RZ5P7yUSNikeFdOcZ6DKmhm3k0+s6Janm0YtbJ6PlFG3uR
 UQM+8zDahpFfnfm0AljOy2ZR4ana+oP+ZWw8HPdRCjHNHZQqFGLXKZfnSYqjRE7osf
 tzfLxf/C2/NFw/n/U1dSm6059t7bAu6T1APRfPPyg/S4WI0C35xLNLuyxptlp34MHe
 lbQJxoXBsePkQ==
Received: by mail-ej1-f43.google.com with SMTP id e21so12549213ejz.12
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 18:14:36 -0700 (PDT)
X-Gm-Message-State: AOAM532dE7cvAyyGe+mtt4fIl+PnUPrm3m6xYDsB3KMjAkYNsdcPpZ0i
 QhOqxJZ99KxTxaTD0Q42d1Xorh7jX+smUpYg5g==
X-Google-Smtp-Source: ABdhPJwurie+/j4gMgYRtvN6TgPa5fnIdmGdu2j/ak4r2YT1v1vuwSfGu0NBvpD/c6uzXnaqD7U33HlKS+77I74lBsU=
X-Received: by 2002:a17:906:b18e:: with SMTP id
 w14mr28931433ejy.63.1629594875631; 
 Sat, 21 Aug 2021 18:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-16-nancy.lin@mediatek.com>
In-Reply-To: <20210818091847.8060-16-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Aug 2021 09:14:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY_99QLpRHLei2PzD8vsuoOaZae++NqczPCM+r9YMZ01btw@mail.gmail.com>
Message-ID: <CAAOTY_99QLpRHLei2PzD8vsuoOaZae++NqczPCM+r9YMZ01btw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
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

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add driver data of mt8195 vdosys1 to mediatek-drm and modify drm for
> multi-mmsys support. The two mmsys (vdosys0 and vdosys1) will bring
> up two drm drivers, only one drm driver register as the drm device.
> Each drm driver binds its own component. The first bind drm driver
> will allocate the drm device, and the last bind drm driver registers
> the drm device to drm core. Each crtc path is created with the
> corresponding drm driver data.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>
>
> +static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor =3D {
> +       .clk_enable =3D mtk_ethdr_clk_enable,
> +       .clk_disable =3D mtk_ethdr_clk_disable,
> +       .config =3D mtk_ethdr_config,
> +       .start =3D mtk_ethdr_start,
> +       .stop =3D mtk_ethdr_stop,
> +       .layer_nr =3D mtk_ethdr_layer_nr,
> +       .layer_config =3D mtk_ethdr_layer_config,
> +       .enable_vblank =3D mtk_ethdr_enable_vblank,
> +       .disable_vblank =3D mtk_ethdr_disable_vblank,
> +};

I think ethdr is inside the group of ovl_adpator. I preter this
function is implemented by ovl_adaptor, and ovl_adaptor control rdma,
merge, ethdr.

Regards,
Chun-Kuang.

> +
>
