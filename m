Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A3D3DD130
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 09:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40D06E44A;
	Mon,  2 Aug 2021 07:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Mon, 02 Aug 2021 06:43:34 UTC
Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5457F6E03D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 06:43:34 +0000 (UTC)
X-QQ-mid: bizesmtp54t1627886151tn328rmd
Received: from localhost.localdomain (unknown [113.89.245.207])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 02 Aug 2021 14:35:50 +0800 (CST)
X-QQ-SSF: 01100000002000208000D00A0000000
X-QQ-FEAT: DoD8xN2rKozcOGDwtQmNGfBMZ4UEoqYYCItVoT8BP0ehgIcHrcwy8XO/zICNf
 hezuQEncJJkzXRt2FRLGqaRd0iyduY8fQM7gA8qOspLjf29L5ww2Y8t0/5CYFXDb9ng9bzJ
 Er1jDbcUUdDN6NJRFQg0ftZ72JOnZwzT1IZjZ4759YAg4VC/GKqaAL4KxMCsIx1gHij8gCs
 UMQMcL2pDeqo0H83vO1lDw1EzdD1SuVPKKT+zncroCdYeo4DpXEaUxWAXuUQtqirxaYLsoo
 B9J23bSdkIjdXRqHssRb0X+BFsk3o2Ko7jkQYQ9esTORcMtCLNR5gFrgfummGdgj1Zr5i8b
 cGa+qKLkpZSstC3fmk=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@sipeed.com>
Subject: [PATCH 0/4] Add simple-dbi tinydrm driver
Date: Mon,  2 Aug 2021 14:35:34 +0800
Message-Id: <20210802063538.75583-1-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam1
X-Mailman-Approved-At: Mon, 02 Aug 2021 07:32:22 +0000
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

This patchset adds a tinydrm driver called simple-dbi, which is a driver
that utilizes only standardized commands in MIPI DCS to activate a MIPI
DBI panel that requires no extra configuration, usually because the
configuration is pre-programmed into the OTP of the LCD controller.

Icenowy Zheng (4):
  dt-bindings: vendor-prefixes: add Zhishengxin
  dt-bindings: display: add binding for simple-dbi panels
  drm/tiny: add simple-dbi driver
  MAINTAINERS: add simple-dbi driver

 .../bindings/display/simple-dbi.yaml          |  72 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/tiny/Kconfig                  |  12 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/simple-dbi.c             | 244 ++++++++++++++++++
 6 files changed, 338 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/simple-dbi.yaml
 create mode 100644 drivers/gpu/drm/tiny/simple-dbi.c

-- 
2.30.2

