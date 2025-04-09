Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B8A81CD5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 08:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A4910E7E2;
	Wed,  9 Apr 2025 06:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WMnGRGkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FEF10E22B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 06:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744179375;
 bh=SLEwkDgEJaXPW5NwtSyzfWo09UnZPy7zaAWdY6GYGu4=;
 h=From:To:Cc:Subject:Date:From;
 b=WMnGRGkgSw5pGu6UYtQwxiap9xYtyWx1cRSwbTPRCGaV8eGvTlVdlWQY6sYh5bS1J
 +Q19vL1nhSiGxZxKbX368HAqLUHr4W+ueXXaGYDXjuiH4bvDotVdErght7852VvBs0
 /FcibVp7GNd9FUvmJ+4KxqUwbdYVELITSOJK41vAfv8QerjZG3KqCxe099tJFrYCsX
 b9A84myF1aqDQ56oN/gIDydgih1UZz+bxdMccw0QPMUBQQ85wSWu8ijNcdXJt1TGDu
 RQkBoSQysv34O6rwLhxJOv/AOGrhS3Z7dyF9byR5Y64epGvviy2zjsKu0dFgxwHMPD
 P9XHMyVNM2b+Q==
Received: from debian.. (unknown [171.76.83.191])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A27017E0F85;
 Wed,  9 Apr 2025 08:16:12 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/ci: Add devicetree validation and KUnit tests
Date: Wed,  9 Apr 2025 11:45:37 +0530
Message-ID: <20250409061543.311184-1-vignesh.raman@collabora.com>
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
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1400550

Link to v1,
https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/

Vignesh Raman (2):
  drm/ci: Add jobs to validate devicetrees
  drm/ci: Add jobs to run KUnit tests

 drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
 drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
 drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
 drivers/gpu/drm/ci/kunit.yml             | 32 ++++++++++++++++++
 6 files changed, 123 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml

-- 
2.47.2

