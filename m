Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJldF3b3dGlH/gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:46:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17C7E253
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42A110E253;
	Sat, 24 Jan 2026 16:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oc030vKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C92010E253
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:46:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so36066365e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 08:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769273199; x=1769877999; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6OUYnmJjUSoTbjfBFrV7WRaFdxNtImiW0cSkzLarl3c=;
 b=Oc030vKjLStJLp8oVAM2xZ5jS9MRe6KJJAZxpRh87CzMfGbKVqA4ikMyvtK70Sf20m
 Vz8wfDLCWjQhKt/GLSJKaNiSkHGUxOIpAyH/E6hcjvHXcd+inPrATu5qSueasJvuvCHd
 kCzyKF+eCLtDdpCVDKLstJ/k5tsCHVN9snOWmnNn8Ok7NspDH1sies9w6qs7jQz8czRt
 gQBXdX1vqll9eFdbcM/YklJOGzz1NTdJyVMRWKA0UaCMe6a60vrVeZ7NpqNC6rkw9uNf
 YWIjp5EbJ67zztSN8AtHBt2nXzsT8dK/Ce1iMaQSnXnYHSWmqhThcyvHQcaMF0AQDlHk
 Trsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769273199; x=1769877999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6OUYnmJjUSoTbjfBFrV7WRaFdxNtImiW0cSkzLarl3c=;
 b=SRSiZHXb+aVcM81asxI9d2TG9cqmjezqv5eY1uyl8YMCztacVkTcn5SOPcY0HFhCdv
 MkWCpraTdImLtFfZVSCT5+3nvwYIIUIuKHk6PbA5bkW7OMGaNfXh+XEycJl9noTWmOYo
 YNP0oWiM70oUSaJlY70860lCxos4A9ql+KQU2KdEqFOSL6Z+tXmKN/v/eYgzu3ZfPIxZ
 EQ5l7gne8640i665KXRlp0XPj5hckQ6114WDN/lOcZ6alRwmqtoZZHWoSUkw68AvcGMW
 1odjATkKrD4DNYN5x6jpogVHKV7j61YcwhOkIku+QK6ZiDxHHwVQTTXE8NEe1inqS6lg
 mfjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUidq7j6F08zWtfr2hkQvd7hUWPAjcZo+gbluDEMrc8IK9qo26HLz691MApK9ykDhkFofA1iRZ553o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuHyUcOmptORaJ8usbcXsiq935PmQKoEZ5Kxv2sFOfBkTxckbn
 xcK37s9GCWkGTEcYVsbFn222SpMrPg9z7qE2CllOXxrh3m66ZHuETkha
X-Gm-Gg: AZuq6aK8gZV2iczE1YO7IQ/SyQC9CZryfzRuGBKEB1A254i10XrxV8J9Hf/PgB0V1Bx
 SsLYjDe6E0Cjp158UDpbpu+sWcDkMcy2XSS2fOSWUCW6pjTzh5/lzqQrxGzurMd68bKU8Q0abqo
 SeEG5tR58n3jUjKa5gc6vlSVUDOPJSpBahYsio/uuSLh3Rqq1ryoHDjtpDZBvFEHc8w6VYHV6ap
 Q1fCy9nQhBIjc1Y14qM0f4QfUf/v/JTGKsLmB/3StZCQkBnFG/VEbdyvg5ziHzCpTpoNMqUQRyT
 a0l/TOjoIb62xtaZYyW+XICaLBgkHuOwXraQrsNjcg0OYiqq8SF4LZyN+23eHGvbNVsoNA2MbDp
 30uw92EHnkIdnjMxEkBfmI9SRF1WgSj10UnyTJEQLGCgflwrQr243sit3CRFZvlCKBpClulIUaa
 cb3aM+a9/gRos3TQ8Jy1ZP1ZBfUXy8ztRVqFoIiPBeTKEoEg==
X-Received: by 2002:a05:600c:3485:b0:47d:403e:9cd5 with SMTP id
 5b1f17b1804b1-4804c959816mr99179385e9.11.1769273199342; 
 Sat, 24 Jan 2026 08:46:39 -0800 (PST)
Received: from osama.. ([156.223.77.192]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804dbc0d84sm52711215e9.6.2026.01.24.08.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 08:46:38 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 "Daniel Thompson (RISCstar)" <danielt@kernel.org>,
 Murad Masimov <m.masimov@mt-integration.ru>,
 Quanmin Yan <yanquanmin1@huawei.com>,
 Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 Osama Abdelkader <osama.abdelkader@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com
Subject: [PATCH v2] fbdev: avoid out-of-bounds read in
 fb_pad_unaligned_buffer()
Date: Sat, 24 Jan 2026 17:46:30 +0100
Message-ID: <20260124164633.20444-1-osama.abdelkader@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:simona@ffwll.ch,m:deller@gmx.de,m:tzimmermann@suse.de,m:lee@kernel.org,m:danielt@kernel.org,m:m.masimov@mt-integration.ru,m:yanquanmin1@huawei.com,m:zhangyongzhen@kylinos.cn,m:osama.abdelkader@gmail.com,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com,m:osamaabdelkader@gmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,suse.de,kernel.org,mt-integration.ru,huawei.com,kylinos.cn,gmail.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,55e03490a0175b8dd81d];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: BD17C7E253
X-Rspamd-Action: no action

fb_pad_unaligned_buffer() unconditionally reads and advances the source
pointer for the final byte of each row, even when no bits from that byte
are actually consumed.

When shift_high >= mod, the remaining bits do not cross a byte boundary,
but the code still accesses the next source byte. This can lead to
out-of-bounds reads under malformed geometry, as reported by syzbot.

Fix this by only accessing and consuming the final source byte when it
contributes bits (shift_high < mod).

This fixes the KASAN slab-out-of-bounds read reported by syzkaller:
https://syzkaller.appspot.com/bug?extid=55e03490a0175b8dd81d

Reported-by: syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=55e03490a0175b8dd81d
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2: address the real issue (shift_high >= mod) condition.
---
 drivers/video/fbdev/core/fbmem.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index eff757ebbed1..d125c3db37a1 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -100,7 +100,7 @@ EXPORT_SYMBOL(fb_pad_aligned_buffer);
 void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx, u32 height,
 				u32 shift_high, u32 shift_low, u32 mod)
 {
-	u8 mask = (u8) (0xfff << shift_high), tmp;
+	u8 mask = (u8) (0xff << shift_high), tmp;
 	int i, j;
 
 	for (i = height; i--; ) {
@@ -113,15 +113,18 @@ void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx, u32 height,
 			dst[j+1] = tmp;
 			src++;
 		}
-		tmp = dst[idx];
-		tmp &= mask;
-		tmp |= *src >> shift_low;
-		dst[idx] = tmp;
+
+		/* Only consume another source byte if it contributes bits */
 		if (shift_high < mod) {
+			tmp = dst[idx];
+			tmp &= mask;
+			tmp |= *src >> shift_low;
+			dst[idx] = tmp;
 			tmp = *src << shift_high;
 			dst[idx+1] = tmp;
+			src++;
 		}
-		src++;
+
 		dst += d_pitch;
 	}
 }
-- 
2.43.0

