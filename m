Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ABB76D5E9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4360110E176;
	Wed,  2 Aug 2023 17:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic301-22.consmr.mail.gq1.yahoo.com
 (sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF34110E1B3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 17:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1690998473; bh=OvuQPE46agxmaX4ufGOdmLd8LE0zMezBwedxqC/ssqw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=M6aPuYefANa5Jsgpuq2nTXNRT5F3V7cBj53s61a4dPwDw4iHxsofdSskTnbQ7I8Tm7XwO0DfTj8LwEpGbRbkImF4fbrgQ0fKAMOEDfyr2fQXR1zv/IC5uazhNJb75P5ZMSs8E5Dpl5I1LDU9yq1mKL1QABWRh2PBaGX9Z9i+S/u9RX9Vxl6P4Efm4Jbajbfkbk6ys/jHbKrTKIAONGnNO0zSacS4jr4Ylu//2CrG3hHFlsRzEoz1f+7zxKWDeoAPnizzMrub78XDF70FJWgmjXt4ZqPBQxX9J23e8AL01d3sxExbwt1ABlKJtinNseyMlR/myafLsW2t+MszhB0UbQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1690998473; bh=FvQKECw4HKjVLkGGj4p6k9A3opvxAU8ZaWBeQTbDO1Q=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=RDugM32pV+Uk12puK8hDM1B9hUbhh1TuHniH2Zp11e47BxZUft5DH8D5/04eD+B6v6HgQ05RMwHdR5eiRzNEQbG3XeicSFammzp+0XUvO+tdMuzn5qFt2AQtPEoAW2q6eM5KhQv11DNtaZNKhp4ukZQB9zxolIPns4+ld+IF5KPhX2nDSiRUP4Bhmmq0ApjCrKPjmeLwNjQVYnGyrdQX8M221Alj2Ihna9x8xQArHzxNxvWt/n9bMtkaD9KBuX3NmDPDg7m/TaY0NOpz0N79pEH/dmKGgBri/j/IjlfVTzLVhWX4ekXn3YfBJhKq1lYSMwQ9Wt7OW09lIrnnOu392Q==
X-YMail-OSG: iWFIk8UVM1l6bIZ3uCO2wLC_eGhTV_F3Mf3yRyQRuLzxL8vZlHWqLcGDqxA.5Ss
 AWUV2chj4Gs6Px1w4TkRgmc7BhS4N7uVk791I_rHXdyT2nDV2unT75MQBkQm7dGfyB8fIFdazhjh
 eEifOlaslOa25.ARP8XKd8DRoQYEX7rDoPSJV5z6HnSqlxH.VNn69pGHyv7_EFwPeyyESy1wIhbs
 DC7_T1OKGaZdDSZME9V2FDxu4dvEGq4tzEa7vfCpYxQCANJvzKfbpshyU76qN9xSOB9CCihAnBpA
 906mOM6Za1QtEXGbBO3erekoL4jZTUTPfWY7gVYKWalwLDSDLJ3.3Ptzc8UbpDCvzKf7tA6YArYM
 rw8INImzeFoexHvo6XN6H0QsUcwLvBxU7rjJRZbUlN4OSHbW1Ly4aQD7fcmaMqkVBii6G1EjEAuT
 gpLY5SBfO.KbY6WgsfaMxJM4PWaEIaxlBCWrTf1snJuLjyubAyoL70Dyedc7hMkRznGMNcDXKQcb
 vGmkSNNAv8G8W1NNv3zJV0Lscdh9iaSWiFElyvq0xKHqtI.bSLuugnqW65yYjMPtVhGHlf_v9EGX
 G2zu1Qj5HM8inwQXEpJz8YaQxmms6r9nHlXFNmKR.nvsjU636Mzn5xNWtZwY45JJvhqLd4Ye1WZG
 UlM1HtMGwsAh7NULeOIpDUJkDvItV4nAehEFeSfX_JnBfElLtxmjztLeKyYnHVmXRyrNpjJPCKNI
 v38i3uePHnU3opzX1iGJLim7L.KqApTKKW5Wuz3PRMhHNGq6HmhTfJYi.x6El59Gv7chg9yzMG1F
 s44EdVk8EydIE0FTPri_EmXMi5ULKadRW3dLU3cDKpX7bJLTn6ErWjCG2ADyQrwKSTtzl3XEvMqE
 eM6yhW7Uvm4FsxnWycxhZBPVF_SgGNsBfGVWbl_59vvFYcAtkr.bNoWYvf7CQUOueIfgu1n_IxGA
 4P1l6ZY4fyofTDm0Fi7PJgmqUmbCSiYsnfuJo7cWCsHezygmmsbg3EO7_FCYRYqgJ0IoJ2BKc.e9
 FUoqFlkYpfvtbjDFVmS2KO5vF_y5NjTJtnseXzXFvnSANvnWOPS2FTAeWNPzv6I.l020iwyCg.RD
 gF4sWosWkFF1_GUZaPv4hDXjyJUjv_zQMuukGgPssUxxanAssaPk4Tfyha5XkmqULvOLk6IOAUW6
 SkRaq.DiSKUDwcpTjmo62Klvl4GuMfEgij5g6J_rBRbjWEwmEr4P1CqP8T0DtPKag7wyy9apGRrQ
 V.Rsp1n2JIjxRn46KjugiTzvpyx51pLjqlSLfCxu_A52IL0y2yX8GA9PZLTGSV2gT1M6armcPnmG
 aiHv5KjDcdNCbxy2kAkvfUTFqJBtIQrJzcFsXSIANdapyN3190L2JQtqYLZq_AQNERLngWS5ym8x
 .wxdKjTHo4qOi73iULxEyK36kD0Yr1F2cx1NRu5ZWrOk9.a1XO_2cqzG3HE1s1JLmA5aP4CCcwSa
 uUsQZeqMYWW8Y5ROi.yQgIe6yl_p5PZE6ae5dEuu0mLQAa8cH_uPR7m8vwtck7LhevGAzvFsnD4Q
 v3Qj2CxgZC_Ea1ATbWEqYaDxZKFMJB3to6.xwHqsgrpFlrZ3d.Y3Pm89KvPWIFoClDej14xPSfqi
 lb7PTS3ZiBV_W0OtqQ4egR3eEsQQYBhEthY97H1ITiHiBUXw5L5iw4aEsc4alqi7IuyhvQ6b1JNP
 6NdOzLj7yDIPKzhg55h9TGtjQaFsdpdyEIs5B8ZMda2dEDPR8_s3inl7WneRTZSi.hV08yVo3n4M
 TgTlMfiUfL9x4SamrC5_rId53s8nG0nOskz_lwCJsNMjAx9WxfjFLE3xoevVwWtycpn0OgdWHcWP
 CZWPFVE0SucP73Bz__pMWc2RE5ihlX4n3qXrpdb_nzKBvD3B16NUwzMg0Cn4h3qnBL126Vfi9E8g
 Mc7KyOal2hrWXatGGV07grNs7LwGQu918KSrUVYWOEfRu07WuGs7ISN9Y18Xsyjspq4KphcHQzos
 pdsRm_.SjXDxd.S85iefBphliQbOLEiHfybX6QaBL6AMFnBVj93wJR7_X_7t1oUvY5ARufoZlo3t
 UOFZk73w8pO_FQrZC8SJ6swWB1kkgnD_Fjme6VGSQEyOSYRF_VFXyehwFrZV.uAX16jGzAmlMN17
 v7Vmp1c8JLmSEmgePHFpo.d.6a4lCPS9ISKB.hGwWyLW8mnPvuYzgGcsJsGuOOvFT0uP5SVrE2Wv
 lCkX9wNuQ44_axNWXaOUEerIwggYBk1iAMWTPnuhz7.bDLg--
X-Sonic-MF: <astrajoan@yahoo.com>
X-Sonic-ID: b2ff0c9c-1ec2-4d56-a5fe-eb4080422660
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Wed, 2 Aug 2023 17:47:53 +0000
Received: by hermes--production-gq1-7d844d8954-l5pzx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID d660ccb3d71ff4bfca7672ad34843e29; 
 Wed, 02 Aug 2023 17:47:49 +0000 (UTC)
From: Ziqi Zhao <astrajoan@yahoo.com>
To: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com, astrajoan@yahoo.com,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ivan.orlov0322@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 skhan@linuxfoundation.org, tzimmermann@suse.de
Subject: [PATCH v3] drm/modes: Fix division by zero due to overflow
Date: Wed,  2 Aug 2023 10:47:46 -0700
Message-Id: <20230802174746.2256-1-astrajoan@yahoo.com>
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
V2 -> V3: change title to include context on overflow causing the
division by zero

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

