Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F46711E4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F5410E665;
	Wed, 18 Jan 2023 03:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB4010E65C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:38 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id 18so47851694edw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gfBgFMCglJwiGtp0Su/fVc++xtqk3QZfhniXX5gUFE=;
 b=OdTpnb3J63Ut9HB0AGI5ycBVBTpKNSIqYi3xKa04tWIpj22ol6hTPj/kXEY+MxM95A
 SXp8ewlzRqKXO6XDYEstLqNPZnh+ISACHqGK284MEex24omx1HVsd/oXGs0FHm92Hqx0
 8VIBwRvpmdd6Ws1LOLkSaOibqn5oXYbFnKcfEHn8Wj5uBpN2C/8rZvgZ+LHPwyR0URBs
 LuttA0yFxGOx/Ub11VOszVgRvcMPJrx5KlzAUHAWvb350weh3Bs9FwlG+aho58Ljoc8W
 UM0vlW2vCu8HjfQ8RxWAVyER4jdB6xPqHExWv3LjZAvSFX1VJyhRd3gilZkmE39z1fTF
 Z3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gfBgFMCglJwiGtp0Su/fVc++xtqk3QZfhniXX5gUFE=;
 b=pJVhKcd4eXzkOFGFRA5Y8oeXegkq4fPADMzzm7KglQQ5Mjo8yY7jSkwmlKunoOOURY
 WjeoD5u2lw7drBbtcEq1EjJYw3AZkaY+V5SURvlzqizzrEWQZN+yTic5e7ZWSSwtIZxO
 PRzYJg/8kcpecwnvHi2H9JvyDBOtWQxZJjD7TZcyX1nFlZBVNBtVGKfHn/ceTbi5wnnq
 D6W6Lme5Be9mv/E7hEptK9fUkq9ZBFcy0o8OeNTAy/rDUD4souKtnkx24UzUkW096XL9
 pH7K+955io80Jbcj0Lg/iec4HUptLVUpPfoxjttr985a42fckYhwF9TsqJw5chmV56Gb
 xcjQ==
X-Gm-Message-State: AFqh2kqKfvdvKBoHaEYzIcPBlxb2gSubN1HBjjeArxRb27YP9KvHUWwP
 lCTtEmfgVBsHSmHhFqLCJK2Sh4gkv4twD6t7
X-Google-Smtp-Source: AMrXdXt8oddItr2P36DuY7+xZsptoMdQIh0DJJedzDOGjW814zXo1noWgpEsw6tkZ59eMYnQ0Yvgqw==
X-Received: by 2002:aa7:d887:0:b0:499:1ed2:6461 with SMTP id
 u7-20020aa7d887000000b004991ed26461mr5387548edq.17.1674012277888; 
 Tue, 17 Jan 2023 19:24:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/4] dt-bindings: display/msm: dsi-controller-main: allow
 using fewer lanes
Date: Wed, 18 Jan 2023 05:24:31 +0200
Message-Id: <20230118032432.1716616-4-dmitry.baryshkov@linaro.org>
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

Some platforms might use less than full 4 lanes DSI interface. Allow
using any amount of lanes starting from 1 up to 4.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 357036470b1f..dc318762ef7a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -123,7 +123,7 @@ properties:
             properties:
               data-lanes:
                 maxItems: 4
-                minItems: 4
+                minItems: 1
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
@@ -139,7 +139,7 @@ properties:
             properties:
               data-lanes:
                 maxItems: 4
-                minItems: 4
+                minItems: 1
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
-- 
2.39.0

