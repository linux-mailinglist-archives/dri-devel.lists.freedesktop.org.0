Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052ADAE38F4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAEF10E1B3;
	Mon, 23 Jun 2025 08:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Nw4EAU7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B91710E1B3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750668667;
 bh=+dyykSKpkvAg1cHrSs79NNyyF4y8YNApu5EJxpATbO4=;
 h=From:To:Cc:Subject:Date:From;
 b=Nw4EAU7CFQonoVgTc0cjbGdIeOE5CEJA0kHu40whVXl4H9hnPxs9xjLT5GzltAZ8Z
 MwYLkul8+HL6oJkRlrcphhDVQyA0NIdl4kZi+9x0LNVdIHCTttG6MznvsC7kZHqNk2
 6809ieKwKVP03rPQcgog2ERXPyUzDTjY3429AgMW2e1+2IF+Lqo0x6Jr35R4E4LMst
 Ma6fagq1XfoG40RJDNh+ZbHmeTiNPcz3IHjst5zbnapg5jeGzH8zhV2N30lb3GpIKP
 6Saj8VMJEAATaQ07RgJa3MCNf7wFlw1HK1Iio8ylYesHaEAYQfm2bRtS4jV+uqOmNp
 cjkR4pBlHETJA==
Received: from debian.. (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 52F9D17E0CE6;
 Mon, 23 Jun 2025 10:51:04 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 robin.clark@oss.qualcomm.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] drm/ci: Add devicetree validation and KUnit tests
Date: Mon, 23 Jun 2025 14:20:26 +0530
Message-ID: <20250623085033.39680-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
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

Add jobs to validate devicetrees and run KUnit tests.

Pipeline link,
https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1455734

Link to v1,
https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/

Link to v2,
https://lore.kernel.org/all/20250409061543.311184-1-vignesh.raman@collabora.com/

Link to v3,
https://lore.kernel.org/r/20250417030439.737924-1-vignesh.raman@collabora.com

MR,
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/173

This series depends on,
https://lore.kernel.org/all/20250514050340.1418448-1-vignesh.raman@collabora.com/
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/169

Vignesh Raman (2):
  drm/ci: Add jobs to validate devicetrees
  drm/ci: Add jobs to run KUnit tests

 drivers/gpu/drm/ci/check-devicetrees.yml | 50 ++++++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh   | 19 +++++++++
 drivers/gpu/drm/ci/dtbs-check.sh         | 22 +++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml         |  4 ++
 drivers/gpu/drm/ci/kunit.sh              | 16 ++++++++
 drivers/gpu/drm/ci/kunit.yml             | 37 ++++++++++++++++++
 drivers/gpu/drm/ci/setup-llvm-links.sh   | 13 ++++++
 7 files changed, 161 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml
 create mode 100755 drivers/gpu/drm/ci/setup-llvm-links.sh

-- 
2.47.2

