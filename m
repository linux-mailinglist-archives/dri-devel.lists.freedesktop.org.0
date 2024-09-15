Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D37979903
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 23:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C123810E002;
	Sun, 15 Sep 2024 21:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C2aeeC3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E1910E167;
 Sun, 15 Sep 2024 20:31:16 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-49bcd11fc37so1178554137.3; 
 Sun, 15 Sep 2024 13:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726432276; x=1727037076; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hAYZQWw2HWWFjLpbJ1p/0HLGKECZhCFOlFWY0I17SDI=;
 b=C2aeeC3V4HTNXvzWB3TaH/YTCjOahz/+EdRhtrkVgpkXmfES//LvhczqggYoDk1hwF
 WbQZUNE3B3GPb2U0em3+8lFs+6EpZUk+O6DIvpYdXLTYXf5Pgswg4CMOyw5ec0TbFQgH
 570cCfNE8roLn8HWkZvF+wqWhf5KaGCdQCKtfAIpxQxmDBZNGpVJbgM21kxyMAf8POku
 B3su5qZDeD7BbILAj1rcbk3lgclhWV7kmudOAVwEzK6yJVWQDuecIZPUwTweU6gACfvj
 pAnxg9ihKV2UazFumc/+pPyoL9tBCyrnGrW+AoLJemN5Z4OhKZyret+4n4EnBc6ZQG2N
 Eouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726432276; x=1727037076;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hAYZQWw2HWWFjLpbJ1p/0HLGKECZhCFOlFWY0I17SDI=;
 b=WCZA91H17EosV91Jn2W+SSvOLpAcFxsxpFEDWvdc9NSp5dSqofTvlVJWeV7WyoQ11z
 iavMrZWgo5G75m5NKzhF2vdbUUjXLzuNqgI150jUv9rR8MMjTIzaL8E0hMkPoIIRydvF
 PDG3qWht0rPOl16J1DgThi2ey/HLd1a38pdPMVGvFqI5pvs2bSmKjpVg2eU6tp30X52f
 hXbd769thvu+rzwMzojoGHXQQuJSBughgopEGHiAB6mETt7iM8fNzdEMHiO7Tvj0BxXi
 ic1Y5RgIo779kGsRTBl4LSMa2COURDLGvtp3U5KxJb243pDNUhZVL8VrCe8v8TVoLE5h
 d7ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWywI2grQxdWBLKmxqIzLZs8nPjAXKPaf4BLKuNB7jcf/qywx0tNi8sRyUhKQUciIvupWp+1Fr8iEmY@lists.freedesktop.org,
 AJvYcCXOp72yf8ivUioln2hJunYg5/4Nupkij3ZR2qOplyb9HMAIk/V9bCYuXhPqEPNhdSNN3xvUyo6e@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+eiO65s3Z4MC1px40bQ+5BGrcCBPA6DIz0qvyUncorq1hQFZK
 6A9ItcRb7TUf96/8fSi0dp7Hj8HN/LGHTCLefO1Q22E+YbDLxxbgyxPl2kRmCHohUZDu/JQDypW
 cWZRGwEMd+5gNqOqCSN0EEyr+b1o=
X-Google-Smtp-Source: AGHT+IHkL+Fo29ENavizDkxBSHVbm5AxIaQ/IPFYlxQc47hbs0WOkM73B9jK2Vn7Gni7WkxT1w/aQziQGBzOWSnFhTE=
X-Received: by 2002:a05:6102:f0d:b0:49b:f255:1779 with SMTP id
 ada2fe7eead31-49d41479c01mr10368014137.12.1726432275602; Sun, 15 Sep 2024
 13:31:15 -0700 (PDT)
MIME-Version: 1.0
From: Sitsofe Wheeler <sitsofe@gmail.com>
Date: Sun, 15 Sep 2024 21:30:49 +0100
Message-ID: <CALjAwxidmwCT5ZwbZRhf9GwshYbzQZ4N8K3B8KGLi5DnRzj8wQ@mail.gmail.com>
Subject: Kernel hang when amdgpu driver is loaded on old radeon card
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 15 Sep 2024 21:01:21 +0000
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

