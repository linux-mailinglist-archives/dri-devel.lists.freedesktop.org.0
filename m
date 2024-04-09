Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D34F89D632
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315B6112C22;
	Tue,  9 Apr 2024 10:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="l5kE49th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BDA10F3D2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:04:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1ABDC0004;
 Tue,  9 Apr 2024 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712657079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P5KyQ86XhO4c/3+mfHw2niwhZfwjRkHxeV4U9txDECY=;
 b=l5kE49thnJ8IPQ9eWvCMMsRjMF9ggPVbo6CBNh53YyJnE4ecYuDpWb5yyF99Ym0dB81bwL
 YSpnD5hID1Xau2EC3Fus4/nK9U297/2DBbeP3kvNh2W5uJjA3cr6qAcUsYdc4XZaraHVD6
 A1q0H/42dGCyyjaA93fHCEZVEbYi+U4tRIsblYjAYqG/SxfEXuyqtOi2/tu2D+a7ld+FSh
 hndlFXKRruIDuyGFux31Ro4R+dOZQgWt2jjeeKaMxt61bNYcFs6zfX4003+PcdanUHj2w8
 RXzPOT/kHHObPlPdXSFGp0F98JfLCW0U2DfcCDQWx+1No5W/Trot5WPQP+4XoA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 0/3] drm: Multiple documentation update
Date: Tue, 09 Apr 2024 12:04:04 +0200
Message-Id: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQSFWYC/x3MQQqAIBBA0avErBvIqZC6SrQIHW2gNBQikO6et
 HyL/wtkTsIZ5qZA4luyxFCh2gbMvgXPKLYaqKOh60mjj9EfjDadaKNBY0mPNCk9kYMaXYmdPP9
 wWd/3A+ZwsedgAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=A9Ti38Ukw9P6xGFh6Uafw+LqnapiDQLHjycZFMYCGjA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFRK0BYQm4E+T5uIr0+BUqoaEiKB4cnuyp07Zw
 lslOHYVuLyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhUStAAKCRAgrS7GWxAs
 4h+QEADAbw1aGPIH/ZJAe6VyK24l2kQqCVjGqekjvcqxAGDaoI+Wum4ONRdb4VJ/94X8qdDGlCn
 GZmHFLpNBSVsgsNAI+5BYLjJI6I3u72OZAPGWN7X+H6ND7PrjHmGhN8+RRmG6oTelIxlv6CjhZz
 jP6a0zIyuMK44VKHDL4x/6dxSpboEwjtTqAEhz5VZ9awic7yf2L6maFgZZHfLnaz5ECwfyX9cy0
 tQmHIsA1+5yJbJzB7UVM9NXJzL0aLMxLtkC/Ya7u1urAp8uWOTtn6sD9rYWn0UtcM5I1STQLaiX
 hB5TnOaN5YYXA0VGW+/zSIDHdmG3qWvh3VtgU7+DKlEarKkxBH+IDKWDgJre6gcLWOqoppskW4V
 TRnDKXGcnwB7FW9H+m1OcZ0MIqt9GJeGc0AtB58IQCoyxj2720BFalKyzzVY0UX2X2B0vcPjXnT
 QrNCjfGCKtvpu8NSGpTYNiFjgQ3l37KHxvIL7SnZiPvFWO9d9oqy8ZP8E24h5VmbtMuNtR+F+5A
 StQXcdhzywdoHy2cq1Wj/4mvGWrxRUPjLFKsis6/a8+ktx7FRncFRxQ3AZxrb5irDTJszU2Y7F7
 ea4YR1UDUZbBm/sNvkTmpME0kl00fGX5WLnzpAdkkY84zrE2nQzeVP2X0us9WXZTEHju7JUZsY1
 WDtLWbeAys9vHBw==
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

PATCH 1 and PATCH 2 focus on the rotation property. The rotation property 
can be challenging to understand, especially when it is combined with 
reflections. These patches aim to provide clearer explanations and 
examples to aid in comprehension.

Patch 3 relates to the fourcc property. It includes additional details 
about block and char_per_block to provide a more comprehensive 
understanding of this feature.

Regarding PATCH 1, I would appreciate some feedback on the expected 
behavior. During a recent VKMS refactor, I used drm_rect_rotate as a 
reference for the rotation. However, during my testing phase, I noticed 
that the original VKMS implementation interpreted the rotation 
differently. Therefore, I kindly request that someone validate or 
invalidate my interpretation before proceeding with the merge.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (3):
      drm: drm_blend.c: Add precision in drm_rotation_simplify kernel doc
      drm: drm_blend.c: Improve drm_plane_create_rotation_property kernel doc
      drm/fourcc: Add documentation around drm_format_info

 drivers/gpu/drm/drm_blend.c | 57 ++++++++++++++++++++++++++++++++++-----------
 include/drm/drm_fourcc.h    | 45 +++++++++++++++++++++++++++++------
 2 files changed, 81 insertions(+), 21 deletions(-)
---
base-commit: e495e523b888a6155f82c767d34c8d712a41ee54
change-id: 20240327-google-drm-doc-cd275291792f

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

