Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83604542FBF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC2910FADC;
	Wed,  8 Jun 2022 12:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D495710FADC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id u23so32923819lfc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHJ84TvATipBDD8bX8DKVRbAMxK57cbNX0Qh0OSz2u4=;
 b=p6sUTGw1Hbrk+FTOYNKUsrbBHLd1vviISuy2ymTJwJ2qaErzIhLpNC2ahvsUQXzYck
 lIUrtgE6eQksSaKS5txREoyveTcvE7qormHK1L1ZhmBgOkRGP7fFCgHiafjzTHxR4UVO
 ofcSHAz4Dl61mJ/Pr9VU9usdQWVyB+AuScfCqT+jYBNUddBww/4XwO6KbYQETYAWNm21
 sn3OCd1ETBZm+sGIlOmTNd1EELu0gq6UTXu65MmUvblA+Xi/nBn79ex9NJtC4yUnktTJ
 t/PO+maBOwGD6M6l1yrFsMEdH86UTuQ+dmcoLh4SBnmBI4NrbYrTkjSpPZKJ8TDR2fB5
 +zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHJ84TvATipBDD8bX8DKVRbAMxK57cbNX0Qh0OSz2u4=;
 b=LBvydDjJzgAc3PeDwyPYWv8j/nOGMx5Pn+wNnZrUIGurss9gbP1aWa1ufdGZUnJlmn
 Q9m0+37WcHPgkrDHqKztopEWqaDOU2vDLC+VJMtjcpdsZkVdKlimr7ZPL0F5cG/AdS0k
 na+ZtyT7LK91d1K7VjFTdH5D6wfYf2uGn/X/NkmRiCkG8s17kE5bYb/qy1oDQrM1jZ/l
 4jQztiq6u7fO1FRVpKhjyEZWBYqrgNmtG/OlZPCFH5rO6ZKrAab9jmrr4s8yWGFwDb4t
 /LmqquTw6w2DAXRJKb4iJ2ptp3OcCcpB8TjshhTDxw0/e1NBaT+AIvNt+tX/rN9O3HnQ
 hIYw==
X-Gm-Message-State: AOAM532LK6e5HJT0eDb7Gjzacpo38FpNeQ2sZAg2Tf222OGndpry+w4r
 SlfxQ7xj1KD9LgvhVPo8ujiLJQ==
X-Google-Smtp-Source: ABdhPJx81PXvshf1eliVIiEm3C5RGBqIuZcu0SRNR44xkx0s4ZOpmtlVMIYi/PKJGj2uvv6cQyo72w==
X-Received: by 2002:a19:4f1e:0:b0:479:278:8d24 with SMTP id
 d30-20020a194f1e000000b0047902788d24mr21280946lfb.370.1654690045070; 
 Wed, 08 Jun 2022 05:07:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 00/12] drm/msm/hdmi: YAML-ify schema and cleanup some
 platform properties
Date: Wed,  8 Jun 2022 15:07:11 +0300
Message-Id: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

As agreed with David, this is a continuation of his work started at [1].
I didn't pick up his R-b tag for the first patch, since patch has been
heavily modified.

Changes since v1:
- Dropped quotes in $id/$schema
- Sorted out compat strings alphabetically
- Removed obvious descriptions
- Removed undocumented qcom,hdmi-tx-ddc-* properties
- Switched to additionalProperties
- Fixed IRQ and GPIO flags in the schema example
- Added 8084 and 8660 variants to qcom,hdmi-phy-other.yaml conditional

- Marked hdmi-mux-supply as deprecated (and dropped it from
  apq8064-ifc6410.dtsi)
- Reused 8960 regulator/clock configs for 8x60 (verified against msm-3.4
  kernel)

Changes since his patches:
HDMI schema:
- Dropped generic pinctrl properties
- Dropped data-lanes property, which is not supported by the HDMI driver
- Switched to unevaluatedProperties
- Moved clocks/regulators/supplies to condition clauses
- Specified phy-names as used by existing DT files
- Dropped #phy-cells
- Dropped power-domains property (which is not used by the device trees)
- Marked old GPIO properties as deprecated (in a separate patch)

HDMI PHY schema:
- Split into QMP (msm8996) and non-QMP (other) PHY schemas
- Added proper clocks/clock-names/reg/reg-names descriptions

The rest of the patches consist of the new work. They further cleanup
the platform configs, remove unused supplies, etc.

[1]: https://patchwork.freedesktop.org/series/98353/


Dmitry Baryshkov (12):
  dt-bindings: display/msm: hdmi: split and convert to yaml
  dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
  dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
  arm: dts: qcom: apq8064-ifc6410: drop hdmi-mux-supply
  drm/msm/hdmi: drop the hdmi-mux support
  drm/msm/hdmi: drop unused GPIO support
  drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
  drm/msm/hdmi: drop empty 'none' regulator lists
  drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
  drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
  drm/msm/hdmi: reuse MSM8960's config for MSM8660
  drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements

 .../devicetree/bindings/display/msm/hdmi.txt  |  99 --------
 .../devicetree/bindings/display/msm/hdmi.yaml | 234 ++++++++++++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 103 ++++++++
 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       |  83 +++++++
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts    |   1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c               | 104 ++------
 drivers/gpu/drm/msm/hdmi/hdmi.h               |  13 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c           |  62 +----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c      |  12 +
 9 files changed, 454 insertions(+), 257 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml

-- 
2.35.1

