Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6FC636F42
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5136410E681;
	Thu, 24 Nov 2022 00:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF2110E66A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:07 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n7so204893wrr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tCUJCjq8zxDkfeJPGjWwU1cc4Wk9DUerQHc4fqret8=;
 b=x1l/HWq9fsM32a1Ni7NZJiVOc4jcc3tVMzxYf3aunGqOoAI9nIlj6dbaoaNcNgAA5h
 ictNhCgv2VVgmy13rgk8yyCkT4T4dQjB632s8ND1W1BZWrrz52kk230KUkSvO1ExPvYf
 ArU7EUjxILNOgiIbb3eEpTJIUW3YZkoVBphIOI8wESWjcVWH0kddpYZJSj86GOhFPpQD
 7UntJk/cWw1/husHveZHAhiAeL+IAsj8EzaPTPpq1RfU5j8W2Sr1ebVOqd9GRzElaumA
 L5aYfZgP8qngU1uloIj7EqOp+Q0fTIKznJXFtH0KRNe83LNQrbIJr68alK+2REbgTz2o
 qPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tCUJCjq8zxDkfeJPGjWwU1cc4Wk9DUerQHc4fqret8=;
 b=PzBx9dCX09q31BsJBeQJyTLZ7Uixa4vcCKwwrLbIAdVVf0sCDJj/fPHmbhewSQz/Us
 f3dUhJs7GpYLSrZhl1CnUDSNk0POPjAi1Pr+3Zd5AWmcV2ni+whNPYtt+qi7rMNHKouo
 Rmw1VKy6Tja7R8ZSsTv/GnLiN6QNP5r18iSInl8ndq6edMZiB6jvmf9p56FSKgNtZuDP
 stFO/Rej+TCohzZLUe5WtJS7cOsDpEoKXMSjDg+mvlszKY7jo2lcQVJl5AQ6RZ1d57Gz
 SSfJebg93M8atcqm8t4JWMSNXAoouUn16OB2GUkrxLieuHuPSvF2BGt+5eXWRTEXanWJ
 Fyow==
X-Gm-Message-State: ANoB5plxBOFIYGHtpm+FpCIXyeJi2tYe6JuUShuPZgNx7nDBcdG/Y/Yw
 BtUwXMJnI+ERUOHQO4ABieUp0g==
X-Google-Smtp-Source: AA0mqf5Nigw90XSlW8uMXI++F5BMgvcKeoXrByohUmBpZYHY768t7EWogcXwUHFeLF/J3Teot0s6og==
X-Received: by 2002:adf:f8d1:0:b0:241:d3e4:6517 with SMTP id
 f17-20020adff8d1000000b00241d3e46517mr11308540wrq.380.1669250885663; 
 Wed, 23 Nov 2022 16:48:05 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:05 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 01/18] dt-bindings: msm: dsi-controller-main: Fix
 operating-points-v2 constraint
Date: Thu, 24 Nov 2022 00:47:44 +0000
Message-Id: <20221124004801.361232-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 7782bff89afc7..27ebfd5ffb22f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -135,7 +135,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.38.1

