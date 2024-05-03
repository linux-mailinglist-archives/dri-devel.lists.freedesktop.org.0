Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722368BA518
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 03:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B031127AC;
	Fri,  3 May 2024 01:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="cu6ZOO1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic306-22.consmr.mail.ne1.yahoo.com
 (sonic306-22.consmr.mail.ne1.yahoo.com [66.163.189.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10901127AC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 01:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1714701141; bh=wZFvjf7RvGdDPgjEKbgS98RbOprhqvsUijRsQOl4YtQ=;
 h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To;
 b=cu6ZOO1xyAzZOnoivSiBbUiPuEbtx7+ONH8lJ7RViRGdeFBMLZ99ktg6p9ve+kpw36+Vx3FS8a4GqwOSYzOZKHWgAIVe3CbOXsuIVVro5pKr51Y6iB7sHzztaiIuSMeg2ohi1Hnye8rR7QkqBg5ZxHgHlzTzLTYEkGpnN3gms/Kxb/J7ZphRKArfAGPEErUZMF7s1V7VPKfRlGikACZAns24+9R9JSKW0fxILyZkbSPxx1BZ0cxhIWOrUMfuX5yLP+BmV7d6FrKmW5Jsr8t+5xP6mAmdtCXJWjoqQ216gXKToxyc97ZYXgPvbwscEb1liNMZrYzU4iedGxGl6jGSeg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1714701141; bh=qeGeqbH2mQnOd+a5ULXvyRpXYIPCHnC+ikR/B6XtZM/=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=OuI525w5s011W7aZvY1QzpmT8y5jy8elB5NhJ0s52NrDBUmCIY4U4fjmPrwk+36adv9y/V+Tqzh6h8dlR8ALwriu94TmgdHRm8B4bI12UQeqqDVLkH0YKzLrniJ4TPEup0rWHE4StKrx9hRRX44U3+9zFNCkZQ1a2kHJm9BsMeN3C/mkiFA0e3wHXio/ZolGBM4MYVbBi2GXhqskHGULvdxTNPrSwV/I+kfHrj3tCQsuwwK5VGzsRIC85U7NphyQlErUO6YWNw8XFb8uPc+JjZcuT9RIjD7xA3o6V5gvK+oOPcNvI6VUtzlIi8JH2oWwbIYfEzOFoT6EHh7tugeexA==
X-YMail-OSG: i4heJ40VM1m_KJzltkzucO2ER1ebgjMXpP9ji3gk2lEsQW790DetMDaqeczECj_
 I50qrDUDSbbwfcGiHVEx34C3vwRb6dvvxYHWZliLmy6IUJV3echC245Vi0fJ6LrWh82bHrZupv5I
 9ygoSZjkx6jZFhPcZT1HcN9fKHIRgl8frlxqmsfyDpSw3DozAYzio_qxHaC_jnA5NFoj4n0GQO_8
 YSOnOwA_4vgcJZLg5KihVV0q9oCNNbI3BETspiD3fWd7OU5aWjYIxKYh19_cpPaP6BZ3kkZ_Afs9
 sd2joKEzpKtnv.9YYpdvXNZZ33LfZL9yc.6w4g2cDjNo0dgVB5cUwizCRKohLTzUXmbqBHO_BryU
 NTCCvIovFBCfELKARoxEk.ZGPPa5VBse7cP4cKcHwy0j05f1QdqYQUkxH7Lbv6meWKTvbawtmgvv
 fnluzb4fqrWlsAP3e0h0kmP4WjVsTrGtt3990wk0as2NbBCbRoSB5T86sScUpS8cShWmz1.PKROF
 FQzgQl6nTSTbHatrORrI2Hiuc_8MPfXUoHEvDmtn5Ylgcokz_GNU2mEu9O3FRJbsUsnriZgrGLp.
 aMxVW_vfV_XIgHxo3LmkWNEzD3MrSXqr42z_wybmrwVjpsGiZvvnnVfcRh6ztEyzNQlLh1ADhuVw
 RReGbR6pBZUPIz8AIiECLH3rdjCDtNpA1uwGsiiLPsTEoRgGAyasxGfJsNdn_I4xKr2dWUdug58E
 VhobfxYTZ36aNbvCdE1lIHt0z5EuPzTWw_oif9TWSCu9c0slfJAgf4QGqC5uTXnfmoT11XrIhio.
 2I6OhHGYmFoiAHJsiLPgTYbV60Mp0vlMhiaK_veAEuSpi4QSOw669UPSQQ97c8JLLgPxJsl9irjY
 39poMhvQQNlax2M0JwxEx3L_E9FAfvPv9uGc9FlLjTaIJq8L_o365u0uhvQm5TJbbVBuIt_FEsSL
 xcu1KFha4jGyGwmY1Cp7YxgDprax6lYkiCl5K_vJ._qLTqzTarXF1QpsY3.QnfT0nGT7OtzfZkYr
 gydSGtk1SxICOP7PWuP6xwjKesTd4HBw0coXbGoNEuM8UV7gW5.C3m74Sm.hpt2eF40f0XkhyEAS
 U0H5YupQTeGjJuCYASEJdlmoPYbSz3IpL1DjeVNSwcZI6oWUiJgjkHtRSMiSQfEjYrAX7jBWOR73
 dlgMafL6_5hTITA0GvO8l.y0_yeiKSGHBtFt00e.WMmdycMuYDz9bwLxXf8bgldgQg3Yjddcgq_E
 Roknb9X0xZ1E2RmTtWfaDDUF7QU128wfZPowThgfXGHKiYlEDIlqyEuY9bWAyMzO.zKEINJNEozr
 TCHJB.nPCBmuBr2YT36Qza2T3WfB7Fs1VNjkp7FXEB_WjjUFBHHfHHTGHazN0GsGXr.V3sCwSClL
 pzvV8jP1TnDzUp4kOvJZirGKD_9GmYcRDkbQ4_VN4dQjnqDdsuxIkq_10DXFzN2x_OHNaJqNdp49
 gFgd_xOOQnbssGzudO84cizrCN2voih47nVycusDFw7mlO8bTV8RWA5E7wNgWtWA5h4ZwS.HkTWL
 veM9Xw8L0asLPfs6Nf4URGvuaRQk10FkwBcHJMWtl9v8HK33Yk5FRCdrmyCTsUECLfgV34aVF.t.
 .bxa7ZyvatYhvFvRQpf09cGzscegTzWcip.V6I5NcbdPhsde0Vg2kE5coV.l7dX5aoMkSPQ4eLLT
 REkNM2cOzQ5grXmRZPzAJHzWBoI273P6hgrQsubgoID33969IG0cfUd8OwyloOJ4ohB4KwO0Db_Y
 hlGjY9gydLZajXgNndM5roe6uSDtRTn3kWfQTDc4sPvDM64LLH35SzwqDYCht.JM0gJ1w8wTPDGA
 7Ym2_xQGrlfs1LCYTDiYsfJUQD27dhrI6xUf9mdTGYeMfTAq8wrCQ_houkmM0ObTCCpfzLAHuyqt
 5HHcLTmpJMZbzcbKBe_IS19GeNdXgbwCOHEuui9_TWcE5osO8EVqXWi9OyxRL6RJJPK0s6AmdU5p
 FfE6Rfo.fOB.PFX6kgdLq3MJ524jddI468avFD6eH6l5fLVqZKCwEU6S554TfpUSsYlSfqtd_ygE
 vgVHq8GeWtg3v.w.XN6tz8ISKQOEvoX2Rhf6lXgJgW6a5nBFMRCYQDzHFw6Qh5MG5B_VE8ApcNnl
 i9Tm_puz_js41P.lB2Xw_QsLTYgdgCSN.7_5utEy6m_gEqwf3Hxdph3rgVjkIehi2HnQr7lrNIy4
 Oi7pkuF_rVp_agcOlky5amx_IGQPgWFvT4Fy60d3yhD3HHLOA6l.C19BeyxEuWtHd2PmhfK4x.Uj
 jtZ655w--
X-Sonic-MF: <ashokemailat@yahoo.com>
X-Sonic-ID: 31c30ff9-4da8-4db6-9f97-f559213ed16e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Fri, 3 May 2024 01:52:21 +0000
Received: by hermes--production-bf1-5cc9fc94c8-df4vd (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ab2e3e683b80a82edced05c4a0938865; 
 Fri, 03 May 2024 01:52:19 +0000 (UTC)
Date: Thu, 2 May 2024 18:52:16 -0700
From: Ashok Kumar <ashokemailat@yahoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
Cc: ashokemailat@yahoo.com
Subject: [PATCH] staging: fb_tinylcd Alignment to open parenthesis
Message-ID: <ZjRDUO6/M+RDCcQJ@c>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
References: <ZjRDUO6/M+RDCcQJ.ref@c>
X-Mailer: WebService/1.1.22256
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

Corrected coding style CHECK: Alignment should match open parenthesis

Signed-off-by: Ashok Kumar <ashokemailat@yahoo.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..60cda57bcb33 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	udelay(250);
-- 
2.34.1

