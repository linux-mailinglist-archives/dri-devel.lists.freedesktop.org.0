Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B85A88D97D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 09:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8204310F95E;
	Wed, 27 Mar 2024 08:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cCLIh75J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6EA10F967
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 08:52:14 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-60a0a1bd04eso72975507b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 01:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711529533; x=1712134333; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QKDxo5SiDJux2nq6LZtCe3mC0jTYYBUZBjVfmvT96ys=;
 b=cCLIh75JT2LLXyl3vZJkvuPV7ymwv+58GRUTUArxMp7y5zWC/IrmO1H5mtmvqGtk7Y
 BPXi00dwp7RhIQgovD1Lfh87nwl52U+CNwN6ghWN+Fcrl8ZCPm1y+2sm3c2K7KtAECo9
 86QJ6XUSnbf0reRnr5BsTmhQC6YrlWehRwh2BO6TDPpSEPetp+xK68Wb1vgNeWV/XMvQ
 pGQVJ7w0uWO4I6lnrc+TeAVNClf8hXL+Jk5/IhWRMlMLJcZF0cO4nnZWV6EaB5akt5lu
 gHyvWD1rKAPKCX/E3ENTvf6hzNriACXTNMQMbuFHvRkWhhakp8ISVVP5Jd2DeJANeJQ2
 MRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711529533; x=1712134333;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QKDxo5SiDJux2nq6LZtCe3mC0jTYYBUZBjVfmvT96ys=;
 b=RKOI83lpl6KmKQ+sYPpz1HUmetnnMckeajMWkWpi0z+UHDHd5u3pr94SeMJOqQevdi
 +CP37opWEHQhudBEg0kU9Y5wAVEQ1DHpXEy7Vp6uYgPWHnQwgld2prgVV4jbKsoMzui4
 Z38PckTmo08ZvrjG6kt8kWfPDEEiaKIKmpzWozTNP9qnKDjIn0kjOJFX7Vd9i8noh4IV
 ir2j+3qmxEyFFFNdyqRikXU0jqi1gQal8AeMXiM+3dGzqTlgHdx3vt3xhX409+EB84VU
 jhDhlNexMmieyfUJBa5cKjhPIdc2TXySDuqJjehuDO3J9p96oq8Eva+4SVdd3SD8VI+e
 W26w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeBiPMr11FvP5F5GIyqYDGaciFtDeJe4un50Dzz8tugJxluzRPO9SMzoWMeicnLvj47umVm9dp0tStIgtXaDUSzIyQT4DvDN6knSz/YhVX
X-Gm-Message-State: AOJu0YwlF4DHFDDOruiBKY2CTauZop7ECEiqzWt323HqwOtK2oOedu5O
 0DEPxWtdI6YuDnCO7mNcdXF1URusmuGjrlgHrlmaO//1y1iEuu9yxAv1yd780NXlV6FEBgwZmfE
 OKcoxy+msNfE6mos+jGhFNMKAcRa8mUiSB00PEw==
X-Google-Smtp-Source: AGHT+IHT7KGPtquwpuaNGQTzLwDxTjgBrwNcRbeqAf2i/0d4TNxkYwnbGP08o1u9++zU+7flQ/+MYOMmfXQVv2GFuRs=
X-Received: by 2002:a05:6902:1366:b0:dcc:a61b:1a72 with SMTP id
 bt6-20020a056902136600b00dcca61b1a72mr1960452ybb.47.1711529533479; Wed, 27
 Mar 2024 01:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
 <20240326-fd-fix-schema-v1-1-4475d6d6d633@linaro.org>
 <e9ce004a-952a-4a94-abe9-2a8dd96b37fb@linaro.org>
In-Reply-To: <e9ce004a-952a-4a94-abe9-2a8dd96b37fb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 10:52:02 +0200
Message-ID: <CAA8EJprg55BkRL5KUZ+6gNniq9TZjEem8MLqQdMZcXntvttEVg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: sm8150-mdss: add DP node
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 27 Mar 2024 at 10:45, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/03/2024 21:02, Dmitry Baryshkov wrote:
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> > index c0d6a4fdff97..40b077fb20aa 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> > @@ -53,6 +53,16 @@ patternProperties:
> >        compatible:
> >          const: qcom,sm8150-dpu
> >
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,sm8150-dp
> > +          - const: qcom,sm8350-dp
>
> This does not look right. sm8350 has its own mdss binding file.

So just a single entry here, even though SM8150 uses fallback compat string?

-- 
With best wishes
Dmitry
