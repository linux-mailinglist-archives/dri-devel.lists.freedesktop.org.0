Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ABC9B4B8D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 14:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506FC10E668;
	Tue, 29 Oct 2024 13:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LENKW1OF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05D210E668;
 Tue, 29 Oct 2024 13:57:44 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-72088a79f57so151609b3a.3; 
 Tue, 29 Oct 2024 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730210264; x=1730815064; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVjCLN6/4pb+rbgh/lalneZMrGacs2C2jcmuZBuQLdQ=;
 b=LENKW1OFOVUVrFExwNM5I4hJ1wYPm/OHqvJWOolyB0QbhbUo9ayEmCa6eNXinTaivl
 Iw5ZFoK6z7FjFlNVOpM3/Fy2Iw/E2JZleKE714fycbXkbbRTpk/bJ9ZXIr8MpYT4keLN
 cbpn+7kGohGmgmgJHDFuUqDetXH7gq9gjDOiHSrD9hp+2IhN7QLQrmLvmqWghxeoiHRk
 SWcLPIxj5CKLhNaV5p5WvN6xJYK++tSE2hZTZyAG904t+HlvJ0bW1BjvPT2pl1+DaCth
 G/CSm6XUpZ3J4qOExnVD5nIFOXzZNTriD9D9aeGGtV6FRiFK9gpOuOi1CSr+DOibpUT1
 yUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730210264; x=1730815064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qVjCLN6/4pb+rbgh/lalneZMrGacs2C2jcmuZBuQLdQ=;
 b=PRPwJxD4JHXUrdgCHPjvKM0lJefKM+5qTyzJA078//TfCLbLIkDkEd0PxtgqWoHRgJ
 lODJv3yrQBcy/DuhfcfSSOIgJDzsE6t5M6q10OwsrbjMFs8LvOCjTsXqKhMjsU3O+ZLA
 rJ0cErCoReKFwo0Ic+cFcXFa3qIiqklWG/g8SG77D/zLgGkpDB0jF4kv6yqccqDmp5bm
 PUVYqxqfr6Zd6FNrsL9ZLMD4YNbI3ji0fl6s2TUSo0rkCjmODPu6Jjn3EEhKjcE1LbXw
 GjhlT3BqdHI/LfTw+TMd2/oTabpzciOTgx87EjUZ9aZJJkglVNJ6PhbE3/44Q8eLAkQs
 5kig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlnxQknkP8GLWsQkwOlM3lh17xKf0COTPlESEL5kZX3aDMt64HUc6U5DnppeiO6LN4cOr0TzoWnkeU@lists.freedesktop.org,
 AJvYcCVyF4DSyFW2uEsNCegWI5z5pKrPIJTKtUHrjREsEfu/agV+Y1Nr8YCfIdkV/qSRkjLtWpDxIGXL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu9yYGycQu5YG6TXiX5vRxqyr5VVV8+q8gC06yEhI977DDeenx
 YXC9B+21qeA/G064WexFsUb/vJTRnaz71LUu6ZnAXTv2EfLxmnZHy89cIRIq0S3damczqQiCN+E
 k35KJux1Zof8oQhU7yKY3Ufn89ik=
X-Google-Smtp-Source: AGHT+IEMP5xywibp53KFIxcV9Fe8+A4IVmXJWakTkzB01ry0OzLKtEiDdxyBPoJG/j3b6zlW5T4W1Dr4/rxEcRflhrs=
X-Received: by 2002:a05:6a00:4613:b0:71e:5132:da7b with SMTP id
 d2e1a72fcca58-72063004c28mr7323067b3a.3.1730210264099; Tue, 29 Oct 2024
 06:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241009003334.254537-1-linux@treblig.org>
In-Reply-To: <20241009003334.254537-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Oct 2024 09:57:32 -0400
Message-ID: <CADnq5_OLPqHCGV2YziVipDcWRdPQbpR12g+Vch9tgo171gyzkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unused
 cm3_helper_translate_curve_to_degamma_hw_format
To: linux@treblig.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks!

Alex

