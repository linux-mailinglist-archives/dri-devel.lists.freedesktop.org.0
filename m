Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75B4EC2EE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE61210EB1A;
	Wed, 30 Mar 2022 12:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BBB10EB1A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:03:36 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id p17so20261005plo.9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=48w9cCcHfu4RFzRm5PZAyw72DdxLC63ffgBHswIn+j4=;
 b=e2oys9YHS1G4ibMgjW99OE3iDzMIYL6l9CnklayAdF2/xl9anpeDhLfh2+ycju7pkk
 jVM8SwJI7cy6FAd+qP9m9lafilhptX+dnPyU/ogkIn2Q+w2gPG+PM96hKg+sDnGLgYHS
 Mh9UTHx7rAA4iTqN0e6oweEDLKGUJ/IsGLmkxDHTid4PHkzEGi/JNsV7282VfYeWex1Q
 KcaAlOY/6cD1PVyEXlXiSTqh7No95xKZuDfxGaP2Xl7IkShsybZwVKftzdBqrRjzwt9U
 /hD2+lGydFDG7xj1RAV5R1VQahPryrV4INhY8Ps9tS/2P6o9rtSl0P7xJ79plT1OjGxj
 m8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=48w9cCcHfu4RFzRm5PZAyw72DdxLC63ffgBHswIn+j4=;
 b=1YCYgMkJvVOWc7bKF16Eh3niEPqnKu/gasv09Crm60VX/nW4I1UC8jBYonoesIk50Y
 OZwlG9Z8ZkcDwb0KU6nNHWjq+8gLxfNHPk8jWmZNgPL6anFmvQdgD0aTQqN6Rw9b0lHP
 WqU3Ju0UvBlPPMcAlfUTuIn5cLlJcKowQCCKC4aHZ9QR/c/u/YQfG9w7XfJi9cLGnlbO
 Oxy9cjwqupVRWnFvASUro9/nWkEz0F2dwtbnvPMRxGlp6ScexnMPkQFUiB8YFmRRzOsS
 Pa7VLaXFJilF8ftwKqgOpVXRpaYZ1+J0WjYkTI3A2WQbGA9f6AOyDpPpeSEVYxlCkYXI
 tUpA==
X-Gm-Message-State: AOAM53044ymPA+Sm95mD1LcOSSKYwJEISyfuRHs9SYe/NAL7caYafyfe
 NjaIxQUkUFJqaEnrtVsu2tc=
X-Google-Smtp-Source: ABdhPJwbqJd5wNulvaZLttMt50ldtMVPaMlLpVaNrun46JlZVZd5PnTlSq49PePx/8vUsZI1mYU89A==
X-Received: by 2002:a17:90b:1c07:b0:1c7:5324:c68e with SMTP id
 oc7-20020a17090b1c0700b001c75324c68emr4691633pjb.202.1648641815737; 
 Wed, 30 Mar 2022 05:03:35 -0700 (PDT)
Received: from localhost ([119.3.119.18]) by smtp.gmail.com with ESMTPSA id
 m18-20020a056a00081200b004faeae3a291sm22940884pfk.26.2022.03.30.05.03.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Mar 2022 05:03:35 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 5/5] gma500: fix a missing break in psb_driver_load
Date: Wed, 30 Mar 2022 20:02:46 +0800
Message-Id: <20220330120246.25580-6-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
References: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yakui.zhao@intel.com, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 airlied@redhat.com, rob@ti.com, alan@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of exiting the loop as expected when an entry is found, the
list_for_each_entry() continues until the traversal is complete. To
avoid potential executing 'ret = gma_backlight_init(dev);' repeatly,
add a break after the switch statement.

Fixes: 5c49fd3aa0ab0 ("gma500: Add the core DRM files and headers")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 65cf1c79dd7c..d65a68811bf7 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -398,6 +398,8 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 			ret = gma_backlight_init(dev);
 			break;
 		}
+
+		break;
 	}
 
 	if (ret)
-- 
2.17.1

