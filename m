Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P9mMjbrlmkzrAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:51:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3090915DFD6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B6F10E2FD;
	Thu, 19 Feb 2026 10:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.b="sMSiyK7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic304-22.consmr.mail.ir2.yahoo.com
 (sonic304-22.consmr.mail.ir2.yahoo.com [77.238.179.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC23610E1AA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048;
 t=1771436867; bh=5+8LH/ttBDhQzOQTNsiHdkZH9I0ew9FiefVOo+uK+Xs=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=sMSiyK7YwtXE+WPsH1L1dpSOtlfqKKng2xY8PLDVNPrcILpapJXoFLdKLLJiU0JupD1e7/oDLNS73eIseAKKm7BIbVxBybPoPzDijS1AMMlR0fvwPI+bWVhR5AFgGn+dOyW+uIht5agHLY8DvhVvOUHNYJJR0WXL1nuNVg6xf+cORPwkk0uRRL1h+OAVBI3CI2IE8Xsapnrlt3JaMrqElTfhNayeVlh0o0M1HLV7Ad3xmuFgyGW2NbRTPss4iIYnqCcV7NLB65Bzgrx2XHnIA8sAyOLUr9Icsu6sdCoLqGiDJLgduihmj/xcF3+Rcgi/qHeoNpYRcAce2KFO/iZCMw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1771436867; bh=fNP/d+Hav1YR17Ed2Wrn6NI6I4PTBd9Ic8CXgDeg9Sq=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=jD7S8FKQ6aiOfkrnKGY11J187GYXe7BRIA1xRsBk+SjrVqeyO+wX05akIkjSJ5iMUVWs5SHTACqePhDM25egqw/vNMtyb6LWV/UdD9QwS5JrGVHgirCHCG5xpg9fojBecscyM6XVpvBjak6QrB7hQECYzWiaE7897EjA2pLvmYLYQXa53GNQRtp7127m3sabu6/sY08qI+imTgpnGqqnzld3o0b7gmyQ2eijJCpITt9OdGfpWn5gZkVOvsGj93Qi955+/cCgijyA7IyMrRYOJXrfNuVbkudJV9UVdwTXnUACV1XLds82e4LY51Bu+wkL+3Zho+JN16AMdguA0Q5PdQ==
X-YMail-OSG: OvZt89oVM1mPoTQrGIR9vJqkCQTriIgDK7pSx5FFBGBejYmvOukNlm7ern5lQI3
 jivIRjy5djehEf8AymmGgv9Wam1P9LCvUVVF2VmBwRAg8woYImSXk5PCw1ZPYLsEOykXSAsjRj6d
 XWA1za4ZtAoT8_ZFD9PuySuL1j_BcjVW4bgU0dqSMS519Jb12lIm37Oivady3LtRdR7.vnrSGSFk
 cHEEgncYxFS.HZRTo6q9Amc2tYZX_nUU.Vtk389suhrrAhqwBZ3u79DU_NPlYCdq6Ow1ad57kFas
 ob2zLOEWCOL0cpF6Yoc0FebTT9HZwafYwbsNWlEWGdJFxBqH.OsHqTMU.oxMt1kh68DYaZImDN.M
 vAe6.leZ.oS4.uAtlQAxvbXfJN21s0HIamz9K1Nomx6ryESTgoEpSy1o4Vl.PgryMacDueh5OhR4
 a948uVVMXYfSrTHxxn7DguU6q85Ld1x4ahe2OLSH.NYymOYVN5SAS.I7m6L1aPcB0fk2vx8T88u1
 cw8ZvkByFWSvvFUej2qatSeo9KsbyzcSNBBr1YjOf.8iQoHqic3CRfTmIJzIMmKQz0oU5LwV5z6C
 _Fd23IwVi6juoxiijemPiQeDhmcX_mtgasdr.fOXSHRixhHbJlPWzyocuhWVvXxJetCkrUAdxp.f
 4iX3neLoSJiRgsek01jKxD3hRtLEEVctl02YC.x6RUh5Rf4D2ujulDfwC0H4W7XuxhNsICs3X3DY
 PCy_bIz3nsMFaSx1q_c97Kpxjn8gIj1k8ASODqTiOwVGID_QDtyXxiipB2HvN4HwgOzkUFwWbErd
 LSwA3gJBXTmGHD1qTfgzlaDxYza81gYN8AOnRPoLbv7yePHDWxkxeRzrRllMV8HmkD8k29qarnr7
 bSvDgl26g.4Y7onH5TgVq1umbApQWpSeHwRrh7hBp0AVOKvaIVs6rJVVw1DDoQNF_fM6R9u_2dTj
 ZSjfGk11FOK0.rMKrRzDwdl47Tjgcl3GIBkngRhDAa5NGR95PvyAukOiIYNKe2W_y7Talvilioq9
 idwufv3sA0Yc4j.29wROiJvMf_.sKq56Yl.EYBPERshwUVLpswdygBFHDhv70qOFrFd2k1YKqrgQ
 cRJW_kHq1qILgoJBZdDd53eQwpPeTpnhZYrgHYIvGR9a51yMh1RVeZXR6dzgUHyOPnEQKEJMNVab
 ARpp6U7zBBGS9AzQha_Reb2ckMZtT9mlT410iTT82ce2cNIntbSh9hklhM5wYcwem6K6ARV2EsKi
 GNoAxH5EttxApPs9jaVwdt.t_0dvZPv7mw4V9xczkvFY6sz5XL5W_tz2YJs2iY16RiGH.VfUS1N6
 0ICTLgIikxGmtijK1qDuYSIEit6jWgIpf5ckTt1MaisORxbjHhEfsMOVh1O_mPh1JXa36pSgd1lm
 861WtPADJTaGGgxCKrKG9bKDteRhrYxrLb0ZI1BD.yN4aCoGn4evuqwyqqgoadM6LZWTSq2Q1DY5
 jFskUqNmpnwoByLgXJw5mSzPQ3StkzxbyPZFlyd4C9U9sThabuOnuDTynOM6flQ3SaNHYWEyVz3d
 jwIzjP1sLm2UAqam15QJQ5fpKz3ue1sQKryPPWI7QV51Sn17rDvmsKGzTIW2zJ8dwTIMMRqzyOxL
 638yGK4LXxe8sWfPMLG87x7H.XkxoTvK9E4HSE3Yn7k.yB3seAHok4iV3BACKYARU65K0cQSWYim
 145spClqc58yo86jR5C_yqMwlo.KQ5Dj9V9216iHCrgikIZKKiA2rsErhqhXZjNP08Su_r0SxMua
 6jJ86dqCK4MqcSdvhfGIGjawDQmE7AVTnc7u3nQws1QXhldLXJDJwxhUCqsd2kCcGorAJrAcj4Ey
 OZCNKI3HEuP7Ui6KVAys3znMMhMpRgNxtn8ComO9lJDalDu7s_li5r8pQ3pU4_atzl8mbJ.FH4Dz
 IUECH6Djd.aYu7lhE8870vUj1fQ0VNlvZEPSVpcjHuI8tuP4X0NdB_GMmLUU9Dpr__9e34ltQAA1
 Bus8dHOIFsliQCi9LBkKZX6_5UABVjrslhlTv4VuH9uA.KoJEoLuCjoN5fmTNNjTXkUo39CcwLlP
 Zq25pVCllKPLrfTFLPvnt238Mes7DZa8M2cdGyT5XuZtvEhXpM4f4hm5.9Vi9I1FKT0r2_j4EVXU
 T55iAkPu_LhI1gKzaNlfwBIuojgcJGusvpzxTz9FvshP7QJexkSzdQKOaq3bfooys2ko9BQa1x.E
 .T6UhtjYy.mRFH_HwC2o6B4LQTc52e_ED4DlCRgtG.4V5qNokEpvJMcuXd6aBFgoaC0wtFlr91Lq
 llA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 457f293a-9a80-45c0-916e-296272d1d882
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ir2.yahoo.com with HTTP; Wed, 18 Feb 2026 17:47:47 +0000
Received: by hermes--production-ir2-bbcfb4457-g6b6v (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID d8b8c0de62b821a074fed8fe833a97ce; 
 Wed, 18 Feb 2026 17:47:42 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: fbtft: fb_ra8875: replace udelay with usleep_range
Date: Wed, 18 Feb 2026 18:47:37 +0100
Message-ID: <20260218174737.86994-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260218174737.86994-1-tomasz.unger.ref@yahoo.pl>
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
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:tomasz.unger@yahoo.pl,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tomasz.unger@yahoo.pl,dri-devel-bounces@lists.freedesktop.org];
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
X-Rspamd-Queue-Id: 3090915DFD6
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..ec4ce534e409 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 110);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 110);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.53.0

