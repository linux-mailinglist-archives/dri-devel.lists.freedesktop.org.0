Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542DDA2CA43
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 18:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7963E10E0A5;
	Fri,  7 Feb 2025 17:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hnHtEVv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05E610E0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 17:35:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EC09440D9;
 Fri,  7 Feb 2025 17:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738949732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4ZUytWx1X90zILHzGvQK2F6yAceU2vb6VYDGKjKPPRs=;
 b=hnHtEVv/UDBt3jbjcFlewBQru7TPTEOvfgKEho/fpfT+0YcLD8NxBaYSPR8RgUUB7sOCWD
 xUZZriO0J65ey8PhHHWswIeWT2sjJqW5o1ChcY8RXS+bwaLQSMA1ih1rkONQostZdQLdVH
 LW8CnA5lzULRutTXICWX+hP7nvOZBZDVlOo6wxOe1GNyXo4Lw9QqjzraDksKIyQ7R29Pkz
 npXi1Iyfg3V8ENUTwiceVUT/rm+hCChdYtIzrE4WV/yJ07fPU03IQYP3xaXYFBv6gvyOEu
 QZAB/hA/ftE8n3x2h5PrXpWTucgG5NUY3NlDy/A3yniktwpWJFr+XCZsvjWJ+w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 07 Feb 2025 18:35:22 +0100
Subject: [PATCH] drm: writeback: Fix kernel doc name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-b4-fix-warning-v1-1-b4964beb60a3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFlEpmcC/zWMwQ6CMBBEf6XZsxtLRZvwK4ZDKSvuoUV3q5IQ/
 t1G4m3eTOatoCRMCp1ZQejNynOu0BwMxHvIEyGPlcFZd7bOehxavPGCnyCZ84TtqSEbvL34QFB
 PD6E6/4TXfmeh56t6y17CEJQwzilx6cwoCRNrPP4DZloK9Nv2BSd9kieaAAAA
X-Change-ID: 20250207-b4-fix-warning-431e0a7067ae
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ZSeFJ5s7h9H4h1vWKcrHDe486NE/gA0glP6kRILFSiY=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGemRGKjbMj3X7Wannq+Fl7bfXN77fGzJAJVdWt0UaANvNaiU
 4kCMwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJnpkRiAAoJECCtLsZbECzi9gkP/RK6
 wb9QjbIg6RWy4wiN7Azfp8hSE7F6Q85cNVHoX7HJ2QFRZkwFfwPco2wjOA89Yhp6fTDYSzjT/Bw
 Bd/0QGTm/B4Sn8h+/Hhm9Y4lbQp72H6c8mV6CVelwYa5Mc7kpp+NeCh03DpkARcnYHaOJa28Ufg
 AKOwHL/VS4V9HhWXDw3ZJbI4mjG4usIYLI2fxYGZT7ziDVbUE8f/A1JkBHQCKVsAAB/DLWEmvsR
 gOwQMcmixXyasEh8BYluea7DteGesJBuvRPhh4mwKHxIhlV8Y46Ps6DrNr2iKpwRgX4gqIwbdci
 bZ0XmAvvc2J3mvXIgBnLqFho68Z4L5w1h/SxS6fkVcTYipx0H1lUcaWKQ8G1G33vyHM4Aw832tk
 +XjnhaScH4tJTcnJINtjNFkT86ga/tzx5HSUS5xx0MZTdOWVEskI6+IC2x/cvM6t3ZzIJ/zXD/a
 REHd3LWHfmWoO0B++wgT1esJoSLsESjjJ/7hrb6G+KD/YM8CL7Ldj6vpoKeHhGONkZcCHun14Ua
 AKOpDcPLLJ0xAX4L7OI6zoCYV6rOf5MPOe+3pmSbIoqHmSLVi8AVyeU85AeT0KzwWqlbKml5XDE
 t8aRvZ6G8+87jqbK39NbPkNWdXEhjh35CfOknMY6zfbc9VIkG/gOs3lf2IySuT9R3pYj5t5Qy3W
 BLjvO
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfehtdejkefhtdetfeetgfeiffevleeuvdeujeelveefveegvdejveehheffhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepthhho
 hhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhm
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

During the creation of drmm_ variants for writeback connector, one
function was renamed, but not the kernel doc.

To remove the warning, use the proper name in kernel doc.

Fixes: 135d8fc7af44 ("drm: writeback: Create an helper for drm_writeback_connector initialization")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20250207142201.550ce870@canb.auug.org.au/
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Hi,

I don't know the process to merge fixes for commits in linux-next. If I
should apply this patch, where should I it be? drm-misc-next-fixes and
drm-fixes does not contains the problematic patch.

Thanks,
Louis Chauvet
---
 drivers/gpu/drm/drm_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 3628fbef77524a7390b3929896a20f1c0a82117d..b14dafe765a148bbde70fcfd1a49cfea9baa9fea 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -213,7 +213,7 @@ static void delete_writeback_properties(struct drm_device *dev)
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
+ * __drm_writeback_connector_init - Initialize a writeback connector with
  * a custom encoder
  *
  * @dev: DRM device

---
base-commit: 2eca617f12586abff62038db1c14cb3aa60a15aa
change-id: 20250207-b4-fix-warning-431e0a7067ae

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

