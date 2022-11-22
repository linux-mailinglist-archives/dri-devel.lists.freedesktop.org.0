Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5017634ACE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708E310E4A2;
	Tue, 22 Nov 2022 23:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B550110E48D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 23:12:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f13so4224350lfa.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JSEDSNjhfy5FuCupdNXYQlqb25p5cAnBD74WVJKHUw=;
 b=V9uQCkEOAjtkAZB1nCpLEfL8Q9fgBw2TbbpxhM+R//6bRh8dhATSrLZZtNZmvsL3im
 52R3agbDluW1JxxpjRNHwrA2JNPojKddt5Ta/xZJG+/mi99ro9frZ6cIF+L/rxZTycb/
 1V5styK59o07/rBR+JQfXz/ZwxYePQ4yAzhNUCZNiLFuU5J3vkfMU7aUdWN/8y3eBTCp
 tE7bUpzOlkLBwVu/UwP2tpu44fPZbABH4EC72oCndaupBHrxCxZsYkuRgSKghXEsUgB4
 UUGNCK17yWtt22kljVJrzEMrlMR5mDgfELTEEAcACRWcEq5xF8AFV38+LlnNN5GvW3tJ
 ekPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1JSEDSNjhfy5FuCupdNXYQlqb25p5cAnBD74WVJKHUw=;
 b=vQTjSM3NaK3ZAArQL9WBkirVXegH6mztBMQyS7C8FveCZnMjqCkKsksoB05fbXviYV
 QQ6neEXrmqNflZ6P2zuVpE5ShfJoJNIi0JoPRA8QERYDQvQTtJcIE6fi+di7HbE5TxYY
 WZ14UcSuEKmqQTglT+wN+uMrasIHFTBlrEiST3f2hMkJS7ldHI9WatSo8ynV+Sblv7el
 MkbwgD4Fj+RQGHzhduVfpDJjMYVfEyzeoXw84Svq4OEtqJKXL9HW2/Y2Pa/mcIYui5o4
 4OClJAYsWI8qAmK3T63Kt8Fgn3+zlrBDvAM5o3QMLPTjTBVx3htKaZhS61tCfHZD+BUQ
 E5bg==
X-Gm-Message-State: ANoB5pnYfmk2+MJtRzz+HfBYym1dlQi7b9cQRTI4rsYt5Lf+BHQPiImG
 Q+mhwogSWBY03OxV6elRm0JU0w==
X-Google-Smtp-Source: AA0mqf7CnRMp0y+0/C4SqT+f1mtAM9zTOjUVgcvxymVj38EPNVSmfgfp4yvJW6Vm4qaADOKhQp75Ig==
X-Received: by 2002:a05:6512:3b23:b0:4b3:abaf:b7c1 with SMTP id
 f35-20020a0565123b2300b004b3abafb7c1mr2431193lfv.39.1669158758772; 
 Tue, 22 Nov 2022 15:12:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:12:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 03/11] dt-bindings: display/msm: mdss-common: make
 clock-names required
Date: Wed, 23 Nov 2022 01:12:26 +0200
Message-Id: <20221122231235.3299737-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark clock-names property as required to be used on all MDSS devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 59f17ac898aa..e2980aebf178 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -74,6 +74,7 @@ required:
   - reg-names
   - power-domains
   - clocks
+  - clock-names
   - interrupts
   - interrupt-controller
   - iommus
-- 
2.35.1

