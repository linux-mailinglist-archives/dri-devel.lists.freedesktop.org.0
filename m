Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC59A20D24
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 16:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCE410E68C;
	Tue, 28 Jan 2025 15:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bs3TVa2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B8910E68B;
 Tue, 28 Jan 2025 15:35:50 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2ef718cb473so1192359a91.1; 
 Tue, 28 Jan 2025 07:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738078550; x=1738683350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ll9yz4s9tbNGn79Y5DlxGFvaYJ0PUHi0VPEFTFkzAO4=;
 b=bs3TVa2aCE4U2rtrSQDgNtDsYsqBI0XSoNHNzOaW/icEqehQ8lEERlHAcufL4KcWEi
 UD0UGc7uL0t7lm3DX9FO9myqAvO3tvrqY9RCwdmDpSw5SM1BM3WFxIB/SxHWSDY+obdX
 i2bxnYx5mzIPQhK9bH8rHCfb2WYVxFzlVmZVw8vRpoWu2D+V9Rqz6a1CUwYqHoBgebpv
 wGILVIjEnMUUhrB4EFXiP7xr6rgSUSf2fSDxa5v+3nTgedyzyA6B/KDLYmxlY6oeoY8P
 XpCaiAHhwif2uvg3xi8COnBIIEp1O25tUI13eCZRmNYsyBGo7iaYJ7ozquL1aiMWBe9x
 4GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738078550; x=1738683350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ll9yz4s9tbNGn79Y5DlxGFvaYJ0PUHi0VPEFTFkzAO4=;
 b=RRG1XZmPPKRdKhu5dX8g5AgQRoTiDSCQdVGeEO0yU6U2mLAm/CGVyZtjF/K7+p3o5M
 42mXcpIV1Kstp2VtQOtDH2r4J15pSGGOM1IfvxR3QOtGryIWxYRbuY1y6v1T7pO68TOm
 6CQNSNndEsLcyYbvhpBatbnCti1w9teerBVIoFEOgsyZAOiKQHxMeUWs9ZI4OzJNmluv
 DGhUZWXrKm21fhaDNIcM7jdhydHVt8t+c1Q5NGsQjUzLdaDGfL3JFwPjkTjcItPotZ88
 YX+wTtXXEzZEnkX9OBojkdzpE4Y9y88J81fPIsVvLqct8dlalqZMq4wzcal+xHuPaQKw
 q+tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZAx4dT0nieTHpKZzsw3tkgn3/tlQlO306uLCLWLP45sw78Sp6CxhHSJZfV9E+A2p3kHNabPlB@lists.freedesktop.org,
 AJvYcCVtPvJ70AvKX+ISUZgeFA1dyWyHpxS5m36Gv3ZRGlPifxrY+NjvWwEtuL5ABg4FxqxN4umWwUl9Su06@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaaQDG2wsZ2eT6MyKgvA06f7J4C19zrloXCboereIKQ2iyLLvx
 Ku9K+Y+Vu93x9eJEe4VvdA4CfUtfB74fF7fNT8C8olaAxc0yAVeJYFFEtsbByXDcKsZa088knO/
 V0i6uSw57hrx9NIqE4FBH5xy6/HA=
X-Gm-Gg: ASbGnctN4m5fsUBKD7KSdwC0WNK8FdVNB+8HByHmFcU1DDxuSruzEkkwxZ1Qr6aRmGF
 HguI5PP+RDyqH1YtxZ4fgscuhx6ADo/QLfecUyzIYBbk+HjEKF5PGHYVtK9V7KJ6N7DSGcGig
X-Google-Smtp-Source: AGHT+IH4r/aE06szz4+MqU4sWiG7qbTaj0WudyIu/mZ4AAFIY1oiLtMuoIJTu5Fhb3uXJzIiJ03HVskgfxc/dYDo2tQ=
X-Received: by 2002:a17:90a:d64e:b0:2ee:d372:91bd with SMTP id
 98e67ed59e1d1-2f7e3efc78dmr15701307a91.2.1738078550217; Tue, 28 Jan 2025
 07:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20250128005135.168681-1-mwen@igalia.com>
 <2b35e1ea-e7f7-4852-a088-80b71a82b780@amd.com>
In-Reply-To: <2b35e1ea-e7f7-4852-a088-80b71a82b780@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jan 2025 10:35:38 -0500
X-Gm-Features: AWEUYZk7Q4OJs6BE67uajAmjNapMM2LyzGRkCQONGCdGyZHE0MRM2MMKdyhskbA
Message-ID: <CADnq5_Nzya6F0Vjb0+VpX5Rme9b8dN=jWQ2iNUkGvR-vPq69-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: restore invalid MSA timing check for
 freesync
To: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, 
 mario.limonciello@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
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

On Tue, Jan 28, 2025 at 10:03=E2=80=AFAM Harry Wentland <harry.wentland@amd=
.com> wrote:
>
>
>
> On 2025-01-27 19:41, Melissa Wen wrote:
> > This restores the original behavior that gets min/max freq from EDID an=
d
> > only set DP/eDP connector as freesync capable if "sink device is capabl=
e
> > of rendering incoming video stream without MSA timing parameters", i.e.=
,
> > `allow_invalid_MSA_timing_params` is true. The condition was mistakenly
> > removed by 0159f88a99c9 ("drm/amd/display: remove redundant freesync
> > parser for DP").
> >
> > CC: Mario Limonciello <mario.limonciello@amd.com>
> > CC: Alex Hung <alex.hung@amd.com>
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3915
> > Fixes: 0159f88a99c9 ("drm/amd/display: remove redundant freesync parser=
 for DP")
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
>
> Yeah, we need to check IGNORE_MSA_TIMING_PARAM before
> allowing Freesync / adaptive sync.
>
> Thanks for the fix.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >
> >
> > Mario, Alex,
> >
> > I can't reproduce the reported issue on my side, but reporters mentione=
d
> > this fixes their black screen issue. I examined the code around it and
> > overall restoring this condition in this way seems right.
> >
> > For the future, we can consider using
> > `drm_dp_sink_can_do_video_without_timing_msa` instead.
> >
> > Anyway, from my tests, what I can say is that things seem stable and I
> > didn't noticed any changes.
> >
> > Can you verify how it goes on the CI?
> >
> > Thanks,
> >
> > Melissa
> >
> >
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index c9e8982a8804..da550a257f09 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -12381,10 +12381,14 @@ void amdgpu_dm_update_freesync_caps(struct dr=
m_connector *connector,
> >
> >       if (edid && (sink->sink_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT ||
> >                    sink->sink_signal =3D=3D SIGNAL_TYPE_EDP)) {
> > -             amdgpu_dm_connector->min_vfreq =3D connector->display_inf=
o.monitor_range.min_vfreq;
> > -             amdgpu_dm_connector->max_vfreq =3D connector->display_inf=
o.monitor_range.max_vfreq;
> > -             if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector-=
>min_vfreq > 10)
> > -                     freesync_capable =3D true;
> > +             if (amdgpu_dm_connector->dc_link &&
> > +                 amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid=
_MSA_timing_param) {
> > +                     amdgpu_dm_connector->min_vfreq =3D connector->dis=
play_info.monitor_range.min_vfreq;
> > +                     amdgpu_dm_connector->max_vfreq =3D connector->dis=
play_info.monitor_range.max_vfreq;
> > +                     if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_co=
nnector->min_vfreq > 10)
> > +                             freesync_capable =3D true;
> > +             }
> > +
> >               parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> >
> >               if (vsdb_info.replay_mode) {
>
