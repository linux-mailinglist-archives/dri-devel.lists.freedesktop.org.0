Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278F450376
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB246E899;
	Mon, 15 Nov 2021 11:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE66A6E899
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:31:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 070642B0117B;
 Mon, 15 Nov 2021 06:31:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 15 Nov 2021 06:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=bRug0ICmI+Wdt
 0kBZwW8x1INoKSiQQc5SfE6Hgm8vw4=; b=b8+KrE7JDGvZbn35Nw2pUQuwN0Wlv
 ZzAjsoA+WqkuQ+jNiTmYL7bfzrUwU5lYly72s+fedF9o108FSj2TwOK4+0R2QCUb
 4VOmJVLU2Ao9N7rvazGOK0UiNfH97+2bCk9I8SXfSfTf4UrFWJnxuqOB/4k/X7mh
 rzKV7y9ezQolKdnIoWyUM9LBi/Eu7StjWftil+qbZtfP3ax/9FpzFwcFL/q/vPOh
 BDxrAO9XdwiQlIOWImTDfAB8qyvrYnXy1sl7kdEUl11+0zLo7RfozMQpYC6J5F/O
 /3l5+/NXQ9PUxWauP8CFZa6NE28MPeIhKEJPnAHnmnky8EOlzXSgxTPJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bRug0ICmI+Wdt0kBZwW8x1INoKSiQQc5SfE6Hgm8vw4=; b=ii54UgO4
 ztIxopMvYCl6AQ/3Zbgbu6Rmq+XYpnShNQYTpYvzKFkWRztL4j45j5XGOaEIPS5h
 u0ydWpr5Y273gCQ7aF60fOS6YlLySepti6crPHl6lPrtcYOhTipXHx+ZlMLmULmy
 dS7jl2BoU0rZWzL0/sinLtCtEaWFXApCbZX7Jl/tEsJGkMG2UaXaTdm7JwtpE7lK
 /PBG9U5oNuZc4LCEToerhW/cjckxQFab/00yhYnsDLLv1yzTEuPR8k4VtZb9UIjH
 QY7A90m6BPtIVJgHwtUTa8Tl78M0YnPXjG18rUZ2wsi1P20ZsLSKcRn0PNSJERQ3
 Hjz/GINLXZoy8A==
X-ME-Sender: <xms:B0WSYRTyrDWcwyWkhyL1srLVx8ObuQbI5J4TLu7-L_X2PkwyOuIMUQ>
 <xme:B0WSYawmhwbWf3pkA03qKyv7uZwrNN7C3LbzMk1cqclZ9GQYcG6cu1NGGtO1Kwmsn
 3EFdnFOfMtiADgt45o>
X-ME-Received: <xmr:B0WSYW1XOvpTqF4ImPA2YfOtHfE6rv-y2zbMENEgKE2JMzVErUlH006XYberCnQdCJCY0jkpP_TYBS1I0n54E3tRYD120-7XK6yeZNvf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:B0WSYZCTwljdz6eRDNd85xhOk1BfK5157CejmbyHnrrgeOTxKbNGhQ>
 <xmx:B0WSYaj4b8DQwTAKikHnkx5J0odKSt6PtLV-dNhOjD0G47imuoIfvg>
 <xmx:B0WSYdpr2vTNo9z5t8be0I6yzHEWmGmx2wuqAVEB1gMoXf9uB0hNmw>
 <xmx:B0WSYVO44wgRZIYi1bmr1qRkaSesuBE97_twQKkH2IiaHOEj_Ad__gOXSjA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 06:31:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 3/6] drm/vc4: kms: Add missing drm_crtc_commit_put
Date: Mon, 15 Nov 2021 12:31:02 +0100
Message-Id: <20211115113105.103275-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115113105.103275-1-maxime@cerno.tech>
References: <20211115113105.103275-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jian-Hong Pan <jhp@endlessos.org>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a
commit") introduced a global state for the HVS, with each FIFO storing
the current CRTC commit so that we can properly synchronize commits.

However, the refcounting was off and we thus ended up leaking the
drm_crtc_commit structure every commit. Add a drm_crtc_commit_put to
prevent the leakage.

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 3f780c195749..4847d1af399a 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -372,6 +372,8 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[channel].pending_commit);
 		if (ret)
 			drm_err(dev, "Timed out waiting for commit\n");
+
+		drm_crtc_commit_put(commit);
 	}
 
 	if (vc4->hvs->hvs5)
-- 
2.33.1

