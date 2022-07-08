Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C7D56B62B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B175311383C;
	Fri,  8 Jul 2022 09:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD5D11383C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7211832009AC;
 Fri,  8 Jul 2022 05:57:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274277; x=1657360677; bh=hm
 6271RTN8xsRIYP7cmZXIatnDes90SwSdCjM9cSQf4=; b=uYdaZ77xsyuXJsPmib
 TtXuf0rO0oiGbkFMBQcz4xB1dJtTmnXGO7r/Tk0Ug9gJIt+IRfMciLkGg+PolnEb
 LtaQctsO2eIBkkdVwSHNUemDiwVFL4mDrPDAnSw53k8QI0SiONrZLwStsW2k4+JQ
 A6J9hgi8zgT/vlBslRq0BVvErsAWhUFww1p9Y9lpKcKuM73EsQVeG6A91bpWMYwq
 13eU7M1RTHnfRVHAoBKUuhu07QHAd/txhtjpopgDF5nwUQpOf92d7wTARhtxPKcD
 s05xLRqyYTd+OeMnN4QQ5MBPXpPO7Aujc/Bnz9u01HMo2O1BWaqqDbHdAPU4fc+w
 zxVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274277; x=1657360677; bh=hm6271RTN8xsR
 IYP7cmZXIatnDes90SwSdCjM9cSQf4=; b=LfZd93DCKHnyBxHYlIpC8J+2aC00r
 jABsAZ8W4kcTGhpH9zY5i/fg2BpAaiClrs8BjZRjQMoMFOyp2si4tbIYKmengh7u
 uKJ9UsWMxq5DSnxPytbmOxhOeM/WIchZ11bkweXBUeOBJ24BAloNMnIvJXiheoxu
 UFjvYoECHEi+VFb91FTt9OoGwRflzIS0RzzMBy42abAtm/QV2F0/ZLuCEDK5Pqqb
 TqB81t4y58lLgLnrWUYUBfUa/Ca2VVRWR+6e3dNlpx+tlMVbougYzt0lWJqsuA7M
 RHlEAwO/AbiR1JZykrbhTyItV6++1V7cTsRTXLtGUhdIQUNrWhMv+iPCA==
X-ME-Sender: <xms:pf_HYlLsUfFY7SbIS0RtDGK6VeJ_ZoEn6srDEqyYuT2nQysDZ76oNQ>
 <xme:pf_HYhJnwZkS-dgHiUKBNt4xRRT0FBD--UkvkZObZCZU4IM_EkiNlu86T89Vdc20W
 3LDtz0vKxPlQ2-4apA>
X-ME-Received: <xmr:pf_HYttm69GgmoOv0LE20GaUKTPNjEA7pgs4bvlcqw6xsp9yC84eQWb_q3vNTMk2GY6ndmP_0aoX5fTIZUxtH6CeHG5cv5kw47kymyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pf_HYmb5auB9L0p_v8yujHbUOjPEJBlk1Wq9lMbT-8hvR3krtF_OcA>
 <xmx:pf_HYsaY6UM9mlSMZhrwdKSlvmhv9XDsEjOxhKbG-NTefJzsyiMr5w>
 <xmx:pf_HYqCMJtUaHfxnVzUnrfJMOxe9uINCZL4Z-EZ0NslE-i3TdvFliA>
 <xmx:pf_HYrwNBLdBg8Kg_1RXs2Xpo-EQgsile2UETIJUXLDt64HfmYeImw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 16/69] drm/vc4: hvs: Remove planes currently allocated
 before taking down
Date: Fri,  8 Jul 2022 11:56:14 +0200
Message-Id: <20220708095707.257937-17-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the HVS driver is unbound, a lot of memory allocations in the LBM and
DLIST RAM are still assigned to planes that are still allocated.

Thus, we hit a warning when calling drm_mm_takedown() since the memory pool
is not completely free of allocations.

Let's free all the currently live entries before calling drm_mm_takedown().

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index f2d6e62e7585..a62f222255ce 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -873,11 +873,18 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_hvs *hvs = vc4->hvs;
+	struct drm_mm_node *node, *next;
 
 	if (drm_mm_node_allocated(&vc4->hvs->mitchell_netravali_filter))
 		drm_mm_remove_node(&vc4->hvs->mitchell_netravali_filter);
 
+	drm_mm_for_each_node_safe(node, next, &vc4->hvs->dlist_mm)
+		drm_mm_remove_node(node);
+
 	drm_mm_takedown(&vc4->hvs->dlist_mm);
+
+	drm_mm_for_each_node_safe(node, next, &vc4->hvs->lbm_mm)
+		drm_mm_remove_node(node);
 	drm_mm_takedown(&vc4->hvs->lbm_mm);
 
 	clk_disable_unprepare(hvs->core_clk);
-- 
2.36.1

