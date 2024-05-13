Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978DE8C45BD
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B67C10E8BE;
	Mon, 13 May 2024 17:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tWSFBrX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9555610E8BE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:10:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D67D860DB7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87178C113CC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715620237;
 bh=Ow7ES7ABB/hlYbM0TfIvANfNu1VvDM7zdASVvaJXsuo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tWSFBrX4ppP7HrKjmkv8ncDzZEmaDRN/plttnztJxK3BCwd27bRBQ2TUbas+JELLw
 +PcaTOvLkT6oT/UwHVEgYyF2FP6vhUbKNdWP21dVO4HuyqqYO/jkQLIW9stWkeW1bl
 pQo9xEUyweyDWDbyk9tHmsoEZm2MMV0JKBrLTvt+TBetjaSbuOQlYsZ7Nw5WL6Jhij
 JCu/Tknn0HCVSPSfCbgMjjOSxIUPYeZVVR26A3bP3Ma7OV5g90ZWQwnnA96PokCTyy
 wPh9hlM9ri04z3Q4aqpKAZRyxDFH/xZ3Kt4C9bu9eW8Jfl/9pQpTjHCGWZcPlblPJ0
 6ZWlSicx/4rIQ==
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5b2a2ef4e4cso1350860eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:10:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YwNA3e7lz3sxWblMql4soj1CqvjWB6YkqzUhOPW1/Cm0iBwDGxS
 6VE2i3QKGeWIRBp8scFFBIB+px3KaCoXTi2nzMDdEeKvjdNgqlm14VWi6p4cPhlg92F9BvoqbfF
 WX6UDJVo29+Gux/XvN4hg+2B/XlIIwCHfRICfbQ==
X-Google-Smtp-Source: AGHT+IGlqHf3xQ3SnUkv+moS8kskuEVrSYy9Pmplg7qCZuWLNcm3lghOawCcvftXlcsM77rEo30rUf5vFJKQ9zd6EBE=
X-Received: by 2002:a05:6870:6783:b0:23a:980f:1fb8 with SMTP id
 586e51a60fabf-24172fb5f20mr12647618fac.53.1715620236976; Mon, 13 May 2024
 10:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715347488.git.jani.nikula@intel.com>
 <1d1290829fa463237b560c43e77170a986186031.1715347488.git.jani.nikula@intel.com>
In-Reply-To: <1d1290829fa463237b560c43e77170a986186031.1715347488.git.jani.nikula@intel.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 19:10:25 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7ecz7fg1H8_KsPNewMXjuHjDGdM=ibqTWpL6WCqTKifA@mail.gmail.com>
Message-ID: <CAN6tsi7ecz7fg1H8_KsPNewMXjuHjDGdM=ibqTWpL6WCqTKifA@mail.gmail.com>
Subject: Re: [RESEND 3/6] drm/bridge: anx7625: use struct drm_edid more
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
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

On Fri, May 10, 2024 at 3:26=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Prefer struct drm_edid based functions over struct edid.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 26 +++++++++++++++--------
>  drivers/gpu/drm/bridge/analogix/anx7625.h | 10 ++-------
>  2 files changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 59e9ad349969..d19975c5e5e5 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -464,9 +464,11 @@ static int anx7625_odfc_config(struct anx7625_data *=
ctx,
>   */
>  static int anx7625_set_k_value(struct anx7625_data *ctx)
>  {
> -       struct edid *edid =3D (struct edid *)ctx->slimport_edid_p.edid_ra=
w_data;
> +       struct drm_edid_product_id id;
>
> -       if (edid->mfg_id[0] =3D=3D IVO_MID0 && edid->mfg_id[1] =3D=3D IVO=
_MID1)
> +       drm_edid_get_product_id(ctx->cached_drm_edid, &id);
> +
> +       if (be16_to_cpu(id.manufacturer_name) =3D=3D IVO_MID)
>                 return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
>                                          MIPI_DIGITAL_ADJ_1, 0x3B);
>
> @@ -1526,7 +1528,8 @@ static int anx7625_wait_hpd_asserted(struct drm_dp_=
aux *aux,
>
>  static void anx7625_remove_edid(struct anx7625_data *ctx)
>  {
> -       ctx->slimport_edid_p.edid_block_num =3D -1;
> +       drm_edid_free(ctx->cached_drm_edid);
> +       ctx->cached_drm_edid =3D NULL;
>  }
>
>  static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> @@ -1787,27 +1790,32 @@ static ssize_t anx7625_aux_transfer(struct drm_dp=
_aux *aux,
>  static const struct drm_edid *anx7625_edid_read(struct anx7625_data *ctx=
)
>  {
>         struct device *dev =3D ctx->dev;
> -       struct s_edid_data *p_edid =3D &ctx->slimport_edid_p;
> +       u8 *edid_buf;
>         int edid_num;
>
> -       if (ctx->slimport_edid_p.edid_block_num > 0)
> +       if (ctx->cached_drm_edid)
>                 goto out;
>
> +       edid_buf =3D kmalloc(FOUR_BLOCK_SIZE, GFP_KERNEL);
> +       if (!edid_buf)
> +               return NULL;
> +
>         pm_runtime_get_sync(dev);
>         _anx7625_hpd_polling(ctx, 5000 * 100);
> -       edid_num =3D sp_tx_edid_read(ctx, p_edid->edid_raw_data);
> +       edid_num =3D sp_tx_edid_read(ctx, edid_buf);
>         pm_runtime_put_sync(dev);
>
>         if (edid_num < 1) {
>                 DRM_DEV_ERROR(dev, "Fail to read EDID: %d\n", edid_num);
> +               kfree(edid_buf);
>                 return NULL;
>         }
>
> -       p_edid->edid_block_num =3D edid_num;
> +       ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, FOUR_BLOCK_SIZE=
);
> +       kfree(edid_buf);
>
>  out:
> -       return drm_edid_alloc(ctx->slimport_edid_p.edid_raw_data,
> -                             FOUR_BLOCK_SIZE);
> +       return drm_edid_dup(ctx->cached_drm_edid);
>  }
>
>  static enum drm_connector_status anx7625_sink_detect(struct anx7625_data=
 *ctx)
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/=
bridge/analogix/anx7625.h
> index 39ed35d33836..eb5580f1ab2f 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -286,8 +286,7 @@
>
>  #define  MIPI_LANE_CTRL_10               0x0F
>  #define  MIPI_DIGITAL_ADJ_1     0x1B
> -#define  IVO_MID0               0x26
> -#define  IVO_MID1               0xCF
> +#define  IVO_MID                0x26CF
>
>  #define  MIPI_PLL_M_NUM_23_16   0x1E
>  #define  MIPI_PLL_M_NUM_15_8    0x1F
> @@ -417,11 +416,6 @@ enum audio_wd_len {
>  #define EDID_TRY_CNT   3
>  #define SUPPORT_PIXEL_CLOCK    300000
>
> -struct s_edid_data {
> -       int edid_block_num;
> -       u8 edid_raw_data[FOUR_BLOCK_SIZE];
> -};
> -
>  /***************** Display End *****************/
>
>  #define MAX_LANES_SUPPORT      4
> @@ -466,7 +460,7 @@ struct anx7625_data {
>         struct anx7625_i2c_client i2c;
>         struct i2c_client *last_client;
>         struct timer_list hdcp_timer;
> -       struct s_edid_data slimport_edid_p;
> +       const struct drm_edid *cached_drm_edid;
>         struct device *codec_dev;
>         hdmi_codec_plugged_cb plugged_cb;
>         struct work_struct work;
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
