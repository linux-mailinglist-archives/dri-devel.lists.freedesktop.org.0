Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437D9B9C42F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 23:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF2910E13D;
	Wed, 24 Sep 2025 21:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="Q2SUE0cx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FADD10E13D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1758748686; bh=jN6DJ2DabP1eWXd2ZCkfZBFfvBMceXgI8xVTpnKQZYw=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=Q2SUE0cx7v+WpKLAJHv1Etidm3blLPG1hhbXnnlNB1kTGVecyv+pUkQEnUuabW9w9spbHFKD90lL89wHfk+866N6bmk9S2/I31KeZegucOpaVIUGHoWtlz86M4tyT1emC9qqbp/YAtKAbBsUznnuWyUDEMuD4Q7WTDmcNdg//b9D2NIf67fnsr7I5o6Fv5uIF/OK+i11+pfTF30x3SvNi19BqK/tEA1FK1IqKrkWncPiSI45rNIF+Yl6x8veUxxyRYVxW6iAMGL2i/xHLGGvDhTpElp8JnxwUGsTGCngWEvyeBIiqIuDv3Wfv9hCU2kPMaxKj1C201tYoQpFZVteug==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1758748686; bh=eaB5vnm863zQK/vRz1tPE8M3Opuw1KW5pcrqmruGklE=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=KGw/dWAVlpQuEg1rDUxnZtiWbsrS/qkIDE8xJ5PoZmrPTGrVByUpY5DrQkeRaFn6T7UhbyjTxA5Hj9pjtD/n5g0ZoeCqfzVplv+wmrhu0p1omV3StVGUKd5M7ZxSb+dJQfHUsE4umoTb0wKz55+oXMYntRVmA12BtmePAwuTBNY7u4xWCf/tr15a1b3SYsE/Rr88lvIX7SEL6pi8oKW5nQgMji3xDPLtGpKaPn5Bhd3s2yPrBwcBrbIqlNG+6OMivq1C1w5E3K337PYUyJDidENxEh268M9+nx3eO3YsqoxPuf4wvud6X7l6rSfYq7lH8f9NczYsKiYPS2EcGUKyRA==
