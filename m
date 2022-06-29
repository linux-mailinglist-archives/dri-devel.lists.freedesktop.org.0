Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5D560033
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCE714A672;
	Wed, 29 Jun 2022 12:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1050C14A657
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:11 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DAEBE3200956;
 Wed, 29 Jun 2022 08:38:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506289; x=1656592689; bh=yp
 bQn/2c++MmKvQEg2ijRQCaBqMa34WUGD5zewh0ICw=; b=omWtj08c2Onu2DKkLz
 ZBdhmRu6+LSLR+fhxQcgbFFPH8pHEM3XoRpA/H2iCD0JisRLub5B1s8eICW5drdo
 jvTW+5sJWnJdxGmxGeQ5GAiRnHmqbXTiJXt1Cqvd54KPl4EguCmH9C+v5pTtr60k
 8c4z1D8CqVrfJYGws+gh5PsF6x0AaIeJvXqqwt55rAifr6tp9pH/mgB1ybAS7OIU
 IfLxwLIQIIfm2Y1Tbp6XJuuZD5Iz5oGhSTiiJcrjrF9dq8ksW4EiukQIGnxzyh/P
 pubVC//4UtFyNeclU53P8tdOZVovIr0vNSYSI09+dMhPr0fEQbr9f7TQ/5TmpNa0
 tisg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506289; x=1656592689; bh=ypbQn/2c++MmK
 vQEg2ijRQCaBqMa34WUGD5zewh0ICw=; b=GgEqKVJDMvEm+yfLuFHVM/KUrV+vF
 6GqSOwBDq/UumN1sndBr4zZIuI9PeVTna1K+/DmBRM4SKVcU9pEqU0YRwsyjvfCv
 JMtp/JxcBsIblKAPxVpu8Wqykf/xm6uVhxPpeElNqxAZ6+PEtQqVLwKfa9LnseY4
 Wh0VDiNC75p3JhQqRBPZqdJ4WRkoEIwlpArFC6Byo7FSZBKO4jiPgpE6nubQiU76
 6/YV3Nhyl5iyiU6ky2GkkoNmp4Y5z1rfJ8MnRJ3kHlOeyK5CTQpznvEMplGoTOJA
 fdJxGs0+hRx6a4IIpaN9QxrAkyWOUHMPPDmqm3m3YPcgvXVA9nO9dsEsA==
X-ME-Sender: <xms:sUe8YvNm-QhGIo5TEE_HdNIGk0o4VM2yPu3tNV2mqmtJ9zitohgjZA>
 <xme:sUe8Yp9Dqc4UdnJDuCy-a7EwSIUyYVLpbVn2rQG8ybj1tuziRymClnTZHKYoee--X
 RlD_TpvdKWVFMLTmr0>
X-ME-Received: <xmr:sUe8YuT8xkCtgXH0flc9tKSbLo3r7tzDDZEeqM8EjpbhBXuvHjyATzfCJCz3ojpB2FR6e5opsAQK6gXIl5Br_6s9yDiMYnD6TeeX-s8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedujeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sUe8YjvxAXuAhvY6MRYeZlTQACj-y0HAJzq3ZUSUc3qzMe3cJqsPRg>
 <xmx:sUe8Ynd8NueYTGPh3Dod2irjN9ypwMf0o-YudN3rUVLSvNTsRzKJIQ>
 <xmx:sUe8Yv2EoNbQySEOnIVP43zi3qd8_WBh8q1CMoeKg1WAYIexWRHCXw>
 <xmx:sUe8Yu4Wch11xI-0x1bdMJqyHBDQiPuobS2d2g-AMXtV9-hYRsmqXg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 59/71] drm/vc4: vec: Remove call to
 drm_connector_unregister()
Date: Wed, 29 Jun 2022 14:34:58 +0200
Message-Id: <20220629123510.1915022-60-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_unregister() is only to be used for connectors that have been
registered through drm_connector_register() after drm_dev_register() has
been called. This is our case here so let's remove the call.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a051b25337c0..2e9dc09fc6f0 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -289,12 +289,6 @@ vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_unknown;
 }
 
-static void vc4_vec_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_connector_state *state = connector->state;
@@ -315,7 +309,7 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_vec_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -559,7 +553,7 @@ static void vc4_vec_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
-	vc4_vec_connector_destroy(&vec->connector);
+	drm_connector_cleanup(&vec->connector);
 	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 }
-- 
2.36.1

