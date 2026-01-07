Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03DCFBFF3
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 05:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6DD10E0D3;
	Wed,  7 Jan 2026 04:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aDGdW0US";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C964510E0D3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 04:43:15 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a12ed4d205so13323855ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 20:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767760995; x=1768365795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thb/F5AmFMs9ckn4s6Vf7Io+bFyVo1RiT6S4i8FpYAM=;
 b=aDGdW0USJj+JJkTbWlbZwp9T7a5xn3lUk8FdW54cP4aCU0sxEp5MCI38IyEZrXTfoK
 3PbQKbg8iZQHJfoL1lg4ZWz/bylXT9mwJfvIi4Zq2b3CjsJgIDQbzmdmSsVADQYWhLQe
 g223OYZy6yYY0oDX+VyVWz3aruiamG9T+kB/VbqXq0atEfnuNycWxDR9DJFivX/y7O4z
 ZJa0ZHzTMvwnejRzQyHpvDnTeuIygIm58+SgZBP7sRuv8HgqITXSgJ4RglR5AWTzdkFU
 yAFH1JJCYD75d4dfesStq9nfXmgQDeMv/woPiEHMUTvRnMOhtHSunPz3KPR3A8amnFBV
 VRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767760995; x=1768365795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=thb/F5AmFMs9ckn4s6Vf7Io+bFyVo1RiT6S4i8FpYAM=;
 b=iFzowdwfNtxcEvew6114sYUbehApbcnvEYZ/Ya4aFlbFrka1KfApGCdK1ZPxWwDtXw
 rv0Xp7Z/uZY39AJflxdQiCz+g96T8UsmDlSdxY7WN/3LfHv2iIF4VMGrlJVQ1eoG/uA9
 7KiegF7JXYFw6S7PFppzUcx8+rmEU+JTm9Cjbf2S4oJhrKOGOzcm9XjBiV/TDTPR1QZW
 fqOHYG2gN3/1IagxmcTagR7PoPS3BWT1wGPYaddgt8iICz5djDRXrSM7hRtrBsVEkUfB
 +PavF5hgRsLn2dsXk7t9y1Ru3lwMQ9EPy7w3pvm1et4mSvrL3kXt/uz1hlMTth4ajUrN
 vPCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfWPp25TH7yipgXRrLlHy8Dqwp+MZjGXvjJlD1XMtZ0UZKIG9aeXoDrqsNI3Ge2+8MExL4ItOwI0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy22U48LuPEV5MfD8FQ4sT5nh+/NatOn4KpYV7ojYXZBw1zJ7+n
 nHk1G9+Y2cLq0nlj8aGwH36rp0qERvXGJJZG6yEGdKVgHwagVqWIPtm9KjDWRyx4
X-Gm-Gg: AY/fxX4o96q0g/KemiCsi8ZUyMSfdJHVJiuTu+OVXU8l3RRqjwtfRxFj/fiXDe8wnxw
 4PT9ItCoWlggL/fPlpvhxI6NqOlnDYbEECYFF9aUBS3qpIwVGRaXlKNolPBsu6unb6aZFq1w4BJ
 C7iWva6jKF2pTFJBcFKmxkvzamzqhncM99ouHj6bOck4Dhl0iU2/Eh1herry9Tg+Mo19TUDktGZ
 UPIpN507tD5wuTZlUCyXeyKxMN/0x8KDR2POazmH2cSzELXuPB8FTHCecp0qzm4aQTrZc3BBpnM
 iWlnQ///tGU217bxPbCl0WLGOZ6azMZESyu+O0nElWKjDaunZvbrF+5P9y71i+7hNVDbPEKu5M2
 isq2v679HaKYIdOM2IeMiZjmiFZOlks+lvLUD3HRuoZp9TG+vAL/C7nyb+nZFXtgE/UDkKA+Dxs
 D3XMYPN9dZePL+vdMcsMt54GOgaDvIXlX/ujFtuDOd12g=
X-Google-Smtp-Source: AGHT+IHEaO2WdOiPYRPaVMlPLug2wHz5JWNqR4SeeEsDG6lB5tEtYaBOclypPoot3PX+4+bsXooZ1w==
X-Received: by 2002:a17:902:ce92:b0:2a0:d63c:784d with SMTP id
 d9443c01a7336-2a3ee4a7dccmr11794585ad.40.1767760995098; 
 Tue, 06 Jan 2026 20:43:15 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 20:43:14 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v4 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs
 support
Date: Tue,  6 Jan 2026 20:42:54 -0800
Message-ID: <20260107044258.528624-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107044258.528624-1-chintanlike@gmail.com>
References: <20260107044258.528624-1-chintanlike@gmail.com>
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

Add dev_of_fbinfo() to return the framebuffer struct device when
CONFIG_FB_DEVICE is enabled, or NULL otherwise.

This allows fbdev drivers to use sysfs interfaces via runtime checks
instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
remaining fully buildable.

Suggested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 include/linux/fb.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05cc251035da..dad3fb61a06a 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -628,6 +628,15 @@ static inline void unlock_fb_info(struct fb_info *info)
 	mutex_unlock(&info->lock);
 }
 
+static inline struct device *dev_of_fbinfo(const struct fb_info *info)
+{
+#ifdef CONFIG_FB_DEVICE
+	return info->dev;
+#else
+	return NULL;
+#endif
+}
+
 static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
 					   u8 *src, u32 s_pitch, u32 height)
 {
-- 
2.43.0

