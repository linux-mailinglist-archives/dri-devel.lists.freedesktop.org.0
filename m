Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059A9D61D0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F28010EBF3;
	Fri, 22 Nov 2024 16:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e9QHAu4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F26910EBEA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:15:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DEEE1C0006;
 Fri, 22 Nov 2024 16:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LyuZSeQhWN8yZC/+93Agwlt6oIM4sNXPX8BuSmxPT1g=;
 b=e9QHAu4v5qpnH3/4lofPsTsiGR54lTrJosUcvFmA560TtHxRWVRC9Ap5u8fA3jkzjECjPP
 YToqXZqmHBWz0PeSEmkAe4GpSvtKP9CGDHiJOWUyHuShkb7X72qBcmOYwgMzza4cBZDxcU
 s/V5+AzIN6DzMYtGSk89tQMfOeXLNRbSokIcSuzaiKVlPCBpZo7nyeybElUuCDdi4RJnXt
 83d+hIYo7UtKwE5+DkqETIPJ2oYvorQU8ccxxCOtcyce5PJ4EtYWYHV/g9fMc+uBqSR7uG
 AdhM5HOWEiwVmlIsvgoQEPWwCS2GITAeEoCYFVO0n+TzTwcyWvatgtBKpeg5aw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:15:03 +0100
Subject: [PATCH v14 3/7] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-yuv-v14-3-e66d83d28d0c@bootlin.com>
References: <20241122-yuv-v14-0-e66d83d28d0c@bootlin.com>
In-Reply-To: <20241122-yuv-v14-0-e66d83d28d0c@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iDZ/HJ7Gex8d9aGNH0HIIVbXcYQeibofjLc/H+dZBcg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQK4HBuIoq//YMeeIKyGPMkM33ZY+HjZpEJQh3
 Bu/kYVjKMiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CuBwAKCRAgrS7GWxAs
 4lLgD/9x98VeLVlBYLzvcYfknylz/UYiYin/M4eKw0u3Id4wtMbCotQ97fejaUdKl5Fs3vOglBb
 eIS4U0dvS+4wR9C9OCszH8HjgNFa7G3dfwApP493zme1wQZFvf8G5PAeN/ETG5H3SBhuj1pc7qK
 9GLvtYDtxDcbAJLooSQHfGnfUa9AheIz2HaSWWuzioUtSXTXJgLZ/2z+nWReX3SRuFrabmjJA5N
 hFCn+g6CvWL94y7acnimmEa16UEkFwi0O2yTDQKRzXg7U19UXZ4TQ9SrKhIGEK42X1bVt3YYOHx
 ItQhzXqGn7eamWQP3DwvZycWHFDh2QdtvfIIDxvzTufVpEzAGU9s3WkAyBDf6G2fU8IPTg/AyeQ
 vsOLlkbMhJdzRaJh/bv8vxVL1WgWq9IvM44PbQDpxJ3yIxSeH4XXlcmAq3tdVExK9CTv8qAhGTE
 fmd645/Kl6+YPG/2R7aeBrhOgxkOXrBC9oR/pao6Z1GZZEGxgisFAbevBOyeap58NZMluMBOi/Y
 liGBT/VCq5zzrgsQ/UFlnTLUEm/fJdG4z9JcltROzNEnfTbkN0jEJCH2rTxvxtW3p9ZiIAVpyo9
 QKeJuFTppy3oSlVwTBwuKCe9U/CrDEGEDe0enVnpFBH58WRlTliKrCP250MOPcCPLEcdYImVsgs
 l+1CkE7P0l4N0bw==
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
index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..13b866c3617cd44043406252d3caa912c931772f 100644
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
2.47.0

