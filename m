Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFUYFARBomlz1QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 02:12:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B030E1BFA5E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 02:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B12410E065;
	Sat, 28 Feb 2026 01:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gq1rNC97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072C110E065
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 01:12:32 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2a8fba3f769so12905605ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 17:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772241151; x=1772845951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aaPoQfadeqAcC/F2pMAhUC8silyGRKBmTmyeCrPN6s8=;
 b=gq1rNC97Rr6AfP6kgYJiCvx+TAnguYW00TQ6fHUO4m5nHCyGcqOCkI7DSGDzjax9FO
 8w8KbVmZm+HBuHyEdec/OwXOkOCzKMbwVIMxMPii6Wq9LnCGCruP+JpYBFFGTBW2elBN
 Ud80KoqRuzW6Fc6Qvlkh54m80P4PWqtsPgbj2z7a3rthD+w2VyPX9CYJ6Y4vZmi7Ub1w
 brcdWUJBW8dZclRQzF5XIyYmg6t2s9LGO9dTcnGCKzYXDnW/93PphYbpMI6nyvbe98M6
 W5oDdUjGmCFmwL+9yV1DlBEutTlvjcVzAc1U6CRz+Wcjn4CKoYQp8U7cGGFnZ+ppmemM
 J8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772241151; x=1772845951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aaPoQfadeqAcC/F2pMAhUC8silyGRKBmTmyeCrPN6s8=;
 b=Zb9xFDaXFQpYyZPIqa01B6NHNuluvoHhRzwA9pelFsKw4XMRNrXkr9DGWq0NfqA+hG
 GXRGDtQx0H7RX5Ms/9E8xtxA6nCeWXrYxIPmJWaUAAZfcOlKEMtzEeUCwDR62x/uxGKl
 yuFx/ByG1MwCOKF7yKMIdyKwDAeoIMLwGdWZD56V5SSERfyIemcMPiX5HxB0YeMxx2mo
 uiIfoOrSkrHZz8a6YK8NQJONFzy9cyLXLjGrAROmdK0RTuKT7sMFcV2WJvDGpS+slSSi
 mSY3eck/dj1kO+yK+oMyBRkkz9vmJpibh+gsMol0mwRg1bMK9M6bKGd7XnW913T5u39C
 CUKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKYv8joMKLZ4hh8hynG6N1JynAnVMY1Fkhgf9SByXvXfjSs0R1SZvG8uFaErFZLKmyoHI1arVo11c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfKl9F7zGfbBjjeLLihw29ov49P5ho4w9B5UK8ht1LguB3itLT
 4F1xRqCN6ZdqjoXHWF9h0uzudF74yO9K/HVvFiwXYIuTsa9kAxkKqnkn
X-Gm-Gg: ATEYQzxT/yATU/VmRY9UTVz5OikbBgDHzwm0Zy8vOwM+YdW6QPrgtVahG5XKlDbkxLk
 twbl0lI4C1W+eocP91X4817LEb6+kHTt82s+qOJmXMbwpnFqGFqernSGgh4ZGXAV9SJG2HkONvd
 JSmh1Iqi1U5yFsbmDGE43qbAcrGFyHnJO2IeAR3LwyxJM/4xOilVb6I8KPZC2To6MaFjQyu3xhS
 i//Bg2/AJnKvKjc4feQRDdQXEA9sbmYo2Q1lxcbEW41CIRgHl2ktGfhkafYzG3XlIck6c/AjIez
 eMsOOvEsCJKBJsbexlItGFwCTDJSqmFiOXKlXUBPCayNg4QF2L3auBqfymHyQwYosjUzqRC7vog
 lybMZ4CF0WdKzuK+ohE+SyRzZs+lbresrJyxra+ldva06bY4YRCNB4Gux75TibgbRfG9H3Z75M+
 +jZm3TIbAMjJL3KBgrZFwYcbfjFApzVCmB0z8XQZyiOo8C3wIdB0uRjA==
X-Received: by 2002:a17:902:d585:b0:2aa:d816:e1a4 with SMTP id
 d9443c01a7336-2ae2e4b0d3emr60789735ad.31.1772241151401; 
 Fri, 27 Feb 2026 17:12:31 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6f46c2sm75772845ad.89.2026.02.27.17.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 17:12:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Evan Quan <evan.quan@amd.com>, Sasha Levin <sashal@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Eliav Farber <farbere@amazon.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhigang Luo <Zhigang.Luo@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Bert Karwatzki <spasswolf@web.de>, Ray Wu <ray.wu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Roman Li <Roman.Li@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Wentao Liang <vulab@iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH for 6.1 0/2] prepare to fix panic on old GPUs
Date: Fri, 27 Feb 2026 17:12:11 -0800
Message-ID: <20260228011213.423524-1-rosenp@gmail.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,kernel.org,amazon.com,linuxfoundation.org,web.de,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:evan.quan@amd.com,m:sashal@kernel.org,m:mario.limonciello@amd.com,m:farbere@amazon.com,m:lijo.lazar@amd.com,m:Jun.Ma2@amd.com,m:gregkh@linuxfoundation.org,m:Zhigang.Luo@amd.com,m:srinivasan.shanmugam@amd.com,m:spasswolf@web.de,m:ray.wu@amd.com,m:Wayne.Lin@amd.com,m:Roman.Li@amd.com,m:hersenxs.wu@amd.com,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B030E1BFA5E
X-Rspamd-Action: no action

In order to backport upstream fixes for black screen on boot with DC
and old GPUs, These two commits need backporting for 6.1.

Related: https://lore.kernel.org/stable/20260225215013.11224-1-rosenp@gmail.com/

Alex Deucher (2):
  drm/amdgpu: use proper DC check in amdgpu_display_supported_domains()
  drm/amdgpu: clarify DC checks

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 32 ++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 .../gpu/drm/amd/pm/powerplay/amd_powerplay.c  |  2 +-
 8 files changed, 25 insertions(+), 21 deletions(-)

--
2.53.0

