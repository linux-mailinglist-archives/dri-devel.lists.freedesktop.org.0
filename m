Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92593671278
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA2C10E674;
	Wed, 18 Jan 2023 04:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635110E677
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:58 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id az20so61170690ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtgeP4k9eFblzUy5A6cy5yXNyt7qM3146bzTga5tf9g=;
 b=xEc9iv6USW+GwYishRYCnYHaT95I76S8r+qCg4l+SQRdIcF4YzVTljA2BXCaHHr5w7
 RjanFD+HruPrulNzHGm6jxD3wb/KQ6RQWDE9gP+jD1VDYi3L9H22keCSTWQL8SrdxbPx
 7OuKfw9nU/lbnfGOcE7hOLkWeUaVyJhoNit59NWUPqpOpcUtCYyM9/m8txtj/MGRyWgN
 I+ZGy/nz2rKwJFcHPgbi7WXBY7Bbh7QpSnznvHQM2zXCkwqXkPkxaFLFVyCaECTEVguQ
 TQ6wFe+bQzYsjyt0LagbtrXRXmV3sKuWGe302tJQBAYumoRqwubYRl8CCuuSDsKeQE03
 whxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtgeP4k9eFblzUy5A6cy5yXNyt7qM3146bzTga5tf9g=;
 b=7athkXNknhb2en7j5SikzFxhIMf1aByf0R3IuX2A3mghm1hE986nm8DLCxjBA8l8v1
 V/aXxTHypoILqnPiWpyRqVq7hmbBGH3TakvRw76yeNcJfxNr8MoxPdjRcaVP5V9vOOnu
 9zCd3TRPP7ChZK2LvaSZT0XVEDMRAZ41hf/n9Xh8kmslskwbROR2XmzcZgTcewRNoYJk
 6X5Chb3ti3P+yqpVglbfayiweKelPQjo7ogQxWbII8ZwEP6BDqJkBxnhpi3V828+cv1X
 yUF3Y7SJpG0hBnN67XLO03c53aY6Dj94bcvEQiUIIaxgfOEUnKaJp9ueBwh/KXLYEm/M
 i4GA==
X-Gm-Message-State: AFqh2koYK3Xi/fnvyak+1onz0pjqDQBkq4KWOTAumurP1QkZjUxp5gZc
 +Y35BtH43mXM3wdd2i0P7WnKig==
X-Google-Smtp-Source: AMrXdXs2/KeT90CimT7QlYkAJfxMC1Ld/1+/BywbxaUMdnZRcYRQawlXyISysPQrfDFkWJVKZdEdGA==
X-Received: by 2002:a17:906:eb13:b0:869:236c:ac43 with SMTP id
 mb19-20020a170906eb1300b00869236cac43mr5678450ejb.32.1674015176664; 
 Tue, 17 Jan 2023 20:12:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 09/11] ARM: dts: qcom-msm8974: rename mdss node to
 display-subsystem
Date: Wed, 18 Jan 2023 06:12:41 +0200
Message-Id: <20230118041243.1720520-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdss node to generic name
'display-subsystem'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index ced62937165a..ec0c526d0483 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1556,7 +1556,7 @@ mmcc: clock-controller@fd8c0000 {
 				      "edp_vco_div";
 		};
 
-		mdss: mdss@fd900000 {
+		mdss: display-subsystem@fd900000 {
 			compatible = "qcom,mdss";
 			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
 			reg-names = "mdss_phys", "vbif_phys";
-- 
2.39.0

