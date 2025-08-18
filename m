Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01770B29A28
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 08:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54D310E3CC;
	Mon, 18 Aug 2025 06:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZKYLeBSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B6110E1A9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 05:25:35 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-76e43ee62b8so1478687b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 22:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755494735; x=1756099535; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qWawdILeIQYq+c7F7VMxTWAdEGo7NrIDJCoccdr/4pg=;
 b=ZKYLeBStQpOHw5VoCWyqdt2fr9dcbdPAfhaj+n6ICVXSJWsv2dYoIiIKrItghe4CdP
 K1D5sCPZnWm3Zv1JJ80p0kri39wDEU7Cis3tZieF4XtzwKF8r7OaWpOYOEuY+q1DUSH7
 IfH/gufWEVDbFSvK7Usie6gZ6cRs5e2JVSRgR1aOj08Zme29jn8KL/YJJwaWIOjeFFSo
 HXz0veOnVlIB2eu4XFJBG1YyICZYfZUiphtenlGd5T6K2QyPKXvErS4xyndsDhK+HAX4
 INIxE9/aU9XOZ90f3tKNwZ2w5vet1pzeSMTR/s6GkZBkpxSdNClzEYSUx/o1luHioTua
 RlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755494735; x=1756099535;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qWawdILeIQYq+c7F7VMxTWAdEGo7NrIDJCoccdr/4pg=;
 b=ZiK6VEY/qZ5zUjutMD7z1z/E8PHh8wsSXwzT4mrNTfQrimMAGFaxZ6AOvQezRUA4a9
 nXtsbVt/OFPc4KG2lnkHTPi0dNIclSK7BvmwuHhgYNscQV8wdWZaQ3H68mRWZPGevyTw
 Q+Pf4xNrEHCwQOWEc3v18n9OsnlZvLAW5h+t7ucdRXOhmz9pux2Cb6nAtkHSrBEbV73l
 cw+5lrndMV3CIvR4aKzxxKPD4ULPS4v9fJBmzmQL6X94O/XuEwZYgqv9Kcn97OIpGnB0
 mLoWzmSSlvMim0tvzCU2Jy0/tdApfE/qt1RV/zoxX9aVxXLEjxB4pxarIYGAI/njsZ8N
 V1Sg==
X-Gm-Message-State: AOJu0Yxep6RA3vgcJMA6g/GHlvJ7H7IVTtnql1jiVHRhwqDV5jM6JAvs
 fl/01qOWyZRWd7SFgHTasmPnbwNv1LDFWcIsX/RVEvvkb3Hn2fpb3+m6
X-Gm-Gg: ASbGncthwv7IbWr2uROkbKd1KdsHN7p3kNdnVAgtX/dWvSP0FHks8w/JUACluWWfJMF
 9RrMz25Z8a2L0GtYrsYevtX7jpn/Iuzaj+A9Lt9BEu9lAN/NnZUqBXht1pBedlT40cAj3K0Hp5+
 06BdF13HjDugTGqhTxml9GTCERdP4si2W97dRuMe8Avl7c0BVGON+eu5sbrcJbTaksRZwq3bT+t
 R29MhyFuozyARIPoU9HAXEf795stzZ5epRQkAG4dRl25nWaxL1u1UvJG6Ukfn3wix7JPNrgPC/v
 8PkEeQGB/DInj3TyqPvrOOBKJBdDUd/r37SAfWwic08TXPK0VNLD1ZXFyVsUgRifOcEJjVpDpX2
 EDBy4jcctfMto16tT8A3z
X-Google-Smtp-Source: AGHT+IFEyHVBPpUQu87+9vuJC5WFe8phvlVaAzvfFzSLbyBXhy6X9hQUYMGsk0Qw1l0OKlI2IokWqQ==
X-Received: by 2002:a05:6a00:1398:b0:76b:2c12:334c with SMTP id
 d2e1a72fcca58-76e4484fb5emr14190101b3a.23.1755494735185; 
 Sun, 17 Aug 2025 22:25:35 -0700 (PDT)
Received: from localhost ([159.117.70.219])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-76e45289544sm6359629b3a.27.2025.08.17.22.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Aug 2025 22:25:34 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Mon, 18 Aug 2025 13:25:18 +0800
Subject: [PATCH] drm/dp: Simplify return statement in drm_edp_backlight_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-drm-dp-helper-logically-dead-code-v1-1-080f76699c0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD25omgC/x3NQQqDMBBG4avIrDugAUG9SukiZv7oQGrCBEqLe
 PcGl9/mvZMqTFFp6U4yfLRqPhqGR0dh98cGVmkm17uxn4aJxd4shXekAuOUNw0+pR8LvHDIAl7
 n2Y0urjEgUOsUQ9Tv/Xi+rusP0Ma9M3MAAAA=
X-Change-ID: 20250818-drm-dp-helper-logically-dead-code-b99252fbfcec
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755494731; l=1333;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=dqxFEX/VL/2RWIvaGy2jWQ4m5TBIX+EXT4oXhAPS5rY=;
 b=2+mNW0078zBqQmEoPaN8PDrxmYaGLav/YPr7/2cybsMI82J15uA68Dbru45EQvNMjKdVnRWfm
 jq0pIurPudUCQ/8nWE39IT9aa1GCSUeber/mw5Eaz6aV2M6zoYOno4G
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=
X-Mailman-Approved-At: Mon, 18 Aug 2025 06:52:07 +0000
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

Remove dead code in error handling path. When drm_dp_dpcd_write_byte()
fails and ret < 0, the condition in "ret < 0 ? ret : -EIO" will always
be true, making -EIO unreachable.

Simplify by directly returning the error code from
drm_dp_dpcd_write_byte(), which provides more specific error information
for debugging.

Found by Coverity(CID 1649043).

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e3167d13636e194c4aab44ee8979aa11..b022ee136db2eb3b721ef918650525202dd22035 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4079,7 +4079,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	ret = drm_edp_backlight_set_level(aux, bl, level);

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250818-drm-dp-helper-logically-dead-code-b99252fbfcec

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

