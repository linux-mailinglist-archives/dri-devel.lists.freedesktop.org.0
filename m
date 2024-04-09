Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDD589E4B6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 22:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD9F10E196;
	Tue,  9 Apr 2024 20:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="UXSDlo8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic313-47.consmr.mail.gq1.yahoo.com
 (sonic313-47.consmr.mail.gq1.yahoo.com [98.137.65.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E323A10EA5F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 19:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1712692505; bh=pVMCX21u0wBc9yldyEKLn3Oo8MQzZsaUhaZmg/so+oY=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=UXSDlo8j3N2aCOrjiP5O+iGsWRppbs5d/VS6y4dVxXzwlbkO5soXueoSYi+PCMkDY9nQ7OGkxrIlMQtC8KAlyuW4wag31SxEhDNOSbI+B1P9LUZ85DcJN9BVUPBcqp5alrJR2BZCnmxzp0w/rbmRxbvaHzOzeHOx6iMdV+Z2YfZkWelQodD1Gofc2YXRy3RO7j8JiqL+gnM+pOi9ifdgUWhI1HTGu44UUrbzkhs2/YIbboP4ms27uhZHPm7GHiS9Qa+gPMD4pM9p5wGRbAMWEDdHPWigq4wFTXoleSGb0gBnbgRddvAzoK78kclnEbS++QgqN38BSoMALyzlkCRbwA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1712692505; bh=fbXXpWCsdA9RqrRQK4hWsNwmUrHlC8FojiFlq231Mt0=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=G5LxYtOmQouZ0FQbdViGW3mob1gH3RVAbi8oPEHzrCUQnDueSnei8JcoQOzdbkCgU/7m/A77VZDI3Xx2mOYKvXosQhpTL/GOTQALnSWkjJCG3K7nUNxNHHKRBHzugwzLVEPR3VpqBGVNAxiIVkpbwEEHMDMlmQYDTc5rw3444AI2LNxA01pCaaZDXOWQuk9od/HG7HbkI+quUa6XiTDIY7Q7YuvZD1jUs1mIvvXfdgEOhl7Z2nE7KvFSCKS09se45Ss5yjiR+e7TM3r3bYW0P4K1TXyBxwcztiu5zMei+kRMryFDIMEjcSTu+hlci3zDX29Td15Na/JSyeTVodu2ZQ==
X-YMail-OSG: H8HCUMUVM1noYKYq9pam_9mAHVCFEQ0kfI0TQFRy1CVEGVr4g8aCR.vOpDggtW.
 1CtD3qRtSRmDYxZ_5RL1rE6W8z.6AqeLoUp6PxfBH2WcXDrynxwLa9DsKB62xrGjWWiUj9oU..0l
 8wW.q7HRey7KCRh6AbzCRGOY3ECnYFp0rGrzzLQW_SMfs57zCP5S.rqTeZ3ptJHiPNEXpnked5BR
 .u6RHpMyMetA45iiKXDUReY2zkUOXYQXVpYkWDBZ2dqwlDSslXqCyrJ.j9JPpknFabt5U0APXjiN
 pZWMm_zSD9tsLkPblF71rk5QPbNyN5BrB0HB1tfQLlg5C2Dte0bgJH2UVleA5PHeVoiIhixyeWv1
 Mni3kF8TL_KhDQiuj.W0hJfH9hJx4xMq6.7iucVmQWSncecOjqhW.wSi0kv_OYOzEeky9pcoEy1U
 usS2kbQ15OeIrOna_bs6gt0bmxp61wU8OkZI2W.tmw6k5YCU6IQ6jOPqrgPc0pmE1G1t4WVwn0qq
 Dy0AQHg7QaJaqtpMrQca7FXPx_cbekUBdzJuHmC.U8TYd9fKy1PMam6WNmrlyrg.LhxlEppdlPnv
 5gnVoaS65FCKghCMtSpTfaWqoQv.xUHFNKX8XL_QVd.Z_hZAabJ19PkObSNBWMn9lM2qWp.A4w0I
 0EPdgxZQA2RoS0e.GVu_FizQcQiTtT6VrKguTxjDPD7E.6psZL5Dm.1L6wzVE1HChrNSWvLY_4Jy
 rZ25JGl9qRrPBBLNld8.71JV8pKmC1AoME1CcDM145e1EwGEeFSyLTjKRgtitvQKcuWyp_xH6amB
 FVUofWLZ_8nmOWu2QVNq_nSqKKsxuhp3c7zxQ8i_90oCR.MVszfARK65IYqbvGGEAX.zUGpYNzRo
 vV4WeU9H20xuPwGiQWv9A_G5LOMsYK7rxJGcHWDKlbzl5wFMrFxUbIfERk4M3haX6j9aj656sqt5
 nNk4R2pMIIBuAfPNdMaUf9q9X_PeWnLSDCZuik5yFFCAPA_bb1qcsYxRPbtKiwFynPW2FqO3XCEI
 jHJ5EMDYtYiOMnEKZspuCj6iKSXR8PV0EDNB32GzcHWCfZZQG87JVND1CEfUJ_K2ooWQmtLwcy3u
 WxuLyla3b1jtt3cLrUohp3Ek5y0oOFhd8c__2WtikLDQ8bFoRT_CmDT39suACkkVzsAMZQ5jCQfh
 QzURodjD8sC0lDYHefiGNaoiy1e5_c_4EHuq6ab_I7JRuNkbEYyVTiRfSqnHMgEB6B4znhLyQ_Wr
 GVKLYl4zt.gUdULEIlcG3IodfghiyDfUvjypHOfXfvCRfFIwkOycdK3wV2Kbl9mpClrZYdgs_w.z
 Eb_pf30KB6d2xzFLmSZyl8jwtqHaJxlaJ8UnRsSBtviIZgZqyqy97wFHmCAmAdC4Fcslh35Zf5ee
 JXOYmtw0FOkP_7rohmU79RWmdFrJPy8GFhc1YZcRM4Qgbh76rlbFAt6olSVmKBEPBUMknF5m7z2F
 sg88h09sikiS.sdtyXtBn9Ng7_ljnn_W0FOwx4bcBrt2_grlfo_FRdI_ug340xWoYJh5.aw7OEWp
 6VE5lVVN2BUgRAjwigCfnYz0k0n1vlbRVVZgpGqnfgWBLByoYgKQW82ca_l5TYx2gtWowIIa7VtS
 khzF554apq2d8UkieG._o9Ivk0th2cKxM7dx1xq7lsZMiDwl_KhGbFHUCkibToamd7y2lmJr74pr
 90rsXJOi_iP.DNTZeWXKGpmANtmhKbdaXlehb4kDlH9YDNtcQIcpIUik9N8vaYtgJbeUoB.LnGq4
 co2OXu_a6wraMKFidSY6aMyzyKzCh2In2GalfZqQPqFJDEfdZV5AXnSn4dxng9m.cpmzHZEo2FAd
 ox6_4yRGzCrKEbo.A3.IWdMaCkBB3XseD3f4bz4DOgrF2fo8ipVpqI60uWOWupMY45RKu6nNnDne
 wMe3M4gnRtx9QAVP9KWBUl8NY_D2l8GieyLLR7M.swht9flwChw5KcI9ON.NdDqXiKJjoZdnWYsb
 dee9HAsxH1iyrZX5Kpy35L7I3qWk2xCMCgTO_b_J19GsNbNIYAngZQGfKAh5N1pl1.cIYfnW7yHZ
 vGAyyz81jfUZpgTgVkzVgkpW9yR8X3vqh4JK8r3iIB3q6FM.7zVIXj536KSc3FHsjdWZu_KbV96s
 DCHZ2zaWM0PqZ2K5bgTYNDVYBGRXx7EFydLQvTCP_2s_kSkC_TlDPpPX5xSMs67Rk_cWiNsviDTg
 cdVWwYJq95.FjS8nk6Xue779eoiZCqoHm9NDZHcLCXS7UkixDSH08nD2P
X-Sonic-MF: <rubenru09@aol.co.uk>
X-Sonic-ID: adb324b8-0163-488d-a0b9-d8a02d971dbf
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Tue, 9 Apr 2024 19:55:05 +0000
Received: by hermes--production-bf1-7d6dbd57c9-rgkn7 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ce6b28aff7bdb6bbe07e2f9d9b252da5; 
 Tue, 09 Apr 2024 19:53:02 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] drm/dp_mst: Remove unnecessary vcpi documentation
Date: Tue,  9 Apr 2024 20:51:30 +0100
Message-Id: <20240409195130.25057-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20240409195130.25057-1-rubenru09.ref@aol.com>
X-Mailman-Approved-At: Tue, 09 Apr 2024 20:53:57 +0000
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

Since vcpi has been moved into the atomic payload and
out of the port struct, the documentation of vcpi on
the port struct is no longer necessary, and is flagged
as a warning by make htmldocs

Vcpi is also documented elsewhere in this file, in the
atomic payload struct itself

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 include/drm/display/drm_dp_mst_helper.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 9b19d8bd520a..3ae88a383a41 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -83,7 +83,6 @@ struct drm_dp_mst_branch;
  * @passthrough_aux: parent aux to which DSC pass-through requests should be
  * sent, only set if DSC pass-through is possible.
  * @parent: branch device parent of this port
- * @vcpi: Virtual Channel Payload info for this port.
  * @connector: DRM connector this port is connected to. Protected by
  * &drm_dp_mst_topology_mgr.base.lock.
  * @mgr: topology manager this port lives under.
-- 
2.40.1

