Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A868E867342
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E180310F0BD;
	Mon, 26 Feb 2024 11:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O4tFc9rK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6522A10F0BD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:36:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2B97ECE0A5F;
 Mon, 26 Feb 2024 11:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0593C433F1;
 Mon, 26 Feb 2024 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708947377;
 bh=orG/AJAluqn3UdKHweG/Hc/qNU6ti/Zuo8QMfFzwDjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O4tFc9rK1suaFsamPQHg06f0hEvxycXsIIy0gnWAhaEYSKs5Vxl6SHE9l1J8hBKfg
 3ByQKAW/9YKt/keNcN6Cw7TBxHUOxtLVoY5V3Oj6z+YVDk/jOQSKXjFhJ1VgomOrZ8
 29x9mCLNshttHckZ5Jx725RCI+ID+Yopu58JsTXQtLT2H394arH06mjdnDkeq3LwyR
 5OLXLuIVH9sJHCKO+ZOZgivvGxkGjV4s/7VLJqgiL8degYEONQ3IL0hwNATECZF00C
 SeqzgwY62OWKhIVkSdswzK+xvt1Roc7KrDhsTN61W8wvGtohSQ41m8HQ8ndA/np8xf
 ocd63RSWJCqNA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Daniel Stone <daniels@collabora.com>
Subject: [rerere PATCH] nightly.conf: Update the drm-misc repo
Date: Mon, 26 Feb 2024 12:36:10 +0100
Message-ID: <20240226113610.46343-2-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226113610.46343-1-mripard@kernel.org>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <20240226113610.46343-1-mripard@kernel.org>
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

drm-misc has moved to gitlab now, so let's update the repo location.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 nightly.conf | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/nightly.conf b/nightly.conf
index c189f2ccad17..0362efd65cf8 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -37,12 +37,8 @@ https://anongit.freedesktop.org/git/drm/drm-intel
 https://anongit.freedesktop.org/git/drm/drm-intel.git
 "
 drm_tip_repos[drm-misc]="
-ssh://git.freedesktop.org/git/drm/drm-misc
-ssh://git.freedesktop.org/git/drm-misc
-git://anongit.freedesktop.org/drm/drm-misc
-git://anongit.freedesktop.org/drm-misc
-https://anongit.freedesktop.org/git/drm/drm-misc
-https://anongit.freedesktop.org/git/drm/drm-misc.git
+https://gitlab.freedesktop.org/drm/misc/kernel.git
+ssh://git@gitlab.freedesktop.org/drm/misc/kernel.git
 "
 drm_tip_repos[drm]="
 ssh://git.freedesktop.org/git/drm/drm
-- 
2.43.2

