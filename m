Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28699DE88C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 15:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA03110E2AD;
	Fri, 29 Nov 2024 14:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CGT1nKsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1302810E4C2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 14:33:30 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso20675361fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 06:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732890808; x=1733495608; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ydMrix3fvvhOMzrQqRzYYaEoA9e+CKDYBl8pONEsRTk=;
 b=CGT1nKsb831tyRUaz9J/vJOAqHfkO8fgtFR3ddFGcPQx0L77CuxZLD3oAmZBnSNoVh
 p5loxE6mpVw+ng7lvIOvCC9iTnAnp4OD1eZpoC0hPnjiOubrp71brRhAyUjJqnSKxnzt
 yiY3+NZVKpWvmUxnqztxbZzSo1bAmHxpScoaPG1H3fk4OMwgZ/QfiVtkLTXxowqaWd/0
 vekWMY/22sLVb9h6iugWLoKi3hpmDlhgAY13I06yZn6AM4lGBrsWiCLK0eFyepFjuESa
 5mc2EYdUSlUxX/H6j5rcdL5/F0qXW2mo6qcxjftmRooyXbyMEQ+lWTzruTnxv6U3fNns
 Wz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732890808; x=1733495608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ydMrix3fvvhOMzrQqRzYYaEoA9e+CKDYBl8pONEsRTk=;
 b=LcaaVDAx0sT2jAjahKec7sXUTB3FY3F+YGxH6Hdl4R7ShMxFMrgrTktEPzrXNu9N9g
 AsLGcF0G7/8miWanWlDTRkVZ03E8sxYkZHafd51McgR2+W21I+uFh6JXfBtKXBSYCPxL
 nRbu7/DvUVLf0VE3dyeLUrhkCbG5l6JOMbP5I2RJn99fiqKeHBENGRGAYUA7BtuCPYwh
 RAeuWYYylDagyJiUwNSqeabt7MUPapABSUtm7iP84MUVlfHp0iZ8aZFm2dPXq3lhS7D2
 QHEje/ebgJELBHfU4oxA9rbeTnkB0Ee1D3o1CrG03h7S6VUPgNCO9y0huRiMak7hsejl
 YT2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIx5smc6HtiIWeyGyK1vYEZLlKfncyAAwzRq2bRlDcFv/C/CllED5V62ktqhUhx6v7eLE7lTujtkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVBiAEIMjcGkTTyxV6hjbF+3ZQKC2HHv5ntzlBOG4O1iaFPN8s
 fa9t/h2r9wrJi6uvXUaQhUJgGKwM/vfocYP6Ema6vKq5Hg9JgkMYKj9H0/fFH6mlaU7IECo9uq3
 mDJ4++bwNX/iWKBghk7i6Hm0uKRIsSbtHZU5Szg==
X-Gm-Gg: ASbGncvOTKf7celAWwD1LgWMnvdUVqn3vmh4pzJ/6+VSQ/QfFz2KOkjQT4RjqR87EUg
 YftwtXFUYg+Ksakf/7nkssNgF7QFUhRVT
X-Google-Smtp-Source: AGHT+IHTC1rWVWHDzkVGoZU05NX9wOryEnZF1cHuSmncxU325kh8Qv7gChElHPj6jGwT0XcOUijfqOSL9uUtkS+rDk4=
X-Received: by 2002:a05:6512:1155:b0:53d:e5f0:32d1 with SMTP id
 2adb3069b0e04-53df010eabemr7956666e87.54.1732890807132; Fri, 29 Nov 2024
 06:33:27 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 16:33:13 +0200
Message-ID: <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on QCS615
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org
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

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote=
:
>
> Extended DP support for QCS615 USB or DP phy. Differentiated between
> USBC and DP PHY using the match table=E2=80=99s type, dynamically generat=
ing
> different types of cfg and layout attributes during initialization based
> on this type. Static variables are stored in cfg, while parsed values
> are organized into the layout structure.

We didn't have an understanding / conclusion whether
qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
or two PHYs being placed next to each other. Could you please start
your commit message by explaining it? Or even better, make that a part
of the cover letter for a new series touching just the USBC PHY
driver. DP changes don't have anything in common with the PHY changes,
so you can split the series into two.

>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |    1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 1453 ++++++++++++++++++++++=
++----

Too many changes for a single patch. Please split into logical chunks.

