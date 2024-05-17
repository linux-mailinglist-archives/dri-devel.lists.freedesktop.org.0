Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADFB8C8D84
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F6C10EF70;
	Fri, 17 May 2024 21:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lx8MVCMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC71610E243;
 Fri, 17 May 2024 21:04:07 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1f2ecea41deso5033525ad.1; 
 Fri, 17 May 2024 14:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715979847; x=1716584647; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=LSGmPsvhsE8MetA3f75jbOyyenF8fqWa7epNrquz5fM=;
 b=lx8MVCMzFApvijmHki46iqiwMBCvfuu6uZDdgMxC0RuXXfzh0S+4Coi/EzscsGZiDc
 hRalUpPiXDXoTqJmlB/HL3Ge5bXpDejDzlr3HYp4nWlOuiYwM63LId5fO5pgveOxjFpv
 dVPSbih+FLHHyIm/0XdwoilaK3UfKEa0uJ/VGYG0HeunHnOcLN8LIUM2sCHayAeeOthO
 aMDtblbbgbvO3B3n8/mJtW0zYddmUE1GJ7qoR5XBetDg3/r2qeU2OZ2RT5VQK2BTu7WF
 VNLzbjRZ9/9MgwUOkcUpNwrD4IyGzG43/CzecbnTv4sI7dn4Z0Z391hzGzMOA2fGw99E
 X7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715979847; x=1716584647;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LSGmPsvhsE8MetA3f75jbOyyenF8fqWa7epNrquz5fM=;
 b=aiCIFzKrVUPIex2Sf+9MARhEFVbqgrc2h9enW54R7NWb6vjyoAa7H8bZvLIRo2b4yg
 Pz0fDqsCl+YjrW+UPq000VmcIn4HPPXr722tBTb+PDTFT3JOkWyEwgOwj3w9WVAkXWjS
 r906Ena9iMtRK63KaanPPXCdYYxUp/EZTeR9s3xnInJ/tlTT5eQuLKCyui/ahjqQV9qZ
 Eo01Sv5we/esT2M7GkS/r9fjrRLewVWWMz/+Vx5oG+OSTA8z3NAMOCQczlcaZofzMmJi
 JNSGXJpgHkx8mbAAE89YmloAQmxGzHoqfA3gglXEEmI7Z7+B7ce31Dc+kMjzoEIoHP7r
 ORUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRFPQjfCNW7WvIj6vOKe98HCW5gN4lO5qRGKvrAIZr22UdEQ96TBe+Qi1sKr+q7GQoD06FIDFoZLgWBffRve+0OLxj4YVQr++wDZyPLhvd9jp6Hbf4PPGC/JisqxnNCbaqfOLWrL8OomCWV72ElQw=
X-Gm-Message-State: AOJu0YxsLCCBes50KSyrHJRzEVgXHiGjHF5PkDeYfDvwiujIVChX3iM7
 e2wYa2Xg1EdGieXf3C8QlBp4vxkM6OjlY27uAmrBo6VlZsfzGPsN
X-Google-Smtp-Source: AGHT+IGhi4Z/q/DIJ2PGOE/sA5K4Ii//7cPJVS4c4SvV5loP1DIF3BVdz0KhqlaEEe1nyqvCAR8+ew==
X-Received: by 2002:a17:902:da87:b0:1eb:b50e:3577 with SMTP id
 d9443c01a7336-1ef4404f4a5mr335556095ad.56.1715979847035; 
 Fri, 17 May 2024 14:04:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f2e1c81db0sm17839365ad.78.2024.05.17.14.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:04:06 -0700 (PDT)
Date: Fri, 17 May 2024 14:04:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Pan@freedesktop.org
Subject: Re: [RESEND v3 1/2] drm: enable (most) W=1 warnings by default
 across the subsystem
Message-ID: <6584ea16-06f7-4a95-bd83-870f30fc4b5d@roeck-us.net>
References: <cover.1709629403.git.jani.nikula@intel.com>
 <a50f1a69d5af72e913996179a75bc3a71d81ebea.1709629403.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a50f1a69d5af72e913996179a75bc3a71d81ebea.1709629403.git.jani.nikula@intel.com>
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

Hi,

