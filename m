Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C4E56B612
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED1D11381E;
	Fri,  8 Jul 2022 09:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE026113809
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 866E6320031A;
 Fri,  8 Jul 2022 05:57:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274254; x=1657360654; bh=UU
 GJSMCMaJwdbs4l9OBg3rwBsWdoY6m5AkyRr3rypXw=; b=Le0L+pd/3IQSWNhIh2
 QsPijdrG8qrNvsG2mji2uzg+ERrSBLezd47dm8GvQvuinDe5e5XEmzTsFc1D5PdT
 nKpHH+7eYELy4yIUd6F24rDwlD2U+Ti1NkjBF6TQMOYW5/OPG15lZQ7nk0OkTKpg
 fPd/mN2bA+Zlk5+hMh6PHCtwh/tl13OySIHhB8VxB6XnmjTBk0e69AL5V4g/6lkG
 T3xgdjtPEZyYxXWPao3JnFpOKxf15mGni6Xmv84lceljz713gUsTCATsWDlpw6VB
 gNf9JAQb/DeETz5aCODMQ74bVq2We/4aHGBxleqfnWfwftM8I8+uSDyhe3SeP1sM
 9UHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274254; x=1657360654; bh=UUGJSMCMaJwdb
 s4l9OBg3rwBsWdoY6m5AkyRr3rypXw=; b=Wi+1yMullOQxI2CMpPwapoA3wEjKS
 UF+Ze4wY+PRqybibIiHFyTEtEq1Hy0DByQKJ9e/qKVk9u4fXAoCyNM15mLQGHMPV
 CNiGO7sl416aFsydFg3ix676wF2iHFPLWfJf07w2oJUb+j7uvcNdT8wgkzyoX04k
 /nBtT7FlgBIIq8cNxXTLpqnFnU/2XGI/bUjmv6dWplc1XsSx2hnNXlFkFKM5eYHd
 W2gsPxsr8WnrWX2rBn8SZxqaKKyy2wTyc0F/Zg9PyKnupyC98iimoY56HbE43bGM
 F2UokgRmt12EtMkmREDe5PsZAFWxRbu32AEPmJiI/9xG1Ih08zC/QpuNQ==
X-ME-Sender: <xms:jf_HYgs-KPVzrNK3yfW0ZBv4W4JBxPhHZask5BJklsjVuLJwJ5FHNQ>
 <xme:jf_HYtdo-o22e12jVKM0qSws6mOo0CoJb71a_8XwzGiHnHRpROuAA4Oh2lZBFLVmm
 JlFOhV3CPFEARIooV0>
X-ME-Received: <xmr:jf_HYrwlZH1VfHYtkX-9JD35k57TLIkQXW_w-hw38gEF9bsLFSy0ux9QuQFmQ9rmGZ05stpu5u0fdRCk-f-RlPlVpfmx-MduUTVxxw8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jf_HYjNlvnPypOp2BdxQWM3sfxVzN5U8KSmHpv1kfZwP0_5xWpTktQ>
 <xmx:jf_HYg-tRBgBGL4Icp5dS2peXgV7w_mfU-2euhSMmyoERAmJ7hXtXw>
 <xmx:jf_HYrXFcxVCWCvV76YS9hwByb3MeMnwDVLdC4LMk9UheF6vbvSZ4g>
 <xmx:jv_HYkZo9pf86uWeuyOgqQbeFCKwou_Kpkk64FMkn-334yvWI3pzBA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 08/69] drm/connector: Check for destroy implementation
Date: Fri,  8 Jul 2022 11:56:06 +0200
Message-Id: <20220708095707.257937-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

Connectors need to be cleaned up with a call to drm_connector_cleanup()
in their drm_connector_funcs.destroy implementation.

Let's check for this and complain if there's no such function.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bbdac23bc5c5..dfd170273f5c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -348,6 +348,9 @@ int drm_connector_init(struct drm_device *dev,
 		       const struct drm_connector_funcs *funcs,
 		       int connector_type)
 {
+	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
+		return -EINVAL;
+
 	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
 }
 EXPORT_SYMBOL(drm_connector_init);
@@ -378,6 +381,9 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 				int connector_type,
 				struct i2c_adapter *ddc)
 {
+	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
+		return -EINVAL;
+
 	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
 }
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
-- 
2.36.1