>  2 files changed, 1254 insertions(+), 200 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qua=
lcomm/phy-qcom-qmp-dp-phy.h
> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d083783=
8a0bac1899fb69f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> @@ -25,6 +25,7 @@
>  #define QSERDES_DP_PHY_AUX_CFG7                                0x03c
>  #define QSERDES_DP_PHY_AUX_CFG8                                0x040
>  #define QSERDES_DP_PHY_AUX_CFG9                                0x044
> +#define QSERDES_DP_PHY_VCO_DIV                         0x068
>
>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
>  # define QSERDES_V3_COM_BIAS_EN                                0x0001
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-usbc.c
> index cf12a6f12134dc77ff032f967b2efa43e3de4b21..7fece9d7dc959ed5a7c62077d=
8552324c3734859 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -22,13 +22,20 @@
>  #include <linux/slab.h>
>  #include <linux/usb/typec.h>
>  #include <linux/usb/typec_mux.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> +#include <drm/bridge/aux-bridge.h>
>
>  #include "phy-qcom-qmp-common.h"
>
>  #include "phy-qcom-qmp.h"
>  #include "phy-qcom-qmp-pcs-misc-v3.h"
>
> +#include "phy-qcom-qmp-dp-phy.h"
> +#include "phy-qcom-qmp-dp-phy-v3.h"
> +
>  #define PHY_INIT_COMPLETE_TIMEOUT              10000
> +#define SW_PORTSELECT_VAL                      BIT(0)
> +#define SW_PORTSELECT_MUX                      BIT(1)
>
>  /* set of registers with offsets different per-PHY */
>  enum qphy_reg_layout {
> @@ -284,7 +291,26 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pc=
s_tbl[] =3D {
>         QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>  };
>
> -struct qmp_usbc_offsets {
> +enum qmp_phy_usbc_type {
> +       QMP_PHY_USBC_INVALID,

How can a type be invalid?

> +       QMP_PHY_USBC_USB,
> +       QMP_PHY_USBC_DP,
> +};
> +
> +/* list of regulators */
> +struct qmp_regulator_data {
> +       const char *name;
> +       unsigned int enable_load;
> +};
> +
> +struct dev_cfg {
> +       int type;
> +       const void *cfg;
> +};
> +
> +struct qmp_usbc;
> +
> +struct qmp_usbc_usb_offsets {
>         u16 serdes;
>         u16 pcs;
>         u16 pcs_misc;
> @@ -295,9 +321,9 @@ struct qmp_usbc_offsets {
>         u16 rx2;
>  };
>
> -/* struct qmp_phy_cfg - per-PHY initialization config */
> -struct qmp_phy_cfg {
> -       const struct qmp_usbc_offsets *offsets;
> +/* struct qmp_phy_usb_cfg - per-usb PHY initialization config */

what is "per-usb PHY"?

> +struct qmp_phy_usb_cfg {
> +       const struct qmp_usbc_usb_offsets *offsets;
>
>         /* Init sequence for PHY blocks - serdes, tx, rx, pcs */
>         const struct qmp_phy_init_tbl *serdes_tbl;
> @@ -317,11 +343,7 @@ struct qmp_phy_cfg {
>         const unsigned int *regs;
>  };
>
> -struct qmp_usbc {
> -       struct device *dev;
> -
> -       const struct qmp_phy_cfg *cfg;
> -
> +struct qmp_phy_usb_layout {
>         void __iomem *serdes;
>         void __iomem *pcs;
>         void __iomem *pcs_misc;
> @@ -329,28 +351,67 @@ struct qmp_usbc {
>         void __iomem *rx;
>         void __iomem *tx2;
>         void __iomem *rx2;
> -
>         struct regmap *tcsr_map;
>         u32 vls_clamp_reg;
> -
> +       enum phy_mode mode;
> +       struct typec_switch_dev *sw;
>         struct clk *pipe_clk;
> +       struct clk_fixed_rate pipe_clk_fixed;
> +};
> +
> +struct qmp_usbc_dp_offsets {
> +       u16 dp_serdes;
> +       u16 dp_txa;
> +       u16 dp_txb;
> +       u16 dp_phy;
> +};
> +
> +/* struct qmp_phy_dp_cfg - per-dp PHY initialization config */
> +struct qmp_phy_dp_cfg {
> +       const struct qmp_usbc_dp_offsets *offsets;
> +
> +       /* DP PHY swing and pre_emphasis tables */
> +       const u8 (*swing_tbl)[4][4];
> +       const u8 (*pre_emphasis_tbl)[4][4];
> +
> +       // /* DP PHY callbacks */
> +       int (*dp_aux_init)(struct qmp_usbc *qmp);
> +       int (*configure_dp_serdes)(struct qmp_usbc *qmp);
> +       int (*configure_dp_voltages)(struct qmp_usbc *qmp);
> +       int (*configure_dp_phy)(struct qmp_usbc *qmp);
> +       int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
> +
> +       const struct qmp_regulator_data *vreg_list;
> +       int num_vregs;
> +};
> +
> +struct qmp_phy_dp_layout {
> +       void __iomem *dp_phy;
> +       void __iomem *dp_tx;
> +       void __iomem *dp_tx2;
> +       void __iomem *dp_serdes;
> +       struct regmap *tcsr_map;
> +       u32 dp_phy_mode;
> +       unsigned int dp_aux_cfg;
> +       struct phy_configure_opts_dp dp_opts;
> +       struct clk_hw dp_link_hw;
> +       struct clk_hw dp_pixel_hw;
> +};
> +
> +struct qmp_usbc {
> +       struct device *dev;
> +       int type;
>         struct clk_bulk_data *clks;
>         int num_clks;
>         int num_resets;
>         struct reset_control_bulk_data *resets;
>         struct regulator_bulk_data *vregs;
> -
>         struct mutex phy_mutex;
> -
> -       enum phy_mode mode;
> -       unsigned int usb_init_count;
> -
>         struct phy *phy;
> -
> -       struct clk_fixed_rate pipe_clk_fixed;
> -
> -       struct typec_switch_dev *sw;
>         enum typec_orientation orientation;
> +       unsigned int init_count;
> +       const void *cfg;
> +       void *layout;

The patch contains a mixture of renames bundled with actual changes.
Please explain why old names are bad in a separate patch.

>  };
>
>  static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
> @@ -391,12 +452,21 @@ static const char * const usb3phy_reset_l[] =3D {
>         "phy_phy", "phy",
>  };
>
> +static const char * const dp_usb3phy_reset_l[] =3D {
> +       "phy",
> +};
> +
>  /* list of regulators */
> -static const char * const qmp_phy_vreg_l[] =3D {
> +static const char * const qmp_phy_usb_vreg_l[] =3D {
>         "vdda-phy", "vdda-pll",
>  };
>
> -static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 =3D {
> +static struct qmp_regulator_data qmp_phy_dp_vreg_l[] =3D {
> +       { .name =3D "vdda-phy", .enable_load =3D 21800 },
> +       { .name =3D "vdda-pll", .enable_load =3D 36000 },
> +};
> +
> +static const struct qmp_usbc_usb_offsets qmp_usbc_usb_offsets_v3_qcm2290=
 =3D {
>         .serdes         =3D 0x0,
>         .pcs            =3D 0xc00,
>         .pcs_misc       =3D 0xa00,
> @@ -406,8 +476,15 @@ static const struct qmp_usbc_offsets qmp_usbc_offset=
s_v3_qcm2290 =3D {
>         .rx2            =3D 0x800,
>  };
>
> -static const struct qmp_phy_cfg msm8998_usb3phy_cfg =3D {
> -       .offsets                =3D &qmp_usbc_offsets_v3_qcm2290,
> +static const struct qmp_usbc_dp_offsets qmp_usbc_dp_offsets_qcs615 =3D {
> +       .dp_serdes      =3D 0x0C00,
> +       .dp_txa         =3D 0x0400,
> +       .dp_txb         =3D 0x0800,
> +       .dp_phy         =3D 0x0000,
> +};
> +
> +static const struct qmp_phy_usb_cfg msm8998_usb3phy_cfg =3D {
> +       .offsets                =3D &qmp_usbc_usb_offsets_v3_qcm2290,
>
>         .serdes_tbl             =3D msm8998_usb3_serdes_tbl,
>         .serdes_tbl_num         =3D ARRAY_SIZE(msm8998_usb3_serdes_tbl),
> @@ -417,13 +494,13 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg=
 =3D {
>         .rx_tbl_num             =3D ARRAY_SIZE(msm8998_usb3_rx_tbl),
>         .pcs_tbl                =3D msm8998_usb3_pcs_tbl,
>         .pcs_tbl_num            =3D ARRAY_SIZE(msm8998_usb3_pcs_tbl),
> -       .vreg_list              =3D qmp_phy_vreg_l,
> -       .num_vregs              =3D ARRAY_SIZE(qmp_phy_vreg_l),
> +       .vreg_list              =3D qmp_phy_usb_vreg_l,
> +       .num_vregs              =3D ARRAY_SIZE(qmp_phy_usb_vreg_l),
>         .regs                   =3D qmp_v3_usb3phy_regs_layout,
>  };
>
> -static const struct qmp_phy_cfg qcm2290_usb3phy_cfg =3D {
> -       .offsets                =3D &qmp_usbc_offsets_v3_qcm2290,
> +static const struct qmp_phy_usb_cfg qcm2290_usb3phy_cfg =3D {
> +       .offsets                =3D &qmp_usbc_usb_offsets_v3_qcm2290,
>
>         .serdes_tbl             =3D qcm2290_usb3_serdes_tbl,
>         .serdes_tbl_num         =3D ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
> @@ -433,13 +510,13 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg=
 =3D {
>         .rx_tbl_num             =3D ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>         .pcs_tbl                =3D qcm2290_usb3_pcs_tbl,
>         .pcs_tbl_num            =3D ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> -       .vreg_list              =3D qmp_phy_vreg_l,
> -       .num_vregs              =3D ARRAY_SIZE(qmp_phy_vreg_l),
> +       .vreg_list              =3D qmp_phy_usb_vreg_l,
> +       .num_vregs              =3D ARRAY_SIZE(qmp_phy_usb_vreg_l),
>         .regs                   =3D qmp_v3_usb3phy_regs_layout_qcm2290,
>  };
>
> -static const struct qmp_phy_cfg sdm660_usb3phy_cfg =3D {
> -       .offsets                =3D &qmp_usbc_offsets_v3_qcm2290,
> +static const struct qmp_phy_usb_cfg sdm660_usb3phy_cfg =3D {
> +       .offsets                =3D &qmp_usbc_usb_offsets_v3_qcm2290,
>
>         .serdes_tbl             =3D qcm2290_usb3_serdes_tbl,
>         .serdes_tbl_num         =3D ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
> @@ -449,20 +526,352 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg=
 =3D {
>         .rx_tbl_num             =3D ARRAY_SIZE(sdm660_usb3_rx_tbl),
>         .pcs_tbl                =3D qcm2290_usb3_pcs_tbl,
>         .pcs_tbl_num            =3D ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> -       .vreg_list              =3D qmp_phy_vreg_l,
> -       .num_vregs              =3D ARRAY_SIZE(qmp_phy_vreg_l),
> +       .vreg_list              =3D qmp_phy_usb_vreg_l,
> +       .num_vregs              =3D ARRAY_SIZE(qmp_phy_usb_vreg_l),
>         .regs                   =3D qmp_v3_usb3phy_regs_layout_qcm2290,
>  };
>
> -static int qmp_usbc_init(struct phy *phy)
> +static const u8 qmp_dp_pre_emphasis_hbr2_rbr[4][4] =3D {
> +       {0x00, 0x0B, 0x12, 0xFF},       /* pe0, 0 db */
> +       {0x00, 0x0A, 0x12, 0xFF},       /* pe1, 3.5 db */
> +       {0x00, 0x0C, 0xFF, 0xFF},       /* pe2, 6.0 db */
> +       {0xFF, 0xFF, 0xFF, 0xFF}        /* pe3, 9.5 db */
> +};
> +
> +static const u8 qmp_dp_voltage_swing_hbr2_rbr[4][4] =3D {
> +       {0x07, 0x0F, 0x14, 0xFF}, /* sw0, 0.4v  */
> +       {0x11, 0x1D, 0x1F, 0xFF}, /* sw1, 0.6 v */
> +       {0x18, 0x1F, 0xFF, 0xFF}, /* sw1, 0.8 v */
> +       {0xFF, 0xFF, 0xFF, 0xFF}  /* sw1, 1.2 v, optional */
> +};
> +
> +static int qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp);
> +static int qcs615_qmp_configure_dp_serdes(struct qmp_usbc *qmp);
> +static int qcs615_qmp_configure_dp_voltages(struct qmp_usbc *qmp);
> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp);
> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp);

Are those functions really platform-specific?

> +
> +static void qmp_usbc_check_dp_phy(struct qmp_usbc *qmp, const char *pos)=
;
> +
> +static const struct qmp_phy_dp_cfg qcs615_dpphy_cfg =3D {
> +       .offsets                =3D &qmp_usbc_dp_offsets_qcs615,
> +
> +       .swing_tbl              =3D &qmp_dp_voltage_swing_hbr2_rbr,
> +       .pre_emphasis_tbl       =3D &qmp_dp_pre_emphasis_hbr2_rbr,
> +
> +       .dp_aux_init            =3D qcs615_qmp_dp_aux_init,
> +       .configure_dp_serdes    =3D qcs615_qmp_configure_dp_serdes,
> +       .configure_dp_voltages  =3D qcs615_qmp_configure_dp_voltages,
> +       .configure_dp_phy   =3D qcs615_qmp_configure_dp_phy,
> +       .calibrate_dp_phy       =3D qcs615_qmp_calibrate_dp_phy,
> +
> +       .vreg_list              =3D qmp_phy_dp_vreg_l,
> +       .num_vregs              =3D ARRAY_SIZE(qmp_phy_dp_vreg_l),
> +};
> +
> +#define to_usb_cfg(x) ((struct qmp_phy_usb_cfg *)(x->cfg))
> +#define to_dp_cfg(x) ((struct qmp_phy_dp_cfg *)(x->cfg))
> +#define to_usb_layout(x) ((struct qmp_phy_usb_layout *)(x->layout))
> +#define to_dp_layout(x) ((struct qmp_phy_dp_layout *)(x->layout))
> +
> +static int qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp)
> +{
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +
> +       regmap_write(layout->tcsr_map, layout->dp_phy_mode, 0x1);
> +
> +       writel(DP_PHY_PD_CTL_AUX_PWRDN |
> +                  DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_=
PWRDN |
> +              DP_PHY_PD_CTL_PLL_PWRDN,
> +              layout->dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +       writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +                  DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_=
PWRDN |
> +              DP_PHY_PD_CTL_PLL_PWRDN,
> +              layout->dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +       writel(0x00, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG0);
> +       writel(0x13, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +       writel(0x00, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> +       writel(0x00, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG3);
> +       writel(0x0a, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG4);
> +       writel(0x26, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG5);
> +       writel(0x0a, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG6);
> +       writel(0x03, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG7);
> +       writel(0xbb, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG8);
> +       writel(0x03, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG9);
> +       layout->dp_aux_cfg =3D 0;
> +
> +       writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
> +              PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
> +              PHY_AUX_REQ_ERR_MASK,
> +              layout->dp_phy + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
> +       return 0;
> +}

We've had DP PHY implementation in QMP Combo PHY and in eDP PHY.
Please review them and work on extracting common bits into some kind
of a library. At least -combo and your -usbc implementation seem close
enough to warrant common library code.

> +
> +static int qcs615_qmp_configure_dp_serdes(struct qmp_usbc *qmp)
> +{
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       void __iomem *serdes =3D layout->dp_serdes;
> +       const struct phy_configure_opts_dp *dp_opts =3D &layout->dp_opts;
> +       u8 hsclk_sel;
> +       u8 dec_start_mode0;
> +       u8 div_frac_start1_mode0;
> +       u8 div_frac_start2_mode0;
> +       u8 div_frac_start3_mode0;
> +       u8 lock_cmp1_mode0;
> +       u8 lock_cmp2_mode0;
> +       u8 lock_cmp3_mode0;
> +
> +       switch (dp_opts->link_rate) {
> +       case 1620:
> +               hsclk_sel =3D 0x2c;
> +               dec_start_mode0 =3D 0x69;
> +               div_frac_start1_mode0 =3D 0x00;
> +               div_frac_start2_mode0 =3D 0x80;
> +               div_frac_start3_mode0 =3D 0x07;
> +               lock_cmp1_mode0 =3D 0xbf;
> +               lock_cmp2_mode0 =3D 0x21;
> +               lock_cmp3_mode0 =3D 0x00;
> +               break;
> +       case 2700:
> +               hsclk_sel =3D 0x24;
> +               dec_start_mode0 =3D 0x69;
> +               div_frac_start1_mode0 =3D 0x00;
> +               div_frac_start2_mode0 =3D 0x80;
> +               div_frac_start3_mode0 =3D 0x07;
> +               lock_cmp1_mode0 =3D 0x3f;
> +               lock_cmp2_mode0 =3D 0x38;
> +               lock_cmp3_mode0 =3D 0x00;
> +               break;
> +       case 5400:
> +               hsclk_sel =3D 0x20;
> +               dec_start_mode0 =3D 0x8c;
> +               div_frac_start1_mode0 =3D 0x00;
> +               div_frac_start2_mode0 =3D 0x00;
> +               div_frac_start3_mode0 =3D 0x0a;
> +               lock_cmp1_mode0 =3D 0x7f;
> +               lock_cmp2_mode0 =3D 0x70;
> +               lock_cmp3_mode0 =3D 0x00;
> +               break;
> +       default:
> +               /* Other link rates aren't supported */
> +               return -EINVAL;
> +       }
> +
> +       writel(0x01, serdes + QSERDES_COM_SVS_MODE_CLK_SEL);
> +       writel(0x37, serdes + QSERDES_COM_SYSCLK_EN_SEL);
> +       writel(0x00, serdes + QSERDES_COM_CLK_SELECT);
> +       writel(0x06, serdes + QSERDES_COM_SYS_CLK_CTRL);
> +       writel(0x3f, serdes + QSERDES_COM_BIAS_EN_CLKBUFLR_EN);
> +       writel(0x0e, serdes + QSERDES_COM_CLK_ENABLE1);
> +       writel(0x0f, serdes + QSERDES_COM_BG_CTRL);
> +       writel(0x06, serdes + QSERDES_COM_SYSCLK_BUF_ENABLE);
> +       writel(0x30, serdes + QSERDES_COM_CLK_SELECT);
> +       writel(0x0f, serdes + QSERDES_COM_PLL_IVCO);
> +       writel(0x28, serdes + QSERDES_COM_PLL_CCTRL_MODE0);
> +       writel(0x16, serdes + QSERDES_COM_PLL_RCTRL_MODE0);
> +       writel(0x0b, serdes + QSERDES_COM_CP_CTRL_MODE0);
> +
> +       writel(hsclk_sel, serdes + QSERDES_COM_HSCLK_SEL);
> +       writel(dec_start_mode0, serdes + QSERDES_COM_DEC_START_MODE0);
> +       writel(div_frac_start1_mode0, serdes + QSERDES_COM_DIV_FRAC_START=
1_MODE0);
> +       writel(div_frac_start2_mode0, serdes + QSERDES_COM_DIV_FRAC_START=
2_MODE0);
> +       writel(div_frac_start3_mode0, serdes + QSERDES_COM_DIV_FRAC_START=
3_MODE0);
> +       writel(lock_cmp1_mode0, serdes + QSERDES_COM_LOCK_CMP1_MODE0);
> +       writel(lock_cmp2_mode0, serdes + QSERDES_COM_LOCK_CMP2_MODE0);
> +       writel(lock_cmp3_mode0, serdes + QSERDES_COM_LOCK_CMP3_MODE0);
> +
> +       writel(0x40, serdes + QSERDES_COM_INTEGLOOP_GAIN0_MODE0);
> +       writel(0x00, serdes + QSERDES_COM_INTEGLOOP_GAIN1_MODE0);
> +       writel(0x00, serdes + QSERDES_COM_VCO_TUNE_MAP);
> +       writel(0x08, serdes + QSERDES_COM_BG_TIMER);
> +       writel(0x05, serdes + QSERDES_COM_CORECLK_DIV);
> +       writel(0x00, serdes + QSERDES_COM_VCO_TUNE_CTRL);
> +       writel(0x00, serdes + QSERDES_COM_VCO_TUNE1_MODE0);
> +       writel(0x00, serdes + QSERDES_COM_VCO_TUNE2_MODE0);
> +       writel(0x00, serdes + QSERDES_COM_VCO_TUNE_CTRL);
> +
> +       writel(0x0f, serdes + QSERDES_COM_CORE_CLK_EN);
> +
> +       return 0;
> +}
> +
> +static int qcs615_qmp_configure_dp_voltages(struct qmp_usbc *qmp)
> +{
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       struct qmp_phy_dp_cfg *cfg =3D to_dp_cfg(qmp);
> +       const struct phy_configure_opts_dp *dp_opts =3D &layout->dp_opts;
> +       void __iomem *tx =3D layout->dp_tx;
> +       void __iomem *tx2 =3D layout->dp_tx2;
> +       unsigned int v_level =3D 0, p_level =3D 0;
> +       u8 voltage_swing_cfg, pre_emphasis_cfg;
> +       int i;
> +
> +       if (dp_opts->lanes > 4) {
> +               dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lane=
s);
> +               return -EINVAL;
> +       }
> +
> +       for (i =3D 0; i < dp_opts->lanes; i++) {
> +               v_level =3D max(v_level, dp_opts->voltage[i]);
> +               p_level =3D max(p_level, dp_opts->pre[i]);
> +       }
> +
> +       if ((v_level > 4) || (pre_emphasis_cfg > 4)) {
> +               dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
> +                       v_level, pre_emphasis_cfg);
> +               return -EINVAL;
> +       }
> +
> +       voltage_swing_cfg =3D (*cfg->swing_tbl)[v_level][p_level];
> +       pre_emphasis_cfg =3D (*cfg->pre_emphasis_tbl)[v_level][p_level];
> +
> +       /* Enable MUX to use Cursor values from these registers */
> +       voltage_swing_cfg |=3D DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> +       pre_emphasis_cfg |=3D DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
> +
> +       if (voltage_swing_cfg =3D=3D 0xFF && pre_emphasis_cfg =3D=3D 0xFF=
)
> +               return -EINVAL;
> +
> +       /* program default setting first */
> +       writel(0x2A, tx + QSERDES_V3_TX_TX_DRV_LVL);
> +       writel(0x20, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +       writel(0x2A, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +       writel(0x20, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);

Lowercase all hex numbers.

> +
> +       writel(voltage_swing_cfg, tx + QSERDES_V3_TX_TX_DRV_LVL);
> +       writel(pre_emphasis_cfg, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +       writel(voltage_swing_cfg, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +       writel(pre_emphasis_cfg, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +
> +       return 0;
> +}
> +
> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp)
> +{
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       u32 status;
> +
> +       writel(0x01, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +       writel(0x05, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +       writel(0x01, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +       writel(0x09, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +
> +       writel(0x20, layout->dp_serdes + QSERDES_COM_RESETSM_CNTRL);
> +
> +       // C_READY
> +       if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_C_READY_ST=
ATUS,
> +                       status,
> +                       ((status & BIT(0)) > 0),
> +                       500,
> +                       10000)) {
> +               dev_err(qmp->dev, "C_READY not ready\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       // FREQ_DONE
> +       if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_CMN_STATUS=
,
> +                       status,
> +                       ((status & BIT(0)) > 0),
> +                       500,
> +                       10000)){
> +               dev_err(qmp->dev, "FREQ_DONE not ready\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       // PLL_LOCKED
> +       if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_CMN_STATUS=
,
> +                       status,
> +                       ((status & BIT(1)) > 0),
> +                       500,
> +                       10000)){
> +               dev_err(qmp->dev, "PLL_LOCKED not ready\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       writel(0x19, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +       udelay(10);
> +
> +       // TSYNC_DONE
> +       if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
> +                       status,
> +                       ((status & BIT(0)) > 0),
> +                       500,
> +                       10000)){
> +               dev_err(qmp->dev, "TSYNC_DONE not ready\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       // PHY_READY
> +       if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
> +                       status,
> +                       ((status & BIT(1)) > 0),
> +                       500,
> +                       10000)){
> +               dev_err(qmp->dev, "PHY_READY not ready\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       writel(0x3f, layout->dp_tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +       writel(0x10, layout->dp_tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
> +       writel(0x0a, layout->dp_tx + QSERDES_V3_TX_TX_POL_INV);
> +       writel(0x3f, layout->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +       writel(0x10, layout->dp_tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
> +       writel(0x0a, layout->dp_tx2 + QSERDES_V3_TX_TX_POL_INV);
> +
> +       writel(0x18, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +       writel(0x19, layout->dp_phy + QSERDES_DP_PHY_CFG);
> +
> +       if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
> +                       status,
> +                       ((status & BIT(1)) > 0),
> +                       500,
> +                       10000)){
> +               dev_err(qmp->dev, "PHY_READY not ready\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp)
> +{
> +       static const u8 cfg1_settings[] =3D {0x13, 0x23, 0x1d};
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       u8 val;
> +
> +       layout->dp_aux_cfg++;
> +       layout->dp_aux_cfg %=3D ARRAY_SIZE(cfg1_settings);
> +       val =3D cfg1_settings[layout->dp_aux_cfg];
> +
> +       writel(val, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +
> +       qmp_usbc_check_dp_phy(qmp, "pos_calibrate");
> +
> +       return 0;
> +}
> +
> +static int qmp_usbc_com_init(struct phy *phy)
>  {
>         struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> -       const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> -       void __iomem *pcs =3D qmp->pcs;
> +       int num_vregs;
>         u32 val =3D 0;
>         int ret;
> +       unsigned int reg_pwr_dn;
>
> -       ret =3D regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> +       if (qmp->type =3D=3D QMP_PHY_USBC_USB) {
> +               struct qmp_phy_usb_cfg *cfg =3D to_usb_cfg(qmp);
> +
> +               num_vregs =3D cfg->num_vregs;
> +               reg_pwr_dn =3D cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
> +       } else {
> +               struct qmp_phy_dp_cfg *cfg =3D to_dp_cfg(qmp);
> +
> +               num_vregs =3D cfg->num_vregs;
> +       }
> +
> +       ret =3D regulator_bulk_enable(num_vregs, qmp->vregs);
>         if (ret) {
>                 dev_err(qmp->dev, "failed to enable regulators, err=3D%d\=
n", ret);
>                 return ret;
> @@ -484,73 +893,85 @@ static int qmp_usbc_init(struct phy *phy)
>         if (ret)
>                 goto err_assert_reset;
>
> -       qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRD=
N);
> -
> -#define SW_PORTSELECT_VAL                      BIT(0)
> -#define SW_PORTSELECT_MUX                      BIT(1)
>         /* Use software based port select and switch on typec orientation=
 */
>         val =3D SW_PORTSELECT_MUX;
>         if (qmp->orientation =3D=3D TYPEC_ORIENTATION_REVERSE)
>                 val |=3D SW_PORTSELECT_VAL;
> -       writel(val, qmp->pcs_misc);
> +
> +       if (qmp->type =3D=3D QMP_PHY_USBC_USB) {

Why?

> +               struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
> +
> +               qphy_setbits(layout->pcs, reg_pwr_dn, SW_PWRDN);
> +               writel(val, layout->pcs_misc);
> +       }
>
>         return 0;
>
>  err_assert_reset:
>         reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>  err_disable_regulators:
> -       regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> +       regulator_bulk_disable(num_vregs, qmp->vregs);
>
>         return ret;
>  }
>
> -static int qmp_usbc_exit(struct phy *phy)
> +static int qmp_usbc_com_exit(struct phy *phy)
>  {
>         struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> -       const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +       int num_vregs;
>
>         reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>
>         clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>
> -       regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> +       if (qmp->type =3D=3D QMP_PHY_USBC_USB) {
> +               struct qmp_phy_usb_cfg *cfg =3D to_usb_cfg(qmp);
> +
> +               num_vregs =3D cfg->num_vregs;
> +       } else {
> +               struct qmp_phy_dp_cfg *cfg =3D to_dp_cfg(qmp);
> +
> +               num_vregs =3D cfg->num_vregs;
> +       }
> +       regulator_bulk_disable(num_vregs, qmp->vregs);
>
>         return 0;
>  }
>
> -static int qmp_usbc_power_on(struct phy *phy)
> +static int qmp_usbc_usb_power_on(struct phy *phy)
>  {
>         struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> -       const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +       const struct qmp_phy_usb_cfg *cfg =3D to_usb_cfg(qmp);
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
>         void __iomem *status;
>         unsigned int val;
>         int ret;
>
> -       qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
> +       qmp_configure(qmp->dev, layout->serdes, cfg->serdes_tbl,
>                       cfg->serdes_tbl_num);
>
> -       ret =3D clk_prepare_enable(qmp->pipe_clk);
> +       ret =3D clk_prepare_enable(layout->pipe_clk);
>         if (ret) {
>                 dev_err(qmp->dev, "pipe_clk enable failed err=3D%d\n", re=
t);
>                 return ret;
>         }
>
>         /* Tx, Rx, and PCS configurations */
> -       qmp_configure_lane(qmp->dev, qmp->tx, cfg->tx_tbl, cfg->tx_tbl_nu=
m, 1);
> -       qmp_configure_lane(qmp->dev, qmp->rx, cfg->rx_tbl, cfg->rx_tbl_nu=
m, 1);
> +       qmp_configure_lane(qmp->dev, layout->tx, cfg->tx_tbl, cfg->tx_tbl=
_num, 1);
> +       qmp_configure_lane(qmp->dev, layout->rx, cfg->rx_tbl, cfg->rx_tbl=
_num, 1);
>
> -       qmp_configure_lane(qmp->dev, qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_n=
um, 2);
> -       qmp_configure_lane(qmp->dev, qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_n=
um, 2);
> +       qmp_configure_lane(qmp->dev, layout->tx2, cfg->tx_tbl, cfg->tx_tb=
l_num, 2);
> +       qmp_configure_lane(qmp->dev, layout->rx2, cfg->rx_tbl, cfg->rx_tb=
l_num, 2);
>
> -       qmp_configure(qmp->dev, qmp->pcs, cfg->pcs_tbl, cfg->pcs_tbl_num)=
;
> +       qmp_configure(qmp->dev, layout->pcs, cfg->pcs_tbl, cfg->pcs_tbl_n=
um);
>
>         /* Pull PHY out of reset state */
> -       qphy_clrbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +       qphy_clrbits(layout->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>
>         /* start SerDes and Phy-Coding-Sublayer */
> -       qphy_setbits(qmp->pcs, cfg->regs[QPHY_START_CTRL], SERDES_START |=
 PCS_START);
> +       qphy_setbits(layout->pcs, cfg->regs[QPHY_START_CTRL], SERDES_STAR=
T | PCS_START);
>
> -       status =3D qmp->pcs + cfg->regs[QPHY_PCS_STATUS];
> +       status =3D layout->pcs + cfg->regs[QPHY_PCS_STATUS];
>         ret =3D readl_poll_timeout(status, val, !(val & PHYSTATUS), 200,
>                                  PHY_INIT_COMPLETE_TIMEOUT);
>         if (ret) {
> @@ -561,92 +982,348 @@ static int qmp_usbc_power_on(struct phy *phy)
>         return 0;
>
>  err_disable_pipe_clk:
> -       clk_disable_unprepare(qmp->pipe_clk);
> +       clk_disable_unprepare(layout->pipe_clk);
>
>         return ret;
>  }
>
> -static int qmp_usbc_power_off(struct phy *phy)
> +static int qmp_usbc_usb_power_off(struct phy *phy)
>  {
>         struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> -       const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> +       const struct qmp_phy_usb_cfg *cfg =3D to_usb_cfg(qmp);
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
>
> -       clk_disable_unprepare(qmp->pipe_clk);
> +       clk_disable_unprepare(layout->pipe_clk);
>
>         /* PHY reset */
> -       qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +       qphy_setbits(layout->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>
>         /* stop SerDes and Phy-Coding-Sublayer */
> -       qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
> +       qphy_clrbits(layout->pcs, cfg->regs[QPHY_START_CTRL],
>                         SERDES_START | PCS_START);
>
>         /* Put PHY into POWER DOWN state: active low */
> -       qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> +       qphy_clrbits(layout->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>                         SW_PWRDN);
>
>         return 0;
>  }
>
> -static int qmp_usbc_enable(struct phy *phy)
> +static int qmp_usbc_usb_enable(struct phy *phy)
>  {
>         struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
>         int ret;
>
>         mutex_lock(&qmp->phy_mutex);
>
> -       ret =3D qmp_usbc_init(phy);
> +       ret =3D qmp_usbc_com_init(phy);
>         if (ret)
>                 goto out_unlock;
>
> -       ret =3D qmp_usbc_power_on(phy);
> +       ret =3D qmp_usbc_usb_power_on(phy);
>         if (ret) {
> -               qmp_usbc_exit(phy);
> +               qmp_usbc_com_exit(phy);
>                 goto out_unlock;
>         }
>
> -       qmp->usb_init_count++;
> +       qmp->init_count++;
>  out_unlock:
>         mutex_unlock(&qmp->phy_mutex);
>
>         return ret;
>  }
>
> -static int qmp_usbc_disable(struct phy *phy)
> +static int qmp_usbc_usb_disable(struct phy *phy)
>  {
>         struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
>         int ret;
>
> -       qmp->usb_init_count--;
> -       ret =3D qmp_usbc_power_off(phy);
> +       qmp->init_count--;
> +       ret =3D qmp_usbc_usb_power_off(phy);
>         if (ret)
>                 return ret;
> -       return qmp_usbc_exit(phy);
> +       return qmp_usbc_com_exit(phy);
> +}
> +
> +static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, in=
t submode)
> +{
> +       struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
> +
> +       layout->mode =3D mode;
> +
> +       return 0;
> +}
> +
> +static int qmp_usbc_dp_init(struct phy *phy)
> +{
> +       struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> +       const struct qmp_phy_dp_cfg *cfg =3D to_dp_cfg(qmp);
> +       int ret;
> +
> +       if (qmp->init_count) {
> +               dev_err(qmp->dev, "type(%d) inited(%d)\n", qmp->type, qmp=
->init_count);
> +               return 0;
> +       }
> +
> +       mutex_lock(&qmp->phy_mutex);
> +
> +       ret =3D qmp_usbc_com_init(phy);
> +       if (ret) {
> +               dev_err(qmp->dev, "type(%d) com_init fail\n", qmp->type);
> +               goto dp_init_unlock;
> +       }
> +
> +       cfg->dp_aux_init(qmp);
> +
> +       qmp->init_count++;
> +
> +dp_init_unlock:
> +       mutex_unlock(&qmp->phy_mutex);
> +       return ret;
> +}
> +
> +static int qmp_usbc_dp_exit(struct phy *phy)
> +{
> +       struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> +
> +       mutex_lock(&qmp->phy_mutex);
> +
> +       qmp_usbc_com_exit(phy);
> +
> +       qmp->init_count--;
> +
> +       mutex_unlock(&qmp->phy_mutex);
> +
> +       return 0;
> +}
> +
> +static int qmp_usbc_dp_configure(struct phy *phy, union phy_configure_op=
ts *opts)
> +{
> +       const struct phy_configure_opts_dp *dp_opts =3D &opts->dp;
> +       struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> +       struct qmp_phy_dp_cfg *cfg =3D to_dp_cfg(qmp);
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       int ret;
> +
> +       mutex_lock(&qmp->phy_mutex);
> +
> +       memcpy(&layout->dp_opts, dp_opts, sizeof(*dp_opts));
> +       if (layout->dp_opts.set_voltages) {
> +               ret =3D cfg->configure_dp_voltages(qmp);
> +               if (ret) {
> +                       dev_err(qmp->dev, "type(%d) err(%d)\n", qmp->type=
, ret);
> +                       mutex_unlock(&qmp->phy_mutex);
> +                       return ret;
> +               }
> +
> +               layout->dp_opts.set_voltages =3D 0;
> +       }
> +
> +       mutex_unlock(&qmp->phy_mutex);
> +
> +       return 0;
> +}
> +
> +static int qmp_usbc_dp_calibrate(struct phy *phy)
> +{
> +       struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> +       struct qmp_phy_dp_cfg *cfg =3D to_dp_cfg(qmp);
> +       int ret =3D 0;
> +
> +       mutex_lock(&qmp->phy_mutex);
> +
> +       if (cfg->calibrate_dp_phy) {
> +               ret =3D cfg->calibrate_dp_phy(qmp);
> +               if (ret) {
> +                       dev_err(qmp->dev, "type(%d) err(%d)\n", qmp->type=
, ret);
> +                       mutex_unlock(&qmp->phy_mutex);
> +                       return ret;
> +               }
> +       }
> +
> +       mutex_unlock(&qmp->phy_mutex);
> +       return 0;
>  }
>
> -static int qmp_usbc_set_mode(struct phy *phy, enum phy_mode mode, int su=
bmode)
> +static int qmp_usbc_configure_dp_clocks(struct qmp_usbc *qmp)
> +{
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       const struct phy_configure_opts_dp *dp_opts =3D &layout->dp_opts;
> +       u32 phy_vco_div;
> +       unsigned long pixel_freq;
> +
> +       switch (dp_opts->link_rate) {
> +       case 1620:
> +               phy_vco_div =3D 0x1;
> +               pixel_freq =3D 1620000000UL / 2;
> +               break;
> +       case 2700:
> +               phy_vco_div =3D 0x1;
> +               pixel_freq =3D 2700000000UL / 2;
> +               break;
> +       case 5400:
> +               phy_vco_div =3D 0x2;
> +               pixel_freq =3D 5400000000UL / 4;
> +               break;
> +       case 8100:
> +               phy_vco_div =3D 0x0;
> +               pixel_freq =3D 8100000000UL / 6;
> +               break;
> +       default:
> +               /* Other link rates aren't supported */
> +               return -EINVAL;
> +       }
> +       writel(phy_vco_div, layout->dp_phy + QSERDES_DP_PHY_VCO_DIV);
> +
> +       clk_set_rate(layout->dp_link_hw.clk, dp_opts->link_rate * 100000)=
;
> +       clk_set_rate(layout->dp_pixel_hw.clk, pixel_freq);
> +
> +       return 0;
> +}
> +
> +static void qmp_usbc_check_dp_phy(struct qmp_usbc *qmp, const char *pos)
> +{
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       u8 c_ready, cmn_status, phy_status;
> +
> +       c_ready =3D readl(layout->dp_serdes + QSERDES_COM_C_READY_STATUS)=
;
> +       cmn_status =3D readl(layout->dp_serdes + QSERDES_COM_CMN_STATUS);
> +       phy_status =3D readl(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS);
> +
> +       dev_dbg(qmp->dev, "pos(%s) c_ready(0x%x) cmn_status(0x%x) phy_sta=
tus(0x%x)\n",
> +               pos, c_ready, cmn_status, phy_status);
> +}
> +
> +static int qmp_usbc_dp_power_on(struct phy *phy)
> +{
> +       struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> +       const struct qmp_phy_dp_cfg *cfg =3D to_dp_cfg(qmp);
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       const struct phy_configure_opts_dp *dp_opts =3D &layout->dp_opts;
> +       bool reverse =3D (qmp->orientation =3D=3D TYPEC_ORIENTATION_REVER=
SE);
> +       void __iomem *tx =3D layout->dp_tx;
> +       void __iomem *tx2 =3D layout->dp_tx2;
> +       u8 lane_mode_1;
> +       int ret =3D 0;
> +
> +       mutex_lock(&qmp->phy_mutex);
> +
> +       writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +               DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWR=
DN |
> +               DP_PHY_PD_CTL_PLL_PWRDN,
> +               layout->dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +       ret =3D cfg->configure_dp_serdes(qmp);
> +       if (ret) {
> +               dev_err(qmp->dev, "failed to config pll\n");
> +               goto power_on_unlock;
> +       }
> +
> +       if (dp_opts->link_rate >=3D 2700)
> +               lane_mode_1 =3D 0xc4;
> +       else
> +               lane_mode_1 =3D 0xc6;
> +
> +       writel(lane_mode_1, tx + QSERDES_V3_TX_LANE_MODE_1);
> +       writel(lane_mode_1, tx2 + QSERDES_V3_TX_LANE_MODE_1);
> +
> +       if (reverse)
> +               writel(0xc9, layout->dp_phy + QSERDES_DP_PHY_MODE);
> +       else
> +               writel(0xd9, layout->dp_phy + QSERDES_DP_PHY_MODE);
> +
> +       writel(0x05, layout->dp_phy + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL)=
;
> +       writel(0x05, layout->dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL)=
;
> +
> +       writel(0x1a, tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +       writel(0x40, tx + QSERDES_V3_TX_VMODE_CTRL1);
> +       writel(0x30, tx + QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN);
> +       writel(0x3d, tx + QSERDES_V3_TX_INTERFACE_SELECT);
> +       writel(0x0f, tx + QSERDES_V3_TX_CLKBUF_ENABLE);
> +       writel(0x03, tx + QSERDES_V3_TX_RESET_TSYNC_EN);
> +       writel(0x03, tx + QSERDES_V3_TX_TRAN_DRVR_EMP_EN);
> +       writel(0x00, tx + QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN);
> +       writel(0x00, tx + QSERDES_V3_TX_TX_INTERFACE_MODE);
> +       writel(0x2b, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +       writel(0x2f, tx + QSERDES_V3_TX_TX_DRV_LVL);
> +       writel(0x04, tx + QSERDES_V3_TX_TX_BAND);
> +       writel(0x12, tx + QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX);
> +       writel(0x12, tx + QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX);
> +
> +       writel(0x1a, tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +       writel(0x40, tx2 + QSERDES_V3_TX_VMODE_CTRL1);
> +       writel(0x30, tx2 + QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN);
> +       writel(0x3d, tx2 + QSERDES_V3_TX_INTERFACE_SELECT);
> +       writel(0x0f, tx2 + QSERDES_V3_TX_CLKBUF_ENABLE);
> +       writel(0x03, tx2 + QSERDES_V3_TX_RESET_TSYNC_EN);
> +       writel(0x03, tx2 + QSERDES_V3_TX_TRAN_DRVR_EMP_EN);
> +       writel(0x00, tx2 + QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN);
> +       writel(0x00, tx2 + QSERDES_V3_TX_TX_INTERFACE_MODE);
> +       writel(0x2b, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +       writel(0x2f, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +       writel(0x04, tx2 + QSERDES_V3_TX_TX_BAND);
> +       writel(0x12, tx2 + QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX);
> +       writel(0x12, tx2 + QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX);
> +
> +       writel(0x02, layout->dp_serdes + QSERDES_COM_CMN_CONFIG);
> +       qmp_usbc_configure_dp_clocks(qmp);
> +
> +       ret =3D cfg->configure_dp_phy(qmp);
> +       if (ret) {
> +               dev_err(qmp->dev, "failed to config dp phy\n");
> +               goto power_on_unlock;
> +       }
> +
> +       qmp_usbc_check_dp_phy(qmp, "usbc_dp_power_on_finish");
> +
> +power_on_unlock:
> +       mutex_unlock(&qmp->phy_mutex);
> +
> +       return ret;
> +}
> +
> +static int qmp_usbc_dp_power_off(struct phy *phy)
>  {
>         struct qmp_usbc *qmp =3D phy_get_drvdata(phy);
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +
> +       mutex_lock(&qmp->phy_mutex);
>
> -       qmp->mode =3D mode;
> +       /* Assert DP PHY power down */
> +       writel(DP_PHY_PD_CTL_PSR_PWRDN, layout->dp_phy + QSERDES_DP_PHY_P=
D_CTL);
> +
> +       mutex_unlock(&qmp->phy_mutex);
>
>         return 0;
>  }
>
> -static const struct phy_ops qmp_usbc_phy_ops =3D {
> -       .init           =3D qmp_usbc_enable,
> -       .exit           =3D qmp_usbc_disable,
> -       .set_mode       =3D qmp_usbc_set_mode,
> +static const struct phy_ops qmp_usbc_usb_phy_ops =3D {
> +       .init           =3D qmp_usbc_usb_enable,
> +       .exit           =3D qmp_usbc_usb_disable,
> +       .set_mode       =3D qmp_usbc_usb_set_mode,
> +       .owner          =3D THIS_MODULE,
> +};
> +
> +static const struct phy_ops qmp_usbc_dp_phy_ops =3D {
> +       .init           =3D qmp_usbc_dp_init,
> +       .exit           =3D qmp_usbc_dp_exit,
> +       .configure      =3D qmp_usbc_dp_configure,
> +       .calibrate      =3D qmp_usbc_dp_calibrate,
> +       .power_on       =3D qmp_usbc_dp_power_on,
> +       .power_off      =3D qmp_usbc_dp_power_off,
>         .owner          =3D THIS_MODULE,
>  };
>
>  static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
>  {
> -       const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> -       void __iomem *pcs =3D qmp->pcs;
> +       const struct qmp_phy_usb_cfg *cfg =3D to_usb_cfg(qmp);
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
> +       void __iomem *pcs =3D layout->pcs;
>         u32 intr_mask;
>
> -       if (qmp->mode =3D=3D PHY_MODE_USB_HOST_SS ||
> -           qmp->mode =3D=3D PHY_MODE_USB_DEVICE_SS)
> +       if (layout->mode =3D=3D PHY_MODE_USB_HOST_SS ||
> +           layout->mode =3D=3D PHY_MODE_USB_DEVICE_SS)
>                 intr_mask =3D ARCVR_DTCT_EN | ALFPS_DTCT_EN;
>         else
>                 intr_mask =3D ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
> @@ -663,18 +1340,19 @@ static void qmp_usbc_enable_autonomous_mode(struct=
 qmp_usbc *qmp)
>         qphy_setbits(pcs, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_=
mask);
>
>         /* Enable i/o clamp_n for autonomous mode */
> -       if (qmp->tcsr_map && qmp->vls_clamp_reg)
> -               regmap_write(qmp->tcsr_map, qmp->vls_clamp_reg, 1);
> +       if (layout->tcsr_map && layout->vls_clamp_reg)
> +               regmap_write(layout->tcsr_map, layout->vls_clamp_reg, 1);
>  }
>
>  static void qmp_usbc_disable_autonomous_mode(struct qmp_usbc *qmp)
>  {
> -       const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> -       void __iomem *pcs =3D qmp->pcs;
> +       const struct qmp_phy_usb_cfg *cfg =3D to_usb_cfg(qmp);
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
> +       void __iomem *pcs =3D layout->pcs;
>
>         /* Disable i/o clamp_n on resume for normal mode */
> -       if (qmp->tcsr_map && qmp->vls_clamp_reg)
> -               regmap_write(qmp->tcsr_map, qmp->vls_clamp_reg, 0);
> +       if (layout->tcsr_map && layout->vls_clamp_reg)
> +               regmap_write(layout->tcsr_map, layout->vls_clamp_reg, 0);
>
>         qphy_clrbits(pcs, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
>                      ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN=
);
> @@ -688,16 +1366,19 @@ static int __maybe_unused qmp_usbc_runtime_suspend=
(struct device *dev)
>  {
>         struct qmp_usbc *qmp =3D dev_get_drvdata(dev);
>
> -       dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
> -
>         if (!qmp->phy->init_count) {
>                 dev_vdbg(dev, "PHY not initialized, bailing out\n");
>                 return 0;
>         }
>
> -       qmp_usbc_enable_autonomous_mode(qmp);
> +       if (qmp->type =3D=3D QMP_PHY_USBC_USB) {
> +               struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
> +
> +               dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", layout->mo=
de);
> +               qmp_usbc_enable_autonomous_mode(qmp);
> +               clk_disable_unprepare(layout->pipe_clk);
> +       }
>
> -       clk_disable_unprepare(qmp->pipe_clk);
>         clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>
>         return 0;
> @@ -708,8 +1389,6 @@ static int __maybe_unused qmp_usbc_runtime_resume(st=
ruct device *dev)
>         struct qmp_usbc *qmp =3D dev_get_drvdata(dev);
>         int ret =3D 0;
>
> -       dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
> -
>         if (!qmp->phy->init_count) {
>                 dev_vdbg(dev, "PHY not initialized, bailing out\n");
>                 return 0;
> @@ -719,14 +1398,19 @@ static int __maybe_unused qmp_usbc_runtime_resume(=
struct device *dev)
>         if (ret)
>                 return ret;
>
> -       ret =3D clk_prepare_enable(qmp->pipe_clk);
> -       if (ret) {
> -               dev_err(dev, "pipe_clk enable failed, err=3D%d\n", ret);
> -               clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> -               return ret;
> -       }
> +       if (qmp->type =3D=3D QMP_PHY_USBC_USB) {
> +               struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
>
> -       qmp_usbc_disable_autonomous_mode(qmp);
> +               dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", layout->mode=
);
> +               ret =3D clk_prepare_enable(layout->pipe_clk);
> +               if (ret) {
> +                       dev_err(dev, "pipe_clk enable failed, err=3D%d\n"=
, ret);
> +                       clk_bulk_disable_unprepare(qmp->num_clks, qmp->cl=
ks);
> +                       return ret;
> +               }
> +
> +               qmp_usbc_disable_autonomous_mode(qmp);
> +       }
>
>         return 0;
>  }
> @@ -738,19 +1422,54 @@ static const struct dev_pm_ops qmp_usbc_pm_ops =3D=
 {
>
>  static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
>  {
> -       const struct qmp_phy_cfg *cfg =3D qmp->cfg;
>         struct device *dev =3D qmp->dev;
> -       int num =3D cfg->num_vregs;
> -       int i;
> +       int ret, i;
>
> -       qmp->vregs =3D devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KE=
RNEL);
> -       if (!qmp->vregs)
> -               return -ENOMEM;
> +       if (qmp->type =3D=3D QMP_PHY_USBC_USB) {
> +               struct qmp_phy_usb_cfg *cfg =3D to_usb_cfg(qmp);
> +               int num =3D cfg->num_vregs;
>
> -       for (i =3D 0; i < num; i++)
> -               qmp->vregs[i].supply =3D cfg->vreg_list[i];
> +               qmp->vregs =3D devm_kcalloc(dev, num, sizeof(*qmp->vregs)=
, GFP_KERNEL);
> +               if (!qmp->vregs)
> +                       return -ENOMEM;
> +
> +               for (i =3D 0; i < num; i++)
> +                       qmp->vregs[i].supply =3D cfg->vreg_list[i];
>
> -       return devm_regulator_bulk_get(dev, num, qmp->vregs);
> +               ret =3D devm_regulator_bulk_get(dev, num, qmp->vregs);
> +               if (ret) {
> +                       dev_err(dev, "failed at devm_regulator_bulk_get\n=
");
> +                       return ret;
> +               }
> +       } else {
> +               struct qmp_phy_dp_cfg *cfg =3D to_dp_cfg(qmp);
> +               int num =3D cfg->num_vregs;
> +
> +               qmp->vregs =3D devm_kcalloc(dev, num, sizeof(*qmp->vregs)=
, GFP_KERNEL);
> +               if (!qmp->vregs)
> +                       return -ENOMEM;
> +
> +               for (i =3D 0; i < num; i++)
> +                       qmp->vregs[i].supply =3D cfg->vreg_list[i].name;
> +
> +               ret =3D devm_regulator_bulk_get(dev, num, qmp->vregs);
> +               if (ret) {
> +                       dev_err(dev, "failed at devm_regulator_bulk_get\n=
");
> +                       return ret;
> +               }
> +
> +               for (i =3D 0; i < num; i++) {
> +                       ret =3D regulator_set_load(qmp->vregs[i].consumer=
,
> +                                               cfg->vreg_list[i].enable_=
load);
> +                       if (ret) {
> +                               dev_err(dev, "failed to set load at %s\n"=
,
> +                                       qmp->vregs[i].supply);
> +                               return ret;
> +                       }
> +               }
> +       }
> +
> +       return 0;
>  }
>
>  static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
> @@ -821,7 +1540,9 @@ static void phy_clk_release_provider(void *res)
>   */
>  static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_nod=
e *np)
>  {
> -       struct clk_fixed_rate *fixed =3D &qmp->pipe_clk_fixed;
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
> +
> +       struct clk_fixed_rate *fixed =3D &layout->pipe_clk_fixed;
>         struct clk_init_data init =3D { };
>         int ret;
>
> @@ -864,12 +1585,12 @@ static int qmp_usbc_typec_switch_set(struct typec_=
switch_dev *sw,
>         mutex_lock(&qmp->phy_mutex);
>         qmp->orientation =3D orientation;
>
> -       if (qmp->usb_init_count) {
> -               qmp_usbc_power_off(qmp->phy);
> -               qmp_usbc_exit(qmp->phy);
> +       if (qmp->init_count) {
> +               qmp_usbc_usb_power_off(qmp->phy);
> +               qmp_usbc_com_exit(qmp->phy);
>
> -               qmp_usbc_init(qmp->phy);
> -               qmp_usbc_power_on(qmp->phy);
> +               qmp_usbc_com_init(qmp->phy);
> +               qmp_usbc_usb_power_on(qmp->phy);
>         }
>
>         mutex_unlock(&qmp->phy_mutex);
> @@ -880,22 +1601,24 @@ static int qmp_usbc_typec_switch_set(struct typec_=
switch_dev *sw,
>  static void qmp_usbc_typec_unregister(void *data)
>  {
>         struct qmp_usbc *qmp =3D data;
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
>
> -       typec_switch_unregister(qmp->sw);
> +       typec_switch_unregister(layout->sw);
>  }
>
>  static int qmp_usbc_typec_switch_register(struct qmp_usbc *qmp)
>  {
>         struct typec_switch_desc sw_desc =3D {};
>         struct device *dev =3D qmp->dev;
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
>
>         sw_desc.drvdata =3D qmp;
>         sw_desc.fwnode =3D dev->fwnode;
>         sw_desc.set =3D qmp_usbc_typec_switch_set;
> -       qmp->sw =3D typec_switch_register(dev, &sw_desc);
> -       if (IS_ERR(qmp->sw)) {
> -               dev_err(dev, "Unable to register typec switch: %pe\n", qm=
p->sw);
> -               return PTR_ERR(qmp->sw);
> +       layout->sw =3D typec_switch_register(dev, &sw_desc);
> +       if (IS_ERR(layout->sw)) {
> +               dev_err(dev, "Unable to register typec switch: %pe\n", la=
yout->sw);
> +               return PTR_ERR(layout->sw);
>         }
>
>         return devm_add_action_or_reset(dev, qmp_usbc_typec_unregister, q=
mp);
> @@ -907,15 +1630,16 @@ static int qmp_usbc_typec_switch_register(struct q=
mp_usbc *qmp)
>  }
>  #endif
>
> -static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_=
node *np)
> +static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct dev=
ice_node *np)
>  {
>         struct platform_device *pdev =3D to_platform_device(qmp->dev);
>         struct device *dev =3D qmp->dev;
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
>         int ret;
>
> -       qmp->serdes =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(qmp->serdes))
> -               return PTR_ERR(qmp->serdes);
> +       layout->serdes =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(layout->serdes))
> +               return PTR_ERR(layout->serdes);
>
>         /*
>          * Get memory resources for the PHY:
> @@ -923,35 +1647,35 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usb=
c *qmp, struct device_node *np
>          * For dual lane PHYs: tx2 -> 3, rx2 -> 4, pcs_misc (optional) ->=
 5
>          * For single lane PHYs: pcs_misc (optional) -> 3.
>          */
> -       qmp->tx =3D devm_of_iomap(dev, np, 0, NULL);
> -       if (IS_ERR(qmp->tx))
> -               return PTR_ERR(qmp->tx);
> +       layout->tx =3D devm_of_iomap(dev, np, 0, NULL);
> +       if (IS_ERR(layout->tx))
> +               return PTR_ERR(layout->tx);
>
> -       qmp->rx =3D devm_of_iomap(dev, np, 1, NULL);
> -       if (IS_ERR(qmp->rx))
> -               return PTR_ERR(qmp->rx);
> +       layout->rx =3D devm_of_iomap(dev, np, 1, NULL);
> +       if (IS_ERR(layout->rx))
> +               return PTR_ERR(layout->rx);
>
> -       qmp->pcs =3D devm_of_iomap(dev, np, 2, NULL);
> -       if (IS_ERR(qmp->pcs))
> -               return PTR_ERR(qmp->pcs);
> +       layout->pcs =3D devm_of_iomap(dev, np, 2, NULL);
> +       if (IS_ERR(layout->pcs))
> +               return PTR_ERR(layout->pcs);
>
> -       qmp->tx2 =3D devm_of_iomap(dev, np, 3, NULL);
> -       if (IS_ERR(qmp->tx2))
> -               return PTR_ERR(qmp->tx2);
> +       layout->tx2 =3D devm_of_iomap(dev, np, 3, NULL);
> +       if (IS_ERR(layout->tx2))
> +               return PTR_ERR(layout->tx2);
>
> -       qmp->rx2 =3D devm_of_iomap(dev, np, 4, NULL);
> -       if (IS_ERR(qmp->rx2))
> -               return PTR_ERR(qmp->rx2);
> +       layout->rx2 =3D devm_of_iomap(dev, np, 4, NULL);
> +       if (IS_ERR(layout->rx2))
> +               return PTR_ERR(layout->rx2);
>
> -       qmp->pcs_misc =3D devm_of_iomap(dev, np, 5, NULL);
> -       if (IS_ERR(qmp->pcs_misc)) {
> +       layout->pcs_misc =3D devm_of_iomap(dev, np, 5, NULL);
> +       if (IS_ERR(layout->pcs_misc)) {
>                 dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
> -               qmp->pcs_misc =3D NULL;
> +               layout->pcs_misc =3D NULL;
>         }
>
> -       qmp->pipe_clk =3D devm_get_clk_from_child(dev, np, NULL);
> -       if (IS_ERR(qmp->pipe_clk)) {
> -               return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> +       layout->pipe_clk =3D devm_get_clk_from_child(dev, np, NULL);
> +       if (IS_ERR(layout->pipe_clk)) {
> +               return dev_err_probe(dev, PTR_ERR(layout->pipe_clk),
>                                      "failed to get pipe clock\n");
>         }
>
> @@ -969,11 +1693,12 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usb=
c *qmp, struct device_node *np
>         return 0;
>  }
>
> -static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
> +static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
>  {
>         struct platform_device *pdev =3D to_platform_device(qmp->dev);
> -       const struct qmp_phy_cfg *cfg =3D qmp->cfg;
> -       const struct qmp_usbc_offsets *offs =3D cfg->offsets;
> +       const struct qmp_phy_usb_cfg *cfg =3D to_usb_cfg(qmp);
> +       const struct qmp_usbc_usb_offsets *offs =3D cfg->offsets;
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
>         struct device *dev =3D qmp->dev;
>         void __iomem *base;
>         int ret;
> @@ -985,23 +1710,23 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
>
> -       qmp->serdes =3D base + offs->serdes;
> -       qmp->pcs =3D base + offs->pcs;
> +       layout->serdes =3D base + offs->serdes;
> +       layout->pcs =3D base + offs->pcs;
>         if (offs->pcs_misc)
> -               qmp->pcs_misc =3D base + offs->pcs_misc;
> -       qmp->tx =3D base + offs->tx;
> -       qmp->rx =3D base + offs->rx;
> +               layout->pcs_misc =3D base + offs->pcs_misc;
> +       layout->tx =3D base + offs->tx;
> +       layout->rx =3D base + offs->rx;
>
> -       qmp->tx2 =3D base + offs->tx2;
> -       qmp->rx2 =3D base + offs->rx2;
> +       layout->tx2 =3D base + offs->tx2;
> +       layout->rx2 =3D base + offs->rx2;
>
>         ret =3D qmp_usbc_clk_init(qmp);
>         if (ret)
>                 return ret;
>
> -       qmp->pipe_clk =3D devm_clk_get(dev, "pipe");
> -       if (IS_ERR(qmp->pipe_clk)) {
> -               return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> +       layout->pipe_clk =3D devm_clk_get(dev, "pipe");
> +       if (IS_ERR(layout->pipe_clk)) {
> +               return dev_err_probe(dev, PTR_ERR(layout->pipe_clk),
>                                      "failed to get pipe clock\n");
>         }
>
> @@ -1013,10 +1738,11 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp=
)
>         return 0;
>  }
>
> -static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
> +static int qmp_usbc_parse_usb_vls_clamp(struct qmp_usbc *qmp)
>  {
>         struct of_phandle_args tcsr_args;
>         struct device *dev =3D qmp->dev;
> +       struct qmp_phy_usb_layout *layout =3D to_usb_layout(qmp);
>         int ret;
>
>         /*  for backwards compatibility ignore if there is no property */
> @@ -1027,22 +1753,280 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_u=
sbc *qmp)
>         else if (ret < 0)
>                 return dev_err_probe(dev, ret, "Failed to parse qcom,tcsr=
-reg\n");
>
> -       qmp->tcsr_map =3D syscon_node_to_regmap(tcsr_args.np);
> +       layout->tcsr_map =3D syscon_node_to_regmap(tcsr_args.np);
>         of_node_put(tcsr_args.np);
> -       if (IS_ERR(qmp->tcsr_map))
> -               return PTR_ERR(qmp->tcsr_map);
> +       if (IS_ERR(layout->tcsr_map))
> +               return PTR_ERR(layout->tcsr_map);
>
> -       qmp->vls_clamp_reg =3D tcsr_args.args[0];
> +       layout->vls_clamp_reg =3D tcsr_args.args[0];
>
>         return 0;
>  }
>
> +static int qmp_usbc_parse_dp_phy_mode(struct qmp_usbc *qmp)
> +{
> +       struct of_phandle_args tcsr_args;
> +       struct device *dev =3D qmp->dev;
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       int ret;
> +
> +       /*  for backwards compatibility ignore if there is no property */
> +       ret =3D of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr=
-reg", 1, 0,
> +                                              &tcsr_args);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to parse qcom,tcsr=
-reg\n");
> +
> +       layout->tcsr_map =3D syscon_node_to_regmap(tcsr_args.np);
> +       of_node_put(tcsr_args.np);
> +       if (IS_ERR(layout->tcsr_map))
> +               return PTR_ERR(layout->tcsr_map);
> +
> +       layout->dp_phy_mode =3D tcsr_args.args[0];
> +
> +       return 0;
> +}
> +
> +static int qmp_usbc_parse_dp_dt(struct qmp_usbc *qmp)
> +{
> +       struct platform_device *pdev =3D to_platform_device(qmp->dev);
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +       struct qmp_phy_dp_cfg *cfg =3D to_dp_cfg(qmp);
> +       const struct qmp_usbc_dp_offsets *offs =3D cfg->offsets;
> +       struct device *dev =3D qmp->dev;
> +       void __iomem *base;
> +       int ret;
> +
> +       base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base)) {
> +               dev_err(dev, "get resource fail, ret:%d\n", ret);
> +               return PTR_ERR(base);
> +       }
> +
> +       layout->dp_serdes =3D base + offs->dp_serdes;
> +       layout->dp_tx =3D base + offs->dp_txa;
> +       layout->dp_tx2 =3D base + offs->dp_txb;
> +       layout->dp_phy =3D base + offs->dp_phy;
> +
> +       ret =3D qmp_usbc_clk_init(qmp);
> +       if (ret) {
> +               dev_err(dev, "clk init fail, ret:%d\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D qmp_usbc_reset_init(qmp, dp_usb3phy_reset_l,
> +                                ARRAY_SIZE(dp_usb3phy_reset_l));
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +/*
> + * Display Port PLL driver block diagram for branch clocks
> + *
> + *              +------------------------------+
> + *              |         DP_VCO_CLK           |
> + *              |                              |
> + *              |    +-------------------+     |
> + *              |    |   (DP PLL/VCO)    |     |
> + *              |    +---------+---------+     |
> + *              |              v               |
> + *              |   +----------+-----------+   |
> + *              |   | hsclk_divsel_clk_src |   |
> + *              |   +----------+-----------+   |
> + *              +------------------------------+
> + *                              |
> + *          +---------<---------v------------>----------+
> + *          |                                           |
> + * +--------v----------------+                          |
> + * |    dp_phy_pll_link_clk  |                          |
> + * |     link_clk            |                          |
> + * +--------+----------------+                          |
> + *          |                                           |
> + *          |                                           |
> + *          v                                           v
> + * Input to DISPCC block                                |
> + * for link clk, crypto clk                             |
> + * and interface clock                                  |
> + *                                                      |
> + *                                                      |
> + *      +--------<------------+-----------------+---<---+
> + *      |                     |                 |
> + * +----v---------+  +--------v-----+  +--------v------+
> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
> + * |              |  |              |  |               |
> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
> + * +-------+------+  +-----+--------+  +--------+------+
> + *         |                 |                  |
> + *         v---->----------v-------------<------v
> + *                         |
> + *              +----------+-----------------+
> + *              |   dp_phy_pll_vco_div_clk   |
> + *              +---------+------------------+
> + *                        |
> + *                        v
> + *              Input to DISPCC block
> + *              for DP pixel clock
> + *
> + */
> +static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk=
_rate_request *req)
> +{
> +       switch (req->rate) {
> +       case 1620000000UL / 2:
> +       case 2700000000UL / 2:
> +       /* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and d=
iv 6 */
> +               return 0;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, uns=
igned long parent_rate)
> +{
> +       // const struct qmp_usbc *qmp;
> +       struct qmp_phy_dp_layout *layout;
> +       const struct phy_configure_opts_dp *dp_opts;
> +
> +       layout =3D container_of(hw, struct qmp_phy_dp_layout, dp_pixel_hw=
);
> +
> +       dp_opts =3D &layout->dp_opts;
> +
> +       switch (dp_opts->link_rate) {
> +       case 1620:
> +               return 1620000000UL / 2;
> +       case 2700:
> +               return 2700000000UL / 2;
> +       case 5400:
> +               return 5400000000UL / 4;
> +       case 8100:
> +               return 8100000000UL / 6;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static const struct clk_ops qmp_dp_pixel_clk_ops =3D {
> +       .determine_rate =3D qmp_dp_pixel_clk_determine_rate,
> +       .recalc_rate    =3D qmp_dp_pixel_clk_recalc_rate,
> +};
> +
> +static int qmp_dp_link_clk_determine_rate(struct clk_hw *hw, struct clk_=
rate_request *req)
> +{
> +       switch (req->rate) {
> +       case 162000000:
> +       case 270000000:
> +       case 540000000:
> +       case 810000000:
> +               return 0;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static unsigned long qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsi=
gned long parent_rate)
> +{
> +       // const struct qmp_combo *qmp;
> +       struct qmp_phy_dp_layout *layout;
> +       const struct phy_configure_opts_dp *dp_opts;
> +
> +       layout =3D container_of(hw, struct qmp_phy_dp_layout, dp_link_hw)=
;
> +       dp_opts =3D &layout->dp_opts;
> +
> +       switch (dp_opts->link_rate) {
> +       case 1620:
> +       case 2700:
> +       case 5400:
> +       case 8100:
> +               return dp_opts->link_rate * 100000;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static const struct clk_ops qmp_dp_link_clk_ops =3D {
> +       .determine_rate =3D qmp_dp_link_clk_determine_rate,
> +       .recalc_rate    =3D qmp_dp_link_clk_recalc_rate,
> +};
> +
> +static int phy_dp_clks_register(struct qmp_usbc *qmp, struct device_node=
 *np)
> +{
> +       struct clk_init_data init =3D { };
> +       int ret =3D 0;
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +
> +       ret =3D of_property_read_string_index(np, "clock-output-names", 0=
, &init.name);
> +       if (ret < 0) {
> +               dev_err(qmp->dev, "%pOFn: No link clock-output-names\n", =
np);
> +               return ret;
> +       }
> +
> +       init.ops =3D &qmp_dp_link_clk_ops;
> +       layout->dp_link_hw.init =3D &init;
> +       ret =3D devm_clk_hw_register(qmp->dev, &layout->dp_link_hw);
> +       if (ret < 0) {
> +               dev_err(qmp->dev, "link clk reg fail ret=3D%d\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D of_property_read_string_index(np, "clock-output-names", 1=
, &init.name);
> +       if (ret) {
> +               dev_err(qmp->dev, "%pOFn: No div clock-output-names\n", n=
p);
> +               return ret;
> +       }
> +
> +       init.ops =3D &qmp_dp_pixel_clk_ops;
> +       layout->dp_pixel_hw.init =3D &init;
> +       ret =3D devm_clk_hw_register(qmp->dev, &layout->dp_pixel_hw);
> +       if (ret) {
> +               dev_err(qmp->dev, "pxl clk reg fail ret=3D%d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct clk_hw *qmp_dp_clks_hw_get(struct of_phandle_args *clkspec=
, void *data)
> +{
> +       struct qmp_usbc *qmp =3D data;
> +       struct qmp_phy_dp_layout *layout =3D to_dp_layout(qmp);
> +
> +       switch (clkspec->args[0]) {
> +       case QMP_USB43DP_DP_LINK_CLK:
> +               return &layout->dp_link_hw;
> +       case QMP_USB43DP_DP_VCO_DIV_CLK:
> +               return &layout->dp_pixel_hw;
> +       }
> +
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +static int qmp_dp_register_clocks(struct qmp_usbc *qmp, struct device_no=
de *dp_np)
> +{
> +       int ret;
> +
> +       ret =3D phy_dp_clks_register(qmp, dp_np);
> +       if (ret) {
> +               dev_err(qmp->dev, "dp clk reg fail ret:%d\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D of_clk_add_hw_provider(dp_np, qmp_dp_clks_hw_get, qmp);
> +       if (ret) {
> +               dev_err(qmp->dev, "add provider fail ret:%d\n", ret);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(qmp->dev, phy_clk_release_provide=
r, dp_np);
> +}
> +
>  static int qmp_usbc_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct phy_provider *phy_provider;
>         struct device_node *np;
>         struct qmp_usbc *qmp;
> +       const struct dev_cfg *data_cfg;
>         int ret;
>
>         qmp =3D devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
> @@ -1050,38 +2034,74 @@ static int qmp_usbc_probe(struct platform_device =
*pdev)
>                 return -ENOMEM;
>
>         qmp->dev =3D dev;
> -       dev_set_drvdata(dev, qmp);
>
>         qmp->orientation =3D TYPEC_ORIENTATION_NORMAL;
>
> -       qmp->cfg =3D of_device_get_match_data(dev);
> -       if (!qmp->cfg)
> +       qmp->init_count =3D 0;
> +
> +       data_cfg =3D of_device_get_match_data(dev);
> +       if (!data_cfg) {
> +               dev_err(qmp->dev, "get data fail\n");
>                 return -EINVAL;
> +       }
>
>         mutex_init(&qmp->phy_mutex);
>
> -       ret =3D qmp_usbc_vreg_init(qmp);
> -       if (ret)
> -               return ret;
> +       qmp->type =3D data_cfg->type;
> +       qmp->cfg =3D data_cfg->cfg;
>
> -       ret =3D qmp_usbc_typec_switch_register(qmp);
> -       if (ret)
> +       ret =3D qmp_usbc_vreg_init(qmp);
> +       if (ret) {
> +               dev_err(qmp->dev, "qmp_type(%d) vreg init fail\n", qmp->t=
ype);
>                 return ret;
> +       }
>
> -       ret =3D qmp_usbc_parse_vls_clamp(qmp);
> -       if (ret)
> -               return ret;
> +       if (qmp->type =3D=3D QMP_PHY_USBC_USB) {
> +               qmp->layout =3D devm_kzalloc(dev, sizeof(struct qmp_phy_u=
sb_layout), GFP_KERNEL);
> +               if (!qmp->layout)
> +                       return -ENOMEM;
> +
> +               ret =3D qmp_usbc_typec_switch_register(qmp);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D qmp_usbc_parse_usb_vls_clamp(qmp);
> +               if (ret)
> +                       return ret;
> +
> +               /* Check for legacy binding with child node. */
> +               np =3D of_get_child_by_name(dev->of_node, "phy");
> +               if (np) {
> +                       ret =3D qmp_usbc_parse_usb_dt_legacy(qmp, np);
> +               } else {
> +                       np =3D of_node_get(dev->of_node);
> +                       ret =3D qmp_usbc_parse_usb_dt(qmp);
> +               }
> +               if (ret)
> +                       goto err_node_put;
> +       } else if (qmp->type =3D=3D QMP_PHY_USBC_DP) {
> +               qmp->layout =3D devm_kzalloc(dev, sizeof(struct qmp_phy_d=
p_layout), GFP_KERNEL);
> +               if (!qmp->layout)
> +                       return -ENOMEM;
>
> -       /* Check for legacy binding with child node. */
> -       np =3D of_get_child_by_name(dev->of_node, "phy");
> -       if (np) {
> -               ret =3D qmp_usbc_parse_dt_legacy(qmp, np);
> -       } else {
>                 np =3D of_node_get(dev->of_node);
> -               ret =3D qmp_usbc_parse_dt(qmp);
> -       }
> -       if (ret)
> +               ret =3D qmp_usbc_parse_dp_phy_mode(qmp);
> +               if (ret)
> +                       goto err_node_put;
> +
> +               ret =3D qmp_usbc_parse_dp_dt(qmp);
> +               if (ret)
> +                       goto err_node_put;
> +
> +               ret =3D drm_aux_bridge_register(dev);
> +               if (ret) {
> +                       dev_err(qmp->dev, "aux bridge reg fail ret=3D%d\n=
", ret);
> +                       goto err_node_put;
> +               }
> +       } else {
> +               dev_err(dev, "invalid phy type: %d\n", qmp->type);
>                 goto err_node_put;
> +       }
>
>         pm_runtime_set_active(dev);
>         ret =3D devm_pm_runtime_enable(dev);
> @@ -1093,19 +2113,33 @@ static int qmp_usbc_probe(struct platform_device =
*pdev)
>          */
>         pm_runtime_forbid(dev);
>
> -       ret =3D phy_pipe_clk_register(qmp, np);
> -       if (ret)
> -               goto err_node_put;
> -
> -       qmp->phy =3D devm_phy_create(dev, np, &qmp_usbc_phy_ops);
> -       if (IS_ERR(qmp->phy)) {
> -               ret =3D PTR_ERR(qmp->phy);
> -               dev_err(dev, "failed to create PHY: %d\n", ret);
> -               goto err_node_put;
> +       if (qmp->type =3D=3D QMP_PHY_USBC_USB) {
> +               // pipe clk process
> +               ret =3D phy_pipe_clk_register(qmp, np);
> +               if (ret)
> +                       goto err_node_put;
> +
> +               qmp->phy =3D devm_phy_create(dev, np, &qmp_usbc_usb_phy_o=
ps);
> +               if (IS_ERR(qmp->phy)) {
> +                       ret =3D PTR_ERR(qmp->phy);
> +                       dev_err(dev, "failed to create PHY: %d\n", ret);
> +                       goto err_node_put;
> +               }
> +       } else {
> +               ret =3D qmp_dp_register_clocks(qmp, np);
> +               if (ret)
> +                       goto err_node_put;
> +
> +               qmp->phy =3D devm_phy_create(dev, np, &qmp_usbc_dp_phy_op=
s);
> +               if (IS_ERR(qmp->phy)) {
> +                       ret =3D PTR_ERR(qmp->phy);
> +                       dev_err(dev, "failed to create PHY: %d\n", ret);
> +                       goto err_node_put;
> +               }
>         }
>
>         phy_set_drvdata(qmp->phy, qmp);
> -
> +       dev_set_drvdata(dev, qmp);
>         of_node_put(np);
>
>         phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple=
_xlate);
> @@ -1120,19 +2154,38 @@ static int qmp_usbc_probe(struct platform_device =
*pdev)
>  static const struct of_device_id qmp_usbc_of_match_table[] =3D {
>         {
>                 .compatible =3D "qcom,msm8998-qmp-usb3-phy",
> -               .data =3D &msm8998_usb3phy_cfg,
> +               .data =3D  &(struct dev_cfg) {
> +                       .type =3D QMP_PHY_USBC_USB,
> +                       .cfg =3D &msm8998_usb3phy_cfg,
> +               },
>         }, {
>                 .compatible =3D "qcom,qcm2290-qmp-usb3-phy",
> -               .data =3D &qcm2290_usb3phy_cfg,
> +               .data =3D  &(struct dev_cfg) {
> +                       .type =3D QMP_PHY_USBC_USB,
> +                       .cfg =3D &qcm2290_usb3phy_cfg,
> +               },
> +       }, {
> +               .compatible =3D "qcom,qcs615-qmp-dp-phy",
> +               .data =3D  &(struct dev_cfg) {
> +                       .type =3D QMP_PHY_USBC_DP,
> +                       .cfg =3D &qcs615_dpphy_cfg,
> +               },
>         }, {
>                 .compatible =3D "qcom,sdm660-qmp-usb3-phy",
> -               .data =3D &sdm660_usb3phy_cfg,
> +               .data =3D  &(struct dev_cfg) {
> +                       .type =3D QMP_PHY_USBC_USB,
> +                       .cfg =3D &sdm660_usb3phy_cfg,
> +               },
>         }, {
>                 .compatible =3D "qcom,sm6115-qmp-usb3-phy",
> -               .data =3D &qcm2290_usb3phy_cfg,
> +               .data =3D  &(struct dev_cfg) {
> +                       .type =3D QMP_PHY_USBC_USB,
> +                       .cfg =3D &qcm2290_usb3phy_cfg,
> +               },
>         },
>         { },
>  };
> +
>  MODULE_DEVICE_TABLE(of, qmp_usbc_of_match_table);
>
>  static struct platform_driver qmp_usbc_driver =3D {
>
> --
> 2.25.1
>


--=20
With best wishes
Dmitry
