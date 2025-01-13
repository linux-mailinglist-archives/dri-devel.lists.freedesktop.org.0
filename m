Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC84A0B2B4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA5D10E5DD;
	Mon, 13 Jan 2025 09:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WEWtRteg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2C410E5DE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:26:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C8845C53CE;
 Mon, 13 Jan 2025 09:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C966CC4CEE1;
 Mon, 13 Jan 2025 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736760381;
 bh=9JhhK71wwiHcLFBErXxQpCIOlUAopR3tZpNzTbm0CgI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WEWtRtegaUWM4Xp4VwBmtOAhOwqapTTSL8DrQFPJT5gF3PMVH7ff8IvlehsNVCIEi
 yquX+v6hHsHR66q73O89TkGVkTa0v201fle/NyWpgRi+csPsbGOzVqKU/MgbP4Kv0Y
 M5ixAwqjQlU4bgsxezOsiTfH7+ug0teLU7ZjgtQ9CrQg8Mf5ASaqESFsU48N5J1VYG
 3xoj/UcquPfV9L9OiaZu7vkJ6kAbc6YGFsfIezpvCVRjIakLyn0TUWNMpl89ZJVX4b
 ydfy9lgARJ+SpT0PDBXJJVvQH/oVa6deSJl199BnorJLlMXKQbE7frHp9HbrN7Uong
 YmNDQvtfmmTww==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, cgroups@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 3/4] drm/doc: Include new drm-compute documentation
Date: Mon, 13 Jan 2025 10:26:07 +0100
Message-ID: <20250113092608.1349287-3-mripard@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113092608.1349287-1-mripard@kernel.org>
References: <20250113092608.1349287-1-mripard@kernel.org>
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

Commit b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting
cgroup") introduced a new documentation file, but didn't link it
anywhere. It was thus triggering a documentation build warning. Make
sure it's included as part of the DRM documentation.

Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20250113155000.4a99e7b0@canb.auug.org.au/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index 37e383ccf73f..7dcb15850afd 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -11,10 +11,11 @@ GPU Driver Developer's Guide
    drm-kms-helpers
    drm-uapi
    drm-usage-stats
    driver-uapi
    drm-client
+   drm-compute
    drivers
    backlight
    vga-switcheroo
    vgaarbiter
    automated_testing
-- 
2.47.1