On Tue, Oct 8, 2024 at 8:43=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> cm3_helper_translate_curve_to_degamma_hw_format() since it was added in
> 2020's commit
> 03f54d7d3448 ("drm/amd/display: Add DCN3 DPP")
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  .../amd/display/dc/dcn30/dcn30_cm_common.c    | 151 ------------------
>  .../display/dc/dwb/dcn30/dcn30_cm_common.h    |   4 -
>  2 files changed, 155 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/dri=
vers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> index f31f0e3abfc0..9118a0883f03 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> @@ -285,157 +285,6 @@ bool cm3_helper_translate_curve_to_hw_format(
>         return true;
>  }
>
> -#define NUM_DEGAMMA_REGIONS    12
> -
> -
> -bool cm3_helper_translate_curve_to_degamma_hw_format(
> -                               const struct dc_transfer_func *output_tf,
> -                               struct pwl_params *lut_params)
> -{
> -       struct curve_points3 *corner_points;
> -       struct pwl_result_data *rgb_resulted;
> -       struct pwl_result_data *rgb;
> -       struct pwl_result_data *rgb_plus_1;
> -
> -       int32_t region_start, region_end;
> -       int32_t i;
> -       uint32_t j, k, seg_distr[MAX_REGIONS_NUMBER], increment, start_in=
dex, hw_points;
> -
> -       if (output_tf =3D=3D NULL || lut_params =3D=3D NULL || output_tf-=
>type =3D=3D TF_TYPE_BYPASS)
> -               return false;
> -
> -       corner_points =3D lut_params->corner_points;
> -       rgb_resulted =3D lut_params->rgb_resulted;
> -       hw_points =3D 0;
> -
> -       memset(lut_params, 0, sizeof(struct pwl_params));
> -       memset(seg_distr, 0, sizeof(seg_distr));
> -
> -       region_start =3D -NUM_DEGAMMA_REGIONS;
> -       region_end   =3D 0;
> -
> -
> -       for (i =3D region_end - region_start; i < MAX_REGIONS_NUMBER ; i+=
+)
> -               seg_distr[i] =3D -1;
> -       /* 12 segments
> -        * segments are from 2^-12 to 0
> -        */
> -       for (i =3D 0; i < NUM_DEGAMMA_REGIONS ; i++)
> -               seg_distr[i] =3D 4;
> -
> -       for (k =3D 0; k < MAX_REGIONS_NUMBER; k++) {
> -               if (seg_distr[k] !=3D -1)
> -                       hw_points +=3D (1 << seg_distr[k]);
> -       }
> -
> -       j =3D 0;
> -       for (k =3D 0; k < (region_end - region_start); k++) {
> -               increment =3D NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
> -               start_index =3D (region_start + k + MAX_LOW_POINT) *
> -                               NUMBER_SW_SEGMENTS;
> -               for (i =3D start_index; i < start_index + NUMBER_SW_SEGME=
NTS;
> -                               i +=3D increment) {
> -                       if (j =3D=3D hw_points - 1)
> -                               break;
> -                       if (i >=3D TRANSFER_FUNC_POINTS)
> -                               return false;
> -                       rgb_resulted[j].red =3D output_tf->tf_pts.red[i];
> -                       rgb_resulted[j].green =3D output_tf->tf_pts.green=
[i];
> -                       rgb_resulted[j].blue =3D output_tf->tf_pts.blue[i=
];
> -                       j++;
> -               }
> -       }
> -
> -       /* last point */
> -       start_index =3D (region_end + MAX_LOW_POINT) * NUMBER_SW_SEGMENTS=
;
> -       rgb_resulted[hw_points - 1].red =3D output_tf->tf_pts.red[start_i=
ndex];
> -       rgb_resulted[hw_points - 1].green =3D output_tf->tf_pts.green[sta=
rt_index];
> -       rgb_resulted[hw_points - 1].blue =3D output_tf->tf_pts.blue[start=
_index];
> -
> -       corner_points[0].red.x =3D dc_fixpt_pow(dc_fixpt_from_int(2),
> -                                            dc_fixpt_from_int(region_sta=
rt));
> -       corner_points[0].green.x =3D corner_points[0].red.x;
> -       corner_points[0].blue.x =3D corner_points[0].red.x;
> -       corner_points[1].red.x =3D dc_fixpt_pow(dc_fixpt_from_int(2),
> -                                            dc_fixpt_from_int(region_end=
));
> -       corner_points[1].green.x =3D corner_points[1].red.x;
> -       corner_points[1].blue.x =3D corner_points[1].red.x;
> -
> -       corner_points[0].red.y =3D rgb_resulted[0].red;
> -       corner_points[0].green.y =3D rgb_resulted[0].green;
> -       corner_points[0].blue.y =3D rgb_resulted[0].blue;
> -
> -       /* see comment above, m_arrPoints[1].y should be the Y value for =
the
> -        * region end (m_numOfHwPoints), not last HW point(m_numOfHwPoint=
s - 1)
> -        */
> -       corner_points[1].red.y =3D rgb_resulted[hw_points - 1].red;
> -       corner_points[1].green.y =3D rgb_resulted[hw_points - 1].green;
> -       corner_points[1].blue.y =3D rgb_resulted[hw_points - 1].blue;
> -       corner_points[1].red.slope =3D dc_fixpt_zero;
> -       corner_points[1].green.slope =3D dc_fixpt_zero;
> -       corner_points[1].blue.slope =3D dc_fixpt_zero;
> -
> -       if (output_tf->tf =3D=3D TRANSFER_FUNCTION_PQ) {
> -               /* for PQ, we want to have a straight line from last HW X=
 point,
> -                * and the slope to be such that we hit 1.0 at 10000 nits=
.
> -                */
> -               const struct fixed31_32 end_value =3D
> -                               dc_fixpt_from_int(125);
> -
> -               corner_points[1].red.slope =3D dc_fixpt_div(
> -                       dc_fixpt_sub(dc_fixpt_one, corner_points[1].red.y=
),
> -                       dc_fixpt_sub(end_value, corner_points[1].red.x));
> -               corner_points[1].green.slope =3D dc_fixpt_div(
> -                       dc_fixpt_sub(dc_fixpt_one, corner_points[1].green=
.y),
> -                       dc_fixpt_sub(end_value, corner_points[1].green.x)=
);
> -               corner_points[1].blue.slope =3D dc_fixpt_div(
> -                       dc_fixpt_sub(dc_fixpt_one, corner_points[1].blue.=
y),
> -                       dc_fixpt_sub(end_value, corner_points[1].blue.x))=
;
> -       }
> -
> -       lut_params->hw_points_num =3D hw_points;
> -
> -       k =3D 0;
> -       for (i =3D 1; i < MAX_REGIONS_NUMBER; i++) {
> -               if (seg_distr[k] !=3D -1) {
> -                       lut_params->arr_curve_points[k].segments_num =3D
> -                                       seg_distr[k];
> -                       lut_params->arr_curve_points[i].offset =3D
> -                                       lut_params->arr_curve_points[k].o=
ffset + (1 << seg_distr[k]);
> -               }
> -               k++;
> -       }
> -
> -       if (seg_distr[k] !=3D -1)
> -               lut_params->arr_curve_points[k].segments_num =3D seg_dist=
r[k];
> -
> -       rgb =3D rgb_resulted;
> -       rgb_plus_1 =3D rgb_resulted + 1;
> -
> -       i =3D 1;
> -       while (i !=3D hw_points + 1) {
> -               if (dc_fixpt_lt(rgb_plus_1->red, rgb->red))
> -                       rgb_plus_1->red =3D rgb->red;
> -               if (dc_fixpt_lt(rgb_plus_1->green, rgb->green))
> -                       rgb_plus_1->green =3D rgb->green;
> -               if (dc_fixpt_lt(rgb_plus_1->blue, rgb->blue))
> -                       rgb_plus_1->blue =3D rgb->blue;
> -
> -               rgb->delta_red   =3D dc_fixpt_sub(rgb_plus_1->red,   rgb-=
>red);
> -               rgb->delta_green =3D dc_fixpt_sub(rgb_plus_1->green, rgb-=
>green);
> -               rgb->delta_blue  =3D dc_fixpt_sub(rgb_plus_1->blue,  rgb-=
>blue);
> -
> -               ++rgb_plus_1;
> -               ++rgb;
> -               ++i;
> -       }
> -       cm3_helper_convert_to_custom_float(rgb_resulted,
> -                                               lut_params->corner_points=
,
> -                                               hw_points, false);
> -
> -       return true;
> -}
> -
>  bool cm3_helper_convert_to_custom_float(
>                 struct pwl_result_data *rgb_resulted,
>                 struct curve_points3 *corner_points,
> diff --git a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h b=
/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
> index bd98b327a6c7..b86347c9b038 100644
> --- a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
> +++ b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
> @@ -63,10 +63,6 @@ bool cm3_helper_translate_curve_to_hw_format(
>         const struct dc_transfer_func *output_tf,
>         struct pwl_params *lut_params, bool fixpoint);
>
> -bool cm3_helper_translate_curve_to_degamma_hw_format(
> -                               const struct dc_transfer_func *output_tf,
> -                               struct pwl_params *lut_params);
> -
>  bool cm3_helper_convert_to_custom_float(
>                 struct pwl_result_data *rgb_resulted,
>                 struct curve_points3 *corner_points,
> --
> 2.46.2
>