Hello,

(Apologies if I have CC'd the wrong people/places - I just went by
what get_maintainer.pl -f drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
said)

I recently upgraded from Ubuntu 20.04 (5.15.0-119.129~20.04.1-generic
kernel) to Ubuntu 24.04 (6.8.0-44-generic kernel) and found that while
booting the kernel hangs for around 15 seconds just before the amdgpu
driver is loaded:

[    4.459519] radeon 0000:01:05.0: [drm] Cannot find any crtc or sizes
[    4.460118] probe of 0000:01:05.0 returned 0 after 902266 usecs
[    4.460184] initcall radeon_module_init+0x0/0xff0 [radeon] returned
0 after 902473 usecs
[    4.465797] calling  drm_buddy_module_init+0x0/0xff0 [drm_buddy] @ 122
[    4.465853] initcall drm_buddy_module_init+0x0/0xff0 [drm_buddy]
returned 0 after 29 usecs
[    4.469419] radeon 0000:01:05.0: [drm] Cannot find any crtc or sizes
[    4.473831] calling  drm_sched_fence_slab_init+0x0/0xff0 [gpu_sched] @ 122
[    4.473892] initcall drm_sched_fence_slab_init+0x0/0xff0
[gpu_sched] returned 0 after 31 usecs
[   18.724442] calling  amdgpu_init+0x0/0xff0 [amdgpu] @ 122
[   18.726303] [drm] amdgpu kernel modesetting enabled.
[   18.726576] amdgpu: Virtual CRAT table created for CPU
[   18.726609] amdgpu: Topology: Add CPU node
[   18.726787] initcall amdgpu_init+0x0/0xff0 [amdgpu] returned 0
after 528 usecs

I've checked and the problem still exists in 6.11.0-061100rc7-generic
(which is close to vanilla upstream).

The graphics card I have is:
01:05.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] RS880M [Mobility Radeon HD 4225/4250] (prog-if 00 [VGA
controller])
01:05.0 0300: 1002:9712 (prog-if 00 [VGA controller])
Subsystem: 103c:1609

At first I thought the problem was related to the change
https://github.com/torvalds/linux/commit/eb4fd29afd4aa1c98d882800ceeee7d1f5262803
("drm/amdgpu: bind to any 0x1002 PCI diplay [sic] class device") which
now means my card is claimed by two drivers (radeon and amdgpu). That
change complicated things because:
- The amdgpu module and its dependencies remain permanently present (which
  never used to happen)
- It took some time for me to realise that the amdgpu driver hadn't suddenly
  grown the ability to support this old card :-) There is a nice table on
  https://www.x.org/wiki/RadeonFeature/#decoderringforengineeringvsmarketingnames
  that shows it is part of the R600 family and
  https://www.x.org/wiki/RadeonFeature/#featurematrixforfreeradeondrivers shows
  that R600 is only supported by the radeon driver.

However, testing a 5.16.20-051620-generic kernel showed that while the
amdgpu module is loaded, there is no 15 second hang... So far my
testing has the following results:
- 5.16.20-051620-generic - amdgpu loaded, no hang
- 5.18.19-051819-generic - amdgpu loaded, no hang
- 6.0.0-060000-generic - amdgpu loaded, hang
- 6.2.0-060200-generic - amdgpu loaded, hang
- 6.8.0-44-generic - amdgpu loaded, hang
- 6.11.0-061100rc7-generic - amdgpu loaded, hang

To work around the problem I've taken to blacklisting amdgpu in
/etc/modprobe.d/ which makes the hang disappear.

Does anyone else see this issue? Is there something better than my
current workaround? What do other drivers that want to bind to such a
large set of devices do? Further, while I'm already using
initcall_debug, is there any other kernel boot parameter to make
what's happening more visible?

--
Sitsofe
