Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC97A4EDBC9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F6210EEE0;
	Thu, 31 Mar 2022 14:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCDB10EEFE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:37:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C14265C0210;
 Thu, 31 Mar 2022 10:37:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 31 Mar 2022 10:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=jm5IKwIbXDkANdhso+frVJ+FbR6Nkn
 bfG4zVfDUE5dU=; b=ShsHnZQL/9gntbL3rXprcB+Ob/HLOvK9roFQZWdC5YCiRb
 zsvlITAmCuekRvYbjXjuNoMXIjBooy+GuerQPMK7MPJhNfD5gwylB5lX8gVPpCaH
 hs3/1Fnm5o7ga4JHfL8uXHdjh/R3+HXx4cT9mgA6vUp8OW9HZDCapNPiZF7tXosd
 IxxUHQ0D4D6kC/kbBnfb2fcUxSEmmzOOJ0ufni+oBv9HZp4JZLgZnP5480kviNIC
 x7dsXahrFJ/1F1br/hnbc/rEd0zg2FolDQNUmeSITwMDjKUl1aQY/+4/TW8LIYix
 HyJkruio22vDYCnpGNAhTyk1n71pGj0NXWSN3cZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jm5IKw
 IbXDkANdhso+frVJ+FbR6NknbfG4zVfDUE5dU=; b=WAnPKbYYBLetGKwqBT/VEn
 Fm9MdXf6aT6kPy7/upJsxJU7hcK3tLFu+diRE+Fl51rAHIckZfKOjNqPowtpIVb5
 5QOGYa7sm/dnLXLgjM/rbu8FFvXA8JLgIMe4H83eFsulKydJiObDAchz0yZbmTIS
 VnhBluMNbo5bC2w3Gw6i+3GmK/erQsD/bCUDXvSe6nP7w7LIWcFjMmAAa9WeJF4Q
 GIBUnxxIOeOzXJj4bT+hvPEU6kP7919n28DP4HvuEVrluPLlI/BIkKl+rf6xQmer
 h1OWMlingCzTHplr/bitebCvMlhcNrlOmRM7iTZfYAtQwJTBZq4Q+Q7Mu4ko2BNw
 ==
X-ME-Sender: <xms:vrxFYiMoe08zEH14aJA7ljCi4jiYqTvvZdn0jG6BjFosR7ECZKRg7Q>
 <xme:vrxFYg-luR_5flHckn1nGC8BXH4CQM2AAqjeQ_IM7w8Dfv0cGwjprt4KmEVxYDNZJ
 7ZSNPNQfvkVIP4ZCHs>
X-ME-Received: <xmr:vrxFYpQZi29sHKa1kun6ZrdiC4O8TxjouoXJnKqMq7SXy28L_ufmnooOqPuDcgiGfuS7qbCAPNyw6QKi1cLYl-c1KvWnDf1rhwb-GwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vrxFYitIiKgfbEb3o5IVG4usDIREEEmnFn-qFm5-f2kqJZeiFJTC6Q>
 <xmx:vrxFYqcgxUCg88gfydtHF88mHP2nADEG3D_DMbu3JcG--P9oX0jpNA>
 <xmx:vrxFYm2NHxxSBh4ehTvE2VIxTbRvxMs6s_DImsHCkXVAF_ddd4WmNA>
 <xmx:vrxFYp6Uyi609rbqT2Rm0T0prVs9rwGZuWAa3DC3ZAK2tAkha2NFqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 10:37:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm/vc4: kms: Take old state core clock rate into
 account
Date: Thu, 31 Mar 2022 16:37:38 +0200
Message-Id: <20220331143744.777652-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331143744.777652-1-maxime@cerno.tech>
References: <20220331143744.777652-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
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

