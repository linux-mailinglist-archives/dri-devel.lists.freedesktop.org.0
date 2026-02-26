Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH51APyMoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC51AD59F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6CE10EA04;
	Thu, 26 Feb 2026 18:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRrTLIOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F0F10E9D9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 17:25:42 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c70f5d6a6a4so611510a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 09:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772126742; x=1772731542; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SNtQV6U7Rntro5/+pgriQkg2fm6u58xz5i9CJk9lKHQ=;
 b=nRrTLIOSxb6lG2ZgWIrxLixMvSwG6YFs1Z6tzAODrTE55mtjwY9QGdrZ+OR5sa3ocs
 w5+W+4CbfmuwdwYvPu+yHwtQC52kNbTXDlbAj2Hscsedd5b5WTJXeEUBNXreYQ0dfDMy
 dfTFCva/zdQW0nmgKkRckhSnvgLHWnQTf8SF2GVdCbBoGzbRF5I6Ny+8XosGPQtaO/Xt
 pg3LlDa0iRwOxpP23+0JSU5NMMFuicNfGVZgUmANzhkAillwiydJzxSmJGh8e1kPfLue
 ApF26A7m6J8/cwvnZ+HE3UoTscLddobALeSR0P5jDSsPXuzC6R25dZb4POL9oMA84bAr
 Hj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772126742; x=1772731542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNtQV6U7Rntro5/+pgriQkg2fm6u58xz5i9CJk9lKHQ=;
 b=hl0CLuR7BxsVOmOhqOkEglU6CQz6WFEAi8Lx9HsIWQcaR0+WPb63mK9sRrG9iE2KNY
 krs4UZAuoBhIOJNndDOJ6A2IHqqGBVsQtzo7PfaDyRWUqBF3J4OSYWKg1YIhzLlHL4tC
 RlGUw7hlp5rhz5Wy64B6fFDfcXiWGtzlCRbAcsfYX/4iwZ4VsB/u5BD8YYr7DvZJaSTC
 0t8KsP2GBWkhJCGqV3EB1t4az1YP+Xn7n5mg0A1mMirIIS+oi4N3Dhk8XKN9DEGLuDav
 koPUAzOVPDAK2fc4Qq5eLYK21iMLTtQn+BMK4uJTpoASbt7wo866OmMw/y9SA28H4GKC
 WoaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFoLMdiijsh3jz01Vim6NQT2GEK/zL/mkNOonMKeHYN7jPrcSWocktDV2BkQC6lLjXxMxejvlxmD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzevqF0Iblo6dw6x8zr94eL9gJ48iOAJdYyjMnldtWk7g8oDa38
 l3qKHS+V3gPDop+PO9QbgftEdUNA4SPVvWzyzvECOHtxplyF4Xu19MpU
X-Gm-Gg: ATEYQzxWrKN106fmxY48e2w6zKbwIfmHxPCAmEVWFbk1C+/GqTKztWBrAKTtmffcDIH
 9suDROtl1PdCBTlh0MLLTQoveuNT5otyozs6LyWg0HJVMKEeEkqSsU07g/ZHFJ+hN+V9ApvTgRC
 ZkLRHmRJmFkD3tYb1ZUxxqVv+sVQqdhx/ZDqp323rWqd8QnCKuL+Z9kQAau8Ii6aj6/mv6w02wB
 dNm5JffnsojAHAe4EoMg9Kfc/lrKwINE4U8F2E2veLTaI33PONVbFQwSIh4u2PvPx3YLSDclYy0
 bJ1T/zPY5ffWxUDuMDYSxgxnemR05VQchHnBw3Zey8OHQwXFXSFlBTXJxsMs7lkcSP9EFkOZH3A
 kL/s+XN2dSp3R4PETg5zj5RQBm8VOl2U7USqm+TbU6w1Q2jpioVlNVyG0WiX5Sad/c6HyxxK4In
 D8awl5ESbuDcgZJVzcwEphruJvvg==
X-Received: by 2002:a17:90b:33c3:b0:340:ca7d:936a with SMTP id
 98e67ed59e1d1-35928b880demr4894986a91.18.1772126742205; 
 Thu, 26 Feb 2026 09:25:42 -0800 (PST)
Received: from latitude ([2401:4900:aafd:b886:9ebf:3ac7:7a9f:63f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35912f5f29fsm3692895a91.1.2026.02.26.09.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 09:25:41 -0800 (PST)
From: dhyan19022009@gmail.com
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jason Donenfeld <Jason@zx2c4.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dhyan K Prajapati <dhyan19022009@gmail.com>
Subject: [PATCH] staging: fbtft: fix macro whitespace errors
Date: Thu, 26 Feb 2026 22:55:31 +0530
Message-ID: <20260226172531.13714-1-dhyan19022009@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[zx2c4.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	FORGED_SENDER(0.00)[dhyan19022009@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:Jason@zx2c4.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:dhyan19022009@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhyan19022009@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 3CEC51AD59F
X-Rspamd-Action: no action

From: Dhyan K Prajapati <dhyan19022009@gmail.com>

Remove prohibited spaces before closing parentheses in macro calls in
fbtft-bus.c, reported by checkpatch.pl

Signed-off-by: Dhyan K Prajapati <dhyan19022009@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..409770891 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.53.0

