Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ki8M/eMoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573CC1AD583
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E790310E9E4;
	Thu, 26 Feb 2026 18:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TQMM/anb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FE710E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 20:46:15 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so945165f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772052374; x=1772657174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hPPTw/h663gwEv5xV8CJ9bDxaVjouGUNI0NHoKIgjD8=;
 b=TQMM/anb4oqoDonR9+yMN3tx1yBxAtD+nRRhvGnv65j3126BMmXTDGyd9diAACEvF+
 5229ZU5aELQnx0jnLNq+uyQUN4VT7JEYqoMS09BGzsIouoowO252nFkNx3pWvHiTDtb6
 sUYXgZwvybZ20Exq7z2/CwnjgT87YQHzYXfqMib6v2VldBbF6tZcdJw2u3p7mYL6JwvX
 2JJYuZiJoRq/l/C14mrTn1GVbwhbhi4LfmYDIu/290AkVNXSMYl8vs7D8YdkFyQNM+wU
 /xtE5/XfghGpemDXjEZCFmF6xE1pK/+2sbgfpnRs70LldDhUgK3Nv5p175DfdWuoFBwm
 UMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772052374; x=1772657174;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPPTw/h663gwEv5xV8CJ9bDxaVjouGUNI0NHoKIgjD8=;
 b=N6Iti+8Z4XNdyXIht5/F0kXKTJkycAPGpmVjG3v//CrMcESuvwHfNrJmbskMGmLuoi
 3LI6qGqlJhvSPItWbpRnQS587kvQe1p7TppuWJxVCe7hFidpkGjJ5RSvtXZO99Er/Uhd
 FXG7eCPeDeZ01G/3OCug2/obHELqIIdHykmWSoYvluyhtzRemO4mR3QppyzufGNKLcYo
 wXkbTuTnC7FU9knVlcIMEasOT5wD0tt0MZJajcnzuCMfGtEM7hUcwzCvVznr5xQTEpH3
 PFYkjtaseeNp5MgQ7f4oykKM8xxunI6DKUOS5kkcIvG4fE/IfZuuJZVKHMX0Cdbp6z/z
 dFfw==
X-Gm-Message-State: AOJu0YzCGcmG0GUsW9t71RMHmO3RefBPoJ3q+iNuWSz0dfqWi69sQjCZ
 CdTfSGW13zrrL9C0dQEoh64W74Fd+F8r52TPLXFRbe46nEkqLgO1tYe9
X-Gm-Gg: ATEYQzwdepWGaRUDqw4m9VQ2FpI4wXx1KxbP1pTNAGnbfSpn8aeq9Pb9FczvWOeps4p
 0TINBNIP8tUO66U95N7QM0fLdB227cii6SgaDiTH3g2SLazmM1m6Qv0zoaUQ6f/m8437dAqJvoD
 QT0lncSAG6YJSOMTqJqoY8Ji+RY5SZY1LcOIo2ytFPmFDc2Xon3OGJr2ztTmeXc+Yphm5EPtSTy
 BcrE6n+3pUXjFGPdZYoAyT/NrHs8WFtrP8I5SJGfjbBHexm7pgp/tDCOHFm3APFZLFHaaWmy/4H
 xn6LeDCW5CuwGTXhG6QTtXcFKCIHVv1caLlJN24uJ8Q3pgN4GYqxsAvqWoH8igSgJxSovKJukxV
 baB3TyVGNvLJApVZj3i6CLW8tbeQ5Udo7PyhAHs6pZGeIxhseh7zOg2xA2d0E1Qfp3USq0YO8fn
 r8MptX3dfxwkHbH6PiG3zddKaAAPfrvdYkS9en5nE=
X-Received: by 2002:a05:6000:4312:b0:439:94da:1aaf with SMTP id
 ffacd0b85a97d-439971b2b03mr838964f8f.13.1772052374120; 
 Wed, 25 Feb 2026 12:46:14 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c00d95sm34711357f8f.13.2026.02.25.12.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 12:46:13 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 azpijr@gmail.com
Subject: [PATCH] staging: fbtft: fb_ra8875: replace udelays with usleep_range
Date: Wed, 25 Feb 2026 21:45:59 +0100
Message-ID: <20260225204602.134218-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:azpijr@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[azpijr@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 573CC1AD583
X-Rspamd-Action: no action

The write_reg8_bus8 function uses udelay(100) twice to wait for the
display controller. For delays of this duration in non-atomic context,
usleep_range() is preferred as it avoids busy-waiting.

Update both instances to use usleep_range(100, 120), allowing the
scheduler to utilize the CPU during these wait periods.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..6058934e2ca2 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 120);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 120);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.53.0

