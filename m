Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF177870578
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265601122AF;
	Mon,  4 Mar 2024 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Xk4J9VU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B241122A7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 551711C0004;
 Mon,  4 Mar 2024 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mJQirOrh5uVlCQFN4AJsimww+6ayqe/xDiVoFk4V7I=;
 b=Xk4J9VU+pc7nMsKkFc0PCYSd0Uqy9K3tIKHRaV9ewrg7Rd/qEqHMCcMAqJwVa0TJrQBvHv
 O5qS1eBGut0j3WSf/UTmr2wj14SPT7Jk1i9VTvjeXtBhWTFwMtBJUUui+IO5qK8pka6HtC
 6GDy5CUmLD38yQeF0vBcmShM00uM7kyvIs+wOg3HcntYmxLo/PhTQzpIF0AWBtJF7vRJ54
 uwnFE6i2rnLbj7o18pUl2Aue6N9hK5xhibJygd1Mbvyr14QIvUaWl5w1pD+V1zARik6sjZ
 JhvS3EZZfOmfZJVWdYs0+sN2wwV+ngs7RvKww2OeuXT5NoHCETjIlsXcQWS7VA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 04 Mar 2024 16:28:18 +0100
Subject: [PATCH v4 13/14] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-yuv-v4-13-76beac8e9793@bootlin.com>
References: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
In-Reply-To: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cRkkP1b8eceTuEm0QTSGTTTnDinaYzDjRJLok06bIiI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl5ejN9NMOsH5mc7MJuPKBhjpy8/A2Pbt9HDaq6Wzi
 tKnejwmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeXozQAKCRAgrS7GWxAs4pO2D/
 96UYBmCNnqyEt/7G+7haOSQC/qglT/fzK77FF2xMd0MYFlrW8XGXuE9aq1Rj2QiCC4jTgVb597PaUU
 lkvUu4GKnfyBePKMCOEngZOWsW9duc0+Cqm6G/b9AoRAbQZQEU9t0Eb2XGk4LbcLfeadUdTAIan36B
 gKqFdJOFuNpJJog6MKfDjQxe0JzdVyiABSvwxCq6AfYO2HILZS2yqKcIA6ZdtgIYdm7mDvWhihtdyI
 gn3YmeNO1qTV9YKKI8b9BodFr3oe7KBAR1cwWNJD1E/8hQRzZWqmImfPWHyxBSHqt3tYgqasjMs+4X
 6sGev7z6CmlaP2gVNcPvMPHj7ksawgVJ1dpwTakCGwDH32ayeoMC4wHlSo5XF4Xjp0MpS7sb3pFFPa
 5moafTrnNTvxUGBDM04aLF8cqjwwhbjYaj20Acg9eQU0soFYDClKAqu9mfZpwd+7FtGqdummT+NkLE
 Je5GrodyuEztOMlaffvVuLENBoTEmhsNGOBp41iYqbE9zPcJ9MS1DJ0rvImgv3muTMni6WluE/PMlA
 G8Bw1xFBMfuGUHaUOHV9acOEFsaJHM8tm5cL9Q4euG1jakI5E5R1TGgetTVjgXpB5j3mQ2Pf3RF6JT
 4y6m5UCHAePgspKzh99ycSK6R0PB6JMHAPZmQZsfluAKQ4CQBGiqKPHchDzw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arthur Grillo <arthurgrillo@riseup.net>

VKMS has support for YUV formats now. Remove the task from the TODO
list.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ba04ac7c2167..13b866c3617c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
 
 - Scaling.
 
-- Additional buffer formats, especially YUV formats for video like NV12.
-  Low/high bpp RGB formats would also be interesting.
+- Additional buffer formats. Low/high bpp RGB formats would be interesting.
 
 - Async updates (currently only possible on cursor plane using the legacy
   cursor api).

-- 
2.43.0

