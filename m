Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED46695B864
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9045810EAE5;
	Thu, 22 Aug 2024 14:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TPnrX6dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE03510EAE5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:30:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8EDDACE0FF7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5250CC4AF16
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724337000;
 bh=EIbyKKjLdJJZGFxhalx33/RF7GG9+9/lkUn6G18mVOg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TPnrX6dw3L+LDovQuv/hS4rw5M/MIjwr32NwoybJluXqQXmtVLUYk9f0nBMvk9zyE
 rbw2c5+E1noh9ol3NxemjLQ8TZxVkF+TUat5RZJJ6ui3WNh8eMmX4lCkpAW2yx51Xw
 gCtgsIuxHHVj+BpuhM1YUetZAvtz/M5Aw4cXXByE/1yKkIo1CuzxZXL0vcf0TZ7/+I
 cLbdNlU2xRvZtv2s4vTv8LyzVB5Y5fdDRTv6QJ6BmuBjNh1vF4zn4YaA+rzjqrTBHW
 kXCuhNo9D6wcPd3A4WNJiS7njYd74qHBWQZU9wfKeTI4/Dc5XbzexarjD3sp3obdce
 fzOhLoi8l9YBw==
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7cd9e634ea9so392693a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:30:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXmbhUaotleYnsa28curohdVY84hVRHAqPgvew4bfUzT/H71SgX+7FUEJP9VFYQKvFEaZSjU2TjuU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg7f8I5D8YArtHRVCweMIrNtZ7lKgMLqwG/DFMEOS9AxNWnVOl
 hGIUC2l6ElYleIVq/gUkYzEw0ZEhdjOOHJusm3+cv8Zj5hXB6P25hA82sAmd7HpttbT+Pvb5lCN
 OGuTSslr3QpqqJoc50xuF2zZW7A==
X-Google-Smtp-Source: AGHT+IFNd1a5Jn4I/J6gdxNiBFWoik4UOxFcPN5z5dO1KYVQfJeBHZU2AH9pzjwMOeJbBICz51dLQG3eoiE91A8UOhs=
X-Received: by 2002:a17:90b:104b:b0:2d3:c976:dd80 with SMTP id
 98e67ed59e1d1-2d5ea2ca713mr6422970a91.39.1724336999689; Thu, 22 Aug 2024
 07:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240731201407.1838385-1-robh@kernel.org>
In-Reply-To: <20240731201407.1838385-1-robh@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Aug 2024 22:30:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-DT--eLNMzLd0ftoo6e74yV-cfta0C8nB+5k2hifd3dg@mail.gmail.com>
Message-ID: <CAAOTY_-DT--eLNMzLd0ftoo6e74yV-cfta0C8nB+5k2hifd3dg@mail.gmail.com>
Subject: Re: [PATCH] drm: mediatek: Drop unnecessary check for property
 presence
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

Hi, Rob:

Rob Herring (Arm) <robh@kernel.org> =E6=96=BC 2024=E5=B9=B48=E6=9C=881=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> of_property_read_u32() returns -EINVAL if a property is not present, so
> the preceeding check for presence with of_find_property() can be
> dropped. Really, what the errno is shouldn't matter. Either the property
> can be read and used or it can't and is ignored.
>
> This is part of a larger effort to remove callers of of_find_property()
> and similar functions. of_find_property() leaks the DT struct property
> and data pointers which is a problem for dynamically allocated nodes
> which may be freed.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index 634bbba5d43f..07243f372260 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -341,14 +341,11 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>                 dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
>  #endif
>
> -       if (of_find_property(dev->of_node, "mediatek,rdma-fifo-size", &re=
t)) {
> -               ret =3D of_property_read_u32(dev->of_node,
> -                                          "mediatek,rdma-fifo-size",
> -                                          &priv->fifo_size);
> -               if (ret)
> -                       return dev_err_probe(dev, ret,
> -                                            "Failed to get rdma fifo siz=
e\n");
> -       }
> +       ret =3D of_property_read_u32(dev->of_node,
> +                                  "mediatek,rdma-fifo-size",
> +                                  &priv->fifo_size);
> +       if (ret && (ret !=3D -EINVAL))
> +               return dev_err_probe(dev, ret, "Failed to get rdma fifo s=
ize\n");
>
>         /* Disable and clear pending interrupts */
>         writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> --
> 2.43.0
>
