Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNuDDPYemGnhAgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9266D165D8D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FB810E209;
	Fri, 20 Feb 2026 08:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.b="sJNqglPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic303-20.consmr.mail.ir2.yahoo.com
 (sonic303-20.consmr.mail.ir2.yahoo.com [77.238.178.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAE110E68A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 10:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048;
 t=1771498597; bh=rrbTrXlCINoMBfNNXDHwgZw9HDa91yRcD3bSDG+yogE=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=sJNqglPEbd0kh/B78WFHSFEnDRVGSfmkxbzk/OGqm9SRMXn5KVrtVP8LnYxd85BSJQD4nHZGbM+3RgtHR4erEH3+7UZDQMM/ZugFfCCKd1lX9ZjCcJxSQUMZKF6/u6/9T7YFn7XZMkupg5YICMil1JFNU3zdEtKQAzMxEQATnvgxlZVLAeVqb9zaVf2kKhjY9vJroubkkfSBnmNKEbKaz0fJb6qdM4GrfD++tDVGZQhUq41IoHb3DY0TA47fzNSaWAW5yWYFtOQzjJlziyvZBLIr2OMowP2gCBwzX9DU9GzP9aqiAeXFzuz4puUUA4wRdv8mUlRH+jBDsZ3C68DRxQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1771498597; bh=Bwpk3i9pTSI9nhYYQ89PSfI9uyD7oI2DMQGwbejdnm+=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=OecywdOgbA0fZSXk2A8GOj243OBIKpGwr6DrCxfFLaEwqeRI1NNuqz6CJ4352UqgyNJw7GP9FGUHegb235U9ToOjT8CDbw1LIhRBfRonxMewfptT5T1T946oN6WkytKCm/teQAEDjfZ4YPLnaN1XN9xWH+w2rLf/FjykXHBnAWCmU/5tfPTM5j10mfhVA7dYfQQzJr3t8E5NEsEIbtbLZfaPCSONP4zCfltMxageOgaodeCTL3gzLXZb+gyGWSna99s1dA5i1KxB5E4brwH2jGEnVYM72miQhnKx2sHFIc74toxKCQfWRdt96pueLlIYy0TNCzZW4gxcfASVHIskzA==
X-YMail-OSG: S.ibOWQVM1ko1M8s5z7YGB3Ub6TR9TMSEfj7u3LdG4mopcHKVXBKbKeq7YFvINL
 nyFNRiSfRznd_UEtXRjHm2YkQUqeg5YMyQ_3TTpe2y6FF9WeCFaEv25su9KcdCXcEKVLCr60wbic
 FFWqeqUy9GI.IuYkFzTqd1UBnAFFO64AvqD1Vc7KlTpRkTkifYaGeUJBtn8b.gscvInhGwcizpr6
 arETspksI9bItG4jbe_KvOuyOUt7R8HCFXo7YE7rK2wAqf29bW_y1kec1il5X9FCdRg0BJbonSyA
 dc1QbUjXYpo236.hP7GgWM68eS6DSvhsxy4tnfIkllnadCdDLRhTx39iJyR9msO9OuoFXghtnU1W
 NDSt_d_xkPZygecT0yC0kF5NHaT5QLxducuaf4U23ohoUajJ4ID_.sg2uc.Nvh.narcJYoPVLtX_
 vcIlt9Ob2_NV8FHyPCH0.ER7kPLIio8GBy1I63EXsiPiABS_INl6khZVMVS_fDelXFdtCFuy.KHl
 5oynLgkIp2IAOWPYZKnIc_etdzvxGav.QmkUSO_XAMrCR30Cxlky2n.AhRL_lnPDbkCoq_T4u7gO
 1q.lsjdcIMdBV.aRqTF_fgqVsEq5anX3XNB961KOhJDJDUt2X3vtczDSH2lfP_3ThHLSP.6OscD4
 tCe9dbqQqI.73W1EzuyZof3ZP6b71cMwWPUhtI_mwQGT7Lz905ufUhR8iTazZjunlDsD.c7PXSc8
 a52kAjvfuOhp6Nlzu0OH3Wq8XAG9w2xrwdZoWkxGILRHSf05c.eIfbm_W9j7RTYPxAh1MEbQ5UPt
 D3zSaPr5mdvuEhhqugxTkoFK6WD_iT.n3uzsU2aRX7eR_PLLv7hKECygIvl2M.FN1eEEM4KlJSNV
 wtVPjs8D.SSJEHyPKCv1sNInRwigJCCao15_0QVvBEQVAOOiWUe4m9ld.z0cBJmE0tQp6V8LkU.f
 MVqt5mnp1JzUdPzQeg7QRoMjh8RtaWhZR0NGVhaDvd06qC98RogIyoiXsSMK5MJk0_GyyqcR0k3B
 gbCReARBS.5ZNoaJ3GcdCYCZZo4Njwn7pJokBLGS_7u5sNmwNXBPzFcL305lR1YwzeKplhn7g0k7
 EkGWeE3mEJy2TTCUAETnPFGMnhTXu3QUbzMRJCrS.N8i.eLmTKqll9AdZ6_Xv.QfHk1ULVEVVo3s
 iMCrjky8o99HoFUVVKRDX7.6D5D7uMF27cZi4sFFOXqq3bo.IE9uyPXyrHzl3uXx0afgE0EBgtsw
 QoJuN6ZW6B_zTwSEYksMnZt0HXE9c9.aYDOXlaKkZTMzHd0L8Fm06Ya87rXHHxKGKLa6VsvQsP4m
 mbN8z8txDnL5ugOkwsfEfVWmBy06k0GtIMTXnAZ3vDjt5kwj4gTktF290cMH9BWXFqwW71GmWUpU
 yd2NmHpqRs9g2YZ7Kcopf.yWDRPPhDry9ZrPQF.uH735Ai.H0gzxGtRVVRubhaTehTGFWdQQ6510
 jJB7ZFlD0roTyzQgKuUmzS4U4fkatvMN3aCXZlfbZyfCrhq.wkke9LzqAAqBNgBZE.m47Uhb1IjQ
 jnJiPVp7Q4.f3mbGighSY6QKqgtxPFZxE7qP4ZWSjhvtQnRqrrF8xljTVtP8Xk._blXGzRJNvKvV
 R0zTIEypnTsoYGJU7uVxEv9V9JsjGkGDUnqOvCVxOfbYo8LX6OOE_VYggij3x6KPTYV0ToalIDio
 GIjVd._rrLviAYj5o2wzmULh45Y2.07VhIxVhQCtaCZg2KAPiK_8l6Kz27gG0ErILuc950ABZia5
 MqjVw0QFT7nnRET7j8BO5RGIbqekpsE2pXB1x.tMOfoUC9R6Xcfytt2ch7pbGKJtNlE29EaQ4PHg
 _3_4DSCGAKJVUw1DyXTuXSCiAT2MMmWQ6lyitZPaLIkn0wH8qkduPc1rV2Rj.XVbJIkXsTjg6_NV
 wPlZx5.INQ7DIXSZ5sAFo4MLj4KbCI.LVbsdGCdtOkWAhitqvWuifSl5ts57vS4wcoZocEfUJKnF
 BHFEdYPYFDTW_mAqmR1s9H9sFCTnoINy4kwPugbYDrsYc.Ov6vGvKiaWnZkwDcbPoV16_y8z4bvt
 _Na76vQPuFMS1TVoA5LshXgRQGeGQQv5z7osP5cwQuYvoO4JwXdLie1deJLsGfDEqzh1kJg_nvov
 b9wLEmf68n4RH.gbeqQfDhJNaiOgZpIop1DCvbzk6Msaa1K6K1g2LPUQkcPIxlSNafcdcoK.dfm.
 qSBwy.YLY14xDopqksw8uxB7dJRanfjwfc0O_tkGvuMegMvLuVhNJ.ZRfhedPzrb3pVSNkuC6Upz
 wj3DONzhX_Tt2
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 6fcd8d4c-b3d2-49b9-8aa9-98c6bf85263e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ir2.yahoo.com with HTTP; Thu, 19 Feb 2026 10:56:37 +0000
Received: by hermes--production-ir2-bbcfb4457-g4h2c (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID d16b53fd9273610de93e18c09654bfdb; 
 Thu, 19 Feb 2026 10:56:33 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: fbtft: fb_tinylcd: replace udelay() with fsleep()
Date: Thu, 19 Feb 2026 11:56:28 +0100
Message-ID: <20260219105628.43534-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260219105628.43534-1-tomasz.unger.ref@yahoo.pl>
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:31 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linux.dev,yahoo.pl];
	FORGED_SENDER(0.00)[tomasz.unger@yahoo.pl,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:tomasz.unger@yahoo.pl,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9266D165D8D
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

fsleep() is the preferred modern API for flexible sleeping as it
automatically selects the best sleep mechanism based on the duration.
Replace udelay() with fsleep() to improve power efficiency.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..3fb15df31592 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
 		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	fsleep(250);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
-- 
2.53.0

