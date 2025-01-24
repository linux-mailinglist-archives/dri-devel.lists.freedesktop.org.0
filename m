Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A09A1B2D4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 10:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80AA10E938;
	Fri, 24 Jan 2025 09:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="U0dGHww/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CB510E938
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 09:43:30 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so12383165e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 01:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737711809; x=1738316609; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HiVPCS0/X3Z+cksyZsvgs6k8eqxEex/xdbV+ebR25dg=;
 b=U0dGHww/eyoeW5Q1FkchGvNf1X0mKyx9JJWDOZ97P57x5YMTZMhiyqHOH/UR1Ywm7Z
 vnp/Y7fBL8fPWC+5FnsotJizDHbbalH2fl7BkiHbNN1FIjO69s+GuhcD39v19HZrb4/q
 kgFaNb5xctcaYIqHwIuS1j53tu4jTrlcYArZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737711809; x=1738316609;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HiVPCS0/X3Z+cksyZsvgs6k8eqxEex/xdbV+ebR25dg=;
 b=Fso4hLNIf9dK4KvJ8w7Z5xqLzj2cDXzWFzITflVVI08MINY2Ca9OvSTNlJzDmK6RaO
 wjvYCE03ihbc0xxeIR8Xq1APcWNrpTRXn0ImiTk4RXjik3eMZXdqJlNrGEMCHzwJHyPN
 hiQnh3Aeyg2txWSv8rChYGVOfDttz6ukotA+voxW5h34brfhYXfeEo4azyo98CvW2Tkc
 gpJ2Gb4TckzAMBKII/z/yF6TbmvNUTGyMZA185kfaDs+5hDM+iXbsTZer3s2jntvSeMQ
 RACFnY5Jv4LyU3Jhkb+r3MECLthw6EvxLTX37SfLwHiUpWne1sLPcsg84jnz/tVunaqi
 PaQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVJ16KtLeC/6U+WEpRchWNTnV55nHDBqXIAacaGWhVGz4ZyJSGTjbgvpCF9D4wbZ0JDnjXJJBWv+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXAgnXWt9UwfXF/DJRo4T/+/vqJVaI1utcKrmNAbP+6sJLPrgr
 T+UgmGahaiud2eUKg9ElqiN9p3J13N7uWI6mRb2XFp7ajSsQjYNeSfUm6M2Q9Vo=
X-Gm-Gg: ASbGncsbXO1XGjp8Y8GT+U/UOm+6Sr0ZUKfYlpsFYnEgmscFBkjuwoY+0BbFcE0Jntb
 TS2wr+nGoiau049VEslKQXXWzh3aNsFHnvJkJqW7eLjeexzVfzec+2L2YfO2u3Q75zJ9Dh79AUQ
 3DDLuLaT9aQIcV+i6++ObVhY/jOU+2KTFTBjUtYmzdNPg4i6X9M4n1nmDZFs2NQU5qmzdIc6S/k
 guTM+wxznH4jC6/wQGJZlKrtvhaQhdL26UQJQqdu6SnWbL28LNXeVOz6QtXVG8Re2SkAv5aD2Tl
 LIzCcutpr72YNfYd
X-Google-Smtp-Source: AGHT+IFO2cBc7ehIZAnFF0d6XYEGMyydAzDoZEK5FT2V4uZVuHjTy//iZJSTEds/wT4DYYZLZS66Tg==
X-Received: by 2002:a5d:6d86:0:b0:38a:8e2e:9fcc with SMTP id
 ffacd0b85a97d-38bf57befa9mr27925570f8f.45.1737711809032; 
 Fri, 24 Jan 2025 01:43:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188fd0sm2204300f8f.58.2025.01.24.01.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 01:43:28 -0800 (PST)
