Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE4363A2AF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 09:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FF210E2A8;
	Mon, 28 Nov 2022 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB60910E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 08:19:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 21D5F5C00D0;
 Mon, 28 Nov 2022 03:19:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 28 Nov 2022 03:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1669623587; x=1669709987; bh=YC
 Qih31h4phJIOL40JWML9l9DvEpKwZX8JQjgXcSSq0=; b=ONvU4Gunjx5Q2tarsy
 3ZfhpyIY0hBBwoLbLPBnwZqCsdxlBd3dH1HSqybnUZNlZ4eruSW/6NGCL8uN5dPl
 GszYlOKlNXVFUuTmR/34H8rjM9jVbzRMH7OSG8szt8d9RgFND+xNNAfwsWPB712u
 JVYl9+mveQcD3FuW4yNEXsabE7WTnaGTuu1fRHN4XuibfzGhtDYV8yHW+1UkZSbZ
 MGz1MRUVFzT3M4DMzCxb66dHFQBQpKrzvaPdKkbK68Ta0GXS7H+2/gmKXFtpbLPD
 zxI56i2pCoBaEunk+j553ShsWOI4cNvcnb0/mR+sIoTsewGHOMLmW1rw5Wc5JdcY
 tMLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669623587; x=1669709987; bh=YCQih31h4phJI
 OL40JWML9l9DvEpKwZX8JQjgXcSSq0=; b=m/5vNSJZJMO6huHfXhuq6SC1fXOLx
 IC8jDX9ET9dz4VeiIgyunQr1VgMfnELGbEj78YJBoF3CZ1xNb2U7USG+qsUkHD75
 HedtJ8v1cuEqUEfHbwuiY6IO7cpazNbmq1KYW4TLxNi1BZ4u4ZjKWDPi8e+dKL+p
 OHkezFcqISqrgdqXpAz5cq+R+otm3FPmORH6UOnp1Qo/tDWP9aqmuIqsEpROGjPR
 tWXA+erJNScHe5bIX03jy8hIm1e7bjwoQXkNajA9qkQRLuAKazO3gD14wgug9ccL
 79iiLdgbnFKhyUDbgpAEc9WoIucXmLesBI2C29FnzNYgB7nsMM8TkOqpg==
X-ME-Sender: <xms:Im-EY3kcqbCc4ogi7pXz1cX9IkirnDHejVjosgIAWnDbG5SF6mzQpA>
 <xme:Im-EY63xF50quV3wgmIwnjPGP3IbVjDdH514vWFVTx6KEf--FSDPEVu7hXXfe6X2u
 22nZGndZbtGJT5J92w>
X-ME-Received: <xmr:Im-EY9qsLy-zRfb73rrKiAfAqx7qEPDgm9FBwiOT5rj_mShgwHXGuTPGosCIgJrA8NFagMhtQHkTRqzcx4jlAmjcrLUZcU8OZfwtS4I6xMq7Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedugdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Im-EY_ngc5bJjVy5mSAopHLfaMZ0zeaP0EzYPjE1in6ZJ8EmTEouEw>
 <xmx:Im-EY11ERrsZFQz_TxD7son_aK4RgGsHUQcexlpPLR08QL2a5sWhGg>
 <xmx:Im-EY-tF-QpSdRiI8PTBcYK6FuQ6EBoOHinIbyXs6wjUdh2wqtaaXw>
 <xmx:I2-EYzPItHQJjdlVqMbjRLO0FuRWoT_eNcVt99Kaoe-gM_82LRhNxw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 03:19:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/3] drm/tests: helpers: Add missing export
Date: Mon, 28 Nov 2022 09:19:38 +0100
Message-Id: <20221128081938.742410-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128081938.742410-1-maxime@cerno.tech>
References: <20221128081938.742410-1-maxime@cerno.tech>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_kunit_device_init() is a public function meant to be used by other
tests, but isn't exported. This leads to modpost errors when the other
tests are compiled as module.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index f1662091f250..8c738384a992 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -66,6 +66,7 @@ struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char
 
 	return drm;
 }
+EXPORT_SYMBOL(drm_kunit_device_init);
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");
-- 
2.38.1

