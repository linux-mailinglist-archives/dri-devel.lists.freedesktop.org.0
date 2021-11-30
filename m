Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D846324C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 12:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99126E8A4;
	Tue, 30 Nov 2021 11:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Tue, 30 Nov 2021 11:23:57 UTC
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29E96E4C7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 11:23:57 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3KTs12R1z9w944
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 11:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjCdO_hC_tTb for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 05:18:41 -0600 (CST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3KTr66l5z9w949
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 05:18:40 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3KTr66l5z9w949
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3KTr66l5z9w949
Received: by mail-pl1-f199.google.com with SMTP id
 y6-20020a17090322c600b001428ab3f888so8069706plg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 03:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fcDXlkwYy3RGfIkoC7nwMHwkoGJwFkeLToaTBjqpVz0=;
 b=IZFo2LaVF/UDFGHVpkS6dD5TA6dpvZiDSB/3rKX1VSVjqxWP/lhMO39QYI3NPLoRgq
 cRXSmh8e41mhZP6Z6pASFNZgCl2xPwfVgz6CBJ4rCuCZ5ixas3pK71sx3cvXjwkJTop+
 3T/yiRiF1QWYne/jINn7ouKO7OjCe6gsRwokRuSedKnx6jzsAq8pHSJdN03f8AET5TzU
 a3BC2bkGlVrwO6yuzbS4R4Uw0sjIcFhIuR8RmeSA1Od8jCr3Qr3cmM751Tht6hvFkmqk
 ZRyDmDTDs5KOn9FrJ5pzFxU474Na5c2560b3P8n5J2SDV8k/mizEVWFX2R0RVU+iUKxp
 O0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fcDXlkwYy3RGfIkoC7nwMHwkoGJwFkeLToaTBjqpVz0=;
 b=q67SNMLL+Tq+tFdI/9jm9gOoPvDnfldj2Zwz6TkF+wHTiYD2JiIcLVG1fTqPUZuaw1
 0mKOAFKSwWXAcY5WWxSJFMDjvvlZnE+fuNYjJqMQbASsx2sP5RrFFZs7NUAdrs7fDbBe
 +JO288bDG1B3N5G4DpfqvgKeqUlceg/qnYZXhu/CpZo6ZWfz8hxc8fIv0p05CZJp21B1
 t0sLK50NNkh5jE28tXPQzzToUDXkNFwNDirXwO5y13i+vGx6CgPsEaXkLMiuqz8LZxIM
 UuF+tzkzq6b6WUJ5ts2ryQ0GlmtMJWEI/OFUwOiUNtXV25v319rvE2aKqlb8QbVbUDcU
 YYAA==
X-Gm-Message-State: AOAM532HcChhGZpkwV+mTaO7PzBvzQFc3EswkghYQQ0IiPt3F/2JAk/r
 h76gVduQ7YCEcUvNQgk7A7z4d95TnYcbTCKsmAz+ESp2/FtNB6qIoEzRXo5sKuvR+KcFnUF94jz
 +eU8l/mHHKcPiGd8Oi4XPYtTeegOmsA67
X-Received: by 2002:a63:4815:: with SMTP id v21mr33476642pga.204.1638271120003; 
 Tue, 30 Nov 2021 03:18:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz86b37XtXDhaWTJbzxcPVwFldWszd3ZgCjYlChRIfA1Lxm91iK1IJ9p5k5TxfqRc7ZaUDHCg==
X-Received: by 2002:a63:4815:: with SMTP id v21mr33476628pga.204.1638271119786; 
 Tue, 30 Nov 2021 03:18:39 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id q18sm19100280pfn.83.2021.11.30.03.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 03:18:39 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] fix a NULL pointer dereference in
 amdgpu_connector_lcd_native_mode()
Date: Tue, 30 Nov 2021 19:18:30 +0800
Message-Id: <20211130111832.113821-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Nov 2021 11:24:53 +0000
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
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, hongao <hongao@uniontech.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In amdgpu_connector_lcd_native_mode(), the return value of
drm_mode_duplicate() is assigned to mode, and there is a dereference
of it in amdgpu_connector_lcd_native_mode(), which will lead to a NULL
pointer dereference on failure of drm_mode_duplicate().

Fix this bug add a check of mode.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_AMDGPU=m show no new warnings, and
our static analyzer no longer warns about this code.

Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 0de66f59adb8..0170aa84c5e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -387,6 +387,9 @@ amdgpu_connector_lcd_native_mode(struct drm_encoder *encoder)
 	    native_mode->vdisplay != 0 &&
 	    native_mode->clock != 0) {
 		mode = drm_mode_duplicate(dev, native_mode);
+		if (!mode)
+			return NULL;
+
 		mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
 		drm_mode_set_name(mode);
 
-- 
2.25.1

