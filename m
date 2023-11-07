Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F77E439E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 16:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9B10E0A3;
	Tue,  7 Nov 2023 15:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E38110E0A3;
 Tue,  7 Nov 2023 15:39:52 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1f03fdfcfacso3356223fac.0; 
 Tue, 07 Nov 2023 07:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699371591; x=1699976391; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JW7foL1oxcRpbeUsbIlYVRRPx5rqbcU/gbE+Wj+BaFE=;
 b=jB6+3rRGr/IXTmZr/p4IuCS3G8tHAa/2MfBtpHs7clpRmpAt8A47rzUGcq5Kthjf/Y
 Ig+/QjDJ1UNroVkmgPTtBOUM8GbXtU+3x+jbp4sF/4lXZnPb2OpjGwFBnKv+ORtnpklm
 vA979MgvuCAMXtRO5apk30wifZKC1AIjaEdXD41u6gK5yo0GuZCFI2l5tcXpFjo1vBHa
 g2DweJExsQisxQ1weTz7gvGMGhJ5DU/VAY350KBTOS5nm9ij80eFOtq5+PNw8V2zUChm
 k/xrIbz7hcHvBXrcRG2CCRciQIUZ52YQOiOi5ZfVI8t5I8T13PB/fF9gt5vB8pEvYbFb
 wqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699371591; x=1699976391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JW7foL1oxcRpbeUsbIlYVRRPx5rqbcU/gbE+Wj+BaFE=;
 b=apvuAHcGB24kl+xwMlV3flgEbwbTb6y1QAk1p5I+LWPK8Ppyfn4e7QweeVkKJFXiW3
 ioxef9EUgw6YSF7yoLcvsxoVuj9r3pNyzBfpwZhbfQrLLZ88I1Fj0kiZOMj66NWixxqs
 YkKqUIDEAeY3UPsAZMxhLcgIA1x795v6iNZSOBqLhKJUE40DvyWFMvM2QoI7g3cqH5sv
 zwuq/dRZDEou+QcXEibFRoE+A0VSGoDqLpJ8/TUYNhrJCxnfYZ+M9gwrsZ2uZKO9zaBw
 L4Haj8bt/bSZqfYku9uf58gbFw+Yq+7TWkJnTcTYkGfDFL7X3g3AuU1ukQw1AWeE8Kvd
 Nrfg==
X-Gm-Message-State: AOJu0YyZPLLAFGKwRO0ZjOB/3KxsGr9XqtDym2Y715ohujvg0E8w5VvT
 ESFzR8KYYM3BJD/3m/hcrJ2omVzAhE+Ty9hd7xU=
X-Google-Smtp-Source: AGHT+IFvtIGgWBLyu7RRG3uFcIzUM0xQQOleEl4WYezcoWx58X/a2dPjF56SgV0wq6ut3+Af0EixxFZNfu5sL4Wnq0k=
X-Received: by 2002:a05:6870:168a:b0:1ef:bae2:e3ac with SMTP id
 j10-20020a056870168a00b001efbae2e3acmr3487366oae.55.1699371591585; Tue, 07
 Nov 2023 07:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20231107082839.92061-1-jose.pekkarinen@foxhound.fi>
In-Reply-To: <20231107082839.92061-1-jose.pekkarinen@foxhound.fi>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Nov 2023 10:39:40 -0500
Message-ID: <CADnq5_NpMmo5SdXdStcRMGfcz0v6Nu-ZTORsSHo4_m_piAB77Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: clean up redundant conversions to bool
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
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
Cc: sunpeng.li@amd.com, Bhawanpreet.Lakha@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, alexander.deucher@amd.com, christian.koenig@amd.com,
 linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 7, 2023 at 4:44=E2=80=AFAM Jos=C3=A9 Pekkarinen
<jose.pekkarinen@foxhound.fi> wrote:
>
> This patch will address the following couple of warnings retrieved by
> using coccinelle, where there is an explicit conversion to bool that
> are redundant.
>
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:94:102-107: WARN=
ING: conversion to bool not needed here
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:102:72-77: WARNI=
NG: conversion to bool not needed here
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@foxhound.fi>

Thanks for the patch, but this was already fixed by Srinivasan a while ago.

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> index 32d3086c4cb7..5ce542b1f860 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> @@ -91,7 +91,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struc=
t amdgpu_dm_connector *ac
>         pr_config.replay_supported =3D true;
>         pr_config.replay_power_opt_supported =3D 0;
>         pr_config.replay_enable_option |=3D pr_enable_option_static_scree=
n;
> -       pr_config.replay_timing_sync_supported =3D aconnector->max_vfreq =
>=3D 2 * aconnector->min_vfreq ? true : false;
> +       pr_config.replay_timing_sync_supported =3D aconnector->max_vfreq =
>=3D 2 * aconnector->min_vfreq;
>
>         if (!pr_config.replay_timing_sync_supported)
>                 pr_config.replay_enable_option &=3D ~pr_enable_option_gen=
eral_ui;
> @@ -99,7 +99,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struc=
t amdgpu_dm_connector *ac
>         debug_flags =3D (union replay_debug_flags *)&pr_config.debug_flag=
s;
>         debug_flags->u32All =3D 0;
>         debug_flags->bitfields.visual_confirm =3D
> -               link->ctx->dc->debug.visual_confirm =3D=3D VISUAL_CONFIRM=
_REPLAY ? true : false;
> +               link->ctx->dc->debug.visual_confirm =3D=3D VISUAL_CONFIRM=
_REPLAY;
>
>         link->replay_settings.replay_feature_enabled =3D true;
>
> --
> 2.39.2
>
