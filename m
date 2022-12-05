Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09C6436F0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 22:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB4710E2B0;
	Mon,  5 Dec 2022 21:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AD310E2B1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 21:34:20 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a19so15116818ljk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 13:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/AFtgz+lK9M2V4Cs5/9PoWBFJhdcyuHdw2Q3pWcGYM0=;
 b=YUevHO9XgqPvry6HSJ6/W2BJQQU25R4upN0Typd6FaqC5gRATvHgY7MXNV3I064Uit
 nFsS1oQIWZ3bcFOEW6RP4tJmb543mBunzrJK8QjQGHoK97Z2MLio0b4rznLjay2U+afj
 qFly6OL7t9m2GhCC4P35fJtgFIlVWHZNDMbCCDlzD7b9IbaX2rscEBxya/UMGCZaB/3w
 GInkZJ0435TBwAFZ8J1xMD60ZjO52UhcbdKENSnASGDa464v/GDfgTWMCd5VjEfcVZql
 W1Ky8ikqcdYSkWb8EGPrM+UV08V3XNFDa/1OWa93VsbsAn0buH6/OpKDGu3YNWUYmVfr
 tfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/AFtgz+lK9M2V4Cs5/9PoWBFJhdcyuHdw2Q3pWcGYM0=;
 b=4wdMfDxaWAuuGvOO7RVIJtchu1airY5bTWaxtWmhkoZre+BFIsWdWs/QKDMmST4azV
 hCFnRYAtalwZtP5d4ZdK1RNVNIkcXQrt9iyBGdseMn2Vh4oRae/4Uf9L9sDf4fOqovyp
 vXKcr6NHvNAaRUiUgwg9k4XPsFx5fDlcle2ne0PkJ6CPIGHzOI+Pn9z3ffrCaVkupINB
 AVUSEHzj9BJZcgfHOT1At2BppThegxScznIzpapYT/RzhI06c2WKcp9zKJem1EmoDmll
 Bh2W2a9zwLgJPlN8cIEDeltDn1JoxmHq29X/PoWIljrElXVcEXCmdLHnSzuWC0+jfZPA
 KNgw==
X-Gm-Message-State: ANoB5pmLgkepydD2rq5enqulltFE/rDBHNjpLE0aaa1TtO3hm96wd4an
 BjhMzCSPJup/jD6GXbLikZtDiA==
X-Google-Smtp-Source: AA0mqf4BfnB/i1w1SRHpcZzPmtxt7+I3WAaF8JW8L4rYmlZYdEqUFnQ4Z7gOet/Ue5qWPSJ4tfTtbA==
X-Received: by 2002:a2e:b4a3:0:b0:279:edbf:118c with SMTP id
 q3-20020a2eb4a3000000b00279edbf118cmr3085208ljm.425.1670276058362; 
 Mon, 05 Dec 2022 13:34:18 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 s8-20020a2eb628000000b002776eb5b1cesm1516828ljn.8.2022.12.05.13.34.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 13:34:18 -0800 (PST)
Date: Tue, 06 Dec 2022 00:34:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v8_2/5=5D_dt-bindings=3A_msm/dp=3A_ad?=
 =?US-ASCII?Q?d_data-lanes_and_link-frequencies_property?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1670267670-15832-3-git-send-email-quic_khsieh@quicinc.com>
References: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com>
 <1670267670-15832-3-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <5552E92A-2059-4D1E-AC88-3214D93D93E3@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5 December 2022 22:14:27 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc=
=2Ecom> wrote:
>Add both data-lanes and link-frequencies property into endpoint
>
>Changes in v7:
>-- split yaml out of dtsi patch
>-- link-frequencies from link rate to symbol rate
>-- deprecation of old data-lanes property
>
>Changes in v8:
>-- correct Bjorn mail address to kernel=2Eorg
>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>---
> =2E=2E=2E/bindings/display/msm/dp-controller=2Eyaml        | 22 ++++++++=
++++++++------
> 1 file changed, 16 insertions(+), 6 deletions(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller=
=2Eyaml b/Documentation/devicetree/bindings/display/msm/dp-controller=2Eyam=
l
>index f2515af=2E=2E13d2c3c 100644
>--- a/Documentation/devicetree/bindings/display/msm/dp-controller=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dp-controller=2Eyaml
>@@ -79,12 +79,6 @@ properties:
>   aux-bus:
>     $ref: /schemas/display/dp-aux-bus=2Eyaml#
>=20
>-  data-lanes:
>-    $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>-    minItems: 1
>-    maxItems: 4
>-    items:
>-      maximum: 3

These properties can still be used, e=2Eg=2E Bjorn is submitting patches w=
ith the old property=2E I think this should be marked with deprecated: true=
 instead of removal=2E

>=20
>   "#sound-dai-cells":
>     const: 0
>@@ -105,6 +99,19 @@ properties:
>         $ref: /schemas/graph=2Eyaml#/properties/port
>         description: Output endpoint of the controller
>=20
>+        properties:
>+          endpoint:
>+            $ref: /schemas/media/video-interfaces=2Eyaml#
>+
>+          properties:
>+            data-lanes:
>+              $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>+
>+            link-frequencies:
>+              $ref: /schemas/types=2Eyaml#/definitions/uint64-array
>+
>+          additionalProperties: false
>+
> required:
>   - compatible
>   - reg
>@@ -193,6 +200,9 @@ examples:
>                 reg =3D <1>;
>                 endpoint {
>                     remote-endpoint =3D <&typec>;
>+                    data-lanes =3D <1 2>;
>+                    link-frequencies =3D /bits/ 64 <1620000000 270000000=
0
>+                                                  5400000000 8100000000>=
;
>                 };
>             };
>         };

--=20
With best wishes
Dmitry
