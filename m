Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7153A9D4D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 16:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A91C6E17B;
	Wed, 16 Jun 2021 14:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E70D6E17B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 14:15:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 700BE5C0121;
 Wed, 16 Jun 2021 10:15:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 16 Jun 2021 10:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=DOp1DcDZeZTGxiJ3sItDbnirwt
 cXsQylEaaPEHhOnB8=; b=IewM9WVG77Fyd3/ktmUU96OEnA+pTzAFI0aU5uf0Vx
 loMBbuO+/1l3KKMOwshCC02cI5gvzvNReNGxK+O6KMiHCyfOhH95Cftmy2jdjsuT
 B/70VQcm0IAF/c95Dlw5lB2RGFpN980UikfyQz9OZ032gm3jRRKrV9UZ0SY1i/WV
 j5K5UQa2/pIbchkDYPp4C2azSJlTBKzSVwbt6xYLGzTcDIHVI8LrcYsMx2rscQ70
 5DYOeww3pLF3/H5YwZyOoZFh7GxuD9Fg8AjeGHmp9j/vXsiACIHWLzYNzgQz0LZx
 VI09m8QTUxrKiAFLLvgfoSyMoct+9wuh8lPOu3KykEIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DOp1DcDZeZTGxiJ3s
 ItDbnirwtcXsQylEaaPEHhOnB8=; b=C/JMEBVI7CEeeq1TYw9yTsn2sfhe6eZz+
 N66DA3Ma2vqLWWZVrd0y3+Fi09Qbcl1hM/6qI7iE9O6TWtETdtOsXoFcBNOq5WGe
 IfmNyhWEFZzDwGnp1YiiB/p5dUNXd4d7Swgjb1/cfZA9sEPBk9tTjHzmISQJxmzM
 d3oYZi4yxjx2KjwickgMXaSxi/NVs8il5tifIUrryiiVHwLrcGH5XkZb8gtV43qN
 5j38fyPLpruw+E4NaUGz0VfUSIuZm9LtwGYpMAsCu4jOZqzzPfq9BXszfWkfG0NG
 V5Rlz0GVx7c9I59aGPH8bpa1JwOJ9mAofZjt6t3NKj3f6VqU2goow==
X-ME-Sender: <xms:hAfKYDGa5rty9TWSk2tLOtyS9MrR78eaLsMuBz6TIvcIm4Z79t58OQ>
 <xme:hAfKYAXJ2RoAFi-lhD9jFrqc1sCwkFNxNonxCyJfsM8a1tCDEbJ565hBdbAD3fLpZ
 LgAUEkF1D-RM2GuTFY>
X-ME-Received: <xmr:hAfKYFJtUbeI9da9Y5E58bpa_CieD_J8BhV4XU8x0krgTrkcjYz1Agz3YEPoRqsazPYGeEzOwdmgp977UVQuoDYavE5y1-F49a4l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hAfKYBGkXl6gjt0gSoehrRJgsgwmv9WHyBZr2XhG5vf__0zeDvGVAg>
 <xmx:hAfKYJXlom8cWPBmy3Hu3kX6NzrJCc_p7sHoQA59EOPuRek1Ujhp6Q>
 <xmx:hAfKYMM64j5o9l6RgFNjRKfmcrYPwLWq5G5fySsN22DvTsaiy2OdVQ>
 <xmx:hgfKYHeouoodDCl84Y1vMlhuFGYzsnbzDs8WCEG5C9VZwgzaIL6qaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 10:15:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 1/3] drm/dp_helper: Rework the drm_dp_aux documentation
