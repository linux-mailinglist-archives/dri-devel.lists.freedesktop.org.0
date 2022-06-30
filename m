Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A71562CAE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1616310ED49;
	Fri,  1 Jul 2022 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD8011A28F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e28so21830283wra.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b+2KfJ+EbtiUw/VFlCJvwTsR648bOr42JoNq/qybfo0=;
 b=tlAlhjc6NZN7ne6vQQPlSmUWHBOWkq6YIolr+75AcP9IiMe7sRBNCo+XTzQUR1fXN0
 2bQlmeJCzRQ3xHciw1xCY6gxg9aJ71INftV391l3/TmYL4vsubg/eZxvAD5xyu4G4YGG
 /6oCIBcdOTRbWjJrif47hNyBPIFO6OOko2gxi4w1VvPq8+UeSx9ZeHqKVtWX3BrsDxkQ
 Bv3ENwd4eOHgqb9kPbTz6YgBXAlaAlqnpjy+PBCTw82ZBlvIkMiaa1ZvA9r4F9eZcvY8
 6OCh7JiR47yYqRfn/c1yK5SeURqJu8nWtfwuMHUbbZTJAiZi8ftu4z8rP/W5O/MKQ8n+
 jCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b+2KfJ+EbtiUw/VFlCJvwTsR648bOr42JoNq/qybfo0=;
 b=smwMgoXmbkm5OXg3NaJ4/U7qeUbbFZNaY+I++vbed1CLrQ6NOxOrVuzibXD8tDtUks
 bZeF7GLxuAidMyBRJCC0bw8o5Up28gSXIKjq7uNrvWzFxFNTOB+kJUXgy9IlJIE8XeI0
 3V/k9dLqpLCJI2QdQRRYWXbqRKeqkMTiLX4iPVmfAoMM/675vQKB1kBG0wv4JHkgxJcJ
 fqFaCCq1lAxBxbLEjzV/R+c8HvLpmKqvUPXy+nZUGW2WrzMPDChffvamNFel23nwKqWi
 r5nj5XbbjN5SI1Q1XyP81TG8eGOXfyrUbT5ZNZOoRnFOCih3CvVeW2x/vvpCr/eSn4XV
 uCsg==
X-Gm-Message-State: AJIora9sA2b79my3KzBN3zk4lXqpXvKjtLme+yf+G3eUan33aiAatyxL
 eTCfYOX4M/0NzBqpsYWTVpFa5A==
X-Google-Smtp-Source: AGRyM1tu763LSSFunvSobsS1rb3AceLNnzNP0wf4briumXSyFXIpk6oc7PQ8fjdRvuPu9CZqhod1rg==
X-Received: by 2002:a5d:6a81:0:b0:21d:3f7a:3 with SMTP id
 s1-20020a5d6a81000000b0021d3f7a0003mr1991415wru.300.1656590927998; 
 Thu, 30 Jun 2022 05:08:47 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:47 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 0/7] msm8916/msm8939 DSI controller and DSI PHY bindings fixes
Date: Thu, 30 Jun 2022 13:08:38 +0100
Message-Id: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes up a number of dtbs checks which are being flagged adding
in the msm8939 dtsi.

When converting from .txt to .yaml a number of the parameters for the older
msm8916 silicon were not transmitted into the yaml.

Adding in the msm8939 which is a near 1:1 copy of the msm8916 in terms of
dtsi triggers a rake of dtbs checks as a result.

Bryan O'Donoghue (7):
  dt-bindings: msm: dsi: Fix phy-name binding
  dt-bindings: msm: dsi: Fix operating-points-v2 constraint
  dt-bindings: msm: dsi: Fix power-domains constraint
  dt-bindings: msm: dsi: Add vdd* descriptions back in
  dt-bindings: msm: dsi: Fix clock declarations
  dt-bindings: msm: dsi: Add missing clocks to 28nm DSI PHY YAML
  dt-bindings: msm: dsi: Add missing qcom,dsi-phy-regulator-ldo-mode

 .../display/msm/dsi-controller-main.yaml      | 39 ++++++++++++++-----
 .../bindings/display/msm/dsi-phy-28nm.yaml    | 20 ++++++++++
 2 files changed, 49 insertions(+), 10 deletions(-)

-- 
2.36.1

