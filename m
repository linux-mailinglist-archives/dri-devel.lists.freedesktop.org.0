Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ED52C041D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9770A89EB1;
	Mon, 23 Nov 2020 11:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C3D89A9A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r17so18255277wrw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCZKU3j8clNV9/z+mSJexBSfvTb0PXc+UA+5nG1PO4U=;
 b=Oj2jCVRp8mxrSBXicPTrJ6Cjb3r3OcnFBR/iK8m1Di+xA+yQCWzhNblwi55dAJuP5k
 NwGqq/oSo6tOSdhXKl22884gM+qdojICcXDS6fKp1X6Yf1kRGTAVCR6jtXM6SSNhCbEu
 bOzqEuOL1BtF0ukiS0k6kT/r8jALx6ZhPbMbRUxxG0x1MV3fBOWRaKXKYUQiKNpMAJde
 1bl0ThxjbqxbOo0fhFzBXfz+wfM62m+CyojimphzRX27w3UcEJBUjfizhXvPHp/wxgew
 QS33fM+XutaxzEwsZEvpaDqKMNWEQ/YO8rF6CcEWoqBWkNq7hjl6hCND+wHeFX+fXHeZ
 V/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gCZKU3j8clNV9/z+mSJexBSfvTb0PXc+UA+5nG1PO4U=;
 b=bEHFegwnB2H/Pg+h4YZ9R4lemwrRQQXWE6VfZ23BArlG3zwlO4Y4ysOJLzqPjDYNkU
 s6NK7ylBpU/3m484VY3hX96JT82VKHQDPZ8pU+CeOhpjT+ME8esB0dUf+gOtOGy8Vl9e
 EIZxJylKVNUvyK0c7dF5Kskyk8uiygHGqzFHZDRya218sju+mn+OaVOsIRUoeHliseDn
 JDaUSIBeGZfRKH7Ka/cCAKh9plMgttvhvWMAHoO6Jxiuo7PYb5fJG4anfsUGakgzXKzd
 xsLGRM1d3UsXnZLR3Com8fv83N4iGRSfWbKRcUT+LwzR2fSKyON9lbO3+JF7TW/uWPW4
 iuOg==
X-Gm-Message-State: AOAM533ZHXOo3Yx8Y9sdIV7dq4ykNBUf8AB8Odvy8Y6emlDsJIpYc3Vn
 UiQOWfytLoUJC41sSq/Z60zUsQ==
X-Google-Smtp-Source: ABdhPJxK2djg0cErC0kW+yAJbREEdI98d1J1Lyc4tpab95gJ+j8Oxsfni5KxA196urUkBeY9GRoXig==
X-Received: by 2002:adf:9d49:: with SMTP id o9mr30390561wre.413.1606130378268; 
 Mon, 23 Nov 2020 03:19:38 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/40] drm/msm/disp/dpu1/dpu_formats: Demote non-conformant
 kernel-doc header
Date: Mon, 23 Nov 2020 11:18:51 +0000
Message-Id: <20201123111919.233376-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, Fritz Koenig <frkoenig@google.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'fmt' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'a' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'r' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'g' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'b' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'e0' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'e1' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'e2' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'e3' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'uc' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'alpha' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'bp' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'flg' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'fm' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'np' not described in 'INTERLEAVED_RGB_FMT'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Fritz Koenig <frkoenig@google.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index a05282dede91b..21ff8f9e5dfd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -22,7 +22,7 @@
 #define DPU_MAX_IMG_WIDTH		0x3FFF
 #define DPU_MAX_IMG_HEIGHT		0x3FFF
 
-/**
+/*
  * DPU supported format packing, bpp, and other format
  * information.
  * DPU currently only supports interleaved RGB formats
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
