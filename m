Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779FD560031
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F12414A65D;
	Wed, 29 Jun 2022 12:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A0C14A657
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2AC32320096D;
 Wed, 29 Jun 2022 08:38:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506280; x=1656592680; bh=mY
 yNBjfyQJdnCjja69WAvxClXz2TRopLInZg7atUW9M=; b=pQou6dSHXwLElr8D/F
 y09tI/V9N7SqU+Pj1/Yeg48tTzUU+hqLuFanCukgZlN0w17X2+lLkbtv8Aj8NNlz
 QSycaJBPNNB3QgtwFjCkmCweEmTyOgGBrGHJIo0J/WWr1C3QwWNt0hmG2jbjMDiR
 NQTW88JcO/unJo6qujDs5S0xt6bEuf0zfsCUa6FLCWUqSgnRONBlUwuErbq8Lq2a
 2fE/hmCVSWL5jYmmDZ2Jc7JdH22nPkEIUI+rZ+HUksufmASFFAFsnb9WniOCyNfQ
 0kZCoEQNLNAhPbuyPRHbWTM7NKRD0urbQUf+fv7JRCQRMebzBjx99WlO2l6vw5GK
 dH4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506280; x=1656592680; bh=mYyNBjfyQJdnC
 jja69WAvxClXz2TRopLInZg7atUW9M=; b=cgx3xki6DQlrOrc9FZkGKkkUyS4ei
 EMwEPaof2Gbljyf26U9Ip3EWdx4ZYVdJdjlyrkidKIpMJgoEvZT6mPzi4N+5Xc6r
 rNsXLHB/rVRFcH2LCbvt4p8wgs0ytQXwlyTmCorGkgNsLlhOIGfyLlpRmRlpBp7U
 naVdygRxQiaDcL6CEqUPNmFAYbpPF3hdPhA0esciSZJbrLl7SOCvNwKGfb35Obrl
 Y905iRpDyqIi/8TJHDSs5kpPo1qLup3mvrx5Wl7PDRlg/AV3r/tcDU8Gb3LO9mvq
 RU3BRNpR6PVkNch1JvzaiwDczEKQGXyIEHP5C4e2NPPrFD+LPn4KbExDw==
X-ME-Sender: <xms:qEe8YvTSBkvB9r8_ivv5LCpnNCtZ5XSvmw_cqcMZd9JBMko4h89lyw>
 <xme:qEe8YgwmVWzp3nftPSowmOBC6w9g2dCLe0Xgc7Zeids6HxhgSti2ucMudm2ElItaw
 _0HPsbcXyzSR-JQ_XI>
X-ME-Received: <xmr:qEe8Yk1T4BLuhTZajB9UqQaqqVxAoL8rBW4-NR-x_QgiuR27KTp4QmS_Jq0Dovbf6dTQjqzue4jp8etVARvEyZ2-Od6MMyv1HNOG1Z0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qEe8YvAROmrmHRUOE6ur70GObJiIOIJtPhmpEED0R72JdNZ9lk6Skg>
 <xmx:qEe8YogHW0ybdmmFuBtTOD9YzLnCQ6rKhLQDZt4Y7OHNPgUMpha8xA>
 <xmx:qEe8YjoBza0JWMQX7XgektzPUfF2v5BeLA91PMTvGJ1fe94o4g3cNg>
 <xmx:qEe8YgfxeMlTr_5LY5ee08tKT5N7NtwubFckZtCQPPoneBmxkuKdvw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 56/71] drm/vc4: vec: Remove vc4_dev vec pointer
Date: Wed, 29 Jun 2022 14:34:55 +0200
Message-Id: <20220629123510.1915022-57-maxime@cerno.tech>
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

There's no user for that pointer so let's just get rid of it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 drivers/gpu/drm/vc4/vc4_vec.c | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 9c5b31fa4b9c..ce12d7ec9c6e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -83,7 +83,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_vec *vec;
 
 	struct vc4_hang_state *hang_state;
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 11fc3d6f66b1..99fe40c8cf81 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -532,7 +532,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec;
 	struct vc4_vec_encoder *vc4_vec_encoder;
 	int ret;
@@ -585,8 +584,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, vec);
 
-	vc4->vec = vec;
-
 	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
 
 	return 0;
@@ -601,15 +598,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 static void vc4_vec_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	vc4_vec_connector_destroy(vec->connector);
 	drm_encoder_cleanup(vec->encoder);
 	pm_runtime_disable(dev);
-
-	vc4->vec = NULL;
 }
 
 static const struct component_ops vc4_vec_ops = {
-- 
2.36.1

