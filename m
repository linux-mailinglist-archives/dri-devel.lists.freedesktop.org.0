Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1C5A6ADC3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D1910E6CE;
	Thu, 20 Mar 2025 18:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJc2LBjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F4810E69F;
 Thu, 20 Mar 2025 18:53:49 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85e1b1f08a5so33942639f.2; 
 Thu, 20 Mar 2025 11:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496828; x=1743101628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7K7xRXZftnouPQnYRpMXoKCruxhJlULif2fXsuJr/A=;
 b=QJc2LBjoVvxsPWfMiwn2/om3/rNanFGf+mvF/df7AyIcoym0ikA4cSZ0Lr0QHFM1bM
 8th/8fsnylGrrK2q0tdZooFE5+wpXybb04mo1vAntaS+wF5C8ADYXf7bRwpXIzmy+IS5
 wysR+rrc4VH4z++DoKpsfyrEyyxekdtSyviHkFo9osPHSEiqksTioFvfzSqbqGLxg35p
 HkJG1fiuFBxNBOSAKsJR0axNGZFae1pr0eVod4gys2Bs9VCKyqcGNcdk9xe7SkFJG/JJ
 HmQxOgnWjIsjyOsTkKAXBu/vnEQP5fzXsxkm6OSsblJ67qVu3XKI29oRTenPp5F1YHTr
 mEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496828; x=1743101628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7K7xRXZftnouPQnYRpMXoKCruxhJlULif2fXsuJr/A=;
 b=TlGzK4ucm6qaN8SpyQVN0BlhcOwQTWKM64r//2+2XaVKtAW9p/sTzA3pm0+vGY3E+6
 BnyfC1LdT3EdM4E+6OT5JHJ4N3Gl0fzSayF2fSiV1eRfnPhLJNWtV3HGzRWVHsCpB1gF
 P14Q/k803UagjRtUdqy9xXp/D24urt0wKEhWzmQGHv9QHhBE91aLdFKNKUZqJy+Vii3J
 VaOWVyQSSMLKF9kQ6n9dO5IQ1QSAk86Wf12KaG+jMOolgPFp/0rI22TXVXk0utxf1HEf
 pO5uPzFHJvpxFJULKmp0E+W91d1ifwXItwWbICEJsTWAnI9T9+LPSZ9pjjK7mZWTTHiW
 4Anw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/248tRqZw/LVbTR3seVXWaftWabidrFN52WeJvuRkhxiMOhgTBN8sgwMIYLXq67ZnJcX2xmcDfw+N@lists.freedesktop.org,
 AJvYcCUNrRoymRbXu/Ffb24fAUlfAbJA7zfyI7o0eAoPMKxVEb+lu3cdYzZ09/GsrEgHRt9JdAv71r/F1lT4cWUBFg==@lists.freedesktop.org,
 AJvYcCUWuO6Tk1PML18o4GkzBj+R3vWuqB77UmIc1Mm3bm3GEuCbLmYaH39gghPbQq40m5E5RtgfxHAs@lists.freedesktop.org,
 AJvYcCWwnsEn3ITZ1iyhVISNvszgbobyTs2VwhLV05l41FNDeT/ofFMYQrOCbGzZhHkNE0CAtm1d2lIhGYRj@lists.freedesktop.org,
 AJvYcCXDcSyIK2lhfBog7w7xaI8APJ81CDBPfbjKROhP+CcNedy3sMRE0n8WvP6/sxdFB8e8Rd2AR+Gv53BGVbd4QaXexQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGawfGLVungwO+kPHrKu9zig09QkaiIqkxrs18CaZT5f/YGSkl
 yrsizHvzCuIVScbCVl9o2mDDKSfOIaEGJtYX5K26esRQ0oh4MNal
X-Gm-Gg: ASbGncsD/S0sH8lD9b2SmZqBdjujcaiQOXGc/62wZG/9tPz1PbR14ExrQ+V20dQR3HT
 0GZor18jpfpoqr+2kaOvgzde1TWsp7ecYm7N5mJKggWiH+X+uZqoFmDtFRAxbI7j5rzaECgtope
 7K9ZX0RlzGxmJ/2wsL6b/8Rbx/VoQ4r2FTo094nQ/P3ljALRumP0jfQxtaHLYEZJLuJZ2qAPfBv
 7qRrmEgcDAbOj8XaYvnobrb/NxEMjDMygpjXKr/7271oY8s/VRxcHhSKx7NFtbqQrXLL2IeK/OU
 tz/C57Pw34LuAV1rXiE8vuoZ3+6pq2zKXMSyLB7IOdDZj06z7xiztPL10vLKvL/4SsfSun89vLt
 oAQ==
X-Google-Smtp-Source: AGHT+IFH7Hg90LlweLnnOLq0HO0JR4tzWTyeAt9Zt7MPpyA0RDON+RgSb3+P8+rQoDbSr9vz+Nlgpw==
X-Received: by 2002:a05:6602:3896:b0:85e:1ee9:1c18 with SMTP id
 ca18e2360f4ac-85e2cb1dda1mr39264939f.9.1742496828643; 
 Thu, 20 Mar 2025 11:53:48 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 39/59] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Thu, 20 Mar 2025 12:52:17 -0600
Message-ID: <20250320185238.447458-40-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c0ddbe7d6f0b..e1367f66c4d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -234,17 +234,7 @@ int amdgpu_wbrf = -1;
 int amdgpu_damage_clips = -1; /* auto */
 int amdgpu_umsch_mm_fwlog;
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
-- 
2.49.0

