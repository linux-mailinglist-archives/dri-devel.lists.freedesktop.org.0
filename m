Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C8B7EE9F4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 00:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C902F10E2DE;
	Thu, 16 Nov 2023 23:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic311-14.consmr.mail.bf2.yahoo.com
 (sonic311-14.consmr.mail.bf2.yahoo.com [74.6.131.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6B10E664
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1700160399; bh=EpKn92etwHsPGCyfqC+i6vZbTIxd8TY5ipbpBua6Opg=;
 h=From:To:Subject:Date:References:From:Subject:Reply-To;
 b=Fmsp34GzC01DQJ5FtLxyVS/+e8+j06KPKvhZPaN71HLagcZ1nV7Tw85iLZBZe7/EpiYOpj0cM5fXrCg7XPtIcSBsAF+FYbOL+YDxoUw+SRvAub+KRvumUO0ppqIsOz/+zo3o0ER4Rhi6koYCtnZax3egm+fS0WCrtyLkNz/JA4s1s4DvC9ElcR64JqWH2frW8wxRHjUNNjNzupXb0cAy9icQFWlu/ZsPQ7LvhrtdwUtziE83dToJn055W3XC1eaDa5qqldAp8M44gpuOgLuwTRvNSPTDaImn2gTj/nFdSLvDA9cUXHC29WcD4jrHC1XF//gJgAEPhaX7U02ypv3K1g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1700160399; bh=pECB7MdkkfPuQYhF57T67DEOFsf3e28TJsJied+SZW4=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=isRt8dEqSr6IjxTtMOv3j2olMkyb89olav3EAKP6KZFunUqcIWw/o0mvsGrGBTiat48WOw/OzkCPCV2YtSgIVXFLSwGKONhDkq2cPMS7bIjLIz1LG8M7VPabWR2XhMKEJ0LcUS5sJ7uvOjg72VBl3Pp9ZVqTKuOpP3rNTYRUOaQmp89Ny4+bbV0mBuB6RUiNhtdj+XBdY+JSz+7kt4IFvlc02s81Nf3Sh9fkHojUhosJw0k2wu333iKArXi04BOpaJ4R056pvnj1y47DymzRgS7RBz/CxIQItr7n9f550ICqX4YUxlZ2j0r1kKQ/+BlwBN7wSrgQaiR7nwegbZoIPA==
X-YMail-OSG: hmdQW4UVM1nlcpVjdjfthLaXOxrr1uBY51zHctZlico0.JCfXzcq9f0rvbaBCrF
 .ft62j08eYwFXvwzMijxfifGxZPxQx7RIRey98Vd8tRdyAckQ8oZSAfWQuxtsCU9fdPxDxRDj2bS
 QogadViu9LC1xcamyItBLSV7RRCi3Nf7_LiBFFuseiuu1E__GCgN3VNKR2RilPMH30VnWHKZYwjp
 .R6DBbjbVYFRq6ytTkDWrDJQ9FreOuHkzfO8NZ5cqnxIC2pjD51V_LNAhl5MtSLiJeh3FOSjP2xz
 vdAgjoAEJqpwkqAtA9k3vZBQ2wCe.sYtXpC36S_NVjRpMzW8VXhCJJnGs0_d6iu0XO8NenpLkH6b
 HPPZdSDfEvPNYEw5E3BptKXaGEu5vzLev4AgjRY7IoQajh68OjQJy7eqMQD0h3aOegRYMnSgj5lr
 _C2ForICkKXGiuCigSoq4SXOgU7zgLD0gXyr01sTsR.b9AcRNDBZ2bzKt.W.9F_b_CL2n06_H7.t
 TfzpyozBSucenjJ9jKQUDiso0B2k6GSviNExfcPqQRxG.pN3zKO4A0pW8em.0ZHIjTT2BFQ.sBXt
 iRO8lRbAe_AVKvJCnL4xtphcXTMa4YpNDMnx587ytYb41CwD8L.9pB1aSRka1gRgsgG6J.gDjPIa
 z5HugdYy41_LblnB2z8ojCA69dWY4YK9oXHgUkROOIxy0OXN41Lc7iQlDU3J8W0qM6xbhgf35CxN
 18P3IyyPBZ3Gw6GdTA3KJigpR6LZjczziitHix05rymQP.2RSeCiCX96FmFiH6e1krHJEbgaWFwP
 dMc5QOyZ7FJ.m0CDVPVHm6FDqqQn7eDxuaDH8m6K2qkz_3BLme2xw1OSqMCWOMzoshYeTub73XBh
 mcZiMQZBlDGkYLgUYwBf1FnD_MU5razBPaVzKuZPPXt4TSCXk.U.okCAIxPqv330IzYM8bNDQ0RX
 z0vDxCFJAUY9fnwV3XhQcuNKDGdW_iii9CdrISks1vy4JdFqT__ip_PxIb09C9jC0XorNkr2lYJh
 imgEn2vygjreAq96AVpxk7KGJTwXWYOcC1zHZB1vsei8_hlOP.h061.KASekKjsK_xUhN7PuTa3s
 KlLyj5kNewfVexB9cqdHH97nNzCouafmNinnQ6804eJ9Sor.x4j6t1H99PY7STExmsLocCe1I2Af
 tFZOyYGxB.1aEiRp1NzPdCCHHauoku6P4cKGyF7IK7jZyPoSMKvH9UyLtPYemUdzhrXlaHG2vl8.
 pFsxvYR027iWMU2L.WoJaoficg.ObQwIh7IRg2aafb47_M_fcSq3_X1FlQN6PywQFfjxpayGHeOA
 s.c7GAbA7.AzEdfFdkq9F0SUfv2iGS_cmIqLIoE9OzdrWSUx75qO2aHkL7QVSPSISc4ZBGiUp18Q
 LWIOMVvZdKfGBMcrKrPbfrelelnXwjRczG0AiXO7pqWeEui1cofhzM19Jc0I9qp_RQjrfmHtTYr8
 yVz5t7fuqnF7UrYuMKQRWolqdB7NSV_Iwj2K5cymnK6pZVwYnJplnmVK_Fan.4OpLaNg0QbQ2vt0
 jpgfywcCjSL9cOlCNI.g1V0b7gSlpqwY5_tFZTB7z42VqEqcGqoIig2Vl2IE3_0zSMX1mppvAG9l
 iOJdx7ArliGqgMllgZGoCUMWdxmxCTgBEr6WZpJJA5xSWa.ZlHxKJtBZIK2.c9tfBM3C9Hd5y.gK
 rYq87jUD1x79wa4AvFdh4paR09v1fHPqoUlfdmFL1J61RvmCGm3OAq9KXl1wopPN_0Cu30IkB527
 RDD.TqhfKskHJPwOVec6GGVDpcTGV2buY98gUnsoXtYmvy3NvUenWOHwG7CqpxcqEL1_GupFUWlQ
 bCrf6JBvUtpXu21mzyEj1MKOvvKuNi14n_0EGaWsnZ8vycljTBzX9bXCh27hNSSnmiLDrgEBlNfT
 d.d5eRiku3rmeBPRLpkE1lIwvCQBKw9J0VJCMxjLNEVELPwXVwk4YaCsRGusYZ27hszfQLs0n3ES
 ohQKj7fyGmdjeFbT.D8dPFMN0r3oJla_Qgs4nmrhLwrq9IMa.MOqg3NJJdEETJ4fJ9qteVPaTqOq
 PoJKVz2M83b2xC28HyP2gaFvUNCdFnwETjEOKmfVIDxPZHNwanNc.Te3R8xzzXSr_7XEy6aO6dqN
 BpUDi.5DgSTNPONnUrp5xXII1kmEnd1Eli7a3ST5f7xb5SBLiZUi50_pT2pvVt.afKkTahVPgp4h
 1PCkIu1tmWlI9sNH3QD18FprALhtR1Y3gNTlDSVDqOfAYLpXmg9lyvWIlJS33VLKh13E7dgnXJYA
 -
X-Sonic-MF: <mweshahy@yahoo.com>
X-Sonic-ID: e4336d0c-73bb-494d-9801-c36682309c8d
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.bf2.yahoo.com with HTTP; Thu, 16 Nov 2023 18:46:39 +0000
Received: by hermes--production-ir2-6755f9ff7c-79j92 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID d07a91219b7f9ba41fbe712d2de06ccc; 
 Thu, 16 Nov 2023 18:46:37 +0000 (UTC)
From: Mostafa Weshahy <mweshahy@yahoo.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, noralf@tronnes.org, mweshahy@yahoo.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 daniel@zonque.org
Subject: [PATCH] drm/ili9163: Add "1.8-128160EF" to spi_device_id table
Date: Thu, 16 Nov 2023 19:46:28 +0100
Message-Id: <20231116184628.13781-1-mweshahy@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <20231116184628.13781-1-mweshahy.ref@yahoo.com>
X-Mailman-Approved-At: Thu, 16 Nov 2023 23:23:09 +0000
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

Currently enabling CONFIG_TINYDRM_ILI9163 driver - regardless of the device
tree - results in the below confusing log line:
SPI driver ili9163 has no spi_device_id for newhaven,1.8-128160EF

This commit fixes this false alarm by adding "1.8-128160EF" to
spi_device_id table of ili9163 driver.

Signed-off-by: Mostafa Weshahy <mweshahy@yahoo.com>
---
 drivers/gpu/drm/tiny/ili9163.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index bc4384d410fc..a9ddfe66fa32 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -129,6 +129,7 @@ MODULE_DEVICE_TABLE(of, ili9163_of_match);
 
 static const struct spi_device_id ili9163_id[] = {
 	{ "nhd-1.8-128160EF", 0 },
+	{ "1.8-128160EF", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ili9163_id);
-- 
2.34.1

