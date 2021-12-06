Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE9469567
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 13:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53A46FC6A;
	Mon,  6 Dec 2021 12:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B266FC6A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 12:05:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v11so21881324wrw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 04:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DTfXSCp/JPzgDcyt3jGZt9MsM0cGFh8qCD+yA0mXZ+c=;
 b=qhPg7BcAZOXnNwIzEPTfesJ4yJhadkyZkjCw+t4y1IxnC1AXJDfkUUnfOYrZ81+dk9
 WZugBuKXvhc5pV7pPevps/yKDxwwli0+/LAL3l24k49cBsRHtJD6S3ULnMvbSunjkI08
 pp5Teqw2Sj/k7nUH2N//Nzhyynw7adQq9L46ZkAr79kiGioweuGit3VWYJTGmZAzaOKZ
 kQq6WqWcVD0MOaS32jLgWg6bLg5qZcc0AYPZTq6nF64u5IQoIwb0YoS7sXShA4+AHFbg
 oEtSaBrXQJgQNdNMsr9HyIhc9WQRQ0+Hfi7Rbf73MrbkNyOgLq1N3+bqCbOyJL4u/9R9
 8epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DTfXSCp/JPzgDcyt3jGZt9MsM0cGFh8qCD+yA0mXZ+c=;
 b=xE+9ZOmH96LinK/+Hjww36PpI+UOqbx8B+BJlAxBxfKEY8Prx7LsYjVRMf9V9s3q/5
 ffY219F89hd2ASGRTz+apLo+vrf+ffEdHu0yqn2ft1rtLbxrYPMoxqbU0H75VhfuiNWU
 6A0opEywpL/LXQj7kZxAWCVdTHj4AqQ3stP9SukorTt07k2iamuODj9dyqzDg6MST0tY
 b5ClrEnePvBl6eQa/iQKkz6Sm4I+UJwja+1m7gUylsWFS5wmEYxF788uEKKudFc9URJN
 07nH2LzdxcePjetgcARZg/YVHBU6nDI6Q0DX8CqfnB1D7g8kefbjq6SboYvpzL1lfBib
 StiQ==
X-Gm-Message-State: AOAM530zHVWJKTu+79nGDU+Qi1kMltcu/71ahlivfihS5L1eraJOJRbL
 HBOewxjz5SNNfgkWbKMAxMR5C6r4P1tWQMFq0OLIWw==
X-Google-Smtp-Source: ABdhPJxWU5V24TGaIQd+2nfzr+2yB1LhFN7Pg3KA7VZf6mQYBzX3ePgCeI9ncxjjqkEwu6ZfsSoYnylGoZM34G1VwGo=
X-Received: by 2002:adf:a48e:: with SMTP id g14mr42695552wrb.474.1638792350510; 
 Mon, 06 Dec 2021 04:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20211206110140.119650-1-maxime@cerno.tech>
 <20211206110140.119650-4-maxime@cerno.tech>
In-Reply-To: <20211206110140.119650-4-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 6 Dec 2021 12:05:35 +0000
Message-ID: <CAPY8ntBxMgrz+zgyP0jUvMzh6ZqJC9gNYuCw1uZeg+o-wV50Ug@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/vc4: plane: Add support for YUV color
 encodings and ranges
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.org>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Dec 2021 at 11:02, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Minor note that we've changed to raspberrypi.com instead of .org, but
it currently forwards through anyway. The other two patches have the
.com address.

