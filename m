Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D7D562119
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B5011B192;
	Thu, 30 Jun 2022 17:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3648E11B192
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:18:24 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b23so23961496ljh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=p+MC8dZLXIrERN6EMKEuoKgZGT7k1itKEIo1H3PViBE=;
 b=lyTVGZFiwZJPq5wuSCqTGoizXJ9avR8a6qsmAVGVEzrwqjjWzSU4LEQ6LYYRg1azR5
 Hwf3BZHNw6z+tZQNR5nACDJwEkedHXwT2ep4lYgxt4YXT26/j9GvKSrhXfT0tIeHe3P3
 PidtEbYCddr/wd9enPtBFe2FR18Kdfz1y6sqslB45EsdZrvMbt7f0T199FvYfWljetWQ
 NTDrsz/U1K6wYyIgmA11sEDKi0WpCJOaa8ph7Q+K1QI20YxW77Q/9rHb5g6AZSvOeSKO
 OmxsxyPpKJCzHukhbhrhJlVV6qwBkV2ddb7Uau7L9gaQ2YB9Fv+KT9g2hRn8CK0SxZSX
 x9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=p+MC8dZLXIrERN6EMKEuoKgZGT7k1itKEIo1H3PViBE=;
 b=fQT898+yNaqNR6afO4ULs91SNzA6KKpwXPfb8ShBgYz493B3XXb2kMFwNp7eDDzFRw
 ZLuRdT9hV1bHw6EXIyQhHbI1xDETwZi4igY5TDKo5Q9Pgh5+wr5Wwlogcx4evqxCJy+t
 oUJ+m8QSokVeCCsWH1eoAtHkBV8++gaVsOESYpLdt1mxzhIjBIVXogTHi03ROg7eu+Fo
 MZS2RvpaWLW1DndDC+Vxs7aRwaCci1un8xIK26X26aXvENgDgBvvrseWxodxDbBMsJ8n
 LpBHYUQW8e6EI6dwn1YrbLlAXpdZKi+vpf1YI2wGLqfHfSM1V/H3tV0zJWdW3Sj8WFp7
 eGLw==
X-Gm-Message-State: AJIora8yEUGQx611iHxq0HKPDbXMIyb5PkTE3jjXyLYPrIz/oSlw/lZi
 Q5lnCokm0pOwHftdGzmIGfqqug==
X-Google-Smtp-Source: AGRyM1v1g8fAyFtEBbGG/KyBWA9/U06AHFGsRQFMCh3W++tYPsmXQxDhYCvVjVLts8SIzzEg6qKodw==
X-Received: by 2002:a2e:9f12:0:b0:25b:ad89:80e8 with SMTP id
 u18-20020a2e9f12000000b0025bad8980e8mr5371518ljk.145.1656609502443; 
 Thu, 30 Jun 2022 10:18:22 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05651203e400b0047a0bf9540asm3191312lfq.213.2022.06.30.10.18.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 10:18:21 -0700 (PDT)
Date: Thu, 30 Jun 2022 20:16:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 4/7] dt-bindings: msm: dsi: Add vdd* descriptions back in
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
Message-ID: <9BCE52A8-E26D-43A0-86D2-90DFE6CB6C62@linaro.org>
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



On 30 June 2022 15:08:42 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>When converting from =2Etxt to =2Eyaml we didn't include descriptions for=
 the
>existing regulator supplies=2E
>
>- vdd
>- vdda
>- vddio
>
>Add those descriptions into the yaml now as they were prior to the
>conversion=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>
>---
> =2E=2E=2E/bindings/display/msm/dsi-controller-main=2Eyaml    | 12 ++++++=
++++++
> 1 file changed, 12 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index 91324f0828448=2E=2Efd9d472437853 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -125,6 +125,18 @@ properties:
>       - port@0
>       - port@1
>=20
>+  vdd-supply:
>+    description:
>+      Phandle to vdd regulator device node
>+
>+  vddio-supply:
>+    description:
>+      Phandle to vdd regulator device node
>+
>+  vdda-supply:
>+    description:
>+      Phandle to vdd regulator device node


All three descriptions are the same=2E This looks like a c&p issue

>+
> required:
>   - compatible
>   - reg

--=20
With best wishes
Dmitry