On Tue, Mar 05, 2024 at 11:07:35AM +0200, Jani Nikula wrote:
> At least the i915 and amd drivers enable a bunch more compiler warnings
> than the kernel defaults.
> 
> Extend most of the W=1 warnings to the entire drm subsystem by
> default. Use the copy-pasted warnings from scripts/Makefile.extrawarn
> with s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and
> keep up with them in the future.
> 
> This is similar to the approach currently used in i915.
> 
> Some of the -Wextra warnings do need to be disabled, just like in
> Makefile.extrawarn, but take care to not disable them for W=2 or W=3
> builds, depending on the warning.
> 
> There are too many -Wformat-truncation warnings to cleanly fix up front;
> leave that warning disabled for now.
> 

With this patch in the mainline kernel, I get the following build error
when trying to build parisc:allmodconfig.

Error log:
drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_mthd':
drivers/gpu/drm/nouveau/nvif/object.c:161:9: error: 'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]
  161 |         memcpy(data, args->mthd.data, size);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_ctor':
drivers/gpu/drm/nouveau/nvif/object.c:298:17: error: 'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]
  298 |                 memcpy(data, args->new.data, size);

The problem is also seen with v6.9 when trying to build an image
with W=1, so it is not triggered by a code change. I don't know
if other architectures are affected. The problem is not seen with
gcc 11.4, but it is seen with gcc 12.3 and 13.2. I did not try
with older versions of gcc.

Bisect log is attached for reference.

The odd error makes me wonder if I should revert to testing with gcc 11.4
and no longer bother with later versions of gcc, at least for any affected
architectures. Any recommendations ?

Thanks,
Guenter

---
# bad: [7ee332c9f12bc5b380e36919cd7d056592a7073f] Merge tag 'parisc-for-6.10-1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
# good: [a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6] Linux 6.9
git bisect start 'HEAD' 'v6.9'
# good: [1b294a1f35616977caddaddf3e9d28e576a1adbc] Merge tag 'net-next-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect good 1b294a1f35616977caddaddf3e9d28e576a1adbc
# bad: [d34672777da3ea919e8adb0670ab91ddadf7dea0] Merge tag 'fbdev-for-6.10-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
git bisect bad d34672777da3ea919e8adb0670ab91ddadf7dea0
# bad: [2871ec40994912ce4f2e2d5072a428eb84c77d3c] Merge tag 'drm-misc-next-2024-04-19' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
git bisect bad 2871ec40994912ce4f2e2d5072a428eb84c77d3c
# bad: [34633158b8eb8fca145c9a73f8fe4f98c7275b06] Merge tag 'amd-drm-next-6.10-2024-04-13' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect bad 34633158b8eb8fca145c9a73f8fe4f98c7275b06
# good: [4b0cb230bdb71c23981acfa5e7b367c7dde02a41] drm/amdgpu: retire UMC v12 mca_addr_to_pa
git bisect good 4b0cb230bdb71c23981acfa5e7b367c7dde02a41
# bad: [6376eb8b911534735fec104c1a0d780e4cf3116a] drm/dp: Clarify that wait_hpd_asserted() is not optional for panels
git bisect bad 6376eb8b911534735fec104c1a0d780e4cf3116a
# bad: [9c86b03863844ce69f99aa66404c79492ec9e208] drm/panthor: Fix panthor_devfreq kerneldoc
git bisect bad 9c86b03863844ce69f99aa66404c79492ec9e208
# bad: [b5d7cb76f2674c9d01b611141702723a95d12553] drm: add missing header guards to drm_internal.h
git bisect bad b5d7cb76f2674c9d01b611141702723a95d12553
# good: [4bdca11507928a4c9174e9b7240e9d058c12a71d] drm/panthor: Add the driver frontend block
git bisect good 4bdca11507928a4c9174e9b7240e9d058c12a71d
# good: [b2ec429b69280001d85029dc50b5427af41eb641] drm/tidss: Use dev_err_probe() over dev_dbg() when failing to probe the port
git bisect good b2ec429b69280001d85029dc50b5427af41eb641
# bad: [a61ddb4393ad1be61d2ffd92576d42707b05be17] drm: enable (most) W=1 warnings by default across the subsystem
git bisect bad a61ddb4393ad1be61d2ffd92576d42707b05be17
# good: [113cc3ad8566e06d6c8ef4fc0075a938dedefab5] drm/bridge: Document bridge init order with pre_enable_prev_first
git bisect good 113cc3ad8566e06d6c8ef4fc0075a938dedefab5
# good: [460be1d527a8e296d85301e8b14923299508d4fc] drm/nouveau: move more missing UAPI bits
git bisect good 460be1d527a8e296d85301e8b14923299508d4fc
# first bad commit: [a61ddb4393ad1be61d2ffd92576d42707b05be17] drm: enable (most) W=1 warnings by default across the subsystem
