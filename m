Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E86BF293
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD7210EF96;
	Fri, 17 Mar 2023 20:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF5810EFB7;
 Fri, 17 Mar 2023 20:30:51 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id be16so4740072oib.0;
 Fri, 17 Mar 2023 13:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgzPzELDRnlSYA6MsmYOolzvoDuLjYqI48hOINLp/VU=;
 b=n2GadBEyYknydFrD4m7kROU9UA0PJQr/Gx/qdFjoB7AAo4jcYipOO9aFFFQs/Otm9p
 EzKZ6J8Tb4BFjoAdQMl541IiSFt1v27HyqsFoQj7Zo0XYnW8ApzopdKD1lgTAY2YtaPt
 456Gdh5zJUR07z+GcBuwgiWhFn215fGTA+hEnsruTyPtnQANA6ngCOMvBVfS02GGzflw
 +J4fmkcupMeC6Y4tZ12XxKP+1S574X2FyZVuoutGobGbYnmD90sCv8H/WXbPTVM/FJec
 7gbrZUyin8qHHqg1PAtS+zZHHiaQ9w7V8NF8AzdlVAYUF5l2nUz2CgHkBSgllLvzxh/G
 gayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgzPzELDRnlSYA6MsmYOolzvoDuLjYqI48hOINLp/VU=;
 b=DXKOlAaHWKJB0KYGzzgv2D5CktZEXGC/9EmsOUObciPm7In8ZCmcuE1+guMhOqymlr
 FXoq1M8ZvZWLndBZ6knaZxoj7IEww8+dfvn0bLENShFPxwZMeFc/g6MSO4remoc5xgOe
 KoN+tNHBRlmWQq+VlzsdgF9eNQaSzhxJ0EmJg4F4sjFUHIVuZPVRB/oEBb6+qR9aQeYH
 bcu5D+dir/2BnpLbOxe9LcaQiJAM3ToQ0v/PkrOw4s76X/4hOFMGmqQ1iaOZgYc4PdNP
 OjsQ8QWYqv7RZQYyn5d8iDusR70co4g2yfiRoRFMGt37rApg9hmQihouKV5FoqS38EQN
 V8vg==
X-Gm-Message-State: AO0yUKUwEzl+9JYDY/IvIr6aiqMb9MeOT6s9oES5nV5L3iVd80/fxbei
 Mmq21fslkSVTxPbue4x6E6CYHXvox0AYHiljMjzu0vJD
X-Google-Smtp-Source: AK7set+UKwCYs1V1Ri1PUeftVGJmtb0qs/ntSmquTYl0HxYXGeP/0RgArIif59CW4iMKP3g56h3O8GvKZa7MA+nMPJU=
X-Received: by 2002:aca:6709:0:b0:384:253:642d with SMTP id
 z9-20020aca6709000000b003840253642dmr3819397oix.3.1679085050979; Fri, 17 Mar
 2023 13:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-21-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-21-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:30:39 -0400
Message-ID: <CADnq5_Pj31O7Xvikn4SpCdxp3vkfYe0+PKxev-1VoECPk0YP-Q@mail.gmail.com>
Subject: Re: [PATCH 20/37] drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move
 defines out to where they are actually used
To: Lee Jones <lee@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At t=
op level:
>   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:143:2=
2:
>       warning: =E2=80=98SYNAPTICS_DEVICE_ID=E2=80=99 defined but not used=
 [-Wunused-const-variable=3D]
