Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D05DF135FC8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F206E952;
	Thu,  9 Jan 2020 17:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE726E8EE;
 Thu,  9 Jan 2020 09:42:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so2025727wmi.5;
 Thu, 09 Jan 2020 01:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=x/rJsrzAFN1SHOY1ywcZnWjYD9yWmdldMlh5f03XRYg=;
 b=l7n3Me2CEVGR8p5a6YW0NNtdcTDn9ZDVgj4YDu6Cl4Kif/Plbh9xiOT5YRyZ7xRTe1
 E5H3y4vlS/PAPJvfMTXpBk7W1aX0vf/JSBniLv5yMnE9WtvQAA5zv0ZjGsDZQO8ZOXs1
 xmDE5aMNv6e/0tWG4RgYVIqEUor25w0M+2Pch+0E8c45C3X/HU5G+To1CTwW5J3cLYA/
 SjHjxo84gnQgT16WkbPApY15KlgcBvYHOCTq/SggQUSf2/b9jhpcyvU5VQINfyabWHfH
 5bJkNepes33nKKUn5T5Ifoke5iVS9EI7IQZKz+z2uv9Js1rr8hlL0ALfEMeOzCIDvr7L
 pYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=x/rJsrzAFN1SHOY1ywcZnWjYD9yWmdldMlh5f03XRYg=;
 b=gEcOIOHhbLNsPKg246B6hEqlXuHDM6Vp3BLDsbSV6JobWAF651LsDn00Pe61mhUYLk
 UBc2XZiVjTcK9RvxRp1bXaUIgR2EpHgRQiKWnLLv2fiEtQXCpXjGYGw8ygv3LAwdWPgR
 ilQWPuVajMyZWWKb0S4GoUqLUZAlQOL4WwglKrkWJQ0WfQQIrVHHdt6RfmSPdQ5QnOgi
 TcfBCum+cwBxKm/tsw8e0sFxsDG/8Zr/1mLOhL9XEGGxavpJPUDxX3lKoGDW/vxQdpJj
 0rTZnFDN61a8UucGnfCbjYYqV7IKgOAuy+n9RIIJbiE1rSnfSFGVEAebuyq77eHFqcm4
 4drA==
X-Gm-Message-State: APjAAAWhsVC4MJDjEM/RA/SCxjbtrGMlL30GDCoEoUCKou2H7fmJIt7u
 Xpnnmp3Bgfjmvu5srm6pv1c=
X-Google-Smtp-Source: APXvYqzutBXNb9l/OLivyPXT06DnycTvFXLnYG/Z5uxCovB+J7j2p4azD6X6kG/WwBfIrjj1YXBhog==
X-Received: by 2002:a1c:ddd7:: with SMTP id u206mr3920334wmg.159.1578562953501; 
 Thu, 09 Jan 2020 01:42:33 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id y7sm3219435wmd.1.2020.01.09.01.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 01:42:33 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2] drm/msm: use BUG_ON macro for debugging.
Date: Thu,  9 Jan 2020 12:42:26 +0300
Message-Id: <20200109094226.4967-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the if statement only checks for the value of the offset_name
variable, it can be replaced by the more conscise BUG_ON macro for error
reporting.

v2: format expression to less than 80 characters for each line.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c7441fb8313e..d1843abc3ac7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -315,10 +315,8 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
 static inline bool adreno_reg_check(struct adreno_gpu *gpu,
 		enum adreno_regs offset_name)
 {
-	if (offset_name >= REG_ADRENO_REGISTER_MAX ||
-			!gpu->reg_offsets[offset_name]) {
-		BUG();
-	}
+	BUG_ON(offset_name >= REG_ADRENO_REGISTER_MAX ||
+	       !gpu->reg_offsets[offset_name]);
 
 	/*
 	 * REG_SKIP is a special value that tell us that the register in
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
