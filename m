Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBKGAvgemGnhAgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0596165D9B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C8110E7D8;
	Fri, 20 Feb 2026 08:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.b="hpoMxVM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic313-20.consmr.mail.ir2.yahoo.com
 (sonic313-20.consmr.mail.ir2.yahoo.com [77.238.179.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0177010E025
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048;
 t=1771511387; bh=VaWBo28dAnDUHCoe27rah1Dd7vMGiZtW4luXFceOsR8=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=hpoMxVM7CPkon7gFet2ionzRhAi6f+6NVfrPcidbtWY/Gmbf7mmtmybRbnPiThD2KcVXK/mPJ8W9l3PPI38x7JLDX6XQiXlsGp12l1eT0nrsxRHLORBFI68nUSPSPN4vqHnMK2hZlA0KK2Bjt3kOkqQTRlHCKSr1mmYbweDDf8FEJy52ic6utbBYrs+55P12yuC9sR0QYyfAieUilOp5QeFNUafk0xd+KMIVONxk+ROMyAjK03Dz5Q0iME60E2l0Q8/p5pkhXuTtbrDSVpihNflj0OOs7TG/yZysSrj47EwS+xxhL0UX8LcnvLzKZjN8kAhsE6qbfM/771BEYSnLmg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1771511387; bh=DVU6hsjuvlgw77AnII+fJPKXgUPBadS2QXiXa8Z/Vd0=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=PN5WPjnQ0rnDY7gQZbNW2B0Scdt+SNzoFzWedgye8srVFHmsDx1rtwJXVHhPWlaIbEaRLaA9SDF7LdUcaGc+9Enh8V+WQtsng6KghPQeQFd6MPWsE9d9mesVUrJloueo4Fb/TMqOd3Vcr8xa1kF8uAdtiLV0TBHsaxXRtDMxDPV7f7dGjHbGlBF93afajoT9d1lLPmW/9s9CgqusGCXY9EkUBo5gB9F/grCEy396kf4wcofZhSxi51slzSyHOZNifO1FWBotzf3bXXJl76sjCw7+hytYDlrkq32AYp7A2eo0kAVecQGlkC0KWEC+921AiKL3dBe3Er05WqumhGEKng==
X-YMail-OSG: hKG6g38VM1kjQAph1KGJncCm6PCG1lp6B6am4wmamr1YwcT.tdBGJprRfGCBNG3
 9PANml9LdJknnHPQcF8DTt.GndYiyCM_an16l92eF9.6M_8roz.ewiSBfze1czBN7g3wpmkfgKb4
 nNpiaJYHcL363wMA77.jLnc4Cup3GCYyXevnxGBzBY6GXIKua4WalUAUinPf4WVa3NQJJLKEaWq6
 DKyL_69mv63BUrwSZwEi50ZxOyd2c8l_96BTiihm6LAkTXxX.8DzThf38q4NogPoXT7stVJ3gtKN
 MT6mvuOyqP3Cs5UsCsu11ni6POHWULl1d3.3Xx9QIpuJ8D0Wjxn93ZM9uy7yqVRJBxutBKIZNxJw
 jvzG0ndwcG_BFSEjExI41mylJCBhXPxgFjTVJcczGnqfLNelsW8DJLz8WojgLBQbSTpiALME8bRD
 Is7sHKBnsca1g5KYIBM12id83uGfN6arzzF.JJY0ReX5YqSEu7LSyK.WmjsiTFMZZ142z9S6qVEz
 lC_xri6ykOBltN25Y0DD4bSN5bt8xwbizekLMouOR7i6u0mjqsow4fwAAeddqUsxqUccCcegcNlE
 Vl_OG01r0Gi1m_6_rObZo25Il5eMkXEejaEZjeXUrZBhA1GkvBe1FHqurxmalwFAyGkxL3fba6hx
 q_izTfiLA5C5JBJMPFcH6Ski4JxfDZsLHQu.uGOHzb5tycEqXPKIkc4uu92oqbJ5iQmMFjiT2bGz
 QkZdwXJKmHTVSrI54cVba9fY5rmkzuQ20AUAUeSUXdPVxmsSgjvdrglW9ctSDJYQoSdRDoleyVlT
 LfVsT.rJWFG.Vio9S9t4vHpsMmhN6iN5HZS1yAHS8fIm7xItNYRct2geDznnJr1QW8irMxzAo3ia
 zrbdWTWbIc9YKTmZ87MDcWZ1v0R4PSYahfW_gnYDejtS6HaBMftZXAaC5uOQFaJtYjxLMtfNafSQ
 MsU0FyVDLuXF3mM7a5zngRhVCC_AHSC2oOz_PNs79CRzOdqxwcXKUmGgjVZksNHjP7ZFpo9wkxae
 qPQUqm58W8t4RosTX4JisnhVf6Dqv9.gNsQHpZv.Ngk6xEqB4gePutJkNgkl9qxC2Jtbb4Uj8YcK
 15XjA_udd_plYedgxNs807.de_bXU6Nkkmw9eOmQ7M91b.zDNO6cWwMR_GDxfWdLiwnvhxc34gbq
 DSqKOhAVkgYmgOgkVRzSTgNuUQIiQOAKzX4y4PY0wG6R8jIiPDaMfF5E5KFF7SuuMx6U2rjMZ11N
 ym5V.U_Q3Zm__ZI7XNhC9dwOGMdEo7T.7FUqx6KOYmDJ017MghmkbfusC7roS7CH_dXG.eWHuIl8
 q1OHk26c.Ai.D0Vvw55KLv_zURCF6LCHDaD5pLY4y_0WO6mWrNoCbUtudQcSm92RBwqpBq_LjytE
 YadprEhu0l3xceF1PuaejSPtM6eGDTcFW4zYH1wQOGFWxtRVnfuv5.YnhIeUM4lnCXunknvCJ0WN
 Kr1byvMfopC1OUV9PTVK4JzdGqzKCHXVUKqGEI.UIHER0TVlDtKl3s5eaVgqL3yc9Zmh_NdKkBVX
 9xXM21MPAGfnYjtU.fWBZ8pr8o9N4km5YuO4uO.DrwShUzt_mJq1udmRLmAflKR0Vh1D0Vbc5VNO
 xsKwm7Aso550jXaPKYACGewXqJLpZrNY3HGerABKV38NWopYm0V1N4Qvvssnl8kcAoqW2TkbH_O2
 WZuYULyjcZwlCvCsv8QGODLlS4qnW1EeVlrQYGpJGuM.9UWK7EssyxAHJoAWClXNKmt3IX7mTnb9
 FqAoRBOZ0cLNQL46jLzBEZ9cgpK65UiRPrTXzDTvJ2XYLx77A9UaDioIhmwZrZzi.QkF8l5Jyl5b
 Ru2DKCEybyp58roZBS.uXab.iViV7ub0qGBTiBY4EqE6TMq2VhYGDyMUShMFRLEu1EP47nzEFd12
 10c6GJohQbF5uOsGtLv1uyza_xRSu3MOHGN9gUM1PMxHRlgw.uLIeeSGb.wTiFsA_7nih1KmzbXU
 4NvZiQxfjHGpR6.1fddoD4XD005VecAfbU.e2ivJZv2IbN3MB74_33F.PXumUr68rsljxT1zExJC
 usrxt6WGGtXVIpyS6VjzOD379eCy.OXifobMaM_9KH1X9ZMQzktV6L4iqFm1xCh7lbBj4l5WEyS3
 coOe2u6fbD4vj6d.kt2t7qMQQwT6FK_.YTVOevSvmg0pJsSozbdbaIj3Z0PE4xNuPN9ag.0RslRS
 DKlQoxIEk4mowzdb_HU_s3XLAdFmG8_oCKX_UXzUHuXBvyztGJRF9CI.6r2NUV4YlflQExCdmQK7
 .WvrxQFKARZdp2OhN
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 1fb9b03f-ec83-47e9-91c1-112ee54bd454
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ir2.yahoo.com with HTTP; Thu, 19 Feb 2026 14:29:47 +0000
Received: by hermes--production-ir2-bbcfb4457-wbfpp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 986b859eb286868e95113c044e92cb9f; 
 Thu, 19 Feb 2026 14:29:46 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH v2] staging: fbtft: fb_tinylcd: replace udelay() with fsleep()
Date: Thu, 19 Feb 2026 15:29:42 +0100
Message-ID: <20260219142942.74087-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260219142942.74087-1-tomasz.unger.ref@yahoo.pl>
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
X-Rspamd-Queue-Id: A0596165D9B
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

fsleep() is the preferred modern API for flexible sleeping as it
automatically selects the best sleep mechanism based on the duration.
Replace udelay() with fsleep() to improve power efficiency.

init_display() is a driver initialization callback which runs in
sleeping context, so fsleep() is safe to use here.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Added sleeping context justification to commit message
- Replaced usleep_range() with fsleep() as suggested by Andy Shevchenko 

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

