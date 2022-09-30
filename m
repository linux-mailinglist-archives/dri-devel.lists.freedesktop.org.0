Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C415F1606
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 00:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B492E10EDD7;
	Fri, 30 Sep 2022 22:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6037B10EDDC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 22:21:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id a13so7727529edj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=6JNco3UAJVToGpvcvUOsNxLD+zLNOvfcoCbyAl5UnqY=;
 b=CqlmfYMPxg4X+ouC9tyJVxk5PNcjPLWqplPQHNuezs76StqzQ/4DHSn3hrjXmpsFOz
 HED/rrITJDFKkxduY/q8V3rsej0aHqd/JGFHwdrppNKX8oa3IZDKHgkDTOaMDclaa+cd
 ZYYJsYc6z1OSzvkN8ZAtSrEv9ibKZmaAgEuQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=6JNco3UAJVToGpvcvUOsNxLD+zLNOvfcoCbyAl5UnqY=;
 b=Qb4r6+wP3dzxih78ta3rLrGb+3jMbt72QN0UmTVyyKpYPPzn7bvpf8+xiNQHtZOOYq
 /gfRiFP1cTfJ4A1zV1C+Dl56BZGZPCVqcqFLc+43Kqd4IrxMbaIV+ETxRPtWIhkcTvwI
 cvLvltN2g4K/RiFWUfYH959onKJNqztXiH37xQYdKZ70K+mmuhgDq+avApShPesQsgG8
 i7d0w8EJfctSHkrsnNq019oPc6ezzcxrUZTtqwimpsl9Wm/uxZf4WnqeFxTQFStxuGTE
 uzlOkcpOkpgQJIGd9SNyumL7bh9gC0HTIYmTRF0Qv06l3kGHhiquNcmJgm/TELwkl5R1
 vbWA==
X-Gm-Message-State: ACrzQf0UIeaNuKGon7rLfgdHSw8049wST2kjaF7aagkubm8UWxxRwJcn
 3yg+4IMXuSOdbeqaIhQsK/Hkig==
X-Google-Smtp-Source: AMsMyM4wOc7ortJNRHF5bPY1SmaAaouIm6vjbEimiEeLA1t9yx/2enKxP8i8kdFWW+pp6RblL8Q4Kw==
X-Received: by 2002:a05:6402:3806:b0:450:bad8:8cd5 with SMTP id
 es6-20020a056402380600b00450bad88cd5mr9656896edb.305.1664576460717; 
 Fri, 30 Sep 2022 15:21:00 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906309100b0073d9a0d0cbcsm1769961ejv.72.2022.09.30.15.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:21:00 -0700 (PDT)
Date: Sat, 1 Oct 2022 00:20:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu drm-fixes-6.0
Message-ID: <YzdrymlDHGAeNqv5@phenom.ffwll.local>
References: <20220930210454.542719-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930210454.542719-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 05:04:54PM -0400, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> Sorry, some last minute changes to deal with updated firmwares/bioses and
> board revisions containing new IPs added in this cycle.  It required
> pulling in some cleanup patches for the RLC firmware handing, but they
> are only applied to GC 11 in this case.  I figured that would be cleaner
> then a bunch of local fixes that would cause merge conflicts for -next,
> and time was getting short for 6.0. They are only applied to GC 11, so no
> chance of regression on existing asics.
> 
> V2: fixed S-O-Bs.
> 
> The following changes since commit 83ca5fb40e758e0a0257bf4e3a1148dd52c6d0f2:
> 
>   drm/amd/display: Prevent OTG shutdown during PSR SU (2022-09-29 10:07:42 -0400)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-09-30-1

Pullled and forwarded.

Cheers, Daniel

> 
> for you to fetch changes up to 0fd85e89b5bf18447e56099a010ee5be5dc9f2b0:
> 
>   drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode (2022-09-30 16:59:06 -0400)
> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.0-2022-09-30-1:
> 
> amdgpu:
> - VCN 4.x fixes
> - RLC fixes for GC 11.x
> 
> ----------------------------------------------------------------
> Hawking Zhang (8):
>       drm/amdgpu: save rlcv/rlcp ucode version in amdgpu_gfx
>       drm/amdgpu: add helper to init rlc fw in header v2_0
>       drm/amdgpu: add helper to init rlc fw in header v2_1
>       drm/amdgpu: add helper to init rlc fw in header v2_2
>       drm/amdgpu: add helper to init rlc fw in header v2_3
>       drm/amdgpu: add helper to init rlc fw in header v2_4
>       drm/amdgpu: add helper to init rlc firmware
>       drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode
> 
> Sonny Jiang (2):
>       drm/amdgpu: Enable VCN DPG for GC11_0_1
>       drm/amdgpu: Enable sram on vcn_4_0_2
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h   |   4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c   | 264 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h   |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |   4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c    | 151 +----------------
>  drivers/gpu/drm/amd/amdgpu/soc21.c        |   1 +
>  7 files changed, 281 insertions(+), 149 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
