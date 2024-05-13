Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A148C4292
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 15:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F5910E448;
	Mon, 13 May 2024 13:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a0heNM/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC3010E448;
 Mon, 13 May 2024 13:53:55 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-5f415fd71f8so3426787a12.3; 
 Mon, 13 May 2024 06:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715608435; x=1716213235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XAnoDJSbm35mkWEmCp7bTFRuIjY0i9tRv55LC18e0E=;
 b=a0heNM/342du9T7KjwpW8DQOn1n4eXACaeyHLxV9TkWB3QvybJFFORLBwk5/N9Afqk
 ANNtW4Cbz9s2K3wbicZSaF/Dx/CCE9AI/A45QyQE7PbIFJrEsaZolb/uu5v0PbCKM+4R
 YYn+fAlwbfnTp+lZuXi9kKMrjsIRBMpmmufSJBsZse4yppbD6OiG6/em1ueo9q7ybikf
 5nDPok8rxmW4YjbZU7e3aE5plXdbJQqdbHOKYDjHuCVMyQz9oefODkqoXP+UVrHSYZgk
 Z0mLlxwXh4qTaDpb0++P1pcPYi7TGg2CswA/lsccTsBgnCaek7U4FqGicqCtiOL+15cR
 jHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715608435; x=1716213235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/XAnoDJSbm35mkWEmCp7bTFRuIjY0i9tRv55LC18e0E=;
 b=s4wgZxQXbci+nXxjwv2BNGl12VHuC/8kZffGNjhop4lJKz8QOkg6DNYLcsMKy1hmdG
 QToFrOZUDJGGsUVtKj4wlnTumBQVAV6xk97Dk5vms5iBtzAwv5ToHrVBziG9dFTwMP7V
 TCkD1EeH4ldxepvqx+CbqeDRbGeYLU8tQwJ+YvgAA3ZZMx8YD1HuMf/0ZPa87K8GgEWe
 y4u0yPUqiDz9O6Rg0LxjY8yBWSi61BeJhnUygYqVmdgyoybUQ/Bqb11hoLM0JqeifTyk
 Kouk+LIFrqQmf5TSnxf7B7Vf92BjEy92vqsB8gvxXzn7iJevDBm9F5BHAvUcATKeD5Rp
 zRfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmsZDt1te3EHhACz3i5YBawu3aKNhtus9FHU4OhCtwR8JBI20LBMxDeClBjW21oMvHm29xs7vxevLvkUSuQh9L/8mVkA+I95RLwMtiyE1ZYYd+4pkVgPaZXjJ7IWTeOwYgNYQhsPSNn+2rsejeRxZi9YDkWU+046hje8Z4fjf3qGz7b6Brt1YUnp++GuQ=
X-Gm-Message-State: AOJu0YzlbimD+U44DFGisx1SZ6G80AbyqEXlp/LfiQb1+u0tPkvJXXej
 vOE1MasWdYRbHAmvBVjeSCWPvrYrlZCNASxpVlMebb+8kJiqrL0PpXoN8o33Ulg6RCjK8P7Dqt6
 z1oYEEuAIopBiCaMcsirqSFJVqABF4Q==
X-Google-Smtp-Source: AGHT+IHMnE4UJlTZnRKhAph3kJZaljotuipG8p8M8RM+KfpIwnf062H0rgkULVinDpGKKtLNtMwyVaor20KAGIkAPFs=
X-Received: by 2002:a17:90a:5901:b0:2b3:28be:dd6e with SMTP id
 98e67ed59e1d1-2b6ccd6baedmr7789528a91.33.1715608435133; Mon, 13 May 2024
 06:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715353572.git.jani.nikula@intel.com>
 <CADnq5_OMOuz_T-OUZ4jVELEAL1FfFdqoFukKdvZA0eSoPQExLg@mail.gmail.com>
 <87seylewf5.fsf@intel.com>
In-Reply-To: <87seylewf5.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 May 2024 09:53:43 -0400
Message-ID: <CADnq5_N75R4G-w=TXz0-kPNseomSK+s4OB8OMyng_tAeGkU+=g@mail.gmail.com>
Subject: Re: [RESEND 0/6] drm, nouveau/radeon/amdpgu: edid_blob_ptr cleanups
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
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

On Mon, May 13, 2024 at 8:20=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Fri, 10 May 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> > On Fri, May 10, 2024 at 11:17=E2=80=AFAM Jani Nikula <jani.nikula@intel=
.com> wrote:
> >>
> >> I've sent this some moths ago, let's try again...
> >>
> >> BR,
> >> Jani.
> >>
> >> Jani Nikula (6):
> >>   drm/nouveau: convert to using is_hdmi and has_audio from display inf=
o
> >>   drm/radeon: convert to using is_hdmi and has_audio from display info
> >>   drm/radeon: remove radeon_connector_edid() and stop using
> >>     edid_blob_ptr
> >>   drm/amdgpu: remove amdgpu_connector_edid() and stop using
> >>     edid_blob_ptr
> >>   drm/edid: add a helper for EDID sysfs property show
> >>   drm/connector: update edid_blob_ptr documentation
> >
> > Series is:
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> Thanks, do you want to pick these up via your tree? And do you expect a
> proper R-b before merging?

Feel free to take them via drm-misc if you'd prefer to land the whole
set together, otherwise, I can pick up the radeon/amdgpu patches.

Alex


>
> BR,
> Jani.
>
>
> >
> >>
> >>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 16 ---------
> >>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.h    |  1 -
> >>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 +--
> >>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 +--
> >>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 +--
> >>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 +--
> >>  drivers/gpu/drm/drm_crtc_internal.h           |  2 ++
> >>  drivers/gpu/drm/drm_edid.c                    | 33 ++++++++++++++++++=
+
> >>  drivers/gpu/drm/drm_sysfs.c                   | 24 ++------------
> >>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  8 ++---
> >>  drivers/gpu/drm/nouveau/dispnv50/head.c       |  8 +----
> >>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  2 +-
> >>  drivers/gpu/drm/radeon/atombios_encoders.c    | 10 +++---
> >>  drivers/gpu/drm/radeon/evergreen_hdmi.c       |  5 ++-
> >>  drivers/gpu/drm/radeon/radeon_audio.c         | 13 ++++----
> >>  drivers/gpu/drm/radeon/radeon_connectors.c    | 27 ++++-----------
> >>  drivers/gpu/drm/radeon/radeon_display.c       |  2 +-
> >>  drivers/gpu/drm/radeon/radeon_encoders.c      |  4 +--
> >>  drivers/gpu/drm/radeon/radeon_mode.h          |  2 --
> >>  include/drm/drm_connector.h                   |  6 +++-
> >>  20 files changed, 79 insertions(+), 100 deletions(-)
> >>
> >> --
> >> 2.39.2
> >>
>
> --
> Jani Nikula, Intel
