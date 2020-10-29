Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D029FFAB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46466E98D;
	Fri, 30 Oct 2020 08:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9956E8B3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 13:40:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 13AC5580772;
 Thu, 29 Oct 2020 09:40:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 09:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=ZeDUvu21mMYclA/i2bPU8P34/7
 Q4E9HnZacDqNRNt/A=; b=NMYo1qcthaXkC6Wj2i2aNfDV9G8l82+XaojIp/23w/
 6vMRNIk4aV3DzE8aadi50rHkalL1AIl4p+TtAXWreLg7qQMPwu0m/xxXv3U0Nrly
 140jOyfZCqisToMMB/o69LAWIpdEA/i05/ty1FiNCD9B3a4ZuGs99YTujo2dxY6X
 yU0CAiLt8taMhLeG0BV2dy8WiNoyCdOIjePzg//dSte1q/gbPbaunTxKgfDSyhLN
 EFeBCtBhPz/NfBaHYXeeLyV2PbBA39q1DpEjCn/t6moLz1h/6WlpQEYgLZzK5kuD
 NzNhkZo9qivDWU7bJlbdpUDfLYUM6M+np3Pc+iXNQQBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZeDUvu21mMYclA/i2
 bPU8P34/7Q4E9HnZacDqNRNt/A=; b=brWiO1RoVI3pye6pcb8nuLW+HhQ87uZgK
 oyFSz2t06XrgEotJyWawoyVONdQmCAUEe81v17HOjudbk2Dh5RyFMMJHLW56IYx4
 H6Y8uFPvKCXLNWpgNa0DECDOOooF6N/Lb0SmwkH/E/XLweFMmtx6KXYqivHxse+W
 4Nx5IBNys7Bl5y118JNcbZ8Sf0XSaLgN+X8/h1C5W0TaWIe77i85BYocStX8X0lh
 1S0BvA+zKDPZVtyuwM7pawkJ71FONCoQIM3t2F6DBf/nNJj+xY0WFBlmoOQYHA7Y
 KRZAFw6AcI1q2I9rGuSpL4lmKuwY1T5thzqpXyZhDgI+UJrfsKi/Q==
X-ME-Sender: <xms:RcaaX7VATBHS-auJdihMh2f31H5ZRIjLpR_OKfdzBkknJQC9Srhj_Q>
 <xme:RcaaXzlHbMTyRThezSs0DyHJS8CKU7CrMCygwSdvxcrFsbG6q7uMboM9YjGowoTjP
 wqGQf1-k1DcyTlib1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RcaaX3bhA_i4VmnfAQgO8fKDOkwFzkGbPsazAaGYLBL2XyINPeA-Pw>
 <xmx:RcaaX2Vv4odWwvtF3A54R2WAvS63ITrh3E7AivxTZhG72oxxEkYyPA>
 <xmx:RcaaX1nw3c5E88-mJ_vYEZmxvycJ27isNpnLS00MekwKkl5zzWxACw>
 <xmx:R8aaX1m_klyX83qHWJsOVR2RChFfxDaY9pyG09u_nOuGcBi9Rogpsg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16F013280059;
 Thu, 29 Oct 2020 09:40:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 1/3] dt-bindings: display: Add a property to deal with WiFi
 coexistence
Date: Thu, 29 Oct 2020 14:40:16 +0100
Message-Id: <20201029134018.1948636-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RaspberryPi4 has both a WiFi chip and HDMI outputs capable of doing
4k. Unfortunately, the 1440p resolution at 60Hz has a TMDS rate on the
HDMI cable right in the middle of the first Wifi channel.

Add a property to our HDMI controller, that could be reused by other
similar HDMI controllers, to allow the OS to take whatever measure is
necessary to avoid that crosstalk.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Renamed the property
  - Split it into a separate patch
---
 .../devicetree/bindings/display/brcm,bcm2711-hdmi.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 03a76729d26c..7ce06f9f9f8e 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -76,6 +76,12 @@ properties:
   resets:
     maxItems: 1
 
+  wifi-2.4ghz-coexistence:
+    type: boolean
+    description: >
+      Should the pixel frequencies in the WiFi frequencies range be
+      avoided?
+
 required:
   - compatible
   - reg
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