X-YMail-OSG: 2dBLu60VM1lJVqh50nKaV56YeAVyVCPNXE66YagbxIVXoh1G1S8D1idYGtJXYkH
 TgYOsDejngV9UiVivoJYyoPwyC1gzPLUOOYxoF1wbNvkEvkgxdDwLuB9_uAaQXePv6MARiQE8BY5
 gxroKge40p19X0FKrUtXIx_szkSbl2vT9.oq8WOLUkxJa3MwlsaL.GXM8V2Nz7Dqfo6M7E9Yf_Jm
 zFrk0ocb79cLRO4ku_ghoes_cJqN2BWyqtRS_OcHg7FyUahhGmiBSZu4cIZvT.eQODAvm2OHbeCN
 .UdnAcYjuGEuU_34mjiZRplOmDye8gT2btJ4eM0pQbIcINrVfzn54J4JS_USdO._7DDo5P4M7Kh8
 GAT_o58RCG9u1kp3g14uy8DPeNQaAF8opnddue1wMwVi5irbjPhThXEu0B8g5Or1GD9ekwGRLHbu
 aiHwIrIhHGJ4qV0WKCMrVLkrJ8zdBcKR0UwSjWeVIOvi3elQcYZC2ew7EhkRABoxy02QdjDtezEb
 4oucTpDSKmd7YYnAJwsaFI890GR9OtuFmxFKJ8HJQB_g5hsVy8NXPwdozJ9rloRfmDN0tYdo8viz
 .BrT80Qy6KOgOyAxjQBxW6McSZbjRwOjIwtH2KCQ_SAhn1bSp0ahtYVur7fuZMKrgvR_lMOxo.OJ
 V_aR6QWFanP8sCv7KI64bVHez74vYCwwZCLBypOq9Ajj81nuAXzLleVSDqMwNRCRNvpcJ0WhyGcZ
 TOOxqdbg89aXOr2Hw0Cq.u0S18ujW1dQnWsoL8ArpZflaqZ..qJIC_WbDosJ6uKl2ziinW49VY6D
 2VArOuoQEXyShA61I8682R78y938UeCW5zZE00USCD1MUTU8i3K9kf9qxFH0kYn5GzIVj89WGsVa
 9SGwT0xSzqFukWRWB0GPwqPw4bZ1C38wlpoupEStRvQBjzDpbSrb19QjoVCql5MhAAt4NWA6tWSw
 rSn2o_I_aPKF7gqS.pzAKDTS3JpcMIZBPPXwSjzpoGh__ATVO_s_JTfKBU62Q00VSUIXygDm1tmF
 RyXedbyI1iRP5NkYHLTcMzi.DmIXTXKF1hl1BC8jeCeb6LppEZasn5vswvXqXCgSOFqrQJ4UhWO9
 bP6IzKbfu1Z9xiHWhRyTrugebJddheNevYsfizrFULi_Zm93.EXVKBUzHevJ7cGTXBKA94hHWP2t
 rvLfsvTPxRILtmjrX82AsOSj_iAcBudjZ1yFR_OqTzpXXhSeuflXIcaVCZXYfEORh3_LgmvxOFo0
 VIVFl4cIg_geSPJlmijpYKHB7fHFjHUdsVZ9xrQrwSO1sEU4EX7BKaiuU0U_NAL_QtianMB93LSt
 N9fpK3oaY7VDHqBqieI1CqG5nM6WtY2ZfuxjHU4Sxh_dBOakvJ8eIoKT0SHPZGkECWK0Hhkjj0dT
 ubbI2500NrqHpUBkvtrsNFS3sApCB_s42e5VXJpz2fSpNHzmJgHp_JsJ1mEuLfJThonZCfB0xp56
 c19F21DNMrVO2TQl5zZYlrufLQ3w5PRqkrFqfgA15AEegVea6EC4LErd8AR32tYb24QqqRi_LCYs
 s.NlGLCdLfSr86Vv1kYvB_lmYdF3EfVwDVnrQMOdozgPlCD0kdLcL2Re8Y29Y5v1IvItgtZNKVwz
 PSJ7P_5FZZoM4BuC0kWHwaZs7Di.yXbyPLBsVrONAQzYjghRgxqYoXYRXws8PAIA2Rm4rD7h40fA
 P8AYy0HzCCZVnStCXB7xcn8_OtxYdf4YSlP5f3RzV7BgkLD1xsbJvotrRmZnrEvN0a8P9N7tCUMw
 85F6_Lzel3xwffFynOcNoI6mnbNwtbbe.N0c8vU0RfS9FByHviQ4SgTem2hBNGVgNA2xq9FeWflR
 mn5xmcdWcifvIVGsWH1ZfUtCiR0PIQ2SzMnk8O8rj1mC57ss2OGaORxlbVyWpCNmP6ahzFclUfrE
 kgRiPk2K3FQUEoNL1.U2sqt4UwHznh7DlueO3YdQx9UHBnG.wWNcu71RCHPTWPVUnvHxqlkMtg6e
 M_1nzdrHQX1xIiE154WxLA_VZ0jBwvvxejrQGD05PhMeG7jSdkDtB8Q5eRBbFHbPmYqd5H.M3cbW
 dEgPDaJFSAUuXXUgFRixeTFH9QQgBvVY0xK3S23MbLXLqSBX7txhBI2GXl39MvHph0_Oe5fX3RkU
 7uQ_g_aNZkoMXtJ7CzTpf7K71_y3g0Cy1nKzQ_3LPVUyEL2m6RNdA0fUpQr6aIUNODtk0WFwG9da
 s5zWNtxHWSmsQXKCTgcdIGw3RvB8Qb_HcFPMmAwLkaMWf_Z3_GLkdvE_bWOYCLMCgHEKmSro-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 25109569-baaa-48e3-a0f6-d2d9d39b81a3
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Wed, 24 Sep 2025 21:18:06 +0000
Received: by hermes--production-ir2-74585cff4f-twrgb (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c81868d836ce73f83f7e719b570d17ab; 
 Wed, 24 Sep 2025 21:18:02 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add myself as maintainer for GUD
Date: Wed, 24 Sep 2025 22:10:32 +0100
Message-ID: <20250924211557.6687-2-rubenru09@aol.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250924211557.6687-2-rubenru09.ref@aol.com>
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

Since GUD has been without a maintainer for some time, and I have been
working on it, This patch adds myself as maintainer for the GUD driver.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 16f6013580e9..3fbeb41f8792 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7744,7 +7744,8 @@ F:	Documentation/devicetree/bindings/display/panel/panel-edp.yaml
 F:	drivers/gpu/drm/panel/panel-edp.c
 
 DRM DRIVER FOR GENERIC USB DISPLAY
-S:	Orphan
+M:	Ruben Wauters <rubenru09@aol.com>
+S:	Maintained
 W:	https://github.com/notro/gud/wiki
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/gud/
-- 
2.49.1