>   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:140:2=
2:
>       warning: =E2=80=98DP_VGA_LVDS_CONVERTER_ID_3=E2=80=99 defined but n=
ot used [-Wunused-const-variable=3D]
>   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:138:2=
2:
>       warning: =E2=80=98DP_VGA_LVDS_CONVERTER_ID_2=E2=80=99 defined but n=
ot used [-Wunused-const-variable=3D]
>   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:133:2=
2:
>       warning: =E2=80=98DP_SINK_DEVICE_STR_ID_2=E2=80=99 defined but not =
used [-Wunused-const-variable=3D]
>   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:2=
2:
>       warning: =E2=80=98DP_SINK_DEVICE_STR_ID_1=E2=80=99 defined but not =
used [-Wunused-const-variable=3D]
>
> [snip 400 similar lines brevity]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c   |  3 +++
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c       |  3 +++
>  .../gpu/drm/amd/display/dc/link/link_detection.c    |  2 ++
>  .../dc/link/protocols/link_edp_panel_control.c      |  5 +++++
>  .../gpu/drm/amd/display/include/ddc_service_types.h | 13 -------------
>  5 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 9c1e91c2179eb..330ab036c830f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -44,6 +44,9 @@
>  #include "dm_helpers.h"
>  #include "ddc_service_types.h"
>
> +/* MST Dock */
> +static const uint8_t SYNAPTICS_DEVICE_ID[] =3D "SYNA";
> +
>  /* dm_helpers_parse_edid_caps
>   *
>   * Parse edid caps
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/=
drm/amd/display/dc/dce/dmub_psr.c
> index 19440bdf63449..27b8f3435d86f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -33,6 +33,9 @@
>
>  #define MAX_PIPES 6
>
> +static const uint8_t DP_SINK_DEVICE_STR_ID_1[] =3D {7, 1, 8, 7, 3};
> +static const uint8_t DP_SINK_DEVICE_STR_ID_2[] =3D {7, 1, 8, 7, 5};
> +
>  /*
>   * Convert dmcub psr state to dmcu psr state.
>   */
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drive=
rs/gpu/drm/amd/display/dc/link/link_detection.c
> index 8cfeddfb65c89..9177b146a80a8 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -60,6 +60,8 @@
>   */
>  #define LINK_TRAINING_MAX_VERIFY_RETRY 2
>
> +static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] =3D "7580\x80u";
> +
>  static const uint8_t dp_hdmi_dongle_signature_str[] =3D "DP-HDMI ADAPTOR=
";
>
>  static enum ddc_transaction_type get_ddc_transaction_type(enum signal_ty=
pe sink_signal)
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel=
_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_c=
ontrol.c
> index 93a6bbe954bb7..d895046787bc4 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_contro=
l.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_contro=
l.c
> @@ -37,6 +37,11 @@
>  #include "abm.h"
>  #define DC_LOGGER_INIT(logger)
>
> +/* Travis */
> +static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] =3D "sivarT";
> +/* Nutmeg */
> +static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] =3D "dnomlA";
> +
>  void dp_set_panel_mode(struct dc_link *link, enum dp_panel_mode panel_mo=
de)
>  {
>         union dpcd_edp_config edp_config_set;
> diff --git a/drivers/gpu/drm/amd/display/include/ddc_service_types.h b/dr=
ivers/gpu/drm/amd/display/include/ddc_service_types.h
> index 31a12ce79a8e0..f843fc4978552 100644
> --- a/drivers/gpu/drm/amd/display/include/ddc_service_types.h
> +++ b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
> @@ -129,17 +129,4 @@ struct av_sync_data {
>         uint8_t aud_del_ins3;/* DPCD 0002Dh */
>  };
>
> -static const uint8_t DP_SINK_DEVICE_STR_ID_1[] =3D {7, 1, 8, 7, 3};
> -static const uint8_t DP_SINK_DEVICE_STR_ID_2[] =3D {7, 1, 8, 7, 5};
> -
> -static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] =3D "7580\x80u";
> -
> -/*Travis*/
> -static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] =3D "sivarT";
> -/*Nutmeg*/
> -static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] =3D "dnomlA";
> -
> -/*MST Dock*/
> -static const uint8_t SYNAPTICS_DEVICE_ID[] =3D "SYNA";
> -
>  #endif /* __DAL_DDC_SERVICE_TYPES_H__ */
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
