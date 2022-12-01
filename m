Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C242E63F37E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B70A10E633;
	Thu,  1 Dec 2022 15:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4642310E60B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:15:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F1D158026A;
 Thu,  1 Dec 2022 10:15:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 10:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907728; x=
 1669914928; bh=NaCw9Fr6pSpkzjRoXsdCfXuua8dhqN7Ciz6QGBhxAzM=; b=K
 C7BM25kRsiydqse/CE3BYvHlPRO8RaOTXOjDLZg5F6XtGWTfuZXgETTtsU6W2gws
 ZCmRvQIyUzbT30fn0KZPHzzP1L5QzMoeQyPn8YmnJEDccB8Dr9YjVKxYr9aFhzyY
 fC/ekarNJAc9Yrsd98lyLwmCYGQCfpn9kYRuuPCxzZzv42AaBFDUec0LoDs5gobs
 CdsPHa0pmfXHc0yLOpIOJy6PfUImqb7kuaQfugVn5SmRqa77vZCP4HsA3IuiWQMZ
 ULQZicTigK4B3lW75H0LMC0U2hXKjYkwhnmEW+0RUFGE92Ib7c3zt06HlNBxNSv6
 AR3dsvTSfQe6+9KeG3Aew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907728; x=
 1669914928; bh=NaCw9Fr6pSpkzjRoXsdCfXuua8dhqN7Ciz6QGBhxAzM=; b=l
 DisUi/Q0FoYcpz9VbhxuEPW5FPbMeqt5Bb+y1N0ysKwkWj7i82GAHQrHqJt5HYcR
 xPa5NOqJxRNe+8prB26u7ZSYEuAcN+tFEOwdYGTgec1tUSKE7V8Q2Cgwr7y4tJMY
 MwUQZ8zxzDkqoI3tLWdpIIw+TP+iZFwoCaqhCbziILc3HcTf+9WoEEE3mA4D8boS
 NVQx947qMvFoW8z2LoQTGDpYuOyEdM6sNmkbv8STAOP2q01t02ZxyKDe3eaQmudu
 iafwsx157HkvfHrL9bz3vBQme02DEGeSzhZ1NnXbbd0U98JeaHrrjinjCrFJaTbe
 HrgK1AR8dhcdvi0fsnWiQ==
X-ME-Sender: <xms:EMWIY3AtGE-CECK0-0WZtPV-bKHMaoV468yTLHrzTBPSlHy4EZb98g>
 <xme:EMWIY9gUVLGiBVPCFO_NZzc3F9NvXcOlPzk7dAH-SOPG2UVCN8NE0u9U5xQOYef7f
 QYXWOVb_0fJpClRoHA>
X-ME-Received: <xmr:EMWIYylIB4pa8tQVaWPYJtiNrwUvJk3829rzuRCSfkxzOjyPnbG4DLzfHSEfMR7a16AAH9Ru9qCfN_YmFYIV9bZbUYMkoWGods-iZ8GKivD-rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EMWIY5z7najSmLDw6hAq6u28AZ2YVURNXWB0Namiacs9EkYJ1sHdVw>
 <xmx:EMWIY8QNZjOxq1Yj6uWj2ICDLPHqbAKV2D50KDpJhcp6pynciCui2A>
 <xmx:EMWIY8aQaLyqqvaM0_PDBUzNxG5XYA66HJh20XBhZ5exfJ_OgQ5e9Q>
 <xmx:EMWIY0zYjqn9jdZwNKEScpBVCnmkYhEecAnoSIw3wxuuvBBD2exjMA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:15:27 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:51 +0100
Subject: [PATCH v3 20/20] Documentation: gpu: vc4: Add KUnit Tests Section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v3-20-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=bocV9VlxTxUPDdVQN4VBYfcx8Ovy2f31hGxs9yT/h2s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzRuhj5J6g1Ybdd24ljFtOZU/pUnpOOMyntOSb+1NT4x
 4RJTRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZiM53hf6SAdEjDnxO2HEH+d3K+XW
 4PuqPs9Mo3VCBZkzvin8zjOIb/Nb7Tn5i/4F3q923OPTXB6z3rZ5txvZupv7HE7f1Cxr1hPAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maíra Canal <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, Maíra Canal <mairacanal@riseup.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have VC4-specific tests in place, let's document them
properly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/gpu/vc4.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/gpu/vc4.rst b/Documentation/gpu/vc4.rst
index 5df1d98b9544..a2375f1584e6 100644
--- a/Documentation/gpu/vc4.rst
+++ b/Documentation/gpu/vc4.rst
@@ -54,6 +54,22 @@ VEC (Composite TV out) encoder
 .. kernel-doc:: drivers/gpu/drm/vc4/vc4_vec.c
    :doc: VC4 SDTV module
 
+KUnit Tests
+===========
+
+The VC4 Driver uses KUnit to perform driver-specific unit and
+integration tests.
+
+These tests are using a mock driver and can be ran using the
+command::
+	./tools/testing/kunit/kunit.py run \
+		--kunitconfig=drivers/gpu/drm/vc4/tests/.kunitconfig \
+		--cross_compile aarch64-linux-gnu- --arch arm64
+
+Parts of the driver that are currently covered by tests are:
+ * The HVS to PixelValve dynamic FIFO assignment, for the BCM2835-7
+   and BCM2711.
+
 Memory Management and 3D Command Submission
 ===========================================
 

-- 
b4 0.10.1
