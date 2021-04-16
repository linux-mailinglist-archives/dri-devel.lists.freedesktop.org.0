Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E7636228B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1230E6EC1D;
	Fri, 16 Apr 2021 14:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23826EC16
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:52 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id o20so6273147edc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IX4rCKyup2XWGiFmahgmd3kG2O7V506Gam6HuYK+7Ps=;
 b=Ej54r6tzDzb/jAEk8DsTG8FFLNowawyS9Y7KPJNk+nCUiVVYTGPU7BiYh4lB0dLMzI
 as/LgDvmvn6I2NSa0qxFHmmAv/mHrT4y6wEolmkD0awh0pvd7lHlRP19iYwn6ueUWr4S
 Avt2tPLCOco9zFsEBStg2yVR+AKjmrgakl+NTTFRS1UnFcbqXCy7ZpydB3sqeZcVjyvz
 RdSuYPlFokrT7ILCeqj/Uba9bpv0kf4WIzaV1pZzodkG17B9Uq4TLMhZK6Mbb3H1jWZ2
 42DPLS0BCeNeQS75QB7d2LQClfE6f6OotuIBv+gfH/PvR+T1nbHOJpUNeiOREaHaTGwi
 489A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IX4rCKyup2XWGiFmahgmd3kG2O7V506Gam6HuYK+7Ps=;
 b=DcCGAGeZ8lRUtvTppEjJ1GQnxRWxWD91vVKz2E0h+4sa5/MYTgeTMcqu5fl+n8jT+J
 6i6+uH2GUZFA8Nx4IaiNeOdYXCW9ukrxMO1ENIUlRJUusQaRAPFzwKMoNgiyEo8JTmBs
 tuNVNNu+AfUxM3MxzPox80bvS4fbgrsDm4lH4fbKpTcNl0FjT1qKRgxkx54Jbk+3Tbie
 rZjefK/EvfK9sewbuoVuMq4fmB4SMNr74uG7TOugOnfWpTuCuXN1Z+1AjDBa5e1TYsVb
 ueA3Gs7XeyRglFEsZTfO7Lf102Kikd0/k2y6EfZVQMU+27HXm9OI8Z+pC+klDTQ8Liuk
 sOYw==
X-Gm-Message-State: AOAM531iPwJm6Ea327ya2TexwkzTm3JXT8QgWw/ReDwfExCR8bXxJQiG
 p7whCexFz4Vrb5y4gtN+ZlswWg==
X-Google-Smtp-Source: ABdhPJy7CdQ4BO7iaHpoPT5kdx+e1sdde7/38ZyJKVpfl3PJHUlcomOr6acsG57c9PQb4MgSMRXtIQ==
X-Received: by 2002:aa7:c518:: with SMTP id o24mr10374073edq.64.1618583871263; 
 Fri, 16 Apr 2021 07:37:51 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/40] drm/xlnx/zynqmp_disp: Fix incorrectly documented enum
 'zynqmp_disp_id'
Date: Fri, 16 Apr 2021 15:37:05 +0100
Message-Id: <20210416143725.2769053-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/xlnx/zynqmp_disp.c:101: warning: expecting prototype for enum zynqmp_disp_id. Prototype was for enum zynqmp_disp_layer_id instead

Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 109d627968ac0..ca1161ec9e16f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -91,7 +91,7 @@ struct zynqmp_disp_format {
 };
 
 /**
- * enum zynqmp_disp_id - Layer identifier
+ * enum zynqmp_disp_layer_id - Layer identifier
  * @ZYNQMP_DISP_LAYER_VID: Video layer
  * @ZYNQMP_DISP_LAYER_GFX: Graphics layer
  */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
