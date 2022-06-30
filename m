Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04A56210F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D248E11B12C;
	Thu, 30 Jun 2022 17:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376CB11B12C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:18:17 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z13so34816677lfj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=UpQMYfTCkZFCElPUIkQZ0t3q6QcWT/d12W6Q6Gj/wdk=;
 b=KDSjQztjqQQrjMn0kmMzCWNHZ2HRm6CDDz8fgbDsvk2e1kTyNN6fgjbKHXUCJRasiq
 P7AluDq9/SMEIfVagtwgIOt6CZQqf6huCYPPtX8r0y7Bhu2SeaIGC51SHT7YRjcSqSpP
 hVmR4rfT/hupzC2yhpiCZ2FWyRuxEZ/8/OnrtqEIqZ5IROcoID/qaBGSdVnNa32VB1vi
 On26XhRD+v11DJdWgwAKXq4i41DW65lZYOxlRT33Tx0NnHZiTP5aD7I8wxJ3cM/Ib4al
 OUZYFx9ccLhB6znssJBxfCxnUOfl/pkK0uksS61SGi7A3mwZQRTbJfr13SL/0ZA8qre6
 T3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=UpQMYfTCkZFCElPUIkQZ0t3q6QcWT/d12W6Q6Gj/wdk=;
 b=sIi5Qudo6VTb5qflwHEgpn/U2Q7bhk+lc75LY65oHwwqEB4v8Tv4n2dBRb/f6rrbdA
 j7rO3uiT5a1KHRnNUBXbanJmSIBp7PXhFG6GvFvAQv1Smpqe8sv7wkx8ApOhHMtEv2I8
 hfk3nThow9XGxPsxY2EEOUzIkA0WEpgP7oxrWiDun3CdY0vjipT3BUBYhIJGM6gL4HOG
 pxNO2d4zjcvYYj7BINoIVPCLFU58LrmcPhZhCsub8SmgiGqpDFgC0aRW0C+hiWY880wQ
 BnLPs9swSBBz1RArtBJn920fmC840LAerbLlyIo+0Rw86/lu2Lu9hB+04WlxgKBitUl9
 At6w==
X-Gm-Message-State: AJIora+v4Lck8JKM0ocVYBUcMm3ibaKiaLq1LMDAWxxpOs6ryB9pO78v
 AvVmvX9iSicpAbUQWJRsneCf0g==
X-Google-Smtp-Source: AGRyM1tQzKJXYNFt5hP0RUwkl5L6brdWePRXelfIltOSkZTl37nvLKOgiaGQjx1/xBLyBrtXukcB5A==
X-Received: by 2002:a05:6512:2390:b0:481:6f3:2de7 with SMTP id
 c16-20020a056512239000b0048106f32de7mr6343987lfv.497.1656609495560; 
 Thu, 30 Jun 2022 10:18:15 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210]) by smtp.gmail.com with ESMTPSA id
 a8-20020a2eb548000000b0025a97366430sm2679838ljn.68.2022.06.30.10.18.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 10:18:14 -0700 (PDT)
Date: Thu, 30 Jun 2022 20:15:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains constraint
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
Message-ID: <11097A0A-862E-4600-ABF4-34BD36CFB6F3@linaro.org>
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



On 30 June 2022 15:08:41 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>The existing msm8916=2Edtsi does not depend on nor require power-domains=
=2E
>Drop from the list of required=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>


Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>---
> =2E=2E=2E/devicetree/bindings/display/msm/dsi-controller-main=2Eyaml    =
 | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index 101adec8d9152=2E=2E91324f0828448 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -136,7 +136,6 @@ required:
>   - phy-names
>   - assigned-clocks
>   - assigned-clock-parents
>-  - power-domains
>   - ports
>=20
> additionalProperties: false

--=20
With best wishes
Dmitry
