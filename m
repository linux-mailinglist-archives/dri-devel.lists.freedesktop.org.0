Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GT4HREzqmmNNAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925D21A621
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CCF10E2E8;
	Fri,  6 Mar 2026 01:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OfbcGuQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC32710E2EC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 01:51:09 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-676e5c56fe1so3867938eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 17:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761869; x=1773366669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bUT8OXayauJDeUXGjkmGNUpTYIk2PPPOV9CpVsGLhj0=;
 b=OfbcGuQQXk7TnXTWL2CayiETbUGRKuAKDLAR3z/uCEMjgD1qBeHy/yzGSMXVupEMGR
 b1I577PMAa+ymRxUfpTRQXdzugWJYIduWvXZrB54JmFZhkXboxKMmFkQ9KQZg7g1tkjw
 TjljFOJJT0AeGdaGlc4mOXCpGrgtDv2ILtydNFZ2xtcSbObXuuOS5mGaHMfL7OGpCd1r
 2mjRq9CV7R4jK6R05IaJjfIE1RYWxBoigAB3fSHA5eaOTd4A9Y0LGKth9zLoFGeVGxit
 JGMZS7rLQEu13s66hLif+27ugwoSsWUzlVvKDwgCcEWtKmmU8i4PSoV+qK0ypcrsi++p
 3nHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761869; x=1773366669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bUT8OXayauJDeUXGjkmGNUpTYIk2PPPOV9CpVsGLhj0=;
 b=CWOTNdwOyEjdOdKq5ZI5h14Oll9npAn8uDvtS7Foj9Qk9IwZDMBlJVrkd357bm05Mt
 rPokhm83CUB4gG9WS5quYMzvlPwphQ6ErgX3PA+ou/UKhKzNIjrM4SaH/Vs9Pq3TKxTK
 j3HVk8waz3r8znoqQd56KPkYKHbrTUs38TcEe792P1pogR/sCSeFkVZdqeCtbK5i9kyO
 WyUcQqSJ0RFV0eXJuFKZOZTFizQBpFlsvHXQAY6q9VGTlJGWoM7ZK54ng8cQsVygWLG4
 AFrlVkUH2NtJVWW/eCESbDFh87B+Iy8yWvQs5Y9tNCRJL9HvnOGqAroJXt1i/zabX7gh
 o1Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp4N435u6KkEnQa6be8pXyfqK7JQYQo6eHGc8xUTtvHXv+WLITsFsZwP+YfdTWXZDLxqgdRpzhpIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmI3rjMj4QFa0StcQIBNHAu6CUdQ+lagyFUCHX/d4T83LiFuW0
 yyOfqVBsro10ZA0XCiwGJPjgiFmk13iV0Qs/ppoRE9vojOJO0lswY3sz
X-Gm-Gg: ATEYQzwhHBEYVn2rHmHlP0C6ark/gMkxBar9IpSrHQtfWzmTfbeB4LQw43t2R5leewt
 3Skrqp44rolFTwYiN+okDGqho2v/puXdruECiIxTUljYd7hwpi2h44PCZuO49zYY0wFeatD1LjW
 HQi3U/KuA5LNhvqsRkpazOGhw/0n3USeIVKED0PelqR2024LtTLR/JO+fDYYaLF3j7Ws2V1aQ1E
 ilQ6hgKAzq681y25lMSs2XKXuLQPFspxb7zzKIcGTYu5DOFu3zyHPHhuN3NogjUcGkd/MhvThLd
 4iqRqxSPWA8IOSLJkbA6l0LgAN3wH+BqR4QFA/iMOVSJtMyZA4Ax0QPzX788T4xX9Hh3CdIc/PC
 8kjxaL25hYBNE6bMS2qZAqrZWWLTKriMpzMMi7uidAH02O2wWrFUzRQVvYogD2eUw+G6NQVTyJc
 RM5TSJPvq7WLGHFdbzRm6HQj8tLXoQohf8my5N4c87/ECDl2vj
X-Received: by 2002:a4a:ee14:0:b0:677:3b8f:43a4 with SMTP id
 006d021491bc7-67b9c485db9mr276619eaf.36.1772761868900; 
 Thu, 05 Mar 2026 17:51:08 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:51:08 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Joseph Tilahun <jtilahun@astranis.com>, linux-serial@vger.kernel.org
Subject: [RFC PATCH 3/7] drivers/tty/serial/serial_core: ratelimit
 uart_wait_until_sent
Date: Thu,  5 Mar 2026 18:50:06 -0700
Message-ID: <20260306015022.1940986-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306015022.1940986-1-jim.cromie@gmail.com>
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 2925D21A621
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gvt-dev@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:pmladek@suse.com,m:ilpo.jarvinen@linux.intel.com,m:linux@treblig.org,m:jtilahun@astranis.com,m:linux-serial@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,suse.com,linux.intel.com,treblig.org,astranis.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Ratelimiting these pr_debug()s can reduce the console flood during
bulk dynamic-debug activation, in environments where a serial console
is used.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/tty/serial/serial_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 487756947a96..6db465619c70 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1790,8 +1790,8 @@ static void uart_wait_until_sent(struct tty_struct *tty, int timeout)
 
 	expire = jiffies + timeout;
 
-	pr_debug("uart_wait_until_sent(%u), jiffies=%lu, expire=%lu...\n",
-		port->line, jiffies, expire);
+	pr_debug_ratelimited("waiting on (%u) jiffies=%lu, expire=%lu...\n",
+			     port->line, jiffies, expire);
 
 	/*
 	 * Check whether the transmitter is empty every 'char_time'.
-- 
2.53.0

