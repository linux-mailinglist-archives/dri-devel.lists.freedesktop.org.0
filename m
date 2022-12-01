Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F363F372
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C1F10E612;
	Thu,  1 Dec 2022 15:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41B310E5FF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:14:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 56433580393;
 Thu,  1 Dec 2022 10:14:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 10:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907699; x=
 1669914899; bh=1gEexNYiuyV4YjnbwZvlH/g9Uce0Jq9UIcsowosshF4=; b=f
 vPftML6TB57CKUZ4Y3+X+gPjyY9aPHYaOuqJnCQda0z9OsG02BFiJwUf8FFE0vv3
 Do8hAnL/VgQiQRDlUdRPQyOjXH1xriHKtu8TzEDsRbmSLvlLjoj8nMKorRQ7JMMU
 xE0Cv7uSb+Ck/8Xu71NNj9E1skqKQDqpWBnpR/z9LQIDwWljOAKXxefTks/VeiE2
 ijZT75oGfvPnVKVOrqlR6tsVMzvZvYNbQRNjrJayH8rqpbZSG+uSpAz+Wl0YoWlZ
 9cVFRl8hzvME1uV83i6HXmdn9lqZkgslslQ5ktMTjs7H0pLki77nPhWPz6eke9T6
 78c6y3efQq+dCCz1V39Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907699; x=
 1669914899; bh=1gEexNYiuyV4YjnbwZvlH/g9Uce0Jq9UIcsowosshF4=; b=l
 k+QMcRGPdHeYl1JdAed3WvT9aaC69LXGk5OXSjV0t9Q36bL/9+GtKNhVs9xdSK2L
 zaMKclZgJNumrJs7sDKMTQbQsBuaOR74pU31cYtG8F30WO6yGuEBKtsbg+9aU8L+
 JEN0dP4P/ZmIyMMhlfDzM/ntbWNo/zZNMtC5PqbJr9BaWeex+F3gsBr1tj+IQVlx
 rXz6BN7ql3EJ96/jIlTSglkeK/81jGIO1V6ZGLAzONPIuXlHFHwH6szNGTkgTPfl
 DCogqfcGIL++vkjc8EGQiQBO90ooUPsJYbFxui07YEvhVXmGkDZhet+UnFsOhrL9
 SRw6+FuB2fc2FuNC2CCmQ==
X-ME-Sender: <xms:88SIY2esE1AbKvKidbgqnklM-9uZErofwU1AXBYsVSKlayYv__aqlw>
 <xme:88SIYwMOL06LfcY2E2N7YKukyl1_6djbEJ584t4oSBs_NDIHtkrrHGUBB4YU8Cptx
 weVNjSNGGqaVpBsvps>
X-ME-Received: <xmr:88SIY3gBxAxnb6iADfWmHaRC_shVRSe5DxMBylSLEyjwgudiuU6gM_EY83skWyhNDPbcl_zqkvTo40kISjWvUPjU-OEKpQ5MTPZaZZmfqbqDXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:88SIYz_cSTjghNF7tTVHqerUwQE0_hwhK48d9HLZzWnBI1jJKSwr8Q>
 <xmx:88SIYyslqztxwxAySCVKDqy88atSG4m88pnn50lXXlpbomFeTVQ2HA>
 <xmx:88SIY6ERzjlMX81LnuMmbct9VPZGoMOWryXTCD2_9OEDi8xpgoJ9Bw>
 <xmx:88SIY-v7L0e6fH_qPIlh5MUoqfrXRj4QYWSgSJYrDq6qMQ0vcMda5g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:14:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:39 +0100
Subject: [PATCH v3 08/20] drm/tests: helpers: Switch to a platform_device
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-8-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=dVRZxagdLaYZPJKU0AZPqLREkHLuV+SpdsWWGxEoUWA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzQkqm9uufVD+/+0yIUPLzvf3sH+9mH76WtLvAMapIX+
 1nu97ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEmnkYGVZ+EtlX0NF3N+7YjuoVuk
 69i4NmamhNmZ/brb/a/f45luUMv1lPXQ81zuIznvP0+MeqXx/zD6tXReRrX+IJu9U9z1roHBcA
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

The device managed resources are ran if the device has bus, which is not
the case of a root_device.

Let's use a platform_device instead.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 4bf98bd0a8c6..b66ce779511b 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -7,6 +7,7 @@
 #include <kunit/resource.h>
 
 #include <linux/device.h>
+#include <linux/platform_device.h>
 
 #define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
 
@@ -32,7 +33,16 @@ static const struct drm_mode_config_funcs drm_mode_config_funcs = {
  */
 struct device *drm_kunit_helper_alloc_device(struct kunit *test)
 {
-	return root_device_register(KUNIT_DEVICE_NAME);
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(KUNIT_DEVICE_NAME, PLATFORM_DEVID_NONE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	ret = platform_device_add(pdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	return &pdev->dev;
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
 
@@ -45,7 +55,9 @@ EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
  */
 void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 {
-	root_device_unregister(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+
+	platform_device_unregister(pdev);
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
 

-- 
b4 0.10.1
