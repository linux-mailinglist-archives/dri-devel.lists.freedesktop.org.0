Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919246711E1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D713010E660;
	Wed, 18 Jan 2023 03:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1E410E659
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:37 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v6so47802874edd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ec+3vW1T9VybCypq+CSoRlgfeIlNrQ3oQZEGbJKYIC4=;
 b=zAHvllqq6rUVY5iYfOhH98ZC7MciV6bFnK+rqLYh4bRRJQXU97ZrWMQxORJMwyznPi
 BB35MM6SMhAXFT/BohQWOmDJyX6Wh0biF3vMkgekxW/oC/EdJP0EKlCsM0FJvBnqIUvr
 c8eVa3Ox4/7XWmuo3r8A63TuqKO8a+dApNkNlcfPDlMTtJsAwMLsGiarsiF2XfyqW4rZ
 03znCWUFoih1cXMC1gYe9Eefmg2C5HEgcZQbRj1aiExFMRMblTkfDQqYcZHOERuX4gAs
 7eKGdESU8FVWwxNLdsTWmOvS/XjtJDAQ382auxASuIWO33gyE7nCmlLPuVPceRAm544D
 p8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ec+3vW1T9VybCypq+CSoRlgfeIlNrQ3oQZEGbJKYIC4=;
 b=IqG9XQFe5eR6LSKi699e1m0QO2trmWRO7qhfpT9Dl3MBokBQzsvdhz1wjEmga7PysE
 ugCVlx4V/O1KwoYXOcrYJj0u/N9yhAwBr3C4m/BDNz1BqN07I3czDxcRu6ym5Y078dx8
 0JHG0NhB+fGrEL08CI1g0KcpGSOZZU6NYabkLYBunmy6UV6qGippc/wgBXixeeGEhaDX
 fD5D9+amdPDniHbMmwjrJeDBa5V4ngZImmX6RC579Bp4FXdhpH89dH3tITww75JbHTKB
 hBxr6pn6Hsmm+ZtqxzhKX7IwlgINxjKMi3wQwXjwGjlXlYPk4qwXFf717CkFZ/k8sDFw
 X6mw==
X-Gm-Message-State: AFqh2kruyU5F1pzBaNHOMk3F1mAJkIw56euiTGD9ilT8yVrqSFpXt8df
 o9ziPTWqArUMuKLF6jBKj0ohI6zyDCOPcOG0
X-Google-Smtp-Source: AMrXdXu5gi5ru//W/fWSwPRe4S1umaY4zHYGJpQmH9GsUo17e2O3IClFpdFWvpSftRfWxpfcmdKzuQ==
X-Received: by 2002:a05:6402:2289:b0:498:f82c:7068 with SMTP id
 cw9-20020a056402228900b00498f82c7068mr4439994edb.35.1674012275649; 
 Tue, 17 Jan 2023 19:24:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main: remove
 #address/#size-cells
Date: Wed, 18 Jan 2023 05:24:29 +0200
Message-Id: <20230118032432.1716616-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
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

Stop mentioning #address-cells/#size-cells which are defined in
display/dsi-controller.yaml. Use unevaluatedProperties instead of
additionalProperties to allow skipping properties defined in other
schema files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml           | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 7c326f8927fc..b07bdddc1570 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -72,10 +72,6 @@ properties:
     deprecated: true
     const: dsi
 
-  "#address-cells": true
-
-  "#size-cells": true
-
   syscon-sfpb:
     description: A phandle to mmss_sfpb syscon node (only for DSIv2).
     $ref: "/schemas/types.yaml#/definitions/phandle"
@@ -357,7 +353,7 @@ allOf:
             - const: iface
             - const: bus
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.39.0

