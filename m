Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E08E93D4B8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 16:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E29D10E99C;
	Fri, 26 Jul 2024 14:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aaGZeeVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD0A10E99C;
 Fri, 26 Jul 2024 14:04:47 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7ab09739287so680063a12.3; 
 Fri, 26 Jul 2024 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722002687; x=1722607487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZtkUciy53SlA3q1C2mBesNLpAodaomgS3oD4UCQoBY=;
 b=aaGZeeVbEs3c5mPr+cGk8+DMCwrJNCzXu/fdnkpy9TuSg7DdF5OdyHnWBMZBct0EFU
 SA1fDH/WTw9Dzq3KUxeoXpQBAFF/2W4YBkJh46cA8V2nwEFpKWOJ0Jm/MBwQ9e6xcP6e
 y0Lu1PAjpBWBQiFM9SQm+D+J84K/giDKBxUM3mpmogUeng/SATcO9haFMOOnWlwNmExG
 F30nE3EN2GWK2t2HPWuFH892jSv3Ise13cPCAsBL34sCxDDtrH3tYK8lnQrc5aWTUe0A
 R3eHzf/CgDP18UJ3P+o8899cC9UMdjjaPgTC38wJfqhShprx52NZobtljhEXINUKSWao
 sUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722002687; x=1722607487;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZtkUciy53SlA3q1C2mBesNLpAodaomgS3oD4UCQoBY=;
 b=v8dB2SumPcushOSYx6QCxYMETV0PYYMRC2w3Y0TeFJm+8dmexko6+VPksGLM2MVQ+R
 FQ+xh7GLC6HbEqOfuRubhut0s+asJGX+iEVrHeseRDJw9LOeR+xQN2SwOVC6wOb81nCg
 Q1Td/GCLcedaBfG7J+YuFCAM4syjjqlR7vzN0rvCdsfRodHxoDkEMPcSRTlt2UT7vE21
 dNmSw91Qr2oa4FLgzXkJp2Llc/DfaitIc3lSpLQRKzEQjjfjsLjcBCIzOWruczNe4RFS
 7DAyE0Ig7acaa5p27ZuOn3hg4Ud78XmH8WpSCZ09aqb6GRLuroyvqe9NxjZh8No5M17h
 mwGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrac7d6sOm5EkPGPi882bACo6CiQBoplE4+9gja0p5XoasPr1//j6ZGbjmpAFJzfx3BT1VHOw5GhcMUeUcd0wAOZ5htIbhQ7NVKukg/P/esAavMr/a59E+d2davn4hqLaBNnLDKd/W1K9gEBRWqw==
X-Gm-Message-State: AOJu0Yydna6bDJfWq+XYtHO71Dm69GrnbxsY5IjmC7YtG51Fi6qVa+k5
 eOnEKjvJD/rnKfnJaaY7xkRk7hqQue9PvXGcQ5Mu6CKOekhJ2d1tMXC/L50y/KqyCxrdTbMm4jq
 2W6uYCE99id03Fd6K/c98t2KkdBM=
X-Google-Smtp-Source: AGHT+IEQKLKHLh9iUylwXZrOlh4LpZAvjxsgcGtt4pKukArrozDytrxIsOXJTlQFPEWoZrVPyd4xxPLBpuHK0Qol0F8=
X-Received: by 2002:a17:90b:1c87:b0:2cb:50fa:b01e with SMTP id
 98e67ed59e1d1-2cf2ebb7c91mr5372574a91.41.1722002686719; Fri, 26 Jul 2024
 07:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240726094728.1161-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240726094728.1161-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Jul 2024 10:04:35 -0400
Message-ID: <CADnq5_MbocNRzAP6-2gR+CNofo-eFFM7GGsUFGUjQzKz7Q8qDg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Use ARRAY_SIZE for array length
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

On Fri, Jul 26, 2024 at 5:55=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Use of macro ARRAY_SIZE to calculate array size minimizes
> the redundant code and improves code reusability.
>
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1552:57-58=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1561:57-58=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1573:53-54=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1578:53-54=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1592:53-54=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1597:53-54=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1611:50-51=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1616:50-51=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1630:50-51=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1635:50-51=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1649:60-61=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1663:53-54=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1677:52-53=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1691:53-54=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1705:53-54=
: WARNING: Use ARRAY_SIZE.
> ./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1719:54-55=
: WARNING: Use ARRAY_SIZE.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9580
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../display/dc/spl/dc_spl_scl_easf_filters.c  | 63 ++++++-------------
>  1 file changed, 20 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c=
 b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
