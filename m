Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA5FBqZJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDFA1464F7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A5210E031;
	Mon, 16 Feb 2026 16:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eGnceHBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DCB10E094
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:21 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-b8f947ea8easo25676166b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260319; x=1771865119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FeupTXTwdb4tJl288OLcqGCilrBaEcjQA2YfoIrg6hE=;
 b=eGnceHBPE0sbca00+YVHWMT93HFhytEd9atYuibXDGX/7hM2yqwLCAc08JiN9P+03X
 +2isstM+JPQQ+RrciVmYnjStMVxi7kZGkw9l6l4qS7PFsP+Zd/CS1rDh2Cjrx+qfzXBQ
 P+Y+xWwM/iErWytxZ8Yw6nFBDB/1dL8egmW3OZ3eplDzKrj2RF5sgc+JGIooB/mMlJFo
 /Wl+xHGoDLxFPpTQrNXvLWL4PtnfHU+/yMTphd5Kpg0K/2fSiwPxCpj/00RJmAlpzidh
 PhpqUAGt5l2EFsNebBma6cYCLl46hXZyc0Hl8dHorAlqwTV7S7VDpjPt30RlkHiU+QSU
 lnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260319; x=1771865119;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FeupTXTwdb4tJl288OLcqGCilrBaEcjQA2YfoIrg6hE=;
 b=LfvTKyXDZPMO7BH/Q52byGwXvbE5rsv8Dh8ZG8lHH5wgZwhk0xbEWqsGVEJn/PNKax
 2eYgMSsr/wCbyHk/ddYo1WFaQ1OO5VMEqGkDaGCZADqCAQiEV748Nctf6I93TmAKOs/J
 Fjn/XxMW5X1WjD3uMnCXjF8DaUQw4gXQPU5VuPHgJNH55ncmGb1JmcUjs1+6Vpq8TdvQ
 1s36q/kGBbv5HaP+Xr2soZOqdT2UEZBg/GxX3LoO5k+Iw1Mjn3BasMuetLTxQsX6EGq8
 OMNfEAKuL6Khuf1QOk5ecHuPQYzEbms7C2C0cwQzvotIy+782txChmInqepko4TS82DC
 A7+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYvwo3joXZF+/RYDcjAVBhi6XNe2P7cASyek9sAmys2qfiy/X3rId0cWZd4tVkBeXLeYUU6HDnGJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm+OA9jYg7FHzbE9VR/U9NmXyN0ZgIvJOiI8/t/yqtsCMZtJ69
 4t/76k/mpWWAcC+NUFnLI8ah8OAHFR3U3YS8z0MRok5unkuquXHL2Kdb
X-Gm-Gg: AZuq6aK3UV3Twwhht+3GzUilNKNt6mFXh+Xks4NCKsERu+cy8EtY1mI1hJkfAZeujea
 qUuNlD3eAtsYeLUefLreZtCrtzigHxEoKrUQJowE09WSZz+J5qXxehkKbqHdQS7gd5OK0PpIQyR
 WdX0CF3iEK+SDh4BtJXBMeRH4Uq+AfEV08XrkSz65ktGePNLg0vB+6OlPk8IOVsw0ymjOdbZPG2
 MmpbVWwV78ecdPHN6A/a8jILrt6PoTmNmEbtBUxOUaopLlHjCcrtexr5pxAly+p6G8tlNJzwQFT
 24+Ei9BkSnY1y5z8beBZXQDr8tM6uUoGh3zyG0YAsyiIU9hrDujQ5qaAlEGjyZHFuqrH9LSZ98Y
 yUGz2X8PJKq6FL9b5EuLgBqCTOJzYAKRjtTMKB9Vlp5TCiGaSytoqCsORUcXJtFvqO33gaMAOOO
 ZAH9iwo4m3Ho4WzaBiVsfPz7RF+NTVLCPtfxg70sEgtDaLjEbyJVD9TWvbq+PwLqTsZqr8DOdDZ
 do+
