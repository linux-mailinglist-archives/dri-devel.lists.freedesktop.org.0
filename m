Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E08C281D
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B5710E7E2;
	Fri, 10 May 2024 15:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HlfQ1CQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB2E10E7E2;
 Fri, 10 May 2024 15:45:49 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2b3646494a8so1760764a91.2; 
 Fri, 10 May 2024 08:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715355949; x=1715960749; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCyaxRcT2+wbZVhzZ1BB+Dli+tMLqeMid3YFa7QuT48=;
 b=HlfQ1CQzInpT1uaCJ9ZTwCTSO0mcS50Ej2uRS/4Z7MzDkq8+C8J0aSqtRh6rkjMX+G
 9iAh92sFos1TcnnHAzOeCJ+lFsbmozaSBK7OBjtmzRgb+cJHH9dccD9XUbNboKldp20B
 ghxaEnpLucJY3OlkqzS+xLu+UIUkTECjqN3qRC2eyfzB6VA61EdF7wdfgZu1aJC63Kfv
 EJKYd/lTcnfU/pANckgb9U+u/aQtu8MgAsAtB0O5LX7lW+HVYgO5asMj3hKLN8UzArJg
 uA6yQsr5XxhK9TzFLfpD1GncN7oXHdA2CbPsya5z3civnDYoEuLn5bLPLDkdZBoksnzd
 4X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715355949; x=1715960749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eCyaxRcT2+wbZVhzZ1BB+Dli+tMLqeMid3YFa7QuT48=;
 b=qYWmCgznZsluWppKwDbicKj8E5SUHoA01a/rchZkW0W2Uuyg7qAABVAsx3jjbnqqYE
 JK3htMU2PFP0cxPO/UxBh+o8JfhpoFwq1mrFTLYOsP2Ivs5ZBZ06DL+SDE5wQvkcYJp8
 5cgFn9WN/Di+JF0UJCj0uqmjpaQiV9RH1KDjP2yxt3pt16cbmbJWnMW0YUm7mu1Q13ry
 hGAIU1v4GLtSsXUMkVdjraVV7qOGYHnuzH4lUog+fZZcqVahphoj78vRhRmhxSTeXUrD
 z9K8DzUdg6cRmf+ObTX170z6zGMEA2E3RMDpmxFXHUdVEjKa43hnB/EDJMXj9vwPWvNF
 5DhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwOsTv+kpVX/vdvna5wp06Qu4jWi8d4/7KQ2Txk9A9uce3hpvJR549SKLqy7Nop93zyalFbI+5shARtEUQ///6E+SbSKd/9wOalUqziDitX/xPKmYN1pTlmvy0OfKGM8vI+9OHDxlrszy5c7ReduOS73RERxcUigMqeBgDquN70AQY2UGY7eW/jTAucUU=
X-Gm-Message-State: AOJu0YzLxiuGkgZwHx7OCviCFbWlz4Hx1QvcCCeRj1PYhScgAxf7KJ/0
 lHU4S5E7p+mqYizqw+J1K7A6syL73wwuY3EzhY/C5s1l9FCVHqpxvJ9DMSbknpNVk/+AqHnZHSf
 OfIPWIiQR9PDpu6wSLrQTYBcdf8TcLQ==
X-Google-Smtp-Source: AGHT+IETRwCKCw5m2fwIY96WLnlfk+Xo7r6OSlnsL1Thi1F8xij/i5eRt60qHpLaH05c4+ESTk8DDeRm9Swp55raUW4=
X-Received: by 2002:a17:90a:1f04:b0:2af:8fa4:40e with SMTP id
 98e67ed59e1d1-2b6cc340faemr2850546a91.1.1715355948584; Fri, 10 May 2024
 08:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715353572.git.jani.nikula@intel.com>
In-Reply-To: <cover.1715353572.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 May 2024 11:45:36 -0400
Message-ID: <CADnq5_OMOuz_T-OUZ4jVELEAL1FfFdqoFukKdvZA0eSoPQExLg@mail.gmail.com>
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

On Fri, May 10, 2024 at 11:17=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> I've sent this some moths ago, let's try again...
>
> BR,
> Jani.
>
> Jani Nikula (6):
>   drm/nouveau: convert to using is_hdmi and has_audio from display info
>   drm/radeon: convert to using is_hdmi and has_audio from display info
>   drm/radeon: remove radeon_connector_edid() and stop using
>     edid_blob_ptr
>   drm/amdgpu: remove amdgpu_connector_edid() and stop using
>     edid_blob_ptr
>   drm/edid: add a helper for EDID sysfs property show
>   drm/connector: update edid_blob_ptr documentation

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 16 ---------
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.h    |  1 -
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 +--
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 +--
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 +--
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 +--
>  drivers/gpu/drm/drm_crtc_internal.h           |  2 ++
>  drivers/gpu/drm/drm_edid.c                    | 33 +++++++++++++++++++
>  drivers/gpu/drm/drm_sysfs.c                   | 24 ++------------
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  8 ++---
>  drivers/gpu/drm/nouveau/dispnv50/head.c       |  8 +----
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  2 +-
>  drivers/gpu/drm/radeon/atombios_encoders.c    | 10 +++---
>  drivers/gpu/drm/radeon/evergreen_hdmi.c       |  5 ++-
>  drivers/gpu/drm/radeon/radeon_audio.c         | 13 ++++----
>  drivers/gpu/drm/radeon/radeon_connectors.c    | 27 ++++-----------
>  drivers/gpu/drm/radeon/radeon_display.c       |  2 +-
>  drivers/gpu/drm/radeon/radeon_encoders.c      |  4 +--
>  drivers/gpu/drm/radeon/radeon_mode.h          |  2 --
>  include/drm/drm_connector.h                   |  6 +++-
>  20 files changed, 79 insertions(+), 100 deletions(-)
>
> --
> 2.39.2
>
