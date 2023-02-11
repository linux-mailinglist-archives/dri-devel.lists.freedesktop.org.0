Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963DD6930DC
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 13:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E21410E179;
	Sat, 11 Feb 2023 12:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF82010E171
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 12:27:02 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id dr8so21789083ejc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 04:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHheap62xUTlR5nYAk+Jh1vpzTppzTaMXhpOmRALAYI=;
 b=JZMN+4hSY640k6Kja8OEBIuj0yWLh5OZ1zOwcmtNaNn0KoXB0JLEBY9/Kwc7/GqgiF
 m1ajvu/oQv9m83TfWB2xAJ8XRJTq+b6iDh92VLLtaqcKXEgguqz5BlupzibNuRLjbcEZ
 YosZ6bhGT2WfNj9cLqEZYVGDKk6FCjMzxWI8i7R9/l1Ca1x6IO0mHBtfBX3RsHJYsM8S
 2c6Ila8w+ZbK+3pe/IWZq+aV7lSBHAtsUPDn0UyIMVgYYsrJxKo/ACJivXEmt6GFzTPE
 +/a3l/WMkp5C33z0vtu06C6DtXfbAfgSxPEtrhA6DgE16cTUUhbxNMYbAKNdcmu6+Wh6
 pbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UHheap62xUTlR5nYAk+Jh1vpzTppzTaMXhpOmRALAYI=;
 b=FNSXHOz+Zt+fCzZDkUej0qABAMRAXdIoujfb6r6b7t3IQseTRD5xK3cizV5jmycQmJ
 fE+FwkDQ/8JF6vhH4o1gTT53EJ2q2miI+W5mfkvpr6QXT16fGC9NkkwdJKaJuPMxcXp+
 1zo3ILTuHuM4KkEKXXWNJ/zoTrUrnygDFnwHmzLkyBe5iPOgLbgh+fYdUh6GTBf68VOW
 uTvi5nGz2kzTrFreOHuZjlo8GO5/6kpxMbbvTTGRxSGvgOwSEs23hgT7wyovTUOf2lgB
 8FsdfwFn8SFOkVEqF5T3Jo+4LZCOQkdfArTixZ53zUPIzqyL1z9YJ5jJeSL3b2d4PFW/
 fvxQ==
X-Gm-Message-State: AO0yUKVJ67gZX5XdwyToGupFf/rPdlWWp1zrbH4Hb/bVIdIjSA0KOOYB
 zAYjQxqs6bky8SE/jNB+tPxGQQ==
X-Google-Smtp-Source: AK7set8ZFbIY5TBzWXOS1C1MfTjkBrsnU/cixmxrIKXASrqcqd0fgrjzx9nXG8WSbxwhzFSQIByu3Q==
X-Received: by 2002:a17:907:6e17:b0:8af:2af5:1191 with SMTP id
 sd23-20020a1709076e1700b008af2af51191mr12961239ejc.18.1676118421369; 
 Sat, 11 Feb 2023 04:27:01 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 mv9-20020a170907838900b0087bd2ebe474sm3767941ejc.208.2023.02.11.04.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 04:27:01 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 01/10] dt-bindings: display/msm: dsi-controller-main: Add
 SM6350
Date: Sat, 11 Feb 2023 13:26:47 +0100
Message-Id: <20230211122656.1479141-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the DSI host found on SM6350.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index f195530ae964..2f946bb9fe24 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -286,6 +287,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
     then:
       properties:
         clocks:
-- 
2.39.1

