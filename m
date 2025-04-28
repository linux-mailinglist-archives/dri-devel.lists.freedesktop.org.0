Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28746A9E54A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 02:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD30410E2B6;
	Mon, 28 Apr 2025 00:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="pg3E5aas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-8.consmr.mail.gq1.yahoo.com
 (sonic308-8.consmr.mail.gq1.yahoo.com [98.137.68.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822610E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 00:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1745799196; bh=DF9z8g3ELh3rYm+ScI/lIKOfXKc+J5W8OXc1AfTyS6c=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=pg3E5aasTlLXN2BpIugIWB6OEotKNrLbdeiNilrT/W3o3M4RLACNvhj2fz/dw8g5dc5MsMrFk1LLMWYgG9by+hhR9oQIVc4luUUS1Y651NcB8O6UKSFrU78QkICAJ0mL+7aIz08mlSJCkTZQhOt12hFmipVn3g2xmRPK+wtp8PtG0ll6Y0znL85W5gmfHYouJyGYnYA1umeXi2WCEsFD4r0tX/f1/dOTw9MnDlg0+MYjyesZ9r2xAKI+irveCYuXLJBo1FktVqgu7xUZNIxvgMm4lA8fUY8TMSFg2tLlzzqlymDcT/fyjopRs+5PGoSZenwocq6yuYmsf8EqPfUsEA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1745799196; bh=s+GiVYuOhn+1H+0WqbMAiAaLfOP/laNx5qtlNyw8xEA=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=GxO/S36WtVWg6HJc1JHrozuTX1VHQyp6OGsC/sytS0R33oS/n1FTs3RFC8esXfTEVRQudV4nZ04bmOOIY2ThiCDKTFxNJ3j7NyLcWfCEXaGSLJpFGepo4GjRJlh6X1v/R5htnTBY90YAin7pDMSF2qROWJl60Q8SRwT+5b3Jrwdi4APU0b7HWD2faJACT8ThKsPBrZf9JbtltS2UeQY3da8MBbFyTRxiktypzpruCIyKlQIYWoGAVDh3WT+q4TvJWtNhq3CAyr9ePP8ngLrnm42EPzgTi1W/L7iTZruZq+pI9RXL/ahoDqP56kWwO7a4G1tS4B9o3pf2Ry2FcG9K/w==
X-YMail-OSG: 2ks_.3sVM1mLMBHdHiARRGnn9w1SGOER5iKrfMQzcDSAcslH9Iidgk5YteTtm8n
 c1ENQkeCGEJkyRvGicolZjT4fNzOHnLpTLQuEj0O.vRyrQGkuzF6ySYXb0GWX4c_L6mBAe3wfuzR
 fmJ3I9SK4hXWoGjdRTz5G7u3kArIeza27B06NdMWOQHUJTjL9VDe90xf_04XRwxNivlsk7Py0wJc
 zv.QXIRe65oaY.FaKnDlYoOA8VNvk3IP5E1QldKeE4QiYaaZMZmroRTlzTYLm85z1FfUBwCp2Mef
 DFmd8XgBBENdQHUeZX1C9iGJBgVCaDZE_73zOTuTziB2pl3WLd9EyF_InhNm2x8DrtHNZ5g5TcHZ
 RTc9XEKK3yMPJfGNIEe7xeHn5WTZu2p9_7Lo7oOVDDhd1oPybPF7mLTv0wOYbCl4NXrBRIq8oiWG
 oBC8lJmbLfVymIeM037mXnMm9kMPHeb2YADSme6gOFlmr2l0nmlwQrJGNaYiuwrbImDJZ9ahWNmV
 DuLo71jm4zAZvE4YRoGZYzfcywxjzljX3xjsXUGPmNl8ABvJoIrBLgA1.gB7F72m0EDIjpkCnOG8
 p2FJfSY1h6B83s10ecNXUVGI6yerCP8sqc5EfsUb7py.d52eaKTrCic_uBNwELKH7ClDzGVIrdbH
 l1kU9EKuhKzFtWQeHBEzviTF56GbeXped_5MF5XETViI1EAYBzabCdB30_P6TKyJpNadhUlrqC3q
 5CCioZoEOxz0jEMvXA00XH5igo7BxvGB2KIDHVvg6iZk1bJzTdZvulsfflvhkU0VpQjvvmGbFzF_
 WejEbdfCGtJ9QK59rBkSZLFDQu2x2gdVzkHECJkOcXExX7ccqwmQYobGRmMb3k0eZUZusaEVsMRw
 IBpuT_iLnL1oNim936lhsU.Em8pn3xfb9eXIBOpscVwH_TbIrz1sqGQGXVRFWlHa6onvKIacM_NT
 Q59yLVKzhz5tP7cVidhTh5NZfBsVMXaCjd9EQ9z.D_m77MDeNjEeeTPe8kK26crr8IH.WU50L9HM
 xNPJyZiVnz90UnIZRBp02rYnpwa5irDamERAoK8UlhoKqFGYMN9pLVN5u3lGgvLjcWsASQSFmTob
 HF_iLdsqc3P37u6il1fUFnP0tNtTQuYW.8POv_TiXu_YsdsZrvxHH97_H.wIvNlBQWBPxYk7vZiz
 ThGBZAMouXcsGiRl_Hgn6z1GuaeR9d2YAgAoR5.Kp9GaNon1I.5DT0IIll4qYtsF_FF8Jq9rWrx5
 2v1TCfpzHl7oLp5mtTt2ZTtS1hW3PW6eACqI7intk2a9cbdczOJkziQ.12T8yv2hKbJGqsTKcm8X
 ILOzrYBeXpzNRWNBlDYjadYbx0YhMzSfZpmrUoieKVqVcvOP6V1Dc1y.8mVZoBdH3EwiIsaC2O15
 7UKV5fsoH76psxLGm18z5aucM6ymx98.HWb0DseBKWMRO7CoFcriLg7SrldJfvnoGhnPjlPeLjav
 eBJj6CAwIU4J.82ZsqcMiSOw7zXUIxVtrnjtzPFKKaK2dm7g2aKp29KGDWwnsLNQSmA55lD8c0gz
 kvfJ_naB5jAJ36iqkkRNrVRSenqcPfHoNIVMx1MryXlX19BhRnN.1hh6RhxIKyCPtS2hd4DvW9Am
 eBs_meRTEP0YXvw5Pi_k7KnUROCtQ8i3xmTj7tQTPpv3a332NvVaM7mDZma7VQoU8BZKZxy_Gz2a
 BUKv3s9XErfW8PAip37A3h9_6gAdKue7XCqdcGcDtVqu0p0HjlyzFdIUJ980NQFcLFZaY1HcGwM6
 NW41ltdD4NQ3bUmgjDpKWGX.kJagNxtn7liD0FWGluBdHWFiytTbaHS1JxFZf1JT5POS_KbZi8sN
 rqE2qU46oF5TRYUIR8r9hqFrnjzrU4OnrTJB75IdxaGalZFNVnbsIN3DWmkvJfE4HBitHaBXndiV
 Wy1nUZ9J2Y3L130xI7WNKc5rZ.y47v8IAs9mU0EAqCqEXPkhGwu13o1AuZ1oI4BoWw74gg76rmuZ
 L_DKWyE1NAQFWosbAknKbac07RBuFnqV68bOtsncOGcWkmnov2dI2eWh8.gFcYiqgCMaE5Lnlk_C
 cTgK.rnqVNfRsHlMw298TUjQ_bcqsDDSS12We_6zN6YLymSzIjpyH3WU8vGZ1TI81yhqz0wrWoZK
 1Wi4fga_VlZU.lhNsx9GUW97QWorNLQEX80Eu9ciMfBCOCFXE7I99hWspTVfozQkZiOdMadfk6Ej
 dKrzq8hVM_zxx9Sg9UMkGqUM1kM6S2FxcXangRPf8wwnSU7.8L8Nv.bSkojAr.Wk-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: fe44ec52-cdfc-49ed-a407-917767beb6ca
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Mon, 28 Apr 2025 00:13:16 +0000
Received: by hermes--production-ir2-858bd4ff7b-w59v5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 81a470d268a14c51f0195e2f259f2ce4; 
 Mon, 28 Apr 2025 00:13:15 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix unexpected indentation in docs
Date: Mon, 28 Apr 2025 01:01:41 +0100
Message-ID: <20250428001249.112238-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250428001249.112238-1-rubenru09.ref@aol.com>
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

make htmldocs reports unexpected indentation on line 1119 in the kernel
doc comment. This was due to alignment of numbers (except the minus)
which caused indentation. This also had unintended effects on the
compiled documentation, with breaks and indentation after the -1 option.

This patch fixes the error, and changes the format of the options to be
more in line with others in the file, while still keeping it readable on
the code side.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b9a1ef343c79..6ddfd3ace2ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1116,10 +1116,10 @@ module_param_named(rebar, amdgpu_rebar, int, 0444);
 /**
  * DOC: user_queue (int)
  * Enable user queues on systems that support user queues.
- * -1 = auto (ASIC specific default)
- *  0 = user queues disabled
- *  1 = user queues enabled and kernel queues enabled (if supported)
- *  2 = user queues enabled and kernel queues disabled
+ * (-1 = auto (ASIC specific default),
+ * 0 = user queues disabled,
+ * 1 = user queues enabled and kernel queues enabled (if supported),
+ * 2 = user queues enabled and kernel queues disabled)
  */
 MODULE_PARM_DESC(user_queue, "Enable user queues (-1 = auto (default), 0 = disable, 1 = enable, 2 = enable UQs and disable KQs)");
 module_param_named(user_queue, amdgpu_user_queue, int, 0444);
-- 
2.48.1

