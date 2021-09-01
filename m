Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC33FDF50
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 18:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58C16E20B;
	Wed,  1 Sep 2021 16:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A42E6E20B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 16:05:41 +0000 (UTC)
Received: from hq-00021.. (unknown [46.183.103.17])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 5D00532D3FA;
 Wed,  1 Sep 2021 16:03:58 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Mack <daniel@zonque.org>
Subject: [PATCH v10 0/2] gpu: drm: add driver for ili9361 panel
Date: Wed,  1 Sep 2021 18:03:27 +0200
Message-Id: <20210901160329.1519656-1-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
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

This is v10 of the series.

Changelog:

v2 -> v3:
	* Turn Documentation into yaml format

v3 -> v4:
	* Fix reference error in yaml file

v4 -> v5:
	* More yaml file documentation fixes

v5 -> v6:
	* More yaml file documentation fixes

v6 -> v7:
	* Fix ordering of patches

v7 -> v8:
	* More yaml file documentation fixes

v8 -> v9:
	* Addressed some minor issues pointed out by Thomas Zimmermann
	* Rebased

v9 -> v10:
	* Re-apply the yaml file in favour of the txt file

Daniel Mack (2):
  dt-bindings: display: add bindings for newhaven,1.8-128160EF
  drm/tiny: add driver for newhaven,1.8-128160EF

 .../display/panel/ilitek,ili9163.yaml         |  69 ++++++
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ili9163.c                | 224 ++++++++++++++++++
 4 files changed, 307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9163.c

-- 
2.31.1

