Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF791A3013
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11F06EB5C;
	Thu,  9 Apr 2020 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6830A6EB2E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 01:28:21 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id s18so4781860qvn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 18:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a8mBf/x6tKmxXEyAN6VSKYHc9JSU+mIaA50Z6TnFau4=;
 b=NlMqSZt8QFI8sd/DDnRRiuydXjaYLzxItlei1QSWHbiyShTaKKSGURBOkhrkk91CxW
 /X+Qgb5kT/Tps0tzjntpYhBtxqSIyEiUAJrD28KSW+Ak6UERz5KiIAuFmidnFOXF3saq
 y5hxwSo82HWB2DKzD+N3OLxUlzmHRmC7x9lEqr/VOOaWRmBSLLr5JZ1o1m2bcGFp2N8K
 CMMceFTqTpBOdT8lUa6F6lNm7O38kfcGVYWCp2tJIxAZHD7mDG/r8vp2SL6SxRNJ0j6b
 ewLTd/FthX6hcv+JmkjXbKfzvZNfibmvWUqRC0qmB1IZrqJkjbZSCFgDsIDSquzFIxOR
 J1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a8mBf/x6tKmxXEyAN6VSKYHc9JSU+mIaA50Z6TnFau4=;
 b=c++X9gVSpuSKZ/55eo6vdD96bjZDk2gad8c+XbLyB4NFmnVYRxPWcZvw3jXngrBDk+
 A81FTenL8dmWSlkcYtbOPnzQr27YAVJKEMXSctmt5EsECuAycopOp4Gv8vpeF57FdHk5
 /Y37sD7EJwc9f+ZiJHjk4Bx6aanXA8kCpkVaqLqTkXq6IeVOh3bbmZtOihHntScDH3Ux
 O1oqc1UWewvEZlD1141z0xVXm/Jn6ueFp1n/URQaZv/ew5IGnYd6Yicm2zPPmdE5dYuY
 rMozJg0eFGR5WQtjKJS8qy068mzhNViJhsTzDG8fJBzYGz110AAcyFVnB/rLfQwuru/6
 tYqQ==
X-Gm-Message-State: AGi0PuYSldW03+zc0ky6p5gcGXTvBCJ7NiLHyvaA0FYNNdET1wxVpPh2
 GZVVu76vjFjFERNdPwxsOHyBww==
X-Google-Smtp-Source: APiQypLHyltpW2woM041SGTay/GRNOYCz+x3AjvXnaurPcRm5EFzWLaZMasX8iJ0rPqFFM0GH+KX3Q==
X-Received: by 2002:a0c:bd99:: with SMTP id n25mr10491345qvg.149.1586395700553; 
 Wed, 08 Apr 2020 18:28:20 -0700 (PDT)
Received: from localhost.localdomain (135-23-249-169.cpe.pppoe.ca.
 [135.23.249.169])
 by smtp.gmail.com with ESMTPSA id h13sm11710186qkj.21.2020.04.08.18.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 18:28:20 -0700 (PDT)
From: Aurabindo Pillai <mail@aurabindo.in>
To: christian.koenig@amd.com, alexander.deucher@amd.com, David1.Zhou@amd.com
Subject: [PATCH v2 1/3] drm/amd/amdgpu: add prefix for pr_* prints
Date: Wed,  8 Apr 2020 21:28:13 -0400
Message-Id: <20200409012815.22309-2-mail@aurabindo.in>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200409012815.22309-1-mail@aurabindo.in>
References: <20200409012815.22309-1-mail@aurabindo.in>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu uses lots of pr_* calls for printing error messages.
With this prefix, errors shall be more obvious to the end
use regarding its origin, and may help debugging.

Prefix format:

[xxx.xxxxx] amdgpu: ...

Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index da3bcff61..67d654a89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -28,6 +28,12 @@
 #ifndef __AMDGPU_H__
 #define __AMDGPU_H__
 
+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+
+#define pr_fmt(fmt) "amdgpu: " fmt
+
 #include "amdgpu_ctx.h"
 
 #include <linux/atomic.h>
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
