Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30A3912C1
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47A86E4C5;
	Wed, 26 May 2021 08:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1F36EC3C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so54575wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X92MMk5kMi/9Whx04jPkFETzN+cajEcLCrynmOFE/4E=;
 b=h9EonsBwz/L4qhRXfcmGTgEQaj4rDXaTaENbNk0xlbWhzOzw3iokduWpAr1XGqvUYN
 mCQkU7iW5Ma/zft9eiE3GgFXXMsv0TDecBvlMSmwZWwY7ZGw4yQ73VZqRG+4OGWcHcsw
 AZH1HqlOL6gyIIGI5k42oq5XLy2rYWrZmQkya+Anjm0IScxY7bMXLGi+fvFVR0BAATM5
 14SQjCaAeDmemdH/qHWXKgE/GLkh/lKQILaBoIVP1pkFXhTxLckAaIcg+AcEPnrEv4re
 WgukuG4TDE9/Uz7FvNnqB9w/Mk6LFDWBrDCr+Lz0T2ooic53RQuR70abTxVsWAVfvGkc
 CBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X92MMk5kMi/9Whx04jPkFETzN+cajEcLCrynmOFE/4E=;
 b=ls2V4ZPLOT/0J/uAigrtlJr/Z9zUTGt8dsXGkg3qz4nEQvodB6KQ6ibbzh02+Q0q5l
 fNilAu4K6oElrZX03xdkhtxHhlXWxvxbFHk/JflClsZbU4JdmO910PLYdsSjQn/97qjr
 rcOl4KN3jdvhQFpPIhWW7thHet6KJc8JLUmhLxTuLkol8xxlM4RABAqdenEvj1MrzB6T
 o9moC6984xDytj0eDD1B0tlUdQ8YJOotuDfm4oWqMY6tSPzYGH12tH7HzOMUafmqiyZH
 vvl1cu0jFfgYcc+mOsT/6vv3Z7sUzXqeTlh+UJ3isPMkA6h/l2BHDsLd2gLWuyrErEME
 lDeQ==
X-Gm-Message-State: AOAM530YqplQJX+D9KWjyodOecUpEJoa7JxqPcfq2mh3w23YTEvmNF9U
 6LmlzDhMqWK/lplU8j62+/2P0A==
X-Google-Smtp-Source: ABdhPJyx1uFISeXmdtKQQhnTK23vTXiJRYW6DYcboA9WMr5VX5C3wH+hrPWw8ug/Shp608nkyZ0i8A==
X-Received: by 2002:a1c:e284:: with SMTP id z126mr1717471wmg.108.1622018862620; 
 Wed, 26 May 2021 01:47:42 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:42 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/34] drm/amd/display/amdgpu_dm/amdgpu_dm: Functions must
 directly follow their headers
Date: Wed, 26 May 2021 09:47:04 +0100
Message-Id: <20210526084726.552052-13-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:608: warning: Function parameter or member 'interrupt_params' not described in 'dm_dcn_vertical_interrupt0_high_irq'

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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b4e95d3ff3b88..ae0a95c5f1d8c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -601,6 +601,7 @@ static void dm_crtc_high_irq(void *interrupt_params)
 }
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
+#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 /**
  * dm_dcn_vertical_interrupt0_high_irq() - Handles OTG Vertical interrupt0 for
  * DCN generation ASICs
@@ -608,7 +609,6 @@ static void dm_crtc_high_irq(void *interrupt_params)
  *
  * Used to set crc window/read out crc value at vertical line 0 position
  */
-#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 static void dm_dcn_vertical_interrupt0_high_irq(void *interrupt_params)
 {
 	struct common_irq_params *irq_params = interrupt_params;
-- 
2.31.1

