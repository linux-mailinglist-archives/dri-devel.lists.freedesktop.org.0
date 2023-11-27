Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32767FA48E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1759410E327;
	Mon, 27 Nov 2023 15:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7729A10E2F5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:29:02 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54af4f2838dso4181620a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 07:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701098941; x=1701703741; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qhPk3gIHMkcRIIJu/Q2shfUhw94w8SwgcuUapNUkT6Q=;
 b=ACX+Gdtq5tNu0nhHnjo9ilzzcrZh0up7+xeYtn5f7dKC67zsSC7Y3p+l8GjQG8tZKj
 pD8aop1sOT5rwqRYDyKbeg73EwpBd/bm+Mr6Mr5znrfi5e0Hsaiefd/+PIeq9XBv+61o
 LIiMOv9jW/5yUhph+A5fQTvfzSeuVB+ojgO9HneuTMpcsRH129xyaXHSGNZh772baMpr
 zSGSRlpBor1U9+uniazGsrCCmZUDy/OeK/6GBmaiHyGxuptzVFfLfEIoE9alPKxBFs7z
 yoLXGuGKjIl2RqWivqfICugHHcCD0IoB0a/Ov3TD9tRmPA96zYSM23t42xRog7aOb5+w
 sZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098941; x=1701703741;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhPk3gIHMkcRIIJu/Q2shfUhw94w8SwgcuUapNUkT6Q=;
 b=dS3IzlvKf3PPpOaxOKweR9lFEwE13njiiYtwasylCAw1y/S38+0G7/cQxgHfJ+GkC6
 LPiWxFtVMJ0RFKqM/3dSaWsceV3wJYMhp94nMKk5pGwV0qfXWL76N+uo7mJtC/P5rK6z
 RZoKmtAixLvNWB47QPdljDyX2Hf+T2SRIChFaveIbQH/XoA8ucw0cjquQ3O0WkbQvf8f
 6dPtbfNGwt8z5qSaI000Pp/if5/v97HFFXxe9dCFVloyvzeLcreRtRqcc7zhkLdZCUqD
 DZYI17qOmGO4BXbaGGJbU6JNgYL0kQxbQ4LcP8KoBviTjO0tzHKsSmxXoXZQeL0Dhtby
 Sr1Q==
X-Gm-Message-State: AOJu0YxnJ95ynbotpiosjzvfpSIGGzR8k59LTxKHGgv0BI7mgU/Mm2LF
 3jF0St0s2KfeTvct2+pJ6V0oZA==
X-Google-Smtp-Source: AGHT+IHaZ/5ZPExAgDq0L4FyfPmoaHa3HQflZh0/a5XkKNZ1bg9JP8bP1GFa6VnYYjaQd4f0weiiqg==
X-Received: by 2002:a05:6402:26c5:b0:54b:516f:4bd2 with SMTP id
 x5-20020a05640226c500b0054b516f4bd2mr4076156edd.35.1701098940866; 
 Mon, 27 Nov 2023 07:29:00 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 07:29:00 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:28:43 +0100
Subject: [PATCH v2 03/12] dt-bindings: interconnect: qcom,msm8998-bwmon:
 Add QCM2290 bwmon instance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v2-3-979b28f35e4a@linaro.org>
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=959;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1AOnfLSu9gHpTFJJhxoEDrJmbQSA5ACPtQkIorVkBaU=;
 b=JAKQLFdPAmDQ4J/cUUjfVGrZb07Fv/d/o7HuoV2jIu/p0pE4NhSeFPRmHRQ/v8fdmvADNoz+J
 73OV7Zypoy6Cxob7ipNfb32n7IddSCx5wqWOafi/eG5wday4YORBD/Q
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QCM2290 has a single BWMONv4 intance for CPU. Document it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 7cb8df757477..a88cea732370 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -25,6 +25,7 @@ properties:
       - const: qcom,msm8998-bwmon       # BWMON v4
       - items:
           - enum:
+              - qcom,qcm2290-cpu-bwmon
               - qcom,sc7180-cpu-bwmon
               - qcom,sc7280-cpu-bwmon
               - qcom,sc8280xp-cpu-bwmon

-- 
2.43.0

