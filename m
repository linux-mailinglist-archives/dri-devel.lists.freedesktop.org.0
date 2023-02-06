Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1268C0B0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 15:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1892D10E404;
	Mon,  6 Feb 2023 14:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CD310E3F9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 14:57:13 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id hx15so34857392ejc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 06:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1ct+0Sro7EnXGsDjzq9X4UuMN/Rv5Rt1GCdZWWWtQ4=;
 b=g0lk6lQ9/5qDlN+jx+cIKAK+CzDdnGuY79fTWxVVVflZQYXH8iOFmI4KMOSOrIvhyB
 yvGuhqjex8kNCLXPbiLkRDL2D7Pdf9T8r2q2SilOM1VHQB/sYjT+WEhT340g/LZBcyEa
 98Zxsn4QZcvfL3KJGXgA5UGz0A9/r0gU+NOeJ1YWeyYRhD7kBdkLnjBmhTG/yi0jbDTR
 MV9bFXXpKsxbiKaZXHRzUWiUz3dO2Vadji/AGOZzxHcmsK5bl2Z7UbdVObYptduxl4Nf
 O9X/ICh1iLtn2b3dbyqxOTZcnbOuSBaXM60072rlPwt6zxl9Dzf3AUlHF0rVlKlmn+wN
 kOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1ct+0Sro7EnXGsDjzq9X4UuMN/Rv5Rt1GCdZWWWtQ4=;
 b=QGMIcj+IEEnrBG0s/8GOA/yPCTctmSRd7ZXx9XeKdavLUa83wCUcjx20TIuPDrPUB9
 rPXStoG6VOASBvO9AtDbVwPuwuFUNpWnP4rlL4SCttoh/0ugICFKLsoaWJP1Qx0Gk+OK
 Pv9u8GHFeZT4JJA4lkwvTAPdvWHcM/XwQkCL+SLemtjUmJQOJP8Q1S1qsn6DsfqY8UbD
 UHm18jhVaH7McdhQ7FhZnLwwHh1WPn9fYkFzn7qrTH1noZycwFSgLfkTvFj/5nUfWlFS
 xrqmOwvLE1gK16O0X50L3SUgO3Urtk1TFhPpT30R3U7HwEgdRgRj2WbBNOmT4DNiBj+2
 kMGA==
X-Gm-Message-State: AO0yUKXd9somcI0uBGE9D0qMN3Vd/WE8AYZeWitI6+SUxajkg1c6iI7m
 Dh7rul732QohiwL2pQ6yoYDbLQ==
X-Google-Smtp-Source: AK7set+fswQrgLJfUMmLNflu3azfuIvJJxV2viagzNwy/64d4QWg+EyABuN80ZeWFRLqMjPKz502HA==
X-Received: by 2002:a17:907:6d9c:b0:895:58be:957 with SMTP id
 sb28-20020a1709076d9c00b0089558be0957mr10435653ejc.2.1675695431555; 
 Mon, 06 Feb 2023 06:57:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:57:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 2/8] dt-bindings: power: qcom,
 rpmpd: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Date: Mon,  6 Feb 2023 16:57:01 +0200
Message-Id: <20230206145707.122937-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add define for another power saving state used on SM8350 for the GPU.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4a30d10e6b7d..1bf8e87ecd7e 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -211,6 +211,7 @@
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
 #define RPMH_REGULATOR_LEVEL_SVS_L1	192
-- 
2.39.1

