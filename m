Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF5E72C2C2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 13:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290FC10E211;
	Mon, 12 Jun 2023 11:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A622410E20D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:24:04 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FCDF66003AC;
 Mon, 12 Jun 2023 12:24:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686569040;
 bh=Ol6uZvQw1JtPKUiDddroDlDWVO7F3Bn/r89VTUIuM0Q=;
 h=From:To:Cc:Subject:Date:From;
 b=XzgDNAtcbxLhI11jPpvPnBrTg99f75HkMFWQ8SPyZWTBkwDbVuPokr/+VXMhTkAry
 J18td5atC5IxOAohP3l4p6aMuY0xRmsHN7Czc2U2KohtfP7tQLPfCBuN9kbUDysXA0
 C8ac5w2wx5oI4dZ/LNmfeAohEBAid2rP2L9DaD1xvKH3KBmNBoyNk+4tPo9ENHfOW7
 f9xTgkT+nR26TgetY8sTjz/29cFAz2UYs/Zub8KP8AxSifiQUWeOJZApaMsZSs700+
 ym0aMCxucCPH0cvQmjAjthitsbyFmI3KQII4Y69hkpucGVKhpFElyntezFfXyf+wli
 4afDnN19A84Rg==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Subject: [PATCH v2 0/3] Add additional YUV420 bus format check for dw-meson's
 bridge enable
Date: Mon, 12 Jun 2023 12:23:51 +0100
Message-Id: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: adrian.larumbe@collabora.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v2 of:
https://lore.kernel.org/dri-devel/20230528140001.1057084-1-adrian.larumbe@collabora.com/

The only difference is having added an actual commit message to patch
number 3 in the series.

Adrián Larumbe (3):
  drm/meson: dw-hdmi: change YUV420 selection logic at clock setup
  dw-hdmi: truly enforce 420-only formats when drm mode demands it
  dw-hdmi: remove dead code and fix indentation

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 35 +++++++++--------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c     |  4 +--
 include/drm/bridge/dw_hdmi.h              |  2 ++
 3 files changed, 18 insertions(+), 23 deletions(-)

-- 
2.40.0

