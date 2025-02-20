Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B29FA3D6CE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E7C10E395;
	Thu, 20 Feb 2025 10:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Hq/HIYST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26F210E919
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:33:35 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so884742e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047614; x=1740652414; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nOULWVV8S2WJWFH7D0olvt+CcxnnRMsdjMYkB3pg9sU=;
 b=Hq/HIYSTAxqFd0/xVBeBEr+fqG3kGfp/gPi2r5PG5FobYJjLA0+SpQfLpazVm/N1wS
 UiJvCEKd1baODMqeEMjIHzdNKQqhRtZC0J5YjZVviq7pZwHrakFQwV2emwi9moEk2b65
 hFqiqN81pyx7QsFeK/J/0jukok0YmY/NW0wVTkvhWsmraFY+5QZfrRASqEGshjSfwJ4r
 wuuOVKqjeijC603QmAzh8UdTnoLdwdcwYnYo9uZ7wnNrNXICXLBExuFRcr56H3Il2fZ3
 v/eFg8Q/MHo4BwVDAbGeL3iEzhAAA+IGJxOfrWVrnVt73fSjCB0O1SqXlqaz1iEp7WX4
 6U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047614; x=1740652414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOULWVV8S2WJWFH7D0olvt+CcxnnRMsdjMYkB3pg9sU=;
 b=FXtaOwEN2hZEZYfWJ672e+Oa2uVLf0XQJ5C4zuky91lNo9lK2Rc1l97ZFqo1WRK69U
 n17iskXkXeFQeSqkgcIKAHpw13aCIYagp2Pu8TMjIN55C+i8RYw4Z4x3gFzuXCjn9YFH
 7DIfGxIgqWVFEgyrxZI4D1/i8yddnIhDdEdTgR6Mb2vb4Xl8aRN14wikADo6871liYR2
 GckTrvSUtXvS1cwfU/tRrUiT6Tigs4b93lNI5yf4S9owNhKWS3p1/ctl5MoQuC3eFfDm
 +8axc9ldLBkaXbRua6GMLnwZH/M+98ngIl/uC1CVWSeuSTtyaIVp4PI5bK3Nz6Qhd5mj
 IPKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSrfjrNxZKjU8Wc8E8M/57Q2Z1JcmQpL6myl2zHX8boI6Len8Jdlnf1vVBqrmE1hxX0Nul70pi+Wo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5arJD8JO5KlLLy7LK+d7drO1cw8IzkGunqeaQuMmQ/e0yv4qT
 DeMCdBvwFefTg6mvKMgLN629BTgHBLFXz1bpeSU9gx0A/TzUXTobgR3T3VP3tRM=
X-Gm-Gg: ASbGncvgE6PmSbrwLdeopBoMzdDQbyjUn0J1O4M81SCRf0yg7X03428xCymBpOUzO5i
 H4Pdg33I64JbstdGckVIgw6vwILH4z2aBU2o7XWAT1mhb2dkvtVSjSsWSJGxXrKCQbSU+pDn3wC
 ovQExFcQaHtUcJWTIyTBphtKspu9s5VBi7yPKOAc+72hJs0XalFC0pTVoYttw8o3UkU1lLz4hvM
 eIAXgilA0fg46BOMEiAutQ1iWj/B9GMUqmbGaukaW/6za1YEZFrstZe6US7LGmUwF9YWB4E+/LC
 XDxtFXeN4+yM9ZfT6nigXEQf7c4nkWPeOs9SM6vyqnF3LMvUR9M0K+gZVbtwng5uqw9EfQE=
X-Google-Smtp-Source: AGHT+IGUUcYwMWrswexilTub+9t7uGS/voZUkkMFCSEUbJmmonP/3ieTF/+EZ9nECI5YUhJLWrjddQ==
X-Received: by 2002:a05:6512:2387:b0:545:9e4:e823 with SMTP id
 2adb3069b0e04-546e58bacd7mr835355e87.16.1740047613925; 
 Thu, 20 Feb 2025 02:33:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54595e38064sm1632621e87.126.2025.02.20.02.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:33:32 -0800 (PST)
Date: Thu, 20 Feb 2025 12:33:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: display/msm: dsi-controller-main:
 Document dual panel property
Message-ID: <grdadzunaabzg5jxpsiasgzbioy24tctlhhyxg6zwdkpv5vjwe@7k2di2myu4k6>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-4-6c0038d5a2ef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dual-dsi-v2-4-6c0038d5a2ef@linaro.org>
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

On Thu, Feb 20, 2025 at 06:07:55PM +0800, Jun Nie wrote:
> The DSI interface can be connected to a panel that has a dual DSI channel,
> or to two separate panels, each equipped with a single DSI channel. To
> prevent the DSC configuration for the dual panel setup from disrupting the
> current configuration of a single panel with a dual DSI channel, add a dual
> panel property to support the use of two panels.

Please use the terms from the standard. The "channel" is mostly used for
the "Virtual Channel" or the "logical channel".

Also I don't follow how DSC configuration for a dual panel setup can
disrupt current (?) configuration of a single panel.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index ffbd1dc9470e2091b477b0c88392d81802119f48..e3f2eabde27609a66d6d81fafcb14e1bc014613c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -88,9 +88,15 @@ properties:
>    qcom,dual-dsi-mode:
>      type: boolean
>      description: |
> -      Indicates if the DSI controller is driving a panel which needs
> +      Indicates if the DSI controller is driving display device which needs

Unrelated change

>        2 DSI links.
>  
> +  qcom,dual-panel:
> +    type: boolean
> +    description: |
> +      Indicates if the DSI controller is driving display device that composed
> +      with 2 independent panels and needs 2 DSI links.

How is tht different from qcom,dual-dsi-mode?

> +
>    qcom,master-dsi:
>      type: boolean
>      description: |
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
