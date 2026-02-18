Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Pq9EDvrlmkzrAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:51:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF515DFEC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF87810E6AE;
	Thu, 19 Feb 2026 10:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.b="Fzkm+c9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-26.consmr.mail.ir2.yahoo.com
 (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EF410E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 17:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048;
 t=1771437325; bh=W+sJ3VNDowmOBUMcqspMoPWR8FdjjCPVp2YqC2j+X9M=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=Fzkm+c9eHXdTR6gcTm23bTodZTuo9/BC4tRNeQ58XTf9mJ4K3w3RqEkQNgOMpNDcj0rCMRHaILVHHwtIohI/myApA7qFbCm6eItFRNioXiuLJOlbJNKVxGqzsdFVYGiQLZgs/KspTX+sm7lwuEIcnl+7QU9AJ2W+i06uLhDNUQHBBRuIQX06zE1/SSra/CIwVUeRxN6hd9mJeKfn5DNa+DuEvMnNGarfjKdGZ/aZQvrnp4Up9rU5nu3CAiBHOMm+sPXwQ13etNMMrFowrjCXdloNVMP43UWG8FeKhBEXNLD9Whf9X8FVDdaEg0i79mIOGtPzmXKD+Yo+XALselixnw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1771437325; bh=D6rhz+TuHIjbtfgSyh+ntR4sODd++yTOdiMyEDz1U1J=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=mlM+5IZ2uoW2lcwIyAw5d4uWgfd9gy2amifSmLyzU3lr8E76qWvLtDwV9HMtb1YCJpJvqbr3psfYZ0NBoQS9/xOuSUX0U5FoJkYVg/4PcvnjDpjVEldhKUH+JThJ+Y/SuGYsfwloK+RxaveFbhFGlgwzPZ0dzZ3DeJG93r0uPeHnW3DkG5/zLsaHJB4n+xBalg/7bqxefOzjuCP60Ztrw5a9uGLrjwkFO7OpsAUtwGGVuepXGZDfFh/kyM+2PlXlX/+0dL884t3YsATb2o0A5nkwmruMGo7gbK4cRJBNy0WCtC3jM3Bb095egqaMWfRvRZ+edzfvOt3oc3x4nbajbw==
X-YMail-OSG: 4sEOnZ0VM1mbcZht71G0dFrGEjLDtJmK5ZLiamtq6ezmjcvmGlxK1R6Pe0Gc91C
 71WLMqd5mQbAyq46rzW2xdMjGhl7ZWhjCAAELhnwyMCWggH6zEeM0VuokELTOd5HWkX2U9eaf4VU
 jP9rQZ8ADmlCdEzoYrv4hQnR1O0dGl0mQsfMITS4iT339S0YKyomc6Moye3UUowLxmN14t0L3lhZ
 rtFgWEOZp50hHd9IBZiavhOcr0LULAHuXde3Xet4ugymrZ85ZY70TTWJHXlYFFFALG8ePG7sxSKm
 prfEeXC9H99PuwZa_Rb2p149khwEGmQv6.KBjND4mDB_LauqUpQbDS783QkCUC_UgNbPDcA5hBNa
 E5SW7hEIj2wMZt07TLMqAxSWnwa_hZWFk1NFF1tfPIoVtzHKdtTPYU2KfyTz0p9rKuFhg7GtECw2
 FBGsrQ9ea80JugojVNRAWLXsAF1dFsv7CmqbRhqToLFMfOE0HtAKZDj1P806tdlA3bKEIeZJvIYi
 a1MKnBhLS0aLSM408pc2U1ALIKx.Xr5nTkyH5ZHkPkeWoBCLZJ5BbYRlyescA.vm4JJut0quO8Nq
 .9L0Tmshz68bdl2zZIMUMuUFnIazNTtsMfr_dQQnSQlFvGFJqTqI6yiripcaBR9iM890nzzAJZ9_
 ktptBrKhgIj5EdDJveFwqqRsdXGu80ppD.sJgmBUvxtSvdWHC_5NS6NcYS8wWfJdsLLUTV9wqmGs
 PF76RjnFhKdRU1qBkHiC.MeCdeLOh1hhxA8zsQH8zsC5.AYn0NXHMQSS41FzPHxi3SOoWrv4p9Gy
 b.ScV_tjEGrlRT2iZ_gOlcQWb1tZtho6rYZpSWFtxSxHMqpAEa7vrbKEnIHJ9Cdu2uRF04Rny57F
 ZTCw9hrPB9W24lpnGxhcTHz3P8VN8Ltz6B1PdkhIt_L7rSUBUT5oKm3Odv3425vPzR3CRQMaOCig
 irwAGsmcBCQNhWw1m_Z10W3xjYdqlfDqQHzVR.PCM8Oo5dPJnMf7HtZ3yCIZN0lM8uzItjm7j2WQ
 zWWcONiSsneBOX8.NvMWq9qTvVjwQtq8ttT0OG8hI2ytVd8uCFdt3_bsC7C1ZMDHSu5.OLejmZVW
 vwHUarc7j2SeUAnAAO8_R795nloFRTgRYcrPw8qBQOtXdSAbvIabEut4jzejPw_mDEVPrRw2ytkq
 rGGZobR3lDX.wOL4QiP320tBqg..0U1kAQ0TeCx.P3ACWiOjAdj3eC3FGhbj9n8kNNaQaAlR36Ku
 YGGgekb7w8kdWqbcrCSpKC4lfPJnnIfC7CMPnJtGZOmvrIo88kSeSveJ.0ziKQ7FUoqvmAlLCxkV
 nf4mizBjZJYcJpyiZwYZYjQwC6tkSlr305WEKbg7053HNw9tVKqqW40z_RFPzXZRoLcMLcHibRf4
 om9DRknk9Yo68mdJvEjwhKPpXTepVDLx12E.PchpTxtjRJLvAMQxGw4UwllsaiHLKiPElRieob7H
 XQF9rCNzMbF7Rn084tVj.Eqo8F4QWIFIjFQCBwDvTkzlJKGMxakVBNWPGoQ1Xrru3n8AUZLFPJYg
 RYA7VXAG0Cbjw4ZAvrNuZ_aO9TrFEwumx0nm6A0TNCHs_KzlYAno9OFSRpUReqAgQFH8O4Zu6B32
 ntUCr6yB2pLG3rF0L9fzoRkRUWKqG2U0jgriE2phi8AI1qAAupPeBNRCzyRhoSS_CUZPmcxU2YOZ
 l.ZslBwgJyLrIe.kG0m1t6sd9n5SePlhDsH65CSRdZYYPwwfJtiNfK6NCE76MBiEpZkF7kIpEn_I
 U.h.eUzmtfWWuDGZTTjFOFRncPB4ORqUJ3ndZ6lnD9JCsG0.tXvhYIxaOt4MhYy_BhmpxuzoEwf7
 lIkRhnMpwjZ3IZlzH.k0vwc5z6U0P4q4_PuyjUvf1F_ZFt0pskF_h.YbX3G9I4sJELXaA13vbNe4
 ckfijTGBM87z7XVMFl6v6Q9lqR4wlhryjv2uuBJaznS08Cj0qLLhvJT0mlNrYDo_MSp3GbjgeYsp
 LfDz_Ur1Gvyo361fpvIDBNSR_GBCWm3ZmTm2CCLn_LLPX2_TMOcXM9D4led70sj0aLyRCXjOSGTb
 Bw.ETulnd3khi49yZmptgRmUkEhzwnkSZ3kRH4xsx9U9nAn7AruGoqyTwXCNyHurcNoEImOkGbN7
 3tUgHg8Z3Y_LG8iYF.1ARNY9ywF1Fe2I4V8tiuav8vHEvZkdF_Ki48gen_RgL8qTBDz6joAAZTWe
 VpKY3VNrw0h8jzMYAQnnfTeBYwFl3FYsOgsXa5rviruiDLQy88P5QmPdB1K31su.rOQkDhsWIell
 tpcow_ux7pjE-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: e8bec533-c71c-4e69-84ef-a68bd4914449
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Wed, 18 Feb 2026 17:55:25 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 629fff2e81fd17e3702ad5303f037aa4; 
 Wed, 18 Feb 2026 17:55:22 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: fbtft: fb_tinylcd: replace udelay with usleep_range
Date: Wed, 18 Feb 2026 18:55:17 +0100
Message-ID: <20260218175517.87544-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260218175517.87544-1-tomasz.unger.ref@yahoo.pl>
X-Mailman-Approved-At: Thu, 19 Feb 2026 10:51:28 +0000
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
X-Rspamd-Queue-Id: AEDF515DFEC
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..89ee7b9d621e 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
 		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	usleep_range(250, 275);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
-- 
2.53.0

