Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A81D39BBA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6862710E13C;
	Mon, 19 Jan 2026 01:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FmMizOfD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F6910E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:11:49 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b873a14bb99so70012866b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785108; x=1769389908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DVBUttiwTtNNOnKb5N+xO9QPyCJvbn2+Hg5o/bF62Yc=;
 b=FmMizOfDNAbda4qgbjlFaHapc6Q4qiJGjsryYSc5AmOTuV8cOX8lF6lKsLURR/fFWK
 gv6jlxF4GQ3jEL0Pqp3F0H9NFZE/u7DSdpwo3SYn9HxlKKTQZughEwzRCDN3PK5smIWz
 WN4Nlrdxg8pqF9MWjemaukdNJPdl3f45VKGu7c/d+KnXjayzxl7wo+gQjfKNTrslFEDh
 uuoRbaFvIXPYkh3NesfcG7cL3DZVk8CZca8bn22WdVAfblDLHYC3HDlMKnAC0Nx6t8sE
 MqYLr0BJhlk73BaqfdzcaHYPZ+n3/bCzwz+HBq6RS2I1GJv6qb75JrbdqK2UTnV10Y4f
 ASeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785108; x=1769389908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVBUttiwTtNNOnKb5N+xO9QPyCJvbn2+Hg5o/bF62Yc=;
 b=ECoouiF7Uud98fxKpMbOlTpRqHf947IdHjmey3drWN80dnq4vuYzSIFbeIPqJ8SAjH
 jhpMpV5sbkB1EGdUazdJUDwVsOOZilfyhdjQUA+moKYyC5xgws2PVBwrsoctCuDypQca
 5LtNlfrYsBOvaXEV32aQG9avXPvJebPbiFNrVeaky+VEZBqhh+Ahw8U9W4VLJcQ5luM8
 33ArRJXutO8eZAcOxu3Ap6+SgomWMX8c9LJTsieEjGgH1f4ih6JiclETJ2pkcO8CPVMG
 5vK6jt+k/W0KGbfThxoKwVk80QqMxNJ9OTIK7BzXuDKv/jKjtXLZsUyjhNaucjqomGVn
 IyhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVztepGfVXTAV82KRsVxw7O5dXZlDE3om5lbQgPEwu5t/XdEsLCUkJDMVHiHCA/HQm3hyVYoZc4oDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgOuD2ZmZB6/whCNviAVD0oG3ZfOjQOZ2/OKR4s03ir5SLuTqm
 Ajao2JGCBkn711+nI8s8li2C8v4XEfx6qcARxNG8w6tudvR8MJmW/Q0f
X-Gm-Gg: AY/fxX4Lf9ayQtGZdcoUhWGDsh5eWMU1HK3EhfGaY7ALMQMWXQo5ESZmytl0I4NTNbB
 VbHgTZ42gE40rcbS9AJ/Rv6xG3Oi+MUyOeNpagaREtp6cRMK5K3ir7DSKkADH65B+gl+jyHyGQk
 eZUarg9A3S6L9XJ9Z8Be45U8EYAAsDUOEdmwc479EmP+qfAnG0Z2gGIr4nrDWVsOWfJ0ZjJmsKA
 6iA8UlsZHKTnjfibMkysGgo8mJHxVvi++hbbnFlwZr2ntIg4HNfxoG7AdYzZb9vje1Jrg2BX8Pi
 lGE3bOsVmFbBwaChrTVTR/2hfT8aKx7Mb7i7c82DF6Irw36ifW6twIGjPtuB061MGytWVcWjyvv
 L87UJWzzEKEfKNdhlyPR4s//xTpbMYO4hyT05T5tf/Bjur9BUcw+hVe3RRYClcSaYsu2TUWDPcl
 XqBKJic/ROmOpykKCywKV8bixwO+qtrQcm3WuZnMHNfqObmozc35WRklLXsceWQu4B
X-Received: by 2002:a05:6402:510c:b0:640:abd5:8646 with SMTP id
 4fb4d7f45d1cf-65452acc747mr4345762a12.4.1768785108158; 
 Sun, 18 Jan 2026 17:11:48 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:11:47 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 00/17] drm/amd: VRR fixes, HDMI Gaming Features
Date: Mon, 19 Jan 2026 02:11:29 +0100
Message-ID: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This patch series tackles a few things:
- Fixes VRR not detected if monitor uses GTF flag for ranges
  instead of Range Limits Only
- Detects if AMD vsdb carries a wider VRR range and uses it instead
- DP->HDMI PCON changes which includes a module property to override
  PCON ID check
- Parses HDMI gaming features in generic drm
- Reintroduces proper HF-VSIF and VTEM info packets
- Adds support for Auto Low Latency Mode
- Adds support for HDMI VRR

VRR range fixes are simple and fix VRR support for many monitors. They close
about 5 issues on the amdgpu issue tracker.

