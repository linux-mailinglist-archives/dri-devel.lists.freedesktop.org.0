Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA12AB2CC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FAE8967B;
	Mon,  9 Nov 2020 08:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4308957D;
 Mon,  9 Nov 2020 08:41:26 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id j12so8980070iow.0;
 Mon, 09 Nov 2020 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7btXjqBRuinpD7KiP3l3qzjmEFoY9IFXHxyguH0t/3M=;
 b=vE+TwcYjMnjl7AwZgEbE4ExgYLtEzLZ9W1b12PN/XLNI4hdFVJEqSNaLrYq4mSUvL7
 UgKnP1i5dxJ3kDif5t4HQiE0FPwh1LxyLOx5fSx4In0KbMRsn+MZrDNjHTLfwr7dotcO
 xXnXq8aGkjCMBOgz0PlJtjzZr/TwmZNrMcBTYHOy9nZgJH14mNG8Tj6hAaeNd5t40X7U
 BLyC9irvrGwNBIeXDt3+A8yyTUVjQD5lRDXq9wcMPMmIP5IOOQJX/nh3qUy7SoKkfV39
 d83cJyDyCveUE/SmLpStqBViRd5GPJ0FNASEEORHcEgKogLCV5J6Vs0w+9QitwI20Swe
 +x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7btXjqBRuinpD7KiP3l3qzjmEFoY9IFXHxyguH0t/3M=;
 b=iEGU1FFYfCVG3OOrgBpvdcUAUP9linV5JM4S45xr5uFCzt2JXQjPbjSZPPSyJicN5w
 Zf3f1l/8tI2I/QTgjVOuR9SF6GQsKces3H3CvmnWUPs8TWB4xSi5Kw/k5izkJ5UYJ9Q4
 HVG3QrlcvbQzVl12YC6LhtXv9tIlEJbrkQtNKwemWvmSnXuDnfNIo3F6ps+vgmSwhd/R
 +tljCNueBLP6wGI4mAwo3H3NFUDNiztvP0La2+onBp9U/mLMGbuGThu+5jhqnSWreX4T
 /1gsB82TrpzoJheDDooucgOkW4ewSTYAUTDMfKad3GqQFWdUOnKAM2NuZgOxKYwcM+OY
 yC1Q==
X-Gm-Message-State: AOAM532ceOZWzQ6SwAyB5Eu5YuBWv7q7Jqv+wTEwUv2mMJE63QyxstgI
 /LTs7g7ZGYBQryG2Clzs6NA=
X-Google-Smtp-Source: ABdhPJw6hiS0UuWmPf3RDP3SsSRa2LK8tkwaoyxOfK5zCkid0TToP32VMAetRrUoPeVzj38GlOn+CA==
X-Received: by 2002:a5d:9a19:: with SMTP id s25mr4307991iol.94.1604911285982; 
 Mon, 09 Nov 2020 00:41:25 -0800 (PST)
Received: from localhost.localdomain ([156.146.54.75])
 by smtp.gmail.com with ESMTPSA id t15sm5475191ili.64.2020.11.09.00.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 00:41:25 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ray.huang@amd.com, nicholas.kazlauskas@amd.com, jdelvare@suse.de
Subject: [PATCH] drivers: amdgpu: amdgpu_display.c: Fix a spelling doens\'t to
 doesn\'t
Date: Mon,  9 Nov 2020 14:08:24 +0530
Message-Id: <20201109083824.14664-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Nov 2020 08:52:30 +0000
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
Cc: gregkh@linuxfoundation.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/doens't/doesn't/p

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 7cc7af2a6822..a92cb137293a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -512,7 +512,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	 * to avoid hang caused by placement of scanout BO in GTT on certain
 	 * APUs. So force the BO placement to VRAM in case this architecture
 	 * will not allow USWC mappings.
-	 * Also, don't allow GTT domain if the BO doens't have USWC falg set.
+	 * Also, don't allow GTT domain if the BO doesn't have USWC falg set.
 	 */
 	if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
 	    amdgpu_bo_support_uswc(bo_flags) &&
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
