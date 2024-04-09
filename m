Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8589D630
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0AA10F3D2;
	Tue,  9 Apr 2024 10:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TTF9k+Cq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82507112C22
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:04:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F9BCC000A;
 Tue,  9 Apr 2024 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712657079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KeTCbI41YllG2juL/zynve9f30ih0GcjJDj1DkPkKmI=;
 b=TTF9k+CqN6Ksz6VxHxTbdOKvgJf5L0YdBPnhe6wIzd7Q4XuP/W/S991M4aMsLkFvgjquRf
 xChLrPFym6WV+JiMhfGdSnjY0wLl8XpXiJZSo0P5gXb5OgTflnSWxwUuwZA4Oj1GpMk/65
 mDwNBrIjbkg8YlWZpTzMMByLLPYqi6nLSve0AuKH6IC80zQyQadEYAI2yxhY++pX+Qv+SG
 K4fd8KAiqNOaPrj6EqNHFlu5cerJzTDEDI+GqqDeRxsHfhOYy+5PUTL7lB41PzeEd+Bseu
 19WUY6Zter37MgVAu8nrXwboKwgVZONxffiaTPOGK/4xUJxWA/2Z3VlhUOgXFA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Apr 2024 12:04:05 +0200
Subject: [PATCH 1/3] drm: drm_blend.c: Add precision in
 drm_rotation_simplify kernel doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-google-drm-doc-v1-1-033d55cc8250@bootlin.com>
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
In-Reply-To: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=GnEAU3vkYSsIbjMvOqh2HX/HLaX5yQhIo1CxMvrQ8M8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFRK0T5sJ/qV58pufJn0nYKqJDIF72xUObkmnx
 5IR9gxtloiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhUStAAKCRAgrS7GWxAs
 4gbwEACFy6mN8LWaWNWfdR8fwy8cEvq+0zsS5jMExYL3bX2x+ZmAeyeGZ7XgiKzsyfqW9I+prA/
 SxCwXidtl0btXPXW9rjBAoIUgCG6pGEn/5PDMXe1ThdrGvhYUiKVcFfP+GoZwqmGm2TdUlfqt5+
 vOjGi4D+4mK9KmHXECS8gpl3KCP8zvdlr5WV0kRuWaXKWnNEO2hz31X+rp0c0XXxdd12gsAqocm
 k1m6kgxr3YWv4Utvyw2aKRftQBi16DEiaiAeO2qQ2ALqBRsOvQvcq/9preliWBbLx9RbOIxoL1P
 dzW+KLOunArMPjHq7W1AGHsrSjjMeaPL4TYr8UtPYNMAH4lKRH5MmwuxHsh0+bLonWBwe6IX92L
 V0ipY/5MjeRlcQfKCtLyVNfWblEeqAMs+9H5k2uwORjMnYOuOWa08kvtApV5hQ17DfrKBYHGOSb
 P8WML+UbgtF8RBRqd53HgSj+gD6uZoCDtYpZsRKcpTbcAiYDZOfYurNw8TRdWR51fmM+gheTfaL
 ePSitse5QkWlodA+6XFpsNCJymekxkYR6gCvwRILVhUv8Xpi4h95yGsWyzkKWfPTsehcr/sfsze
 Crzn0TmG526BDYUTpJe394pJg8ponoPrsoO/p1MTm706m1fK8ZB/1u5GWpDnPipa2nMsx5SE+CY
 r+xhRl/TZjAFH2w==
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

As the function uses non-trivial bit operations, add a little paragraph
to describe what is the expected behavior.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_blend.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6e74de833466..8d4b317eb9d7 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -321,6 +321,11 @@ EXPORT_SYMBOL(drm_plane_create_rotation_property);
  * transforms the hardware supports, this function may not
  * be able to produce a supported transform, so the caller should
  * check the result afterwards.
+ *
+ * If the rotation is not fully supported, this function will add a rotation of 180
+ * (ROTATE_90 would become ROTATE_270) and add a reflection on X and Y.
+ * The resulting transformation is the same (REFLECT_X | REFLECT_Y | ROTATE_180
+ * is a no-op), but some unsupported flags are removed.
  */
 unsigned int drm_rotation_simplify(unsigned int rotation,
 				   unsigned int supported_rotations)

-- 
2.43.0