Adaptive Sync over PCON is only available as FreeSync over HDMI. TVs which do
not support FreeSync, do not have working VRR with DP -> HDMI 2.1 adapters even
though adapters will take care of HDMI VRR info packets.

I myself validated these changes with my Samsung S95B + Bernhard validated on
LG C4 + FreeSync-less Sony Bravia 8. I used Alienware AW3423DWF that only
has HDMI 2.0 to check that FreeSync still triggers properly for "older" hardware

For missing VRRmax or VRRmax == 0, the upper boundary is the currently selected
video mode refresh rate. I wasn't sure how best to implement it but ended up
on a great solution. We first check if maybe there is a VRR range in AMD vsdb.
If not, rely on limitation of base refresh rate in VTEM vsif.

More history on previous shape of HF-VSIF and VTEM in their respective patches
but the info packets were previously included in the driver code. HF-VSIF was
improperly handled and VTEM doesn't seem to have been plumbed as it had no
use before. I recoded these and this code should be much easier to understand
and maintain.

ALLM support uses the info from EDID to determine if ALLM is supported by sink
and if that's the case, always signals for ALLM to be enabled. In PC use,
be it for gaming, desktop use, work etc. we always want the lowest latency and
less processing + possibly higher available refresh rates when gaming mode is
turned on.

HDMI VRR support relies on sending VTEM info packet in place of FreeSync
info packets. Though VTEM has it's own place in the info packet pipeline,
I didn't touch it as it already replaces FreeSync info packets. If there's
a need to change this, please let me know for v2.

Both features were tested and work just like they were intended to. Gaming
mode is automatically triggered and HDMI VRR is used in place of FreeSync
(if available). This HDMI VRR preference actually fixes VRR-induced
flickering on many TVs (S95B in my case) with somehow subpar
FreeSync implementation.

If you don't agree with this preference, I can add a module setting that will
let users control this behavior. For example, FreeSync would be preferred by
default, but amdgpu.prefer_hdmi_vrr=true would change that.

I still think it's better to not force users to search for solutions manually
especially since it seems like DP and eDP don't save info about FreeSync version
and completely rely on basic VRR support. This would then be mirrored.

There's still an issue with some TVs behaving like a mode change is happening
when VRR is triggered and I'd like to maybe tackle this too. When using HDMI
through PCON, VRR is always active, like it's in VRR_STATE_ACTIVE_FIXED mode.
This makes my TV much nicer to use and replication this behavior would be
worthwhile IMO.

Everything in this patch series has been based on already public code/knowledge
or trying things out until they work/break.

This patch series supersedes previous patches/series:
https://lore.kernel.org/amd-gfx/20251209231107.1968472-1-tomasz.pakula.oficjalny@gmail.com/
https://lore.kernel.org/amd-gfx/20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com/
https://lore.kernel.org/amd-gfx/20260113183540.86266-1-tomasz.pakula.oficjalny@gmail.com/

Tomasz Pakuła (17):
  drm/amd/display: Return if DisplayID not found in parse_amd_vsdb()
  drm/amd/display: Refactor amdgpu_dm_update_freesync_caps()
  drm/amd/display: Check for VRR range in CEA AMD vsdb
  drm/amd/display: Use bigger VRR range if found in AMD vsdb
  drm/amd/display: Refactor PCON VRR compatibility check
  drm/amd/display: Add PCON VRR ID check override
  drm/amd/display: Add CH7218 PCON ID
  drm/edid: Parse more info from HDMI Forum vsdb
  drm/amd/display: Rename PCON adaptive sync types
  drm/amd/display: Enable HDMI VRR over PCON
  drm/amd/display: Support HDMI VRRmax=0
  drm/amd/display: Build HDMI vsif in correct slot
  drm/amd/display: Save HDMI gaming info to edid caps
  drm/amd/display: Restore ALLM support in HDMI vsif
  drm/amd/display: Trigger ALLM if it's available
  drm/amd/display: Reintroduce VTEM info frame
  drm/amd/display: Enable HDMI VRR

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 206 +++++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  49 ++-
 .../gpu/drm/amd/display/dc/core/dc_resource.c |   4 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   1 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   7 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   2 +-
 .../amd/display/include/ddc_service_types.h   |   1 +
 .../amd/display/modules/freesync/freesync.c   |   4 +
 .../amd/display/modules/inc/mod_info_packet.h |  17 +-
 .../display/modules/info_packet/info_packet.c | 295 ++++++++++++------
 drivers/gpu/drm/amd/include/amd_shared.h      |   6 +
 drivers/gpu/drm/drm_edid.c                    |  41 ++-
 include/drm/drm_connector.h                   |  47 +++
 13 files changed, 489 insertions(+), 191 deletions(-)

-- 
2.52.0

