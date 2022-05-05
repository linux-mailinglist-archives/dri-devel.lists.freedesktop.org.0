Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE80151B5CE
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 04:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84B310ED5C;
	Thu,  5 May 2022 02:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3238510ED5C;
 Thu,  5 May 2022 02:22:45 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id i1so3117263plg.7;
 Wed, 04 May 2022 19:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kWQfwEbK95xky/d4HhQ+FlkuBESmRWEkmfG0y0k6Yc=;
 b=E0/AMlIWlX2QfzeIjcII6CLO40b23wuotJIrvhbNd29xWOYF75GL9IxyRjbMEH3naM
 AsANCB3Fy3cr+5nzf3JHIOq+IjfbunSJufgQwTLzJbcW5i4TNAm/jUfGuve/2eOUzskf
 qXW4/DtXMQVPBSUo5zeSWcV+yX7YMsXsG4EhHGrVql08nzJ55l01RXDHJxKNwPzdHGQX
 bebb41ewRaKFw7OVwBKjJJgNLG7ib7GwVPZC3sivigfMwK1dVKPUz4fiEcy+v/U5yArC
 fIt9K9Ov6hZRs+8jNuT6VW9MPd5jf/P+fNfC7AWpBWs6ybvF7ber7gshyXRhW3tSeJ79
 NaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kWQfwEbK95xky/d4HhQ+FlkuBESmRWEkmfG0y0k6Yc=;
 b=nKghclq9mQuDBjdibymMsVYDrs8a6op0zWRKuBLE5rRnijEYfXjw2zoHdnI+e8egG/
 +TZ9MT71lG+qThxPTjjA1DPYJtfV+MBYTSfGYYLGvRp9kOJWRqxCeB0xDS+XQlMQHVp1
 RBr/SgOGANLQeI0Co+5MDYVgKBQq7IPcyHHGkjN1jJTlR56Ey+CvdJPTcLejb8g8Nxdx
 d4v8Kc4NUxqaqkpf/3E2dQm8l0KTFt15Rsp5prJUANmkLnqT1VvyNmlxkuBbFu6QGeNX
 wn2yqn1Ag3rNAn6slF8rur6rGCiePmZFhASkLrAvqoXyUPmq+btkUQ+Xixz+KHUpNn34
 m9Fw==
X-Gm-Message-State: AOAM530smwzlas9joPEhtW1yirs0SXQfQmRMwdovZ46wow9okEU0coC+
 7yX9NkRYBqLJNCCwOAHUIS0=
X-Google-Smtp-Source: ABdhPJw1cWNP932SAnVrBHZI77Y5r2z3v4pkPgX8TpSZkODTuCZDIKhl7JkWU4n/DJecOdGqzDQ5rw==
X-Received: by 2002:a17:90b:380b:b0:1dc:6d24:76ff with SMTP id
 mq11-20020a17090b380b00b001dc6d2476ffmr3271725pjb.42.1651717364762; 
 Wed, 04 May 2022 19:22:44 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a056a00150400b0050dc76281a1sm86482pfu.123.2022.05.04.19.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:22:44 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: simplify the return expression of
 vega10_ih_hw_init()
Date: Thu,  5 May 2022 02:22:39 +0000
Message-Id: <20220505022239.58334-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index 3070466f54e1..cdd599a08125 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -521,14 +521,9 @@ static int vega10_ih_sw_fini(void *handle)
 
 static int vega10_ih_hw_init(void *handle)
 {
-	int r;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	r = vega10_ih_irq_init(adev);
-	if (r)
-		return r;
-
-	return 0;
+	return vega10_ih_irq_init(adev);
 }
 
 static int vega10_ih_hw_fini(void *handle)
-- 
2.25.1


