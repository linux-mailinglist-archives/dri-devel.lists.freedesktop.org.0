Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFCE37ABC2
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 18:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91586E0AB;
	Tue, 11 May 2021 16:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237176EA91
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 16:21:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F5986191E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620750076;
 bh=Cn3ACvm/0DEZQWq3vsRFDc7XaLRknxn7nJqnZw2JE8Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Hpat+hR/a0DpakGNA4KJY/x15t4/P5bUzqXxo3ukJHN7NBk+grTUAV3zpxaBdp5MF
 3ugmQ/jSD0dnJV31fsPpC3GsicpCM8K7mba88i3iR/8GG+sdk4+KVng97Iab4gkwtu
 MFidujA+Tg7w77xQ/9k4Urt6DNsFGUYnCqXhgXkxkW/wmWajOqcgGGU8sMGm5ASJvm
 4Dw22nueg/NRmgCKnDsAoi4C+eyFGL1pPnpOdSY9lX2EuElg5M8NvwLz36ozFJL5en
 v/u6rzmqRIzxhKf06PGwKDYukjxHEdFHppYwQ4Xsqm14Q/+nj78ccq//8qtbnPLPH9
 iqy5I1bjIe/0Q==
Received: by mail-ej1-f49.google.com with SMTP id zg3so30663414ejb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 09:21:16 -0700 (PDT)
X-Gm-Message-State: AOAM533gXS9V4HJFCTWeLdYF75XkHS12s2IcSRN1n/Gy3Ym27siVov0w
 /fKK5b+dSVisK1gGoCLSeztu9e/8u5uqYN/ibw==
X-Google-Smtp-Source: ABdhPJxnKH+9sRFG4bOGXa5OAw5Qi4cQmVDFCJeva0RME9sa0QQOwDhf1+v79OaUZ7s+OQyBtYYcJy4eSNT2dOS+TdY=
X-Received: by 2002:a17:906:a48:: with SMTP id
 x8mr32395056ejf.127.1620750074915; 
 Tue, 11 May 2021 09:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210429042834.1127456-1-hsinyi@chromium.org>
 <20210429042834.1127456-2-hsinyi@chromium.org>
In-Reply-To: <20210429042834.1127456-2-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 12 May 2021 00:21:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qM6e_yuokOxgct_sUs_e=jknX3k+WpGQfs0RjnOPi1A@mail.gmail.com>
Message-ID: <CAAOTY_-qM6e_yuokOxgct_sUs_e=jknX3k+WpGQfs0RjnOPi1A@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/mediatek: init panel orientation property
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-Yi:

Hsin-Yi Wang <hsinyi@chromium.org> =E6=96=BC 2021=E5=B9=B44=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8812:28=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Init panel orientation property after connector is initialized. Let the
> panel driver decides the orientation value later.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index ae403c67cbd9..9da1fd649131 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *d=
rm, struct mtk_dsi *dsi)
>                 ret =3D PTR_ERR(dsi->connector);
>                 goto err_cleanup_encoder;
>         }
> +
> +       ret =3D drm_connector_init_panel_orientation_property(dsi->connec=
tor);
> +       if (ret) {
> +               DRM_ERROR("Unable to init panel orientation\n");
> +               goto err_cleanup_encoder;
> +       }
> +
>         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>
>         return 0;
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
