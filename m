Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486F46CE7D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 08:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A646EC0A;
	Wed,  8 Dec 2021 07:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B3E6EC09;
 Wed,  8 Dec 2021 07:46:28 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so1453347pjb.1; 
 Tue, 07 Dec 2021 23:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NtweuKbs2MfZWpt5xIw7VULyGKHm7TbvXq2wNntSpHI=;
 b=gdVTOE/ai17mTSNNToyDWKlCUDe3++Fiq5333dNqaAZWFllNV6wdTeIwHnGFpLcNt6
 mo9untbxCaZANNouIWrm0+XYHyL7jbUDZbD7Z96FckR9nrlspVLyrQdmcYJvxcQyiz0t
 xMbllJcj+WLCGpADoGyoXZLghlq/OFM5MI+CADL4EvoS0KI657CePJDMpuhVEsduyZIw
 sIhM4sloq0D5x/XO7VRtzoe9bQ65XQ3UyOkr6/bZ8EUhjso6F6RDnDzJA6qANE0s/gCU
 zrmoCq8PTAP4gxW6+kzQmoAsl/Za+ZMHvzw8ZtqGEGAmMUjXj0ZLaArx9A7Ga+VI3G/L
 wXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NtweuKbs2MfZWpt5xIw7VULyGKHm7TbvXq2wNntSpHI=;
 b=VDKUP2kleltevLDj8aE3N2mPU0768zPdqTzTpIV3z6zo8NFMmSP/asvfjX8tNuHalV
 Tkx5+teHxcbipFLYmWFD7qf/NBGQcqLQXwBDhrNtSOI8t4DEK4tuNIVg6PH/7/E7Ihs8
 9reFu3MnArAAF87u8D23JRAKcT08xBDD6PynUpQynO0HmTYVgiZtt4tbdc70OLOHx1jO
 kAC+XmPgGrW+sXBx6q/MD4FwirEEa8zBxCQrRKpTFxRT1m06FnkFTNARhJt/Wm2kBrh2
 x9ZowVET0SSsD7old767C/garOcYuA4DOMklGOhTMt94TuAamJfUjVqGAM6bUWag/PU/
 Hq3Q==
X-Gm-Message-State: AOAM532xrDFd8Sj0L97sKRg15Nkt1IiFyw42qIseFTWnJPZviPvQ1Hob
 cP0442wVBYdj2aPvVRHW2vg=
X-Google-Smtp-Source: ABdhPJxLWUdY5+jg/o/MLuMbGm2XLR0ZC+WwijUBNG7QGGTXHMPXPQn3tyTHWqsMJ0cS3qdtZXeTXg==
X-Received: by 2002:a17:90a:e016:: with SMTP id
 u22mr5113888pjy.95.1638949588555; 
 Tue, 07 Dec 2021 23:46:28 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id j16sm1673681pga.32.2021.12.07.23.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 23:46:28 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: luo.penghao@zte.com.cn
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH linux-next] drm/i915/display: Delete redundant post_mask
 assignment
Date: Wed,  8 Dec 2021 07:46:19 +0000
Message-Id: <20211208074619.404138-1-luo.penghao@zte.com.cn>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luo penghao <luo.penghao@zte.com.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: luo penghao <luo.penghao@zte.com.cn>

This value will be overwritten by the following if statement, even
if the if is not executed, the value will not be used

The clang_analyzer complains as follows:

Value stored to 'port_mask' is never read

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: luo penghao <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bd18432..3aad0c3 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2011,7 +2011,6 @@ void intel_ddi_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
 			return;
 	}
 
-	port_mask = BIT(encoder->port);
 	ddi_clk_needed = encoder->base.crtc;
 
 	if (encoder->type == INTEL_OUTPUT_DSI) {
-- 
2.15.2


