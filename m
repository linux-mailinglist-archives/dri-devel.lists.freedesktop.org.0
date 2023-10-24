Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4BF7D443C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 02:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74AA10E2AB;
	Tue, 24 Oct 2023 00:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4F210E2AB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 00:47:11 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:1c98:7e30:3cb0:3153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 61ABB66072BB;
 Tue, 24 Oct 2023 01:47:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698108429;
 bh=JjLuFU0CcMqVyHW3R1fQYTrDGM4X8wmdNEPNtA5tOZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SL53v4wEoKckYVIB1UqZHez/sM/YjFCmTUT3PZL+sERP04+cRTWTqcupRkCnHP5u3
 9Goa+NPmiAHiEuz/hyTLXYaKt1gf9RKCT3LPjiHVkSF8NzcaWR3jclch3GXGKgfeT/
 mBXXxpNpfU599ttTxPntHu/cr52ArtSH8rlj4B16KZR7G65IPWGonf6gOMwSKLeMgY
 HgyKpdl2VmuMgiWRe7orXCzKd16Svp1a/Q7U1P5ARyymGlc8+wbxSt4GTKwBnGeqsv
 q+JRDuh4755NC7MnlkfDZIsdedJfjx97EFl29KHANEq03oCb76MHjZaMgz0Eo/O5xt
 Gyi/oiv1znZxA==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 10/10] drm/ci: docs: add step about how to request
 privileges
Date: Mon, 23 Oct 2023 21:45:25 -0300
Message-Id: <20231024004525.169002-11-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024004525.169002-1-helen.koike@collabora.com>
References: <20231024004525.169002-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, daniels@collabora.com, linux-doc@vger.kernel.org,
 vignesh.raman@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, david.heidelberg@collabora.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clarify the procedure developer must follow to request privileges to
run tests on Freedesktop gitlab CI.

This measure was added to avoid untrusted people to misuse the
infrastructure.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>
---

v2:
- fix typo in commit message
v3:
-no changes
---
 Documentation/gpu/automated_testing.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 469b6fb65c30..8ec1878b44ab 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -86,10 +86,13 @@ https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), change the
 CI/CD configuration file from .gitlab-ci.yml to
 drivers/gpu/drm/ci/gitlab-ci.yml.
 
-3. Next time you push to this repository, you will see a CI pipeline being
+3. Request to be added to the drm/ci-ok group so that your user has the
+necessary privileges to run the CI on https://gitlab.freedesktop.org/drm/ci-ok
+
+4. Next time you push to this repository, you will see a CI pipeline being
 created (eg. https://gitlab.freedesktop.org/janedoe/linux/-/pipelines)
 
-4. The various jobs will be run and when the pipeline is finished, all jobs
+5. The various jobs will be run and when the pipeline is finished, all jobs
 should be green unless a regression has been found.
 
 
-- 
2.39.2

