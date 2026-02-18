Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F4pOzfrlmkzrAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:51:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B0415DFDD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C99C10E291;
	Thu, 19 Feb 2026 10:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.b="ktG4Owel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic302-21.consmr.mail.ir2.yahoo.com
 (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C25E10E301
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 18:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048;
 t=1771437833; bh=cbK30hxiRbkNBexcacpbyQUDpOSeiciDJhpo4iehvfc=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=ktG4OwelrfSQaCAaAc2t2V2uMD5kBKNutZPZgPgOJUAL4GD6el1jTlxsylB/MGMpIVFJ91iXKh5mmcQ2AA/BKyUiGdSuHK0jZShHZh2dbLisyXSP8yvIk0eET7ZxBbJ6DE+K/AtZIC5wAkS6z9BnPUXpmJBN4Eu19/pIFmMu4MjmhxYv3G1JiafVFVBv0abX69a39WsKMleKQnmBq3YyGi6esO6dupIgvBzryun+0Dppsamc56BLq6UHZE/AJjGpaX1OjDQ8zQlcaLO6siCaI9NHd7MYSoYeT/Ij5YTzS/qi73IDBlH1XXKkET7ODN0o6mPKz2fHm094qBnLvI5bnA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1771437833; bh=iBmuNS0S0W3VbpXc8UJQj+axoJ/jGVme1kcWB24gfjA=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=RkcYAMY+NHdZ15sa6p2bqnFEItoZoSLJLFdaUMVk/tKPGb6bhXeB1k1wL8B7MKuN/6HIiyNTGgL6DrmLl2Ttc1zKUY2N+KTCu/g3/jrcX35BcLTagu3AyOf/s+6UnC+FTmq/snv7xWN5arA/VphT4f+5AEoI5QMk6sc7Dy0T0/+raq7CnzXpJ99XLS/F8uYBwBE752C6Jbkr7z81zDLuPknx7jqjiRkS33oMYcifXuwfCl02z/NrrFRhR6hJV9qeOr/iFIcFloXEGxU2qLeLp4XhwhiDQ8JhGciJvHRZO8OvoQ191U9lsAUMEf4c+0svftZgn/Hya0wcJXT5D8JGfQ==
X-YMail-OSG: qXvIDw4VM1mFpUMsULFTrJU4c9cBr__k.Eobri7affEQtx5enCN8jNRnlfon8LN
 T7Rlipfdg5HQ99BGVgGHAtHkINyN0kf3YGsQILjCBWQnu.ssXKM.wyiIKAyzmRQLf9tU9udG.dHs
 eB6aW_tuZZAuOJLohl90ITHwNMidOueLglgkniQnGIO1Xo3hsixiG03QNe5eReIlxmMiEJHQbiAY
 UZRiow.eojaQIVsrPwLuCbOEkwZPMawr9KdUh_jCXzPQtcEDgkO6BnpPdUhcgakhUWIwXRknNYOG
 ACQ_qEtHTSF_UIfOs91Hdk7_NMiRDK61q4CTUcqw_dS_690WvjJpcXgXHhFiM23J2R8BeesK8PSZ
 qTF1oHtFaQzME_JoIScrvDT3emMJOYydLhTmVUS3eBzClTFMB6Yh72R3yphq15rqW1Kx71BkPuyQ
 hmf6tnSwRA8ARrWwU0Ae417Z5BQzAqKPMNizoJz2yPqVD64T7DxQqAj1An0Le6Y0HdoY2mm.__RF
 eYJAgm0e9LWJcn6TynbQ7W2ZPgspnm1UI98k0fweGlzFM0qUe9rsLWXGwiKsKCGqS_1qSn7fAfOV
 kT_ZpTDTZamIR4vqQaJgP1DJuj5.KLkJp8efTTboebq4fp.nMn0ZHpThn1nmDqECwP2qYOv_t7uQ
 wra1RjxcCtYGJgTdCZefQHybtZrGeaG2YCRV3ubO8jsLVzCK_tThgJHT3s4ORtDroPVgaQv6yrXn
 BTdff3NXBazIKCCmADI5jRMQ9ndAn5oZ9Acbkm6p8fqZ_0_HTGqkuP_T.L3XNtkbMKrVIEXaT9cs
 gO235qMyK8Zc05q__T9yxCMN73FQ0VOHgogWovtEKLLFp6bAveNXPmIetIEwjlqqIvy6QcnMeAqk
 cjDfArogm.pj7rtzBsVsVNf0aPuHFSzu6iBwrBoCXUSQXenp5fjCr3gO1BSM8saRlf.ay6Y2DwSl
 wQqILdovXpLooyC_jQGBE_42l4p1Tn_zExb9solZxlUqRLXDjqPVxyc.k1Adpa3C2VrOfzR4RKdK
 g3FtIa9yF5q.BLY7rvLRI3RUBW28k.aT3QDKQzVYrraETDxOmqnpnO192Wm8hBhVoBhP9JXHkA1a
 R2fhZzP5i0jnigqSOtCIe3WjLm3y.6caaOgrlPvDmGEsW6RgsN5vpBqs4RDAvAwA1VbR2gYNVLj6
 IbiI2l.iO4UINsryzQ00QZpCTqKWQzTgyBMmUFf7tQvrHQlvUno5dsV6ItIRTymGCnBAk8IOO9tP
 0OY7PDq8V1lNIrrE0gsROySXD4oFRTmrR_JaQW9q8XCOTfXoZwEjeekwufjI2FevAb_TZ_viIU4V
 l6kCHqXBmgp0a0mxrmNZndpLamuR8RCYnt5qriOK4p7Y.gMlqvHkcFUaf.JAj8rg5SVdGbmv_7EM
 msyIHGZs5Tvt_IHfEBdW3np6LDEB7wB9v4HNOLf9u5WSdFlWVMO7vXtIbtCro5k9SWYsjexlJTxq
 IR0I7Hf_X_oLTzP3Klya5oSccadBR.FPX3e3dLLHa8avyGL.Fn.IWqDmO2WLoGz9AZTxyvuOwEID
 kYtp2YuoN_eIIIU84ubzxL.cWjRbYh2ZzbBz0RjZWL5Xbk9LcGZR_dpBKYCtE3YflychW0UGwvX9
 4LCeT861v5CV_I_4bXdbNY4nvM4ysr_tjZklN7WRfq3aDQuvyP9zn57Z2Fz5YQLhGKQ9.a5j0BBu
 n.60zwnDJPx2tbIxNgh3F0htkR2ANnE46fjvh2CX7qIwpona28Haav6uoVp6Bd54YCPM8OvadUIx
 iKWZFudWMi5fhWVWUIHE6jqDQm_jf2KLxiiNxkd4gT202fRfgl8dZw8QmCelKBXkph_W.cz6jd72
 luydj5e5PoTtB5l2_zcbRTTQUCNmFF3QjSTZME0_s1FQV6_IVQD8DfDHTIixQyCSzdSOEyhveThx
 wOO3Lznadm7bYMviz1yq_7R6oZ3SOca8LCdki4Nkd7FlrxvXHB8oj0DFO7C_3l15viyhyZsQlAKJ
 moIXl3r8k5I91ySPcT5iSymB3vG0kUFs0ZK5RYLKXLTfmQUxzuAsKKT_vsYelfs2P96LZB8LfQlS
 _ypJHlN1zqgB3eiXm2zVLwiLLQi54x50R.X7iWngkN.4YRNePmUs_Q36S1M0zTLGPZ1.Zn0VVBgH
 srXQCJpeLGl.1pzdUkWATsancW7SBPP4jCqaAKXHSuMooOjcSCaCZZasYalL8CaRJUXSkNL7ZmFl
 gEb.8pruw91F1zCM_ZgbjEzRWQbWvmSDR8Hqn0pO0cRz8gWZJPNhkbeCcQbiV2D6y_lh5HfdGmUl
 s0vyHnA2aUDJ13_ywcQ--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: a14cd034-e18e-4282-9e40-1eb10f74d2c2
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Wed, 18 Feb 2026 18:03:53 +0000
Received: by hermes--production-ir2-bbcfb4457-g6b6v (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID fa0dd80118d0af9e03c772f1b03d5629; 
 Wed, 18 Feb 2026 18:03:50 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: fbtft: fb_upd161704: replace udelay with usleep_range
Date: Wed, 18 Feb 2026 19:03:47 +0100
Message-ID: <20260218180347.88034-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260218180347.88034-1-tomasz.unger.ref@yahoo.pl>
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
X-Rspamd-Queue-Id: A0B0415DFDD
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c680160d6380..62862f021b28 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	usleep_range(100, 110);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10, 12);
 	write_reg(par, 0x0025, 0x003B);	/* amplitude setting */
 	write_reg(par, 0x0026, 0x0034);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10, 12);
 	write_reg(par, 0x0027, 0x0004);	/* amplitude setting */
 	write_reg(par, 0x0052, 0x0025);	/* circuit setting 1 */
-	udelay(10);
+	usleep_range(10, 12);
 	write_reg(par, 0x0053, 0x0033);	/* circuit setting 2 */
 	write_reg(par, 0x0061, 0x001C);	/* adjustment V10 positive polarity */
-	udelay(10);
+	usleep_range(10, 12);
 	write_reg(par, 0x0062, 0x002C);	/* adjustment V9 negative polarity */
 	write_reg(par, 0x0063, 0x0022);	/* adjustment V34 positive polarity */
-	udelay(10);
+	usleep_range(10, 12);
 	write_reg(par, 0x0064, 0x0027);	/* adjustment V31 negative polarity */
-	udelay(10);
+	usleep_range(10, 12);
 	write_reg(par, 0x0065, 0x0014);	/* adjustment V61 negative polarity */
-	udelay(10);
+	usleep_range(10, 12);
 	write_reg(par, 0x0066, 0x0010);	/* adjustment V61 negative polarity */
 
 	/* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	usleep_range(200, 220);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.53.0

