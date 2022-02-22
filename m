Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D954BF20B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 07:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC8E10EF4F;
	Tue, 22 Feb 2022 06:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC3C10EF3D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 06:22:53 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id t14so17852234ljh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 22:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+FUp1ylyZlTVPkOMx/YuQtPRcxSfUwrG3pZ+XT0maY=;
 b=zQeIan6symQMv3r+UD42j3SgZ2JFsvBjw1DG0LvEciJ5Z1K+pGe3OqhD0A/kM8RYVr
 EdVQTW2GwHmSOVRFhctzRn4/akdowswU0dGitnRCv2+KjJ/Kbo1EbDsgdGcaTidcMrPK
 NMQd5N0H6iljAsJLwnPD1Hnx+MqL0smsxuXS1/0K8yO54U7dGJbs4IM/QR8rNW+a949P
 5juysvL4ZCh4uz9KCF8ViLBZp5tw2H3RCTmX7AxkuW0Hlab464jwlsIMW1P9a2SCwwX2
 7hfnwVCk3EsxjszAnWrSC2kvfIEBkS5AzWgPN04wP99IW3uRKYRzcqeb2KsIQLZS4ZL4
 72Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+FUp1ylyZlTVPkOMx/YuQtPRcxSfUwrG3pZ+XT0maY=;
 b=kzleF1E9jnT6R19VtOMNQwbiw8Q6MrrH02hkRM+5nisoak+eQa8njLwDozR2ogOlLM
 P4C7j0aqjJgEKTB1SzHjSO0Io9cSNDR0GU3rAdPYjDXxfkTulJMOdGlmMpowubCpazbJ
 7TrkMUL0AK3bg0mh85fi0TA4J2BJH0RJ859zYsHRSlsCl9UGxZ77C1d8RdlKQRcQqmMa
 wDrd9cQzUZmHyVxamUnt5pzdX8cCi4A8oNqS9UG1Z4PMuWRh6kr1gIlqVpQMGtx3gfux
 Od+Z1IXPhCEFkOuD+yCmSDal6A1ssyX+A+LRuKux7yTguGhhIBd/nwq/dAk3gEr4o2gs
 I0Fg==
X-Gm-Message-State: AOAM532XHaLn3Ked23QmGFCzNPDs9+5s+kqRgLJDQSvzB5UbrXTv0wQe
 ctxEypb9BaXmDY65WxRPExp/DA==
X-Google-Smtp-Source: ABdhPJzJoRJqP/Yv4E6j+hUnelgIm577kvPPgf8vanDn4VQyGhibwSQ0Ee1CugqNUKC1i8A1ZDN56g==
X-Received: by 2002:a2e:9cd5:0:b0:246:3ec0:7505 with SMTP id
 g21-20020a2e9cd5000000b002463ec07505mr6092017ljj.434.1645510971535; 
 Mon, 21 Feb 2022 22:22:51 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
 by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 22:22:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/4] drm/msm/dpu: drop obsolete INTF_EDP comment
Date: Tue, 22 Feb 2022 09:22:45 +0300
Message-Id: <20220222062246.242577-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU driver never supported INTF_EDP, so let's drop the obsolete comment.
If at some point 8x74/8x84's INTF_EDP is ported to DPU driver,
corresponding handling will have to be ported too. Until that time, the
comment serves no purpose.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index f49f42e70b29..478a608ba7f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -91,17 +91,6 @@ static void drm_mode_to_intf_timing_params(
 		timing->vsync_polarity = 0;
 	}
 
-	/*
-	 * For edp only:
-	 * DISPLAY_V_START = (VBP * HCYCLE) + HBP
-	 * DISPLAY_V_END = (VBP + VACTIVE) * HCYCLE - 1 - HFP
-	 */
-	/*
-	 * if (vid_enc->hw->cap->type == INTF_EDP) {
-	 * display_v_start += mode->htotal - mode->hsync_start;
-	 * display_v_end -= mode->hsync_start - mode->hdisplay;
-	 * }
-	 */
 	/* for DP/EDP, Shift timings to align it to bottom right */
 	if ((phys_enc->hw_intf->cap->type == INTF_DP) ||
 		(phys_enc->hw_intf->cap->type == INTF_EDP)) {
-- 
2.34.1

