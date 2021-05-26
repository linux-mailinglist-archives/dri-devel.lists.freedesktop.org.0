Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3AB3912C2
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2657F6EC2F;
	Wed, 26 May 2021 08:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE84F6E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v12so204996wrq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7zQBHzs8bUaTq312vSS5VlkiBcTZpiBpI37cda1Zuvw=;
 b=UYtZk9Vp8FVe1rY6Ub1SdN2wtVTZoiQfb1OhbnN4uLhKytekELKH71HLthvfaEEBMv
 wBIa/HxlnMC/sO10tzKeNoWt/ywjW06knZiDtCEVvOJXP3GjgFeCGsU+g9bXcJsaQn//
 Vc1DynqHbRBauWzVeIg1c5RZOgmjN9sfZv6lrByDjqxkdtSi169CuIVPeGtXEdLospw6
 SwPcfZgQAz6smSpgvagmsFqAQwuZMUUhNAH4TGMj+Ee1bPlv7RADSi3mlU56zfRspTCD
 s/HwXup2wyf51Vbr455hzBeyzl6GzjAbR3I4/eIyvyWQ9iCzvPPFgN+trC6H456n4pdt
 4UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zQBHzs8bUaTq312vSS5VlkiBcTZpiBpI37cda1Zuvw=;
 b=q8U4ROTr0FgNarw3xyDUWpDjexA0PE9fefViN6icQZLDlIe+jcDTdmtQTYMXm10Qeb
 MIfP/QE6ZuvXIu2Bmt0HchKz9OEfSEh1uFHpuKzv1zuw6Cps7+JvysCuCLA2WmvVqQk4
 VnEaUhEcfYEvpfPIYJeOpTLhe9MjeNlqgcbYeHMcumq1OdfdefyOgKl0/vm6A9FdoDO2
 K7QYVwSnahV1UTyaRD4XOWM9vjncUdcEY3ecgEYkhdiU44lcCVKJkSX7y94rmGX57mJ1
 g/F4MO7uNpudoVat46GmuyxTmOgMnLKAoFnw0jid1/XOFwyNiUu7kPH2fwGWSqP9+peT
 diUg==
X-Gm-Message-State: AOAM531v1XFaUcj0WDg5gmM+jp7Dw13wd/1jM/pr1o/+MSPWbqBkZd8Q
 PFcvzvpoccLGcpX/4PO+ij/leV6wKlnhVw==
X-Google-Smtp-Source: ABdhPJwyM9q2L9wpp27S/zlBOBO4M2Oi04r375BiI90Tc7cDBIN5mL6gA3bcyKIjSdVdtrVg29ksqQ==
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr31627763wrs.333.1622018873564; 
 Wed, 26 May 2021 01:47:53 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:53 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/34] drm/amd/display/dc/core/dc: Convert function headers to
 kernel-doc
Date: Wed, 26 May 2021 09:47:14 +0100
Message-Id: <20210526084726.552052-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3324: warning: Cannot understand  *****************************************************************************
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3344: warning: Cannot understand  *****************************************************************************
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3417: warning: Cannot understand  *****************************************************************************

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 46 ++++++------------------
 1 file changed, 11 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index ef157b83bacd2..34c207f92df98 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3335,18 +3335,10 @@ void dc_hardware_release(struct dc *dc)
 #endif
 
 /**
- *****************************************************************************
- *  Function: dc_enable_dmub_notifications
+ * dc_enable_dmub_notifications - Returns whether dmub notification can be enabled
+ * @dc: dc structure
  *
- *  @brief
- *		Returns whether dmub notification can be enabled
- *
- *  @param
- *		[in] dc: dc structure
- *
- *	@return
- *		True to enable dmub notifications, False otherwise
- *****************************************************************************
+ * Returns: True to enable dmub notifications, False otherwise
  */
 bool dc_enable_dmub_notifications(struct dc *dc)
 {
@@ -3355,21 +3347,13 @@ bool dc_enable_dmub_notifications(struct dc *dc)
 }
 
 /**
- *****************************************************************************
- *  Function: dc_process_dmub_aux_transfer_async
- *
- *  @brief
- *		Submits aux command to dmub via inbox message
- *		Sets port index appropriately for legacy DDC
- *
- *  @param
- *		[in] dc: dc structure
- *		[in] link_index: link index
- *		[in] payload: aux payload
+ * dc_process_dmub_aux_transfer_async - Submits aux command to dmub via inbox message
+ *                                      Sets port index appropriately for legacy DDC
+ * @dc: dc structure
+ * @link_index: link index
+ * @payload: aux payload
  *
- *	@return
- *		True if successful, False if failure
- *****************************************************************************
+ * Returns: True if successful, False if failure
  */
 bool dc_process_dmub_aux_transfer_async(struct dc *dc,
 				uint32_t link_index,
@@ -3428,16 +3412,8 @@ bool dc_process_dmub_aux_transfer_async(struct dc *dc,
 }
 
 /**
- *****************************************************************************
- *  Function: dc_disable_accelerated_mode
- *
- *  @brief
- *		disable accelerated mode
- *
- *  @param
- *		[in] dc: dc structure
- *
- *****************************************************************************
+ * dc_disable_accelerated_mode - disable accelerated mode
+ * @dc: dc structure
  */
 void dc_disable_accelerated_mode(struct dc *dc)
 {
-- 
2.31.1

