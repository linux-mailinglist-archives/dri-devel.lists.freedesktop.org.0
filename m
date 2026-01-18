Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52ED3956B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 14:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614B110E0CC;
	Sun, 18 Jan 2026 13:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HsE8OTna";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D7F10E0CC
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 13:47:40 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b876bf5277dso679415166b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 05:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768744059; x=1769348859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ublW3cuNUWppPpbTG6MuENxN8Gi/6c1TykFddWgBrwg=;
 b=HsE8OTnaElx5FD90pqU6xUn782it8i5weKD7QQERdoi2pGlmzNQV+sFLfT1X5u7eKk
 vW8gqVkeRf+DGB2tyc7emQXqIvAUjo2117Df+j4wKNKBkh6UDDX5R7nJ/1TBNtJFoaOA
 HbehgNm7WHCAHHdNK+TMapUN85u6+Lrh2zhB06rw/9n2L7FolRL/sA880F6l7ArZSP0H
 qDPKlwQiS6ndReDnBrT88Lli9KJv1NcAFpWeg8l28xiqPzDGutkHJjk8K/+yjAaBPAmn
 +8d1b44k8k1JGmNGVzPfoIHg1UWBhox+3dTtB2OAhaCdgxBXNfglO5UGQxTQ2UZrjLXQ
 s60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768744059; x=1769348859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ublW3cuNUWppPpbTG6MuENxN8Gi/6c1TykFddWgBrwg=;
 b=g9Uc5EE4FlvNEEgBfiJAIA8GSV4p1ylKeaKTsHOgRzN/9psGfIDMmuoPfT5DkZ4+2O
 6WXj+ioC2mzUSt0LZtZNfL4OsGtMksjWJqjsgmC2gFORgudaIBNFakYZHCi2fa+7rIw+
 i5mk0RpHHcCdPPDvRcdiClHVy3Bz8gSpfE+87eRzv0CW/P1/lios1kWq+RDZWy+sutEl
 ycqIVa07Aurrlk7fOwbCdIfyoaVi10KHmVPGn5uZDhPXp+J07u19az2cMHn3X9kc6+H7
 T4Sht5CFljy0KJ5pV/fSSyzVIyRfFETuPVNON5T37e8y1NjwCn7fWm2fiCIx3HVkd8kw
 UYOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKINkYYRQuAFD2yU+GbBvK0MuHOCi1kG/dWbA/lpd0SwKbvp0FIFAPPuXve4nx451DbUYFHcitRRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWJFPlxlvmn/hgjBxdllAdEJ8n93FmM6j1JPvJuHrZrfSbhm24
 UTcYab7wxJWbgoDIpDR189UPiUbh39ZRDGhP22ceZhmOlSoTxj2FtEGG
X-Gm-Gg: AY/fxX6qQjeJoiWuhDh8I143wvyAgFObSO3VTBNvJ5QDPCdSLW34UrqBcEEd1faOKE8
 gH057JzlWXxJYZnmJ+ozo6S5CTVt7Sk6HPYoKcowi328HG0cjDCmqPQb/kLoDM2QVkzIyFyveK3
 imQUyf1TphqSvZ+71nzkKUDBXt8TRi6qLUJobtw78nwzN9LGjlnGo2CZKDVxDnV+NkKePg96Dy+
 HkYfg+fVnC49EdPHvnSR80oBvZCuU1q9cN+6HhjIIe0WEyqo2xF94ow0wHXv0YdvdsHsp3C14ez
 l0jjAKsy96ROFebnahBGi1SXulGxTNUYk8Q2aYtUNqwIDZg0yzLHTeT79QVRGrndozcabZ6HwcE
 DHYXR8AI1oVyIcHaVMpsLMpjzYtDJly/UMhNOoeVAZ3aUCHLLG/PovYVfYWdJ2MexlF2f9S0sOh
 feNYQ0iJAgAIojbjA=
X-Received: by 2002:a17:907:7b82:b0:b87:65c5:6036 with SMTP id
 a640c23a62f3a-b8777bda8f9mr1003253766b.21.1768744058727; 
 Sun, 18 Jan 2026 05:47:38 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:85a8:ed04:ac09:e3e0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959c9a14sm804992266b.45.2026.01.18.05.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 05:47:38 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Murad Masimov <m.masimov@mt-integration.ru>,
 Quanmin Yan <yanquanmin1@huawei.com>,
 Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 Osama Abdelkader <osama.abdelkader@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com
Subject: [PATCH] fbdev: Fix slab-out-of-bounds read in fb_pad_unaligned_buffer
Date: Sun, 18 Jan 2026 14:47:28 +0100
Message-ID: <20260118134735.11507-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function fb_pad_unaligned_buffer() was reading idx+1 bytes per row
from the source buffer, but when mod == 0 (font width is a multiple of
8 bits), the source buffer only has idx bytes per row. This caused a
slab-out-of-bounds read when accessing src[idx] after the inner loop.

Fix this by only reading the extra byte when mod != 0, ensuring we
never read beyond the source buffer boundaries.

This fixes the KASAN slab-out-of-bounds read reported by syzkaller:
https://syzkaller.appspot.com/bug?extid=55e03490a0175b8dd81d

Reported-by: syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=55e03490a0175b8dd81d
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/video/fbdev/core/fbmem.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index eff757ebbed1..a0c4932a6758 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -113,15 +113,17 @@ void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx, u32 height,
 			dst[j+1] = tmp;
 			src++;
 		}
-		tmp = dst[idx];
-		tmp &= mask;
-		tmp |= *src >> shift_low;
-		dst[idx] = tmp;
-		if (shift_high < mod) {
-			tmp = *src << shift_high;
-			dst[idx+1] = tmp;
+		if (mod) {
+			tmp = dst[idx];
+			tmp &= mask;
+			tmp |= *src >> shift_low;
+			dst[idx] = tmp;
+			if (shift_high < mod) {
+				tmp = *src << shift_high;
+				dst[idx+1] = tmp;
+			}
+			src++;
 		}
-		src++;
 		dst += d_pitch;
 	}
 }
-- 
2.43.0

