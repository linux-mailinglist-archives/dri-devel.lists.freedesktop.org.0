Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05AD5853F2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AD9113994;
	Fri, 29 Jul 2022 16:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD52F10EE19
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 35C1C580958;
 Fri, 29 Jul 2022 12:36:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112597; x=
 1659119797; bh=QyYw7OCb4iELB70lA7+S6FjFkfGV+YHQwCHgKMsUsIQ=; b=o
 TEzK8SIfcfoiY5x/7vrn2J0SLTvfDUe9zeNnud6vRk/aGuw7w9k/1AOHMhymZlju
 6FReCAdJHFM1W7mPtq4l8lXDIvSdXz9YDZb0YLGGPglTQeLdYbATPYJ0FGiTgHL2
 v41xpJ2nE5fdoF1GWEMPSjhoT2Bk1nJg8QkWwiSx88QMUPqrcUzKndCRybY38PZL
 p1R7oYDxvscuq5GCmkFNf6amk/+qfLmiSe81wcAmrmqfX46TsumvO9iGFzbymuMP
 BY7M6uB1//aLX5SC7/oP7OIeBQdi9/ezLc3yQeWeSC3ESu4a54Wd7636+MmiXCC6
 6XwDkrVA/9raiViYSGoOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112597; x=
 1659119797; bh=QyYw7OCb4iELB70lA7+S6FjFkfGV+YHQwCHgKMsUsIQ=; b=B
 85luZFUzlSjbjkxCLpZK/eRh/Npt9arGV9rg54cWMrcEqgBmYxgrrS3+D9GyaAgL
 9TH+imU16EKfhHyjCy9i2A2hfE18C6PbJSJQU8wdijRD19OsOTbOHbWmuiFqzDuV
 XeJ+EOCKEl5p6e74K66ksxkpKDX0mxUakqMGMA1+xruxsOr94Y9i7WFadgk8lZco
 2lr+7jc6RgVGj3uz9lBF7PaqIUqW69l49hu2gNdfCzow8l/kBu5cKYjktCm8V/ro
 h1TTZdqFZZCprsWXvo5rXb8A8Xh2eRR8Rhgh3P23lyHSCzbLA57QUzxvrAuwo09Z
 Hscz9lDwm6SHuET/KWW9A==
X-ME-Sender: <xms:lQzkYp50RjTXD5pUzaaV2WIPDkjcgBakSc7eCVOwG5dU_-5tnR1tZw>
 <xme:lQzkYm63Y1yhmpH8HVNUrmlVXJnuAg3B3C6L9mUuPSV6H0VzdvZr0883JEC-abtR4
 Z7LrJnCQRGYnp9rboo>
X-ME-Received: <xmr:lQzkYgdGCmLSKyuE8xkVdb2Wqvy-xCr-AqDny5Qe0WihLZx2Fh0CMLUbj5CppolKij4mjKhMZtNkTi1zg4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lQzkYiKHod5rkBwOqjUv25WZXErCsuOGtoF-N15UYBbawI1ROksWGg>
 <xmx:lQzkYtLZyjXqVMbaPyCAqicguZRcNIMgjwFikQhQfL5vh3VzLkr4sA>
 <xmx:lQzkYrwGkJFx-MvOlNYcle4nIVCAFzf4vIKOaLwaGEc2zceqx5XZww>
 <xmx:lQzkYq63B9c3UR0v8AmD1NnJSdSERIQzPtQQb0LbCrUda1Qc3kjWog>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 19/35] drm/vc4: vec: Fix timings for VEC modes
Date: Fri, 29 Jul 2022 18:35:02 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-19-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=BF/F1zqV7xnXUIXuBsatYgDnOOiGXWuOYvkpiq7EQDQ=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHKrS+pOu3CznUuw6v3rlZC6799G+dzztqgdELnqP/7
 ezc/dZSyMAhzMMiKKbJcF3xrxxcW5RbB82EzzBxWJpAhDFycAjCRov8Mv5he1r+Z+X+GXb3U25Nf2X
 U+xT6+xc/NdkbTcGlN4g9PTUNGhg2xvFYHnJ00ygv3NfL/1S+oySjXvPw5POj7I8vT12f9FAcA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

This commit fixes vertical timings of the VEC (composite output) modes
to accurately represent the 525-line ("NTSC") and 625-line ("PAL") ITU-R
standards.

Previous timings were actually defined as 502 and 601 lines, resulting
in non-standard 62.69 Hz and 52 Hz signals being generated,
respectively.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a9fefd92f0f1..8f30a530b2d5 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -227,14 +227,14 @@ static const struct debugfs_reg32 vec_regs[] = {
 static const struct drm_display_mode ntsc_mode = {
 	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
 		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
-		 480, 480 + 3, 480 + 3 + 3, 480 + 3 + 3 + 16, 0,
+		 480, 480 + 7, 480 + 7 + 6, 525, 0,
 		 DRM_MODE_FLAG_INTERLACE)
 };
 
 static const struct drm_display_mode pal_mode = {
 	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
 		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
-		 576, 576 + 2, 576 + 2 + 3, 576 + 2 + 3 + 20, 0,
+		 576, 576 + 4, 576 + 4 + 6, 625, 0,
 		 DRM_MODE_FLAG_INTERLACE)
 };
 

-- 
b4 0.10.0-dev-49460
