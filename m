Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEA968C0B7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 15:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D9610E400;
	Mon,  6 Feb 2023 14:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D6810E400
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 14:57:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id mf7so34937837ejc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
 b=VT0DIb2218KDtV8LgUx4pLrKPUjw9ZaFe16Z7Em/3TwJGRh63ca6bVtA4lUQoDAwmc
 RMhElQT3TKKvJmnlOoiorjfI76//wbJtP3F3LdwX5Dw7eaFhCNhHIiuFS3ZHPzN7ykVo
 NmlXVHhTTwRkdshfWLBPhddHlNVmlqNc0L7ya+ohdj0Lo+17RCPyyOAkxaAqLt+mUY4Q
 w+jd9/fX4jeabLO2wf/nThycCl6Bvp2AwwGius4MLnU4BTNbXMlVwpXLMymakhgsINSN
 KQ17iVSnZFR8hc08EqXjujTYmUmG1hZNwOTp+TOR6p+U+C44m38PmdH5kkVZjlScljnJ
 pvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
 b=4ouWrOFc9FygasAiv2njfgSZa4jPeb21RfaXe7joCmvtVKmuM6IdfLgK6MshWE9I9G
 2u0vZq0XpdsYm+RgehLjGVBc3diYUILM+FZ56EP/G6GR6iRLwqFoeSGAgEkulEskSvmI
 QtXTNbFTSesVpO0uCPd1DeIPQ0AInb+OHpmRVU55FPaJQu1LZ7M9unpUGVPK026D6ppH
 yEswfhqdVtFIV2L+aiCrY2YLNJDeKk7WpS/j1Ie9i9Mdy5s4Ua1UVVIO0XGHfkDedS2z
 dwzct2zo7pb0FqSt1E7yY+zMLwEL9n1gcm+LR0BZO9+FbPAYWsioBTB0m3apZGtUUhAO
 53AA==
X-Gm-Message-State: AO0yUKV7sF9JgIYiEF8xzkQbNMiiPPkfOyx03PWut/B2pL3Try/KgIn2
 Ok/hg6pPOdWt0NTAYBESarMywg==
X-Google-Smtp-Source: AK7set+ld7Fvjne/Ke0hqBwYqqTXSGFZP0hAmU5HtemMLaDfL1KIGo8qZrRQ8W0ZVVuQb26Um7NGFg==
X-Received: by 2002:a17:906:3189:b0:883:ba98:204d with SMTP id
 9-20020a170906318900b00883ba98204dmr20445587ejy.65.1675695432717; 
 Mon, 06 Feb 2023 06:57:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:57:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 3/8] dt-bindings: display/msm/gmu: add Adreno 660 support
Date: Mon,  6 Feb 2023 16:57:02 +0200
Message-Id: <20230206145707.122937-4-dmitry.baryshkov@linaro.org>
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

Add Adreno A660 to the A635 clause to define all version-specific
properties. There is no need to add it to the top-level clause, since
top-level compatible uses pattern to define compatible strings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index ab14e81cb050..d5ce0dff4220 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -122,6 +122,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-635.0
+              - qcom,adreno-gmu-660.1
     then:
       properties:
         reg:
-- 
2.39.1

