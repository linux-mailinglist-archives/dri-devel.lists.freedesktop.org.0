Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40E3912D7
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FFB6EC49;
	Wed, 26 May 2021 08:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8F96EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso2907820wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRtghyBemkM1f6IZ3GpJkWOqFfzHliaTl7AQXunGZzc=;
 b=Y24P+kDZguBC+oVfwlOZFjooki7OrpJfb708/HImocxi6jC/uZws/ZGaZeCPgRGhsP
 6rH5ZxL4BMZNfhpJiJ4g9XZYsk6YsowF9AlC7gvmBOEjVd1FoWoo67zki9tmuOORdyc4
 SGdDw0BRw6nQ1CtrpdaCr0X3IS2WzJZs0HZ6AwQi1zhcuxR+rwOzbH2sbIuq5ZORCIeP
 yq97uTNUjojtB0lP0QMQsNZRkVT9jOrCJu+Doa5X69vt5c6nB+i0o/f+KRMc+AV5jE1Q
 rkYALgXhiGAs5SFxc/CIMVtGA+ypcoa6H5FoJ/9EGVWi9SpMhDkZxDwhgUoc2YLpQnab
 LzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRtghyBemkM1f6IZ3GpJkWOqFfzHliaTl7AQXunGZzc=;
 b=mom3W9hQq8Fczq330O713Bse+65B1ztDO5YNOAoGFP9HB65bBgfpp4bS1D1+vG77BJ
 xSDV5YjnamDOGc2o8jBDeVN3oOTr7pJWdDdUaTieclIlpUyPoAAhmfdcZH8QiKZM1Ryh
 7wJEJfjVQ+HHS88rthghOWH0+jbCMh7jyIsAS2BIY11OCNuFDpAidnfvbbpPNbQnP5XL
 diXgEAmb8OemleCDiTKmVQOBk/gzdd1pAT9HYgpm++FZc2bN0dh3F5k3f9Nq2KwitJ+R
 DPyUdeeK7wNASOmhmhMFMitY990F4NilvDiXLJ5OKWmzSBIfWYTjQXFeUNHzA7iVIJ7t
 ogdA==
X-Gm-Message-State: AOAM530AiOcTLNYTAHXn/GStX7T97xPooEvqA/CHr+IM0gjpcxbEVSIu
 QOk0pDU5AkIao/VN8EeZNxHfTQ==
X-Google-Smtp-Source: ABdhPJx9vfcxXeT3oxlu5PcMyEPJqgiMaOfRGR7HD4cfqeoJ6OCvXxTjHoGViev/C4hAPtm4WP+X6g==
X-Received: by 2002:a1c:2cc3:: with SMTP id s186mr2365738wms.150.1622018858606; 
 Wed, 26 May 2021 01:47:38 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:38 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/34] drm/amd/display/dc/bios/command_table_helper: Fix
 function name for 'dal_cmd_table_helper_transmitter_bp_to_atom()'
Date: Wed, 26 May 2021 09:47:00 +0100
Message-Id: <20210526084726.552052-9-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper.c:127: warning: expecting prototype for translate_transmitter_bp_to_atom(). Prototype was for dal_cmd_table_helper_transmitter_bp_to_atom() instead

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c
index 5b77251e05909..e317a36151477 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c
@@ -114,7 +114,7 @@ bool dal_cmd_table_helper_controller_id_to_atom(
 }
 
 /**
- * translate_transmitter_bp_to_atom - Translate the Transmitter to the
+ * dal_cmd_table_helper_transmitter_bp_to_atom - Translate the Transmitter to the
  *                                    corresponding ATOM BIOS value
  * @t: transmitter
  * returns: output digitalTransmitter
-- 
2.31.1

