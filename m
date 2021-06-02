Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A572397E7B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 04:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998EA6EB55;
	Wed,  2 Jun 2021 02:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9848B6EB52;
 Wed,  2 Jun 2021 02:10:39 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id x15so1249523oic.13;
 Tue, 01 Jun 2021 19:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NcO1usTOKbaR3rWsTNsRVfXwWTgve8HOLpfInMO7jOg=;
 b=stwjulCJ/ezQ81/3ev84sUD1Herx16tkPjrGfAC4klYBObtf4nW6dsCWcWEVmHOEQM
 9C/nt8fTtGL0ylO2WX3SHUzzQert+vvwvA1QE3RoRzzYgnOh9LThqXneewVZQJzmIe9A
 +pfn5eBJDHpeKyoapttvmYrhPXW2eSDA6inwlTagJ6KipEXaCKbasMUncoTBEDdPuB7v
 7+gC2PHJIyjhqklE0wodXnQ1AY5h/HuczYbrLoYZ0fMcFZipJzI96klhjGQQxgWdFmpx
 QCW0M+A3mIArXSbsQaNA2V+7NRvJaZ0juQtoyO9+BP0FSPRo+m0ot+LvdoY3E42/Lgau
 7i+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NcO1usTOKbaR3rWsTNsRVfXwWTgve8HOLpfInMO7jOg=;
 b=RuOICVupnodear++q9OZXW0nynxJLZmvV1B9oMImSGsaLEiu50rGf7949jx7WRRnUt
 kvdT0Lb4siTdYDj3XmPDl6Rg/0dr+3WKI0nfhFwEfJEy0FrH9kLa1TEhpQBdbkAmMePQ
 PjqpaxKgc4LM9UJmMWEeMniiq/8EFWDopIlQLMEV0TJSYRzvsuNa74n0ioXJUkW/UOms
 JrudN2GliMusKCl3DoTDCU6ZkMtYtKpkWqMFk/GiD7riHjZsvMIa+kjub+kzbUgt8/KE
 fg7/9EBtH4vzeAMJFDYAh7y2sQgy/N0OoIEzsWKYoFANtOjEk6gKT9YSNWz7GYt6+WQL
 qPyg==
X-Gm-Message-State: AOAM532lWPBc3F8PkJvBpr5tCMkBiatcdvvmz6tJbpo9D7OeDjgoSG5M
 MxvV9By16ZuYpfjAuLAF21EWoRSzFdSuJDDBhV67J2TZ
X-Google-Smtp-Source: ABdhPJz5WcC84uOEnyxWV+Hz6xl4AOEOsIx+R3/ZGWzYiqB/HKGc6k5jSWbYXvnBwF1Su+E93seRlnSt/54viidHYSY=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr19934254oiw.123.1622599838843; 
 Tue, 01 Jun 2021 19:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210601081400.123089-1-libaokun1@huawei.com>
In-Reply-To: <20210601081400.123089-1-libaokun1@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Jun 2021 22:10:27 -0400
Message-ID: <CADnq5_NuuogmYcmTDofwt0txUHJhx1EJvseeUWwQdq39z74MCw@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAtbmV4dF0gZHJtL2FtZC9kaXNwbGF5OiBmaXggd2FybmluZzog4oCYdQ==?=
 =?UTF-8?B?cGRhdGVfZHNjX2NhcHPigJkgYW5kIOKAmGFwcGx5X2RzY19wb2xpY3lfZm9yX3N0cmVhbeKAmSBkZWZp?=
 =?UTF-8?B?bmVkIGJ1dCBub3QgdXNlZA==?=
To: Baokun Li <libaokun1@huawei.com>
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
Cc: Wayne Lin <Wayne.Lin@amd.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 YueHaibing <yuehaibing@huawei.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Dave Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, yu kuai <yukuai3@huawei.com>,
 yangjihong1@huawei.com, Nikola Cornij <nikola.cornij@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Jun 1, 2021 at 4:04 AM Baokun Li <libaokun1@huawei.com> wrote:
>
> Fixes gcc '-Wunused-function' warning:
>
> =E2=80=98update_dsc_caps=E2=80=99 and =E2=80=98apply_dsc_policy_for_strea=
m=E2=80=99 are only used
> if 'CONFIG_DRM_AMD_DC_DCN' is defined,
>
> however, it's defined even if 'CONFIG_DRM_AMD_DC_DCN' is not defined.
> Thus gcc will report following warning
> if 'CONFIG_DRM_AMD_DC_DCN' is not defined:
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5572:13: warn=
ing:
> =E2=80=98apply_dsc_policy_for_stream=E2=80=99 defined but not used [-Wunu=
sed-function]
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5556:13: warn=
ing:
> =E2=80=98update_dsc_caps=E2=80=99 defined but not used [-Wunused-function=
]
>
> Thus move the definition of =E2=80=98update_dsc_caps=E2=80=99 and
> =E2=80=98apply_dsc_policy_for_stream=E2=80=99 inside define macro to fix =
it.
>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f0adfda32213..e0af394103aa 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5553,6 +5553,7 @@ static void dm_enable_per_frame_crtc_master_sync(st=
ruct dc_state *context)
>         }
>  }
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>  static void update_dsc_caps(struct amdgpu_dm_connector *aconnector,
>                                                         struct dc_sink *s=
ink, struct dc_stream_state *stream,
>                                                         struct dsc_dec_dp=
cd_caps *dsc_caps)
> @@ -5560,12 +5561,10 @@ static void update_dsc_caps(struct amdgpu_dm_conn=
ector *aconnector,
>         stream->timing.flags.DSC =3D 0;
>
>         if (aconnector->dc_link && sink->sink_signal =3D=3D SIGNAL_TYPE_D=
ISPLAY_PORT) {
> -#if defined(CONFIG_DRM_AMD_DC_DCN)
>                 dc_dsc_parse_dsc_dpcd(aconnector->dc_link->ctx->dc,
>                                       aconnector->dc_link->dpcd_caps.dsc_=
caps.dsc_basic_caps.raw,
>                                       aconnector->dc_link->dpcd_caps.dsc_=
caps.dsc_branch_decoder_caps.raw,
>                                       dsc_caps);
> -#endif
>         }
>  }
>
> @@ -5578,7 +5577,6 @@ static void apply_dsc_policy_for_stream(struct amdg=
pu_dm_connector *aconnector,
>
>         link_bandwidth_kbps =3D dc_link_bandwidth_kbps(aconnector->dc_lin=
k,
>                                                         dc_link_get_link_=
cap(aconnector->dc_link));
> -#if defined(CONFIG_DRM_AMD_DC_DCN)
>         /* Set DSC policy according to dsc_clock_en */
>         dc_dsc_policy_set_enable_dsc_when_not_needed(
>                 aconnector->dsc_settings.dsc_force_enable =3D=3D DSC_CLK_=
FORCE_ENABLE);
> @@ -5609,8 +5607,8 @@ static void apply_dsc_policy_for_stream(struct amdg=
pu_dm_connector *aconnector,
>
>         if (stream->timing.flags.DSC && aconnector->dsc_settings.dsc_bits=
_per_pixel)
>                 stream->timing.dsc_cfg.bits_per_pixel =3D aconnector->dsc=
_settings.dsc_bits_per_pixel;
> -#endif
>  }
> +#endif
>
>  static struct drm_display_mode *
>  get_highest_refresh_rate_mode(struct amdgpu_dm_connector *aconnector,
> --
> 2.31.1
>
