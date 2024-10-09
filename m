Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D7996D5A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A6C10E733;
	Wed,  9 Oct 2024 14:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EPXU+iwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC80D10E733
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nMopVhlP0/XBQqsYjknjbWc9H4T1LPjPTFMr1HxGHY0=; b=EPXU+iwc5Nu2Vmoi9lIRMn/39B
 SXUKGr/E0dBUIUWmqfHsViW5rfVRh9pvZrjmf206QMBMOkSiYX9f5d07orZE/v1zkPUVeB2i6y4Yt
 gHH0J9jVX8D3PeLG/tvg677V0IEI4ZWqXYxV0uIYLMFUUR+35owc0XuRGCyIhgvFJn42ORRqE8Xs6
 jB4+z0gFgdkdK3xhUn8Q3ZLkroEAeHTX1vSc8FgWPpILqIIuiE8Sg9YtQIjF9Pr+sKqR387xtmj5m
 PEoxHDZFKiWdhmGf1qvLSoG1YAckj2TNuWPrQBzlPHsxY/1kS7uRPIUfZ86mVLX8NF0z+h/d8xRiu
 /1Midmbw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1syXQq-006xyr-Tv; Wed, 09 Oct 2024 16:12:53 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 2/2] MAINTAINERS: Fix VC4's mailing lists
Date: Wed,  9 Oct 2024 11:12:06 -0300
Message-ID: <20241009141240.1948482-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009141240.1948482-1-mcanal@igalia.com>
References: <20241009141240.1948482-1-mcanal@igalia.com>
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

VC4 has two relevant mailing list: kernel-list@raspberrypi.com and
dri-devel@lists.freedesktop.org. Therefore, list those two mailing
lists in the VC4 section.

Actually, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
was already listed in the VC4 section, but it was listed as a reviewer.
List it as a mailing list.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a740b73e4ecf..18084e91475c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7800,7 +7800,8 @@ DRM DRIVERS FOR VC4
 M:	Maxime Ripard <mripard@kernel.org>
 M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 R:	Maíra Canal <mcanal@igalia.com>
-R:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
-- 
2.46.2

