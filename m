Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPW+MEY4qGkTqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13D200ACA
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B709810E9EC;
	Wed,  4 Mar 2026 13:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XzO3mtyK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E45210E9EC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:48:49 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-439b8a3f2bcso2615995f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 05:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772632128; x=1773236928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C9MyPO/rsrk8DBKCUnJACWD6uK5SDdcOqlz033Neykg=;
 b=XzO3mtyK7FFv6EA0zQt8fAQzcjYNjRjjre9DUlpR8sS0L6ZGkW6hdR0IOtNJ0az8dY
 8WnIlcfRvzLWemqOUk4jofs/T/PUT5pSBIGP+/wVH9SGU+5T1BBqYju8gLKdJz/8mRUo
 TLtiVh/Etvu8HsqIbWBbtF+BFww7nkMBUuhs6m8C5FepBwP8bkMTwnfaTaLykrgFc34b
 f/e92UW7iBvwgAJfVX4evqHgYb27DCdZs05Jwlvzp/yTxm9t2DvSxslFyNUsRJ7pAnPk
 keQaK5tQ1+9Dhmb9w1olCi0GgvbLoeOg8nnRiHVtp+kBXQLWiY5r8RURByqcssYJYQ+D
 tzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772632128; x=1773236928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C9MyPO/rsrk8DBKCUnJACWD6uK5SDdcOqlz033Neykg=;
 b=Agg4Ng5JwfFchWMrU+q2ty1UCI/phEy1AEZAfgyGWwypTgRV99P1+Gzdlwsevz2hrg
 bANEFvKIgL3YClzgALTrj5+xql87qydzoMDJyB74pYo06duJyATE1p/aWDHm9MHKVZjD
 S+kHP8ML6Qulglzh9FMh/MA5plOnW/JYOyzrgoLO1P9Iq9eSwVl6mJuLsHbDcE4PZieh
 nIfaOuxppvpVam+NqxliYgZ05j/7d8oYa44UEYqkFNB/0kmOZHHrB2dnRkSPR5M67Yur
 NtdQneUcgaRd8izGqLTGihtNF12Z6i4lUczqBWkUpYJS1rLkxXryCztEGBT1huGhKotl
 Exow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdqb4u6xo1cO5hqKMpEQeALCTrTfiLRGTpLQw6KhowAsICMVd09hpa5P40taoIFFQvvAHwGQHMb4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBRvJwHt10DfVMo7mDxmogTiXl8IWC1e1FtJNZjsj4OGKAvLeo
 r5JvTOgaz4xZTCPvo6nq8X53u58XnjNLkkQg8uMEOy+nSc7LVRQ0kEky
X-Gm-Gg: ATEYQzyyI2UK8SFmCcvL3ayI9NExMttHRqezO4y5AYcD5CdhnX53bsFTjhIyMItysgg
 6pcZ7fGxowKinsk7UVuGalegi5y+t4iTs2BGk3zxYuUS353MN6F2ZdNZ3T7PkF8W3wiMGlmv2W/
 JIy1FwoDbpS1a9ETTqAgqP2CyxWwUv8VNld5sUtgIHYrMfS85jsfkNUeDV3k5Atl7JI6vdcem+0
 3NjqfvJdiw+K1/J/H5OoJdYkOw3IotYapazgmm3vMbctNSnKnTj6enqfBvTZXVu3X8yRPykpT3q
 cIwvdmOXk/Q9XstB4RUeCsvJKP4lhGbKKQQPCV4lxzZs7j9I2+3h8f6xNFZydcTq7uudmnI+QG5
 9oIN9ujL1M8ovJmZDhjIp5Pt5pKWFap2iPQ6Ad+7j2FC11hWyv8EWLJsEWFysma2gw59R0IP5du
 G5fC46Jffzqedcf/s5WQKjAcbmA/G3w7k=
X-Received: by 2002:a05:6000:1885:b0:439:be43:61d6 with SMTP id
 ffacd0b85a97d-439c800fdfemr3927375f8f.48.1772632127417; 
 Wed, 04 Mar 2026 05:48:47 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 05:48:47 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/4] Add RZ/G3L GFX support
Date: Wed,  4 Mar 2026 13:48:35 +0000
Message-ID: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
X-Rspamd-Queue-Id: 2B13D200ACA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,glider.be];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:steven.price@arm.com,m:boris.brezillon@collabora.com,m:adrian.larumbe@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,renesas.com:email]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L SoC includes the Arm Mali-G31 GPU as a 3D Graphics
Engine (GE3D). The Arm Mali-G31 GPU is a graphics acceleration platform
that is based on open standards. It supports 2D graphics, 3D graphics, and
General Purpose computing on GPU (GPGPU). Add the binding and driver
support for suspend/resume functionality along with some improvements in
panfrost driver.

Biju Das (4):
  dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3L SoC
  drm/panfrost: Drop redundant optional clock checks in runtime PM
  drm/panfrost: Add bus_ace optional clock support for RZ/G2L
  drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC

 .../bindings/gpu/arm,mali-bifrost.yaml        |  2 ++
 drivers/gpu/drm/panfrost/panfrost_device.c    | 36 ++++++++++++++-----
 drivers/gpu/drm/panfrost/panfrost_device.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  1 +
 4 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.43.0

