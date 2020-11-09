Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDC22AD122
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F88899E6;
	Tue, 10 Nov 2020 08:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2370D892E5;
 Mon,  9 Nov 2020 21:09:57 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h12so7078468qtc.9;
 Mon, 09 Nov 2020 13:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0XocD5P4X8PutfEBTr0iQ6o7VPBilDjyKi4NGpWaVc=;
 b=NGhqvmdqdeTsnOAPi1e5Vd1qdGimaQPD+OZZ7kiZ5p5sQGqAxeqoBFwYejrxi1j2WP
 f9gXR9FS5Ko+gq0afQJcfyyerPqO9NQuLqIRyJOPGK/al3votarLB9dVrDkf9rfE6pzB
 nSbwZOgoA4nrUiQpTZI6dh8NaHw9y19ug1V0x6EfqKJzIL4JaJ78FpaO1ljI8BCKNJQC
 qL5peFy7bg0NzjWgIYZkSmWO0tcV4Nu6HgVInMnWr97rfXw71KU6qw6ADW3PZ+6a/aer
 o4rX/XGWDDvd64WvJZto4lQdfbtjGV7/9r8jXQvDI79wWemK2m9AUTtm8RZQHj9grU8W
 IGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0XocD5P4X8PutfEBTr0iQ6o7VPBilDjyKi4NGpWaVc=;
 b=K/RYwDmkqPxJMlascKp8gX+nRPrrKSxW3CAh7VRlNVsS80/ELRV2XS01kqvuUutqgl
 l4V6vIizppLyRsvtgTZaR7vXbzOXVqKjy+/ceKhxWan3iukRTq90RW4vWCTiqA+YUGEl
 S0ys1m5mpp6WfnJVF57nr4bl79tpyB9U9dIoXDz09xgPH1sOS4vT9y7Pg3E88DyGXy41
 XXKhFKhs4tEUIo/Ktcd5H33SJupRRg4ZhNmkv0dRxmPbovJ+wK6kGyLRapnFKwtrsEL8
 fj/UMjHi4yxSkX90A9BkbAYPE2ag4OGSFRuID8CjX7hGKlSgYMv1w6LS3WrZR9auSYF+
 885A==
X-Gm-Message-State: AOAM533GNUOsOhGVF44Y1SBYazaagQpMHsZczvyV5MF1KsIutbJF0Ay1
 GR5HmlHDUdj6Aol22MHiNW0=
X-Google-Smtp-Source: ABdhPJweV+Szh+PkEAYXoXyjTozPf81Tox2F7Dj/v1OFpc1GcHYkrXzj/rpBR38tMgQhU19OWI65SQ==
X-Received: by 2002:ac8:5649:: with SMTP id 9mr14720827qtt.379.1604956196346; 
 Mon, 09 Nov 2020 13:09:56 -0800 (PST)
Received: from localhost.localdomain ([156.146.36.180])
 by smtp.gmail.com with ESMTPSA id o21sm7161000qko.9.2020.11.09.13.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:09:55 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, jdelvare@suse.de, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drivers: amdgpu: amdgpu_display: Fixed the spelling of falg
 to flag
Date: Tue, 10 Nov 2020 02:37:25 +0530
Message-Id: <20201109210725.24668-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/falg/flag/p

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 2e8a8b57639f..9223502c1e5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -509,7 +509,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	 * to avoid hang caused by placement of scanout BO in GTT on certain
 	 * APUs. So force the BO placement to VRAM in case this architecture
 	 * will not allow USWC mappings.
-	 * Also, don't allow GTT domain if the BO doens't have USWC falg set.
+	 * Also, don't allow GTT domain if the BO doens't have USWC flag set.
 	 */
 	if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
 	    amdgpu_bo_support_uswc(bo_flags) &&
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
