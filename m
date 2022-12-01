Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB0E63F36B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623BB10E5EC;
	Thu,  1 Dec 2022 15:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B9E10E14C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:14:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 474735803A1;
 Thu,  1 Dec 2022 10:14:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 01 Dec 2022 10:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907690; x=
 1669914890; bh=bJIvvHiLeABH8d8wIBGmnmY9ZtpGn7hdSaZpEfkpmRU=; b=J
 Ehex2J9NCT+Hh8Z7M5O13TcFk9ckx3mKhIPdPb7FgrXwoydogfws3pL0UMZg2GnQ
 TsfCp8i5PU1dXAXSWtjdes/Lwlt3p+pkURgnYs0IeAYdrIg3ANwnVfGqehxIghrm
 oDrFCkL+J108nd52yQkC2wzLxoXE8ST6SIzXbO9eICeHlZM/Ad6rkcp5KE+wEZll
 1NECwHqpeDFb004UskNpfEho/lJ7gHxhdD5fcDpJI6dkmxj77QZAstcqhC3L3jgZ
 ZJ3mspKHblZPw4JI+WFMF2MiSud8KaHwFx33RA0sd0Lvmp4+WjyYBvsy0Vjnx7QM
 fE6M6W0KpAzAISY+G8Myg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907690; x=
 1669914890; bh=bJIvvHiLeABH8d8wIBGmnmY9ZtpGn7hdSaZpEfkpmRU=; b=H
 d8uMRx8DQ3JXMdF6mNq0o5g/ntNh326u++JgvWQN8OtELhVivPBA0VqJI3hJ/o4u
 B2BzytMd2FVm+58bTeFQSaxqH8R8sSGygxL6FZO9wzrOggcf5QJGhzD8CREiytbK
 QTEciytBYtg8Qy3qTPZLB0fa7mioBo6C6PWrgwGRRrfuheODw1BLSlmXY6NA3Kq0
 +EzzpzoyFiUErAj56WhkNEILREaMwbRzOzSnzNLekvWk7J0xquKOUYe1uccyDFsg
 HGG4nU9YpwAKKLjr/9dWhNsW7Foeu2YePC2Cdzyt+1igFTn5DVVC0pstjakqNthf
 iyqdRQUqxAENNTnoyYjHA==
X-ME-Sender: <xms:6sSIY7gD9LQz9OK27KNSQPQXoswyRHX3F6iUlA0ezIA_WiGYGmhoNQ>
 <xme:6sSIY4AB04xaZWmkgf4s7_8iAd18_sTZLXGjT2-yZPKFYM7uKUVgFFOQjTPto7qlj
 oG80oNA-qcOYodLMdk>
X-ME-Received: <xmr:6sSIY7H7kOJV5qq7We8GxlbQhKXLd_jND6yJRDUnWYETfbgac5zLV8Fxtqw0LGRPIVQuIcOFhpgETo0tiSsboYLZERmpXQtO7ALLq_KL78URsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6sSIY4Sc64PIl_c8yOCwGyUOzw_S9ku_wzYmWdqCESdvmsvoXdxV1A>
 <xmx:6sSIY4wA5Nd_og3r5OTm7IinMzHBQNOHvVIUwmQcmbJs6cAV0MF94w>
 <xmx:6sSIY-6fiC4j55qJCsnhXU5Qy747t8eYeDm64CdaWFNpSSMeweYp8w>
 <xmx:6sSIY1TZI_ZVsKKh9R055MPmzWjdUyqnzra-ILzTabdCtRUBJw15Kg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:14:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:35 +0100
Subject: [PATCH v3 04/20] drm/tests: helpers: Switch to EXPORT_SYMBOL_GPL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v3-4-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=eDJIRO+Lw8Q0MMEtybR0/9DGh9xo+z4qDJy/dJwWLNo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdRzROHvN0fmEZbve/XtBt1bXGxXI2Ss8NO77H7XoiZV44
 pcGmo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNpjGL4X/HTcJ54+TsLjdvJxtnr1p
 3/IDdBhq9R/qCY9m6zjKMv8xn+l2/7lqTksuTKhIh7GjoyL7RW5Qq+Olg8UV2dgeHx2bVXWQE=
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

drm_kunit_device_init() among other things will allocate a device and
wrap around root_device_register. This function is exported with
EXPORT_SYMBOL_GPL, so we can't really change the license.

Fixes: 199557fab925 ("drm/tests: helpers: Add missing export")
Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 9ed3cfc2ac03..4fe131141718 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -82,7 +82,7 @@ struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char
 
 	return drm;
 }
-EXPORT_SYMBOL(drm_kunit_device_init);
+EXPORT_SYMBOL_GPL(drm_kunit_device_init);
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");

-- 
b4 0.10.1
