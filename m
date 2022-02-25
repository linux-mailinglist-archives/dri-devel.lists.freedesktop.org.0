Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC6F4C47A7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4695310E6E8;
	Fri, 25 Feb 2022 14:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE50B10E673
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:35:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 174D05C0138;
 Fri, 25 Feb 2022 09:35:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 25 Feb 2022 09:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=uiveBeYnqGcqK+zu9ioOaNZW1ydXbC
 w+PmOS3Kp8raY=; b=BfsEUYpd4BiAiEIcB4Dt4XJil8q0OsRcLJhm6Vg3L2JuIE
 yDq0V3FY135nlLY9SbcTZ5tf+bhUbyjXIbj7BVW6jp6Cnu73unJ2RHLH64C3lWBz
 Tbhu/fBHeb/czU8aFh6bT5hztqLTiHzP97IKwHDou+8xhLP6hYLQq0sX/HXVOHoB
 fbnl8pPOiIPUL7g6hauKEX08pVSBMIvBxfdt1v20XlVgQTc0sKlhkG/ABjrm+eg9
 6FO5sJyYJPsnFDqVjtdAHnc5sYTNiCyaDdOZoThz/eLXFZxcDYwo0dk99nEe4epw
 5LaOF94MNeJePwn4uVbKw1fVzwIGSThzNlFLoigA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uiveBe
 YnqGcqK+zu9ioOaNZW1ydXbCw+PmOS3Kp8raY=; b=j4gb2U1+YOobIkUw1t/jHx
 EVQQzoJtMnp2owNYKBUmPWx7eCx4dJUs+4yhgKV/zFRnxDXAqQCNyeorWEIPBlFn
 TEFcjUjq+Xcf8Jo9/2vO+eKKUPtL8oXlM5jRJb0jMBQnPWSPILSIBtn+7GdwEcdl
 kxScdxHSrf98qAHJzzuqAPkd/RoAJGDv0v+0IBkX6JEB+dkMlCf9+dTPgHm38Jq1
 vV7gaIZTKq1YILNpGcPJZ++Ds4e/imWr3Nyf1xDSJc90xl2DDNhAUkF2tvq+Cjng
 DvBab47l/UVWXGVvCF0WH1WjniiMHiTYgQYtZGOKOUmX8REbVEiQigfhtKdutNmQ
 ==
X-ME-Sender: <xms:TekYYrzHDtG5mYDU5GN6H3e0gL-VYK9DWeu_fDAOlQKiWSuCFF5TLg>
 <xme:TekYYjQPBLzWu2_SFv-aQ7MAgAfiZgnxQ5NueK6Y81bh6eIA69pqHAB_GcWi1vxUA
 7B1hBLhF6E1LpOkWfk>
X-ME-Received: <xmr:TekYYlWJs8ao9c87l-JZhLWP8EIimQWOPwgnoUe0eBJmO1tmkzWYfxq4K4Hx1B3r9L7SfVkS0k_eZ8pxPEi_GRaa9DBeYfR_ind6VGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TukYYlhDE33eqWEPz5DEeAxCM6q1pgsY_bWvlpBcYRbxQT7GPnr7uA>
 <xmx:TukYYtCAGDGOkn0fXJCwZaA7Ah2EtpbLSgDlTBscTsmr4FrrNw09lw>
 <xmx:TukYYuJU0IsT1n1aqTu2fTHA1xZWkI7u0fmfpUxFvJCyHtHniIO0wg>
 <xmx:TukYYnDOHxvy_dEWSYABwazl388hTbubKFHIVm1H1ntqho1ET9QJPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 11/12] drm/vc4: Add logging and comments
Date: Fri, 25 Feb 2022 15:35:33 +0100
Message-Id: <20220225143534.405820-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Maxime Ripard <maxime@cerno.tech>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS core clock isn't really obvious, so let's add a bunch more
comments and some logging for easier debugging.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 24de29bc1cda..6fe03fc17d73 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -389,8 +389,15 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 						500000000,
 						new_hvs_state->core_clock_rate);
 
+		drm_dbg(dev, "Raising the core clock at %lu Hz\n", core_rate);
+
+		/*
+		 * Do a temporary request on the core clock during the
+		 * modeset.
+		 */
 		clk_set_min_rate(hvs->core_clk, core_rate);
 	}
+
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	vc4_ctm_commit(vc4, state);
@@ -416,6 +423,10 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		drm_dbg(dev, "Running the core clock at %lu Hz\n",
 			new_hvs_state->core_clock_rate);
 
+		/*
+		 * Request a clock rate based on the current HVS
+		 * requirements.
+		 */
 		clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate);
 	}
 }
-- 
2.35.1

