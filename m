Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766E1A0146B
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 13:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A66C10E159;
	Sat,  4 Jan 2025 12:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S9vOzstx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB82F10E159
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 12:55:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 630F25C1070;
 Sat,  4 Jan 2025 12:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB745C4CED1;
 Sat,  4 Jan 2025 12:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735995342;
 bh=Tu3NYANR6Oo7OR/1mO5e3lqnkaZz9yyNdWjaERTRz3o=;
 h=From:To:Subject:Date:From;
 b=S9vOzstx01Y11Vf85It2BXKVSsLawr3v3FXT1AS6g+EBKdf39CxF4spU1WjNr1BvX
 61avFaZK1wyrp0nQtKad8NzxmGXrC8pwEmUTWEtcGFWykaAAmZmUDl/+55Lesu9jpi
 +NTRJQqrgSxZk7LwcDxqjFrgK48G+iqX+jCmIMTbausqVQtPyhdM+k6OTyonb4vYtQ
 dmcdTylDW19LzyRq3NLNuk79tE8LsxBueFrzewNtdOkpnGdaAFNATur16p8HrepEQo
 rOpblB5kvtQX3N/ucvSduNwHw8z/AWa6FRIUkK6uYNckk6cLorm35J5DXNMNY7UJZ1
 9pxooJn8PpOYQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Liankun Yang <liankun.yang@mediatek.com>, Fei Shao <fshao@chromium.org>
Subject: [GIT PULL] mediatek drm next for 6.14
Date: Sat,  4 Jan 2025 12:55:38 +0000
Message-Id: <20250104125538.111118-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
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

Hi, Dave & Daniel:

This includes:

1. dp: Add sdp path reset
2. dp: Support flexible length of DP calibration data

Regards,
Chun-Kuang.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.14

for you to fetch changes up to ba5811562988652d88de7503b3bd12da063ae729:

  drm/mediatek: dp: Support flexible length of DP calibration data (2025-01-02 13:40:27 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.14

1. dp: Add sdp path reset
2. dp: Support flexible length of DP calibration data

----------------------------------------------------------------
Fei Shao (1):
      drm/mediatek: dp: Support flexible length of DP calibration data

Liankun Yang (1):
      drm/mediatek: dp: Add sdp path reset

 drivers/gpu/drm/mediatek/mtk_dp.c     | 33 ++++++++++++++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  1 +
 2 files changed, 29 insertions(+), 5 deletions(-)
