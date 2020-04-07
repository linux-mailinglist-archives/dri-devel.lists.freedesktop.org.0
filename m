Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318771A1C22
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3DD6E960;
	Wed,  8 Apr 2020 06:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1048289F35
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 18:26:24 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m67so352768qke.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 11:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIzZDxt4owy5jO/YbfXWS31RiPx2ETthbOiAb1EV9P4=;
 b=YtVBKm457AxFLluMcN6Nh5lxMwkhKLfQcFmIzF16UjpYwbi574i9IUsdKd+i1y8jEZ
 QO7YgInPHWArXiIBcjFTESZaFPpm/XZUbS9LyoPsfi1H5/izGjt26qENa5Ffhy2rpsAf
 kRbqe9ODSQeEpnL+6EleAyr9WmqvD6gXi++mPr+wsYADbd9cXnt4oPEXFO3pqcvfrQ3x
 X6hUV8VWzIz1RB8h0egnBjFrOPNp5ewI4jMMUYtXnxzdx1hqS4quXLMc1USlubqy7332
 HSu19PvLsoWcJkcu6IrFEeYVF9yuwTMSCOnTnl7maeVFD3V58yJZBio0R7w8JP8TRr3Y
 NOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIzZDxt4owy5jO/YbfXWS31RiPx2ETthbOiAb1EV9P4=;
 b=GOBJ+xqBrr+nMDwJS386grYk5rCw8CW6NwUdc3IZgNiQPzsrcsippAU5fIU6XSPRlK
 GnKoPfPQo2KoVPAmF+XyLyG9MD5IdigL0iorxVXtYJ5ZaYQIc3CN0U2fKgCx5A59h6xe
 YvtEXye7lvxkOOrxZPVM66wiGEKUeCiF79034KHiF+gBC8TZEu5iP2O8hjHoeHrcQy64
 EqOOaprq1euxLKDFEyNJOc58SmmoNqnzw6pRspmxhtKudhZ1kwH81e6IJz0e7QL7CImZ
 WaXeKDqK6ofXEICiqHwbUxjxjTjA8jHsbHLZw0UXtvEShngNjponM5QqqhFWMnWSIeUk
 Q5fQ==
X-Gm-Message-State: AGi0PuYpSpRDNEEFs5D0JWA+2mn56HtHV0RA7BUTCYtG+mQgIVM30FTo
 FCKXteHLHBKSrmeR2U/RRR0Qeg==
X-Google-Smtp-Source: APiQypI8YWAgQPWSYcS57KN14S6Q6DPtZWqlj+0qOHI2e6co5FZjn/hZaZ4asuloc3R4ftyLEEuEsA==
X-Received: by 2002:a37:6356:: with SMTP id x83mr3757099qkb.339.1586283984192; 
 Tue, 07 Apr 2020 11:26:24 -0700 (PDT)
Received: from localhost.localdomain (135-23-249-169.cpe.pppoe.ca.
 [135.23.249.169])
 by smtp.gmail.com with ESMTPSA id f1sm16232830qkl.72.2020.04.07.11.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 11:26:21 -0700 (PDT)
From: Aurabindo Pillai <mail@aurabindo.in>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com
Subject: [PATCH] amdgpu_kms: Remove unnecessary condition check
Date: Tue,  7 Apr 2020 14:26:18 -0400
Message-Id: <20200407182618.2488-1-mail@aurabindo.in>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Apr 2020 06:59:23 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Execution will only reach here if the asserted condition is true.
Hence there is no need for the additional check.

Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 60591dbc2..9fedfa531 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -179,12 +179,10 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	/* Call ACPI methods: require modeset init
 	 * but failure is not fatal
 	 */
-	if (!r) {
-		acpi_status = amdgpu_acpi_init(adev);
-		if (acpi_status)
-			dev_dbg(&dev->pdev->dev,
-				"Error during ACPI methods call\n");
-	}
+
+	acpi_status = amdgpu_acpi_init(adev);
+	if (acpi_status)
+		dev_dbg(&dev->pdev->dev, "Error during ACPI methods call\n");
 
 	if (adev->runpm) {
 		dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NEVER_SKIP);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
