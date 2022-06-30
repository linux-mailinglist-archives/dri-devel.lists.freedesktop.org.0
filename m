Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277295620D1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A5011A457;
	Thu, 30 Jun 2022 17:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627F111A41B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:06:19 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id c15so10982771ljr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 10:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=QpBTHQZXDMGexfOADK6O2iL7qtMi2Zus61qTujBKI+Q=;
 b=gW3ZM5/Zbr7t1EN5jVp7IXn4a2EfUbajov77NvtpSYYgyB1a+f/lVglfFaS+6iBlT/
 QEFWkHCx0q5P/7YMuZgyIJwzT3GGHSabYru+E21iSCbeW8RGD9lqCZZ2LQ6I1VL5LMzM
 EHZ5ygq5uzXa34hbg/NwB0ZSJhgYFpPpHyoJkYWNbHrLshhmWabVMC1odmr2wE4CL2xp
 XYDnejcpvbO04w/0hp7u/JskbAe7140Egc+CgSadhCaLiR/BsTR07N6DdH5OmX5ZhoL+
 fh44XYjOcQh4g6+5dOnjkB0723dqCqcqDhB3sNKHyrmm6C2PNKTk8SIQQghyddybme36
 f2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=QpBTHQZXDMGexfOADK6O2iL7qtMi2Zus61qTujBKI+Q=;
 b=CZ2V5+45vX9ZGszVBRMRjkjyIo9zTacVr8uscImku0MQLvDoIKvy5P+9vYm+8Y6dq1
 1t6fnaJNcSKVQaCq1pzRONAyDOuH8s4Ba7LnZW+JVWyCJM1E9+Me8MhYn44xnICrLPAf
 yjn8O3TItd18gn55aARsRL/881Usdj6NhnX5G0aHs8lI2qz+hrHF5g2ybPGk3tlYh0zk
 re6voHQNSCOYRAxll1nV1jHunC24xX+m62TRSJW0fggWIhz3cizN97iAB611xqM4oZU4
 zJ4q8BySkW5bSEttzBld6fACANHJriSds2HpNbBZtbvD3fTysvpd7TN+X/jf7uFIbU+p
 aMYw==
X-Gm-Message-State: AJIora9b0k4BajjfmSvrGXS5J/Z2mz0Vl3I4Kw11kwjBHwXyQF80U//v
 kjeSvcimkB0TKpDkIKBK6ArP/Q==
X-Google-Smtp-Source: AGRyM1uqgiNZ9lYcgZKkrgzls2b+nBJ7gGSEa6iALdiCqtLIWin6GL5efYhueySaeVhZWRRjUBtMzg==
X-Received: by 2002:a2e:83c7:0:b0:25b:c007:29e0 with SMTP id
 s7-20020a2e83c7000000b0025bc00729e0mr5731262ljh.378.1656608777692; 
 Thu, 30 Jun 2022 10:06:17 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210]) by smtp.gmail.com with ESMTPSA id
 d7-20020a05651221c700b0047255d2111csm3192989lft.75.2022.06.30.10.06.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 10:06:16 -0700 (PDT)
Date: Thu, 30 Jun 2022 20:06:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
Message-ID: <E0628E74-F03F-42ED-B21A-5024A704DCC8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On 30 June 2022 15:08:39 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>The driver doesn't care about the name of the phy in DTS=2E msm8916 has s=
ince
>2016 named the phy "dsi-phy" with later SoCs taking the name "dsi"=2E
>
>There's no reason to have a constraint on the name here, simply to have a
>name=2E Remove the redundant const in favour of maxItems: 1=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>---
> =2E=2E=2E/devicetree/bindings/display/msm/dsi-controller-main=2Eyaml    =
| 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index 880bfe930830c=2E=2E717a5d255ffe4 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -49,7 +49,7 @@ properties:
>     maxItems: 1
>=20
>   phy-names:
>-    const: dsi
>+    maxItems: 1
>=20
>   "#address-cells": true
>=20

--=20
With best wishes
Dmitry
