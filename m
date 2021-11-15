Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86249450378
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C3F6E8A5;
	Mon, 15 Nov 2021 11:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332096E8A5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:31:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 3F8DF2B0117B;
 Mon, 15 Nov 2021 06:31:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Nov 2021 06:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qY59QflZqGdib
 KtuT1mhf0ArM0xf5eWjNaPb+uKRHcE=; b=TDloX5bCEyhVXNV9oO7zA0De/PYJD
 Ph0VMraygAPB5VUaVoWNcS5c9vS9ZJdpgk8wVzmANWbXGs1V42GCZ+TedO5QtbVm
 3EgHp+e2zBGoeGgsFtH3Z3i+Ql6KGTx2RxMMNDYY3YrzIBuHyDwTRkEMorjsg29U
 qH6rMjiwJaVUVpYOWlrbKi3fWV+3s3NwB+Dt65kbofThejA76rnR7EP8M1jK+F7k
 mNEqp4eF8CbilIbJokJW6MN4PbYctncxujSS4bWOHsHFu20Do+gLsT2IkeZfyrOs
 bStJKkRJ3MlPWMmRa7mHjdu0Vw0EFzuqmEDb14Yipo8aKz1Us/41RSASg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qY59QflZqGdibKtuT1mhf0ArM0xf5eWjNaPb+uKRHcE=; b=YNZ3Pddh
 bC1cfFgV5MeBXIK5GpbZgcC/8nUQzpgvHBiPzEs8LTJeCh+pn2il07GT1joAcW+T
 /2GGexvkQPUzIJSgpZOJ43zESOUT7d28tvzolPu1LGo4lZ8FqTPiijkWcaaNPKAr
 TypwGphWhc2de/nrCtv/ufWIa50GjXAL/ox5lEAJJyDtbtCt0bdTcMY6XigN6TEJ
 j2Dg9eYUpdhTXW/XZ37XKCaNs63zKVySW5JNr8cVBFkj1JwhN/13gsVwgfRfPn9p
 7q90tr+QVcg7ftBdSTrvlIt/pAVSiprrEQP7+plDeY17gpZgguzT0BUL4zzDPfMv
 gVZGZyqdHocMPw==
X-ME-Sender: <xms:CkWSYWc1oeOcfB71YBm114dxxlLB6Iuqthe4zeQdzBMVjQvcSV3hcw>
 <xme:CkWSYQNjiJapK5FSA1Y8t02ESzDesMu5oGk-Pj-yopCS_hZykiTu8RzeRHm2D7xGb
 MyDpD20jqOww8yQqYU>
X-ME-Received: <xmr:CkWSYXgyK3nymfG8dw8TrTigj5oA-dacTySccQui_G3jjO-QQcKKWhH9-HUZtWrNEYKEBbSAj5tU2er4C-QbyXVxrguIJaZjZ-8xn9kJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CkWSYT-5P0Iyj2fu7Oe0UitqyMVmF2hXXeHmU1D4CyCkxYp5A4vroA>
 <xmx:CkWSYSs-6Bn62RwIFolK0n76qMc-x4rHRFGJqY4g8GqXuDT5eWDsgw>
 <xmx:CkWSYaG2R8qCO8YtieHTtPazZ4CR7gYrpLd4cMKlTRDD3Lutd71Lag>
 <xmx:CkWSYcKnQf966G305j2N_mcKZiaKYHBl5BKSwQTzxflYMyx4eaiJz5Ej4FY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 06:31:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 4/6] drm/vc4: kms: Clear the HVS FIFO commit pointer once done
Date: Mon, 15 Nov 2021 12:31:03 +0100
Message-Id: <20211115113105.103275-5-maxime@cerno.tech>
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
commit") introduced a wait on the previous commit done on a given HVS
FIFO.

However, we never cleared that pointer once done. Since
drm_crtc_commit_put can free the drm_crtc_commit structure directly if
we were the last user, this means that it can lead to a use-after free
if we were to duplicate the state, and that stale pointer would even be
copied to the new state.

Set the pointer to NULL once we're done with the wait so that we don't
carry over a pointer to a free'd structure.

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 4847d1af399a..217a2009c651 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -374,6 +374,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 			drm_err(dev, "Timed out waiting for commit\n");
 
 		drm_crtc_commit_put(commit);
+		old_hvs_state->fifo_state[channel].pending_commit = NULL;
 	}
 
 	if (vc4->hvs->hvs5)
-- 
2.33.1

