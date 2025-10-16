Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840EFBE4D0A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBB010E08B;
	Thu, 16 Oct 2025 17:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bMtpTj3u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66C810E08B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:18:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so820812f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760635128; x=1761239928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R61SKl0heteonfQWMBAG66A3jLT07W0AMS7C2zZswDI=;
 b=bMtpTj3uputoRlIdFKY/6yly++Dx9Ld+KF91DCSu7zkm9CrmbLDIFpX2YKdhwR3W46
 pXpqVtry+TELT8BdZmpHL24jv0CCU2XX1M0st8mCCzy1rC24aKxA9DDWaSORJuO30AN8
 6J5m0p1GEhXz8A6opSeh7cqmQKorP/k+sqrKwrzR/Z0Xp3ygs5hzM15KLeN/i+tgaL4H
 eBYO7bPZY7pQX3/zGforxDCh9kf3Eh7Rnowv9/Uk4jyEFwUXT5UMFHRPXqrVhpSMMHuq
 aHbBuySxnsTKkr7c3A1pN+q3j4rU1e5okmKfHMsgpEgQw0t+XeTQm9CsNiXTLB5Ye1Sw
 IT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760635128; x=1761239928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R61SKl0heteonfQWMBAG66A3jLT07W0AMS7C2zZswDI=;
 b=a8NcO4BctMNshQUSzLEGhQ2zCcfEJDaNJ24wAySK1elgZpXRRht6oIZKH3qRC1HisU
 fybp2FTcNhVJatu1JxoI9uZrR3xtVbRvTglyCsxmGfFpzMF2GPPbAAxlOMUNwIMWmFyE
 aLHGhvX/B3uwB7OPV/jQzxyL3knWhgKKfe2ufbMyM7JXVskjSkWxTakHBxic0mxbtq+r
 HS7Qhp8C7BzkpM5QteRdqSdvJ1w4h2rHICbTDhWmNJsMBBQ1idCXXRr3DrHU1z9/mlXb
 ZzGna16GpA+C6Y8BPd1xqeYovNAHwswPrVIVv5BHjyGk1aEORg+3QI0W2U891MFtIwja
 yW6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD3C3cNVjlzZm4IMQ1rEf2ijXFt15CtUl2CN4/xuazNL8GW50T2qRZS0HrV8VRA/V+xVKmr6S+LOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyir/Eyds+ycdWShW6Gxe2u5DUIvCW2npqkCOqNT+XmamNFBgsJ
 G5dOS0VgWKAO/HDoVg35gQdCc9tR+fMqIWNaAg0zAM4yPJGZqtV+oQuV
X-Gm-Gg: ASbGncuDph3rgEEmkZ5aiCS3JPk2/p64GiR2O1qfICeUwimNMl/uSkI2ZvheIRnvpYq
 Tfzx2Lm/JM45AZFRho6nxxNUTisIqBCZKhC/rVey3AMxx7w/P0Gu1QNzmV78h/+4mKpFskZExRp
 OzdniFbqO36BNerdSmxd+B3SUEajSdstQBNAl/RaVT6Bd49Q+lfoAngjBn2qHrv+R/7sj7suxjY
 2LQKVUj42LAoMy+siTUE2lOejTJgQ6AEO6tklg6aTUXaDNew/1lWlE9bRZLeyQq7pMXrKc+ALCX
 9Z7VoqniRqSXpIV7VPomGfLS5nFxcxc0iL2yXXewYbZMiKZh777yP5FO1PxOw5OosD8FouVtWHr
 d4bVNohB2sUvH1PzX4SSQIE+7XAoktZl3ig/mEJTEjIGMfFUWtPcdVhPd+ACybe/dWhau/y1s17
 hcS4dwfXNjCeUT1tTvTzuNoDYsXQnF9iYE
X-Google-Smtp-Source: AGHT+IGtxy9t5BEeTVIETxG2Z41hQ7E4hmY7HEIitTLwANiVPbSqfV1FzBoCuUQpqq4aGGwjVLWXHA==
X-Received: by 2002:a5d:5f82:0:b0:426:d54a:67e with SMTP id
 ffacd0b85a97d-42704dc9bffmr775251f8f.44.1760635127949; 
 Thu, 16 Oct 2025 10:18:47 -0700 (PDT)
Received: from dell (117.red-81-33-123.dynamicip.rima-tde.net. [81.33.123.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442dbaesm39349145e9.8.2025.10.16.10.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:18:47 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH] fbdev: vga16fb: Request memory region.
Date: Thu, 16 Oct 2025 19:18:45 +0200
Message-ID: <20251016171845.1397153-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
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

This patch reserve and release VGA memory region with `*_mem_region`
fn's.

This align with Documentation/drm/todo.rst
"Request memory regions in all fbdev drivers"

I've tested with kernel and qemu both 32bits.

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---

When I've run the code always return -EBUSY which makes sense as
mem is already requested,`/proc/iomem` shows `000a0000-000bffff : Video RAM area`.

I've seen that `cirrusfb` has this kind of code wrapped up with `#if 0`, and I
wonder if it makes sense to also wrap up with `#if 0`, at least , in
that way the code gets commented about expected behavior.


 drivers/video/fbdev/vga16fb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index eedab14c7d51..f506bf144a97 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1319,6 +1319,11 @@ static int vga16fb_probe(struct platform_device *dev)
 	if (ret)
 		return ret;
 
+	if (!request_mem_region(vga16fb_fix.smem_start, vga16fb_fix.smem_len,
+				"vga16b")) {
+		dev_err(&dev->dev,"vga16b: cannot reserve video memory at 0x%lx\n",
+		       vga16fb_fix.smem_start);
+	}
 	printk(KERN_DEBUG "vga16fb: initializing\n");
 	info = framebuffer_alloc(sizeof(struct vga16fb_par), &dev->dev);
 
@@ -1398,6 +1403,8 @@ static int vga16fb_probe(struct platform_device *dev)
  err_ioremap:
 	framebuffer_release(info);
  err_fb_alloc:
+	release_mem_region(vga16fb_fix.smem_start,
+		    vga16fb_fix.smem_len);
 	return ret;
 }
 
-- 
2.50.1

