Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AB63A2A6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 09:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4F110E2A4;
	Mon, 28 Nov 2022 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7F810E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 08:19:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B8AAC5C013C;
 Mon, 28 Nov 2022 03:19:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Nov 2022 03:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1669623584; x=1669709984; bh=D8
 zB4e+do9rRHIqY9H6l6OnPHtwa6fVAtr0SaXuL7ps=; b=hGUktcZVSso3ibcvqc
 pd1cr3qIcKT4IuQi0AW9cr52ArPN9LZMsR9tcDMBJOxemgSE+tc9eT1uFNylFz+5
 bZ7Gp1Uk1AoO6zX1VX188i0z58BXiRg7AfBeyP+AP0nFIK8mOjk94FE+r4cL/r2A
 mKttV3trMCiJDJTgGSBYuMUkeZNM3mYW//eR1ejEAZ/l4MtC+RLsnoysEqcWkLWl
 vVpy84eXXGQJiXfsfJwGSSLNQzTE3MKxk6NVLK9dw7WrOcHLvdAYC42ZR48QdkZh
 Z37md888uE9ERTWwMoyIk7qe4oKKO6RR10vr/38wExoDL4ohYAlSj5nagyDlgg5u
 cQ0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669623584; x=1669709984; bh=D8zB4e+do9rRH
 IqY9H6l6OnPHtwa6fVAtr0SaXuL7ps=; b=FirzTXOM9AmdidEZ182K8x+dUCxUG
 ZhVHlfJJYlEX+27ZvxhQFwex7p52Ye1L0sD2eSlkX53uxNA6/o5YxD4+AxdKtltn
 2fHwOH0CXenYqmqJV5une/z3XhBa73b9sYQakhONR/u2Qlb27ZN0DJjx6tDBvrhV
 Rrgbg9jP6h76K9Ipkr/vEsGGmj6uvtoVaJQlV9jgAUih5d99u/KIldeTH1KQu92t
 6YobF5/jum8v4SBHSHxZcgwV80WxTnRBBbQ+v6ZImDsK8t4d/9A/aS7DFntq6t2M
 ZKkPOHQ3akuA0Ce5XNqZz7SOS/W7xsixxD1feqgpIEt8t2aKge2iVUuQA==
X-ME-Sender: <xms:IG-EYwwUMyFVCH8dgIu39UeTRGKwWMHmlhJgJcnYlXYAYjHZymADwA>
 <xme:IG-EY0RtyDHA8kKpMGMA123rdrGksI0g6guSchdS5k8Oe3K2YI5HKY-A9Zjfp7oGP
 uek8-l-tZPPjFGeC7g>
X-ME-Received: <xmr:IG-EYyX2ke509AjsKiBQjPJTeJ7ppsLstQKlbGeaqGY_Yk65iQ4ZMHqS11PGQ2xkf3AiWnapiU8QI5_JRNRkbgzQx_GT0sFElRcmRJL3qVa52A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedugdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IG-EY-h3SvzgufZ2kLikyf5F1Ggb_gSO_hKIv9-aBQVSJeDuT4rVow>
 <xmx:IG-EYyBCk0l_2lRBct31nLsoM0vRu-6mhL1xH1F2ID71ug5UxppQIQ>
 <xmx:IG-EY_KDgtexSsvjchZH5DYj9LaDkf0kyNydU0-arrcIyhAECGISgg>
 <xmx:IG-EY-4v4bU8Ze5FpzD_29oEWIXCeZaSTqUWcMHSmYkS6fXjlYg8xg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 03:19:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/3] drm/modes: Use strscpy() to copy command-line mode name
Date: Mon, 28 Nov 2022 09:19:37 +0100
Message-Id: <20221128081938.742410-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128081938.742410-1-maxime@cerno.tech>
References: <20221128081938.742410-1-maxime@cerno.tech>
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
Cc: coverity-bot <keescook+coverity-bot@chromium.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode name in struct drm_cmdline_mode can hold 32 characters at most,
which can easily get overrun. Switch to strscpy() to prevent such a
thing.

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527354 ("Security best practices violations")
Fixes: a7ab155397dd ("drm/modes: Switch to named mode descriptors")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_modes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 699c66e54668..be030f4a5311 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2316,7 +2316,7 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 		if (ret != name_end)
 			continue;
 
-		strcpy(cmdline_mode->name, mode->name);
+		strscpy(cmdline_mode->name, mode->name, sizeof(cmdline_mode->name));
 		cmdline_mode->pixel_clock = mode->pixel_clock_khz;
 		cmdline_mode->xres = mode->xres;
 		cmdline_mode->yres = mode->yres;
-- 
2.38.1

