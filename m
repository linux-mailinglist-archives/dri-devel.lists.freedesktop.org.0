Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C0D6363B8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ACA10E592;
	Wed, 23 Nov 2022 15:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A4510E58E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:29:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id F3FA12B06A7A;
 Wed, 23 Nov 2022 10:29:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 23 Nov 2022 10:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217395; x=
 1669224595; bh=xa2Xr2XPoRVUUkfnytxj0Crl7ldzQeXde8zWUWNPEc8=; b=I
 oIxyIj72uCvm/XjjJENT3wqIDO6NxuUF4Fz81i2dPW1PJLibP2AdgKufei1FMdpu
 5gcyFC/q9+abuEkgOn/AfrjsEN1nJf8JpSuxTeBQ+eAa+HCiJkJY72z8MhadfDHn
 nzUzM+EGqYEzeHjDxqtMdJVxr5VzBKd6A8pI7+hD3OJDJCnuPbeM4PGm130pBW9T
 I7Xt31qTJ/ias/KN37RxkLRz3epuXEmGjR/tk+LEFQ2qDvps1WoOTmJf3lWZJ+55
 /iCPQ0qNqIx510B+xgpa1lgbg7Xfqx3UbTGoQ8fsl792+T7p/m6T/DH0SGyfTJuH
 5lobAtvOfJ2XiKuXUDcwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217395; x=
 1669224595; bh=xa2Xr2XPoRVUUkfnytxj0Crl7ldzQeXde8zWUWNPEc8=; b=t
 OXWuwrUE36xuza4nA/00BWxCwgo7A0skuCWcP5x7iNQerc0WhfihX3C9MvY54fc+
 Kfyv2bszolIZ5Wcbhg8HYPkLE2myzbXIJ1PgAHIV1bVJ4zVn+jhmqMFf6gzAVi1Q
 t4NFJgsjhgz+RQXsFiXCuxaNZPdb7ZixBRIBE6WgFVvMCHtlxofyXpU0/jYLk8bZ
 1I37nmtb6YXt4VxA4e0Q6sel4AC/L6daN1QYo82NETae+bjzkLrEg0KCP61dpxcB
 ycllPU9srbacvrxh/nTIOnl/c2afnpAeH4XazK6N7q2c3SI8f9C5Sq6gitNWq0LK
 KZplW40hF8VLzrGyq+kZw==
X-ME-Sender: <xms:czx-YwQShn4eeqEAgBQ8cqQHN6UczS133vk65w5LHEbykN8lEDDLiQ>
 <xme:czx-Y9xf664-vRcRmcpgq4BYE6Fbt1Wtfkl2LNzWtyWhzdG0-7sPq6TYaewtld_-H
 ymn-6BP9JsjUpfc4a4>
X-ME-Received: <xmr:czx-Y93QhxBdD8n8ykaeGPnQ6e6zWJz5qc6ji_hRksR-Lk8XZ1ER0yay7XyjDQNefiQBSWH1h7bgLkAjScD7c03qmlaxs-b5YerfcLCCU2XTBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:czx-Y0DoGYav10OrIvKlenqCdA_vyYrKvhiUDQgGM3hlLrWvM23a4w>
 <xmx:czx-Y5gn9TbtuUMo1McKrDELtZ6HOPPhEKVRe4L_LVoo34LEGSDYCQ>
 <xmx:czx-YwoI-3iBArWo0LrzH4NdbuMDJ_H2XOgLC28tDGyYZDYavjhJtw>
 <xmx:czx-YyBnc1SupCF6-1WnzqAiGzc1_o13Q4WgIeE0eRVs_DW6dM_wVxG1VUs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:29:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:58 +0100
Subject: [PATCH 16/24] drm/vc4: txp: Initialise the CRTC before the encoder and
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-16-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=aR4vqMsUMqYTxLScBcRnhlhUq2A/EuG6aDorDcg05no=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tU63QpH/qj+5+FbXf2IYUnBZ5MOxpM/Fee/usTrN/VR
 hZFRRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZygpOR4WLw/1nOmtv67GcvZEtzXP
 5wyXrNbPelz18+3WgtcFBL4yojw7RvWb35hwvml97aspj35jPfU//91fd3mjRYZ4kLHV6gxQUA
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It makes more sense to register the CRTC before the encoder and
connectors, so let's move our call around.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 0bb8e97d7891..c2a6bea6fd96 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -516,6 +516,11 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	vc4_crtc->regset.regs = txp_regs;
 	vc4_crtc->regset.nregs = ARRAY_SIZE(txp_regs);
 
+	ret = vc4_crtc_init(drm, vc4_crtc,
+			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs);
+	if (ret)
+		return ret;
+
 	vc4_encoder = &txp->encoder;
 	txp->encoder.type = VC4_ENCODER_TYPE_TXP;
 
@@ -537,11 +542,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = vc4_crtc_init(drm, vc4_crtc,
-			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs);
-	if (ret)
-		return ret;
-
 	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
 			       dev_name(dev), txp);
 	if (ret)

-- 
2.38.1-b4-0.11.0-dev-d416f
