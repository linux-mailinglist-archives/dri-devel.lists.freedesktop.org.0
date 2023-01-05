Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC965EA10
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 12:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFB410E6F0;
	Thu,  5 Jan 2023 11:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE0810E6F0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 11:38:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w1so23708478wrt.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 03:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hySCfKa8KIPpsvtDHCf0UU2LzfHTztsWXeMd0hZAN6s=;
 b=SBDyO3JqxiIHyVJhIoRYIzQUJA39wxzHw8VjJz/J6DQ9lboHktzyVKjgpebfYM2S89
 sSU4Yauado23dTeg9vvHaS5d2KrnS9QFtTfipDgdaf9nrJ92+UboJAkTwy+5d8URUoJc
 io4tFoeFYjw37mlqvTKZ7SXz7shCTJ9rYFEFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hySCfKa8KIPpsvtDHCf0UU2LzfHTztsWXeMd0hZAN6s=;
 b=hdZEoumcjg8QQm8xgJK0+6ST99NhC6okB+EOQB1Ah7SBusYolnFlGLgfhgaG69uoid
 4rJTSbj5wT6gyVqbidIaElTPVxCWFMTwLxcuQ2D3tPdS2jFvb32QYCqs8H5tYdxUm29G
 zlw/ywQUYJGWybgidH2moMPR9nC7zzNsVCCEQd9yUagextqA82EeNE9HKTIYRZABbetC
 bmCGdDAixCLwzyKkoSp+WFqkHxVlWHuJLhR3Mp65llDCGfiUTGwZgxGuPt0xXIFgf5ge
 dquPFLf8JT+YZ4wFyrpDKfMAURj7SsrYsTOv1aWhWqeBuDgGItJrlLwyCuuD4BZDjn97
 kYvQ==
X-Gm-Message-State: AFqh2kp7DwD132uNx9ociGgm9BtTFIg/A3gph3ugqzvDNVntDtumCYbJ
 TSNrjML6+zx4d2q5ss8JtK5BwbQmjyLBpAxA
X-Google-Smtp-Source: AMrXdXvDbpEuac3MV0JcmtO9XS0TsBXDkSWBSYFq9bukr4Yx8uwuI+1KqzdGMavbutLO7ruQ8Qwc5g==
X-Received: by 2002:a5d:51c7:0:b0:29d:7fe4:b70e with SMTP id
 n7-20020a5d51c7000000b0029d7fe4b70emr6323092wrv.7.1672918702605; 
 Thu, 05 Jan 2023 03:38:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d618d000000b002425dc49024sm36158674wru.43.2023.01.05.03.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:38:21 -0800 (PST)
Date: Thu, 5 Jan 2023 12:38:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.2
Message-ID: <Y7a2q3X44WiIKYX4@phenom.ffwll.local>
References: <20230105033839.23711-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105033839.23711-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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

On Wed, Jan 04, 2023 at 10:38:39PM -0500, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> Fixes for 6.2.
> 
> The following changes since commit c8de526215fdab9f2dd0d9675582cf9f1391a919:
> 
>   Merge tag 'drm-misc-next-fixes-2023-01-03' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-01-03 21:02:57 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2023-01-04
> 
> for you to fetch changes up to 6fe6ece398f7431784847e922a2c8c385dc58a35:
> 
>   Revert "drm/amd/display: Enable Freesync Video Mode by default" (2023-01-04 22:29:32 -0500)

Pulled, thanks a lot.
-Daniel
> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.2-2023-01-04:
> 
> amdgpu:
> - DCN 3.2 fix
> - Display fix
> 
> amdkfd:
> - Fix kernel warning
> 
> ----------------------------------------------------------------
> Michel Dänzer (1):
>       Revert "drm/amd/display: Enable Freesync Video Mode by default"
> 
> Mukul Joshi (1):
>       drm/amdkfd: Fix kernel warning during topology setup
> 
> Samson Tam (1):
>       drm/amd/display: Uninitialized variables causing 4k60 UCLK to stay at DPM1 and not DPM0
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 27 ++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 ++++++----
>  .../dc/dml/dcn32/display_mode_vba_util_32.c        |  6 ++---
>  5 files changed, 39 insertions(+), 9 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
