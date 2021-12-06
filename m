Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D7B46955D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 13:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997056F595;
	Mon,  6 Dec 2021 12:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7818873D60
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 12:02:36 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id y196so7923473wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 04:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5OOhrORy9KFI+WutYrhfG2jyCngDDzM3LrLvx9uktzs=;
 b=MCQOMKxU5nEHbEE5Q/dtEsGjDsrrAqp9DrXt0RY0yeEwhOZqy6IpPqX+f/32HqEveq
 /Ia8hs6PbuRwU3MEnEcfLAtqGFbf1rY2URYzIDA+8+b3l6CP83anrTtyUC+3pBhg3y4s
 GCenet0S/N2h5aSSVnkCalP+kkEC8banaPNS1pTSnA4pHKxE1QewFGG71erhCWcTY0Q+
 Ub1pVv2T1jzWYU3Go8wmgdSSL7QlYf3id4rGMNiy8aITwRpmKba7MSmTCJtCuYRyci8a
 XZRqwiwqMnHR9kGg24BBBYmtHIGZiRKB67RIjsvb9YHUNWd8pp1hkNnRKd2nwMqfhqAK
 T+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5OOhrORy9KFI+WutYrhfG2jyCngDDzM3LrLvx9uktzs=;
 b=KbIB6M+e7AZK2Ld5tEu1fV9kLFMvrLe2pvnJXQNrKF34teXljuQTcmmTB5oIjG8Y+g
 7GSJ7t0hK5Gq7sUw01n/QWD2I3exzW2VJU0DMNN2GF38FR6V1DexODESxRzMlGOo8GkU
 SGEz75lhtUIgcOqkOUBIioNGx7zfAChX2UXyr3mUzORdcBxKE4lC2JtdLSIE7jLwX/Dj
 k+nsqaNs3Hdw5XKz6J1PMvTtn05jW8LwjWd3Kw1Ngjukh7VQ0tYG45J7Hzrsyv5Q7nXa
 OqTF8F8lmNYFVqlaYOb2GulbtMyniuaVANeiDfj7z8DcSyiCp6YQIiFoa+PNxXdW9flS
 GmZg==
X-Gm-Message-State: AOAM531h+TxEtnc3wbWESx6B+GZlClESHj7xWk29I2q2Foy8B+kSGyC/
 fWpTUoCJKVP0Cz2NaYZtAZys88DKgUNMKPqPbI5VxA==
X-Google-Smtp-Source: ABdhPJw5ve8VGZt1PYiut8AF8JKqbs/eIaEm0QTQBe3mGME0F61S7cAxrYrlrPzeMqdeSdABpIkqcWwkQW9YW1uDCFI=
X-Received: by 2002:a05:600c:358a:: with SMTP id
 p10mr37598789wmq.180.1638792154989; 
 Mon, 06 Dec 2021 04:02:34 -0800 (PST)
MIME-Version: 1.0
References: <20211206110140.119650-1-maxime@cerno.tech>
 <20211206110140.119650-2-maxime@cerno.tech>
In-Reply-To: <20211206110140.119650-2-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 6 Dec 2021 12:02:19 +0000
Message-ID: <CAPY8ntCMAC7-9YqwLN3mOgm87rhEu13fnqbrmvOO568RpWttZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/fourcc: Add packed 10bit YUV 4:2:0 format
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
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Dec 2021 at 11:01, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Adds a format that is 3 10bit YUV 4:2:0 samples packed into
> a 32bit work (with 2 spare bits).

Quite possibly my typo, but
s/work/word

> Supported on Broadcom BCM2711 chips.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_fourcc.c  |  3 +++
>  include/uapi/drm/drm_fourcc.h | 11 +++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 25837b1d6639..07741b678798 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -269,6 +269,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>                   .num_planes = 3, .char_per_block = { 2, 2, 2 },
>                   .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
>                   .vsub = 0, .is_yuv = true },
> +               { .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
> +                 .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> +                 .hsub = 2, .vsub = 2, .is_yuv = true},
>         };
>
>         unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 7f652c96845b..fc0c1454d275 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -314,6 +314,13 @@ extern "C" {
>   */
>  #define DRM_FORMAT_P016                fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
>
> +/* 2 plane YCbCr420.
> + * 3 10 bit components and 2 padding bits packed into 4 bytes.
> + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
> + * index 1 = Cr:Cb plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 [2:10:10:10:2:10:10:10] little endian
> + */
> +#define DRM_FORMAT_P030                fourcc_code('P', '0', '3', '0') /* 2x2 subsampled Cr:Cb plane 10 bits per channel packed */
> +
>  /* 3 plane non-subsampled (444) YCbCr
>   * 16 bits per component, but only 10 bits are used and 6 bits are padded
>   * index 0: Y plane, [15:0] Y:x [10:6] little endian
> @@ -854,6 +861,10 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   * and UV.  Some SAND-using hardware stores UV in a separate tiled
>   * image from Y to reduce the column height, which is not supported
>   * with these modifiers.
> + *
> + * The DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT modifier is also
> + * supported for DRM_FORMAT_P030 where the columns remain as 128 bytes
> + * wide, but as this is a 10 bpp format that translates to 96 pixels.
>   */
>
>  #define DRM_FORMAT_MOD_BROADCOM_SAND32_COL_HEIGHT(v) \
> --
> 2.33.1
>
