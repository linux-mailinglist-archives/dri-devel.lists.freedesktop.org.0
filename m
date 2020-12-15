Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCCB2DAF24
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 15:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BA16E3B7;
	Tue, 15 Dec 2020 14:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76926E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608043357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kaTetupLyuYrqzsX7UwEN39ZooQ2px2nX3T94IUgkoc=;
 b=LzeVFd04XP1qMb0estjqQLy9UFsCf76tkkLTMplLX+MSgJlPaDUOwoSejGvXM55KDCBE9/
 iYSeSlukHD48NpPx54M/DrOKpU+3RTWhxhKC/RS+p7Zd81eVwjDtmaEX37COw0qw3XY6AW
 vBfrkB2X3PNONrAwgv4epXmcYUW0ITA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-NPf-hpSKMWaqlfZcn6i51Q-1; Tue, 15 Dec 2020 09:42:35 -0500
X-MC-Unique: NPf-hpSKMWaqlfZcn6i51Q-1
Received: by mail-qv1-f72.google.com with SMTP id c17so12431065qvv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 06:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kaTetupLyuYrqzsX7UwEN39ZooQ2px2nX3T94IUgkoc=;
 b=ODtaVA7HnxpQg0MOZFbtphEdK+k/HdieooY6ZKPP4jLEdHhnkapieRgNPUM1YRJ4yR
 cDLu5qx1YxHvl0e5DXrUG7Ai/R2kjurb/AtMgVTYXeVvqo7u4RdDU/kH0IFuhg/INaAu
 2DFdZkg7CD+RSrOKVCNn7a2ohVU5XV1taUvV5a6tw6G7FD2RS3ZvPRUV9JGuGMK+pTWw
 9HmXyurYciPjPlslB8DDfSyUU+WWJ+MItgm8ZDk+DIumkg0snOcKtpbJxcwHT8iECgV3
 Yzx+xVE/EZKOgBnEZ+rSnc2Lm3y1zHt8JW5p+2FuRSJrp12MyFOORmpH3sCJElZ72T1C
 ArKw==
X-Gm-Message-State: AOAM533Uvyi0Ii3Ze5KXLV7Lt3S7DMWKmsknyiFQkTs5BP3L01yTEEpA
 HoJJrBsqbOI5UuBQg1H+3zUxi73/dIPtl04Db+2A4ReyvaZfcdScNW32dlNXMqJqYt916WbNCV2
 uIIjs0QfyXN3Q1nmdSBXVzynWvcbQ
X-Received: by 2002:ac8:5c13:: with SMTP id i19mr38740573qti.250.1608043353976; 
 Tue, 15 Dec 2020 06:42:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfIuT11JaKaKkZRsbteafZAH9wJ/RUSSqFrn3oRILtxKd8WAilaGcx6jRbNvgnaQ2aFZrBFw==
X-Received: by 2002:ac8:5c13:: with SMTP id i19mr38740349qti.250.1608043349158; 
 Tue, 15 Dec 2020 06:42:29 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 193sm5726550qkj.105.2020.12.15.06.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:42:28 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/radeon: remove h from printk format specifier
Date: Tue, 15 Dec 2020 06:42:23 -0800
Message-Id: <20201215144223.1881097-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

See Documentation/core-api/printk-formats.rst.
h should no longer be used in the format specifier for printk.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_uvd.c | 2 +-
 drivers/gpu/drm/radeon/radeon_vce.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 57fb3eb3a4b4..39c1c339be7b 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -155,7 +155,7 @@ int radeon_uvd_init(struct radeon_device *rdev)
 			family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
 			version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
 			version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
-			DRM_INFO("Found UVD firmware Version: %hu.%hu Family ID: %hu\n",
+			DRM_INFO("Found UVD firmware Version: %u.%u Family ID: %u\n",
 				 version_major, version_minor, family_id);
 
 			/*
diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon/radeon_vce.c
index 5e8006444704..a450497368b2 100644
--- a/drivers/gpu/drm/radeon/radeon_vce.c
+++ b/drivers/gpu/drm/radeon/radeon_vce.c
@@ -122,7 +122,7 @@ int radeon_vce_init(struct radeon_device *rdev)
 	if (sscanf(c, "%2u]", &rdev->vce.fb_version) != 1)
 		return -EINVAL;
 
-	DRM_INFO("Found VCE firmware/feedback version %hhd.%hhd.%hhd / %d!\n",
+	DRM_INFO("Found VCE firmware/feedback version %d.%d.%d / %d!\n",
 		 start, mid, end, rdev->vce.fb_version);
 
 	rdev->vce.fw_version = (start << 24) | (mid << 16) | (end << 8);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
