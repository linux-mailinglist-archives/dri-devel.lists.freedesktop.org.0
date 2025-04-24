Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A4AA9B997
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 23:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2406510E86D;
	Thu, 24 Apr 2025 21:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ll9F8mlz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01AB10E86D;
 Thu, 24 Apr 2025 21:12:29 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-86135ad7b4cso44666839f.1; 
 Thu, 24 Apr 2025 14:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745529148; x=1746133948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jecia6s2JNR2xEO3HrUkYsvVoWooMAU8KQ0rtFmv/c=;
 b=Ll9F8mlz79Bh3evWU8PMvjRNHY/z2I73OaULgEidr9cYNx0BdgKeR3drDE2fS2dHfQ
 rAoBj/qaAEobyYkf8hyKVpCHo1Dpxm/erHCnnIul3A/DefYlf5MEMhMPj0xcpADz+0tw
 T1mEQ9Wt47f4eigo/WP6ZWRhQZkLzz1FsiEcxMibgeCPwdBSqbqCnauJq+crSCM+82nD
 loBmj7kIO7QJ9Ev1vfZ5BXhjhxevpvxH+UP3XqCR17qj8jWSgKZTSu2wB/QYD+u5/qmj
 lHMH12C8odvDA74CQL8ao63h+yLLGhsMihXvthfseJpRcixRSNNZOHDxPOu4Zt1/aMxn
 njhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745529148; x=1746133948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5jecia6s2JNR2xEO3HrUkYsvVoWooMAU8KQ0rtFmv/c=;
 b=GmxwH8/L+wsOvw/oy8yWXb6/9+pw2Je9c7rUHo1JtDTIxcCD15Ie4B3cqVCG/Xxqf2
 lyIVkdVkD/zf5lH5dD9zNb/j2KwQRrDtleqwOGUoDN16uiMS/O2bT72g9dPGCEYEy7M2
 a36m+6HI1nSv2TSPMgOP8xe1XXqC5tlZCzMZHczZEYa7IoktdjsrNy5PIh+3BZUGJ4KP
 kP0yNqvCZv92P+Mzdqu3DdW2sdIkPhtal9pO/6D4VrdJM1NinFk38VT0X6ycAZ6k0Kaj
 lQuybquTT7lxAs99/S56WnJCsvWwvs6wYG82Klb4BGYEQQ6lhon+Oaa/g/+kxSTx5ZmM
 V0+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCcsnPsu44Ypz1L1d7JeeMN7/PJ2mhZTqpSVxdF3lFg3Bq1YbbMwzdlImqH5g+tJknKT5Oxhfrnud8@lists.freedesktop.org,
 AJvYcCVCn020bwc+fJWoPTNoXuglHgV2t856QPj2sI5uozxI/IN/P76NORz647bfQSBD0zPIgjuNIkoV5Dk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNQbj9wKmW3Ydj6kAhDBj5oMGqRhpCfOiLtiMDCsGDAg1YcnA3
 0FhtybCpRNtYzdJFlAQ4Y2NHk2/pgYZjYe0pQHax/Q2a796daRLByo78ghuTRsZpBLkp99OwAGu
 iUs5GY6JOpNdVF/QPr2tBlSRbKvU=
X-Gm-Gg: ASbGncvH7sy9n5xyFU1Gxj3qkQKEKg+Ayo4nUxkAlPSLr1TFFcs96hjHAcWNf8kte88
 6QKdHt4RmMyVjiasT3J5bE85vR521MtGF07jlMfoUlK49PkOJN94elOjhddiDAYFku46350Wnkz
 Ym/hNVmcOfLvqK9H/aCzxpeJhiLcWkyEzAIcbWTaKhRLM9jDAWq/4lwajt
X-Google-Smtp-Source: AGHT+IGwg57PbGCAJtcA1b9fqEb8SXvQsj9ID0gfQZuJ29n4nfIKh+iiGOC7fjlxHKkpbrZ6VyFzhutJKQUYzyyRRFU=
X-Received: by 2002:a05:6e02:188f:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3d9303b7774mr45553075ab.11.1745529148486; Thu, 24 Apr 2025
 14:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
In-Reply-To: <20250417021349.148911-1-alex.vinarskis@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 24 Apr 2025 14:12:15 -0700
X-Gm-Features: ATxdqUHz6DZ9blgWAq2Iad4ekg_aVkIGiDF4KqqZFyT1Q27qjUmJcTIdj9Q8vng
Message-ID: <CAF6AEGs5Sw76kVS6_GaK6=VZ3jWPuqN9bc+7UvVU=jfaBBTLDQ@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com,
 abel.vesa@linaro.org, johan@kernel.org
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

