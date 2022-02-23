Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E67F4C10D2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 11:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E533410E67F;
	Wed, 23 Feb 2022 10:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA5E10E66F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:56:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 675105C0153;
 Wed, 23 Feb 2022 05:56:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 23 Feb 2022 05:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=B/S+5pJTjISbVKXDbmkZvJslRN2Aa6
 NU173g50j/vbU=; b=GaBwn3jLrwRlgVb3TQnNczA72rlHpkyQuBIEkv9sX+7+wl
 oD4KZGh3UDnBBcW3yvp9muv7M6ckIGWKlWkixLzm1Gr/9TcD70CiEXDR0fPH7jl+
 ivhqldwEwCK82doRSk9Ov/mnX3kW0B7jm4Vi8gA8o7tWwsMjCuf9sV6txsQc/MLh
 rH0gT2z2F0ddu7ma+1hVi/vyEh8YioONK1XNmtRzbQL5/rytoFvEmbY/HjnmuIiO
 TY2SaztoTbl4IKNXKrt+JJT4cMhJCQ6qvJJskcQhl8xEYt8tTncYrn2HyYK1qBRq
 Khk9ClPMJiqJCgTHamMV+7uwGyjCQVoOtB9bA8Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B/S+5p
 JTjISbVKXDbmkZvJslRN2Aa6NU173g50j/vbU=; b=PeJN+GMYjV67kRx++a+UjX
 NCDcQbR70B0a5owlgPdUX815sHRjgM7VFlSAgoPUjXDib1kHuqXJn5YSYlCiMH5K
 p97xB/pJyL6zaEczaP2bcEgIHF1M4mp5tCevtv14LoRIs48H4zhCaYCa0ijRHIxV
 p+rZv8t4AmjIplSWvR594m+XA5fDLU5oXvzTm5GkLpMx8kFr5pFUxfWNoHODFoSh
 yuWy6JuvU7u2mKjTKWQGG+qIvW7j+W+P6U1sPloxdA98nOaQ9Nde7CQF8mwddyi/
 UUxHUwGedRsrM9y44fvCvVfTCr4sBm802WBuPvvaMU0AG/2ly18+hngWS4P/DYIQ
 ==
X-ME-Sender: <xms:3hIWYq8dBgifeWnOScvPTHx63UTwTheYztYMfg7BBuxwOsP8fqez-A>
 <xme:3hIWYqv5j1BqQQqggSP07rZpX0RM3McAmyI-zzB9X3vIliu8jIJy70KkeRo2WTrBh
 G4cgZahUoP7lpSr85I>
X-ME-Received: <xmr:3hIWYgBIoRK6v0-myzmRRUvuRaMjN0Abw6BkjrUIOnfxTDCjDcqbDJzKA38XDYlIYL4xbkG88VzVYmoKk3z_uDLUt7LxKRhKXIc84X8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3hIWYicUP3qoxkRGYNmyXaBdqm5Qs5o-BZ2vL8C6MY0fN_FThzX3ow>
 <xmx:3hIWYvNiLlsO2cSEjMmPY-ABCUKATk_sO6jFmagI8-CYVFk_r663Ig>
 <xmx:3hIWYskPkfLbCybM_Pqio1qMpyLYLFM8v3On4MmIbyGeITsbuKNmxg>
 <xmx:3hIWYqdEZ8hyByb94gBRJtu6arp4gaZRYPPMpqb4HdATia_9B1DoIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:29 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v6 12/12] drm/vc4: hdmi: Remove clock rate initialization
Date: Wed, 23 Feb 2022 11:56:00 +0100
Message-Id: <20220223105600.1132593-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the clock driver makes sure we never end up with a rate of 0,
the HDMI driver doesn't need to care anymore.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 92b1530aa17b..21aff3ad96cf 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2576,19 +2576,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
-	/*
-	 * If we boot without any cable connected to the HDMI connector,
-	 * the firmware will skip the HSM initialization and leave it
-	 * with a rate of 0, resulting in a bus lockup when we're
-	 * accessing the registers even if it's enabled.
-	 *
-	 * Let's put a sensible default at runtime_resume so that we
-	 * don't end up in this situation.
-	 */
-	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOCK_FREQ);
-	if (ret)
-		goto err_put_ddc;
-
 	/*
 	 * We need to have the device powered up at this point to call
 	 * our reset hook and for the CEC init.
-- 
2.35.1

