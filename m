Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC42B43E27
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C842810EA4F;
	Thu,  4 Sep 2025 14:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sxv/1E3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0008110EA4D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 14:08:49 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-24b150fb800so2503415ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756994929; x=1757599729; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azFlwDkWnsyIWz8YrYKLv9XaEIMDwp5bFnZG7i2CQ34=;
 b=Sxv/1E3CpKd+aLKCxmiziBqQc88udPyRYHG72dF+PoCCEeFAExxGcVbTeBa1l4BdD9
 mYls/tdjIMkusrik3UEULDhIMLIC6IrJWIwN0LPVZnrSdmufQhciOP/MljlY+6JhC5/P
 P6TJD1wUB5/VnVfNcZy84uvppX/jd1m0M5gB+sMzdzq8buYo+cyedQrbcpw1gikQ3Qcx
 U2mJEYkpgbVBI5c/s7BoWfAOa+9EzAfXuf2mBzVhhpogPXs+cqwJC41tPmkN1K/Twn8T
 Y/td8mbB1Ip4fTcnkU4Iymm2f9KofS0ub/2R7pB6xEMtef+YTmftmrdFpMH42Ev05yic
 EvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756994929; x=1757599729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azFlwDkWnsyIWz8YrYKLv9XaEIMDwp5bFnZG7i2CQ34=;
 b=FpS6/Sy6uO9ZNfRAcpykwMeeYjtXDHX32fnffYCWHkCSkO+pKCeZBh7kqWgd4x1rIx
 DYDagXzaarKOT+Gv1l32EBG35s8AX2336NurVmBpKf1dgQpW8lV//8l4jQdLtO4HMzGQ
 mKBx+7PlGllR/LDIDwehHRnJuaarkreRh76uuoxn5BsW8D+Q6lj8dv2u1GaGZOzmyVAW
 VQrafeeHgwO05/VCH8WC4WFfdsw9yBb4x6HfFObmrWsT9KwbV+nYyarkwF/uilv0dRT4
 2dIJTf//o+t8TV4/gK2B0HuZJDOKSISamuInlhE0/Uck3Zm5Cr2+HezuEym8bkHzmTGF
 hOYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU0gwucACHYMfdPQNl4VrqF8i9TmijHIGYSCcAlMyd0riEQpRqethxsAnOEZOutNatwztVjYk6ofQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHPFfpJZIoSEKJdKOvQDh4/shRoWQC1wQPyTMmfXwi9jM3HD3Z
 etdJmOfhrkcMI+4uxzQWdGAP/KPP1aaCpC10Mdkdn4oypS/NaTpSZG4IU1oNQY0R0SFxWz7mphf
 RQzOopTj5Il38V4nX3KWpP0JTUhXPO5I=
X-Gm-Gg: ASbGncuIOZA/KLCcP7ad9KmVXtxGhUvivquIlLks9fh2QgPsDjGAPNFky6KECBOkaZs
 XvNB4E84Tx/SVz9tVkt01cFV5Y5PTxJ2pMcY9wPfngJd+K0YUOLO7VMAL2SgP4azOBBCGBcq5I3
 geaMaMUQpGJUwhbNf7xye49LX3qIZmRkAE/4/ZxNY61BtSa7i/OU+BAqYZsXfcN5MJXtt24DlUV
 UZODQxA+wBu2Rht8Q==
X-Google-Smtp-Source: AGHT+IG3A/oOmllI9EeSAoQsDWP86EMFhEip9TdgHPyQgVBUC/O5Oz/hIMn4C9xwYI7HW8rOZ/1Xf242F/uEPbRnKTM=
X-Received: by 2002:a17:902:d487:b0:24c:cfcd:7356 with SMTP id
 d9443c01a7336-24ccfcd76demr13277595ad.0.1756994929228; Thu, 04 Sep 2025
 07:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250904071024.248230-1-liaoyuanhong@vivo.com>