Date: Fri, 24 Jan 2025 10:43:26 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, simona@ffwll.ch
Subject: Re: [pull] amdgpu drm-next-6.14
Message-ID: <Z5NgvvRgXUvMSe-m@phenom.ffwll.local>
References: <20250122163252.1788713-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122163252.1788713-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Wed, Jan 22, 2025 at 11:32:52AM -0500, Alex Deucher wrote:
> Hi Dave, Simona,
> 
> Fixes for 6.14.
> 
> The following changes since commit 97e5c9e4139087a67c2469488360a6d6afdd4b69:
> 
>   drm/amd/display: fix CEC DC_DEBUG_MASK documentation (2025-01-16 16:23:22 -0500)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.14-2025-01-22

I think you forgot to add your sob when rebasing/cherry-picking some of
the commits in this one. Apologies for only looking at it now, but can
you please respin?

dim: f4f65756091c ("drm/amdkfd: Clear MODE.VSKIP in gfx9 trap handler"): committer Signed-off-by missing.
dim: 8507f33a13b8 ("drm/amdgpu: Refine ip detection log message"): committer Signed-off-by missing.
dim: d3690f0e7b50 ("drm/amdgpu: Add handler for SDMA context empty"): committer Signed-off-by missing.
dim: 5349658fa4a1 ("drm/amd: Add debug option to disable subvp"): committer Signed-off-by missing.
dim: bede35aa9ebe ("drm/amdkfd: Sync trap handler binary with source"): committer Signed-off-by missing.
dim: 1cd21c472883 ("drm/amdkfd: Fix partial migrate issue"): committer Signed-off-by missing.

Cheers, Sima
> 
> for you to fetch changes up to 74d099cbc632a76ea80cdf31126c8b110ff34865:
> 
>   drm/amd/display: Optimize cursor position updates (2025-01-21 10:38:59 -0500)
> 
> ----------------------------------------------------------------
> amd-drm-next-6.14-2025-01-22:
> 
> amdgpu:
> - Documentation fixes
> - SMU 13.x fixes
> - SR-IOV fix
> - Display fix
> - PCIe calculation fix
> - MES 12 fix
> - HUBP fix
> - Cursor fix
> 
> ----------------------------------------------------------------
> Alex Deucher (1):
>       drm/amd/display: fix SUBVP DC_DEBUG_MASK documentation
> 
> Aric Cyr (2):
>       drm/amd/display: Add hubp cache reset when powergating
>       drm/amd/display: Optimize cursor position updates
> 
> Jesse.zhang@amd.com (3):
>       revert "drm/amdgpu/pm: Implement SDMA queue reset for different asic"
>       revert "drm/amdgpu/pm: add definition PPSMC_MSG_ResetSDMA2"
>       drm/amd/pm: Refactor SMU 13.0.6 SDMA reset firmware version checks
> 
> Lijo Lazar (2):
>       drm/amd/pm: Add capability flags for SMU v13.0.6
>       drm/amd/pm: Fix smu v13.0.6 caps initialization
> 
> Lin.Cao (1):
>       drm/amdgpu: fix ring timeout issue in gfx10 sr-iov environment
> 
> Mario Limonciello (1):
>       drm/amd: Clarify kdoc for amdgpu.gttsize
> 
> Shaoyun Liu (1):
>       drm/amd/amdgpu: Enable scratch data dump for mes 12
> 
> Srinivasan Shanmugam (2):
>       drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed
>       drm/amd/amdgpu: Prevent null pointer dereference in GPU bandwidth calculation
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  49 +++-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   5 +
>  .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c   |  10 +-
>  .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   6 +-
>  .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |  10 +-
>  .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |   2 +
>  .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |   9 +-
>  .../drm/amd/display/dc/hubp/dcn201/dcn201_hubp.c   |   1 +
>  .../gpu/drm/amd/display/dc/hubp/dcn21/dcn21_hubp.c |   3 +
>  .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |   3 +
>  .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |   1 +
>  .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |   1 +
>  .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |   1 +
>  .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  13 +-
>  .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   2 +
>  .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   2 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   2 +
>  drivers/gpu/drm/amd/include/amd_shared.h           |   2 +-
>  .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |   1 -
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   3 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   1 +
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 286 ++++++++++++++-------
>  26 files changed, 300 insertions(+), 123 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
