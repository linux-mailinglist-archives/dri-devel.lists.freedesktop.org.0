Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9014934529
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 01:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B05510E1E4;
	Wed, 17 Jul 2024 23:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UkQsLdKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DA510E1E4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 23:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721260357;
 bh=AtTZ/iLMRQkn7Tky/srYKLiBXDawU9zyPR3m0XbxvYM=;
 h=From:To:Cc:Subject:Date:From;
 b=UkQsLdKkcOkTBUAJmFnLYxGSVENzyzpYLeimD92pbjZ+sLM/EupB+sUcPC3id4ehc
 OFv3D/qReg+eeQtaDNTAOQdnuoeES+8dYjueqgw++YFpetApkY53U46wjbt00OngQa
 dtjEsbX7VV5oakcCf3fNirO5Zxv39+kkCZSlmUmcYdK0CZxzYTUXrvm9PrdNn1iwcv
 iMtg/6X2T+gBE4ULXu5xq4sC52Dr70o2669QN+wlgvhY+oeFA0s4IPztZA0qUoPCxf
 EdEFtB6TxG/nMaeR9cXbCzEdvcn4fLazlTNaJ6gAfYE7jxsxk0Q9PL1cxrPClS8icY
 f7yWSvcUosqbg==
Received: from mz550.lan (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dbrouwer)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89C893780BC2;
 Wed, 17 Jul 2024 23:52:35 +0000 (UTC)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com,
 vignesh.raman@collabora.com, sergi.blanch.torne@collabora.com,
 guilherme.gallo@collabora.com, robdclark@gmail.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] drm/ci: update link to Gitlab server
Date: Wed, 17 Jul 2024 16:52:21 -0700
Message-ID: <20240717235221.64629-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.45.2
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

Before building an image, the build script looks to see if there are fixes
to apply from an upstream repository. The link for the upstream repository
git://anongit.freedesktop.org/drm/drm became obsolete with the move to
Gitlab server in March 2024. Until recently, this obsolete link was
harmless because anongit would at least respond that there were no such
fixes available. In the last few days anongit has stopped responding to
requests causing the build script to hang indefinitely.

Update the link from anongit to the Gitlab server to prevent the build
script from hanging indefinitely.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Link to pipeline for this change:
https://gitlab.freedesktop.org/dbrouwer/kernel/-/pipelines/1226742

 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index b09976c3d2c2..259fb1c9a855 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -2,7 +2,7 @@ variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
   DRM_CI_COMMIT_SHA: &drm-ci-commit-sha e2b9c5a9e3e4f9b532067af8022eaef8d6fc6c00
 
-  UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
+  UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
 
   IGT_VERSION: f13702b8e4e847c56da3ef6f0969065d686049c5
-- 
2.45.2

