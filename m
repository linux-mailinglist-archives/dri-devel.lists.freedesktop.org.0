Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC648A3BD8
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 11:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7A310E92F;
	Sat, 13 Apr 2024 09:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OkyV7rxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B27510E707;
 Sat, 13 Apr 2024 03:18:15 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a469dffbdfeso46579166b.0; 
 Fri, 12 Apr 2024 20:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712978294; x=1713583094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PNnFVE6OxAC9vi6MOO4Z+HaTgoU0dnwIGRx/mpHEgUA=;
 b=OkyV7rxcsR+9ycOSfzOJR7OriwCM9tLMvWw/NPiJx4ikXZH/ViXR/bOWy8DRKgIg0e
 7ayvbrIKC5wxFrwfmBfTQszXsr6Mp1SXp21hBVTZvISkd7gh13/7NwlARY0dKfi6TZiK
 BfncEX8LG4RD05bQSnEVb9bvyWIe/BlaoziYod8PuCxP+9akrUq9uJ0pmEWzgoaUjXuB
 a21Pxpzj1lXd+a0LZGlBXfBiD2DvWviss7vGWYmI1TLbxbNzqeLNwU+JK8JUlXMvMCY4
 Ts0bCmkvdZ16I4KEOXu8bTdSOfq1zfBrH27FK9vJN2L+/Lc3VG4bOQwb2Uj3UOhsE5Y1
 6eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712978294; x=1713583094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PNnFVE6OxAC9vi6MOO4Z+HaTgoU0dnwIGRx/mpHEgUA=;
 b=B+7s8Q/Hl7L7H1BHkpnagx1jC2YcjUmqWcOaT+URuX8aaEYefF2qegNO6RfQDys6/B
 gtiYL54wKYPgHXbEYFug+Qq5Slo3xB+8bgs7oRuPAnLCrodbVfVKT+qUrFq+YpFd4sdr
 zf3ttOgNX5s2v36l/XZH248Tjc6Pkr88b42yYcYNmuOLgn1QpxqoWjbooLSmKNG0FeUx
 SwKTrDLVB+v0TVSztIvPoFbPNieMnRZ2JXrgdbjXKx8F64o/Z5TUhfk+lH11hv5ljCfU
 3BxmC7QHv9YUzo4h3heTQcnAENG2vHjVlx5EHTSn60wzie3NP/syZ0Xr5OYMym0We5OW
 dNxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTvIh5gXmQseaLY+zHN85V2n1hb5GBBWqtRn196F1bN3hJ6Qr9d5os5PHvMFE8yJp0EPMuMK9wo0HX5WaVrLN5LWY2efsijF5Q8dAjh2JeURynsqW9LXWF9BSWj++1+eKMwXKfdaFi3uJU6h6NckpK
X-Gm-Message-State: AOJu0YxKbd0JQqjpTtEt0FF/Y/HpQunbMIuUs+BUx4bL7jEBW9yXlenb
 X+Qtno43Lp3gJ3Qek7b0tchhftHShqMJ4zh32EyGf9qiN9Ptw2cN
X-Google-Smtp-Source: AGHT+IEoRr1BXhNT33CwKQB7WNo688HaHNYsVo8mJA+Hk5OaW9zxOC3HPhro1PhDEYACC3i9jGCV2g==
X-Received: by 2002:a17:907:6d24:b0:a52:431e:636a with SMTP id
 sa36-20020a1709076d2400b00a52431e636amr1046090ejc.7.1712978293773; 
 Fri, 12 Apr 2024 20:18:13 -0700 (PDT)
Received: from dmitrii-TM1701.. ([2001:8f8:1d36:b77d:8995:4615:5d13:26])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a1709063b0400b00a51bbee7e55sm2450153ejf.53.2024.04.12.20.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 20:18:13 -0700 (PDT)
From: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, dmitrii.bundin.a@gmail.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bp@suse.de, gongruiqi1@huawei.com, rdunlap@infradead.org,
 michal.wajdeczko@intel.com
Subject: [PATCH] drm/i915/guc: Fix UB due to signed int overflow
Date: Sat, 13 Apr 2024 06:17:47 +0300
Message-Id: <20240413031747.2416581-1-dmitrii.bundin.a@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Apr 2024 09:09:33 +0000
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

Fix compile errors of the form "FIELD_PREP: mask is not constant" caused
by signed integer constant overflow. Files affected:

drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

Reproducible with gcc 7.5

Signed-off-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
index 58012edd4eb0..8814d4cd371c 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
@@ -29,7 +29,7 @@
  */
 
 #define GUC_KLV_LEN_MIN				1u
-#define GUC_KLV_0_KEY				(0xffff << 16)
+#define GUC_KLV_0_KEY				(0xffffU << 16)
 #define GUC_KLV_0_LEN				(0xffff << 0)
 #define GUC_KLV_n_VALUE				(0xffffffff << 0)
 
-- 
2.34.1