> index 09bf82f7d468..e847af94419a 100644
> --- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
> +++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
> @@ -1530,14 +1530,13 @@ static uint32_t spl_easf_get_scale_ratio_to_reg_v=
alue(struct spl_fixed31_32 rati
>         value =3D lookup_table_index_ptr->reg_value;
>
>         while (count < num_entries) {
> -
>                 lookup_table_index_ptr =3D (lookup_table_base_ptr + count=
);
>                 if (lookup_table_index_ptr->numer < 0)
>                         break;
>
>                 if (ratio.value < spl_fixpt_from_fraction(
> -                       lookup_table_index_ptr->numer,
> -                       lookup_table_index_ptr->denom).value) {
> +                   lookup_table_index_ptr->numer,
> +                   lookup_table_index_ptr->denom).value) {
>                         value =3D lookup_table_index_ptr->reg_value;
>                         break;
>                 }
> @@ -1548,21 +1547,13 @@ static uint32_t spl_easf_get_scale_ratio_to_reg_v=
alue(struct spl_fixed31_32 rati
>  }
>  uint32_t spl_get_v_bf3_mode(struct spl_fixed31_32 ratio)
>  {
> -       uint32_t value;
> -       unsigned int num_entries =3D sizeof(easf_v_bf3_mode_lookup) /
> -               sizeof(struct scale_ratio_to_reg_value_lookup);
> -       value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
> -               easf_v_bf3_mode_lookup, num_entries);
> -       return value;
> +       unsigned int num_entries =3D ARRAY_SIZE(easf_v_bf3_mode_lookup);
> +       return spl_easf_get_scale_ratio_to_reg_value(ratio, easf_v_bf3_mo=
de_lookup, num_entries);
>  }
>  uint32_t spl_get_h_bf3_mode(struct spl_fixed31_32 ratio)
>  {
> -       uint32_t value;
> -       unsigned int num_entries =3D sizeof(easf_h_bf3_mode_lookup) /
> -               sizeof(struct scale_ratio_to_reg_value_lookup);
> -       value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
> -               easf_h_bf3_mode_lookup, num_entries);
> -       return value;
> +       unsigned int num_entries =3D ARRAY_SIZE(easf_h_bf3_mode_lookup);
> +       return spl_easf_get_scale_ratio_to_reg_value(ratio, easf_h_bf3_mo=
de_lookup, num_entries);
>  }
>  uint32_t spl_get_reducer_gain6(int taps, struct spl_fixed31_32 ratio)
>  {
> @@ -1570,13 +1561,11 @@ uint32_t spl_get_reducer_gain6(int taps, struct s=
pl_fixed31_32 ratio)
>         unsigned int num_entries;
>
>         if (taps =3D=3D 4) {
> -               num_entries =3D sizeof(easf_reducer_gain6_4tap_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_reducer_gain6_4tap_lookup=
);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_reducer_gain6_4tap_lookup, num_entries);
>         } else if (taps =3D=3D 6) {
> -               num_entries =3D sizeof(easf_reducer_gain6_6tap_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_reducer_gain6_6tap_lookup=
);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_reducer_gain6_6tap_lookup, num_entries);
>         } else
> @@ -1589,13 +1578,11 @@ uint32_t spl_get_reducer_gain4(int taps, struct s=
pl_fixed31_32 ratio)
>         unsigned int num_entries;
>
>         if (taps =3D=3D 4) {
> -               num_entries =3D sizeof(easf_reducer_gain4_4tap_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_reducer_gain4_4tap_lookup=
);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_reducer_gain4_4tap_lookup, num_entries);
>         } else if (taps =3D=3D 6) {
> -               num_entries =3D sizeof(easf_reducer_gain4_6tap_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_reducer_gain4_6tap_lookup=
);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_reducer_gain4_6tap_lookup, num_entries);
>         } else
> @@ -1608,13 +1595,11 @@ uint32_t spl_get_gainRing6(int taps, struct spl_f=
ixed31_32 ratio)
>         unsigned int num_entries;
>
>         if (taps =3D=3D 4) {
> -               num_entries =3D sizeof(easf_gain_ring6_4tap_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_gain_ring6_4tap_lookup);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_gain_ring6_4tap_lookup, num_entries);
>         } else if (taps =3D=3D 6) {
> -               num_entries =3D sizeof(easf_gain_ring6_6tap_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_gain_ring6_6tap_lookup);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_gain_ring6_6tap_lookup, num_entries);
>         } else
> @@ -1627,13 +1612,11 @@ uint32_t spl_get_gainRing4(int taps, struct spl_f=
ixed31_32 ratio)
>         unsigned int num_entries;
>
>         if (taps =3D=3D 4) {
> -               num_entries =3D sizeof(easf_gain_ring4_4tap_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_gain_ring4_4tap_lookup);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_gain_ring4_4tap_lookup, num_entries);
>         } else if (taps =3D=3D 6) {
> -               num_entries =3D sizeof(easf_gain_ring4_6tap_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_gain_ring4_6tap_lookup);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_gain_ring4_6tap_lookup, num_entries);
>         } else
> @@ -1646,8 +1629,7 @@ uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps=
, struct spl_fixed31_32 ratio
>         unsigned int num_entries;
>
>         if (taps =3D=3D 3) {
> -               num_entries =3D sizeof(easf_3tap_dntilt_uptilt_offset_loo=
kup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_3tap_dntilt_uptilt_offset=
_lookup);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_3tap_dntilt_uptilt_offset_lookup, num_entrie=
s);
>         } else
> @@ -1660,8 +1642,7 @@ uint32_t spl_get_3tap_uptilt_maxval(int taps, struc=
t spl_fixed31_32 ratio)
>         unsigned int num_entries;
>
>         if (taps =3D=3D 3) {
> -               num_entries =3D sizeof(easf_3tap_uptilt_maxval_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_3tap_uptilt_maxval_lookup=
);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_3tap_uptilt_maxval_lookup, num_entries);
>         } else
> @@ -1674,8 +1655,7 @@ uint32_t spl_get_3tap_dntilt_slope(int taps, struct=
 spl_fixed31_32 ratio)