> The BT601/BT709 color encoding and limited vs full
> range properties were not being exposed, defaulting
> always to BT601 limited range.
>
> Expose the parameters and set the registers appropriately.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 71 +++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/vc4/vc4_regs.h  | 19 ++++++---
>  2 files changed, 82 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 18627b240a55..1155b0beb620 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -623,6 +623,51 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
>         return 0;
>  }
>
> +/*
> + * The colorspace conversion matrices are held in 3 entries in the dlist.
> + * Create an array of them, with entries for each full and limited mode, and
> + * each supported colorspace.
> + */
> +static const u32 colorspace_coeffs[2][DRM_COLOR_ENCODING_MAX][3] = {
> +       {
> +               /* Limited range */
> +               {
> +                       /* BT601 */
> +                       SCALER_CSC0_ITR_R_601_5,
> +                       SCALER_CSC1_ITR_R_601_5,
> +                       SCALER_CSC2_ITR_R_601_5,
> +               }, {
> +                       /* BT709 */
> +                       SCALER_CSC0_ITR_R_709_3,
> +                       SCALER_CSC1_ITR_R_709_3,
> +                       SCALER_CSC2_ITR_R_709_3,
> +               }, {
> +                       /* BT2020 */
> +                       SCALER_CSC0_ITR_R_2020,
> +                       SCALER_CSC1_ITR_R_2020,
> +                       SCALER_CSC2_ITR_R_2020,
> +               }
> +       }, {
> +               /* Full range */
> +               {
> +                       /* JFIF */
> +                       SCALER_CSC0_JPEG_JFIF,
> +                       SCALER_CSC1_JPEG_JFIF,
> +                       SCALER_CSC2_JPEG_JFIF,
> +               }, {
> +                       /* BT709 */
> +                       SCALER_CSC0_ITR_R_709_3_FR,
> +                       SCALER_CSC1_ITR_R_709_3_FR,
> +                       SCALER_CSC2_ITR_R_709_3_FR,
> +               }, {
> +                       /* BT2020 */
> +                       SCALER_CSC0_ITR_R_2020_FR,
> +                       SCALER_CSC1_ITR_R_2020_FR,
> +                       SCALER_CSC2_ITR_R_2020_FR,
> +               }
> +       }
> +};
> +
>  /* Writes out a full display list for an active plane to the plane's
>   * private dlist state.
>   */
> @@ -1018,9 +1063,20 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
>
>         /* Colorspace conversion words */
>         if (vc4_state->is_yuv) {
> -               vc4_dlist_write(vc4_state, SCALER_CSC0_ITR_R_601_5);
> -               vc4_dlist_write(vc4_state, SCALER_CSC1_ITR_R_601_5);
> -               vc4_dlist_write(vc4_state, SCALER_CSC2_ITR_R_601_5);
> +               enum drm_color_encoding color_encoding = state->color_encoding;
> +               enum drm_color_range color_range = state->color_range;
> +               const u32 *ccm;
> +
> +               if (color_encoding >= DRM_COLOR_ENCODING_MAX)
> +                       color_encoding = DRM_COLOR_YCBCR_BT601;
> +               if (color_range >= DRM_COLOR_RANGE_MAX)
> +                       color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
> +
> +               ccm = colorspace_coeffs[color_range][color_encoding];
> +
> +               vc4_dlist_write(vc4_state, ccm[0]);
> +               vc4_dlist_write(vc4_state, ccm[1]);
> +               vc4_dlist_write(vc4_state, ccm[2]);
>         }
>
>         vc4_state->lbm_offset = 0;
> @@ -1449,6 +1505,15 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
>                                            DRM_MODE_REFLECT_X |
>                                            DRM_MODE_REFLECT_Y);
>
> +       drm_plane_create_color_properties(plane,
> +                                         BIT(DRM_COLOR_YCBCR_BT601) |
> +                                         BIT(DRM_COLOR_YCBCR_BT709) |
> +                                         BIT(DRM_COLOR_YCBCR_BT2020),
> +                                         BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +                                         BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> +                                         DRM_COLOR_YCBCR_BT709,
> +                                         DRM_COLOR_YCBCR_LIMITED_RANGE);
> +
>         return plane;
>  }
>
> diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
> index 489f921ef44d..7538b84a6dca 100644
> --- a/drivers/gpu/drm/vc4/vc4_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_regs.h
> @@ -975,7 +975,10 @@ enum hvs_pixel_format {
>  #define SCALER_CSC0_COEF_CR_OFS_SHIFT          0
>  #define SCALER_CSC0_ITR_R_601_5                        0x00f00000
>  #define SCALER_CSC0_ITR_R_709_3                        0x00f00000
> +#define SCALER_CSC0_ITR_R_2020                 0x00f00000
>  #define SCALER_CSC0_JPEG_JFIF                  0x00000000
> +#define SCALER_CSC0_ITR_R_709_3_FR             0x00000000
> +#define SCALER_CSC0_ITR_R_2020_FR              0x00000000
>
>  /* S2.8 contribution of Cb to Green */
>  #define SCALER_CSC1_COEF_CB_GRN_MASK           VC4_MASK(31, 22)
> @@ -990,8 +993,11 @@ enum hvs_pixel_format {
>  #define SCALER_CSC1_COEF_CR_BLU_MASK           VC4_MASK(1, 0)
>  #define SCALER_CSC1_COEF_CR_BLU_SHIFT          0
>  #define SCALER_CSC1_ITR_R_601_5                        0xe73304a8
> -#define SCALER_CSC1_ITR_R_709_3                        0xf2b784a8
> -#define SCALER_CSC1_JPEG_JFIF                  0xea34a400
> +#define SCALER_CSC1_ITR_R_709_3                        0xf27784a8
> +#define SCALER_CSC1_ITR_R_2020                 0xf43594a8
> +#define SCALER_CSC1_JPEG_JFIF                  0xea349400
> +#define SCALER_CSC1_ITR_R_709_3_FR             0xf4388400
> +#define SCALER_CSC1_ITR_R_2020_FR              0xf5b6d400
>
>  /* S2.8 contribution of Cb to Red */
>  #define SCALER_CSC2_COEF_CB_RED_MASK           VC4_MASK(29, 20)
> @@ -1002,9 +1008,12 @@ enum hvs_pixel_format {
>  /* S2.8 contribution of Cb to Blue */
>  #define SCALER_CSC2_COEF_CB_BLU_MASK           VC4_MASK(19, 10)
>  #define SCALER_CSC2_COEF_CB_BLU_SHIFT          10
> -#define SCALER_CSC2_ITR_R_601_5                        0x00066204
> -#define SCALER_CSC2_ITR_R_709_3                        0x00072a1c
> -#define SCALER_CSC2_JPEG_JFIF                  0x000599c5
> +#define SCALER_CSC2_ITR_R_601_5                        0x00066604
> +#define SCALER_CSC2_ITR_R_709_3                        0x00072e1d
> +#define SCALER_CSC2_ITR_R_2020                 0x0006b624
> +#define SCALER_CSC2_JPEG_JFIF                  0x00059dc6
> +#define SCALER_CSC2_ITR_R_709_3_FR             0x00064ddb
> +#define SCALER_CSC2_ITR_R_2020_FR              0x0005e5e2
>
>  #define SCALER_TPZ0_VERT_RECALC                        BIT(31)
>  #define SCALER_TPZ0_SCALE_MASK                 VC4_MASK(28, 8)
> --
> 2.33.1
>
