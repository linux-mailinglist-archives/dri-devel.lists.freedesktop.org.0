Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B332A56003E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73CA10EB20;
	Wed, 29 Jun 2022 12:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BE414A686
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 11C4C320095E;
 Wed, 29 Jun 2022 08:38:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506315; x=1656592715; bh=TF
 1SSpnzZyso+LLppR/uxfNGrMZ9N/ddWiqdW1pbyC8=; b=cS+MSMtmMtU0LeZyAN
 pI+4p0VJ4R+TkJh9LOYqZhCEttD49Mz7T/MjoMZbXftNj/cfYIPyEC4O6LFsdRZR
 CwH5FcBkxejRJpmMuBbJs1poodILIDeHPH/L0OQheoHOhsmCwU4+t+g7l2YosxBW
 Q8zPJp0eWfZl+tqAzZBxwcfh/0GR3zx5sVoq5nPMr3pBNNzu9sWP/vfmwg8wVJeO
 CLLQsf9U8x5rCssDsYAgfUgM/Nh/pYKkumMRvYNYpBPQDa7FicEdYP8+coIkZ0Tq
 qgzz2CPhXNyBiSTG0KR0d7DBKPFCVy4WryiIMymcdAZcvQ0zWPo5LnppyK3lpIEs
 fwgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506315; x=1656592715; bh=TF1SSpnzZyso+
 LLppR/uxfNGrMZ9N/ddWiqdW1pbyC8=; b=JFPSWNAqR9oATTVL63slga/25Y23c
 HOUZOhIvBTucVChXKpSCTDALsJyHpFsTk+vnxT0t9TQXTPHjYoFy//wFaHQtQxvW
 wAtJZN69oPBO74XwsGJsm8JL+9HrkrWgcx0hF6fLq3DL6JYyqOzFTsDW7wVWlUo+
 u6UPfWVLJqxWiDOTx3c51f9kago13AJ6ln3U9pkG1JuO5/lYx6Zh8Gf7JnYjSvl/
 ksixE4KOJ/02iLHmIjyPI7AqSy20EPowlDdL6pv9UjYTTbyiBkIZgdiZACTgBbs3
 AHQNEY6lbCI34WKiW262LojJQVjuXu2mv+LNPRi4WVg+t5Y1cp5+4X3Pw==
X-ME-Sender: <xms:y0e8YhV0-J4N-m6bhk7liVBDnZfTSt3rIIqXaxnD2tdlSlPfAwcbjg>
 <xme:y0e8YhlnZmksPpbzY0h88HCISHwvqlu6CBjZSmkZ7hKBBPxuX40GCXWayN80TcQdJ
 FhgDlimJxpHik8O6j0>
X-ME-Received: <xmr:y0e8YtazppFfXOA_trM0bBo3yvLSOyWEmVtHLwLjI-dxF-DTbNQGjuFF8f7rnS6_JLE8xRCRRljtRZAUegHYTLRhpuZ6S0PtJtzmJkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:y0e8YkVCuGtssLrBgcANYybawRmX86MWH8wDcezYAMMzup5ueOm0jQ>
 <xmx:y0e8Yrn53ZKvUs6ExqfihBruc2KSIyxsZr2Yy6B0uk3sDaPE9OSSyQ>
 <xmx:y0e8YhcmUhwXl-BChwvLGo-glJ9YXmAvMgpPNf9VQohsbsZAvFo-gQ>
 <xmx:y0e8YkC72FEFV5EOmC4i4fIUc2GQ3E7w1LO5G3FdGF-Bk_UFZeD_4Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 68/71] drm/vc4: perfmon: Add missing mutex_destroy
Date: Wed, 29 Jun 2022 14:35:07 +0200
Message-Id: <20220629123510.1915022-69-maxime@cerno.tech>
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

vc4_perfmon_open_file() will instantiate a mutex for that file instance,
but we never call mutex_destroy () in vc4_perfmon_close_file().

Let's add that missing call.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_perfmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index 79a74184d732..c4ac2c946238 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -133,6 +133,7 @@ void vc4_perfmon_close_file(struct vc4_file *vc4file)
 	idr_for_each(&vc4file->perfmon.idr, vc4_perfmon_idr_del, NULL);
 	idr_destroy(&vc4file->perfmon.idr);
 	mutex_unlock(&vc4file->perfmon.lock);
+	mutex_destroy(&vc4file->perfmon.lock);
 }
 
 int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
-- 
2.36.1

