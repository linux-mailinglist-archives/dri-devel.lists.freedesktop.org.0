Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50320454416
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 10:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC79B6E932;
	Wed, 17 Nov 2021 09:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AADA6E932
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 09:45:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id AD10758082D;
 Wed, 17 Nov 2021 04:45:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 17 Nov 2021 04:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9qnLfLih64vPe
 62o39bsacGI/EGK3RY0ptjuiD5ENvg=; b=Xsg4fF80EUX4TVqxZNzmb/yqdEwpv
 4v0pxSvdUBAwNQ5Jr3LSn4Ayt+BDIHpF1HXvyQ3USKB+hDD67iVegcP6TNxzR1IG
 qC7DphfHaykBGzsoIbqqmC3V9g/6VKX4npUJm0pGlXmy5e3bgAo6bLCqKQIAdMMb
 UwAryRkKDehD4+pvkHC7Mwl787IhB4U3xQ9liB9rrqkosdeivUXXYnN2oU5KwZKG
 w2JrY52fl8ipPYm00Cn1ocNl+sRzHoHh0LdCa0WtoWnQ0RDHexjkUahLxVm1seYM
 bYsxeMhbyLRPdR/f8nV8KtmCwMOrzciIJ03gl6Dv/zbDiRMBhJyqXQHxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9qnLfLih64vPe62o39bsacGI/EGK3RY0ptjuiD5ENvg=; b=YKHnvsi3
 P2uC2eY2XInrld5qsju2kswbMLdCFzinLqX3z3wYUeEcrYrWijQ8710o3zD5OjzS
 PalLPpIsnI6GfdYRPjKmMEOaZ7JUiALTU6MaH8qJeuK8D1G1TZ0/cDu4kuYbZ7Nh
 pEXOWvINk8joYFT7dNl7osbTu7ulGq+UO9etothhXsMx8FCBTbCXx2qmnGlfFpJS
 5V95C9SnCEbW8L4oBFKRQiyfGmCGXovX5sVRI6RuT9Ef+llcQVTqLd1wXoL1IhA/
 M48VCPb86jM9jhH5BMmY+mVBBVPhDo3F3icY9DUtzo0sMEg3/+8Qm+hljZF9QioB
 oa7pAQbB+eq24w==
X-ME-Sender: <xms:Ps-UYQ-KeEPPMeuORoUQLL-zSRm9NcaAYVwHcaVZn-5qlDh-GAU3xw>
 <xme:Ps-UYYteJpbm36FovSxIsUc5VnZgzlLYJLbWXebIBbAqM3KNX19zTDSPXwv-cQzJE
 -WKHySDVWgLB2TpLUU>
X-ME-Received: <xmr:Ps-UYWB7yxDjw57kETGTTEN4s6m6w3KWM3plvEjr6syAcXgAw5VA3bzrr8Azr2vFTus-zi4paX5nvyHaO66X7Fxk_WAnyebuhWbWWAnVPC0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ps-UYQc03zgWnb6mxcxPMGFMzMawIp_ON0IXJBsVmzT6MAbHByBxqA>
 <xmx:Ps-UYVM1fwQxTbopTAR82gJ9fXZe3xwy2RJ79xr9Du1Lv7vFCXrKKQ>
 <xmx:Ps-UYanifNcxoNJlHXt-ottqsEv486nM7jtrqG7yet3uAr5Q6rzfyQ>
 <xmx:Ps-UYYpkVX8j4a25QPnGFL2jg6XSYoR1DfayR6mDUhDECpxVNVo8lw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 04:45:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 1/6] drm/vc4: kms: Wait for the commit before increasing
 our clock rate
Date: Wed, 17 Nov 2021 10:45:22 +0100
Message-Id: <20211117094527.146275-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117094527.146275-1-maxime@cerno.tech>
References: <20211117094527.146275-1-maxime@cerno.tech>
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

Several DRM/KMS atomic commits can run in parallel if they affect
different CRTC. These commits share the global HVS state, so we have
some code to make sure we run commits in sequence. This synchronization
code is one of the first thing that runs in vc4_atomic_commit_tail().

Another constraints we have is that we need to make sure the HVS clock
gets a boost during the commit. That code relies on clk_set_min_rate and
will remove the old minimum and set a new one. We also need another,
temporary, minimum for the duration of the commit.

The algorithm is thus to set a temporary minimum, drop the previous
one, do the commit, and finally set the minimum for the current mode.

However, the part that sets the temporary minimum and drops the older
one runs before the commit synchronization code.

Thus, under the proper conditions, we can end up mixing up the minimums
and ending up with the wrong one for our current step.

To avoid it, let's move the clock setup in the protected section.

Fixes: d7d96c00e585 ("drm/vc4: hvs: Boost the core clock during modeset")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f0b3e4cf5bce..764ddb41a4ce 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -353,9 +353,6 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		vc4_hvs_mask_underrun(dev, vc4_crtc_state->assigned_channel);
 	}
 
-	if (vc4->hvs->hvs5)
-		clk_set_min_rate(hvs->core_clk, 500000000);
-
 	old_hvs_state = vc4_hvs_get_old_global_state(state);
 	if (!old_hvs_state)
 		return;
@@ -377,6 +374,9 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 			drm_err(dev, "Timed out waiting for commit\n");
 	}
 
+	if (vc4->hvs->hvs5)
+		clk_set_min_rate(hvs->core_clk, 500000000);
+
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	vc4_ctm_commit(vc4, state);
-- 
2.33.1

