Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ADD5935BC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA877D0B47;
	Mon, 15 Aug 2022 18:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23513D0DC0;
 Mon, 15 Aug 2022 18:34:50 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id gp7so7630206pjb.4;
 Mon, 15 Aug 2022 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=fpZDxV3FuvKhUJk99+fRvjd0nkg0TSmKhn6atJ1wty8=;
 b=a1K+P6NVeHSYaQMtXr/LyitVsOi7nOVeQHeTYjzFN9ULPSC59iBbE8SiHTl0W/rmkp
 fRSn62nD1SfUPJnD+khvkRZfhjIkb2buWTPfmjYE3iLXaj2PL8HpwpVeWMCpyn+VPoPA
 EcvW9DMwcscmwN1+PMPMPCK4ZnFmomRZxjvDv9faTz7z4byWzH/tYj6oi6dl+MLug7+Z
 iXye3WTEZwDkiCrqGp9qidOfFhjaQC+Q46v85npKusBU4nnWRSViJMpATPWWUVZwU50E
 Tz7Fqbxb/Rv+uksfmWRJ21PhkVNDlBvCWVKL8X2xJkMapqilUATc3QDp6N0ERShI+EYf
 fZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=fpZDxV3FuvKhUJk99+fRvjd0nkg0TSmKhn6atJ1wty8=;
 b=ffhowk6K+1OEf+1xvUn2qcqdFqHRVsVrNvj3py43vZWbe6bD1ilZpl8ZwEsbl955Jk
 GoMFWmGDr4t4Yz6dnZOEO55wIH1AnpTXrpaJVmg+mwu6TL/4RsQaPQhNtU7gCJe99Q/2
 OelzVoUBbMI3qt5Z+X3ncr74YopN5ZYBO2+jr4gHUQOpzRN5AasthIK6tRURL/ZPahqQ
 TLTyvc4u8/XUnLON26s02InO9O6JpUOm2T1Kok6OlUfHoOLmEntt/lIE4Myz9dbRO+2H
 VCA7Wlce9oVsCCtyK7dmCyRSQ6EaATyeD3h3H6yU5GCAmhKGZLPU++hxTLLVyZLQuS64
 J0hQ==
X-Gm-Message-State: ACgBeo25h5vuXMeNRs9NzG4NkdNWHSUmEQMRxV/aZ9wABT6OR+alDM1X
 xaaPpiv0FPyRSuPS6UQzhKIQL77bSngjSA0r
X-Google-Smtp-Source: AA6agR6DID+aTGefAK9b7+8YBYaTXPl4EGnNCw/qrKaz5t3HTdVMKH0b7FbPSyTAVyNyT+6GEmiRqg==
X-Received: by 2002:a17:903:2601:b0:16d:b055:2985 with SMTP id
 jd1-20020a170903260100b0016db0552985mr18216404plb.161.1660588489692; 
 Mon, 15 Aug 2022 11:34:49 -0700 (PDT)
Received: from fedora.. ([103.159.189.148]) by smtp.gmail.com with ESMTPSA id
 q6-20020a170902a3c600b0016c78f9f024sm7305175plb.104.2022.08.15.11.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:34:49 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Ruijing Dong <ruijing.dong@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH linux-next] drm/amdgpu/vcn: Return void from the stop_dbg_mode
Date: Tue, 16 Aug 2022 00:34:25 +0600
Message-Id: <20220815183425.14867-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, Khalid Masum <khalid.masum.92@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Sonny Jiang <sonny.jiang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no point in returning an int here. It only returns 0 which
the caller never uses. Therefore return void and remove the unnecessary 
assignment.

Addresses-Coverity: 1504988 ("Unused value")
Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
Suggested-by: Ruijing Dong <ruijing.dong@amd.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
Past discussions:
- V1 Link: https://lore.kernel.org/lkml/20220815070056.10816-1-khalid.masum.92@gmail.com/

Changes since V1:
- Make stop_dbg_mode return void
- Update commit description

 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index ca14c3ef742e..fb2d74f30448 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1115,7 +1115,7 @@ static int vcn_v4_0_start(struct amdgpu_device *adev)
  *
  * Stop VCN block with dpg mode
  */
-static int vcn_v4_0_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
+static void vcn_v4_0_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
 {
 	uint32_t tmp;
 
@@ -1133,7 +1133,6 @@ static int vcn_v4_0_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
 	/* disable dynamic power gating mode */
 	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, regUVD_POWER_STATUS), 0,
 		~UVD_POWER_STATUS__UVD_PG_MODE_MASK);
-	return 0;
 }
 
 /**
@@ -1154,7 +1153,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
 		fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
 
 		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
-			r = vcn_v4_0_stop_dpg_mode(adev, i);
+			vcn_v4_0_stop_dpg_mode(adev, i);
 			continue;
 		}
 
-- 
2.37.1

