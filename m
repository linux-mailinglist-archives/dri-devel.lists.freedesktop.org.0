Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4101B554D23
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6284B112758;
	Wed, 22 Jun 2022 14:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D73112758
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id CFABE3200944;
 Wed, 22 Jun 2022 10:32:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908373; x=1655994773; bh=F2
 Lz6b4MojEC6rH5TCMvi84KzfNDPBtJ/IJ5A5jmMDk=; b=GjpP8IKdDcq1t9i6Mf
 UK+EbEOKHawmMk1wbRyJSXzWAyTpxUPVzwvnxqUZE9YOF5zVsd1MmOfHbq/uld8M
 XHetwQFv8b//hyWfXgp6CMuQlVMrkHtSS4BTEW3wSI3t9lbf/E55TmpQD+vbxfHA
 a4AmF8w9TbG/jJ5k+pZaD2m+/G0rN98MS0dJv/vaD3Hzh6n1FNplGhGUvPzg1yt9
 1AUNcwlNLEceXnK6VuitOnElQJ1+V842+YzfjIr0TuD5UqAVOQbCwBOPdF1mQLq5
 vesm35ukYMjpCg/UACprQSepbG9pptqaIpidgNoj9gLPObP7uHJttnByjQU2tbdj
 VTOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908373; x=1655994773; bh=F2Lz6b4MojEC6
 rH5TCMvi84KzfNDPBtJ/IJ5A5jmMDk=; b=n3u5chAcfxdcytEFmY9mantnPxWAr
 4lqRkljOxly1qe1lT9aeSbuFm4iHtjwa6Bv9FVF7v3FZ5Wewy+O+9v/nzuXYtX4I
 3/oV5PZL4MFfcWfy0uFAq2Jdr6crJEEsRgKHS6PtH8Jw3418p89EuIYo1UoS0/2Q
 bgXWuD9NcnOgTzg8rXeXdBwNXvtzOcLjVxvdtzVYzA6s8/JaMevtffEWY2vyPdT1
 +bbD4wCKUJbM807A0k58OH87fDevLz14pry7226He9DCGQm7ej8CqcFqcep3sOu0
 23ic+kYWoevkhQsyX8A4eOQhPFo4g7Wtth+x5D3SSNbXx7fwHSeu1Ghjw==
X-ME-Sender: <xms:FSizYrrcweZ0va5kFkqzTWHjfv5x461wj8UaHDawbY5Sin6loXRVpg>
 <xme:FSizYlozSHyuBD0qGRPsVX6JRbY9emQ-uW-wwcjD_RoTAAYd-zMWpU998CAT26Cn_
 c9MWNO006Vb_VvxwzE>
X-ME-Received: <xmr:FSizYoMROSNNzXfskjTFTgFGiw3OkwEFO4hCnnnYHbq2g-UJnfO2qBprWftXMrWZv0UQXGoTQwMPSyzfCUOWckVNV6YzlgKZYw1SExE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FSizYu6Sr0iCM2Ojnc9sE4L2I1rXwom47Wb5_YiZsy_CUsf6yrQBDg>
 <xmx:FSizYq4nb8SyC-OmmBt8SRSEWYOdeFipxcJ-Bpqwzif9wTI4DGaZ5w>
 <xmx:FSizYmjVSHrssGcb1XV75OG19GtYnr2_0Grrf_d-ZvDIaulzQitzFA>
 <xmx:FSizYl050XB6pecspVClGydvh3o3sMSwP4SOpMEQqN9JECYPabUTdA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 12/68] drm/vc4: drv: Use drm_dev_unplug
Date: Wed, 22 Jun 2022 16:31:13 +0200
Message-Id: <20220622143209.600298-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

When our KMS driver is unbound, the device is no longer there but we might
still have users with an opened fd to the KMS device.

To avoid any issue in such a situation, every device access needs to be
protected by calls to drm_dev_enter() and drm_dev_exit(), and the driver
needs to call drm_dev_unplug().

We'll add calls to drm_dev_enter()/drm_dev_exit() in subsequent patches
changing the relevant drivers, but let's start by calling drm_dev_unplug().

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 90575171824d..06d605a12633 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -380,8 +380,7 @@ static void vc4_drm_unbind(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
 
-	drm_dev_unregister(drm);
-
+	drm_dev_unplug(drm);
 	drm_atomic_helper_shutdown(drm);
 }
 
-- 
2.36.1

