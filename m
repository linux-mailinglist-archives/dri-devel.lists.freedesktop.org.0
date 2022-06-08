Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C315542FCE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDC310FB0F;
	Wed,  8 Jun 2022 12:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E9B10FAF7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:31 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id y15so17076801ljc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDBKU4xgHvGFrezVeATBy53n8vUXQx7PhLrDpuBLOD4=;
 b=zMmuc/84StRSzomRzYwYkOTluBMw+YRiUPxxGgiwpJBcPSQS8CDIuhceJv/uFsRV++
 mzvEzRCJvXITD//EvJbHoo3wfwmj3qCs3LWO8TTIFX4m68+UqYURFwXnt8VjcSAt4KjE
 1z10+1gxzQY3qsiTBkDL98DwZa35SnFx7LExEWLJDO+ZOK8HM8zV+5F0OezD4BleycKy
 wVnc78tc+bXdEpu4lGrpY01/Du06cpy6hX6E8w4CK5MGL166HfNQPaM3X3Aq+616Sw9a
 N6anojECNgXeqe5CheDJi0H4so3Xl5Vihf6pH6gUeLflvko6uqWoLGAfEoKSAyaWNCEF
 8kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDBKU4xgHvGFrezVeATBy53n8vUXQx7PhLrDpuBLOD4=;
 b=ty9TW/3ArwcotKPoUgTNHZBLuGPOZb3KJ4q68VsHGJFRvzW+SW+rqPweN43hAL0KnC
 MFyv1fP80/0tnEe/zQpuktk/0waY1Gy9626zkamSfwaco54eKgQaAX/3vsu5LJ4v32WA
 JP4a7NWNpCX8551e96gTKhuFDgiMvzqBBLY4xPHHGf2B62LymGCf/pKXrCetMp+hrggQ
 9OG+UhxLNhjXmsJBFYD7vdgVZ3k+f77mphLU4nkJtQv/lJPlkTbykzax4Z5zbfuNAx4H
 vAoJUObpH/IxRDBTdQ4qgFSfk9v/ChHDsQY3W/UhOsv3rFcOJR/N8ZwTdJXDOct6VRnt
 CvMQ==
X-Gm-Message-State: AOAM531r1DssDSEplDsWiyhuaLNyXWwt1UVH9A70H7hCr15a25oS4xz1
 gdta7x6YEhz4c2yuP9UVUPbEqw==
X-Google-Smtp-Source: ABdhPJy/S5pVnSNNP6KRSYp3iaasr5TE0F0eWIvCe2hCYSzGL89wafjDuU8uxmo+hYriHLwvIbJSsg==
X-Received: by 2002:a05:651c:199f:b0:255:a45c:1517 with SMTP id
 bx31-20020a05651c199f00b00255a45c1517mr6258544ljb.25.1654690049580; 
 Wed, 08 Jun 2022 05:07:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 04/12] arm: dts: qcom: apq8064-ifc6410: drop hdmi-mux-supply
Date: Wed,  8 Jun 2022 15:07:15 +0300
Message-Id: <20220608120723.2987843-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI circuitry on the IFC6410 is not powered by the 3v3. Drop the
hdmi-mux-supply property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 2638b380be20..eb6b1a1ff117 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -341,7 +341,6 @@ hdmi-tx@4a00000 {
 			status = "okay";
 
 			core-vdda-supply = <&pm8921_hdmi_switch>;
-			hdmi-mux-supply = <&ext_3p3v>;
 
 			hpd-gpios = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
 
-- 
2.35.1

