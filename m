Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92963A2C983
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 17:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA5C10EB7D;
	Fri,  7 Feb 2025 16:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a5uze581";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B4710EB7D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 16:58:29 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6f7031ea11cso22690317b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738947509; x=1739552309; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=27oFQYf91Dloj6jyxwrUr7dxmGXERcb1UW6tbtKiP8g=;
 b=a5uze581Uiw0eDD9AHtp7xoSQjSxLDt9PMIzP1E2LK/LmnDb55uf2O/FtD8EQsy8wG
 tkctNHRSAp7zN4ZfMPJ5eit+39x6PCNbWjKSm+R+xJ9ggvJzolEvObChaZccARNanTpA
 va09yANs2Vlu8v1Xjm/s9wm1QCKgDvIqjOxvLV9s7mJ/7byvwsXRbcERoPo76yvg+P6J
 /xa3Z7pr91aL0eVsBZ4V2Ap+3Pi7YXOrlqz4yWjrposQDQGoe8C9q0VI+vFs1Ue+sO98
 C4FDNfizGylrB+ayyT7cHcmSTF5sAoHC88lxnFILxRemo/PZPLH9wpQqX0YZXBLVwal0
 gr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738947509; x=1739552309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=27oFQYf91Dloj6jyxwrUr7dxmGXERcb1UW6tbtKiP8g=;
 b=oksl7qaulvnaGksnnfwOm8kkNL1n/Bq3bPZPlAcRgwfaTtE7Wc6zhGCPzBiUJL5HiP
 YbFQJon8zpzF5mma6d76m/RfMT52jpLvcdOUTbgrNHYHyq79c9O76q9Wcv2e7Y+Kfqu7
 iKRNj5+aBlg256F6M5NRRv8KE+vcfmuEYZL+dtXXWp3z8JXlsMdGZN+d12uG0Fw1gutf
 wdTWFEELiELgq0rr2AW/pAQblYMV51gMuYiyQs6SZJNtD9cvcOoNkk2ciGt/5V4bbp9H
 Naa0OBGGq/zCmBR13tFgIV/MtV+mXfMItKTbi8bZpmp6fKXt5g3a5ca30bO+752H5dAL
 uPFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURd1KsMmKp1reEaeBU7/KH7iLjwJYYGl8HGVc2a4MQZO3pBw4z2EK++ghyKqIj6/sSzJO8XUYyaTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLE2H2iO1rmAktDHUkJEu8ukUQMzTwgyeGjTXUFluEwQmvSUez
 PhMb9rvWNFugW8JTLLyq3lRqcXj9vgAQ5RdSv6DJzW+xI56ssxJan+DvI5XPVxNapz8OtPpGlUb
 ThiATgsEtG94/Y65O2L+fi2Ras1GXWDlFZBimyw==
X-Gm-Gg: ASbGncuPNcjqXhcdmZQiYUPIBOYdkmDVvdv/PHWBUxB6M3JBOkgQe0t92evq+wCPSYu
 Gli8B5o/cCsp3p8V1ctjxoP5XqxJ2aSfdjq/SyaY8NGS24lmbS6foy846EK1dZ7Rn+QB2eM5HZg
 ==
X-Google-Smtp-Source: AGHT+IEu4Hyrf15nRFOfu+/0wIU/F0sEzYBhEg4wPUS8216Hy1mszoPNBAKnenIT6vKlzaVZSszBdgs4MWDyXS4Mfe8=
X-Received: by 2002:a05:690c:350f:b0:6ef:8296:359d with SMTP id
 00721157ae682-6f9b28ceac3mr39041717b3.22.1738947508975; Fri, 07 Feb 2025
 08:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Feb 2025 18:58:21 +0200
X-Gm-Features: AWEUYZmBPR-J1PCz9MhgEjUk9CeBfh40TL1EHs1HVsEe3GRaQwWTHGmL1C1gm5Q
Message-ID: <CAA8EJpoLnHfOEH81U=fKuL1vOvZss8+zYRFstXp0JZLQy2OX+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: qcom, sm8650-mdss: only document
 the mdp0-mem interconnect path
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 7 Feb 2025 at 12:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The mdp1-mem is not supported on the SM8650 SoCs, so only support a single
> mdp0-mem interconnect entry.

No, please add cpu-cfg interconnect instead.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> index 24cece1e888bd35f169dc3764966685de4b6da1d..cee581513c519924712c7e0fc055099f886d0a99 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> @@ -29,10 +29,10 @@ properties:
>      maxItems: 1
>
>    interconnects:
> -    maxItems: 2
> +    maxItems: 1
>
>    interconnect-names:
> -    maxItems: 2
> +    maxItems: 1
>
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
