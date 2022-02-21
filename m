Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC24BD9FB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D264410E318;
	Mon, 21 Feb 2022 13:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA05210E317
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:42:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D9F765C0228;
 Mon, 21 Feb 2022 08:42:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 08:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=jm5IKwIbXDkANdhso+frVJ+FbR6Nkn
 bfG4zVfDUE5dU=; b=jRoQIoT+yRAPd8mnqh5fZ3496/XQIcKR0LMgnTZfCtEwgU
 QEJca0IIgvk+Q88MteIYeFghLU6F9b/Iz+mPYFPR7SlDQl4qdxpdcZV8nx7pTwwS
 O+/HLZZS/+O4Us0CrGJ/5FUW4U7OlBbEIMprzmLqggc8MR72MrghexqyUtdocztH
 XgbQ40VXtdKWfRwv8WbL4BF//D/LqVuY7hTPCv3cm7oWtQ5ErBSvyojlvYubQB+y
 tz7HgIsZ/ZzIyv+8POa7Lx3HlCebiosDLA0rWY0K3KeqzZ7DhVRMoyME2tiUTfW9
 56P4/BW4q83GB7oz0xsJL8aDND1uGWd1CoD0N4uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jm5IKw
 IbXDkANdhso+frVJ+FbR6NknbfG4zVfDUE5dU=; b=cI2HfpnxeM8Sre6TAGwECY
 kgEFwszl3S9Q0H8KJF+LORX8dcN9pbEn6ooSDTWx66QKdamSG1OY0AB85rAkceqb
 7kTOpwMHe3fAulRkJhNgzrPS79FD6vtgzHr5hd/syamZWnCBhudwok8wSkZwaCu0
 xcyBe/F1h2QAn/XYm49ml+VvPR4SIo71ipvbez1xkn3Ic8ouEgiSxDo3m1z6Zn7X
 z81vUj1HVlLLefypkp2RcRYQsbEi1rP9hHGNZWaNkH7uxir9Sjim8tm9d8p816p3
 Ym3havTZnw0yOSmGs6PJOyZ7SEiJt9J3UpmeHOJgPy7Hyq2bK1/lB5mC2iglYc7w
 ==
X-ME-Sender: <xms:qpYTYrolfn3LI_E8vN6uCIUI-8rEfV8-zu5BMhVP12XR5EcGhZMHAw>
 <xme:qpYTYlpICSAiFIiefpQHO1qkLoeWLxhawIMbDsrMVw19qKOwOz1dv-M7_K_bLRYm3
 Z8B1ZrrCBAfXtVBMxs>
X-ME-Received: <xmr:qpYTYoMCTbHWWv0Rb7sCMNRp82QADYoKXr-ysggErMT9xkMGw4be2KXiofxFYCd7qTt5U1XrbhwV8BkGuCXOBEcWEPSi7hvA0r-Hbdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qpYTYu4vs93NudvheaZ9gNBYOm5BX_03AjAgIPJwG1KDnQZhThzSMg>
 <xmx:qpYTYq4ABzJMmhgJdVXF6zaxn73lpUiVN3arKBGkSwHYsySZAhWAhQ>
 <xmx:qpYTYmg65pzDsDB_IgglLbtiVKfNdKkVfjM0dgBz-BLA7fdoSvO2Ng>
 <xmx:qpYTYsuRnRkfMkQd6_Lx7eX6yWL5ymznFhlNUOsfPtY5AVlGlBqUOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 08:42:02 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 1/8] drm/vc4: kms: Take old state core clock rate into account
Date: Mon, 21 Feb 2022 14:41:48 +0100
Message-Id: <20220221134155.125447-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221134155.125447-1-maxime@cerno.tech>
References: <20220221134155.125447-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During a commit, the core clock, which feeds the HVS, needs to run at
a minimum of 500MHz.

While doing that commit, we can also change the mode to one that
requires a higher core clock, so we take the core clock rate associated
to that new state into account for that boost.

However, the old state also needs to be taken into account if it
requires a core clock higher that the new one and our 500MHz limit,
since it's still live in hardware at the beginning of our commit.

Fixes: 16e101051f32 ("drm/vc4: Increase the core clock based on HVS load")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 24de29bc1cda..992d6a240002 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -385,9 +385,10 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	}
 
 	if (vc4->hvs->hvs5) {
+		unsigned long state_rate = max(old_hvs_state->core_clock_rate,
+					       new_hvs_state->core_clock_rate);
 		unsigned long core_rate = max_t(unsigned long,
-						500000000,
-						new_hvs_state->core_clock_rate);
+						500000000, state_rate);
 
 		clk_set_min_rate(hvs->core_clk, core_rate);
 	}
-- 
2.35.1

