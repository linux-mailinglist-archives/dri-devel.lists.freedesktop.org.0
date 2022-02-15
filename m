Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E2C4B6E8C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 15:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839AE10E5F6;
	Tue, 15 Feb 2022 14:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C93F10E5F4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:16:49 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f37so10857653lfv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 06:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Wgv1r0Ja4kv+q7R33vFu+J3TG98XPEyfJ988+yvLp0=;
 b=YRJzRgM+5jP2zo5GkV7gS+z+z+6IOEZt1xyw7ohc2uvazVeQhg5WHG+PpzJ7Uvrvkl
 BvgMRiznElPgkeaZnCkXxb2w+/fBcuu4H6P91y5mgnaHISH+W+aUReEStTAmXTTRUyYu
 9hY6FgU3iqSsBonW6/EZ+I4jFVGnTtXdHj8d42r/J4kDdjFH3X3WQDTLEYcqnkx4x+zr
 IKhBUvpTtzpPwKAgym7/TuSbdPtwWmxp8HUmDEjgmDMIfA7CYpSH06DLVNZQ2mc5m90L
 Xq+UTArHpEgxzrjVQpcg2DlUeg+YbzShSjlBzI7quYhPIEg55eXNk8FIsY4NJIoGe0NF
 7jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Wgv1r0Ja4kv+q7R33vFu+J3TG98XPEyfJ988+yvLp0=;
 b=oCxyNyB/lTEJExU7eDc/TW1BIOO8MV+2/wbl2RA++Q7NEjEwVZtqlr9DrTxv6SpiN8
 JWlz+YUCccK3Ha4i8BZ7cYY74YeM+erZjmb0wLt954/XwYha2QLsYaRU+Fjk5GY9YsCK
 Q4Ua5+l4nigHyzz5BT4MnKAMgbPWIN/UUTKPSjmlC8j0+Rz2t8HIgAt0kgv3WKSH6Obq
 5L0Bf1X1l6n6rVI6BO2MLAvj4RW5+CbUQFjbTm7sHul9FqDfbdMliZBLGTCVCF3OA6l2
 LkreKfN7N+ToEIxNYm7nKDD+Yoqmd3RZnxtmMYkk3dIjXnbXflc4llll5ErgIak4Wwqr
 GtBA==
X-Gm-Message-State: AOAM532yJ/kUoRPB2/MS4t3ALeaW25YZjrMQ0ClbDabRt6ZUFQHBD2e7
 SRK71l8iBZq7NZf6SRW/LRDocYbSG1elBA==
X-Google-Smtp-Source: ABdhPJwJP5BWmAwDQOBWjjHnLLIYAbJPBOGzXk6aERcNdCaSXoHbdjfef1L147OM0DHiAHtvg+6t7Q==
X-Received: by 2002:a19:ae04:: with SMTP id f4mr3145769lfc.667.1644934607857; 
 Tue, 15 Feb 2022 06:16:47 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 06:16:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 4/8] drm/msm/dpu: drop bus_scaling_client field
Date: Tue, 15 Feb 2022 17:16:39 +0300
Message-Id: <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
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

We do not use MSM bus client, so drop bus_scaling_client field from
dpu_encoder_virt.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 401e37f50d54..480d02ccff8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -127,7 +127,6 @@ enum dpu_enc_rc_states {
  *	Virtual encoder registers itself with the DRM Framework as the encoder.
  * @base:		drm_encoder base class for registration with DRM
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
- * @bus_scaling_client:	Client handle to the bus scaling interface
  * @enabled:		True if the encoder is active, protected by enc_lock
  * @num_phys_encs:	Actual number of physical encoders contained.
  * @phys_encs:		Container of physical encoders managed.
@@ -172,7 +171,6 @@ enum dpu_enc_rc_states {
 struct dpu_encoder_virt {
 	struct drm_encoder base;
 	spinlock_t enc_spinlock;
-	uint32_t bus_scaling_client;
 
 	bool enabled;
 
-- 
2.34.1

