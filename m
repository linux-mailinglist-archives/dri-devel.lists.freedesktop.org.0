Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDVJBi7RkWlFnAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10013EC99
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB6A10E361;
	Sun, 15 Feb 2026 13:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="f5jGlhBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F7010E361
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 13:59:05 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48378136adcso10631645e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 05:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771163944; x=1771768744;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RG6GmQsGBxr4ARNr9op9u1H7yyikgeK/hyPhatY3TU8=;
 b=f5jGlhBZhypilAw9Ydy1Ti5WypdlbgSuY8G/GQ5KeNJ7hq+Ak//wdy4LZv9TLjB+aF
 zSWmTqXKC+nP9SrHYISoYm8di64HNdZA9GYdxEAGXSYuiGZYVDcS9ApzaZTJBYw0fB52
 ieFD8dYF3A2v9n0RXLKF8R/lbEOJbipoD/51WpjHJg3yyYDIMr1DKEdyCL+wmED6Vj/V
 L2VOU3XV43mRyEUEUuSigWX2kCURgSSKKVb9nPirG/FouweIj6cxeTSjrQRO2Vfz1uB3
 +Gfh2G8q3Ace4Xy+mONqKzdI3oeyNAAnW8koJgTiNLRqLPHQIk4Dn9aLaS28SZUj0LVg
 nFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771163944; x=1771768744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RG6GmQsGBxr4ARNr9op9u1H7yyikgeK/hyPhatY3TU8=;
 b=rOPIxrvCzj0fGYVwqLJkNXKXu84Vi3rku1CTpgHVwTvAO2NlNXJ0DbdwBqsFHXTC1o
 3fGVZnsVuoCTh58rpQkRxVCAX1Zj8znwtbzaNpnPj46RqnmUlK/GiwzgXLk2Z+rBqUBg
 9aX47EbUTHQdxoAHI08P1/NcZlwEoteCeb/m79JpxUv32g3zONBcZvDBtnA8zRMELOo9
 FabugybRYB+BgVAs3Wfsy4oDB2T2wFKGFuB+Amx/rbbqQmmlrNYTMTlTPqX/O0YRt2Bg
 xxXi+rUkr0adAGjZJNAZoBL3qnuSNHicb+SVdryiSsntmXYxuGu6AafoNDjb0dAqXuIt
 oR8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2ksc9+VBtV3VK9kHnMcHrCN6rZF0dQgstCzmoVZrfV+60ykZooffjjAf/OQTNva4c7+ON9SYZ3+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNPjryW1AodyEZZUCyw/5Vce4Ernp7kVg9K9Yj+NfdGBb+Kgrc
 ZZKgpTjG2N3gG5gR9/pZv/2NKcoj5NMllwitB5ITQ57PIM4/jlrteErjgIEoQdtXxd9/v/PGqnf
 BcrAo
X-Gm-Gg: AZuq6aIiWzdoSb6EkFn64iI4KDlkVIfe+PvNxlweYFmuJ0q8xFXUa0ozyp1Ksy22OHa
 aEkl0XLXu8t0Mrlw7OsBMbJBACMICxH2N1sCGBl9xo3ySEx8FQu8GJ7lxF/2eFKOx793WWJEKbj
 LwNwUrGpiT4/ct/X9gzUoHkFWSNAnufMnP3cXQmEIWXJsQ0awi9cm8YwK3tOKpB0mVKx+9x3KlH
 nW6CuX+kPh8qXXZ+hdht37cOGQ6ZR7SzdqrLi7cWtKDVsZxWoJ0FqYeX0fVmEYJldAqxyJYal4j
 jLbYpkMXN26KCJe7fUOF58yx025corYhTTZsoDkIqqXLhcnDGZ8o9E3uX4CqIQ99JDnopAg/2LZ
 uPivs+2Dwn7lEHo56D1sx5FBkBYVCs166cnBgPumieC+/PBeXGHhM5ZvLUSJIHuUzOJE/Hkvj5Q
 NjK2jMes+C+C4ahEPVOQluR0GcEYuUXCp2BIeolpU=
X-Received: by 2002:a05:600c:8b2f:b0:47d:885d:d2ff with SMTP id
 5b1f17b1804b1-48379c1faccmr64682015e9.29.1771163943836; 
 Sun, 15 Feb 2026 05:59:03 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48371998777sm219101795e9.1.2026.02.15.05.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 05:59:03 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 7/7] fbdev: au1100fb: Replace license boilerplate by SPDX
 header
Date: Sun, 15 Feb 2026 14:58:34 +0100
Message-ID: <378a47fdfe6d90d1dd1420b4c162a2b545e194ad.1771163316.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
References: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2036;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=BalxdmGg7q8b/lJ2o70gT4nYTPOO6a2Q4by7wkC9Sh0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpkdEUw3fDu0xEFBKtyGze12ytZuqIDgb0XVGgJ
 sWHLSzfkEGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZHRFAAKCRCPgPtYfRL+
 Tj64B/4oqNE04TOxf6Tn9HSh2bENkqqkMjGreFYoQembZbUj2FsJH2QpQ39iBGVH608PveoAe2v
 68AfdS4cAUfPFh/H/UHKc2UvWQ4DCWR5rJ9UaXDgXELZNpntSNzA8dAK1FmPz5s227TgJQ+CwcA
 Tt/hcOea5b1/MBboYi7L/IZCb/PnaIJP985CNQaHWzB8eKDoJTNOYrCtBiBNgfKEomrHuR2IhJK
 AOgLXNTCDlWdjDwr/6J5yiX7+e5NHn+SeF4PO3P22/0LsH/4DlbJAycUM/WA/TSGsqDA066kJgP
 zc2r5mSDI+n343ViZi4NGF5+aTSXGgI2V2lEXcDuoIaCs1Ga
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: BB10013EC99
X-Rspamd-Action: no action

This also gets rid of an old address of the FSF.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 48637863a4f5..43d280026d0f 100644
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

