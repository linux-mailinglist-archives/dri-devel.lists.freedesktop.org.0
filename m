Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECD64042BB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B344D6E3F0;
	Thu,  9 Sep 2021 01:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic314-20.consmr.mail.gq1.yahoo.com
 (sonic314-20.consmr.mail.gq1.yahoo.com [98.137.69.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199826E3F0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1631151182; bh=C08fKdke0xrmWj9slXAe3LXit3kTtXHi+OOJDsIMfBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=EerTMdTv3N1isWugNxqUGhTSHQN/kyfZ18zQTnYN1AQSDO8Mb34chzV1DMY6KpKkkEoRSeJ0ksa01d+ev3/miLHiaIf3itzyNF+1GlbHzDKEJErWl/ulGgLVdOy/0L0EaSQuyaJMnoV7pD3JWdrjirMbxUqIfKt6MUbN0DSI7qI1Ora4kntaPEvMIZGpDs5hCP8FOBaIaw1iO7bkLPeH7ximyJEMFyHIBoMgsxuUTHtmYbPXvSytvEKa5JW0rCY65XnOkHolix8Jo2dldJfnP2CFdqBiZBJAKW+oB6Lbl6057WIcIJHALZJzj2bsGnfb8uhDHR9GdHPDpUcpWiCrNg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1631151182; bh=u7k80D9av5n0td53q4iMwSr+UMghexIh13L3CZ3MBQb=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=EjdlsBwW59wFSBW7qR8t6aGJI66f3iW4Oa9JqHeJJ9YXTjt8s236FeahiPqmOMT1zvQXn2izDS0zXXEgCpUlEt6wFXh/cn056N1zKMQ1VOtlz+16hw7iJLuWze8nvECuEB4e6H+tApGIJdvay7QFKGr5hapM+RflVSQ5hetz5LS/Vuq1PifMrQmQmHaZZ9TX6ujmmX7+/YtUm7gpVkd/YNK/uAMqctwtTe7kekIa8JcQmG69e/Eh8pEarm3LgH7RgpPNH00Z9K1dGxgVlC4IDjK6ETFo8T5+EN/hyEfZBy6O4rkPRyNRc0f2ebxHmC5/iVp7yo4EvFS2C/E/0g5Fjg==
X-YMail-OSG: 8ntCpTsVM1nJ1Rz7VeWkgtO9GCAc4XpWXPEXY3BtiaWi3ph2UVD_gC.FFgvY8B7
 qy_Uzb0u1AIzrvw9.QBENTRO1HhBNQjBDVN961eXXe7_ZryBHy7rQIPupUwPK98AaBQPop4igaxQ
 7xYnnb2vT4c_ikUo0HKBxKHLe35EScyCP0zWT0uFoxJ3eeM78WLZsReixsPHhF0Gv4Dfi28fmkT0
 VDL7Axe84_CQ2FtCddmfQts.fvdubuzAqWqqokMtHQdAvc2sdTGBqRgPw9RvGgxXOq1c.NCAZU_a
 j3FtnBstwcTAHzRYk5_YYwz03iVKS_52aba9ga2002SEJ0gJC_DsfGE21ngmsAtOGK1XEscjVpJ9
 i_BXVY8fRrJlWpab7b0ziG8XHLS_o412nLEB._VPsgT_sxValbsDjGb58MSgmWOp1okkDQKX7MOp
 2JemZmHbtGgfPLgCzgWg5UnIS4vYooV_Ydedrp8bT.aAzWT38WRgbu5ZV5nuzHqGBRbfksur7UbJ
 p0bsxLWv5UT2f9uM.IQoz_wjnvpt3w_ULtqwjlvIyU8G.QQYnIzVIOF9AA6A11Yo528BL5Mtz84W
 HUQSZLJ6x_.94VW68.HllEGRMPk7h9myzL76zPOi21iNCutZN3pFM9bEzA21ox4Pvpqr_x_wf2Xz
 g3gyPiaXu_l_mpbmq5CvPhch6bBltovmyFEflhDs_s0MBzvVWDMY7UIz9qDCiggbOoxEhN0J6rp.
 nwSUnrSGuftzv41RwKgtQPgeCnYaC2PsYuDO8iCJijlReekc3yUCk8Okh5lm4zz8cNgH0NX.3y2h
 pJR.qciYtY5fzWjZlKI3KjkqbzHv3NxVafyr2HqdPCcFnFX1EF8OAD8cfA8KEJ3p9TBkeWCgYUTN
 aEQIm2jopqWNMZokbtqRzjiOUC8SGRXe8kdR6KNoajpdjDjv4_1nyaN.DijMTg.3GXAK2G7toDk3
 BawxORiZ6F9sa3_vCOiPbmp_PNmBAx7MXW3lCamfIEaPSl9FWTVxsGH6PuMvzpIYeB2_ZPRvWdBV
 3ysnf4tLrFRiCtIMPtoK2kszVgiimiVsmtk5cvP.03FB.w6ZebCt2IH9XSBWCdId1kAK5SPvMQOL
 ID8B4L6cJCAEYcVGQmygsaGTkzTnQd5Tp8qRtMl2uqRv9RwwRbMFP0kxly_Vc__V2tTu9MPaEhXe
 5LbavALhdyF114FPt2IAFDvlG0c30dJ1PQwORPwv2n_TeNrhE6m4JN0lQ5B_S3dK.AdNEzKIbRNi
 Xvxe66nzItYiHWsAHhFxMubnBmM62CZVjiLmJYkKeQ_CQv6WqGHus1eGIdNGUmfiGy3IgRRUTDQP
 TmcmhNjgAy45cDM89uWatgnIE8N3ZcEgQ2TpjgrwnhjY3iAiDMLWnwZyyHHO9FdY1Rd8ax3JOEeH
 yAZVWqzNnb7nHP4aWYPmt9M8XxpUyRgbV3XT0nTP9ItWzAkQ6f7bhbsYdeQ5F6_CFucPTc1u1gP6
 fGSFEfF1jwLLN0nm19E9hd7GoCOyEj5G17HQiVgA.9EqC7ER4FHcrT3OE7iJzWnSU8nvuGYBMaWT
 dwDI4VOsZmdjdffFXhm5b5f_a4KOmiG_WqYSXxGx4YYV3hMlxm5ntDoMJkWxSIfFaf3XcSXdNhdG
 .pn.nuQjw5M3Eudpj_fZL50_7B4EHtcrWLILQ.cKrvDlyOihYiKzuYZJ13B.jtUgt6IAir2UBPWt
 l2Sac8BI_jT4x5F7vsFZdykV4q7KXwfBFvzfeqM1dkqQ4UETmFRKZ6Rm6DDcnhm7bxG0DyvoXd5Z
 jSF67V8mjc1z1Tam4.4t5VYcs9VtK7RauSmVmVvpgrHiUp7oU3Xhnt9m4SAN2cHAdBfPTokmAvFU
 9fOd22OfiwRo2fQKqo7Ul7yUmTA8wkJ3LTUig12TdGQXcNIgeR388SBk15biLe_aC1yCpRzYI_ax
 WBSUphDHgRVQZWHWJRF38bE5U54.42iqJYla8yFhAvUjhB6ePOZpbvbhFt27BARRg3Y1ODnYugUN
 PZgG0cWUuXvpoIcItN87hsbrbLRmR7IwiLmYRb_bmudIjHUYCpH8ACatwqHK7y3V1nkxbUVwvAET
 mCMrFWDlVJ9ENEDX0jfA70qwcwgfKHpJdFfhcfa.P36X.IZfsF8ytwTORZ0apLBIgL6.Ce5t0epM
 LLm.0oY7v_Lmq1XnUnyS.rGd0YF6mXZOf.Dcpby65D_M.EPQWZGL962uReiyajfjHMLQCbue1KF8
 i_2GNZNJiqxvO_tSbLepgYgfD.iZl8A1FEuL1ulVkinOV1DBW_BLlL5pU1yEc6TXdSOWn_cwEKT6
 ZKuclfnZ5kCKsOm7P9xzjwOpA_O_uvRLEGobsf2neTg--
X-Sonic-MF: <alex_y_xu@yahoo.ca>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Sep 2021 01:33:02 +0000
Received: by kubenode528.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 2ef029e8b92ceadaa8a8ceb4103cbf32; 
 Thu, 09 Sep 2021 01:32:56 +0000 (UTC)
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To: dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, linux-kernel@vger.kernel.org,
 "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: [PATCH v2] drm/plane-helper: fix uninitialized variable reference
Date: Wed,  8 Sep 2021 21:32:47 -0400
Message-Id: <20210909013247.32743-1-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <YTkCQCPwZPbhMfeF@phenom.ffwll.local>
References: <YTkCQCPwZPbhMfeF@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/drm_plane_helper.c: In function 'drm_primary_helper_update':
drivers/gpu/drm/drm_plane_helper.c:113:32: error: 'visible' is used uninitialized [-Werror=uninitialized]
  113 |         struct drm_plane_state plane_state = {
      |                                ^~~~~~~~~~~
drivers/gpu/drm/drm_plane_helper.c:178:14: note: 'visible' was declared here
  178 |         bool visible;
      |              ^~~~~~~
cc1: all warnings being treated as errors

visible is an output, not an input. in practice this use might turn out
OK but it's still UB.

Fixes: df86af9133 ("drm/plane-helper: Add drm_plane_helper_check_state()")
Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
---
 drivers/gpu/drm/drm_plane_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 5b2d0ca03705..838b32b70bce 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -123,7 +123,6 @@ static int drm_plane_helper_check_update(struct drm_plane *plane,
 		.crtc_w = drm_rect_width(dst),
 		.crtc_h = drm_rect_height(dst),
 		.rotation = rotation,
-		.visible = *visible,
 	};
 	struct drm_crtc_state crtc_state = {
 		.crtc = crtc,
-- 
2.33.0

