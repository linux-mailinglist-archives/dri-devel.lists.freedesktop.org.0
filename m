Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC1B4BF921
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78C10E64C;
	Tue, 22 Feb 2022 13:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9477710E57D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:19:21 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CE59F5C02A7;
 Tue, 22 Feb 2022 08:19:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 22 Feb 2022 08:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=B/S+5pJTjISbVKXDbmkZvJslRN2Aa6
 NU173g50j/vbU=; b=F+mdGpaG9z3fetPwFzIGTrYl4fAJg6HGc6CMNahQq7hbpW
 8A/3QNlNKXv72AIkfsdtqnaMRB/PwaEYFLIlv1f8zGRC7rFEqdpT6bKgsUZPfWxR
 tZ3RR56vMnRpoFU+GfaNyedLUWn2Dwst4rakShI+apbfA54VQIG5DXeJKhEV4WJ6
 wJpdLhZ3gK5JyRSU5PwZN0v6mrAaUX2jjD0nwYBOgzOR0DI7/itI9tOPKiV7w95v
 qv4FVM82t+UAUkRHTZpVREcl1jESBUBkUTbOkAGLfWlw3ppPCPm6clKArWbJRNWL
 oYBjs60iEv5348dB5jSzOAsaDW0yZAPXvSzNG2TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B/S+5p
 JTjISbVKXDbmkZvJslRN2Aa6NU173g50j/vbU=; b=LBuLf4LcU6W9IwF604VwVp
 q0IPuJ4EB4/nZOKdBKIlLOb+T1PuHbHkK7tvsyHm/RJBSKHbo4DuemgQeo7fW2cy
 P67vVdTpEaR/k+P20zopYY7OpcWW7efQssS+3lw+Z7kiRClq4WO+zm9699H6y+W6
 C00PcsejnOWJ0d6dcXuHxXGnSy3FJ0jBFmJwIk/rxcUGBMFHZqdQTCa67hKVst3z
 GIcCVurM5VM4jk2nfXY8rVDXFGwYhaI+gKhmoU8gZF0uKQ35rBXEIK7kodOKWxkx
 VxoIZwCjx/eZtogsS/Dxz15y0Wm7KugwyEeLokHo9cOXCnP4unixSeEpYwWWCdng
 ==
X-ME-Sender: <xms:2OIUYi4gQL5TSgCFgM64Bo7r2JoGqMSNdTb960lPIxCqMefQcvWK0A>
 <xme:2OIUYr4jlXTRp9lIqx7eb5FVYrDqBdurA4c1qXDoW6_qqr1FL77WH4WfKark_AU0m
 DDYC9MM04O4uNNn-P8>
X-ME-Received: <xmr:2OIUYhdEJVDCGWBNT52YOmvsWhz4G20qR-CbZVHbgKMiwGRrx6PcfDWn2RaC5iAhhK2XxaUHIcueuZ-Xev8rEtBRT5FlodXiWoV9P-Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2OIUYvITIpeMjWTzHoXU4JTekwS3Z3giRRNTrcbANDhzLPLyB4SbQQ>
 <xmx:2OIUYmKuyXJ32u0XLf8dqSDiBNtEJBG9PqN2mnGI5kOksGYoC-S8HA>
 <xmx:2OIUYgzoyVEXBiYpNi-4L8B9E5lZ5lKTIcMlKshMJ0LGQLk2D839ug>
 <xmx:2OIUYnoZpygPWOtHhUu_QypK5MImsedgc0icwvrUkgyztKG690CipA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 11/11] drm/vc4: hdmi: Remove clock rate initialization
Date: Tue, 22 Feb 2022 14:18:53 +0100
Message-Id: <20220222131853.198625-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131853.198625-1-maxime@cerno.tech>
References: <20220222131853.198625-1-maxime@cerno.tech>
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

