Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197C3257640
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C484689D89;
	Mon, 31 Aug 2020 09:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92775899E8
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 21:18:06 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v12so4440870ljc.10
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 14:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jiTIAaOvTcC09Rh4hOm98fvpcoLfNJ6VwISeHIermxU=;
 b=dT+D8vnV5/QzPKHiw6JhuWu5OSBIX4DLxnaw/T5DX05HnmcrgLb+jX8oQubdeVvTEp
 tI0HmpYQwddTfQRC6Ah+ud63bjLYFhVxXDYcRmzXE2zkmSe6WHKj4Q5GiAFBcfwfpKBm
 DJCU1st5oF4zZK0eWFR+b3mTMCobdeawD6T9qHLhagCfpGzr7tPanxbXkR17Tb0K0fuB
 1nXjn3xsEM1X5zFsa6KSKBWOuQP2wUJpZiJnM0h9GWbDhp5Kip1BGcEipS510pb9J7eM
 8Fi2XJC+5l3HiEDwVwpXFKAcENcrOVw1cq4F1PFwPP2FbD7tUSpIyqXiSYMDGN9jrKHu
 21hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jiTIAaOvTcC09Rh4hOm98fvpcoLfNJ6VwISeHIermxU=;
 b=jhopRrbKVU0UqCzhGOmv3hmlAepToGN66e5PZ96m6xRkctuV5GWM/sKsghoxGnMaX8
 w/K6A1J5CeUpqOR7mI7S9ydSKvpjDCBSNflFR5qmzAuBDUdBOwaDc36ar//IHIFbStPY
 MYGUgxURA4k3i71eeRYMcFNUijlT6Smi/bhE/pJHvebS054/ESktLtkCJ860ZkycHhtF
 ArgthFLNlycuOe5yN7FIDnRVQOpitBjK5dyteuzQ5quUCVbA8H0gOCCHSKsgmwQUvab4
 qCS92s/9sqLR4uJqY5yoCsmqLkrLEpknLLYhuV0b863FiGJ/QYysM4ju8VqpLgVDh0MK
 rzjA==
X-Gm-Message-State: AOAM531rLyQws1rT1bnhU4FyqxFJEbaXMx7ofuEXYPv/NjYnWZh+UOxi
 /xLCAKrQX+nNn+aaA708GnQ6L+Mwwwp/Jw==
X-Google-Smtp-Source: ABdhPJw0+B2rnE9+5WaS9MRpDfvC8pRvDb6ixwRob4AV7JgunEpgK/MucpOqxcn96aSlnza5+VKABQ==
X-Received: by 2002:a2e:2f16:: with SMTP id v22mr3785894ljv.39.1598822284777; 
 Sun, 30 Aug 2020 14:18:04 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se.
 [82.196.111.59])
 by smtp.gmail.com with ESMTPSA id r11sm1153464lji.104.2020.08.30.14.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 14:18:04 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gma500: Constify static structs
Date: Sun, 30 Aug 2020 23:17:41 +0200
Message-Id: <20200830211741.17326-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only usage of these is to assign their address to the fbops field in
the fb_info struct, which is a const pointer. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/gma500/framebuffer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index da02d7e8a8f5..54d9876b5305 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -164,7 +164,7 @@ static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return 0;
 }
 
-static struct fb_ops psbfb_ops = {
+static const struct fb_ops psbfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_setcolreg = psbfb_setcolreg,
@@ -175,7 +175,7 @@ static struct fb_ops psbfb_ops = {
 	.fb_sync = psbfb_sync,
 };
 
-static struct fb_ops psbfb_roll_ops = {
+static const struct fb_ops psbfb_roll_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_setcolreg = psbfb_setcolreg,
@@ -186,7 +186,7 @@ static struct fb_ops psbfb_roll_ops = {
 	.fb_mmap = psbfb_mmap,
 };
 
-static struct fb_ops psbfb_unaccel_ops = {
+static const struct fb_ops psbfb_unaccel_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_setcolreg = psbfb_setcolreg,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
