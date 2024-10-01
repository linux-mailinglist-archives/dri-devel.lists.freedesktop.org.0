Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AE598C769
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 23:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E55A10E324;
	Tue,  1 Oct 2024 21:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Bz3cdzE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Tue, 01 Oct 2024 21:14:47 UTC
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1369410E11C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 21:14:47 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 6A56223D76;
 Tue,  1 Oct 2024 23:05:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P24qPAbfXRd7; Tue,  1 Oct 2024 23:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1727816701; bh=s1+/LBMYV7QYPCqFRgi/eI/p0qajjacXZ54eovBVtVM=;
 h=From:To:Cc:Subject:Date;
 b=Bz3cdzE8L4s2bPAL61a66NC+HsvVdXN0wUZHKIqryH8GL/ZkQV2YiWgtTALRNhuTq
 EgN4oY1bGCiTXo9j8sOdh/2SsAkEUF4wiLQhT52cuxJzP6/CdNsepj7rSBWib2aNm3
 4lJIAas4DQUeP8iXC8ktFbMwcub7/Ml1do0FmbvutAtL7IHBEmWzia0hNYWUwFLpU+
 y+YGeKNFSrP6J+Zj6A4Wb56UnNzlrpJBouMS1u2yTvloNMAhDrvfxpzN+xLXVEaFIt
 sAoHnLvRSAQ8odwc7AICTlnfcUhrXhwqpoabvl+EZecKvg+U/G28EOkZjADKqmLKuH
 p4PU7r2kWuyAw==
From: Yao Zi <ziyao@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yao Zi <ziyao@disroot.org>
Subject: [RFC PATCH 0/1] meson/drm: Support drm_panic
Date: Tue,  1 Oct 2024 21:04:03 +0000
Message-ID: <20241001210403.43535-2-ziyao@disroot.org>
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

This patch adds drm_panic support for meson-drm, has been tested on
A311D with both TTY and Wayland session.

It is an RFC since I am not sure whether AFBC enabled case is handled
properly and don't find a good test case. Thanks for your time and
advice.

Yao Zi (1):
  drm/meson: Support drm_panic

 drivers/gpu/drm/meson/meson_plane.c | 47 +++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

-- 
2.46.0

