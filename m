Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C234873AAC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210BB11329F;
	Wed,  6 Mar 2024 15:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t3d/+E9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302311329F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:29:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D0AF8CE224B;
 Wed,  6 Mar 2024 15:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC58CC43390;
 Wed,  6 Mar 2024 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709738991;
 bh=pKyJpDOwnigPWd6s6LfV3kXFkhFOSlvodwv/Y4rYmmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t3d/+E9Mn5Ju+84xRmpZPo66EJIfMn6nfNtSSQuE97CmKYR+1AuZeyzKQmea8cMpJ
 gfmrQiJhB9HL2xcqmbMic1/tyu5itDSrefQoPSc+Oos+3av5IGhYse6HwOJHJu/IQ5
 DDVO4Af/x1fHr2TamDRX+LVFYfzsNNorUhpgAWmCWiFbilNtKhbCGN52DQDwFdoPk+
 QbO5LpJANkrM3sGuVwssIHyq2kBtuy6s5quiBjWAeYNbSrq+NCsaaaz7Ao6SZ10YID
 Uf8OHj9Qqn2Ys0gVIbXOtMzohkvVyoVGCO+0tTxTwDXcm14sKAP6LgVW/Gl2ZO5M75
 ugbpBVo3BLThA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Daniel Stone <daniels@collabora.com>
Subject: [rerere PATCH v2] nightly.conf: Update the drm-misc repo
Date: Wed,  6 Mar 2024 16:29:47 +0100
Message-ID: <20240306152947.696586-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
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
 nightly.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/nightly.conf b/nightly.conf
index b851af21929a..ab58579c8006 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -40,10 +40,15 @@ git://anongit.freedesktop.org/drm/drm-intel
 git://anongit.freedesktop.org/drm-intel
 https://anongit.freedesktop.org/git/drm/drm-intel
 https://anongit.freedesktop.org/git/drm/drm-intel.git
 "
 drm_tip_repos[drm-misc]="
+git@gitlab.freedesktop.org:drm/misc/kernel.git
+https://gitlab.freedesktop.org/drm/misc/kernel.git
+ssh://git@gitlab.freedesktop.org/drm/misc/kernel.git
+"
+drm_old_urls[drm-misc]="
 ssh://git.freedesktop.org/git/drm/drm-misc
 ssh://git.freedesktop.org/git/drm-misc
 git://anongit.freedesktop.org/drm/drm-misc
 git://anongit.freedesktop.org/drm-misc
 https://anongit.freedesktop.org/git/drm/drm-misc
-- 
2.43.2

