Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D658864597C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ACD10E3A5;
	Wed,  7 Dec 2022 11:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377EC10E39B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:40 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 85FAC5C01EE;
 Wed,  7 Dec 2022 06:55:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 07 Dec 2022 06:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414139; x=
 1670500539; bh=Npz2axg7ni5/pXnzdbHAnJGDrMXGf+lZqvI4NKtz7EQ=; b=d
 GP6KFnH1Nod0i7Iw7lGdxQyTjRDhgMASUu4OYUPqfmCMCN75kMIySRdoIIOOX+sG
 l3i7vzbUfIb7rTuTHGKA18UdaUS+cJXzg/Sz8b0SSYPwTujd7SghInI+baZetV3N
 famlTPO6L6PUqqVnz1r6n1GDT+5doFQ+DfhDZLo76gRvJQdn+JMZOKY6k/j4ZD8k
 awbDo9K5oHMV7kKQO71LUK02Jmgs3fioedqlnu+beffgpcEkIP6A0G58JDqyouoT
 GhHmGw9/4txIXdHtrBk+b8f632PBU5stCOYoTtpdbHxtQHyhrTS96fex2knpfm/Z
 +D+SmOCWQLeTXHG8BGKmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414139; x=
 1670500539; bh=Npz2axg7ni5/pXnzdbHAnJGDrMXGf+lZqvI4NKtz7EQ=; b=D
 DtsbANV472ZiQfa8FeRD8INfcsKN2uP4bXX4MLJXAUJpFYbJ5w1gvQe+CL/ZMlkZ
 STmOQuD6lrj3VS6mBk8c50alCBXw1rCuXmjqdIZUZMzQ0oBA5ohAwLOz+mYsC4OX
 fuXSE5J6IkXlEIq8XCcfCYv4j1mxJFkhKAEROEIP8yBLmzHYx6hEBzkDK7yOMsO+
 dmRsfFT99JSL+VCifvgchLDvLVp/eo/k85dk+5jYm1qTAAkrS8IfV9o+UnilZptl
 LPlR+hrKIXjLgyU/YvCRldIRrVe+xF+Q5z/wTMc/goqy43ifUQ/4mYBHup8NMJtB
 5Am2u02xPC4HJfQhZ42cw==
X-ME-Sender: <xms:O3-QY-A94HW6GYbl1EQdLMsh9ccya-oZ7Jq-d9gQ0PyMYkKPA5hjzA>
 <xme:O3-QY4i0hzrTksZxWmJ98Iw7VbsHQCWpRwqsL43gfyt7yZNxXB32sDHERuwUCXhEI
 AuWB-z7R-ZoqfrzF2k>
X-ME-Received: <xmr:O3-QYxlmuixblY-whQyxCivxGSvPj0H1sP6PzIksGrQe2EuoS81qSXJOGs2g31w1gqgwF3wKveNSVjOnQXLs92vvbMm3YsCLBk7IMwq6Xgs6GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:O3-QY8xaB5XPItTOXZc-kyfCApBLgDByr91DYGa2zgaltq-pUGu2mA>
 <xmx:O3-QYzS1COjfYDRv4ma-UXI2W7ke-5LlQjJpxlTZM9eqhDa8RwAejw>
 <xmx:O3-QY3Z7WEN1q9hGBb_nd5aKDqkOj5x1BYRj4bp6gRA05MwzFD40TQ>
 <xmx:O3-QY0I82n61kuDlslVdSVqU7YCXLBul_Hcxu57ro4obrpGFuqwNtA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:26 +0100
Subject: [PATCH 15/15] drm/vc4: vec: Support progressive modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-15-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8XMGwt1sm1yn4PfStLaGoPrjbrnpbzbehFBDzRGb44o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6laqrtq0bivnt3ezDx1eVvm3OpBzhsej2/dFw57pi/Pr
 FajLdJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiFmcYGS55/F9mI8rtwaQ0wcFYaC
 ubW0n/8+KdUids0rT0Jmm4FjAyzJ2xnzMyyWD7heepzN83v5/SZMl6/MLRT9O+P2JP/mn0iRMA
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

The VEC is able to output progressive analog modes, but the driver has
never set the proper bit to do so.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index e270a4099be3..66359d0debbc 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -604,7 +604,9 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	VEC_WRITE(VEC_CLMP0_START, 0xac);
 	VEC_WRITE(VEC_CLMP0_END, 0xec);
 	VEC_WRITE(VEC_CONFIG2,
-		  VEC_CONFIG2_UV_DIG_DIS | VEC_CONFIG2_RGB_DIG_DIS);
+		  VEC_CONFIG2_UV_DIG_DIS |
+		  VEC_CONFIG2_RGB_DIG_DIS |
+		  ((adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) ? 0 : VEC_CONFIG2_PROG_SCAN));
 	VEC_WRITE(VEC_CONFIG3, VEC_CONFIG3_HORIZ_LEN_STD);
 	VEC_WRITE(VEC_DAC_CONFIG, vec->variant->dac_config);
 

-- 
2.38.1
