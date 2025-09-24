Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433DAB99639
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 12:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FD110E232;
	Wed, 24 Sep 2025 10:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Crfby5ag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A95010E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 10:15:23 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso605993f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 03:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758708922; x=1759313722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IOhc0Qxyul5wC2rt4MIQkux7LNfnaT0nE4lQR+NyZBI=;
 b=Crfby5agSdOcaRhlU5jJYztYSuLJ7Mb+YuvA771QV8S0trtitIYwI2U0D8z9kN7Y8/
 k8v9bFP/fjXdLk48wP6CjELOQPhwZr4juLmB+lG4Arh/pkQXhcFL4y5Vdso5y4GkqOsZ
 CAmGSjN69dUs2DxNq6hfA5z/2ROph/9+fFh1jBfVlT0WCpJJ5aJBhAkvZJwJRgMY8nM7
 C8hXwgsI9JJJeNjFL0gfliuOt6u9eNAFukLKUZWsmRrRmmSo5tuFppxnNCJS8tSn/w6x
 j9id+5gXXzhOkhmoHZX87OTe9AMxMTlYkwYamVqyc3gsnw4Bkz44OFwbgh2VU54jX9c1
 Vjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758708922; x=1759313722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOhc0Qxyul5wC2rt4MIQkux7LNfnaT0nE4lQR+NyZBI=;
 b=IUH4XURJ91JZboXfEGULWrETVRIM+iFMRs7BweAGYg0s1weh0LaSRGvIuIT+3Pxqfz
 TL/7RT+cCAvCTeQGBYdaTHsgWQlBJjHB64Ecpvfpc7Iv98AHF7r7llsEv0nMmiVjhmnt
 4f20HR1thlaEkMw9PQUzKUoqtvALDzqeLeLZ8xK5PbxhDloGBA6ImOYq0nxmdnbYcQnh
 DG0aTkRr1C4C2b3NVHTMvYQqu40KjxfWhRIGqv3E1jXAyQ+LyJX6TMK7hK0e5qBUhZ1i
 pJbNeQ0QcRn56iEipcmGptm08j+vehGgluSHVkIFTU8B3dCzH7e/LyGL2hAWPtoIxUGd
 ZwLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBgWH+lAOie5Z6ngvKFJ5sOEVIra9cIyDOVHE+T/pIvCbpJv12njwsy5SySCzR7j+YANFG+SS4M40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxnRKCbYKmAs+OrD8B5uEUgc6/qb9oqNy/YQQt4um084FZYciQ
 /G1BbNI48/Wo48gMGL5c6/H/Uk004BOmZEXvXSvuTdiDJuBzRo18f+8O
X-Gm-Gg: ASbGncv948BqmuVNSiG3w8/Q8Rrkiq26NRyCsK9Deumxq70fme4Q15fabe2+um0vWx+
 dINtUbHhsSIZQc763uQGL7Q8+Ux5PedaA288tljLMbe1zW45kImCy4A1+sMGKHXVucema6+QP+D
 qnAQwsd6ymXH5m3blZum//6Pmn1S4a52ynHk90LLmTtwmf+L1jajpl1iWYRryBRhyknLTDOsTWj
 P+FQqn046xwNWdEp4y1Zwx1S8lW6vBpfD/Bo3nMDdhiV3ekeS8sR5AdXJbKFswk5xGWuxO2BALW
 bMPEgFjvzO+Noqo8qLrtV6JI2GA0h30IkSDgOJCs5xT6+MTWWtN+Hj55ZVUk/OkOPvbziiZLmpV
 8ZabBAYYAMjzGoAHfk3Wn/w==
X-Google-Smtp-Source: AGHT+IEr/rY8DYnEgjfNqtZnQLYi8AIPod0JxD4snpz+21wUk07dSh+fVo+u5hSxKvTeDXsJt+uDWA==
X-Received: by 2002:a05:6000:400f:b0:401:c55d:2d20 with SMTP id
 ffacd0b85a97d-40ad1604b9emr1380003f8f.26.1758708921561; 
 Wed, 24 Sep 2025 03:15:21 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46e2ab31bdesm24993385e9.11.2025.09.24.03.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 03:15:21 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Badal Nilawar <badal.nilawar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe/xe_late_bind_fw: Fix missing initialization of
 variable offset
Date: Wed, 24 Sep 2025 11:14:32 +0100
Message-ID: <20250924101432.8689-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The variable offset is not being initialized, and it is only set inside
a for-loop if entry->name is the same as manifest_entry. In the case
where it is not initialized a non-zero check on offset is potentialy
checking a bogus uninitalized value. Fix this by initializing offset
to zero.

Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 38f3feb2aecd..4f0a529caf20 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
 	const struct gsc_manifest_header *manifest;
 	const struct gsc_cpd_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* manifest_entry is mandatory */
-- 
2.51.0

