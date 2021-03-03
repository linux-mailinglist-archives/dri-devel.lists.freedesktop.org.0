Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2549232B841
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143976E958;
	Wed,  3 Mar 2021 13:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E4B6E975
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u14so23750326wri.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N+MStikPfDla/YrgFsim+wcVpR21mbPxef0tFFhFog8=;
 b=ZxPSjAYBeY6Ew+0mFhPGBPYY8Lyk40dtOffmYtbori5yFJdKNqaMJMJ4bPkHDjQOR2
 SiGlbR9HHyRVwl++Vt8ramhkvCPBZ4SM3jZl9MH6WQV+SQrw/OsXzrJh90N8kfG6oSc0
 GtxuD7iALslsZBmuYINQ3CWxJ5jklICLZS8AdjWjmA95LTw3SAi8MxssOdHSPDoGwmv3
 Q9CLG05cLv7lPoTsXOcobB03h3+yJ1Em7U7yN3iUbcWXb8JrDgPD/KbWF4u6HSfeDBqO
 hLuu+f7Db0t497c+BSz1rm4+dglWkMOMoJh/lt8OQqxBgiYpj3VTmnv7eUuTE1NBuS/U
 Q2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N+MStikPfDla/YrgFsim+wcVpR21mbPxef0tFFhFog8=;
 b=NRjusFboJpwzQO4wsW+nrj65XO0Dyj/Ij3aZ9ntj9EjlOTIOZ5XO+huU6JAQHH1cZz
 jqel3C8Htf7SatIurRKzD4yKifaTCUO3bEHr4LUac+f2Nw8AU5GnxElaiauYNvBmkNED
 kuxNGjxU54kJ+0uP2xwVJXGIofKUeBPXkCevMrMPNYbrslMVoTvJFTGXOeQOfdaCvBto
 HwyvnGo2CSVP07MhxZ3Tyve++kOarP+2NuJWHhf8McyTUJyaeCt9LYj25zQWwS61l2FX
 LazVbIkQjtzEWJuRMsBKuNzBfk6LbVTN+mUKurYaHOFygGAfNtiqQwNF652Z7Mvwl5mV
 gF2g==
X-Gm-Message-State: AOAM530XcNVY4L1djsVox+TTamCmpX2c/1SsG8kMoZrNKC2DY1q252nK
 TlkzSR0+1Q8UwHd904XJ+LBU9w==
X-Google-Smtp-Source: ABdhPJzLqIembOWI8dg3akIVz8pRPBnUzgJo227nUhNe6H9k+zht4gvQ/bdOAbNzhRgyqzED/CRomQ==
X-Received: by 2002:adf:f2c3:: with SMTP id d3mr27872270wrp.380.1614779055888; 
 Wed, 03 Mar 2021 05:44:15 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/53] drm/vmwgfx/vmwgfx_shader: Demote kernel-doc abuses and
 fix-up worthy headers
Date: Wed,  3 Mar 2021 13:43:06 +0000
Message-Id: <20210303134319.3160762-41-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c:134: warning: Function parameter or member 'res' not described in 'vmw_res_to_shader'
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c:663: warning: Function parameter or member 'base' not described in 'vmw_user_shader_base_to_res'
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c:695: warning: Function parameter or member 'p_base' not described in 'vmw_user_shader_base_release'
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c:965: warning: Function parameter or member 'dev_priv' not described in 'vmw_compat_shader_add'
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c:965: warning: Function parameter or member 'size' not described in 'vmw_compat_shader_add'
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c:965: warning: Excess function parameter 'tfile' description in 'vmw_compat_shader_add'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-37-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index 905ae50aaa2ae..a0db065640131 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -125,7 +125,7 @@ static const struct vmw_res_func vmw_dx_shader_func = {
 	.commit_notify = vmw_dx_shader_commit_notify,
 };
 
-/**
+/*
  * Shader management:
  */
 
@@ -654,7 +654,7 @@ int vmw_dx_shader_add(struct vmw_cmdbuf_res_manager *man,
 
 
 
-/**
+/*
  * User-space shader management:
  */
 
@@ -686,7 +686,7 @@ static void vmw_shader_free(struct vmw_resource *res)
 			    vmw_shader_size);
 }
 
-/**
+/*
  * This function is called when user space has no more references on the
  * base object. It releases the base-object's reference on the resource object.
  */
@@ -945,13 +945,13 @@ int vmw_shader_remove(struct vmw_cmdbuf_res_manager *man,
  * vmw_compat_shader_add - Create a compat shader and stage it for addition
  * as a command buffer managed resource.
  *
+ * @dev_priv: Pointer to device private structure.
  * @man: Pointer to the compat shader manager identifying the shader namespace.
  * @user_key: The key that is used to identify the shader. The key is
  * unique to the shader type.
  * @bytecode: Pointer to the bytecode of the shader.
  * @shader_type: Shader type.
- * @tfile: Pointer to a struct ttm_object_file that the guest-backed shader is
- * to be created with.
+ * @size: Command size.
  * @list: Caller's list of staged command buffer resource actions.
  *
  */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
