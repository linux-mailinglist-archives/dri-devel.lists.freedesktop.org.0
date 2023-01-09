Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4A661E7E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 06:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E3A10E274;
	Mon,  9 Jan 2023 05:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E45E10E279
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 05:44:10 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bq39so11388955lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 21:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vwVoASNnAU0yQzXSIlPjrbYKvIqxO9QDa2dRwLN6fIU=;
 b=JLoDUGJzmWpdrZg7ltG5rMZwhCslsDHUYaWKlGO/v3RT0Aue7fAVLddnC2nMP0B/gf
 Sz61LE0abcai8EuYfaiS1uExIi1D9Tci3KQqAUt6ZF3Dc78mGimWi+kh/GAKmqB0TmhQ
 4pIoo+Z5UrDZbh9YiQHyAMTrfeVKAOZcpPaEpBaFYNNpst6rWYCiMxZiVGNqxgJbLBLu
 YdcHZLdEJbEOFee8hXD0IPloM6DIktpVaMBqg9N3lGSuBU7Z+bTwR9h1I+hhZcZ4dYo4
 L6caHL5bXKQVb6BeVLncbxjbQJlgSES7uNkIn5z5aPQ2bnFKpMlEmVRQVbCeRxIU0zn9
 r/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwVoASNnAU0yQzXSIlPjrbYKvIqxO9QDa2dRwLN6fIU=;
 b=mO/2IWoYClpcn4YTS27nL0PQ+p/FgjhZLYEbDckIS+RLHKPCCJSI/1RxXYTGXbrTIS
 ejDPm3Q3H/afJ/ZbnU5EVcwiqWmjN4At5Lp3eTYGq5gkG+OgZ7VLu0KOuxxy87f9af7h
 9R4COCF8tLm0iYQSsohuiHy0Edc7/CoQnO/iZBJy1LysH+DAhYjh23eCpRVc9ZA00EpY
 uauacHDKZ85WLtBGoQgfAqSem3drLTrnsj7Xx+41wmtOrIjeUB3oBOM7tLX9T4/d4IfH
 uS7/4X9QfBZQraFN5efFULb2bDkE58nY8CLViCfXmShB2b1Q+X4ZHHdMfweUlaw6Njck
 iX4g==
X-Gm-Message-State: AFqh2krxMumnZ9t0uMHpQdH0Ct1NaMCxxL+ZteuOBMQEwxq3hO7FjVzM
 cabLDv5NtuadAceJbapRsD16FQ==
X-Google-Smtp-Source: AMrXdXsj8AerO4srrK26Qjkd12NTfm5B1jeUHvkCnBvxmjfKRHExkI/AEbhV2uqVFOVIiOUfhfCXnQ==
X-Received: by 2002:a05:6512:3a91:b0:4b5:9b8f:cc89 with SMTP id
 q17-20020a0565123a9100b004b59b8fcc89mr20482250lfu.55.1673243048633; 
 Sun, 08 Jan 2023 21:44:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 u14-20020a196a0e000000b004b575d239besm1431944lfu.237.2023.01.08.21.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:44:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: display/msm: gpu: add rbcpr clock
Date: Mon,  9 Jan 2023 07:44:07 +0200
Message-Id: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Describe the RBCPR clock used on msm8996 (A530), MSM8998 (A540) and
SDM630/660 (A508/A512).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index c5f49842dc7b..db8afc636576 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -149,6 +149,8 @@ allOf:
                 description: GPU 3D engine clock
               - const: rbbmtimer
                 description: GPU RBBM Timer for Adreno 5xx series
+              - const: rbcpr
+                description: GPU RB Core Power Reduction clock
           minItems: 2
           maxItems: 7
 
-- 
2.39.0

