Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2026BF234
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBCF10E3F5;
	Fri, 17 Mar 2023 20:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A2B10E0FF;
 Fri, 17 Mar 2023 20:15:36 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id s41so4641408oiw.13;
 Fri, 17 Mar 2023 13:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679084135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ssXa7B9Q8qv4Ykfx+ca3jrD7S00rXq3zvQFoTDsLna4=;
 b=G5mTBIbKn3hcD/N0ZdeF7HIwdAC8D+0YMLQkZmhv5iXmstGfrAM65vsTga9nN7i2wd
 PE9tmji5n0Gr2FDKPlr1Ne2P8E+C4CH6WPTcgYUKW5SCFbPcYKjyXKwpzixWqqN5T0V5
 sErftA+Vn6MmY7V1HTN2GPhCWtCyCce13HgtXhZyCxth+mTzMHilnJ4BIFlCN5ton1oc
 Pi60wgadA8N+XcJMBiGFBHbm4i/ZQqo4s+2lG9Xlqtt673FTwD1eXKtrBQKyhhahGLOH
 jQ/CgdL5LDayGA8TVTBzXQw4PUC8TRGJTuVTu/PnJxQa2ukF1FYzNju427liu2of5k2T
 /0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679084135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ssXa7B9Q8qv4Ykfx+ca3jrD7S00rXq3zvQFoTDsLna4=;
 b=OkOa4PhqTR+6QgxYGFIwkV0zUxwNTqnJD/s2MOPNDMrS1K5MN8Y2yMk367oyRIcpeZ
 cvlZjb6XX6EWgVigr3I2mR/FZW/QMlroT6TDmsNg+HxMifvi2UMgWTRxpul2nk39NHll
 +vB7GhdQizfqe9At60IRjYeBueQg17+ZSa2+ojQkkrjrVUIkQBGgb8wrug0tXBjCvrDy
 ixpZTpdchVeY2DOuA8tvwtdYS+WtjSu08GN+uu7VbbEpfv90FCzLlVqgYhCxUPJ9eWxp
 uh9ZATCtRYstgGvuTOEk/ZKvnT4F+w7qOdl2fQdDQkknepf9LfSDFlknCfE7f0f7/Ohl
 4eGQ==
X-Gm-Message-State: AO0yUKVwfwzZzSfkaWzOf7n4E/WJ1sNVELfzLR8SdyJRfAQ5y0CixKba
 untZQHitRP7c3g5Ix1H1DMdSGshfD/g8GnIdxK8=
X-Google-Smtp-Source: AK7set/bq+3Ab6sQ2VkRehpQP42jZXWmATFRqbNM/pQ1TKr6YG6iyG9jkGE8uiXf++HGwe6TOVCh7TYjfwDo1Kz4vnM=
X-Received: by 2002:a05:6808:6384:b0:386:9c6c:ebc with SMTP id
 ec4-20020a056808638400b003869c6c0ebcmr3705113oib.3.1679084135712; Fri, 17 Mar
 2023 13:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-2-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-2-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:15:24 -0400
Message-ID: <CADnq5_MxtNaDZ8Q2DOnVxjt=eVquNeYJF=DZfRdtS==-VQ7GMQ@mail.gmail.com>
Subject: Re: [PATCH 01/37] drm/amd/display/dc/dc_hdmi_types: Move string
 definition to the only file it's used in
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
Cc: Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Mar 17, 2023 at 4:22=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22:
>    warning: =E2=80=98dp_hdmi_dongle_signature_str=E2=80=99 defined but no=
t used [-Wunused-const-variable=3D]
>
> [snipped 400 similar lines for brevity]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Wenjing Liu <wenjing.liu@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h       | 1 -
>  drivers/gpu/drm/amd/display/dc/link/link_detection.c | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h b/drivers/gpu=
/drm/amd/display/dc/dc_hdmi_types.h
> index c364744b4c835..b015e80672ec9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
> @@ -50,7 +50,6 @@ struct dp_hdmi_dongle_signature_data {
>
>  /* DP-HDMI dongle slave address for retrieving dongle signature*/
>  #define DP_HDMI_DONGLE_ADDRESS 0x40
> -static const uint8_t dp_hdmi_dongle_signature_str[] =3D "DP-HDMI ADAPTOR=
";
>  #define DP_HDMI_DONGLE_SIGNATURE_EOT 0x04
>
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drive=
rs/gpu/drm/amd/display/dc/link/link_detection.c
> index fee71ebdfc733..8cfeddfb65c89 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -60,6 +60,8 @@
>   */
>  #define LINK_TRAINING_MAX_VERIFY_RETRY 2
>
> +static const uint8_t dp_hdmi_dongle_signature_str[] =3D "DP-HDMI ADAPTOR=
";
> +
>  static enum ddc_transaction_type get_ddc_transaction_type(enum signal_ty=
pe sink_signal)
>  {
>         enum ddc_transaction_type transaction_type =3D DDC_TRANSACTION_TY=
PE_NONE;
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
