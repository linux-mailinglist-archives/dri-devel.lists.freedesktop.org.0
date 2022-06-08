Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC8542FC1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86E310FADB;
	Wed,  8 Jun 2022 12:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7886710FAF4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:30 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id b7so9961012ljr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BtJMYN1NiTYanbaLswa1fSBSsXJlRUYRVZDlZh1k1AA=;
 b=jjo/8XzY6ReZsJMH4cA33Qj8DbMijcu6XUr/ybAIgT+dCaKH700w/+T8rPZb/kW68d
 UdrEhRhskml8Pufl+8l/dxgaL1Iv+8FvozljZ+HLcwIpO44+KbtB4VMHq1pt8Xt1E8xK
 Nl2eVcHacRogoAPWjV61IbxCaWvCERPgX17cN5YXIEZRYg36VIz8/eYSTxQRGKq/CtwJ
 wpVtLZvaPSVSn9uaXtD14A6jeiN5noWbFsFn35pY3TJsbMPFRtv3CdUgWdEsM/VvgYeb
 vzVc4i02tg9mVd7C6Fmsez0WV37T9SqNdRzbmDRfbWY/91JCF34ZIGIjEgtFHbXzfGov
 D/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BtJMYN1NiTYanbaLswa1fSBSsXJlRUYRVZDlZh1k1AA=;
 b=GeQZ6EHcnHSkNfLD01CsKAN+hmIQpiinzd/D/SO/CFk9rzqVDVwohMkafsU+GUB9mt
 eT/UcgYZUXzZiZL9lOTmZQk+dm4UaLkkanNZ8FKg3pP106zxqmA38yZQj1d6No9Ft4zO
 oqxw/I9GEbKwwhpT7MrrvP7vtlnMjoWPUqvKKt3fD1reM8FkuEFfi131qptkDccNl30e
 Tkp57bbTbZLPG0IIiyEOX8UZhuiOqdPDcAMhnrBSFM3oemugDDeVL5r7jgC+jmxjrycr
 aGRS1/mIGTTxHi/zyJPXu8xEVgfvsGIh48HBiSDp9NaWtnA05AGk3ZmCPg1q6WagQ0Ml
 ezIQ==
X-Gm-Message-State: AOAM532nSPlSnAnY71THyO35a0V1y+xLtf968i+XMDjdR2CX/ZQ3zAgm
 4I5tsHshOFlDF+kaFBI2MAIXTA==
X-Google-Smtp-Source: ABdhPJyg7lK6URUsUevB0Yts6v4fPYfHMP0po3JI9+mAZ/QNxG+qvPypTnCsuXE1QmNg3RhilkQ77w==
X-Received: by 2002:a05:651c:239:b0:255:a237:7ebd with SMTP id
 z25-20020a05651c023900b00255a2377ebdmr7052905ljn.401.1654690048709; 
 Wed, 08 Jun 2022 05:07:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 03/12] dt-bindings: display/msm: hdmi: mark hdmi-mux-supply
 as deprecated
Date: Wed,  8 Jun 2022 15:07:14 +0300
Message-Id: <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
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

hdmi-mux-supply is not used by the SoC's HDMI block, it is thought to
power up the external logic. Thus it should not be a part of HDMI
bindings, but it should be declared at some other device in the DT (like
HDMI mux, bridge, etc). Mark it as deprecated.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 81997759584c..3f703d737ca7 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -55,6 +55,7 @@ properties:
 
   hdmi-mux-supply:
     description: phandle to mux regulator
+    deprecated: true
 
   core-vcc-supply:
     description: phandle to VCC supply regulator
-- 
2.35.1

