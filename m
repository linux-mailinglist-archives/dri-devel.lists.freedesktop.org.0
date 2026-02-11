Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIBmNT/cjGm3uAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 20:45:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319C71273F4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 20:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B79910E0DC;
	Wed, 11 Feb 2026 19:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fT4W+ZHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822C310E0DC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 19:44:59 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-8c6a50c17fdso570585085a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 11:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770839098; cv=none;
 d=google.com; s=arc-20240605;
 b=XoPztO5186ynSIhjjzcxBV11B2ZJ3rP2bUgoDWZdLKa7tABQv6sFzaXEqevQ92KXhW
 c9OWZj70HkF1ZmHBRS4ptr5SWTE9vxRhdIyeky5xTS8cJeHOuI4yENNSLzYpfT9IuZL3
 9BiFyHNY6ekIqateJEuA8veHb/aGUU10kjoGBxlNZ1g8+CJQ51N5e6IUhRS67plLko63
 EfCm3O1Bl2aH5DBDQOMjD6Yma+pd92yaH68/I241OSaW4E9PilPyp1ZcCA1TTkmIyoer
 qeSAwEy4LnFJckIpGLj1fzaGUGg2so8YmVclpkpRdRilNE1d/Usk/AlastYhD3mcIyTQ
 r96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=uWB2BceE4BBnOEkw5tNncByjukmsZZnlj8sJ/TInWnI=;
 fh=Szlpv+htmYZ3XB6Aumo3+TumwrKTMsER2/fG1TNa3Z8=;
 b=DBp6Dy4njGzkYWUlSROiJLBlLcedens612JMIRwPumvRDd2EjQw8iRUF+YhxZ/N3ap
 dwE1yc3vafqHoWReIHPQyKuZbmjGWIu4yg8Q2GcjLRrGqC64gnFLhOHSf2lhKF2TawIX
 3VxSYPU/wQEnCVJPNCJAMtP9sfJn6njYeedqdvw2VVQBVNYNoct2080JDsy5Bk6PDHsL
 mM6vl5Z4GGGE/ZMGMex0tEL19R4f3bJG5OgPWbTLxnx57pA76MWkrmQPYoKqqzig1f/o
 fxRGcEPLHsqdGjZJYB5TUVEQhKE7xFKOO+WtiZT3EUIBE4ClKbcwg/y1cAN96nrC55ik
 wKAg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770839098; x=1771443898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uWB2BceE4BBnOEkw5tNncByjukmsZZnlj8sJ/TInWnI=;
 b=fT4W+ZHpUtHcst1/UyRFRRd/2lKslp8r5qXbAuzerXAeiHZq3J4LY/98nkKcgIdsdw
 gBl8UCdv4YqoRhidQRHEwOukoSvbkr8ccM3gMGyWrldnA24Do6q/oak0/oUHBeTMIZ1c
 PANovLk986ekkXudUMgJ0EllDi1v0rNOYdnI7SQrjKWVIpNyfLixSQMXgmx48RVaiCCg
 2r9B4wHFzLz3ZNVeZuWxPOCHozY8pO7/iD8DUmoFDfYX9tAiKapYbSd7THfhG8FA9GjX
 EKlHZmO9muInxarCPwQ8Hjqbg3VpgfZXm9mH7ouhyvvXcQ2LZgeBA2P0/1WmZwkkBX5Z
 NMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770839098; x=1771443898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWB2BceE4BBnOEkw5tNncByjukmsZZnlj8sJ/TInWnI=;
 b=G83FtrjUXtFFx3gNiIdeLeoWr8TU5Bwip00qS6u3vdw0Il0/mtSxGBU6OWS/RB2NQy
 HW/7jxCPvUUEDm7W4StNrF8wt3WY7MDqXYGmJzGEdFAM5DzVZbhF1OZj06r4Cyrt8+/y
 sWkicTEklzax+ANiUf3UgaoIostgbCg/O3MxRDLWx9FTK/UqXDqCMZ46qD+y2lv6Nuxi
 K6Q8RUVXgfSpu5XwKW1zGxsQk2neJmVoawdFGGQ7ZLvFzaYCJDGaz1fFD/zSKfQKkI4C
 J4f7aeUBR4Knlx0QIMwZLh1qcSvy9/cWmkv3tkh4FKRzPDAHrI5raiu5iSwWSLlz+bYS
 CJDw==
X-Gm-Message-State: AOJu0YyornBoXJUEYsX/sBsUJTBjWgMY92Kyfa0SJaoGP6y8g7F3uFKg
 L4lEenrpl8U2IcnoAwwcbyW5Oi1G/6gvl2IYhAl3sxXaSJ/o2w32rqftYAxJ0L1oSwXBpe4WHJv
 yKO810ixIHmtVRM/xLSZX92JqhtSbnZkPvUd4yqEvdAGc
X-Gm-Gg: AZuq6aLYvlWqzY31UGaJI8VhJ98F+Cxki7ESzrj4W9WzlpUU22xMpa7wabSMqEOimwf
 08DRxw4thn8d728izL1acg+29Id/pbqDIKdHC/50wNRPnUbcsZHvx0gJJLqQvlfTnOLM+LPOJR/
 x3DMPn43fR8++eXV9oSGGNWuTrkV6xCjvehM6/4MkZw7P4iLsyEm7ihnVD8/YeaDwAFXgyqcAnk
 z1W9PfXUk8KdmlD9CTAl11dcyueEzKqMSNyP2vl3Sg1Q2zkMSnZLzRCz5F+rA3wu2M2ImAe7HGR
 zOpQ8m8h6cpIQ5YOmxT8Em4Bt/fAQBlSimYGbEzFT/QL9G2Jbns/vWYBpTAR2pekueM=
