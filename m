Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B133181B37A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 11:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA17010E66B;
	Thu, 21 Dec 2023 10:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B8710E68A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 10:25:09 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e593c756dso786426e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 02:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703154307; x=1703759107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pYNLBDFWO3LrdFkIMvJ8nxiptH8Derg0mKqbJmtxv8s=;
 b=E7AcLiGLoIQi5+KJF2kpFY+P3AtRoR3rWtYVtlzPB2McEyQqHJ77IFN1GUMli+mQgD
 VZEUoAYd9UysqOhDB8+3+DXKD60OHsAoZSeza9uch8FHlCKS4RWoFkhrhOXjHTiEzViN
 lIOKNB4b5bw97XZLlO1e360pHfZ8Dz/aj10fRVHpKshM0G+HBGef9YIecjDun4W2nqav
 PAcGrFtFfgGkesqdX88elDaPA2THsY9T8j3aw4+2RD4IVS8XOpq6Hg7TAfMPIZQzZBQ4
 9/FsSpJbSts31+yy+kuqv9NebE9kRfHwVi/uOzSgarQJmctAmTxJ1G89X+ooJnBOhTd6
 wMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703154307; x=1703759107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pYNLBDFWO3LrdFkIMvJ8nxiptH8Derg0mKqbJmtxv8s=;
 b=p3hO0DcqEGejHxcEjnixVOBKNsnu0ZkoQs77RfHGXwFfYZjrglsK6bFZ14G5hOtu0Y
 voH226Nd3R2uZXAQrKJz95lqHprFigeI25KXV6o23iAPkGQVKY7oGps38JF0xhUpZJoD
 0rBFuBOCPck4SErRvOl0vS+RhMWzdA1PKhwLy1Ffj3tG6N2XF61d+zw7fN/JFegxV/BR
 Lsq0IDorQHHSeLvSwG0t3zsH5rTXe0wNLyknCX9QpNVsnIghtIn0B6DzYYFEUl5+MLdQ
 awDuOBk+POWh7yZA+srI3Wgm6ja6oWq6u70qngUVJ+IhgzK8VFgxe7Mu/tHBtqOrSEi4
 q0qg==
X-Gm-Message-State: AOJu0YyWBfnjy8WngA4EACTGuy7kGOLpxxibowcWkHbvI8t80ydHQhEn
 ERWtPwGcERZpqDUl3oXJ3WO8hg==
X-Google-Smtp-Source: AGHT+IH6pMrLYwHqjlp1850CLT8V4kczgmX00VnjUzgg0aKA4yDbM+awaOvHnZsumP3WdOAsyEN9Dg==
X-Received: by 2002:a05:6512:238e:b0:50e:4c33:1266 with SMTP id
 c14-20020a056512238e00b0050e4c331266mr2146675lfv.72.1703154307282; 
 Thu, 21 Dec 2023 02:25:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a056512359a00b0050aaae62dbdsm231671lfr.62.2023.12.21.02.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:25:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [RFC PATCH 0/2] dt-bindings: display: msm: correct schema filenames
Date: Thu, 21 Dec 2023 12:25:04 +0200
Message-Id: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-phy@lists.infradead.org,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During the email discussion Aiqun Yu (Maria) pointed out that the file
names for some of the MSM display schema files might not be obvious.
Indeed they do not fully follow the established practice of matching the
file name and one of compat strings.

Move DSI PHY schemas to the PHY subdir (renaming them meanwhile) and
rename remaining schema files.

Note, I have intentinally left dpu-common.yaml and mdss-common.yaml
untouched, they describe common properties for a family of devices.

Also I have left dp-controller.yaml intact. I could not come up with a
good enough file name. Suggestions for this file are appreciated.

Dmitry Baryshkov (2):
  dt-bindings: display: msm: move DSI PHY schema to bindings/phy
  dt-bindings: display: msm: mass-rename files

 .../bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml}   | 2 +-
 .../bindings/display/msm/{gpu.yaml => qcom,adreno.yaml}       | 2 +-
 .../bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml}     | 2 +-
 .../bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml}        | 2 +-
 .../msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml} | 2 +-
 .../msm/dsi-phy-10nm.yaml => phy/qcom,dsi-phy-10nm.yaml}      | 4 ++--
 .../msm/dsi-phy-14nm.yaml => phy/qcom,dsi-phy-14nm.yaml}      | 4 ++--
 .../msm/dsi-phy-20nm.yaml => phy/qcom,dsi-phy-20nm.yaml}      | 4 ++--
 .../msm/dsi-phy-28nm.yaml => phy/qcom,dsi-phy-28nm.yaml}      | 4 ++--
 .../msm/dsi-phy-7nm.yaml => phy/qcom,dsi-phy-7nm.yaml}        | 4 ++--
 .../msm/dsi-phy-common.yaml => phy/qcom,dsi-phy-common.yaml}  | 2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)
 rename Documentation/devicetree/bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml} (99%)
 rename Documentation/devicetree/bindings/display/msm/{gpu.yaml => qcom,adreno.yaml} (99%)
 rename Documentation/devicetree/bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml} (98%)
 rename Documentation/devicetree/bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml} (97%)
 rename Documentation/devicetree/bindings/display/msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml} (99%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-10nm.yaml => phy/qcom,dsi-phy-10nm.yaml} (96%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-14nm.yaml => phy/qcom,dsi-phy-14nm.yaml} (94%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-20nm.yaml => phy/qcom,dsi-phy-20nm.yaml} (93%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-28nm.yaml => phy/qcom,dsi-phy-28nm.yaml} (94%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-7nm.yaml => phy/qcom,dsi-phy-7nm.yaml} (94%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-common.yaml => phy/qcom,dsi-phy-common.yaml} (90%)

-- 
2.39.2