In-Reply-To: <20250904071024.248230-1-liaoyuanhong@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Sep 2025 10:08:37 -0400
X-Gm-Features: Ac12FXxQ8C2ZxyIz6syHsc08W9fVB9NOOH0MS70w1XTsfUvvyR61j_e0zHNv8lc
Message-ID: <CADnq5_N0Hy=wdmJyCYuL9LWjzH=zoGtusz0iEO_jLHaH-pnQsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove redundant ternary operators
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Austin Zheng <austin.zheng@amd.com>, 
 Jun Lei <jun.lei@amd.com>, Peichen Huang <PeiChen.Huang@amd.com>, 
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, 
 Roman Li <roman.li@amd.com>, po-tchen <robin.chen@amd.com>,
 Anthony Koo <anthony.koo@amd.com>, 
 Harold Sun <Harold.Sun@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Dillon Varone <dillon.varone@amd.com>, Weiguang Li <wei-guang.li@amd.com>, 
 Charlene Liu <Charlene.Liu@amd.com>, 
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Thu, Sep 4, 2025 at 3:29=E2=80=AFAM Liao Yuanhong <liaoyuanhong@vivo.com=
> wrote:
>
> For ternary operators in the form of "a ? true : false" or
> "a ? false : true", if 'a' itself returns a boolean result, the ternary
> operator can be omitted. Remove redundant ternary operators to clean up t=
he
> code.
>
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c | 2 +-
>  .../drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c   | 2 +-
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c            | 2 +-
>  drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c      | 3 +--
>  drivers/gpu/drm/amd/display/modules/freesync/freesync.c       | 4 ++--
>  5 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.=
c b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c
> index e0558a78b11c..1c1228116487 100644
> --- a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c
> @@ -812,7 +812,7 @@ bool dcn10_link_encoder_validate_output_with_stream(
>                                         enc10, &stream->timing);
>         break;
>         case SIGNAL_TYPE_EDP:
> -               is_valid =3D (stream->timing.pixel_encoding =3D=3D PIXEL_=
ENCODING_RGB) ? true : false;
> +               is_valid =3D stream->timing.pixel_encoding =3D=3D PIXEL_E=
NCODING_RGB;
>         break;
>         case SIGNAL_TYPE_VIRTUAL:
>                 is_valid =3D true;
> diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_en=
coder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder=
.c
> index 6ab2a218b769..6f30b6cc3c76 100644
> --- a/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c
> @@ -397,7 +397,7 @@ static bool enc35_is_fifo_enabled(struct stream_encod=
er *enc)
>         uint32_t reset_val;
>
>         REG_GET(DIG_FIFO_CTRL0, DIG_FIFO_ENABLE, &reset_val);
> -       return (reset_val =3D=3D 0) ? false : true;
> +       return reset_val !=3D 0;
>  }
>  void enc35_disable_fifo(struct stream_encoder *enc)
>  {
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers=
/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
> index 0318260370ed..9deb03a18ccc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
> @@ -535,7 +535,7 @@ static bool dml2_validate_only(struct dc_state *conte=
xt, enum dc_validate_mode v
>         if (result)
>                 result =3D does_configuration_meet_sw_policies(dml2, &dml=
2->v20.scratch.cur_display_config, &dml2->v20.scratch.mode_support_info);
>
> -       return (result =3D=3D 1) ? true : false;
> +       return result =3D=3D 1;
>  }
>
>  static void dml2_apply_debug_options(const struct dc *dc, struct dml2_co=
ntext *dml2)
> diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c b/d=
rivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
> index b68bcc9fca0a..892907991f91 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
> @@ -138,8 +138,7 @@ void setup_dio_stream_attribute(struct pipe_ctx *pipe=
_ctx)
>                 stream_encoder->funcs->dvi_set_stream_attribute(
>                                 stream_encoder,
>                                 &stream->timing,
> -                               (stream->signal =3D=3D SIGNAL_TYPE_DVI_DU=
AL_LINK) ?
> -                                               true : false);
> +                               stream->signal =3D=3D SIGNAL_TYPE_DVI_DUA=
L_LINK);
>         else if (dc_is_lvds_signal(stream->signal))
>                 stream_encoder->funcs->lvds_set_stream_attribute(
>                                 stream_encoder,
> diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/dr=
ivers/gpu/drm/amd/display/modules/freesync/freesync.c
> index 71efd2770c99..ce421bcddcb0 100644
> --- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> +++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> @@ -226,8 +226,8 @@ static void update_v_total_for_static_ramp(
>         unsigned int target_duration_in_us =3D
>                         calc_duration_in_us_from_refresh_in_uhz(
>                                 in_out_vrr->fixed.target_refresh_in_uhz);
> -       bool ramp_direction_is_up =3D (current_duration_in_us >
> -                               target_duration_in_us) ? true : false;
> +       bool ramp_direction_is_up =3D current_duration_in_us >
> +                               target_duration_in_us;
>
>         /* Calculate ratio between new and current frame duration with 3 =
digit */
>         unsigned int frame_duration_ratio =3D div64_u64(1000000,
> --
> 2.34.1
>
