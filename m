Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3216D661B97
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 01:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9514A10E234;
	Mon,  9 Jan 2023 00:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D814B10E229
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 00:38:22 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id g13so10635941lfv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 16:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGJEz+3MmaHxEXAiV7clxhuQeLLp5nReizyyEldJfbY=;
 b=WSTVYuuPoAuJOGdQph3kfnYWipMLSmMWNS+WYmdpTUOEmn5pPUhh9nNcnS1efEkdE/
 x8F627H5jfYqXPCkawGZLPAr5M71OhOgkdgCsGdVBO2fgcn8r+lPFWf7fK7L4bwXF6p6
 Zezq1PKUClYDM8U4p+e+oFBGOKeBeWvi+5ehYI3WCb+Flvnk0slu3TzjKN7L0Z59/wmt
 sIziQuIlHA9i2G0zAuuRo/e+zf7pWa6ObRjCNDbR493i4NPSe3Wu3nlqttWx7empA1Xs
 dkBcEfdQZDn0Btnywe+ZXPmgGkLPahBihbLYdY2SJ5leJmagJzcUVfvk9k+ac7UZh6Rn
 JIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGJEz+3MmaHxEXAiV7clxhuQeLLp5nReizyyEldJfbY=;
 b=ZTCGrd9cwGSVef9XiMdLLlppq/PWUZl6M5F20+2zVJwPGNTFxaQyr2nQVTuPXtU2fk
 xIGAcTqzkO+cB38cso1KFti7D10P5lJVNUMlSqZ/wk8OmQWlx9h0uZQvxYdUV29QQsV6
 Ljke8EwnTIbyvSuY4PFE3UcU/eGDvDrV/zh0NDwoS7SsQtu+JkV+nVVEREJV6f2MhLVm
 FhiW4YjKzIxbH5KiptEEHmSG20wf1O5WPGTlrCfAaem1NQnPqu/iaGJTyEW2FbR7kZgE
 zwu8j5fQ8zgq3Ufr0eJgYzDFu7ZJcNpGhilkGL0GkHhV4fDVeQlcl3kGLkq5mtcSJuDr
 qX8w==
X-Gm-Message-State: AFqh2koPJmmLnCME4wH8Mtk0i762HzTU7VoCPNvrpys3/dpLtNFgxFyj
 4eC3CjO1PCapKODMBzm+PcwUxg==
X-Google-Smtp-Source: AMrXdXvlxb4EFZ072+msFp0BZ4dz+pfleCfeN6prAx0jUGEHgXIzupqxHMlHuRAsBi9MgmaVLWbBNg==
X-Received: by 2002:a05:6512:131d:b0:4cb:c3:9363 with SMTP id
 x29-20020a056512131d00b004cb00c39363mr17078413lfu.11.1673224701119; 
 Sun, 08 Jan 2023 16:38:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v4-20020a056512348400b004b58fadba35sm1297469lfr.296.2023.01.08.16.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 16:38:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 0/4] 
Date: Mon,  9 Jan 2023 02:38:15 +0200
Message-Id: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
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

This patch concludes the conversion of display/msm schema from txt files
to YAML format.

The per-SoC compat (new addition) is required to ease migrating platform
support between mdp5 and dpu drivers.

Changes since v2:
- Fix MSM8998 compatible list: "qcom,msm8998-dpu", "msm,mdp5" to allow
  handling this device by either of the drivers.

Changes since v1:
- Renamed mdp@ to display-controller@ in the example (Krzysztof)
- Extended ports description to mention possible ports (Krzysztof)
- Fixed ports@ regexp to limit to just four ports (Krzysztof)
- Included patches adding per-SoC compat strings to the schema and to
  dtsi files.

Dmitry Baryshkov (4):
  dt-bindings: display/msm: convert MDP5 schema to YAML format
  dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
  ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
  arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes

 .../devicetree/bindings/display/msm/mdp5.txt  | 132 ---------------
 .../bindings/display/msm/qcom,mdp5.yaml       | 154 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   2 +
 7 files changed, 160 insertions(+), 136 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.39.0

