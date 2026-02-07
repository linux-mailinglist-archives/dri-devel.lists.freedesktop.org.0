Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIchI5mEiWl8+QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:54:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBAF10C430
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1718910E0BA;
	Mon,  9 Feb 2026 06:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W9CbKvf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4777810E2C5
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 22:05:26 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b8e9f89a8e3so359842766b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 14:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770501924; x=1771106724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CkQTUcevqbbom2GaQZHgQn6sBJw6oM5+vBUm2+nyG+U=;
 b=W9CbKvf9FmC3k0iCeMiyw7Pn8w6e7psBkncwyXvEn60BD3lS56/c4fiZ59lGnA6X5P
 LRto9jkEzp2tt4cmWwkS2erLf4TX7mfY6nXtflW7b8yZJlYGBAmAVNKcYLThur4PEjST
 G/jFcYO44NNevck6Z2YQLWqXhdFgeOJ93cpUifesaXtbb+rlrEXHMAz/CDsZIIfV6g4t
 EaCh/bRfFJmNSwqYlv+8dP+rzPW3O53CTHdU1XyMTUFNweqLSUPkDwptFNR27vBhwFtI
 +wZyzsY7D4e+isgQbJB21gz3ZgOowU8HN8eqXGSJgybadMnkuuiOXrsGlgmJW0dCyobB
 9gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770501924; x=1771106724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CkQTUcevqbbom2GaQZHgQn6sBJw6oM5+vBUm2+nyG+U=;
 b=cHYOLsxugOaU2nQCitQ3fFfFzGmpj2IMn3wuVcigeHoJYwTInM5JfPAJrG1LeR64pf
 m1WdEflg4lROJSpHdRDkOJQmo8kocVU+n/FGiPH1QPlw5uh3tN+pAhfPbYJiJ4f2fbM9
 Sl+G0FdTUXbypbe5mWir74eFbR5kvkjMQL+WtjnktyvXGjwr3RF30YJy8PhHb6bkajKG
 SbqU7XcyPRgjmJt3KGj9zoXpj5FHUOlA5SQQgn2Oc2pU1DDPDMIEd79LWRFRmBWGUM1d
 HHeeUyuJq6AyZVLveQbLyIj9T9yfbfstrhtkTSHJNPgNjJkxhwsZK/JuLdXyAKcgwL3q
 X+FQ==
X-Gm-Message-State: AOJu0YyOjewPFTXKQT0p2LCJgg6DwiyArqF1fSVbIQTyHnltndM0OLHZ
 l9UBd56Dlp/n7SYS2iswLWPiNWI6pKsJzqYQNakoLffoC1mAoZmWP5b6
X-Gm-Gg: AZuq6aIz3M3xDWgytuf6w94QrnPOOYdZHz4Vm7iFVtrZ4RlYVkXDV9M+iu8G1UcZ/LS
 lwaOJVaJJmxtxm8qoShb7ngS4Bt/nChTC79ECsRfitlHpN2YUw12Vp1dLNCgAx4368V5jGMADqF
 wsF5Th97Er7TEnNJ8P0kQbxTjiMx1YAUGH1J8WYDu80EHvpSr8QCebE/pjp0eoe3hlSxNDTC8s+
 ZEPN44C2jdC4rB/3/+PzJvX1dd/7S8uaPcOMPXBGohAXen08m6ITCBCAaITAuZB1qw8p6xPtZd1
 XF9ETfRi/wIC073yGh14NXLc+RGqTrmlmon4Hm+oqmnRU5IfwVHlO9VJXz1d9+Cg9n8EntB//Ij
 OJXGJTCifGCvS67maJJm5Yaj+FplZIk5iKqSYG0pLmLj0zrGaeCGOlMB5aN/ec+hFZC4aEKvTkz
 +2MyzzhQLQ4b+vaAaVO79Yer7IkCygXUH1ejVkn1QgqFAs0wn1XcFaiRtjuq2Ji5YKt+nwQa5qW
 R6EmAFwSfLnrkdnUJjurroKlEAI4oyjfxpXmCncKkXs4YB+PmZ9xdmz
X-Received: by 2002:a17:907:802:b0:b87:1590:d528 with SMTP id
 a640c23a62f3a-b8edf2fe560mr403194166b.40.1770501924363; 
 Sat, 07 Feb 2026 14:05:24 -0800 (PST)
Received: from
 cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal
 (99.86.90.34.bc.googleusercontent.com. [34.90.86.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8eda7a46ffsm222487666b.17.2026.02.07.14.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 14:05:23 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: fbtft: fix unchecked write return value in
 fb_agm1264k-fl
Date: Sat,  7 Feb 2026 22:05:23 +0000
Message-ID: <20260207220523.3816-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Feb 2026 06:54:11 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[32];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[iprintercanon@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:iprintercanon@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[iprintercanon@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3CBAF10C430
X-Rspamd-Action: no action

The second call to par->fbtftops.write() does not capture the return
value, so the subsequent error check tests a stale value from the
first write call. Add the missing assignment so the error check
applies to the correct write operation.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/fbtft/fb_agm1264k-fl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
index 207d57854..b4883c365 100644
--- a/drivers/staging/fbtft/fb_agm1264k-fl.c
+++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
@@ -375,7 +375,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 
 			/* write bitmap */
 			gpiod_set_value(par->RS, 1); /* RS->1 (data mode) */
-			par->fbtftops.write(par, buf, len);
+			ret = par->fbtftops.write(par, buf, len);
 			if (ret < 0)
 				dev_err(par->info->device,
 					"write failed and returned: %d\n",
-- 
2.43.0