X-Received: by 2002:a17:907:980a:b0:b8a:f5a1:32f0 with SMTP id
 a640c23a62f3a-b8facdbba00mr390066266b.3.1771260319241; 
 Mon, 16 Feb 2026 08:45:19 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:18 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 00/27] drm/amd: VRR fixes, HDMI Gaming Features
Date: Mon, 16 Feb 2026 17:44:49 +0100
Message-ID: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6BDFA1464F7
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

Built on top of amd-staging-drm-next

VRR range fixes are simple and fix VRR support for many monitors. They
close about 5 issues on the amdgpu issue tracker.

Adaptive Sync over PCON is only available as FreeSync over HDMI. TVs which
do not support FreeSync, do not have working VRR with DP -> HDMI 2.1
adapters even though adapters will take care of HDMI VRR info packets.

I myself validated these changes with my Samsung S95B + Bernhard validated
on LG C4 + FreeSync-less Sony Bravia 8. I used Alienware AW3423DWF that
only has HDMI 2.0 to check that FreeSync still triggers properly for
"older" hardware,

For missing VRRmax or VRRmax == 0, the upper boundary is the currently
selected video mode refresh rate. I wasn't sure how best to implement it
but ended up on a great solution. We first check if maybe there is a VRR
range in AMD vsdb. If not, rely on limitation of base refresh rate in
VTEM vsif.

More history on previous shape of HF-VSIF and VTEM in their respective
patches but the info packets were previously included in the driver code.
HF-VSIF was improperly handled and VTEM doesn't seem to have been plumbed
as it had no use before. I recoded these and this code should be much
easier to understand and maintain.

ALLM support uses the info from EDID to determine if ALLM is supported by
sink and if that's the case, always signals for ALLM to be enabled. In PC
use, be it for gaming, desktop use, work etc. we always want the lowest
latency and less processing + possibly higher available refresh rates when
gaming mode is turned on.

HDMI VRR support relies on sending VTEM info packet in place of FreeSync
info packets. Though VTEM has it's own place in the info packet pipeline,
I didn't touch it as it already replaces FreeSync info packets. If there's
a need to change this, please let me know for v2.

Both features were tested and work just like they were intended to. Gaming
mode is automatically triggered and HDMI VRR is used in place of FreeSync
(if available). This HDMI VRR preference actually fixes VRR-induced
flickering on many TVs (S95B in my case) with somehow subpar
FreeSync implementation.

I still think it's better to not force users to search for solutions
manually especially since it seems like DP and eDP don't save info about
FreeSync version and completely rely on basic VRR support.
This would then be mirrored.

There's still an issue with some TVs behaving like a mode change is
happening when VRR is triggered and I'd like to maybe tackle this too. When
using HDMI through PCON, VRR is always active, like it's in
VRR_STATE_ACTIVE_FIXED mode. This makes my TV much nicer to use and
replication this behavior would be worthwhile IMO.

Everything in this patch series has been based on already public
code/knowledge or trying things out until they work/break.

This patch series supersedes previous patches/series:
https://lore.kernel.org/amd-gfx/20251209231107.1968472-1-tomasz.pakula.oficjalny@gmail.com/
https://lore.kernel.org/amd-gfx/20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com/
https://lore.kernel.org/amd-gfx/20260113183540.86266-1-tomasz.pakula.oficjalny@gmail.com/

Changes in v2:
- Updated BRR max value to 1023 after testing one by one. This should've
  been obvious since 1023 is the max value for a 10-bit field
- Fixed some comments, to silence "not a kernel doc" warning
- Considered ALLM comments from Michel Dänzer, Daniel Stone and
  Jani Nikula. ALLM is now triggered if either VRR is active or Content
  Type Hint is set to "Game". Content type hint is already supported by
  amdgpu and fully plumbed.
- Added module parameter for controlling ALLM trigger behavior. Now it can
  be configured to never trigger ALLM, trigger with VRR/Game (default) or
  be always forced on.
