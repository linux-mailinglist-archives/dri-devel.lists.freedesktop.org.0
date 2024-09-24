Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F6198496B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D41C10E71B;
	Tue, 24 Sep 2024 16:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KW8zDAZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DB510E2B8;
 Tue, 24 Sep 2024 16:17:35 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2dee7861015so305474a91.2; 
 Tue, 24 Sep 2024 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727194655; x=1727799455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kssHnqH80Xc0+QcoY5MDsbuxwut+7UFnPYXFFQ2LW3w=;
 b=KW8zDAZPj1JHicqMyDV0XFwFxM5LVgQhKXRw/YyrpPLEKrh9YB8rI4j4ZWmQTYhnkf
 hKTW6hhJGp6653Fx/FVpN2dWL8lLMUegeV6aAzunOLtytfRUvfbxfaokCPMaP0fpiOdd
 mxM2Yc8e2vtTfMUKSMhGATn88VA3ib4uCH4kq5u4MH4Pecik0v+TivYksMQnpcD8TRFQ
 MUf3+QE/DIgySu42ePkWSLDVb2pzXru1BFlKAwcQSn7REZGKcXevwYUG4xYtwwsd5v0X
 fUpN1b1gRKgWmYFHqzqYbFTdVruJYe5ssD7QeOJ4VOep5t1zBXe7RXocvB+SAUmcrwOR
 Bzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727194655; x=1727799455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kssHnqH80Xc0+QcoY5MDsbuxwut+7UFnPYXFFQ2LW3w=;
 b=BH8U8DfVEaOvJYC3a0hLT8VtAnRRMhadr2XU2rXLN+VwFFYybEl62oIAhsz1QEfkvt
 Pk0MDDTp81QF4wesbmK7cLNs51S6zrkqtwi3HBJCngYGDWN4yA2J0lUVjJ1qFCrEmSu1
 9vBrxOIPkA9K0yEYwAYTMXgMiAZ1CSGv9JAdWVw4D9Iuq3Eqr/LMONzQJmZFLHGzIUKb
 6MKT++h/nGyHiYyA+LVD7iO2YTrpHq5fKaiWpIFJ2nh72rEztUbhy2cur7DC+jMf/RWU
 WYlxw5uJwqZXhp92ziCsYjO0VLqlpcBC8elPNcHxeba2VP6Qh4KaRUkCF7dnyTMIvPtJ
 UGNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsY74Ktg3h3CZkX7tma9jZiaWO3Ryh/+sv6eVtGEkjTCrUXIeklgmVVqOP/ppqQhU8hiSsg7/j@lists.freedesktop.org,
 AJvYcCXOwU4TBoF6rLevv24BjGIQNZyHqS3KwpPOKNtVqCwSPFL+R233Eklc4QP6VnU7O9pbgqDOVjMGnw3Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0lho36UmCIaOwZoxcsFgg9IZS2N2210XPWaj0BeFdW0neaqiD
 9mvNaVQiQDSjOO1ByQSpgjaGGFvQ6KDIkrD2XJjZaw9l/nMjNpwVCfhy9bUuAk7S26UM2BzKpkS
 MiXqMh+/kS+5mauw9khWz0yaJJsc=
X-Google-Smtp-Source: AGHT+IEjr/ZA9arb2W1VbQpNXq7KzjZDWz97ypC8TzPzWYevu/QK1ETv4A5nORi+wHtGJbAGUWsP406zUHHotaNpYEo=
X-Received: by 2002:a17:902:ec8b:b0:205:8820:fe1c with SMTP id
 d9443c01a7336-208d83dff51mr99001215ad.5.1727194654872; Tue, 24 Sep 2024
 09:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240920214342.14792-1-v.shevtsov@maxima.ru>
In-Reply-To: <20240920214342.14792-1-v.shevtsov@maxima.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2024 12:17:23 -0400
Message-ID: <CADnq5_OQShrB_RbYVVfFfQjTYZ=DfooH6B-BeMZ3DZt3OPxgMg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix typos in several function pointer
 checks
To: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alvin Lee <alvin.lee2@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, 
 Dillon Varone <dillon.varone@amd.com>, yi-lchen <yi-lchen@amd.com>,
 Alex Hung <alex.hung@amd.com>, 
 Chris Park <chris.park@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, 
 Tom Chung <chiahsuan.chung@amd.com>, George Shen <george.shen@amd.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Samson Tam <samson.tam@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
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

On Sat, Sep 21, 2024 at 3:48=E2=80=AFAM Vitaliy Shevtsov <v.shevtsov@maxima=
.ru> wrote:
>
> Fix several copypaste mistakes in *_disable_link_output() functions where
> an improper function pointer is checked before dereference.
>
> Found by Linux Verification Center (linuxtesting.org) with Svace.
>
> Signed-off-by: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
> ---
>  drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/=
drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> index d52ce58c6a98..c2364cb66d0b 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> @@ -3258,7 +3258,7 @@ void dce110_disable_link_output(struct dc_link *lin=
k,
>          * from enable/disable link output and only call edp panel contro=
l
>          * in enable_link_dp and disable_link_dp once.
>          */
> -       if (dmcu !=3D NULL && dmcu->funcs->lock_phy)
> +       if (dmcu !=3D NULL && dmcu->funcs->unlock_phy)
>                 dmcu->funcs->unlock_phy(dmcu);
>         dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTE=
R_DISABLE_LINK_PHY);
>  }
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c b/=
drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
> index 4e93eeedfc1b..5b6cf2a8e38d 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
> @@ -478,7 +478,7 @@ void dcn314_disable_link_output(struct dc_link *link,
>          * from enable/disable link output and only call edp panel contro=
l
>          * in enable_link_dp and disable_link_dp once.
>          */
> -       if (dmcu !=3D NULL && dmcu->funcs->lock_phy)
> +       if (dmcu !=3D NULL && dmcu->funcs->unlock_phy)
>                 dmcu->funcs->unlock_phy(dmcu);
>         dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTE=
R_DISABLE_LINK_PHY);
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> index a36e11606f90..84153682af1a 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> @@ -1384,10 +1384,10 @@ void dcn32_disable_link_output(struct dc_link *li=
nk,
>         link->phy_state.symclk_state =3D SYMCLK_OFF_TX_OFF;
>
>         if (signal =3D=3D SIGNAL_TYPE_EDP &&
> -                       link->dc->hwss.edp_backlight_control &&
> +                       link->dc->hwss.edp_power_control &&
>                         !link->skip_implict_edp_power_control)
>                 link->dc->hwss.edp_power_control(link, false);
> -       else if (dmcu !=3D NULL && dmcu->funcs->lock_phy)
> +       else if (dmcu !=3D NULL && dmcu->funcs->unlock_phy)
>                 dmcu->funcs->unlock_phy(dmcu);
>
>         dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTE=
R_DISABLE_LINK_PHY);
> --
> 2.46.1
>
