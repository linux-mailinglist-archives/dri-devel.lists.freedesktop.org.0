Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC267108A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F1710E1B7;
	Wed, 18 Jan 2023 02:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F150E10E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:05:52 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z11so47736573ede.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Mo3OsjRmoegPVBXpDHztjrI35bAGMIMb/BBoDQiIGE=;
 b=uqXudvu1MCtrBLj2k/8P0eqOwFbcvvMPhyQDKG0Nsk7+kCuwkvXUDgzv6Hea6OPaI0
 l/fWZK8Rsr9t391yNau3seUvPA9KdvG02Rjn5Wm7SToUquUANVVb273R+asuwUf/rWhk
 5uc/7gG2jciJyhPFFcP6/CoJFJ1YUyBsM19525fnwSRkLaMiss/GMHCrdmJN50zt2PIC
 0HJEVvKyPGBfDi3+fj6P2g8NkpGodnf1ylFXYPgyUDwvi7OZHBzb5YLMt++kay26iUur
 bq2DgynP7f50zBcMnBbVUSXVrzNqkk9a0OU6tK9N6AaWDA2gmFYaPtC1IIMwcr5oyYku
 i61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Mo3OsjRmoegPVBXpDHztjrI35bAGMIMb/BBoDQiIGE=;
 b=juSA9hdHZzwPyJ32Y9z6fAdEf4lRmcFpkNOid/UxiU7WzscxzYHfca1sUtXgwnVai5
 idfQxhgBZTsGDQgjmbvCSvYcodjtzAPLoHSUVGILdu/6kSu+WO6JeHrfsz4/V24Fb3Fs
 HMHr0Zrp7Av6jodK7Slhfsy5Qx1rAXwxTjkE+Ey+o8jjXnXydXKrpbuwV1elyLYyWuXd
 gqOOrQ/h05bk8TlGv3gj8RGnhz3YZARAF5ZOtxMX4GidoVwba+4PSu2p5cz58aprBcOZ
 ksiNQaWLC8kv/uQs890fq8Jk/vpl6Hx43QF1VNRhOafXo60r2dT7GWpj2VBAtJyN2eP9
 zRLA==
X-Gm-Message-State: AFqh2krvpm8t6GI+BJOD2B7goEP2A18bmgx7riFB6S1YKyp+w07Bcqvd
 572ayW6RIfPN1FJ4OhI4aCKgmw==
X-Google-Smtp-Source: AMrXdXs7o7jY9Bn4+fBgXzZsPOskZ1OqDKjUQsZqGxiJcTwUNfkGFNx1rl1rt7/SvMi6oA7OHizOPQ==
X-Received: by 2002:a05:6402:3496:b0:48e:9c36:6c39 with SMTP id
 v22-20020a056402349600b0048e9c366c39mr7097405edc.0.1674007551486; 
 Tue, 17 Jan 2023 18:05:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s1-20020aa7c541000000b00495c3573b36sm13544668edr.32.2023.01.17.18.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:05:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: add missing dpu_encoder kerneldoc
Date: Wed, 18 Jan 2023 04:05:49 +0200
Message-Id: <20230118020549.1690078-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Describe missing dpu_encoder_phys_wb_is_master() argument and struct
dpu_encoder_virt.wide_bus_en field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1a528ff0f28..758261e8ac73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -162,6 +162,7 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
 struct dpu_encoder_virt {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 95921efd8139..bac4aa807b4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -26,6 +26,7 @@
 
 /**
  * dpu_encoder_phys_wb_is_master - report wb always as master encoder
+ * @phys_enc:	Pointer to physical encoder
  */
 static bool dpu_encoder_phys_wb_is_master(struct dpu_encoder_phys *phys_enc)
 {
-- 
2.39.0

