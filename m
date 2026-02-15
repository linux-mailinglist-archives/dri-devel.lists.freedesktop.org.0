Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFFGGupXkmm9tAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:34:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8DD1401D8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6FA10E0E1;
	Sun, 15 Feb 2026 23:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q1KzV3Hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BBB10E10E
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 23:33:57 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso9284945e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 15:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771198435; x=1771803235;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hivvhDiZwwsZ5SBCswCqVh6HFKDtUwRY3yPIgVgk+WU=;
 b=q1KzV3HiRumoq0BaAXM/whVt7dnbefE/bpoYNmx1itnnWOIRDGeIGP2P2AjGLhqTqh
 yL0raibkLKX6VkcouGnZxFi2u0445fWgXJP0bs21R2bsLY4BatYgoz1XYCaCYWiI1Tmd
 I6+PvB6+b2KU/yQKSSF6HDhRlYTFqL3TuW9aluFOASbss1IAj3VGud1bD6wbv3Y7dzO1
 sv+XkxRBgoRguaIoWE9TfU8GPNj/Jnkm4lvc59WN9iloPebQLHZue7V60z4laDBrvJ2q
 TuxBhTwNIcBC0FBkb0S8q9wEOIzADKCxCeeuIyIIEXdFt9ICWozCiOdJ/EQo98TbIt/B
 OdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771198435; x=1771803235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hivvhDiZwwsZ5SBCswCqVh6HFKDtUwRY3yPIgVgk+WU=;
 b=emD59sYOwUvTmYDaGs7j7ZqVEC1XzyjW+QOYBkIO3eLGmDeAo32pTZNeHsYV3EkSHT
 Dtb+TWr359g+HdDWbSAZuldgvrxp96c/zUsbjdloFV05SElbS4o+1WJ6qE+H9pYQfRgi
 wKY5cyXAOyTqbbFZzAovO4SmPXZKdAM/1l9Exr2hEAzBl5CUicg6yEvcjVrDwQ7ugysv
 j1c1y39s8FjlU2oq8+0loFj8Z9mgnJIPbeIw5sPRXJSfrUU92fKnG6NXt/eGsUgaDTVg
 6azoIe2tJQ5rg/IBfzK63i61JuinrN+T7WwPYbTPGXby9+vQArD6fEy1SsCr3V1/zr8S
 Jjpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrhNcChhXlvKfR3XEH/zL919+95vMXpEiF/MHOuH2UrgH8kL11cisb8ZD1WiMakZhmFpBSpej01pY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzd7IkOkJc4oRpQrwTLpA2gGnpUjknW8DzaXPrDxp5C82lqvGE
 BdjinuXXGSBj2DcziGqreXlLOpdA/qKkx7LTufos0MLRLIBIpuY7GDy6t0MHJ9GpSeFEZ9t/9e+
 ZXVg2
X-Gm-Gg: AZuq6aJg1r+c2VfoH0+PerUBfjh2jBm6PPHpIz5GN0dN6FpZW2KyZgiPMLLT114AeNN
 2ZKVkxse510dD3Yt5kgQQW1xt4oi/dXrGLiq/URv6rHFOizCMvEWD1cwuIt7sY2JIz5j8ZmJqge
 8Xw2dOXdyXdY+KUL1pUeY8CtJCcu1BH0fc1UBLXms1z8y6AQFdSv/sQDU+yK8CzpzCwpTfFSZtG
 lRTNL27fK1oa+gK67GFS2kAJTdSGM/krKcvd1udxMRjvENnBPcrc7IMdaKUmr9JgWz0xFgxnpA+
 +snnCTKHcZO/HRc/pDky8+tyEalHsUr7g4isXhfzqgU+xSLxjj+Ed8bcud7Cj+ed8zVx4+etvuS
 r7j/o9L24e78hRk3rwHYj8NbKktBIpjwf4EqllvPcfUar2XJ0LQix86TNU5iwbMxaeN9HZ5moih
 UBeFjaelcOGNTkYc/J/u0JRT3TF9IR
X-Received: by 2002:a05:600c:8b4c:b0:480:5678:1fdd with SMTP id
 5b1f17b1804b1-4837105240amr157188025e9.12.1771198435582; 
 Sun, 15 Feb 2026 15:33:55 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43796abd793sm22707278f8f.25.2026.02.15.15.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:33:54 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 7/7] fbdev: au1100fb: Replace license boilerplate by SPDX
 header
Date: Mon, 16 Feb 2026 00:33:23 +0100
Message-ID: <b6117b045f637ed5e0bc9a363f470cc687e4b2f9.1771198101.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
References: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2036;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=8/ayvd93vuKuZqoV2oaXZ3cZ3yxFe6ENShkM6M1S1aU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpklfONAOswvfwLXTWMe6bmvCEvTCbsTYtNtgMg
 a1PdRJcTNOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZJXzgAKCRCPgPtYfRL+
 Tr9bB/97oKns3CJ8YtEMzxiCZ6P68I6s9orVbWJ5k3fpQJ4ilOQ1zzu43vD18hwB5P3yUsqsbvI
 EnMEk9PsDn+/VhuyQDaCLACkruFjR69RbuZA9UsUJ4gQahht6rVd78LIshw49KisqYStBJc4WoZ
 uaLTin2wd10gBmtwQwW66bgBtknv/1IMe9h42OgXmsvoyFTrf4DfLDTA78yRtVgkPhF7+YoFz3d
 HI9Hw+VUPwxRjvXlFDTZTQzKzNiCPpIxGj2I/qXXgnBEG4Xg4nhLukT8pGQsxcK2XRJq2RR3jZL
 +l/fszukh+zz++OsND61hioWUdZr3sLYWdRuvRFTlDRemPLK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1B8DD1401D8
X-Rspamd-Action: no action

This also gets rid of an old address of the FSF.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 13605337d724..1a04154bc535 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * BRIEF MODULE DESCRIPTION
  *	Au1100 LCD Driver.
@@ -20,26 +21,6 @@
  * Based on:
  * linux/drivers/video/skeletonfb.c -- Skeleton for a frame buffer device
  *  Created 28 Dec 1997 by Geert Uytterhoeven
- *
- *  This program is free software; you can redistribute	 it and/or modify it
- *  under  the terms of	 the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the	License, or (at your
- *  option) any later version.
- *
- *  THIS  SOFTWARE  IS PROVIDED	  ``AS	IS'' AND   ANY	EXPRESS OR IMPLIED
- *  WARRANTIES,	  INCLUDING, BUT NOT  LIMITED  TO, THE IMPLIED WARRANTIES OF
- *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN
- *  NO	EVENT  SHALL   THE AUTHOR  BE	 LIABLE FOR ANY	  DIRECT, INDIRECT,
- *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *  NOT LIMITED	  TO, PROCUREMENT OF  SUBSTITUTE GOODS	OR SERVICES; LOSS OF
- *  USE, DATA,	OR PROFITS; OR	BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
- *  ANY THEORY OF LIABILITY, WHETHER IN	 CONTRACT, STRICT LIABILITY, OR TORT
- *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
- *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- *  You should have received a copy of the  GNU General Public License along
- *  with this program; if not, write  to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 #define pr_fmt(fmt) "au1100fb:" fmt "\n"
-- 
2.47.3

