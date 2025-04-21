Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BCA95284
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 16:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9D410E39C;
	Mon, 21 Apr 2025 14:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tKOto67R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D7510E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 14:09:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 640344A6DD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 14:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D59DC4CEF4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745244568;
 bh=WYXRdWWnpgKTBUjE3p3Mz4j6ZPQ5w+kSpIXksD6tN68=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tKOto67RaYFfUzDqmXLJK8aJvIy6sKsvTmLnTsCMOs1O56tH9Vo7gIqyO4PVryOVx
 CEyJ+toAkHjPasJBv0Z3DXpxfFqHrbFljL43OR4d6crPNgIMej7BUXfdTN9WGaeZAN
 66LtIk5lebiXDOASN6aXc6yVX9HCcieeI/c0+urJtsyFl8MW75Tmkb344gDvsq2onb
 /RlUMqZTyMiy5nWzFScGFVrrB65pBBJdefuMoEtDx/XAQB3Fqo5GhQmRH7/v0K+XE5
 eU5M9RUToJ66L5zJz9u6nQkG+dTwd4P13vVRfpXEDEnDOMXDOYozSV6SYRg221jsi1
 KBRyzu4ByURVg==
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so5167003b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 07:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUUm7yLJvfRIxUhXgAj2PnysGLRn0bowLrG6VrKGlS3IPV0ECK6+ZYmXGTzprqwZQ4vTJA1/K6+hNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfRmYdAk2Cl+BprRI5SN0uBlqAALERHDB0gZCahDy4Ce2r1qVc
 Xk+AlwN+JOuyNoaLCOSqzTMmfhF80bUZ1QqbcImKZUSkMq0rrhQAuZlNIA/mCw43nSyXyLqIRkE
 +waA5fD/UlSXwiWxKc0kKKRunuA==
X-Google-Smtp-Source: AGHT+IGS9uz21hRPGhlJ4UMeP7sf9taxpboldIRO54ve55gM+l4Zm966plB6VQpw/Y3RbDZK4VoWG7AVra1mhRruBl4=
X-Received: by 2002:a17:90b:248e:b0:309:cf0b:cb37 with SMTP id
 98e67ed59e1d1-309cf0bcb7amr532295a91.7.1745244568069; Mon, 21 Apr 2025
 07:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
 <20250415104321.51149-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250415104321.51149-16-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Apr 2025 22:10:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Tvrx2vfss16jecTQsQU2oSjEmTGoFZZq5ZJZmgyypqg@mail.gmail.com>
X-Gm-Features: ATxdqUGktFaFTj-3L_NPDr-W-E9d8SqAjhcUgYMe9iV6oOSARNcqSrzlMtbkNXg
Message-ID: <CAAOTY__Tvrx2vfss16jecTQsQU2oSjEmTGoFZZq5ZJZmgyypqg@mail.gmail.com>
Subject: Re: [PATCH v9 15/23] drm/mediatek: mtk_hdmi: Improve
 mtk_hdmi_get_all_clk() flexibility
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
 jason-jh.lin@mediatek.com
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
2025=E5=B9=B44=E6=9C=8815=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:4=
4=E5=AF=AB=E9=81=93=EF=BC=9A
>
> In preparation for splitting common bits of this driver and for
> introducing a new version of the MediaTek HDMI Encoder IP, improve
> the flexibility of function mtk_hdmi_get_all_clk() by adding a
> pointer to the clock names array and size of it to its parameters.
>
> Also change the array of struct clock pointers in the mtk_hdmi
> structure to be dynamically allocated, and allocate it in probe.

Build error happen,

../drivers/gpu/drm/mediatek/mtk_hdmi.c: In function
\u2018mtk_hdmi_get_cec_dev\u2019:
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1353:15: error: too few
arguments to function \u2018mtk_hdmi_get_all_clk\u2019
 1353 |         ret =3D mtk_hdmi_get_all_clk(hdmi, np);
      |               ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/mediatek/mtk_hdmi.c:1075:12: note: declared here
 1075 | static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct
device_node *np,
      |            ^~~~~~~~~~~~~~~~~~~~

I've apply some patches of this series to mediatek-drm-next [1], and
I've already fixed some build error.
I wonder how many error would happen in rest patches,
so please fix the build error in rest patches and resend patches.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index b4fbd2e60089..b17f8df145eb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -159,7 +159,7 @@ struct mtk_hdmi {
>         struct phy *phy;
>         struct device *cec_dev;
>         struct i2c_adapter *ddc_adpt;
> -       struct clk *clk[MTK_HDMI_CLK_COUNT];
> +       struct clk **clk;
>         struct drm_display_mode mode;
>         bool dvi_mode;
>         struct regmap *sys_regmap;
> @@ -1072,17 +1072,18 @@ static const char * const mtk_hdmi_clk_names[MTK_=
HDMI_CLK_COUNT] =3D {
>         [MTK_HDMI_CLK_AUD_SPDIF] =3D "spdif",
>  };
>
> -static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi,
> -                               struct device_node *np)
> +static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_nod=
e *np,
> +                               const char * const *clock_names, size_t n=
um_clocks)
>  {
>         int i;
>
> -       for (i =3D 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
> -               hdmi->clk[i] =3D of_clk_get_by_name(np,
> -                                                 mtk_hdmi_clk_names[i]);
> +       for (i =3D 0; i < num_clocks; i++) {
> +               hdmi->clk[i] =3D of_clk_get_by_name(np, clock_names[i]);
> +
>                 if (IS_ERR(hdmi->clk[i]))
>                         return PTR_ERR(hdmi->clk[i]);
>         }
> +
>         return 0;
>  }
>
> @@ -1377,15 +1378,15 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *=
hdmi, struct device *dev, struc
>         return 0;
>  }
>
> -static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
> -                                  struct platform_device *pdev)
> +static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platfor=
m_device *pdev,
> +                                  const char * const *clk_names, size_t =
num_clocks)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct device_node *np =3D dev->of_node;
>         struct device_node *remote, *i2c_np;
>         int ret;
>
> -       ret =3D mtk_hdmi_get_all_clk(hdmi, np);
> +       ret =3D mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to get clocks\n");
>
> @@ -1634,6 +1635,7 @@ static int mtk_hdmi_probe(struct platform_device *p=
dev)
>  {
>         struct mtk_hdmi *hdmi;
>         struct device *dev =3D &pdev->dev;
> +       const int num_clocks =3D MTK_HDMI_CLK_COUNT;
>         int ret;
>
>         hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> @@ -1643,7 +1645,11 @@ static int mtk_hdmi_probe(struct platform_device *=
pdev)
>         hdmi->dev =3D dev;
>         hdmi->conf =3D of_device_get_match_data(dev);
>
> -       ret =3D mtk_hdmi_dt_parse_pdata(hdmi, pdev);
> +       hdmi->clk =3D devm_kcalloc(dev, num_clocks, sizeof(*hdmi->clk), G=
FP_KERNEL);
> +       if (!hdmi->clk)
> +               return -ENOMEM;
> +
> +       ret =3D mtk_hdmi_dt_parse_pdata(hdmi, pdev, mtk_hdmi_clk_names, n=
um_clocks);
>         if (ret)
>                 return ret;
>
> --
> 2.49.0
>
