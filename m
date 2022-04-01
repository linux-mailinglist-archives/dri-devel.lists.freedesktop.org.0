Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6D74EF81A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 18:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814F010E1A4;
	Fri,  1 Apr 2022 16:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C571A10E152
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 16:38:19 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 28DC384042;
 Fri,  1 Apr 2022 18:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648831098;
 bh=681/ecAfuGyug/aKomT5gTVBLC3jqCPuH5Xv9vjRARY=;
 h=From:To:Cc:Subject:Date:From;
 b=ajUimAb5nrq0PXOK+abU7Q0HPvmGiJfxe5v5zjUTIKJnaW6daJq5zbDrBoPwEKAaR
 Eyt9H0Xm/9i3z/QDIIMDuqIH5L+gCCFoctXWJ4OdPgv+HKa/5Gc8F5rkG6vi9zVo8A
 +v46Cq+YE0fTT/SemFmnR2zOiYc4Xo66lmlrlrJCd0PgLb48TfdvdzFmBrfYHLpTZr
 pFLUikor/GouKzqdhS715+I+YemFAscsSn0k3f4lgzMd5kZX8us0DbV4cdBzNAKFPq
 TmCa0Eki2kcAaV+bGSJclTNFljNXdHngeeT3qiKzeg2nIIVnFoLv02oRVCr/7xt+/k
 hpbF9RtbrTqkw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 1/3] dt-bindings: display: panel: mipi-dbi-spi: Make
 width-mm/height-mm mandatory
Date: Fri,  1 Apr 2022 18:37:53 +0200
Message-Id: <20220401163755.302548-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the width-mm/height-mm panel properties mandatory
to correctly report the panel dimensions to the OS.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index f29789994b18..c2df8d28aaf5 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -83,6 +83,8 @@ properties:
 required:
   - compatible
   - reg
+  - width-mm
+  - height-mm
   - panel-timing
 
 unevaluatedProperties: false
-- 
2.35.1