X-Received: by 2002:a05:620a:191c:b0:89a:2f9b:10d3 with SMTP id
 af79cd13be357-8cb330a52a9mr48189385a.30.1770839098002; Wed, 11 Feb 2026
 11:44:58 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 12 Feb 2026 05:44:46 +1000
X-Gm-Features: AZwV_Qj9EujDd5JkyZLP7xVG-DrfGvVJijrq0VvRrYCV6LycF-vCo-Rsrq9MoWs
Message-ID: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
Subject: drm AI patch review hacks
To: dri-devel <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>
Cc: "clm@meta.com" <clm@meta.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 319C71273F4
X-Rspamd-Action: no action

Hi all,

This came up at kernel maintainers summit, so I've been trying to see
what I can piece together, and have a small demonstration that may be
useful to some people.

I didn't want to pollute the mailing list with AI patch reviews, so I
decided to set up a public-inbox that the reviews are pushed into.
This isn't currently automated, I'm just asking claude to pull the
last 2-3 days of patches and review what is new every so often.

The workflow use lei to pull mails to local PC, use review-prompts +
my own prompt to try and review a patch series, both as a complete
work, and per-patch reviews, then create the reply emails and put them
into a public inbox git tree for publishing.

I've no idea if it's using review-prompts properly or at all, this is
all very vibe coded so far.

https://lore.gitlab.freedesktop.org/drm-ai-reviews/

This is a public inbox, you can also git clone

https://gitlab.freedesktop.org/drm/ai-reviews-public-inbox

I'm currently just using my Red Hat provided claude with opus 4.6,
until I get told I've burned enough money.

The list below are the patches with reviews, if someone wants to look
and give feedback on whether the reviews for their series are useful,
find any bugs or regressions, that would be cool.

I've bcc'd anyone who has a patch on the list.

This is also just an experiment to see what might stick, it might
disappear at any time, and it probably needs a lot of tuning.

Thanks,
Dave.

[PATCH v2 0/2] drm/buddy: Documentation and internal helper cleanup
[PATCH] drm/amd/display: Remove duplicate include
[PATCH -next v9 0/3] rust: Add CList and GPU buddy allocator bindings
[PATCH V1] accel/amdxdna: Fix suspend failure after enabling turbo mode
[PATCH V1] accel/amdxdna: Fix dead lock for suspend and resume
[PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version decoding
[PATCH v2 0/2] drm/vkms: Fix bad matrix offset component multiplication
[PATCH 1/2] accel/amdxdna: Fix NULL pointer dereference in mailbox
channel cleanup
[PATCH] drm/msm: always recover the gpu
[PATCH drm-misc-next] drm: verisilicon: assign git tree to drm/misc in
MAINTAINERS
[PATCH drm-misc-next 0/3] drm: verisilicon: convert drm_format to
vs_format in atomic_check
[PATCH v3 3/3] drm/panel: add LXD M9189A panel driver
[PATCH v1 0/2] ARM: tegra: document Tegra20 HDMI port
[PATCH] fbcon: Declare struct fb_info.fbcon_par as of type struct fbcon_par
[PATCH v1] drm/amdgpu: fix sync handling in amdgpu_dma_buf_move_notify
[PATCH v9 0/7] User readable error codes on atomic_ioctl failure
[PATCH] accel/qaic: Fix dma_free_attrs() buffer size
[PATCH] drm/radeon: Add HAINAN clock adjustment
[PATCH] drm/amdgpu: Add HAINAN clock adjustment
[PATCH v9 01/15] drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_b=
ridge
[PATCH v2 0/5] drm/ci: add new jobs, uprev IGT and mesa
[PATCH] drm/bridge: lt9611: Remove DRM_BRIDGE_OP_MODES flag
[PATCH 0/6] Support for the Pixel 3a XL with the Tianma panel
[PATCH -next v8 0/3] rust: Add CList and GPU buddy allocator bindings
[PATCH] drm/bridge: samsung-dsim: Fix memory leak in error path
[PATCH] drm/rockchip: vop2: Use drm_err_ratelimited() for wait timeouts
[PATCH] fbcon: Remove struct fbcon_display.inverse
[PATCH 1/5] dma-mapping: avoid random addr value print out on error path
[PATCH v3 2/6] drm/gem-shmem: Test for existence of page in mmap fault hand=
ler
[PATCH] gpu: host1x: Fix passing zero to ERR_PTR in host1x_iommu_attach()
[PATCH AUTOSEL 6.18-5.10] drm/tegra: hdmi: sor: Fix error: variable
=E2=80=98j=E2=80=99 set but not used
[PATCH] drm/mediatek: dsi: Store driver data before invoking
mipi_dsi_host_register
[PATCH] drm/i915/guc: fix corrupted copyright symbols in selftest files
[PATCH v7 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
[PATCH] drm/panel: ilitek-ili9882t: Fine-tune HFP for tianma, tl121bvms07-0=
0
[PATCH v4 1/8] drm/amdkfd: Add userptr batch allocation UAPI structures
