Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8FAD14D0
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D1B10ED85;
	Sun,  8 Jun 2025 21:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="T+mDi41e";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="j0TunHry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC6F10E069
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 14:38:16 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bFcrd3xwfz9sl9;
 Sun,  8 Jun 2025 16:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749392977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9J8blQsWo7BOLQ4jNbFGgSSU1FckxjNy8U5kLWiewAo=;
 b=T+mDi41e+paGnN3TxMn2Spf2OUqJcDbztsbhmaUHmR0XjWR9U1HutkbwSuUfy/z59xVDk3
 PAUWt9SoZjlrzzghg6StYx0pQdY4nWZHOqilsxO3QmRUifPHL1Be+I2u6DE/+3A80D4KIq
 1FMo7ZRcKXRrBFtZWnrxnnW+rW3glK+udGnc/KDsMNps5Bm0oNTt1oLGsSvUQ448QN7M1Q
 rJVyv1UDJAYC2+VatXgHtAWpQQmmyOBt4ULHuhFHSPjDaFOAOUYXuq2AnDls9YfK0yDW5Z
 GEeWZFQ5/kGIVWe0ZDJmKtOfVPODTF/9FWZMgLBr8jMS9hj5jV4Itp9IrRJ9Rg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1749392975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9J8blQsWo7BOLQ4jNbFGgSSU1FckxjNy8U5kLWiewAo=;
 b=j0TunHrySTzOQuO+GBGwUPDcR7sxg3055wGE6hb0ZG+b6RzjNuE4kruDQTelraOeeb4kCZ
 y09i1aS3tDmzOQcRUs5JA7LqAx7CZzZf+ceGSqBtMrfEzUrJeLadGvH2DU11vwudo4GEKa
 WlzCDX4naolakbXm/JhXAv6Q1cIpgFYwiJCXgeArWQ/iolLQy6zfJUdKFTT998E2gSFJKq
 fvYNlixB2NumizZBCvHfo2FS9qHg84avYcxmw8UB+ggIffmmqajmKQz2Sgw6mW5JvUP8qs
 5l+SsVGQYTXXQbTd1e6CRfROh2Qw6RLlV4Lj3vkPG0HAqKGbiI22jCQDfDq1wg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: ili9881c: Document 7" Raspberry Pi 720x1280
Date: Sun,  8 Jun 2025 16:28:16 +0200
Message-ID: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ows1prewrt6horcoxewo74xiu8j5fjmn
X-MBO-RS-ID: f2afb79cbd609a55522
X-Mailman-Approved-At: Sun, 08 Jun 2025 21:44:43 +0000
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

Document the 7" Raspberry Pi 720x1280 DSI panel based on ili9881.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index baf5dfe5f5eb..a51af61d4846 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -19,6 +19,7 @@ properties:
           - ampire,am8001280g
           - bananapi,lhr050h41
           - feixin,k101-im2byl02
+          - raspberrypi,dsi-7inch
           - startek,kd050hdfia020
           - tdo,tl050hdv35
           - wanchanglong,w552946aba
-- 
2.47.2

