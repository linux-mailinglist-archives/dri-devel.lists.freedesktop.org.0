Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEB98704CF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A0410E99C;
	Mon,  4 Mar 2024 15:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BB0cVTM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3424110E97B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:07:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 622ACCE138B;
 Mon,  4 Mar 2024 15:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5EAC433C7;
 Mon,  4 Mar 2024 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709564816;
 bh=4qegk8U9eGz3R6AfkeSDnX8iEb7TfqzWEA9PSfTRAV0=;
 h=From:To:Cc:Subject:Date:From;
 b=BB0cVTM1Srm6o42bI6rQr3yy69LrYWIImQSqw34F74FQZUNfrBZ2FA4Jff8FBFXYC
 IiE1blkQGEUYBZPTNC9Sl05x2ayzGAI1K4+Fn2LUHe4HU/sQoS27CCkP5jnytuR50d
 2m9RO7q0pRKgFza1Oh+3cvik+z4WOi8DTfRFmaG6Le6apzZr71DJtZGe5O6NjMNdnI
 eRgr3R3il79XD6v6jDaYD4vx4YLogTP5uRSxMGFpHB9waSvmp6fdPPm9OMq1/m/85I
 2lp804VSXagdrlyiRg/h8uxNseXHihMh6KjRZ8a+vKIe2qV8vrYSBMJC7RJgdYvsV+
 Y8belmI0Jd4Og==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
	David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [rerere PATCH] nightly.conf: Migrate drm-tip to gitlab
Date: Mon,  4 Mar 2024 16:06:51 +0100
Message-ID: <20240304150651.406815-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
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

Now that the migration to drm is over, start the migration of drm-tip to
gitlab in preparation for the drm-misc migration.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 nightly.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/nightly.conf b/nightly.conf
index e92444555649..b851af21929a 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -15,10 +15,15 @@ DIM_MIN_VERSION=1
 # preference
 #
 # dim users may freely choose the remote names and URLs from this list.
 #
 drm_tip_repos[drm-tip]="
+git@gitlab.freedesktop.org:drm/tip.git
+https://gitlab.freedesktop.org/drm/tip.git
+ssh://git@gitlab.freedesktop.org/drm/tip.git
+"
+drm_old_urls[drm-tip]="
 ssh://git.freedesktop.org/git/drm/drm-tip
 ssh://git.freedesktop.org/git/drm-tip
 git://anongit.freedesktop.org/drm/drm-tip
 git://anongit.freedesktop.org/drm-tip
 https://anongit.freedesktop.org/git/drm/drm-tip
-- 
2.43.2