On Wed, Apr 16, 2025 at 7:13=E2=80=AFPM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> to non-transparent mode to enable video output on X1E-based devices
> that come with LTTPR on the motherboards. However, video would not work
> if additional LTTPR(s) are present between sink and source, which is
> the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
>
> First, take into account LTTPR capabilities when computing max link
> rate, number of lanes. Take into account previous discussion on the
> lists - exit early if reading DPCD caps failed. This also fixes
> "*ERROR* panel edid read failed" on some monitors which seems to be
> caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
> initialized.
>
> Finally, implement link training per-segment. Pass lttpr_count to all
> required helpers.
> This seems to also partially improve UI (Wayland) hanging when
> changing external display's link parameters (resolution, framerate):
> * Prior to this series, via direct USB Type-C to display connection,
>   attempt to change resolution or framerate hangs the UI, setting does
>   not stick. Some back and forth replugging finally sets desired
>   parameters.
> * With this series, via direct USB Type-C to display connection,
>   changing parameters works most of the time, without UI freezing. Via
>   docking station/multiple LTTPRs the setting again does not stick.
> * On Xorg changing link paramaters works in all combinations.
>
> These appear to be mainlink initialization related, as in all cases LT
> passes successfully.
>
> Test matrix:
> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
>         * Left USB Type-C, Right USB Type-C
>         * Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
>           Type-C to HDMI dongle, USB Type-C to DP dongle
>         * Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
>           monitor per USB Type-C connector)
> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
>         * Left USB Type-C, Right USB Type-C
>         * Direct monitor connection
>         * Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
>           Thunderbolt/USB Type-C, probes with an LTTPR when in USB
>           Type-C/DP Alt mode)
> * Dell XPS 9345, Debian trixie/sid, Gnome 48, Wayland (Stefan Schmidt)
>         * Left USB Type-C, Right USB Type-C
>         * Dell WD15 Dock with DisplayPort connected
>         * Dell HD22Q dock with HDMI connected
>         * USB Type-C to HDMI dongle
>         * Dell U3417W

For the series,

Tested-by: Rob Clark <robdclark@gmail.com>  # yoga slim 7x

patch 4/4 had a number of conflicting hunks, you might need to rebase
on msm-next

BR,
-R

> In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
> in UEFI to force universal Thunderbolt/USB Type-C devices to work in
> DP Alt mode.
> In both cases laptops had HBR3 patches applied [1], resulting in
> maximum successful link at 3440x1440@100hz and 4k@60hz respectively.
> When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
> and USB3.0 devices were working in parallel to video ouput.
>
> Known issues:
> * As mentioned above, it appears that on Gnome+Wayland framerate and
>   resolution parameter adjustment is not stable.
>
> Due to lack of access to the official DisplayPort specfication, changes
> were primarily inspired by/reverse engineered from Intel's i915 driver.
>
> [1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gma=
il.com/
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>
> ---
>
> Changes in v3:
> - Split 1st patch into 3
> - Simplified handling of max_lttpr_lanes/max_lttpr_rate
> - Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
>   are link related, not panel related)
> - Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
> - Droped Abel's R-b tags from 1st patch that got split due to high diff
> - Fixed alignment issues, initialization of variables, debug prints
> - Moved lttpr_count to avoid ugly pointer
> - Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vi=
narskis@gmail.com/
>
> Changes in v2:
> - Picked up Abel's R-b tags
> - Fixed typo as per Abel, fixed readability as per Johan
> - Updated cover and commit message on mailink issue which appears to be
>   specific to Gnome+Wayland. No problems on Xorg.
> - Link to v1: https://lore.kernel.org/all/20250310211039.29843-1-alex.vin=
arskis@gmail.com/
>
> Aleksandrs Vinarskis (4):
>   drm/msm/dp: Fix support of LTTPR initialization
>   drm/msm/dp: Account for LTTPRs capabilities
>   drm/msm/dp: Prepare for link training per-segment for LTTPRs
>   drm/msm/dp: Introduce link training per-segment for LTTPRs
>
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 126 ++++++++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_display.c |  27 ++++--
>  drivers/gpu/drm/msm/dp/dp_link.h    |   4 +
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  12 ++-
>  4 files changed, 122 insertions(+), 47 deletions(-)
>
> --
> 2.45.2
>
