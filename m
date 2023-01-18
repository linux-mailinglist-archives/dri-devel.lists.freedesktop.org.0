Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DDF6711E2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1257B10E664;
	Wed, 18 Jan 2023 03:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D32C10E659
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:40 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id kt14so21206196ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CVQKGFNAlYAjUpoXQgv1oLPkAX+tyEdhblxpqFV4cw=;
 b=SDPgSkODr61lQewXQXI9MyT/fdS8sLKxVe8zbDt480jNYNViWZKlB66TQ50+RHpObd
 aeYljotojqgrgkvZlwwbJl/6Sckkt8wFAAhfvYY4gMK/CQWUidj76qIl0ByCh5lmVn5G
 KrDRo8cqO8Bwlynja54VfKNFRq+WfFcB1HW/FwgQ2qniA4JxP4kFH4zlewRyLcHM6NRn
 qPM1y8jkksW9f2tpT0hZLivrX4bYFKfZlt4DP/BSA7bkFXdauJsAx71pW+MdpIJusJ7v
 pZPSTjo99Uz4hqVaIUTnUvxkJ53TMTsGQYV/enMc+qyb1ez5A8vFmb1TObju1Mee0FYS
 YJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CVQKGFNAlYAjUpoXQgv1oLPkAX+tyEdhblxpqFV4cw=;
 b=RvZKkQhWOekxj5Uunr0sY9/57bq0ub9pOkonMVuPRoev8X9O+CulQLAi7HnYuf43Xs
 xLVX1DWQu+zgN+lY24BG2r0dt0Yu+UshmFOSmI1G3nEtfA+X5sly/irzTtYdRzJD+YeX
 UuGOfmaazob2EIqnHoX1XKCRUAzCGcqT8PwlqUsywIMgXvVWPcn+CnMoDkmj7AGzgB6W
 9urD1TrkyRS5Fxlin9vJui395YWYqrSgUqV0oJa4Gi9QEOFErkwYNX119MEKAfK9hALf
 MOdubesaOji4n9cgGznpprYWpPDpMzdkRKHhoXlmZ7JmE0QJPkZRm579RcIFZRNILiYf
 R7mQ==
X-Gm-Message-State: AFqh2koJDZI5CmQJQ/R85+ElVAbvoQFEHs6YVINxJrrJI/oXdV8ZtncA
 /EVtzTsCF9O8YvcGIbAvND8JUw==
X-Google-Smtp-Source: AMrXdXt03VdBtNqUkusVgtXrGcDHG8DymvlEvlG/t1HO+TD2pWZa0lVglqyym5GI9849sj0aYeM9Og==
X-Received: by 2002:a17:906:7116:b0:78d:f454:ba46 with SMTP id
 x22-20020a170906711600b0078df454ba46mr1383522ejj.69.1674012279005; 
 Tue, 17 Jan 2023 19:24:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/4] dt-binbings: display/msm: dsi-controller-main: add
 missing supplies
Date: Wed, 18 Jan 2023 05:24:32 +0200
Message-Id: <20230118032432.1716616-5-dmitry.baryshkov@linaro.org>
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

Describe DSI supplies used on apq8064 (vdda-supply) and msm8994/96
(vcca-supply).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dc318762ef7a..31d389249c1d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -147,6 +147,14 @@ properties:
       - port@0
       - port@1
 
+  avdd-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vcca-supply:
+    description:
+      Phandle to vdd regulator device node
+
   vdd-supply:
     description:
       VDD regulator
-- 
2.39.0

