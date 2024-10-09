Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0F996D59
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895FB10E731;
	Wed,  9 Oct 2024 14:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SeRJZ3DE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7B10E731
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ijVWC4+ZQQKu10WIGBYYxEapc0u8QzbtUyEvm2m+ajA=; b=SeRJZ3DEKAYZ6Imf6XQBfnU60H
 nygm0EidbWKlbeKK38APM5id8BUtdkK2iMOFFwEDNvsp8ijB8l9rUNTYJWF0HxbA22MAi4XYySCY2
 e42IWeofCy7QUutnIC0D62Zq2lBxml97yJbIw9jEhFUV84YKo4+oOU9X/91b9xvftOBp6TrGWCJk6
 AtFXYPYegh1bOmDsMjQ3y6Oa1Qq7V6heO8wqD6M2+E5txFa9VOELnb1cc8mGn5rO1RvZKBW59I3wf
 Da9xwzD28CVr603lDX60+pkM6tMARKYbiAZWR5Nyi2iltBbFF07Z9UYR0eqDjOef7Nj7m5CCmuSPN
 v/lQZaRw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1syXQn-006xyr-LY; Wed, 09 Oct 2024 16:12:50 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 1/2] =?UTF-8?q?MAINTAINERS:=20Add=20Ma=C3=ADra=20to=20VC4?=
 =?UTF-8?q?=20reviewers?=
Date: Wed,  9 Oct 2024 11:12:05 -0300
Message-ID: <20241009141240.1948482-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.2
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

Although I don't hold expertise on the display side of VC4, I'd like to
help reviewing patches that are related to the 3D side of the VC4 driver.
As V3D maintainer, I hold some expertise with Broadcom GPUs and I'm
constantly testing kernels on RPi 3-5.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 365fb0ce5117..a740b73e4ecf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7799,6 +7799,7 @@ F:	include/uapi/drm/v3d_drm.h
 DRM DRIVERS FOR VC4
 M:	Maxime Ripard <mripard@kernel.org>
 M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
+R:	Maíra Canal <mcanal@igalia.com>
 R:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.46.2

