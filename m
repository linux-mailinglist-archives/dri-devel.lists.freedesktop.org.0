Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D1774C639
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 17:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D274F10E0E8;
	Sun,  9 Jul 2023 15:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic309-22.consmr.mail.gq1.yahoo.com
 (sonic309-22.consmr.mail.gq1.yahoo.com [98.137.65.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9749E10E0E9
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 01:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1688865145; bh=byfvI3dK6Q1sBta2Ep4RK+WFTzLm9VXgl2m9zdHE59s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Thf1pplmaD/RJS27dJyNVj0Rj9vA/ZxE0RsvDzf8UI+vD1w4df5+rVQWrMXoBN4BbzBXEVbhdlnKf+zpzbAVUgiIbJ0jZub/vdzUTpmkzDyq7y88xhbT4RYhttzRyKewyFqFMY527YxZLPJqskQ7LvB7gaqI4jRK1We3RtGPmosmeWzQ+q5iFiGaxb74Aq+Blb9tn3arKsXzDHXZKamkmFvXk+ajJCF6i9YMpr/zlVKaEVKRpbZvm1lAjHmAwD2nLd3jqRbDPvfSVWjuGKHedjQ1XmtuCM5INpUfW39YAhlRHp6rlho3QWO1xZr7zTkF0zJicK6qBqLPna7g8NwK7A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1688865145; bh=J7pNDFz6py0Xu94JPi00ZAk7TvXo6uKxSI3cloD2CZl=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=ht+Gb/AQoD8yJYxhbi298g3rPYFCWf2JnXUWZYgCxDx1pXC4oJrHFtoynAzvT87nnfy0y9LurQpYmQrQIWeN4vHXU/z/NAzagB8Z74UlISNpK+1sAkUGs8+KKr4+Kf4HwPchg2GxBENi3moepQAeQuu/wfgnPMrxC9sV4LfOLDxSTBz3SPbXV5bMkJrkoNo1DVNnu4gXu1YLklQFKgatQec9vNcM0QCKaCppjNYgxkncSWF3G7cFti3ViIZTJ9oQ52BrSR1MxGVD76HSgWNqkBcghkdFX/c9bpfoe6H0gvNAtcuHrPqiveQzuKbnEa+XGt1dgW4D8LdCQ9jdEv7nLw==
X-YMail-OSG: zvxcANUVM1nORvtPA2MZ9lqPR0fU0TbHlWQ2AMSovuYuYhfoBxrZC_2vRdF31nH
 LlfPMcoCgQ7fM8ZVTq6Lm2cwaZcv6WQUHZgvFP_C4ZvO1lkeZ7tkpUy49KDogY1BILXvOmzo_cJe
 Fc6mMJp8XY_qMy6Hxcq0PwqgHtH7Fmemb.VnR0WXmtPvF6DtERK6A01QdQBJ_O7ZVldF6j5nNMHu
 n0eX3LO_D7U9C0fU7428yaknfyZWc0WMKxuQbYZ.srYJA..ex0MmPWnYTFxSFDnneTWFoF_fs4sZ
 zlMyw.TkfcNpt2uLqi4l5RtXC5luHW27TGLnFKjkcs_YvwpLlD_nQu4HbHdIAYgvElgdNjdmSqix
 q5g7Er.nsSPVHEcUrUDfsiZBAwjbeDOB1jy7K02O1QYu1VrAetxwr_nsTyjKXWFDIXZTM.3GQeLe
 nA5pDDewQHcXrwBzZhqwXbnlFz63ORb1KtOYFJiLTn5Qd_4dE1J2uJfpnwCFiJJes4wKfeQxSqkW
 V6BFWBYhRJ7mQIVO84NT6HhWJU212WVxLtzD.WyrIbbseMZE4tOt03WsA8S3PGlPvzrlZzc.uYX9
 nfcTFQvfVoRrV6aBfRU_ZqvTTm.pRnk74YACtg2j1yiP_muyNN3GMxt2QKKouYYa6MOwbE1xk0VL
 3eA..w6.bIMGrRXGIGzeHQW6aSGLX48QtLF0BN7NX7DYHDSzhDj.VHbOT58p90NgIyFsnohy82aH
 AWGpU8zMGqO0ffFZl19wmeIGRR7wWbtUH0jKvhvy80epRKGpqukJmfl1buonFuFrFy8dG5GgozAs
 BxmGX6L0ZfdampdlqwcmHBAlSIw4ibpMevtEcIM9oUQqMzN9sPbk49kJKDjaNBLTLCPZ0pi_Uy7y
 VkEFVBOS2cPyKtk.VZQQMGn4KFrw1OB3moGONntHXTCktHN5rEyD019uKnVRvXD.hxSYJe18C2ml
 AiDYDgCgXncpyCnb1Bk2msKCBUyMRT2BAhdXvh_OgqLSKCZ2WjaxlLeMyA8BB7pBgHvKr.zHDbT9
 E0nSgwf_hyR7gnzHCiSvSF6F3ECa5hvu5a6MhS68nUXL.Vpqb9hcdXCjjCvhgAwVN1Je4mDVynQz
 jM7xJL2gnINeXLXzkAx9FoGh_mu9211btNzi_NpeIWgsTDeXjJuiSv0GZSfs1ZJBTl2CDa2WmO3D
 HVC8oCYZesj.JKRS24ILFQIaNIXsg7NDzycygsgmUC.Cgy4QqieOrSsAIEVhjFOdRF0ZBQrn7SCu
 GQ3oNNakvOKpgLVgeYpzjcjtBBUj7JbrUbRvvDvTmiKj4hgkpHAxTYa6BHmxE6ke8Of62FMa7zKu
 N7yO18w3bSj7xQJ2qAD96i9rpemwHct9grlCPoMqms9pcax5l2la61.BxXRRN9.UEVTFmVL2q.Hp
 SvkFe8Y21U_GS6MIIs_CbXR0KUJE_FzvrClydAqg9z7t5G5Fkv5S1WGQnd1e.IH43b2_4yO4a1Qq
 y5QxXBrgGilCMrv2qWOELQD7JF7XJdTrIkiM8.oR1DvzCxfnN8wH6xEq_WccS.Ku9zqjzLQaO1Na
 HLXDEdGY1XAkdRhnTtq_UR0gGPPZyJv2DMTkH6PvJy0vgM78mRJrt0tKJ1T6LZE4Ym6x8bRNznga
 K3WcMjIs8fp7ZCrb5YPr4AmJJE_i_f_8f_QjpNmFBaRvnESwtL4_.Vz4o63By2iiDG4T7zKUDEQB
 Rud49lRWqioZjW4hqnyN7f0nohskvxrq_wF8xjUn5qRJ8aKtE6h6UYKmO1y0f6HoM9BiQaUF6ih.
 .27mru64.vWkm4WnpTPnWuRkYWvHSXGiNqcX3EPN1i7RqDbHkM2YUF6DyWupMClz1yq.m8nEe4yK
 tmk43n_L20G3Zm6vLltYob0DDxqlQOexaj_WCpnODq1aVIV8ifMlP6YHSkF1y58Sx2f_wH2Apd75
 DR3NHBfeJnZOgEYu439C_FGmc9uCMIdOztxDnBLLP5dAfO6n54Sr0DElGP05N2R_qBg9moFTo1oB
 sGZ7_Zl1plMzztpmiUUegh1fuYKU4mHIVycK8SL7FWnILmlCa4IW75qJuVP5V.I1R0VRnfBp3zmU
 6wQZtgbzeD0Aed6DfRCDraL7GXuz9PXcnhILsV6_dQJ486NNWjSlIo66W20RWPi9muSZgtUwVTya
 ryWhKkSo1kJunizEHwLaRxuxSJoor0Tvp_pBsykEMjjhKL6sEwmaGHAhZBX92XoRd6Jy37.SNeQw
 EWzGSfaOflo_igCpSeyRp0R6S.A--
X-Sonic-MF: <astrajoan@yahoo.com>
X-Sonic-ID: 50490755-52c7-49f6-8289-bc3821833cee
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Sun, 9 Jul 2023 01:12:25 +0000
Received: by hermes--production-ne1-6d679867d5-nhrqn (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e39b0b13f3ff9ca667dd084b8c3dc74e; 
 Sun, 09 Jul 2023 01:12:22 +0000 (UTC)
From: Ziqi Zhao <astrajoan@yahoo.com>
To: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
Subject: [PATCH] drm/modes: Fix division by zero error
Date: Sat,  8 Jul 2023 18:12:13 -0700
Message-Id: <20230709011213.17890-1-astrajoan@yahoo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <00000000000034cf5d05fea52dd4@google.com>
References: <00000000000034cf5d05fea52dd4@google.com>
MIME-Version: 1.0
Reported-by: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 09 Jul 2023 15:33:16 +0000
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
Cc: ivan.orlov0322@gmail.com, tzimmermann@suse.de, netdev@vger.kernel.org,
 dsahern@kernel.org, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, syzkaller-bugs@googlegroups.com,
 edumazet@google.com, Ziqi Zhao <astrajoan@yahoo.com>, mripard@kernel.org,
 jiri@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com,
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

#syz test:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
---
 drivers/gpu/drm/drm_modes.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..aa98bd7b8bc9 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1285,13 +1285,13 @@ EXPORT_SYMBOL(drm_mode_set_name);
  */
 int drm_mode_vrefresh(const struct drm_display_mode *mode)
 {
-	unsigned int num, den;
+	unsigned long long num, den;
 
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
+	if (unlikely(den >> 32))
+		return div64_u64(num + (den >> 1), den);
+	else
+		return DIV_ROUND_CLOSEST_ULL(num, (unsigned int) den);
 }
 EXPORT_SYMBOL(drm_mode_vrefresh);
 
-- 
2.34.1

