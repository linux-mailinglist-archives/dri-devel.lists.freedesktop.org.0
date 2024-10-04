Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82317990464
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 15:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0404110E9F5;
	Fri,  4 Oct 2024 13:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VjF69hR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7064010E9F5;
 Fri,  4 Oct 2024 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728048709;
 bh=kQpVjwQNxdw088eu2f4rB+DgTekYjxlYL+UHArKCPVQ=;
 h=From:To:Cc:Subject:Date:From;
 b=VjF69hR34M5MIQAvgx7C+WsI4sh3uor7V6jxkWhtx9FHz+HD75S0Dik/HLZ7+P1+w
 syWXmZoAwJaP/4XR/h5JVGgHF48R969K9urXYHsByIfLJa5bruPvxVhJYqBQu3o2QU
 ctAOKclso0h4hgAh2mQ+ZMwf+c1wll+6Hgp2pLZmDDoB/AFMFFs0KbAlqisWqrxei0
 pmFXck+n1WNKANexWCDJDw3qOWXvcMRfxPVoiUwv0kxqluvdG5yR9wKy5nqxJJii+u
 WUqjpotIBqYqutV8f+btIhdu54IMdwOdQU/HqkT8QnWBT5RuFmg0nyYnscOnLKOFXO
 4KmRcfVOoR5nA==
Received: from localhost.localdomain (unknown [171.76.80.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0889817E35E9;
 Fri,  4 Oct 2024 15:31:46 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] drm/ci: add new devices for testing
Date: Fri,  4 Oct 2024 19:01:17 +0530
Message-ID: <20241004133126.2436930-1-vignesh.raman@collabora.com>
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
Also refactor software-driver stage jobs.

Successful pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1283825

Once this patch series is reviewed, will send v2 with gitlab issues
link for flake tests.

Vignesh Raman (3):
  drm/ci: refactor software-driver stage jobs
  drm/ci: add dedede
  drm/ci: add sm8350-hdk

 drivers/gpu/drm/ci/arm64.config               |   7 +-
 drivers/gpu/drm/ci/build.sh                   |   1 +
 drivers/gpu/drm/ci/test.yml                   |  84 ++++---
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  51 +++++
 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt |  13 ++
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |  20 ++
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |  15 ++
 .../drm/ci/xfails/msm-sm8350-hdk-flakes.txt   |   6 +
 .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    | 211 ++++++++++++++++++
 9 files changed, 372 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt

-- 
2.43.0

