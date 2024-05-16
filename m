Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A798C772D
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008F910ED0C;
	Thu, 16 May 2024 13:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ddpa9f6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0397410ED04
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:05:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C316BC0003;
 Thu, 16 May 2024 13:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715864739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pbUUmy13w4guEulP+QztTkzQuy51RgJPVYnilwQVRo=;
 b=ddpa9f6eaUGQPFlHpfh/YMp6Mnw7lDQXi/MDHfDnn9eOaJNMrBGgsHVuVlRBkj/k8XgWjm
 1vMLG3549h0ZnveA/bfrQZKa46TS/+FPsihn4TtiSKtLYIm9OuLKF1ullGmz9JHYGxM9ur
 SuNfxazR6PkemdqfvTzdlTwfb1a6WzpqLiSKNFmjE9OLdmYcSvwfUgxiHNJY9sWCgIhHBN
 VC4/HyxX0DQj5kyU+uPzG2XKSBnwDftbdjCYXUBLJITIBlxu6FupxnQUnbD3b+L5GNsC2h
 u015LdC5LII80H+FAVkXZWO5nfMZf0Y/aKGEBtCbiAJpjwERoJwgX1p5sJUa0A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:04:59 +0200
Subject: [PATCH v8 14/17] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-yuv-v8-14-cf8d6f86430e@bootlin.com>
References: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
In-Reply-To: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=N9UhJoLZuEKa5YILFan7TkC9c/lglpLVoc0iCcUfoUg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgSCuoeB5CPV4k/B8Z2u6DHIONHwZvy3rwVtF
 oktcNw6MoSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYEggAKCRAgrS7GWxAs
 4hqJD/91SBexw17MtQT3uNnCai1j3FrxCnleqsfbP3ha3s31hZ91g/rtNeXEG/2oCEnB79y+Vlf
 reLV0+Mflqnn/uy3vaxZ5eGnqtV6Iz4mngwg/ZLBTN4vfgiqJrOLkFecoSTDbyaa3Zi8JpQI58R
 Q9L39bh/F+owK5CRM5NDCGLCMvqRpKNHO6DLVr3W5SqDrZu/12IIiJGPbBJfRV8I0WUJG2rXvDm
 Y4HBmRwEkMdpbhP0BUBi5qJE6nKSjlbaIeuxjKyR5vyERqd2WqYD5kB1VCd1UbXGg981KRwpAWD
 jDUrEYstAPMNObObNi3ep79B26/qMcDEMRD/nhjX71ZEN3kWVMkSS8vhhVrAelcE2f9thm4NMFN
 BgzSD4S7FvQQKXq5O78QhGYA4Tf5OT2yvqeV9C/ma0qONu8Csflaa5Z5/BihYY7gNp/K6ChEEwJ
 3KRIYUkINJEKTpGuRK/d5k5QgLixP70ILcNp/9qKe9vInkRtoiOccw8zVZXTs2qUvlqXsNm9dax
 0W5iakbdnDCqSSehplIpOJz+1EJ6Fnb0+4BvfnbvFp5Gh3eX5VCNNETv9iTiePy6sK3V4mCQ2iq
 OxEf4c0VtXlRciO/OgZ9W7ejXPrqw4ArkIN1y2HqtuiP4Aba9KMxHsn9D6WFoNSTb84iV5sQJO4
 ze9cXqeYEZexe8w==
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
2.43.2

