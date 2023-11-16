Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C5E7EE9F3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 00:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A3410E2DB;
	Thu, 16 Nov 2023 23:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic307-2.consmr.mail.bf2.yahoo.com
 (sonic307-2.consmr.mail.bf2.yahoo.com [74.6.134.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E240210E664
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1700160706; bh=B8LjdwnjEgj75RrK6kVK0WLwsKydp90xsrUL4TQRnZA=;
 h=From:To:Subject:Date:References:From:Subject:Reply-To;
 b=cD99smNK6jYRym63AqMZURg+ZQAkQJaGThy3rGj/oOEbGdH46kq8HCwCduIjPGs20nQYTjJLBZNp3ZRWt5c9VtJCWvn4NDlhCAxim2h6+VXlNKSXEgmpVvv9174Vwd1bGP6SGEVjxBKGlFuvO2Da+pEKCGKL++o57CWw7DOsLk6PLFPu4l0BS4zIsOeNfQsgOTy1WQxyBkiy0GRZ8l9Spg7cXrfurvgxUkaVMQr2nQalw56cPeCASK6uarW5dH7Qq2j9w9OGCtsEcX3frhVrHkT5rET65FR/3jn7urjcCqkZDmVvka6ssDhe7cSIA+siS1mEJS90GsR+d+GEYLCVRw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1700160706; bh=MPj9Z254zQTuHqpKf7+7PqWfjmBNnFqLgIix0M+KvlY=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Hmu1U3gaeK6hIvhUez8QFah/QnQanDGeLnt/zYGem1IvtBxDkV9pn145uFBhH4bSAASWMULbQJ/xp+rC2Frh2hHQms1LwsG+Z/cCxRrrS600dSOY4kvEWLVu2bm3RHP5ygRoiZ7HRHakRzKHHyauNPmwHcK3KcU6K3ArDhrb4FSImJPxAVtSPuNYbXUcedgNzK4GPuGje5bl2AbO9bHJutejYr1NNs8fUgT5sC6jTR8jywuHjyL/xZZcino36L3tmSlbOpO1WANZX0s0xAP6oGjKak9BxYyIfvOKiRqJ8kNnuo4TVDU9WTK6jjNLUDQnPrOSX7/TI0FpMMMEgVa1Ug==
X-YMail-OSG: SQSu.ukVM1k4gqVIBv.v03kO9EhrJeuLpe5UIi7ahnfUqxiW_7wzoQShoioFuwY
 5_wHjwnTGCLLPAnPBQhQJHhh72uvaDiLRfdVjAaKyZFCSY_RnTznVOQ0.IilWn3KBiRKwsznNhVQ
 CsoF1cQVdgtzHB53TBlyCo0igJTX4OJwBQz6Knm8aPC9l3_FYbQ3OMi.ZN4EzhtQy4wT75EfqW6W
 TFhBPE7ErviY08oSwPihBAtMyVZ.EG_rc4V7YdUKsfbgrmiYCcnKRevo7UPwMfnEMYsLTKUy6Qqv
 IbiOns4rMUlNO9NIb7_Qe0SGpcjfkirxCE3kCnwEGllRquNVbB1YrUGtMkH9MEQV4T2XiMwcGKPD
 4mSRND_bLZG46E3l8YNptaSsryqrebaEqsGscyaNnu6mfIK68z81zkxwHw_yWXraD_XwUvRyZFaX
 GbOd6pWbtY7sccygTtz09z4vTZ7QwD4zypUObTEr9RQsKSdh4Ji.HCrGH2X09Oa0O0oiDTsiATYw
 qtZoufQBIJGDZGz8FyASq97CBQApoqADo4hfWFCy6imVuSCKob9bLq8NbcgYEpNoXlabuwBTd_ZV
 U.r3aGVizCSIC7d2D4tzkkw2MjVRwBYcetM84jyuKlQ2qkaQKbrnx1PKtLnmLb5i_Qx7FADiPxnc
 P00wuVwTHYDD_cd8CJWCtmyHuXM4iCZclgoTKKlVtzA2tLzPSRYpdTfqxhEwzXDz50v7WSfW77Rt
 Rzrhmtj31LV79wmtUJkX4JVs6zMMQy9qStS2MWRbqGQi0_zlJfBitmF2q.sjcJX5qreRSc5kOZ__
 pjxSBYSdtosnFN.M9v2Hct4qNczG80F8b.Z3J3KwKz2BXD8rbReP82LFzwo2V7PtVyuorPvWNwZj
 GEd.F.npXZ3MZ4Fy.BNeD6iStAz83Rv.yG_HcSK2hFA2zZEyfWMQWRMLu_D_87LKURrRmiFI8227
 i2_2JySHUHOwSx98IHsFrGZb_ZWCB4fEoFak_UYRGsMfUmaphQdQ8goqvZMMMAgtu4eTY01cxbpJ
 uJunNs1fRZkLCqMPrsi1aIvNRrMyABpjvwPgFl9I7QCvcsFX8FOAfZv2Zbl.lAfgSxhq_3.ydQ.E
 OO6Bc0QOY5ydqgbjhkVncWUzJG480h6p1O3atT3HpA5_LsT.Rgg9iBkrNzY90Mias79Ujh391YBv
 SZerJbKFO5iaYjRV1GL6L5wyxMo3yXIPxk.G_z7TCLmOoz3gP0lmBtVKpNJDteGzGf1FesltCw6c
 1LSmYWybLzjsQ.SemBXw4l6bbwO9oA.N7ht.KMcQ9alIGlUESDLtAxo_xFfWfcyCgZu6rCkhD8LY
 VuHB69S26e_Ziqzju8A7UNwBVVAvK.6.dl8kN42u5x5h34MlV7j4AQXlP4vlBSRZ..sEvSJ_qOdE
 2epCGfn9ojTmX7kX88rOzhd7ewx7srfVUAHQXNnsRdBBVr3BOZXWWvZZp.Zu7d92sYCBGOFJVYKa
 ywB8Qet1OCb4bMxgBaH2QpNsX9ltT1XIZmDRowXdBw0zzSaFF5tbMAy22j0uMsa3viLasIq2q5fc
 DAe2HZRSBYZ1Z2HhjEEILemfGduvpXHRCwAP3EZj9GbW_vf3_twbz5tccl7Wdvg84tc7E6l4NoIv
 BJGTqJbJaxhf_0r51AsYVSElMfzcNeF1g2mfwSJ4ctknALujzDSs0xyka.rbsrCBNASX4w65S_Zo
 fZfcviM5M5fA2WG3uncTGesCI28HnIbBdhovMQqcP94lBgyCRPhTQuXr_taj4M7XFXNuk30BoafG
 3w67BL3f3T.LyoPxLpUCcsd7Cl70HQ2h38kN.54JcN3t.Bjws3woZEA2vwUFRCGowmD89YIUJuPz
 E9a0bjlEmCHyTu4ZhX79l2wgpXrG498r6rkN3JpNDg8TTcnscNQ84s.tsO9L6UZ.kp2TeuEQp_6S
 CoHaJBZoloYm_SixmBeTaWys806Ac36ZbKNUkAfMZQQiZ1mpNygXQzf2iIsE3B44QQTWcYnqfOSd
 fr9QlgTpp5Wm2ee43EHuOlC0pzqzss3au7L8QwBvzSZy0uQZkB6e35AJZMiNovHorFjmgs4yXX.S
 KwbXWW0Smoqdevm4Vyn_gfJNCt4XPiOY8G7awtcFHxxuwi4ry8u8vuz.wzTWFdxY36pq_PtTvq5u
 jqknO3GlJ1DpuEeYO5NMy20FQJpRlhSjn3Bv1E6HMA.cLRryTAMudbSNTcqSOotMwW1Wf3svgOYV
 4sbNrK039JBBicfmgVExlihw3Q.mf3Whz.E0IVToVYiDoDPV4SYjBizbiTEYv_3dlvnJ76ZMwqdQ
 nPsSV9uLipNLAmw--
X-Sonic-MF: <mweshahy@yahoo.com>
X-Sonic-ID: d929a3be-7136-415d-977f-c3f52810b90c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.bf2.yahoo.com with HTTP; Thu, 16 Nov 2023 18:51:46 +0000
Received: by hermes--production-ir2-6755f9ff7c-xgtp4 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 46b13ebf17bdd8e3424d5e5284a82ba8; 
 Thu, 16 Nov 2023 18:51:43 +0000 (UTC)
From: Mostafa Weshahy <mweshahy@yahoo.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, noralf@tronnes.org, mweshahy@yahoo.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 daniel@zonque.org
Subject: [PATCH] drm/ili9163: Add "1.8-128160EF" to spi_device_id table
Date: Thu, 16 Nov 2023 19:51:24 +0100
Message-Id: <20231116185124.13887-1-mweshahy@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <20231116185124.13887-1-mweshahy.ref@yahoo.com>
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

drm/ili9163: Add "1.8-128160EF" to spi_device_id table

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

