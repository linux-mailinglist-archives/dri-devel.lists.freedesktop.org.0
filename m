Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF6A38234
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D429710E431;
	Mon, 17 Feb 2025 11:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ygejy6TW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22E710E431
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:48:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A28C55C557C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA9CC4CEFA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739792918;
 bh=6AuWktzY6GXWZqWoHH8TKVlj/PpqXBWhUvrWytubq/0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ygejy6TW8RneUvojKOD8IlfeiU6vnaLpTe4VkcY1/+iz4+yl5QrS85en2+ekOwNe/
 Mw9M2KmJZLSdQXrzBlQk4api551J6EeLKXLrjfhXJN4iGsd+jhyNsjIBC1KkUdwAYF
 VhkQ7JddiRvYFhC+Euc4m1eSgsApANxYiB+8lH33Xevi/LOwo4h5w1cEjzfOTxAW9d
 wsttO6yn9TbDxKmnPGsuEq6HfAp+J6rovi1Q2RSl6UgjOcE0VKuvQx+7M4BushfKdq
 rEW0xWYKcuCTlr5Z0HRCXpusex/+L3gOT4ICZHOdd8C2qTwEoZX1Cx5dEcIH13lqLt
 QRnL4Ica9H2jg==
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e5df8468d6eso137770276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 03:48:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxjsi/LZu2q7ldu/k74XsztzhltBEOKIcIiP8BDCf5eFdFVCc4+GbXRMUXanGL/u6yjIYjTocXjW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGUTa1B0pgxvK56VUbnI6HNv+Ny9VqqMVOPp1S7b3kVgisgcp8
 HYcel4zaclTR1W5FgZD3J1kUfvs9NO/HH9DsZW/yn9nKi8/7rbXIYRIUnUqmnAxxEHUJsJ5TX6W
 90T99Cfq5wqKtXLehIE26jOXX5Ws7iquIbxm6qg==
X-Google-Smtp-Source: AGHT+IHrdOXoOdJRqzkgskjCyFOUGGCH1w7vsJGjUCBazHT4Rh87Q/HYf21hg1yP0c4R+shwGko0W7TynLtpVunCzjo=
X-Received: by 2002:a05:6902:a8c:b0:e5d:d1bc:893d with SMTP id
 3f1490d57ef6-e5dd1bc89d0mr3057540276.41.1739792917095; Mon, 17 Feb 2025
 03:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20250214164528.534278-1-detlev.casanova@collabora.com>
 <20250214164528.534278-2-detlev.casanova@collabora.com>
In-Reply-To: <20250214164528.534278-2-detlev.casanova@collabora.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 17 Feb 2025 12:48:25 +0100
X-Gmail-Original-Message-ID: <CAN6tsi6NK-S88JcX1iwQrOvszGgMiKUcVap_u5ZcpHvQMSj8MA@mail.gmail.com>
X-Gm-Features: AWEUYZmfw2DgDH1sxFAkzDBWF9fnW9fRBxMKVLo1OfowmCrI56V4hcT-32dm_uw
Message-ID: <CAN6tsi6NK-S88JcX1iwQrOvszGgMiKUcVap_u5ZcpHvQMSj8MA@mail.gmail.com>
Subject: Re: [PATCH RESEND v6 1/3] drm/bridge: synopsys: Add audio support for
 dw-hdmi-qp
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Niklas Cassel <cassel@kernel.org>, 
 Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Johan Jonker <jbx6244@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com, 
 Quentin Schulz <quentin.schulz@cherry.de>
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

This patch has some checkpatch --strict warnings.

With those fixed, feel free to add my r-b.
Reviewed-by: Robert Foss <rfoss@kernel.org>

