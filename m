Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ5QB6GugWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:15:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA9D6175
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD5510E576;
	Tue,  3 Feb 2026 08:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d+2X2bxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FF010E51F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 04:47:45 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2a7bced39cfso54822965ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 20:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770094065; x=1770698865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=doaACG/D+VS8vv3mxSVPzZpMTEXTnbMFWjr/fZXYyuQ=;
 b=d+2X2bxrx0eXBoglHJowD1K5VfGFMk3Y+Ra/mmSw8x4w6a8YInb1tYZnAL+M5YvIu9
 0pYiUreOnOhuQEluoPQZpVP0tuTzZA7wydIDNdwvs3beDgnuyAP3SpugFC/78JPjhwLD
 1hxPofdwUud/8jIQjL9prp2N4j+t9f1qSsjBUi5OJ9as2HW8ezwjFVQzHyxtOJ0PRTV4
 h4qp1zE4W9i95g6NpMVrYAYnovWge4l6NxI9Z6djzfX74EQoUhKqhahkz+lDyGc6jRn4
 RUg+AQgzVKrZyx+F9DcZUMoOkmKn6MDvoHoiBJcBFop3eggnd2y9pV/lnasVRlOfMUhc
 UIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770094065; x=1770698865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=doaACG/D+VS8vv3mxSVPzZpMTEXTnbMFWjr/fZXYyuQ=;
 b=qJN/rIJ27XB+eZoZs+UtxMCBXtkqUKu5IM8uT0808SjDsPtgio/XkxjTSXeTbnAsk7
 oc0oCyoQ2FQhgt2RUIPuJ1gHpA7u9z7tvxTAdGWPBN8zAQoDqN7ZHlKzbHevyJpz1KJG
 6WbXcmzgAO1voRD1/XvWadnxeDP+IsZj3N2FCdBS9Hlk22nbhkq81LAQmHciSu5cifBi
 v8jZ/H86RFRTCDm2r/25cOggyNqiBDrNFJIzdPfxlna5p7Jg/ZMGhtNkljq7jYpeaNxq
 GEeGtiYCKk3O3Bx90yabD/7nvLJO3gpRTlYT7iGymjOKs532QX9vH53BBMfFb9V0wL+p
 TIBA==
X-Gm-Message-State: AOJu0Ywf+uX45tS5AzmeTg/2b7L7WLoPLhH2i5Oc2J0xezxWM6ilTSQB
 E+3XeLNUyuAFfYKXJTc+f0VDNAFI1RlMjWNC+ViKO+wyzRWKWLqGsImX
X-Gm-Gg: AZuq6aKzb16x70xmh031Leb6QRHAM8YEQVriAwPuqGII2yeQ0gal8/bt3luZjjj6q5E
 1Rjx1E/i69FbGcZqdeyi0neQpTC5T5R3OrRqoYTR6lX4wkpJ6sDd7NlhBvTkehObiYlQKdcynEP
 4lOsK/kNCFBQSePFoQ8qDeHQi40QngOS/BoY/1ng+/nl3ThPAV7yS4e824NotbaX/4EULrxJ1K1
 JY3pJkpzHBhNHC/orkCxhuOHpTTYmyM3a22XEhiD2wvna+GW8/osIucfNT+hbMwpXr/dbwuB8eO
 nmb1n0e9PQ8fw2tF/qOSdehoJPk88lB21DLLu4BOsL7WaJZ6CnyBQjIDTS26IlIeL+63qqyEfC0
 0KubE3Wn2UsJ9/lbH3CD2baMStZ5nMSd6qVSjILpdStgkmxV4al94z9rG0/mRpi0OORJlqu900V
 aEaHkf8RtJdhuYxo98YTdWL3OKa9TklULYUg==
X-Received: by 2002:a17:903:1984:b0:2a7:3db0:6e1d with SMTP id
 d9443c01a7336-2a8d96a6af9mr100225895ad.9.1770094065094; 
 Mon, 02 Feb 2026 20:47:45 -0800 (PST)
Received: from krishna.. ([103.220.210.247]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8ec56da60sm85791515ad.38.2026.02.02.20.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 20:47:44 -0800 (PST)
From: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Subject: [PATCH] Revert "staging: fbtft: remove goto from
 define_fbtft_write_reg macro and clarify empty modifier fbtft-bus.c"
Date: Tue,  3 Feb 2026 10:17:27 +0530
Message-ID: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:15:23 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:krishnaworkemail1308@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krishnaworkemail1308@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krishnaworkemail1308@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C1CA9D6175
X-Rspamd-Action: no action

Replace the goto-based error handling in the define_fbtft_write_reg macro with an
early return while ensuring va_end() is called on all exit paths.

Also add a short comment explaining the empty modifier argument used
for native byte-order writes, instead of introducing an identity macro.

No functional change intended.

This reverts commit 6eec69e273e124dca8549fc52b0958b2953085ee. As per maintainer's feedback.

Signed-off-by: Krishna Agarwal <krishnaworkemail1308@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 41 ++++++++++++++++---------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 0ab4f5c4f886..9b9df0edc158 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -10,7 +10,6 @@
  *   void (*write_reg)(struct fbtft_par *par, int len, ...);
  *
  *****************************************************************************/
-#define fbtft_identity(x) (x)
 
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
@@ -43,28 +42,30 @@ void func(struct fbtft_par *par, int len, ...)                                \
 	*buf = modifier((data_type)va_arg(args, unsigned int));               \
 	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
 				 0);                                          \
-	if (ret >= 0) {							      \
-		len--;                                                                \
-											\
-		if (par->startbyte)                                                   \
-			*(u8 *)par->buf = par->startbyte | 0x2;                       \
-											\
-		if (len) {                                                            \
-			i = len;                                                      \
-			while (i--)						      \
-				*buf++ = modifier((data_type)va_arg(args,             \
-									unsigned int));   \
-			fbtft_write_buf_dc(par, par->buf,			      \
-					len * (sizeof(data_type) + offset), 1);    \
-		}                                                                     \
-	}											\
-	va_end(args);                                                         \
+	if (ret < 0) {							      \
+		va_end(args);						      \
+		return;							      \
+	}								      \
+	len--;                                                                \
+									      \
+	if (par->startbyte)                                                   \
+		*(u8 *)par->buf = par->startbyte | 0x2;                       \
+									      \
+	if (len) {                                                            \
+		i = len;                                                      \
+		while (i--)						      \
+			*buf++ = modifier((data_type)va_arg(args,             \
+							    unsigned int));   \
+		fbtft_write_buf_dc(par, par->buf,			      \
+				   len * (sizeof(data_type) + offset), 1);    \
+	}                                                                     \
+	va_end(args);							      \
 }                                                                             \
 EXPORT_SYMBOL(func);
-
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_identity)
+/* No modifier --> No byte-conversion is needed, data in native byte order */
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_identity)
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.43.0