>         unsigned int num_entries;
>
>         if (taps =3D=3D 3) {
> -               num_entries =3D sizeof(easf_3tap_dntilt_slope_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_3tap_dntilt_slope_lookup)=
;
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_3tap_dntilt_slope_lookup, num_entries);
>         } else
> @@ -1688,8 +1668,7 @@ uint32_t spl_get_3tap_uptilt1_slope(int taps, struc=
t spl_fixed31_32 ratio)
>         unsigned int num_entries;
>
>         if (taps =3D=3D 3) {
> -               num_entries =3D sizeof(easf_3tap_uptilt1_slope_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_3tap_uptilt1_slope_lookup=
);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_3tap_uptilt1_slope_lookup, num_entries);
>         } else
> @@ -1702,8 +1681,7 @@ uint32_t spl_get_3tap_uptilt2_slope(int taps, struc=
t spl_fixed31_32 ratio)
>         unsigned int num_entries;
>
>         if (taps =3D=3D 3) {
> -               num_entries =3D sizeof(easf_3tap_uptilt2_slope_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_3tap_uptilt2_slope_lookup=
);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_3tap_uptilt2_slope_lookup, num_entries);
>         } else
> @@ -1716,8 +1694,7 @@ uint32_t spl_get_3tap_uptilt2_offset(int taps, stru=
ct spl_fixed31_32 ratio)
>         unsigned int num_entries;
>
>         if (taps =3D=3D 3) {
> -               num_entries =3D sizeof(easf_3tap_uptilt2_offset_lookup) /
> -                       sizeof(struct scale_ratio_to_reg_value_lookup);
> +               num_entries =3D ARRAY_SIZE(easf_3tap_uptilt2_offset_looku=
p);
>                 value =3D spl_easf_get_scale_ratio_to_reg_value(ratio,
>                         easf_3tap_uptilt2_offset_lookup, num_entries);
>         } else
> --
> 2.32.0.3.g01195cf9f
>