On Fri, Feb 14, 2025 at 5:47=E2=80=AFPM Detlev Casanova
<detlev.casanova@collabora.com> wrote:
>
> From: Sugar Zhang <sugar.zhang@rock-chips.com>
>
> Register the dw-hdmi-qp bridge driver as an HDMI audio codec.
>
> The register values computation functions (for n) are based on the
> downstream driver, as well as the register writing functions.
>
> The driver uses the generic HDMI Codec framework in order to implement
> the HDMI audio support.
>
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 489 +++++++++++++++++++
>  1 file changed, 489 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index b281cabfe992e..8d54e14663319 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -36,6 +36,88 @@
>
>  #define SCRAMB_POLL_DELAY_MS   3000
>
> +/*
> + * Unless otherwise noted, entries in this table are 100% optimization.
> + * Values can be obtained from dw_hdmi_qp_compute_n() but that function =
is
> + * slow so we pre-compute values we expect to see.
> + *
> + * The values for TMDS 25175, 25200, 27000, 54000, 74250 and 148500 kHz =
are
> + * the recommended N values specified in the Audio chapter of the HDMI
> + * specification.
> + */
> +static const struct dw_hdmi_audio_tmds_n {
> +       unsigned long tmds;
> +       unsigned int n_32k;
> +       unsigned int n_44k1;
> +       unsigned int n_48k;
> +} common_tmds_n_table[] =3D {
> +       { .tmds =3D 25175000,  .n_32k =3D 4576,  .n_44k1 =3D 7007,  .n_48=
k =3D 6864, },
> +       { .tmds =3D 25200000,  .n_32k =3D 4096,  .n_44k1 =3D 6272,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 27000000,  .n_32k =3D 4096,  .n_44k1 =3D 6272,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 28320000,  .n_32k =3D 4096,  .n_44k1 =3D 5586,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 30240000,  .n_32k =3D 4096,  .n_44k1 =3D 5642,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 31500000,  .n_32k =3D 4096,  .n_44k1 =3D 5600,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 32000000,  .n_32k =3D 4096,  .n_44k1 =3D 5733,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 33750000,  .n_32k =3D 4096,  .n_44k1 =3D 6272,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 36000000,  .n_32k =3D 4096,  .n_44k1 =3D 5684,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 40000000,  .n_32k =3D 4096,  .n_44k1 =3D 5733,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 49500000,  .n_32k =3D 4096,  .n_44k1 =3D 5488,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 50000000,  .n_32k =3D 4096,  .n_44k1 =3D 5292,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 54000000,  .n_32k =3D 4096,  .n_44k1 =3D 6272,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 65000000,  .n_32k =3D 4096,  .n_44k1 =3D 7056,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 68250000,  .n_32k =3D 4096,  .n_44k1 =3D 5376,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 71000000,  .n_32k =3D 4096,  .n_44k1 =3D 7056,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 72000000,  .n_32k =3D 4096,  .n_44k1 =3D 5635,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 73250000,  .n_32k =3D 11648, .n_44k1 =3D 14112, .n_48=
k =3D 6144, },
> +       { .tmds =3D 74250000,  .n_32k =3D 4096,  .n_44k1 =3D 6272,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 75000000,  .n_32k =3D 4096,  .n_44k1 =3D 5880,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 78750000,  .n_32k =3D 4096,  .n_44k1 =3D 5600,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 78800000,  .n_32k =3D 4096,  .n_44k1 =3D 5292,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 79500000,  .n_32k =3D 4096,  .n_44k1 =3D 4704,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 83500000,  .n_32k =3D 4096,  .n_44k1 =3D 7056,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 85500000,  .n_32k =3D 4096,  .n_44k1 =3D 5488,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 88750000,  .n_32k =3D 4096,  .n_44k1 =3D 14112, .n_48=
k =3D 6144, },
> +       { .tmds =3D 97750000,  .n_32k =3D 4096,  .n_44k1 =3D 14112, .n_48=
k =3D 6144, },
> +       { .tmds =3D 101000000, .n_32k =3D 4096,  .n_44k1 =3D 7056,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 106500000, .n_32k =3D 4096,  .n_44k1 =3D 4704,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 108000000, .n_32k =3D 4096,  .n_44k1 =3D 5684,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 115500000, .n_32k =3D 4096,  .n_44k1 =3D 5712,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 119000000, .n_32k =3D 4096,  .n_44k1 =3D 5544,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 135000000, .n_32k =3D 4096,  .n_44k1 =3D 5488,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 146250000, .n_32k =3D 11648, .n_44k1 =3D 6272,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 148500000, .n_32k =3D 4096,  .n_44k1 =3D 6272,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 154000000, .n_32k =3D 4096,  .n_44k1 =3D 5544,  .n_48=
k =3D 6144, },
> +       { .tmds =3D 162000000, .n_32k =3D 4096,  .n_44k1 =3D 5684,  .n_48=
k =3D 6144, },
> +
> +       /* For 297 MHz+ HDMI spec have some other rule for setting N */
> +       { .tmds =3D 297000000, .n_32k =3D 3073,  .n_44k1 =3D 4704,  .n_48=
k =3D 5120, },
> +       { .tmds =3D 594000000, .n_32k =3D 3073,  .n_44k1 =3D 9408,  .n_48=
k =3D 10240,},
> +
> +       /* End of table */
> +       { .tmds =3D 0,         .n_32k =3D 0,     .n_44k1 =3D 0,     .n_48=
k =3D 0,    },
> +};
> +
> +/*
> + * These are the CTS values as recommended in the Audio chapter of the H=
DMI
> + * specification.
> + */
> +static const struct dw_hdmi_audio_tmds_cts {
> +       unsigned long tmds;
> +       unsigned int cts_32k;
> +       unsigned int cts_44k1;
> +       unsigned int cts_48k;
> +} common_tmds_cts_table[] =3D {
> +       { .tmds =3D 25175000,  .cts_32k =3D 28125,  .cts_44k1 =3D 31250, =
 .cts_48k =3D 28125,  },
> +       { .tmds =3D 25200000,  .cts_32k =3D 25200,  .cts_44k1 =3D 28000, =
 .cts_48k =3D 25200,  },
> +       { .tmds =3D 27000000,  .cts_32k =3D 27000,  .cts_44k1 =3D 30000, =
 .cts_48k =3D 27000,  },
> +       { .tmds =3D 54000000,  .cts_32k =3D 54000,  .cts_44k1 =3D 60000, =
 .cts_48k =3D 54000,  },
> +       { .tmds =3D 74250000,  .cts_32k =3D 74250,  .cts_44k1 =3D 82500, =
 .cts_48k =3D 74250,  },
> +       { .tmds =3D 148500000, .cts_32k =3D 148500, .cts_44k1 =3D 165000,=
 .cts_48k =3D 148500, },
> +
> +       /* End of table */
> +       { .tmds =3D 0,         .cts_32k =3D 0,      .cts_44k1 =3D 0,     =
 .cts_48k =3D 0,      },
> +};
> +
>  struct dw_hdmi_qp_i2c {
>         struct i2c_adapter      adap;
>
> @@ -60,6 +142,8 @@ struct dw_hdmi_qp {
>         } phy;
>
>         struct regmap *regm;
> +
> +       unsigned long tmds_char_rate;
>  };
>
>  static void dw_hdmi_qp_write(struct dw_hdmi_qp *hdmi, unsigned int val,
> @@ -83,6 +167,346 @@ static void dw_hdmi_qp_mod(struct dw_hdmi_qp *hdmi, =
unsigned int data,
>         regmap_update_bits(hdmi->regm, reg, mask, data);
>  }
>
> +static struct dw_hdmi_qp *dw_hdmi_qp_from_bridge(struct drm_bridge *brid=
ge)
> +{
> +       return container_of(bridge, struct dw_hdmi_qp, bridge);
> +}
> +
> +static void dw_hdmi_qp_set_cts_n(struct dw_hdmi_qp *hdmi, unsigned int c=
ts,
> +                          unsigned int n)
> +{
> +       /* Set N */
> +       dw_hdmi_qp_mod(hdmi, n, AUDPKT_ACR_N_VALUE, AUDPKT_ACR_CONTROL0);
> +
> +       /* Set CTS */
> +       if (cts)
> +               dw_hdmi_qp_mod(hdmi, AUDPKT_ACR_CTS_OVR_EN, AUDPKT_ACR_CT=
S_OVR_EN_MSK,
> +                         AUDPKT_ACR_CONTROL1);
> +       else
> +               dw_hdmi_qp_mod(hdmi, 0, AUDPKT_ACR_CTS_OVR_EN_MSK,
> +                         AUDPKT_ACR_CONTROL1);
> +
> +       dw_hdmi_qp_mod(hdmi, AUDPKT_ACR_CTS_OVR_VAL(cts), AUDPKT_ACR_CTS_=
OVR_VAL_MSK,
> +                 AUDPKT_ACR_CONTROL1);
> +}
> +
> +static int dw_hdmi_qp_match_tmds_n_table(struct dw_hdmi_qp *hdmi,
> +                                  unsigned long pixel_clk,
> +                                  unsigned long freq)
> +{
> +       const struct dw_hdmi_audio_tmds_n *tmds_n =3D NULL;
> +       int i;
> +
> +       for (i =3D 0; common_tmds_n_table[i].tmds !=3D 0; i++) {
> +               if (pixel_clk =3D=3D common_tmds_n_table[i].tmds) {
> +                       tmds_n =3D &common_tmds_n_table[i];
> +                       break;
> +               }
> +       }
> +
> +       if (tmds_n =3D=3D NULL)
> +               return -ENOENT;
> +
> +       switch (freq) {
> +       case 32000:
> +               return tmds_n->n_32k;
> +       case 44100:
> +       case 88200:
> +       case 176400:
> +               return (freq / 44100) * tmds_n->n_44k1;
> +       case 48000:
> +       case 96000:
> +       case 192000:
> +               return (freq / 48000) * tmds_n->n_48k;
> +       default:
> +               return -ENOENT;
> +       }
> +}
> +
> +static u32 dw_hdmi_qp_audio_math_diff(unsigned int freq, unsigned int n,
> +                               unsigned int pixel_clk)
> +{
> +       u64 cts =3D mul_u32_u32(pixel_clk, n);
> +
> +       return do_div(cts, 128 * freq);
> +}
> +
> +static unsigned int dw_hdmi_qp_compute_n(struct dw_hdmi_qp *hdmi,
> +                                  unsigned long pixel_clk,
> +                                  unsigned long freq)
> +{
> +       unsigned int min_n =3D DIV_ROUND_UP((128 * freq), 1500);
> +       unsigned int max_n =3D (128 * freq) / 300;
> +       unsigned int ideal_n =3D (128 * freq) / 1000;
> +       unsigned int best_n_distance =3D ideal_n;
> +       unsigned int best_n =3D 0;
> +       u64 best_diff =3D U64_MAX;
> +       int n;
> +
> +       /* If the ideal N could satisfy the audio math, then just take it=
 */
> +       if (dw_hdmi_qp_audio_math_diff(freq, ideal_n, pixel_clk) =3D=3D 0=
)
> +               return ideal_n;
> +
> +       for (n =3D min_n; n <=3D max_n; n++) {
> +               u64 diff =3D dw_hdmi_qp_audio_math_diff(freq, n, pixel_cl=
k);
> +
> +               if (diff < best_diff || (diff =3D=3D best_diff &&
> +                   abs(n - ideal_n) < best_n_distance)) {
> +                       best_n =3D n;
> +                       best_diff =3D diff;
> +                       best_n_distance =3D abs(best_n - ideal_n);
> +               }
> +
> +               /*
> +                * The best N already satisfy the audio math, and also be
> +                * the closest value to ideal N, so just cut the loop.
> +                */
> +               if ((best_diff =3D=3D 0) && (abs(n - ideal_n) > best_n_di=
stance))
> +                       break;
> +       }
> +
> +       return best_n;
> +}
> +
> +static unsigned int dw_hdmi_qp_find_n(struct dw_hdmi_qp *hdmi, unsigned =
long pixel_clk,
> +                               unsigned long sample_rate)
> +{
> +       int n =3D dw_hdmi_qp_match_tmds_n_table(hdmi, pixel_clk, sample_r=
ate);
> +
> +       if (n > 0)
> +               return n;
> +
> +       dev_warn(hdmi->dev, "Rate %lu missing; compute N dynamically\n",
> +                pixel_clk);
> +
> +       return dw_hdmi_qp_compute_n(hdmi, pixel_clk, sample_rate);
> +}
> +
> +static unsigned int dw_hdmi_qp_find_cts(struct dw_hdmi_qp *hdmi, unsigne=
d long pixel_clk,
> +                                 unsigned long sample_rate)
> +{
> +       const struct dw_hdmi_audio_tmds_cts *tmds_cts =3D NULL;
> +       int i;
> +
> +       for (i =3D 0; common_tmds_cts_table[i].tmds !=3D 0; i++) {
> +               if (pixel_clk =3D=3D common_tmds_cts_table[i].tmds) {
> +                       tmds_cts =3D &common_tmds_cts_table[i];
> +                       break;
> +               }
> +       }
> +
> +       if (tmds_cts =3D=3D NULL)
> +               return 0;
> +
> +       switch (sample_rate) {
> +       case 32000:
> +               return tmds_cts->cts_32k;
> +       case 44100:
> +       case 88200:
> +       case 176400:
> +               return tmds_cts->cts_44k1;
> +       case 48000:
> +       case 96000:
> +       case 192000:
> +               return tmds_cts->cts_48k;
> +       default:
> +               return -ENOENT;
> +       }
> +}
> +
> +static void dw_hdmi_qp_set_audio_interface(struct dw_hdmi_qp *hdmi,
> +                                          struct hdmi_codec_daifmt *fmt,
> +                                          struct hdmi_codec_params *hpar=
ms)
> +{
> +       u32 conf0 =3D 0;
> +
> +       /* Reset the audio data path of the AVP */
> +       dw_hdmi_qp_write(hdmi, AVP_DATAPATH_PACKET_AUDIO_SWINIT_P, GLOBAL=
_SWRESET_REQUEST);
> +
> +       /* Disable AUDS, ACR, AUDI */
> +       dw_hdmi_qp_mod(hdmi, 0,
> +                 PKTSCHED_ACR_TX_EN | PKTSCHED_AUDS_TX_EN | PKTSCHED_AUD=
I_TX_EN,
> +                 PKTSCHED_PKT_EN);
> +
> +       /* Clear the audio FIFO */
> +       dw_hdmi_qp_write(hdmi, AUDIO_FIFO_CLR_P, AUDIO_INTERFACE_CONTROL0=
);
> +
> +       /* Select I2S interface as the audio source */
> +       dw_hdmi_qp_mod(hdmi, AUD_IF_I2S, AUD_IF_SEL_MSK, AUDIO_INTERFACE_=
CONFIG0);
> +
> +       /* Enable the active i2s lanes */
> +       switch (hparms->channels) {
> +       case 7 ... 8:
> +               conf0 |=3D I2S_LINES_EN(3);
> +               fallthrough;
> +       case 5 ... 6:
> +               conf0 |=3D I2S_LINES_EN(2);
> +               fallthrough;
> +       case 3 ... 4:
> +               conf0 |=3D I2S_LINES_EN(1);
> +               fallthrough;
> +       default:
> +               conf0 |=3D I2S_LINES_EN(0);
> +               break;
> +       }
> +
> +       dw_hdmi_qp_mod(hdmi, conf0, I2S_LINES_EN_MSK, AUDIO_INTERFACE_CON=
FIG0);
> +
> +       /*
> +        * Enable bpcuv generated internally for L-PCM, or received
> +        * from stream for NLPCM/HBR.
> +        */
> +       switch (fmt->bit_fmt) {
> +       case SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE:
> +               conf0 =3D (hparms->channels =3D=3D 8) ? AUD_HBR : AUD_ASP=
;
> +               conf0 |=3D I2S_BPCUV_RCV_EN;
> +               break;
> +       default:
> +               conf0 =3D AUD_ASP | I2S_BPCUV_RCV_DIS;
> +               break;
> +       }
> +
> +       dw_hdmi_qp_mod(hdmi, conf0, I2S_BPCUV_RCV_MSK | AUD_FORMAT_MSK,
> +                 AUDIO_INTERFACE_CONFIG0);
> +
> +       /* Enable audio FIFO auto clear when overflow */
> +       dw_hdmi_qp_mod(hdmi, AUD_FIFO_INIT_ON_OVF_EN, AUD_FIFO_INIT_ON_OV=
F_MSK,
> +                 AUDIO_INTERFACE_CONFIG0);
> +}
> +
> +/*
> + * When transmitting IEC60958 linear PCM audio, these registers allow to
> + * configure the channel status information of all the channel status
> + * bits in the IEC60958 frame. For the moment this configuration is only
> + * used when the I2S audio interface, General Purpose Audio (GPA),
> + * or AHB audio DMA (AHBAUDDMA) interface is active
> + * (for S/PDIF interface this information comes from the stream).
> + */
> +static void dw_hdmi_qp_set_channel_status(struct dw_hdmi_qp *hdmi,
> +                                         u8 *channel_status, bool ref2st=
ream)
> +{
> +       /*
> +        * AUDPKT_CHSTATUS_OVR0: { RSV, RSV, CS1, CS0 }
> +        * AUDPKT_CHSTATUS_OVR1: { CS6, CS5, CS4, CS3 }
> +        *
> +        *      |  7  |  6  |  5  |  4  |  3  |  2  |  1  |  0  |
> +        * CS0: |   Mode    |        d        |  c  |  b  |  a  |
> +        * CS1: |               Category Code                   |
> +        * CS2: |    Channel Number     |     Source Number     |
> +        * CS3: |    Clock Accuracy     |     Sample Freq       |
> +        * CS4: |    Ori Sample Freq    |     Word Length       |
> +        * CS5: |                                   |   CGMS-A  |
> +        * CS6~CS23: Reserved
> +        *
> +        * a: use of channel status block
> +        * b: linear PCM identification: 0 for lpcm, 1 for nlpcm
> +        * c: copyright information
> +        * d: additional format information
> +        */
> +
> +       if (ref2stream)
> +               channel_status[0] |=3D IEC958_AES0_NONAUDIO;
> +
> +       if ((dw_hdmi_qp_read(hdmi, AUDIO_INTERFACE_CONFIG0) & GENMASK(25,=
 24)) =3D=3D AUD_HBR) {
> +               /* fixup cs for HBR */
> +               channel_status[3] =3D (channel_status[3] & 0xf0) | IEC958=
_AES3_CON_FS_768000;
> +               channel_status[4] =3D (channel_status[4] & 0x0f) | IEC958=
_AES4_CON_ORIGFS_NOTID;
> +       }
> +
> +       dw_hdmi_qp_write(hdmi, channel_status[0] | (channel_status[1] << =
8),
> +                   AUDPKT_CHSTATUS_OVR0);
> +
> +       regmap_bulk_write(hdmi->regm, AUDPKT_CHSTATUS_OVR1, &channel_stat=
us[3], 1);
> +
> +       if (ref2stream)
> +               dw_hdmi_qp_mod(hdmi, 0,
> +                         AUDPKT_PBIT_FORCE_EN_MASK | AUDPKT_CHSTATUS_OVR=
_EN_MASK,
> +                         AUDPKT_CONTROL0);
> +       else
> +               dw_hdmi_qp_mod(hdmi, AUDPKT_PBIT_FORCE_EN | AUDPKT_CHSTAT=
US_OVR_EN,
> +                         AUDPKT_PBIT_FORCE_EN_MASK | AUDPKT_CHSTATUS_OVR=
_EN_MASK,
> +                         AUDPKT_CONTROL0);
> +}
> +
> +static void dw_hdmi_qp_set_sample_rate(struct dw_hdmi_qp *hdmi, unsigned=
 long long tmds_char_rate,
> +                                      unsigned int sample_rate)
> +{
> +       unsigned int n, cts;
> +
> +       n =3D dw_hdmi_qp_find_n(hdmi, tmds_char_rate, sample_rate);
> +       cts =3D dw_hdmi_qp_find_cts(hdmi, tmds_char_rate, sample_rate);
> +
> +       dw_hdmi_qp_set_cts_n(hdmi, cts, n);
> +}
> +
> +static int dw_hdmi_qp_audio_enable(struct drm_connector *connector,
> +                                  struct drm_bridge *bridge)
> +{
> +       struct dw_hdmi_qp *hdmi =3D dw_hdmi_qp_from_bridge(bridge);
> +
> +       if (hdmi->tmds_char_rate)
> +               dw_hdmi_qp_mod(hdmi, 0, AVP_DATAPATH_PACKET_AUDIO_SWDISAB=
LE, GLOBAL_SWDISABLE);
> +
> +       return 0;
> +}
> +
> +static int dw_hdmi_qp_audio_prepare(struct drm_connector *connector,
> +                                   struct drm_bridge *bridge,
> +                                   struct hdmi_codec_daifmt *fmt,
> +                                   struct hdmi_codec_params *hparms)
> +{
> +       struct dw_hdmi_qp *hdmi =3D dw_hdmi_qp_from_bridge(bridge);
> +       bool ref2stream =3D false;
> +
> +       if (!hdmi->tmds_char_rate)
> +               return -ENODEV;
> +
> +       if (fmt->bit_clk_provider | fmt->frame_clk_provider) {
> +               dev_err(hdmi->dev, "unsupported clock settings\n");
> +               return -EINVAL;
> +       }
> +
> +       if (fmt->bit_fmt =3D=3D SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
> +               ref2stream =3D true;
> +
> +       dw_hdmi_qp_set_audio_interface(hdmi, fmt, hparms);
> +       dw_hdmi_qp_set_sample_rate(hdmi, hdmi->tmds_char_rate, hparms->sa=
mple_rate);
> +       dw_hdmi_qp_set_channel_status(hdmi, hparms->iec.status, ref2strea=
m);
> +       drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector=
, &hparms->cea);
> +
> +       return 0;
> +}
> +
> +static void dw_hdmi_qp_audio_disable_regs(struct dw_hdmi_qp *hdmi)
> +{
> +       /*
> +        * Keep ACR, AUDI, AUDS packet always on to make SINK device
> +        * active for better compatibility and user experience.
> +        *
> +        * This also fix POP sound on some SINK devices which wakeup
> +        * from suspend to active.
> +        */
> +       dw_hdmi_qp_mod(hdmi, I2S_BPCUV_RCV_DIS, I2S_BPCUV_RCV_MSK,
> +                      AUDIO_INTERFACE_CONFIG0);
> +       dw_hdmi_qp_mod(hdmi, AUDPKT_PBIT_FORCE_EN | AUDPKT_CHSTATUS_OVR_E=
N,
> +                      AUDPKT_PBIT_FORCE_EN_MASK | AUDPKT_CHSTATUS_OVR_EN=
_MASK,
> +               AUDPKT_CONTROL0);
> +
> +       dw_hdmi_qp_mod(hdmi, AVP_DATAPATH_PACKET_AUDIO_SWDISABLE,
> +                      AVP_DATAPATH_PACKET_AUDIO_SWDISABLE, GLOBAL_SWDISA=
BLE);
> +}
> +
> +static void dw_hdmi_qp_audio_disable(struct drm_connector *connector,
> +                                    struct drm_bridge *bridge)
> +{
> +       struct dw_hdmi_qp *hdmi =3D dw_hdmi_qp_from_bridge(bridge);
> +
> +       drm_atomic_helper_connector_hdmi_clear_audio_infoframe(connector)=
;
> +
> +       if (hdmi->tmds_char_rate)
> +               dw_hdmi_qp_audio_disable_regs(hdmi);
> +}
> +
>  static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
>                                unsigned char *buf, unsigned int length)
>  {
> @@ -361,6 +785,51 @@ static int dw_hdmi_qp_config_drm_infoframe(struct dw=
_hdmi_qp *hdmi,
>         return 0;
>  }
>
> +/*
> + * Static values documented in the TRM
> + * Different values are only used for debug purposes
> + */
> +#define DW_HDMI_QP_AUDIO_INFOFRAME_HB1 0x1
> +#define DW_HDMI_QP_AUDIO_INFOFRAME_HB2 0xa
> +
> +static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
> +                                            const u8 *buffer, size_t len=
)
> +{
> +       /*
> +        * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
> +        * AUDI_CONTENTS1: { PB3, PB2, PB1, PB0 }
> +        * AUDI_CONTENTS2: { PB7, PB6, PB5, PB4 }
> +        *
> +        * PB0: CheckSum
> +        * PB1: | CT3    | CT2  | CT1  | CT0  | F13  | CC2 | CC1 | CC0 |
> +        * PB2: | F27    | F26  | F25  | SF2  | SF1  | SF0 | SS1 | SS0 |
> +        * PB3: | F37    | F36  | F35  | F34  | F33  | F32 | F31 | F30 |
> +        * PB4: | CA7    | CA6  | CA5  | CA4  | CA3  | CA2 | CA1 | CA0 |
> +        * PB5: | DM_INH | LSV3 | LSV2 | LSV1 | LSV0 | F52 | F51 | F50 |
> +        * PB6~PB10: Reserved
> +        *
> +        * AUDI_CONTENTS0 default value defined by HDMI specification,
> +        * and shall only be changed for debug purposes.
> +        */
> +       u32 header_bytes =3D (DW_HDMI_QP_AUDIO_INFOFRAME_HB1 << 8) |
> +                         (DW_HDMI_QP_AUDIO_INFOFRAME_HB2 << 16);
> +
> +       regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS0, &header_bytes, =
1);
> +       regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1);
> +       regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1);
> +
> +       /* Enable ACR, AUDI, AMD */
> +       dw_hdmi_qp_mod(hdmi,
> +                 PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD=
_TX_EN,
> +                 PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD=
_TX_EN,
> +                 PKTSCHED_PKT_EN);
> +
> +       /* Enable AUDS */
> +       dw_hdmi_qp_mod(hdmi, PKTSCHED_AUDS_TX_EN, PKTSCHED_AUDS_TX_EN, PK=
TSCHED_PKT_EN);
> +
> +       return 0;
> +}
> +
>  static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
>                                             struct drm_bridge_state *old_=
state)
>  {
> @@ -382,6 +851,7 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct dr=
m_bridge *bridge,
>                 dev_dbg(hdmi->dev, "%s mode=3DHDMI rate=3D%llu\n",
>                         __func__, conn_state->hdmi.tmds_char_rate);
>                 op_mode =3D 0;
> +               hdmi->tmds_char_rate =3D conn_state->hdmi.tmds_char_rate;
>         } else {
>                 dev_dbg(hdmi->dev, "%s mode=3DDVI\n", __func__);
>                 op_mode =3D OPMODE_DVI;
> @@ -400,6 +870,8 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct d=
rm_bridge *bridge,
>  {
>         struct dw_hdmi_qp *hdmi =3D bridge->driver_private;
>
> +       hdmi->tmds_char_rate =3D 0;
> +
>         hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
>  }
>
> @@ -455,6 +927,13 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct =
drm_bridge *bridge,
>                 dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_DRMI_TX_EN, PKTSCHED_PKT=
_EN);
>                 break;
>
> +       case HDMI_INFOFRAME_TYPE_AUDIO:
> +               dw_hdmi_qp_mod(hdmi, 0,
> +                              PKTSCHED_ACR_TX_EN |
> +                              PKTSCHED_AUDS_TX_EN |
> +                              PKTSCHED_AUDI_TX_EN,
> +                              PKTSCHED_PKT_EN);
> +               break;
>         default:
>                 dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", typ=
e);
>         }
> @@ -477,6 +956,9 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct d=
rm_bridge *bridge,
>         case HDMI_INFOFRAME_TYPE_DRM:
>                 return dw_hdmi_qp_config_drm_infoframe(hdmi, buffer, len)=
;
>
> +       case HDMI_INFOFRAME_TYPE_AUDIO:
> +               return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, le=
n);
> +
>         default:
>                 dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", typ=
e);
>                 return 0;
> @@ -494,6 +976,9 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridg=
e_funcs =3D {
>         .hdmi_tmds_char_rate_valid =3D dw_hdmi_qp_bridge_tmds_char_rate_v=
alid,
>         .hdmi_clear_infoframe =3D dw_hdmi_qp_bridge_clear_infoframe,
>         .hdmi_write_infoframe =3D dw_hdmi_qp_bridge_write_infoframe,
> +       .hdmi_audio_startup =3D dw_hdmi_qp_audio_enable,
> +       .hdmi_audio_shutdown =3D dw_hdmi_qp_audio_disable,
> +       .hdmi_audio_prepare =3D dw_hdmi_qp_audio_prepare,
>  };
>
>  static irqreturn_t dw_hdmi_qp_main_hardirq(int irq, void *dev_id)
> @@ -603,6 +1088,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_=
device *pdev,
>         if (IS_ERR(hdmi->bridge.ddc))
>                 return ERR_CAST(hdmi->bridge.ddc);
>
> +       hdmi->bridge.hdmi_audio_max_i2s_playback_channels =3D 8;
> +       hdmi->bridge.hdmi_audio_dev =3D dev;
> +       hdmi->bridge.hdmi_audio_dai_port =3D 1;
> +
>         ret =3D devm_drm_bridge_add(dev, &hdmi->bridge);
>         if (ret)
>                 return ERR_PTR(ret);
> --
> 2.48.1
>
