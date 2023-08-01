Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E376BFA5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 23:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADC810E435;
	Tue,  1 Aug 2023 21:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic311-24.consmr.mail.gq1.yahoo.com
 (sonic311-24.consmr.mail.gq1.yahoo.com [98.137.65.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AF510E435
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 21:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1690926946; bh=UXmKHAxI8FcpQqNUOkYn2/+u4cfxJmVRmsV+0atGSbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=kG7/otN36PLmNXYsYMsc8oh8w4eWuLjyowJlOd5olUv4HFT72/M//fH/9+9Q9M5YpIqwXoCIjXn2Dq5c7KJXC48AmFfB6PEgUL6eWRcFyCE7bjktQbdJGIOl2OFfi2HX9SLlSu/qOMWA05DLyL5F8q+fJxGUsvGLTp6gcJds0KB/3qHRRT7eIRRqbFJ9PB/SrIjvEPAEPPCOXMrlC5PTRLYEAUIlMorZ7oO2D14+Vw+Ghy6GVA7AeTUDbEISOoUesMERTKfKJ+tDq9f9YDjDWkGHwNSZ5sdIjx83OWPEs0aQHGKOWnw+a6J3guFLYYMEcttk4S/sgH4YjfAG8cQOVQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1690926946; bh=hahUDcQ0Zy6qaUXUDw+7yszJcn30MyA7JPU1zj9wZ86=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=LTiy5f7ji7vYoRxrBtBe9dYp18oonQ01rT63UEtCiV0IfPezt+qVORAm/R4nrfs7F8Su9nK6jAnS++1o8iWGlJGY3pw7GPrXDklo2dcjLmJpEe2S5d381xBBpH5gdXKqXi3+xyKsBf2fINuEJPX9JU770Gl44Wo5SxI4k8UmzgKB7L+U9/KQYhOUG9Gg9PD/rMs4pqQdP7TxGlS74bGN81yQbX6o1FWo4SARt+4jTDVaH8a1lGxabQ/hi0JgjwVDUukK1Ij1pMLSJJeenzCG8PyOiQzfXPLbWn7MbO8ZcPKgUML71yeSQEt3H3lpKuayZ1cgj7PnlW93K0OzQDYGYg==
X-YMail-OSG: CeB8NW4VM1kxgCRNT.137CFxcgks5EgRQ4FIH9uLQ.Gu.XFz.YCLWhmwoYgYH9r
 Ne8ik7bvGbWLUf2aOchhmJuN5vQiVCZrcMeyD6g5SiaZIfzyH35EW6d6JOHpRG5T2PaY1wp6GxyV
 nPQSTO9W1bhR_96gpVnumR8Z06G_JQLNCRik4ok5lwGSWj7FIEkETJxdIPr1u3MRz3kktbM7V52Y
 ncn6iQNw3hfG_F1Q8FjmQkkOtfWCeHHEd0sG6Bsrh47dUQQEo3VMqYJ.86i2CXEGXju3sVEIpZkW
 q5MLRSb32asq1cxFSThKUDiARSR2ubCe3ATupilZ4I5J4U9a73igyCt1eB2N9lsCH6wMc.Z8Gp.K
 W23IDNrh1tuBOQlrBKrFDCAeYHr72VbjHZ_wEtzBKF87mpoH44WIuhNx.9Au5AbCdSmiMpJRx_yT
 QQ.w3V9usUGSFJ5Kls2hP60oZGd1dUAUC17AF_dkv5L3gHGS9.6YlfFciM0ULZClBE1jGhN.L1Fc
 bhDeE6suiTfcNR3SIYkSGB4OCWnI9XiosJlFqFzWJgZwMBOSLMpi8tewO.AoAXoql9bJtMUbzViK
 L9nh9kHjwe4E1i.2XGOtF6RciN8R9zxEg813xyor1OfXOib40QdAFCEvDCca2QyrpChgtS6D1scJ
 dwXiDSes74_4GFR.Pz9kmcGlD4WUXUw4HsYNNg85C6vjXz0JANf6X.i4xPS4DYDOitKTOk5i0Js3
 TrTA5zte.Ljm_Drn3m_Jxx_yPpTjmgBMI042d6pHmt87zwy2NBkP1iGI_rq9rJOYR4qjrToybJqe
 RT2AWxdEiO0z.vbO7xh2KU1tR2v_Ln.bhnq9DuHSJ9fV9F6GM8f4wR6b5.kKmbhrlytJenIwiVAH
 LvfpBXCUxI5LnMx57NtnrC_HEkfg62ak5S1z6qGoMh0JDItld8iZB9Q7pHWKnfHwpI2XBEnL5Jm4
 zyN07EyFKbQxO9yEIeoyvgUb4GZxpTKP4zyL9V6LHzMLxDucTzRqL2isTr4_USGfTeoYTekcVsCz
 E8gmVKDyXlF_rWNEjYbK_MuL4dEMI7Ssnmuujv8itdpbURCirokMWNydO4dULojSV4FMt3IvWLtW
 ua_Ep4vAYw1an2jNvqVHzadbmzUZS9lREwPufPSAQzNaW7HqwJJuWpvn9paOV2rOE5BCuDG9c3GS
 wa24Ejg0f147i3kAZd7smmtj86vr5NqL.X23C1TEjaAtuDCIWcBQBZv1pbpEN7j7RUXzVI9zNEzK
 ZyQpVI2ZfrtV0OpbCHtIaswFJaIRagIe8vHCa1nXMAYCeN7RrseNhKJ9MUJUlXk.0tHM3z4GErNu
 YFtJRL2mIMj6nun1zEQX3unvLVlULYH8JXdZ3SLKbsCzCpPYNxf0k9G6nAqISVVmqPWNdMScSGpa
 TCq_O64u2KCmvmDcUO6w.lvkr2YspCTUd77bbRojR65guTFwaAEDV_bTQAPkJHtICUs.LW_quuSh
 jRdfpYbInps5qMZawhcqYqWoodKVTy3dXQuplZP2e.BCWbduwUBhxtcRlZ_Nz5Ji7Dy_H8tYhpPX
 7bbrBm9bcbXu3IzWNaZ7YRy4ndu_J02EUDkyBvxAyqNg.b4YEzVyn4gXXauv9zCo7DRifABHrpVH
 L35KLWEws.ec4pov2YKAzexp3TsMxAUoRjUnmROpYf1tbYv7ylfJj_Qc.v1EmEBULqN7ff2YTo0_
 Vbf3jt8dzqdu1PT0GeGwSkfwz00wK87jwlV5IhHXnwulH_PyK1nuxc2twjLLwNhYdSC7tY4W_Bn3
 V_6j4OaE5bUpa6RDbQeRBVAP5kOyCoDhIQlIal1OIeFf5umn1oRX9NB9MEApvJR7Kb5OQN0IwycO
 2fEniVND1FPM7RIbCFQ7Tm64kp3BKH8p.DEQ9mdDO7XO9BNClcVjhr090_EFd1Z7UQSrJ.Rknk2F
 H04b4Cj3_Yf5BFqq.A3NuANYWLgamoGD2ZkPqJdMAHRz_YIYttkCFi0liv8ZEAD3sfPTPZ9NKkVb
 tGJ0hF5rZTMaSJng00owCRVUW.7ITvhzp7J8Rq3Vuhmj2Mglr6w6V0A.V27aQ252PovvECyccUzN
 4jvcUNf8nBh5SIf6w8Bq4RzWmDkLwyBifJC7DMoOuXNeIL_D0LrRlx0AeuFdn0_6NSS9rV7SKKyr
 MzOhYxd.8oUt6Nf7Qgypt5y4xH.AF0HYctIs4x3sqTPDff0JU1PS_OTnwibczP81IlmU8gCtvqJN
 wdtHPKGnUX44Ee6N92WiKr1ngcgrTrbzIpO5cIlsBNEg-
X-Sonic-MF: <astrajoan@yahoo.com>
X-Sonic-ID: 2980e2db-bdae-4ebc-80a7-121cc92a00dc
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.gq1.yahoo.com with HTTP; Tue, 1 Aug 2023 21:55:46 +0000
Received: by hermes--production-gq1-7d844d8954-q6fhd (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2133038380f997b8027ffd392dd22e8f; 
 Tue, 01 Aug 2023 21:55:44 +0000 (UTC)
From: Ziqi Zhao <astrajoan@yahoo.com>
To: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com, astrajoan@yahoo.com,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ivan.orlov0322@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 skhan@linuxfoundation.org, tzimmermann@suse.de
Subject: [PATCH v2] drm/modes: Fix division by zero error
Date: Tue,  1 Aug 2023 14:55:38 -0700
Message-Id: <20230801215538.105255-1-astrajoan@yahoo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <00000000000034cf5d05fea52dd4@google.com>
References: <00000000000034cf5d05fea52dd4@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: netdev@vger.kernel.org, dsahern@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, jiri@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the bug reported by Syzbot, the variable `den == (1 << 22)` and
`mode->vscan == (1 << 10)`, causing the multiplication to overflow and
accidentally make `den == 0`. To prevent any chance of overflow, we
replace `num` and `den` with 64-bit unsigned integers, and explicitly
check if the divisor `den` will overflow. If so, we employ full 64-bit
division with rounding; otherwise we keep the 64-bit to 32-bit division
that could potentially be better optimized.

In order to minimize the performance overhead, the overflow check for
`den` is wrapped with an `unlikely` condition. Please let me know if
this usage is appropriate.

Reported-by: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
---
V1 -> V2: address style comments suggested by Jani Nikula
<jani.nikula@linux.intel.com>

 drivers/gpu/drm/drm_modes.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..137101960690 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1285,13 +1285,13 @@ EXPORT_SYMBOL(drm_mode_set_name);
  */
 int drm_mode_vrefresh(const struct drm_display_mode *mode)
 {
-	unsigned int num, den;
+	u64 num, den;
 
 	if (mode->htotal == 0 || mode->vtotal == 0)
 		return 0;
 
-	num = mode->clock;
-	den = mode->htotal * mode->vtotal;
+	num = mul_u32_u32(mode->clock, 1000);
+	den = mul_u32_u32(mode->htotal, mode->vtotal);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		num *= 2;
@@ -1300,7 +1300,10 @@ int drm_mode_vrefresh(const struct drm_display_mode *mode)
 	if (mode->vscan > 1)
 		den *= mode->vscan;
 
-	return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
+	if (unlikely(den > UINT_MAX))
+		return DIV64_U64_ROUND_CLOSEST(num, den);
+
+	return DIV_ROUND_CLOSEST_ULL(num, (u32) den);
 }
 EXPORT_SYMBOL(drm_mode_vrefresh);
 
-- 
2.34.1

