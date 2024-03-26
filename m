Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0853B88CDEF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F32C10E23C;
	Tue, 26 Mar 2024 20:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="idkPpRg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39E10E23C;
 Tue, 26 Mar 2024 20:12:37 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a4dfb8bc3a6so82359666b.0; 
 Tue, 26 Mar 2024 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711483956; x=1712088756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xUqd/hXXnUj9kaAJZ97jeBbCMUvezK3PPckw8kw8588=;
 b=idkPpRg4jGUkWBo4cfL06I4LRsVUKX4jemlCs/5M3SrLtSR4fSb3DFook6j3GJeuXs
 s7dpeBxz/D9tjtm39cCeIy8N3GYeBBdTybwRhccmFDMQuMIWG+4/uOeQth39L2YazELD
 a21f/GkTtNcAFsjEbMfdnv1MT5z6UwmesDdfHeZLIDUaNOP7mqhyWrGUAa91uCv5yA3B
 2g5ZNjwqyVBrTEEtrRCSRE68cNE8DXFmC1/mfK1+mBknObQ3C+VK6WxozZ90IFOKpFbz
 vp+jGJcPPZ/Y4evWj+rbBLCR5M9Q8BTaG7Omks1bWB2fQztQO+4mzEoQiatYQLWES7SQ
 3TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711483956; x=1712088756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xUqd/hXXnUj9kaAJZ97jeBbCMUvezK3PPckw8kw8588=;
 b=jnIVHadJqvbsY8LxSjYnE4OGmbhGmpnnurjO6rSvVZZu/LQXD1ViyMSS6Ys6rzL+QI
 rONirOzXapKODDeai90xMUfMjgEKR02/CtNdlkpAfHgZTDXtW1Txj/HNLsSx/iSjXmBe
 lmnyVYyTWGu9cymtXA6tSGmMbXcnDaM2JMSZ7bS5cOYROzlPxqgnxf0ZCIHcyxVjvXSN
 bhEmtgAyvrdwoxV0iGujefQcXSRKx8iQDhngqa9c21IPsSsMpYZX1pkE+JkArEb//Cq6
 fHWVXbhOrbBqnXUlWdOsqw+ghvYckyiRjMLzd3LwJRqkCUC1Pg2fdK91hjbmCxR2+NSA
 FA3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsSymcSCP15EFqiSimjIY0A94jBFkOD9i/p69enmeMZSr0X7T2FmQMDqScH6FoVyMv9GkCoA0IEcMcdr0hGzE4RV/XFqSxr6oeW5QRQX3Q+HnqOqt2rCOZJqNIb/u0MEsSeVF2jn24Nf0x9QDDYCWL
X-Gm-Message-State: AOJu0YxyCsIFJ/a4UvKHYpAztL3+hJ3yskzZuTpnv1c7Vkk5InE5r4/E
 YSA15XsSDgls/esGVjZbm6KjHIHp5Amgm7Qa5LMq/QnuhN4Giras
X-Google-Smtp-Source: AGHT+IHg3ORZ80GhUvJ9XJEF6YPpHT+zBqZGXseRfkvUVWidu77wObbjjRoQtlhIZSCbSWeVSEZbqw==
X-Received: by 2002:a17:907:7d92:b0:a47:5248:68d5 with SMTP id
 oz18-20020a1709077d9200b00a47524868d5mr7307816ejc.60.1711483956009; 
 Tue, 26 Mar 2024 13:12:36 -0700 (PDT)
Received: from localhost.localdomain (byv80.neoplus.adsl.tpnet.pl.
 [83.30.41.80]) by smtp.gmail.com with ESMTPSA id
 du1-20020a17090772c100b00a4da28f42f1sm1714257ejc.177.2024.03.26.13.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:12:35 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Adam Skladowski <a39.skl@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] Split Adreno schemas
Date: Tue, 26 Mar 2024 21:05:57 +0100
Message-Id: <20240326201140.10561-1-a39.skl@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following recommendation from Dmitry Baryshkov this series split schema
into separate schemas per gpu family, as i don't really understand much
of yamls and dt-schema i decided to send this as RFC and if there
are any changes suggested i will be glad if these can be explained
to me in ELI5 format.

Adam Skladowski (1):
  dt-bindings: display/msm: gpu: Split Adreno schemas into separate
    files

 .../devicetree/bindings/display/msm/gpu.yaml  | 317 ++----------------
 .../bindings/display/msm/qcom,adreno-306.yaml | 115 +++++++
 .../bindings/display/msm/qcom,adreno-330.yaml | 111 ++++++
 .../bindings/display/msm/qcom,adreno-405.yaml | 135 ++++++++
 .../bindings/display/msm/qcom,adreno-506.yaml | 184 ++++++++++
 .../bindings/display/msm/qcom,adreno-530.yaml | 161 +++++++++
 .../bindings/display/msm/qcom,adreno-540.yaml | 154 +++++++++
 .../bindings/display/msm/qcom,adreno-6xx.yaml | 160 +++++++++
 .../display/msm/qcom,adreno-common.yaml       | 112 +++++++
 9 files changed, 1157 insertions(+), 292 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-306.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-330.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-405.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-506.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-530.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-540.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-6xx.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,adreno-common.yaml

-- 
2.44.0

