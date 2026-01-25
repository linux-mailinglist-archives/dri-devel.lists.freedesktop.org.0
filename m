Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGmpJFxjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7D381B73
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF2C10E1A3;
	Sun, 25 Jan 2026 18:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B3FoZpKp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0881710E1DC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:18 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-6580ec94bcdso508103a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366357; x=1769971157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=leDIaUJu7wbjWbBMTAMq163IoyrmfATMpPfAYjXaKCU=;
 b=B3FoZpKpeyWTUCc0DjoqDZE3TT3e6GwZEDrbMH1FZtqFltb4svIGMIrH9zIgnWyLVD
 /YhPmRny8nEdUjESlyeHVa/vevepwAAsOAe/c8sptBcbH3WIKDmPwpzzjSICWQLvv5/G
 IMCcauNFR2H3U8HpJLclCy03B4OEF79v0WLYbiu0KiTRLmWkUzLPy5ZB5LQ9bGripEQ4
 ASNQrFwr9sksxVFYkssw8ANZ1yKhPqEjD16OIVQPt1C4XtS6xKAUhFyuL0YnLoM+a7Df
 RQsJj8tDtu/Y0aaVZzApLwi6hhLpK8/DGz+TW+UGcfgoKKU39KbSZeuUyhHxYoZjUKfv
 62bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366357; x=1769971157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leDIaUJu7wbjWbBMTAMq163IoyrmfATMpPfAYjXaKCU=;
 b=uExlriIEEU5Xv9jlc9Bq4JFr8dG9aylBRUq+fQIPTYgpekvdVtSDov1xv3tG0Lo5d+
 EkKu45SCIbmHIGFnpa6VOvFBucoclZdYDjwsgYKZ46LccZlREVBQjP4y6CORhCPY4Vag
 FHpwLIKakrIaSbdaTQb2D+cDMn/OC7s2BduJ6Q6HER6GGEpUeoOTPE+TwuQHLV32+qXl
 oi/d49iLVPBwm3GEWg5IEDOSuCja0kGE+NONxE1AAKmEcpzgFaR6ef8IMA7tA8wyDsH5
 joxjHx03Z3+TLyVkUpEtLzn/aaU1Dsq6LSWFuKvtF0yYsZEUtbQGdcBfP2iaPBjjrRV1
 jqhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPSbHPQO4UHTdSttHZSvyzfKQ14kDPnr7WCP4uXMwSy6Fv3TZZq/yXHx9hCOHvwzQN4C8rhXFb5ic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyueHlBoNKyiOwS/s2ikcVWAYZMBBFhWek0TSED9gT5SAVlV96B
 62AbkksozRE2Mu7Es51hbYEIsxtmwgUWuE0hbUR5v76tm+G69HadGrfZ
X-Gm-Gg: AZuq6aKh0umuRzZqI5UWuMChqrSbzIWqE1DiyJ0fu4NbWs7GKQeFKzFfTGbuZigMfU1
 b/DYJEX/d3gFN0KkQT7MLrjsNTgD+i/8ue0Xwduo8Mhm4JTPbW/Ojs1/+IhGWAz4cC1Ci+bIHza
 ctoVBv4Xm9xvFEDKmmUfMJnSgDJU6H0VuNkEuYz4KB0XdKiR6dhui5oS/msxRfdwUpJHoiF6HIY
 CaN+Lsu3pxES9xPq/Z8p5Selkm2EyfYVdMJur/m7lREZLC62xfQZPVCUOn/O/uDM+UWIEZy1xAg
 xay5SENaLdYdqexEI1qriLrD/UPFP6c1fB9fB6YwUROcfx40Iy9h/Z3gx0mhUzsx+1+JTpDKkvx
 xcxpv7R3/impbmrY6ed37DmPhFDMpY4L82+8ikNUGrQ8ebaC0VYzlUbVETw787SwFG+HT5Qfv5Y
 lM7wE7/dn/l9n/2zBlT3Ziksdxth93V68gpVMV+pFM6LuDCstqDzVjiCBUgyqCFqzU
X-Received: by 2002:a17:906:6a0b:b0:b87:6c5c:d3d4 with SMTP id
 a640c23a62f3a-b8d2e89a9acmr75120966b.2.1769366357133; 
 Sun, 25 Jan 2026 10:39:17 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:16 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 00/19] drm/amd: VRR fixes, HDMI Gaming Features
Date: Sun, 25 Jan 2026 19:38:55 +0100
Message-ID: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: AF7D381B73
X-Rspamd-Action: no action

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

Changes in v2:
- Updated BRR max value to 1023 after testing one by one. Which should've been
  obvious since 1023 is a max value for a 10-bit field.
- Fixed some somments to not trigger "not a kernel doc" warning
- Considered ALLM comments from Michel Dänzer, Daniel Stone and Jani Nikula.
  ALLM is now triggered only if wither VRR is active or Content Type Hint is
  Game. Content type hint is already supported by amdgpu and fully plumbed.
- Added module property for controlling ALLM trigger behavior. Now it can be
  configured to never trigger ALLM, trigger with VRR/Game (default) or be always
  forced on.
- Added HDMI VRR desktop mode module setting, which is on by default. This
  mimics how FreeSync is handeled on Windows and this fixes a lot of issues with
  unwanted screen balnking and glitches around entering/exiting VRR mode.
- Moved hdmi vic mode check to one central function to not check for 3D and ALLM
  in different places which could sometimes break the logic for translating HDMI
  VIC modes in CTA vic modes (when such translation is needed).

Tomasz Pakuła (19):
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
  drm/amd/display: Add parameter to control ALLM behavior
  drm/amd/display: Reintroduce VTEM info frame
  drm/amd/display: Enable HDMI VRR
  drm/amd/display: Add HDMI VRR desktop mode

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  27 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 206 ++++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  49 ++-
 .../gpu/drm/amd/display/dc/core/dc_resource.c |   5 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   1 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   7 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   2 +-
 .../amd/display/include/ddc_service_types.h   |   1 +
 .../amd/display/modules/freesync/freesync.c   |   4 +
 .../amd/display/modules/inc/mod_info_packet.h |  18 +-
 .../display/modules/info_packet/info_packet.c | 340 ++++++++++++------
 drivers/gpu/drm/amd/include/amd_shared.h      |   6 +
 drivers/gpu/drm/drm_edid.c                    |  41 ++-
 include/drm/drm_connector.h                   |  47 +++
 15 files changed, 559 insertions(+), 197 deletions(-)

--
2.52.0

