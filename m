Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD7A86E7C8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 18:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FF610E11D;
	Fri,  1 Mar 2024 17:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LO6rbU5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D25A10E094
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 17:52:49 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso661163866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 09:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709315568; x=1709920368; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BgknfKXa1rmDkpK0kJohefljfX90MMnzKKOyQbPtzxM=;
 b=LO6rbU5Tg5tJbUCMyxIalWXpOoHCs3lVTyf+8u1GZ4BQjBom/W2HZwTdzOTG84Pxmz
 ANKVqoZJPLeivrP9+rXZrMboULLmOz7a5t29P6p1PRbVSTI1EJJyMzsFvlXxHZB6xdoH
 G9OTqK8vTzMqxUFULjWBL0xIyVNIV1dKbmBeCxRYkCsROKyTlLFXgf5XLVcWp9TZsBaz
 lUVMV/v4fWty3ysvku+GSGJBA2wxWXYiu7rEFhi8wNE107FKz6Rm9XRLzzTuJ8l0dOSw
 frpMz8Pu1qfvg9oq1P5p8M8vNzrK9qjgsXgm8W5NXOBf4xtL6InqNxGqZX8erAcWwvm0
 jRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709315568; x=1709920368;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BgknfKXa1rmDkpK0kJohefljfX90MMnzKKOyQbPtzxM=;
 b=urqgPPgtVVDnmxreIBpQKpYU6/+r8oSTp2JaOl4pYOJ3OInGdJOekC7ySW33TA4OCu
 WguHIfgv+7efhTZi9zKr7GVJ6B/uAsHGLlKiia0h8dacCeVxNsdhkqV5TYB9pBiE4zQk
 lOg47nQooPvxyQXDygxQ2nvOGHTKB68aoxXIwPD9XMFjVRFO0qah6jGjoOONjeEeI1V3
 6nlLif9IKIKHZLSrScCFxAuxgKVlvy2k4BkWg5GoQiUYbsq2Oxhoe+3boQgwiSKQpIT+
 D49ZS9gyzqwezIyRvxtNqd2ONuznz5WIQKxkFUrEuk4/nA4hqlUZ4DWaMS/L6R2yBqjs
 r2PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvpmuLWGYZUx9JLHpM/+kzjtJFnSeQO719NfF2a3H0yZFeiWiUtkQQRNXN2DjjxQ2Ou3O4FxvqrkbLnUYJ6l2F8mJDEbC/tGGXcxN7KToA
X-Gm-Message-State: AOJu0YxvkS6homGpyzyeMfWjHaqv/8av2lCTtohJPm83jYXCfWlw1MdX
 UQCUm9y+/Xf93GyLlXnbfPYcRO17jbX6Fcvx1x+LMUqXhB+DqeMyjcAZT6FF/J0=
X-Google-Smtp-Source: AGHT+IFWlVuicjYknAdk37iSyCWyl6bDc1xmcdzkVqJy/EqPKHmtbxzit8FJhzeWVCTnKwKbxFK0/A==
X-Received: by 2002:a17:906:b811:b0:a3e:53d9:c7d5 with SMTP id
 dv17-20020a170906b81100b00a3e53d9c7d5mr1794154ejb.36.1709315567593; 
 Fri, 01 Mar 2024 09:52:47 -0800 (PST)
Received: from linaro.org ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 vq2-20020a170907a4c200b00a43a12c6311sm1895924ejc.166.2024.03.01.09.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 09:52:47 -0800 (PST)
Date: Fri, 1 Mar 2024 19:52:45 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller:
 document X1E80100 compatible
Message-ID: <ZeIV7cBtDI8e1WT6@linaro.org>
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
 <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
 <a90dcd83-d158-4ec1-9186-0658c108afef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a90dcd83-d158-4ec1-9186-0658c108afef@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24-02-27 16:45:25, Krzysztof Kozlowski wrote:
> On 22/02/2024 16:55, Abel Vesa wrote:
> > Add the X1E80100 to the list of compatibles and document the is-edp
> > flag. The controllers are expected to operate in DP mode by default,
> > and this flag can be used to select eDP mode.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index ae53cbfb2193..ed11852e403d 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -27,6 +27,7 @@ properties:
> >            - qcom,sdm845-dp
> >            - qcom,sm8350-dp
> >            - qcom,sm8650-dp
> > +          - qcom,x1e80100-dp
> >        - items:
> >            - enum:
> >                - qcom,sm8150-dp
> > @@ -73,6 +74,11 @@ properties:
> >        - description: phy 0 parent
> >        - description: phy 1 parent
> >  
> > +  is-edp:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Tells the controller to switch to eDP mode
> 
> 
> DP controller cannot be edp, so property "is-edp" is confusing. Probably
> you want to choose some phy mode, so you should rather use "phy-mode"
> property. I am sure we've been here...

phy-mode in controller node or in the phy node?

> 
> Anyway, if you define completely new property without vendor prefix,
> that's a generic property, so you need to put it in some common schema
> for all Display Controllers, not only Qualcomm.

I can re-spin with qcom,is-edp if that's better.

> 
> 
> Best regards,
> Krzysztof
> 
