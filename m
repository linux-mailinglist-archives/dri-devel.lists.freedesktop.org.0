Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784195141F5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 07:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC7410FB6A;
	Fri, 29 Apr 2022 05:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B43910FB6A;
 Fri, 29 Apr 2022 05:50:44 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id b17so4705931qvf.12;
 Thu, 28 Apr 2022 22:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DklJelbXiO9l3sUAo4sjuOfTEZq9ByjiZR6q47LXluQ=;
 b=iiZWLdnO3B5+JPqgd5k43eNW94FFVOxBc/KOlQYyrvA3iQ/OVJ1wi/WgAZQJGt1+YP
 O1F92kb+g5Gfi113i583WuyQW1HbpKtVt0TYnDBetftZ/F7FwLplyQZifP4LmAteL7GS
 JTAqImUsmRlsc/u+3gq/H9ZQUcH4YOVsPgQYldCh9wrEUvqRbbUjyEMWnBOzZc13RCNl
 JaGWkNDpY7Eqd5ksCcaLsmPXPMPJF3U0PM2yYPNG95WnYAA+sqLM8BlL3ctpiiwwy2zA
 TfnOD37kj/eGBpDCFc3fzahf8qhIdgiE48J7EgJQWUKyifA/pYvv7LgOHm7DLpyMOKzH
 dw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DklJelbXiO9l3sUAo4sjuOfTEZq9ByjiZR6q47LXluQ=;
 b=wcJxTbqoL+c1G9cDJgBEe+1Y1CL81VQltb1z2L37DCicesKVEvZ37qjE53K2UPwz15
 N+WjbMSW+50jLCYUDUNFlBJeX3fYd2d1xSXGH7XbIZ1bKgA9kdieDvD8z9du2D3zqQCk
 KjOuKgnk+zpgvNqThjybkcwdM7lG9Gw6JSa/buFV11NFMiL4gOt2UO6ZeZLnAT3c0/s3
 v82c1Y7fsC3hgf8vEIMlEqktkvRYkCpQAiuTcwNngSfBfH+BAVS09OMeBtqVtrNZC3+n
 JrxQWfMP66tuy9nKiqg4DHdMsx4RkN/1IoHoUZvA9f71mNMpcYLOimfRrSr0rOOd22jq
 MQEQ==
X-Gm-Message-State: AOAM531PO4o4zRSYdeVar5l8trOaqkngNA+QrB6OR+pdnTUBQ8iNAVJP
 T4VsXMXrkKV0h2qUPy9cInI=
X-Google-Smtp-Source: ABdhPJzCXI2X6OuPnMzQGH6YeEQlUvgt8yFPZags9OQcY0fuj65LaZ0UZaeHOysnyZ+d3Z4GR0KEJA==
X-Received: by 2002:a05:6214:2025:b0:456:3a96:f443 with SMTP id
 5-20020a056214202500b004563a96f443mr16579441qvf.86.1651211443556; 
 Thu, 28 Apr 2022 22:50:43 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 bi17-20020a05620a319100b0069fb4fc24d3sm876486qkb.114.2022.04.28.22.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 22:50:43 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: simplify the return expression of
 navi10_ih_hw_init()
Date: Fri, 29 Apr 2022 05:50:37 +0000
Message-Id: <20220429055037.3852147-1-chi.minghao@zte.com.cn>
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 97201ab0965e..4b5396d3e60f 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -593,14 +593,9 @@ static int navi10_ih_sw_fini(void *handle)
 
 static int navi10_ih_hw_init(void *handle)
 {
-	int r;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	r = navi10_ih_irq_init(adev);
-	if (r)
-		return r;
-
-	return 0;
+	return navi10_ih_irq_init(adev);
 }
 
 static int navi10_ih_hw_fini(void *handle)
-- 
2.25.1


