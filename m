Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D757A560016
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ED214A626;
	Wed, 29 Jun 2022 12:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604FB14A611
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1B3553200952;
 Wed, 29 Jun 2022 08:36:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506189; x=1656592589; bh=Cd
 qlBQWPPclxv1YYHr7APXFjfRlyr35BOZAqb7BQNQs=; b=diHPuHliw0nXVAcjow
 ZdZ9Q5OI/7HQ5L3Y2FwsD5uUO9IV3v7uq2AWiW9ni/fUjBAoE8NpRzXsik7jsNgM
 jrNOgabau+gtlpDJDv8fKGoRWwofvoLlYY6SC16ApLQKkBwE2ZsENYYN1bsd1Qwp
 kwUaVKrJzUwxKzCm0ZnQHRVMxCshQh1mC8/XSGCkkeA4UeVxvcl4Rbw/PNgbuzTL
 IRcFsZc8SqHaePEsJrSiRl5t+BLnURI0wLE9iZxR30W/dHZeSc74XoyImzumJfzS
 TAdkIuHOKQkWrdkJavmkwkjEqftxhyDZ+rSuZy4sa8/oYZqNqNTFxDqR27GA9DV6
 v99A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506189; x=1656592589; bh=CdqlBQWPPclxv
 1YYHr7APXFjfRlyr35BOZAqb7BQNQs=; b=wWVaeXwPIaJHAroGh93CVgtQfFrNw
 G4ySVsNLWD8aCxYyyYqlXQzx0LnzUUCKEzkhUnSf1/24W2KKISo5gyweW2zlJsNl
 Ydc8oDFjUkT68XeeWzG/Q414bpvCIXQhhGpoAzwYLbMIMy9Gmyl6CZ+bfDo+XKh2
 pMaSfmgxPgUU1QuH4mA1yBJSMeFNoecgG8q2fxg+LJzP0ODtWnEb3QD7CRSRgwTW
 LTGsdsuD9drB9yh6ot6Ru4skxc9G9K0aQqFlMQSSllczHSA17p6KnU/C5deWPq5F
 +bGb4LXUTfSgUUqNakdunEidZCq+22kzkn/Qu/NWLfJ5KUfvqdL38KXFg==
X-ME-Sender: <xms:TUe8Yj0UfKb2xwDLwMTdMo4dkDrhRZByxouPcKVhLfXdlZgT9qRsYg>
 <xme:TUe8YiGINTMQpYoWwKoLrAwojKoeVVty3i1kh0e0trUok15M8n7BCl06XZ_ycYK0J
 ef07DPdWkM-EgDlPh4>
X-ME-Received: <xmr:TUe8Yj705PkDYFKOeGgFkVPZLcvO0fWibwrAhPokCZb7Oxwd61Y_fX-zPUjQuY4LxtcauzjUylgWIUz1xLYPRe-uqZZK_pU36um9E9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TUe8Yo0e90vKLGOCLVN7WM0e8-yWR1aJYtJQeqyQ0_SNPYe8jk_l0w>
 <xmx:TUe8YmF06gkwNdy2rAKFSp0NzN_H_BBrcPkZEmjX4cAggew0vD4l0A>
 <xmx:TUe8Yp9PtcX4LsG5YS6fmxbNAVEh8EMa_qKKuH0XpvebFpSTCRC7UA>
 <xmx:TUe8YjPajtM2JiojR7CRTYOy-YSP35co5fGyQqEeZY7BGyg4WwevFQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 25/71] drm/vc4: dpi: Switch to drmm_kzalloc
Date: Wed, 29 Jun 2022 14:34:24 +0200
Message-Id: <20220629123510.1915022-26-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 7d4bb74cd500..cfd89fd0695c 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -263,9 +263,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_dpi *dpi;
 	int ret;
 
-	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
+	dpi = drmm_kzalloc(drm, sizeof(*dpi), GFP_KERNEL);
 	if (!dpi)
 		return -ENOMEM;
+
 	dpi->encoder.type = VC4_ENCODER_TYPE_DPI;
 	dpi->pdev = pdev;
 	dpi->regs = vc4_ioremap_regs(pdev, 0);
-- 
2.36.1

