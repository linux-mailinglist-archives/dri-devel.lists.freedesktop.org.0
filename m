Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345D86E090F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB9910EA71;
	Thu, 13 Apr 2023 08:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B02110EA71
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 08:40:19 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-505048d50aeso170049a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681375215; x=1683967215;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Sn6I/2jhJqlg6vW0pkj3/yLVKkEvtsNFjghnbHxyRY=;
 b=a5u97wJFGQvk3JCFTbLCXZZ+dkvUg1UOH8jaESwHobFcGa7A0CcWtLNaVgRjjUqJ2P
 LEBeE7c/uBdVt1dTasr9zK5oR/BMCWr/MLWNMZV90eyhygUO81f3zKZGQC07Db7z1G4t
 xA18f29TsWQHoFYd1Ooiw+KGQS8Uig9ijgeyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681375215; x=1683967215;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Sn6I/2jhJqlg6vW0pkj3/yLVKkEvtsNFjghnbHxyRY=;
 b=TTM5wPCoQ820L8VSV9vBgWOKc9QsUCHsHTrK2W5VsEe2ZlCKmjlR0EfWpJHGcmbGgI
 GgZel2/52Eze95ccZaFZ6cYMYnoPHsIvYAyUoPxJdB63/6HxHRMof0dOZfbEc/2Kg4N7
 4wL17OiUQsSiH2gFxIoutkWYRGsEdKFseA6k0rYE1rnkQIaOTk6HLXsn/u/4YeHManWt
 RGWZlz+QLtkMM8WXzd0RLIsSSOGLEnwKksJL3CvKC6PUwU1sgg7wrWPvlBdyZkLebrNe
 fbPUndcGIHjbqWR4kmr8DcqTh3CfHPgqgmJzAylq2u3tPBGiE6Y3osTi51WUDnov5eK5
 n+ig==
X-Gm-Message-State: AAQBX9fHyArYb6QiDPsILcW8hNeGtzJM8p6Dcl500MWi1wNqtEv7SBps
 4oITFVP9DCJ4SUxF7jZv1YybOg==
X-Google-Smtp-Source: AKy350Y1WB2NKyn1EDKtYPDDv7HEddLLg4ssQ6oLam5KmgAyRhPUNkIK7XnjcRmg60pRlX5Ub3n50w==
X-Received: by 2002:a05:6402:4305:b0:502:ffd:74a0 with SMTP id
 m5-20020a056402430500b005020ffd74a0mr1913423edc.2.1681375215621; 
 Thu, 13 Apr 2023 01:40:15 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l11-20020a1709066b8b00b009475bd8f441sm644284ejr.60.2023.04.13.01.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 01:40:15 -0700 (PDT)
Date: Thu, 13 Apr 2023 10:40:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu drm-fixes-6.3
Message-ID: <ZDe/7WGGFeWmbynG@phenom.ffwll.local>
References: <20230412215637.7881-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412215637.7881-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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

On Wed, Apr 12, 2023 at 05:56:37PM -0400, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> Fixes for 6.3.
> 
> The following changes since commit 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d:
> 
>   Linux 6.3-rc6 (2023-04-09 11:15:57 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-04-12
> 
> for you to fetch changes up to b9a24d8bd51e2db425602fa82d7f4c06aa3db852:
> 
>   drm/amd/pm: correct the pcie link state check for SMU13 (2023-04-12 16:11:22 -0400)

Pulled, thanks
> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.3-2023-04-12:
> 
> amdgpu:
> - SMU13 fixes
> - DP MST fix
> 
> ----------------------------------------------------------------
> Evan Quan (1):
>       drm/amd/pm: correct the pcie link state check for SMU13
> 
> Horatio Zhang (2):
>       drm/amd/pm: correct SMU13.0.7 pstate profiling clock settings
>       drm/amd/pm: correct SMU13.0.7 max shader clock reporting
> 
> Wayne Lin (1):
>       drm/amd/display: Pass the right info to drm_dp_remove_payload
> 
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 57 ++++++++++++--
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  6 ++
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  4 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 87 +++++++++++++++++++---
>  4 files changed, 135 insertions(+), 19 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
