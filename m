Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D8A8A03D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370E610E799;
	Tue, 15 Apr 2025 13:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Vwqd5ErU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0CC10E798
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:55:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8607043B69;
 Tue, 15 Apr 2025 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744725341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPLsl1Wnw6xTV3qjhgNJ3a8w6kDKqvDpNfraRh10WKc=;
 b=Vwqd5ErUsBzVd7t+z9qx9cqu680AKhsz5XLupbchacHR+PFaQ89kyygFI4OKIAEujgoBU2
 eWVv4pSUUSHi61HWVTZHm67QdLvyQd3hNuj6VQgMLaQVQ21OXLPH0IMRvFA1qmuPfanybP
 L1E9eZYgdlU5e69SFzQLlHYRttShzMv+YKs7eXg5dtL2dKxAOKxUDIwcC3xJDzWhdpkKHK
 r0iQqp4vXcNVyu5rzhcfeH7xNWocVd57J0EEpG6VXSp61Q7WF3XeObCVucq2t68iAPbXjn
 0Q6JwrX96xs2tngNH7ailUS1D00dR033KHFjjHmqqHK7xEDwiDZw4SwpHsaPmQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 15 Apr 2025 15:55:32 +0200
Subject: [PATCH v18 1/8] drm/vkms: Document pixel_argb_u16
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-yuv-v18-1-f2918f71ec4b@bootlin.com>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
In-Reply-To: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5LDLsxCEIxV8itrSYorWjRJlHdMGvtxfdDaQVosJF28=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBn/mVW1pZvfvfZ/YRIJ902gTBR6UwmY6m4YZBlz
 F6GY/AZR1eJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ/5lVgAKCRAgrS7GWxAs
 4p44D/4spb4ytbTu1L+klIP4ICXGauN1D2c5PMTITVGjTtLO1YZbFWhDTkM2qlk/xGXHVplYuGQ
 D0D6GMlWUmaG/5otnETCpgv6PvRAhhRdpDCqJPPdWavT1mJnwMZ5KomhogrLU7YZf+VIMBRq81f
 N3LtTZTnP+5KnI4Cce90turkIKoqaC54qEuUXKu9SYFcRtAB5NtA+h5JHDpgG5P+oegz2sqxTzp
 uoFEHzBv5PXbDTVRjmMc7aTa7k0S+NaKaihVe/m7ojGQfLSh9eM5zFzSZs+1FqpoF9k/iGSwuYP
 RcIcgiRBzW6GHi1KLdsWdsevqEXuj6RPu7sPOyfTRUhjNgLT+ilAOul8DB1bZ21WqEutPzAx4HD
 i5xHXAiBFYbGphNq4KO7NAG+r+WLyvOoRQ8VOe5CqitbXJVIzpo8R64WPyprX4v5GIP5cqRJS9+
 S/cpbubiPKro6wqSQ7gYJKUOhMT4f6CYBlBmAq8BqdRndoc/xAap1OFmjZUMei9UguW2/1AmL5i
 lMe2eNZuPX6fTXsWJqn30K8rn4wRTX5FGd0l0KDJSkqN274+26K3G2CuHNnwfNCzdHbaUwdavON
 D3cA7uKghouNoDFdMFjs8+yBMQxH8HARXyJ2yNNerFE9n5OPJjpJ+lKKJ4Fepd1CTxHkCRzl0ZX
 xvzbWm3tC8vPnTw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtohepshhimhhonhgrrdhvvghtthgvrhesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepnhhitghol
 hgvjhgruggvhigvvgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmrghrtghhvghusehgohhoghhlvgdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
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

The meaning of each member of the structure was not specified. To clarify
the format used and the reason behind those choices, add some
documentation.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a74a7fc3a056..3b7b46dd026f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -45,6 +45,23 @@ struct vkms_frame_info {
 	unsigned int rotation;
 };
 
+/**
+ * struct pixel_argb_u16 - Internal representation of a pixel color.
+ * @a: Alpha component value, stored in 16 bits, without padding, using
+ *     machine endianness
+ * @r: Red component value, stored in 16 bits, without padding, using
+ *     machine endianness
+ * @g: Green component value, stored in 16 bits, without padding, using
+ *     machine endianness
+ * @b: Blue component value, stored in 16 bits, without padding, using
+ *     machine endianness
+ *
+ * The goal of this structure is to keep enough precision to ensure
+ * correct composition results in VKMS and simplifying color
+ * manipulation by splitting each component into its own field.
+ * Caution: the byte ordering of this structure is machine-dependent,
+ * you can't cast it directly to AR48 or xR48.
+ */
 struct pixel_argb_u16 {
 	u16 a, r, g, b;
 };

-- 
2.49.0