Date: Wed, 16 Jun 2021 16:15:27 +0200
Message-Id: <20210616141529.630719-1-maxime@cerno.tech>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the existing documentation to move the comments on particular
fields next to them.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - New patch
---
 include/drm/drm_dp_helper.h | 84 +++++++++++++++++++++++++------------
 1 file changed, 57 insertions(+), 27 deletions(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 1e85c2021f2f..1c5ae07ff0c7 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1837,29 +1837,6 @@ struct drm_dp_aux_cec {
 
 /**
  * struct drm_dp_aux - DisplayPort AUX channel
- * @name: user-visible name of this AUX channel and the I2C-over-AUX adapter
- * @ddc: I2C adapter that can be used for I2C-over-AUX communication
- * @dev: pointer to struct device that is the parent for this AUX channel
- * @crtc: backpointer to the crtc that is currently using this AUX channel
- * @hw_mutex: internal mutex used for locking transfers
- * @crc_work: worker that captures CRCs for each frame
- * @crc_count: counter of captured frame CRCs
- * @transfer: transfers a message representing a single AUX transaction
- *
- * The @dev field should be set to a pointer to the device that implements the
- * AUX channel.
- *
- * The @name field may be used to specify the name of the I2C adapter. If set to
- * %NULL, dev_name() of @dev will be used.
- *
- * Drivers provide a hardware-specific implementation of how transactions are
- * executed via the @transfer() function. A pointer to a &drm_dp_aux_msg
- * structure describing the transaction is passed into this function. Upon
- * success, the implementation should return the number of payload bytes that
- * were transferred, or a negative error-code on failure. Helpers propagate
- * errors from the @transfer() function, with the exception of the %-EBUSY
- * error, which causes a transaction to be retried. On a short, helpers will
- * return %-EPROTO to make it simpler to check for failure.
  *
  * An AUX channel can also be used to transport I2C messages to a sink. A
  * typical application of that is to access an EDID that's present in the sink
@@ -1870,21 +1847,74 @@ struct drm_dp_aux_cec {
  * transfers by default; if a partial response is received, the adapter will
  * drop down to the size given by the partial response for this transaction
  * only.
- *
- * Note that the aux helper code assumes that the @transfer() function only
- * modifies the reply field of the &drm_dp_aux_msg structure. The retry logic
- * and i2c helpers assume this is the case.
  */
 struct drm_dp_aux {
+	/**
+	 * @name: user-visible name of this AUX channel and the
+	 * I2C-over-AUX adapter.
+	 *
+	 * It's also used to specify the name of the I2C adapter. If set
+	 * to %NULL, dev_name() of @dev will be used.
+	 */
 	const char *name;
+
+	/**
+	 * @ddc: I2C adapter that can be used for I2C-over-AUX
+	 * communication
+	 */
 	struct i2c_adapter ddc;
+
+	/**
+	 * @dev: pointer to struct device that is the parent for this
+	 * AUX channel.
+	 */
 	struct device *dev;
+
+	/**
+	 * @crtc: backpointer to the crtc that is currently using this
+	 * AUX channel
+	 */
 	struct drm_crtc *crtc;
+
+	/**
+	 * @hw_mutex: internal mutex used for locking transfers.
+	 */
 	struct mutex hw_mutex;
+
+	/**
+	 * @crc_work: worker that captures CRCs for each frame
+	 */
 	struct work_struct crc_work;
+
+	/**
+	 * @crc_count: counter of captured frame CRCs
+	 */
 	u8 crc_count;
+
+	/**
+	 * @transfer: transfers a message representing a single AUX
+	 * transaction.
+	 *
+	 * This is a hardware-specific implementation of how
+	 * transactions are executed that the drivers must provide.
+	 *
+	 * A pointer to a &drm_dp_aux_msg structure describing the
+	 * transaction is passed into this function. Upon success, the
+	 * implementation should return the number of payload bytes that
+	 * were transferred, or a negative error-code on failure.
+	 *
+	 * Helpers will propagate these errors, with the exception of
+	 * the %-EBUSY error, which causes a transaction to be retried.
+	 * On a short, helpers will return %-EPROTO to make it simpler
+	 * to check for failure.
+	 *
+	 * The @transfer() function must only modify the reply field of
+	 * the &drm_dp_aux_msg structure. The retry logic and i2c
+	 * helpers assume this is the case.
+	 */
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
 			    struct drm_dp_aux_msg *msg);
+
 	/**
 	 * @i2c_nack_count: Counts I2C NACKs, used for DP validation.
 	 */
-- 
2.31.1

