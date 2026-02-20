Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFIpN5/Wl2k99QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:35:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C001164673
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7B310E771;
	Fri, 20 Feb 2026 03:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SRiPeXyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C1810E771
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 03:35:55 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2aaf9191da3so10144085ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771558555; x=1772163355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U9RtH3VDdHvCGowWw21cotg2dMzVihzJvU6s07yH8n4=;
 b=SRiPeXyUAZdfxE0rxJkA9ov7tXHpoXDPUNFRiM58bK3yu3TFL4+HGTgxYxqSVuCT03
 STC+7z6j+Ithri9f8iimaxridqermwKfrsd3WOkD7aQ8Db67wDYE08ZMcXs4cOLmhHYg
 nbAjJSvlMP8V9cfwskrkbmJ4jzfKwDDn4B+xw1xNquDtO+VdsbC5iUatXJqMQrQoLM9q
 eLNFeylmxZ7TncTNk98WRJzgh87uR8OUfD3c5cMbVcOZEy0WrTNfBvkW2TAAVhv/HkOc
 wmqGynkA+NgppNvD1mMd+QzZFPliGmjZv3hIIo6OxLV35WxxDGopmg82cyRHh5rWGsx4
 BJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771558555; x=1772163355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9RtH3VDdHvCGowWw21cotg2dMzVihzJvU6s07yH8n4=;
 b=Z/qHqc+rswHyvtVotFm2RJ8Ly8iNdaiGxntMdg1jDUqQn+zpHmUjrH060eRm13wfXC
 hL0YaUvdBstIWDoAF3D2YgkJF7OWK84A7rw8QAThYsherLdVKSRg2mekC3BZrrhsrHLq
 0QjxiKUKgDdz2/mbSywCbiH6C0mV/0Xw6THlN/qDrBcvKTzHrVH3skz/b1MjUyOCLxpB
 nazV1nNLQHY5ZNJ/YuvTn0J3g1gpy51UZI1xtM4Dn/auvwlxkMHbWi8S+rPN/cVlyhvy
 mI6KooIh8JRiJbRDPoTzrQ11H444JyPYdq594f9VzhxpvF4oD0abBMDrV9yu9mgwX8aJ
 rR+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEA6sPINiW0fCC/+KowlDBXmknqkQ7YcFXC38u72V6YCHNYmGSL3hVVOdTvhzVDeNfZOVwaruYCJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBpQ0NHgV3lkUU7OkZuVIAsiUKq0oQszwDF3rSceA104VKUoH6
 olKEJT0THe48nOg5mIT/8xuS+YOFePy9ANZWaGVCprgWUvimeZr7yGra
X-Gm-Gg: AZuq6aJvAN1m/MuXyAIv6hQLxtzTQOM8QayefDRXEklApq68jP+g3jTHbbClDJekLxK
 /gwajtWH2hjVRFoUVi/zwbHOQ0BsdxI2hhDgikcoTOh/qI6Cocy0gqSUq6A996wOLGxnI0mbiGv
 ga02Lyr6VEn6pZ47BfpJag3hYjvGALf8cUdfDZEPEvnLtlpud6rLr9CUr0cv3vLvKPFVDlkjOac
 z+DROlzeX2STLrCWSIFcfmJvMyRkZyOZXAMTMSAsnK2F1wRFV4fIHBbBis4TseXDssOA1d+pef3
 1YEnV6j2IFl9PkwlRAIP2cirRPvndi1bpWYE9ZavRHAq5+9ra2aNi1e1x1irEoGSnf2Lj73VUlq
 Q6wK7RV0F8ldUULudShCIgt3WDnWpJv4dJrXn2A0Ku1MZefG5vcFfzMxE1p1Vd7//od3rfz6g6f
 DWDRAa5ADeeP130ZNAWIZwKuWB5SU15RLQrsEfhBE8WhZ04brCvYbpWGHbolf8
X-Received: by 2002:a17:903:2a8f:b0:2aa:e285:f249 with SMTP id
 d9443c01a7336-2ad50e757a5mr67786975ad.1.1771558554897; 
 Thu, 19 Feb 2026 19:35:54 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a9d5cf8sm177143675ad.52.2026.02.19.19.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 19:35:54 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.19.y 6.18.y 0/2] drm/exynos: vidi: fix various memory
 corruption bugs
Date: Fri, 20 Feb 2026 12:35:48 +0900
Message-Id: <20260220033550.124346-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4C001164673
X-Rspamd-Action: no action

This backport patch should have been backported along with commit 52b330799e2d
("drm/exynos: vidi: use ctx->lock to protect struct vidi_context member
variables related to memory alloc/free"), but was written separately because
some commits were missing.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

After this patch is backported, we plan to write additional patches to
backport to the remaining longterm kernels.

Jeongjun Park (2):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 36 +++++++++++++++++++++++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)
