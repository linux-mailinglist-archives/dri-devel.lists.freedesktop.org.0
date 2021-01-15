Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2AB2F8383
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9006E4AE;
	Fri, 15 Jan 2021 18:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D3C6E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id k10so8213448wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eAMyYaaj1VFxGbNOafp+nzJ0Q2eH0I8k2Xo9CJpOSL4=;
 b=yVjWmOGvJzeDni3tCIMOzMmMGeotfx0zrqnDbf4Clmyd04/rjS+q0vmqap5y7zg4Io
 7h1D4HYxOw/emRxXYKSS0UPCw+YELiJjQhMGu6Fy0Uj+H1b1v6SEx18+huC92+skY/oE
 ysSeaM6p0n4eY95XH9EEsl1HIJT0gd5ayHE8di3BTOfP4imM+Ivsp8UyOqj7f4SECp8T
 naf24hYPEYQWtTPW3tTd4cbe0Y1G8nanx71tnqR/WsoDLa2c2NVoI7n/nf+Yv+wa5XPc
 CImYGw6BvnacySDNght925HnYU893MxmOQbdVzZhvA0BUaQXeAuUjkStV7Rn3CMAm7HK
 t/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eAMyYaaj1VFxGbNOafp+nzJ0Q2eH0I8k2Xo9CJpOSL4=;
 b=OPq9rZk5QLhsNGb7ZK8viIYU0ysjaMUD7gX9o/BfmolBm5APKb/LS60822m9d8xtmG
 /VDE3ySoGAfyvkuJjVam8W8pDFHChhhE+/z86yxIpIc9rgAksDmErHvFDAOVY+RbbaHm
 loO7isD/9fM7vWxTqDR7L45AEndJeZ2jCq9ZQ8o6+qcJK0MNXXhOeeABHyeh9BzHE7U8
 oRZ4DGScXc5q5heXPoZvwX4+MZIjf2hVA8PKyXC3mr+2qHWwESRT+PBTQajee78dqA1I
 2iJ0CLACeTUiOaiD+1uf+8oQ7BXpL+pe+g6VAnashVVnFkqieMwAXyNhLRVp1bhgA6zh
 yd/Q==
X-Gm-Message-State: AOAM530pIDNUHBqzacKRwZZwW40ts6gItnvz3K+NwQCHh37yepRJK/VJ
 o3+3LB0txCbXZqKPOZJnSJn7cg==
X-Google-Smtp-Source: ABdhPJwe9r4nkJlVMT4urFaM/FAN0HUOKO2Kd3dORP++jhEf8U1Dg6bSWhgp5TG+hNJ3w3cTCkA9Rw==
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr10104491wmj.165.1610734439880; 
 Fri, 15 Jan 2021 10:13:59 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:59 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/40] drm/vmwgfx/vmwgfx_context: Demote kernel-doc abuses
Date: Fri, 15 Jan 2021 18:13:01 +0000
Message-Id: <20210115181313.3431493-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_context.c:121: warning: Function parameter or member 'dev_priv' not described in 'vmw_context_cotables_unref'
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c:121: warning: Function parameter or member 'uctx' not described in 'vmw_context_cotables_unref'
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c:681: warning: Function parameter or member 'base' not described in 'vmw_user_context_base_to_res'
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c:707: warning: Function parameter or member 'p_base' not described in 'vmw_user_context_base_release'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
index 6f4d0da11ad87..4a5a3e246216d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
@@ -112,7 +112,7 @@ static const struct vmw_res_func vmw_dx_context_func = {
 	.unbind = vmw_dx_context_unbind
 };
 
-/**
+/*
  * Context management:
  */
 
@@ -672,7 +672,7 @@ static int vmw_dx_context_destroy(struct vmw_resource *res)
 	return 0;
 }
 
-/**
+/*
  * User-space context management:
  */
 
@@ -698,7 +698,7 @@ static void vmw_user_context_free(struct vmw_resource *res)
 			    vmw_user_context_size);
 }
 
-/**
+/*
  * This function is called when user space has no more references on the
  * base object. It releases the base-object's reference on the resource object.
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
