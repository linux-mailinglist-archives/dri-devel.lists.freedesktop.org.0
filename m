Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40D34C4316
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 12:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975F010E31A;
	Fri, 25 Feb 2022 11:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5679210E31A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 11:10:05 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so5782261ooi.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 03:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=uCe/+8iKUxzMUiuInd3yAhEeQs4vdxnzQkm5bIEbNEw=;
 b=3quStgJE4CNplUYYKndunJnY4NULD271ISTymr6In2H9wvWQ46ynTFUwPSh3NKVoKO
 XO4uix0XDRtyEYj7qkgyNbao0VNsn/v9DyTp5E6MeOCrYZ7UHnrZSG25ljWcwzNZXWtM
 CK25RXGKu7gtNKH69yAXi2/cmw/9laIfo+AIvEyQXQO0M+yNR7o7LR3kCYQ0GhecodX3
 0Yf39evCS/HIrNRyUizqYBNSZK0dgtE8NmgJi1WqVMQsdFuWPWRcekxxZDZoDZzegsrZ
 eGdZk0yx/7/PS7SJ3+IWqErs4rB+57192rbUR/75nCEiwVLsRQAgfLPhmb5NU7fcOvcj
 rAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=uCe/+8iKUxzMUiuInd3yAhEeQs4vdxnzQkm5bIEbNEw=;
 b=mN+rAA0uXUhRi0+nJ7GLAGNHazLjH0JUO85lqs8wFoGZVJHKTmL4nuTUBG/Bp2Yogu
 8LhVZfs0Eo4V+YkUL+wJU69m03ksYdJ48t4ijMyk/M3g1h37V5qyn+OP1Ud/A6yXQXaI
 axK8Huwp5v4QA+2A1n3FpbNfxuGVCrtLxRQV9X68Eatyp2oEdHiSV+h8H53R2bazNuHq
 WEUKpoPSwG4c+2pude9mNxTaGOofydbIeVjpwNyTW4iSrlTsGPbd92Dmue+qqUPpOfrk
 Ib2kCqf2V5J9v8Pj/jF5z9+PC1xP3x5AbpXPSVaYqOF2BUtdsMXAe9WXjuvb+g2M3qXS
 r5Yg==
X-Gm-Message-State: AOAM531YB4Qk2LwQSb4aYxm7JkrKS96GIG8FOu/LciJXofEwbDjoYuR5
 /hCSFwo489c31cDoCHdz9f8XOIqc/qUYpdDxM2UM1Q==
X-Google-Smtp-Source: ABdhPJxQVXm0aOfETMn/jYI9liemPaFUC9qpKMV22X3YKscJ2KB1O1xhKAWhMyhOXCXayIJus//3i7D2cxvCV3+EqA4=
X-Received: by 2002:a05:6870:3112:b0:ce:c0c9:62b with SMTP id
 v18-20020a056870311200b000cec0c9062bmr1047419oaa.125.1645787404480; Fri, 25
 Feb 2022 03:10:04 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 03:10:03 -0800
MIME-Version: 1.0
In-Reply-To: <CAAOTY_9cOLJnTK0tSqfzyK4tUn_LUAywRPa+z7tTCOSien2j1Q@mail.gmail.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-11-granquet@baylibre.com>
 <CAAOTY_9cOLJnTK0tSqfzyK4tUn_LUAywRPa+z7tTCOSien2j1Q@mail.gmail.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 03:10:03 -0800
Message-ID: <CABnWg9secW5CO=wfo68mA9Z+v=iB50uZRUQGjm=jrGiS379nJA@mail.gmail.com>
Subject: Re: [PATCH v8 10/19] drm/mediatek: dpi: move swap_shift to board
 config
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-phy@lists.infradead.org, deller@gmx.de,
 Kishon Vijay Abraham I <kishon@ti.com>, DTML <devicetree@vger.kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Chun-Kuang Hu (2022-02-21 04:24:32)
> Hi, Guillaume:
>
> Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=
=8818=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:56=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > Add flexibility by moving the swap shift value to board config
> >
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/media=
tek/mtk_dpi.c
> > index 0d3acd08ea358..ec221e24e0fee 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -131,6 +131,7 @@ struct mtk_dpi_conf {
> >         u32 dimension_mask;
> >         // Mask used for HSIZE and VSIZE (no shift)
> >         u32 hvsize_mask;
> > +       u32 channel_swap_shift;
> >         const struct mtk_dpi_yc_limit *limit;
> >  };
> >
> > @@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_=
dpi *dpi,
> >                 break;
> >         }
> >
> > -       mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_M=
ASK);
> > +       mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> > +                    CH_SWAP_MASK << dpi->conf->channel_swap_shift);
>
> This may be wrong because of these definition:
>
> #define DPINTF_CH_SWAP BIT(1)
> #define DPINTF_CH_SWAP_MASK (0x7 << 1)
>
> Regards,
> Chun-Kuang.
>

You are right, DPINTF_CH_SWAP_MASK is unused, which is wrong on multiple le=
vels.

> >  }
> >
> >  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool ena=
ble)
> > @@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
> >         .swap_input_support =3D true,
> >         .dimension_mask =3D HPW_MASK,
> >         .hvsize_mask =3D HSIZE_MASK,
> > +       .channel_swap_shift =3D CH_SWAP,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > @@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
> >         .swap_input_support =3D true,
> >         .dimension_mask =3D HPW_MASK,
> >         .hvsize_mask =3D HSIZE_MASK,
> > +       .channel_swap_shift =3D CH_SWAP,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > @@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
> >         .swap_input_support =3D true,
> >         .dimension_mask =3D HPW_MASK,
> >         .hvsize_mask =3D HSIZE_MASK,
> > +       .channel_swap_shift =3D CH_SWAP,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > @@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
> >         .swap_input_support =3D true,
> >         .dimension_mask =3D HPW_MASK,
> >         .hvsize_mask =3D HSIZE_MASK,
> > +       .channel_swap_shift =3D CH_SWAP,
> >         .limit =3D &mtk_dpi_limit,
> >  };
> >
> > --
> > 2.34.1
> >