- Added HDMI VRR desktop mode module parameter, which is on by default.
  This mimics how FreeSync is handeled on Windows and this fixes a lot of
  issues with unwanted screen blanking and glitches around entering/exiting
  VRR mode.
- Moved hdmi vic mode check to one central function to avoid checking for
  3D and ALLM in different places which could sometimes break the logic for
  translating HDMI VIC modes into CTA vic modes (when such translation 
  is needed).
  
Changes in v3:
- Fixed wonky English
- Less struct traversal in helper functions
- Fixed possible NULL pointer dereference while checking if ALLM support is
  indicated in edid_caps of local_sink
- Fixed ALLM bit assignment overriding 3D bit data in HF-VSIF
- Fixed assignment of the upper 2 bits of BRR in VTEM

Changes in v4:
- Removed amdgpu module settings for vrr and allm
- Introduced passive_vrr properties to drm_crtc and drm_connector
- Introduced ALLM properites to drm_connector
- Implemented said properties in amdgpu for HDMI connectors
- Updated the range extending logic
- Rebased on current amd-staging-drm-next

I'd really love to figure out how to enable drivers to override property
defaults for crtc/connector. Ideally, ALLM would default to dynamic mode, 
but attaching with said value doesn't matter as it will be set back to 0
after connector reset.

Range extending logic better explained in the comment/commit but turns out,
some manufacturers modify the lower VRR bound in Monitor Ranges due to
issues found just before release but the range wasn't updated in vsdb.
Using VRR with the extended lower limit caused blanking and other issues.

The reworked range extending logic will only extend the lower range, if
the VRR min found in Monitor Ranges disables LFC (vrr_min > vrr_max / 2).

The report and findings can be found here:
https://github.com/CachyOS/distribution/issues/329

Passive VRR is enabled by default for connectors that support it. It's
not super useful for DisplayPort so amdgpu only attaches it and uses it
for HDMI connectors. It hooks up to the already established
freesync_on_desktop logic which wasn't used at all, at least in the public
code.

Tomasz Pakuła (27):
  drm/amd/display: Return if DisplayID not found in parse_amd_vsdb()
  drm/amd/display: Refactor amdgpu_dm_update_freesync_caps()
  drm/amd/display: Remove redundant edid checks
  drm/amd/display: Move DisplayID vrr parsing
  drm/amd/display: Always try to parse AMD vsdb
  drm/amd/display: Check for VRR range in CEA AMD vsdb
  drm/amd/display: Use bigger VRR range if found in AMD vsdb
  drm/amd/display: Separate DP/eDP and PCON paths completely
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
  drm/amd/display: freesync_on_desktop support for HDMI VRR
  drm: Add passive_vrr_disabled property to crtc
  drm: Add passive_vrr_capable property to connector
  drm: Add ALLM properties to connector
  drm/amd/display: Use passive_vrr properties in amdgpu
  drm/amd/display: Use ALLM properties in amdgpu

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 299 ++++++++++++++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  49 ++-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   3 +
 .../gpu/drm/amd/display/dc/core/dc_resource.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   1 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |   2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   7 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   2 +-
 .../amd/display/include/ddc_service_types.h   |   1 +
 .../amd/display/modules/freesync/freesync.c   |   4 +
 .../amd/display/modules/inc/mod_info_packet.h |  17 +-
 .../display/modules/info_packet/info_packet.c | 298 +++++++++++------
 drivers/gpu/drm/amd/include/amd_shared.h      |   6 +
 drivers/gpu/drm/drm_atomic_uapi.c             |   8 +
 drivers/gpu/drm/drm_connector.c               | 188 +++++++++++
 drivers/gpu/drm/drm_crtc.c                    |   2 +
 drivers/gpu/drm/drm_edid.c                    |  41 ++-
 drivers/gpu/drm/drm_mode_config.c             |   6 +
 include/drm/drm_connector.h                   |  99 ++++++
 include/drm/drm_crtc.h                        |   9 +
 include/drm/drm_mode_config.h                 |   6 +
 22 files changed, 864 insertions(+), 190 deletions(-)

-- 
2.53.0

