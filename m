Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A554C9A9EF0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431F610E63F;
	Tue, 22 Oct 2024 09:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="N7E5vwgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748D610E63F;
 Tue, 22 Oct 2024 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729590354;
 bh=/iZA89Wj3z69KYM9gWhcPxr0XQZlh5V4IALN4CQoFEo=;
 h=From:To:Cc:Subject:Date:From;
 b=N7E5vwgkMdfMpFCcsAwUb5ARa1PUX7lJUBDMYqiLcMOBx094HGLURW25vWv2uwuSv
 fQ9v47gM07I+sk1C3C01O9e++0wE9kPSyI4O9YAEn8CL4mhxE1jRyM8ImRMIo3hv04
 qy5SrepGEaxf7KlKcHjrXUvjUT8AW82AlUoQM6tMFHaCEkV2eTnLPWA8tqlFfIKeq4
 3Zwj+me1ipxpdaqcCXx3T4rxU/A28jktNP76avAQLWeixyaGCDC0m5qNczCVvGnfj5
 3QET4OlFS6BM7x9DoQrplXge5V9ek607RzYf5/c41MBvD9h20ECDnwTTdffbbCupeg
 oudct/6L3j/PQ==
Received: from localhost.localdomain (unknown [171.76.81.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A77E17E1395;
 Tue, 22 Oct 2024 11:45:51 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/ci: add new devices for testing
Date: Tue, 22 Oct 2024 15:15:03 +0530
Message-ID: <20241022094509.85510-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
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

Add jobs that execute the IGT test suite for sm8350-hdk and dedede.

Dropped the refactor software-driver stage jobs patch from this series.
I will send it as a separate patch.

Successful pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1294877

Vignesh Raman (2):
  drm/ci: add dedede
  drm/ci: add sm8350-hdk

 drivers/gpu/drm/ci/arm64.config               |   7 +-
 drivers/gpu/drm/ci/build.sh                   |   1 +
 drivers/gpu/drm/ci/test.yml                   |  25 +++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  51 +++++
 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt |  13 ++
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |  20 ++
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |  15 ++
 .../drm/ci/xfails/msm-sm8350-hdk-flakes.txt   |   6 +
 .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    | 211 ++++++++++++++++++
 9 files changed, 348 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt

-- 
2.43.0

