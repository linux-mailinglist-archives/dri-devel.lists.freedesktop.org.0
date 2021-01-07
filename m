Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C732ECC3D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 10:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0675E6E420;
	Thu,  7 Jan 2021 09:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706506E416
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 09:04:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id k10so4509549wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 01:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=enb4Nt3fTLMHrulGqTJpjJIRVO21F5Z7R2GigQ0UdLw=;
 b=PccwS+g2JWld3SUsy2YbbLhonB7wbu/PfugysVeKA4JPTpxkznKcb6H/ZfHM7ZSjgk
 mBVPr46pfMZCEI5Rn+ohmfK0FfOep/uJZ30iRY4HHgAj6l3YvXPhHalBb8cgi098WsXi
 J6IzRxLTESVpH7HfLzTspHtlewle7L5bsxNFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=enb4Nt3fTLMHrulGqTJpjJIRVO21F5Z7R2GigQ0UdLw=;
 b=aIKk8LLD2bg/x8dd/Magb06z2cIRz+gggxj3xBX6eAWHQQQpLf8yrq80BZEVzCKzPp
 EJovnoL03CrgaCbEvQdyM9OEezpIDCnodnT8W5eYEpQ6Z5SUStqvTN/pE8Ra9PkdPBXf
 N6LDTtIxFLN0YXOas2ZFYsS8PlgCWqjGDVD4LcmWl1xDHmY70ZhM8mCDdhb0F0R4ME7T
 ILc0mgSAq91oSAnab9ypKPvdhaJTEj/BeoT9Fp74wTmuybvFlxG7SpRhAkOF2sFd06rT
 5EH3jwPtlelRoJR00DjvAs3i7Be1h8oxV6ApsBM9AfXMkZvPlrrzwUsjz6aq+abFbsyr
 IGVg==
X-Gm-Message-State: AOAM5307yoPNi3rmgUh5cKepEgDj0UpOyyDjrmz/yY+hND0qXsa9sPEe
 WWF7YhO1YoepVZ8MxiZTDJBFWg==
X-Google-Smtp-Source: ABdhPJw+qmglJkV0NOIpNmij4HcaJMBpyEzUaoO6nO4MqvkWOt2ySIbGX3XQ2ir97hhtWNvatOX18Q==
X-Received: by 2002:a05:600c:274d:: with SMTP id
 13mr7145629wmw.77.1610010255838; 
 Thu, 07 Jan 2021 01:04:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q143sm6567737wme.28.2021.01.07.01.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:04:14 -0800 (PST)
Date: Thu, 7 Jan 2021 10:04:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.11
Message-ID: <X/bOjcOWcFFwf+q8@phenom.ffwll.local>
References: <20210106222721.3934-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210106222721.3934-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 06, 2021 at 05:27:21PM -0500, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> New URL.  FDO ran out of disk space, so I'm attempting to move to gitlab.
> Let me know if you run into any issues.

Worked fine. Did you puing linux-next to update your tree location? Also
legacy fd.o git seems back in shape, at least I can push.
-Daniel

> 
> Thanks
> 
> The following changes since commit 5b2fc08c455bbf749489254a81baeffdf4c0a693:
> 
>   Merge tag 'amd-drm-fixes-5.11-2020-12-23' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-12-24 10:31:16 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.11-2021-01-06
> 
> for you to fetch changes up to 5efc1f4b454c6179d35e7b0c3eda0ad5763a00fc:
> 
>   Revert "drm/amd/display: Fix memory leaks in S3 resume" (2021-01-06 16:25:06 -0500)
> 
> ----------------------------------------------------------------
> amd-drm-fixes-5.11-2021-01-06:
> 
> amdgpu:
> - Telemetry fix for VGH
> - Powerplay fixes for RV
> - Powerplay fixes for RN
> - RAS fixes for Sienna Cichlid
> - Blank screen regression fix
> - Drop DCN support for aarch64
> - Misc other fixes
> 
> ----------------------------------------------------------------
> Alex Deucher (2):
>       drm/amdgpu/display: drop DCN support for aarch64
>       Revert "drm/amd/display: Fix memory leaks in S3 resume"
> 
> Arnd Bergmann (1):
>       drm/amd/display: Fix unused variable warning
> 
> Dennis Li (3):
>       drm/amdgpu: fix a memory protection fault when remove amdgpu device
>       drm/amdgpu: fix a GPU hang issue when remove device
>       drm/amdgpu: fix no bad_pages issue after umc ue injection
> 
> Hawking Zhang (1):
>       drm/amdgpu: switched to cached noretry setting for vangogh
> 
> Jiawei Gu (1):
>       drm/amdgpu: fix potential memory leak during navi12 deinitialization
> 
> John Clements (2):
>       drm/amd/pm: updated PM to I2C controller port on sienna cichlid
>       drm/amdgpu: enable ras eeprom support for sienna cichlid
> 
> Kevin Wang (1):
>       drm/amd/display: fix sysfs amdgpu_current_backlight_pwm NULL pointer issue
> 
> Xiaojian Du (4):
>       drm/amd/pm: correct the sensor value of power for vangogh
>       drm/amd/pm: improve the fine grain tuning function for RV/RV2/PCO
>       drm/amd/pm: fix the failure when change power profile for renoir
>       drm/amd/pm: improve the fine grain tuning function for RV/RV2/PCO
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  25 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   8 +-
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |   2 +-
>  drivers/gpu/drm/amd/display/Kconfig                |   2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   7 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   2 +-
>  drivers/gpu/drm/amd/display/dc/calcs/Makefile      |   4 -
>  drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |  21 ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   7 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |   7 -
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   7 -
>  drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   4 -
>  drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |   4 -
>  drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |   5 -
>  drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |   4 -
>  drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |   4 -
>  drivers/gpu/drm/amd/display/dc/dml/Makefile        |   4 -
>  drivers/gpu/drm/amd/display/dc/dsc/Makefile        |   4 -
>  drivers/gpu/drm/amd/display/dc/os_types.h          |   4 -
>  .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   | 166 +++++++++++++++++++--
>  .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h   |   3 +
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   2 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   3 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   1 +
>  drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   1 +
>  27 files changed, 200 insertions(+), 113 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
