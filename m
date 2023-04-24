Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE336ED63D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 22:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D3A10E449;
	Mon, 24 Apr 2023 20:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D04D10E449
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 20:42:20 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso30968467b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 13:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682368939; x=1684960939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5ZMC5VZS+YuBCnDNL+LpSQZtLatJs+u2JnjBvK8Odc=;
 b=DGbRYrvKbvAoKpxgR0HQbFQbYXIsz+xp2DGSkA2iOQ8mk1waOeWr+SQSqHjNuasxPf
 8n+vMTsSnPigKcKIoYZz5PxLBhE5efTfaOCZ8JQV/rP6KgWH3nnIBQVYIr26Po+rSVfL
 XKUeFmdh9NNpkHFwRbRXZrVl72cOFnBWI8Dgk+co7z1DsCZf3I+iGPR2qA6JciXH6DEX
 Qh0waztvz2vfOG82eC66kLBXYiKWml2zHWu/0w++9GWg6HxYxWvVKbS71C6Drwt+GaGj
 UnoKPfxkLl/YsG6phBs1KAw1BycVRWcxeqF4Q9S3pHsn0wCjS3bASvhbon6oYA/iVdX2
 4r2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682368939; x=1684960939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5ZMC5VZS+YuBCnDNL+LpSQZtLatJs+u2JnjBvK8Odc=;
 b=hy05Tx+Ft7TPb+vNzJvA3Nod34FumF4erIyfaP0NQvSvUQiqtEfBKxxIifUdwgFVCg
 c8yQ7S8FdPxeaWFqDjmGuOicFNw3jKaoJfEh/YUK85U84Zvs8jGXzc2TsYHi3i1+Ewtu
 Sh+0X1jn6e5UVUJ6P8Ds6+VKcH5Pr+BRte/WPqk263+Ceg3XwJ4LsM0w6+4NYjlnoG3p
 qDwSKe52zjnQbvtk7XT34lyCaf2D9wlIBwxQg8JFvWHBd2MbqpCuSfYJyEXE/AOguhvx
 U/y9hXxz53lUEs/nJiXpjlLAOWpIfGBoahXy9PULikCkwqVH++LWEVmrN/U83keIvKVQ
 jZ3g==
X-Gm-Message-State: AAQBX9flssokZ4PK+26VfxsZcCZXAHc77+nc3oM5hu6Uf3wRtJ2MBoSr
 VK0V6kWtmsgeY6D2donwq959ByZRgvzBuWyN/wm5ag==
X-Google-Smtp-Source: AKy350bsHQq1EzNGt73/j+nTzeIplaa5l3Hebw0touKLhbf8se1E6Dle8Z8ftc4k7i07Zf4ORu/GiUefhBFP9DGqO5w=
X-Received: by 2002:a17:90a:6b43:b0:246:9517:30b6 with SMTP id
 x3-20020a17090a6b4300b00246951730b6mr22012160pjl.4.1682368939446; Mon, 24 Apr
 2023 13:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>
 <20230421221330.GA3657732@dev-arch.thelio-3990X>
In-Reply-To: <20230421221330.GA3657732@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Apr 2023 13:42:08 -0700
Message-ID: <CAKwvOd=5szkx5yA0bxcyktx85opAwLrB3_4n13SMV7p3m9x7LQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 3:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Fri, Apr 14, 2023 at 06:07:46PM +0200, Guillaume Ranquet wrote:
> > The ret variable in mtk_hdmi_pll_calc() was used unitialized as reporte=
d
> > by the kernel test robot.
> >
> > Fix the issue by removing the variable altogether and testing out the
> > return value of mtk_hdmi_pll_set_hw()
> >
> > Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt81=
95")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Can somebody pick this up? It fixes a rather obvious warning, which is
> breaking clang builds (as evidenced by three versions of the same fix).

$ ./scripts/get_maintainer.pl -f
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | grep maintainer
Chunfeng Yun <chunfeng.yun@mediatek.com> (maintainer:ARM/Mediatek USB3
PHY DRIVER)
Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC supp=
ort)

Chunfeng, Matthias, can one of you pick this up, please?

Or Vinod who merged 45810d486bb44 FWICT?

>
> > ---
> >  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/m=
ediatek/phy-mtk-hdmi-mt8195.c
> > index abfc077fb0a8..054b73cb31ee 100644
> > --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > @@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *h=
dmi_phy, struct clk_hw *hw,
> >       u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
> >       u8 txpredivs[4] =3D { 2, 4, 6, 12 };
> >       u32 fbkdiv_low;
> > -     int i, ret;
> > +     int i;
> >
> >       pixel_clk =3D rate;
> >       tmds_clk =3D pixel_clk;
> > @@ -292,13 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *=
hdmi_phy, struct clk_hw *hw,
> >       if (!(digital_div <=3D 32 && digital_div >=3D 1))
> >               return -EINVAL;
> >
> > -     mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> > +     return mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_lo=
w,
> >                           PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> >                           txposdiv, digital_div);
> > -     if (ret)
> > -             return -EINVAL;
> > -
> > -     return 0;
> >  }
> >
> >  static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> >
> > --
> > 2.40.0
> >
>


--=20
Thanks,
~Nick Desaulniers
