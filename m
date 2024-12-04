Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7049C9E3863
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 12:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED9B10E0A7;
	Wed,  4 Dec 2024 11:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="weqflYIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C6F10E0A7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 11:09:59 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso84405761fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 03:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733310598; x=1733915398; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qmvDv+aJXodq+mhX0D5y6kJ1JtvDvnKdqZyOWQy8lzc=;
 b=weqflYIK3JMCTXP7541RqQNTgp21yTE4tV5X0oGPquG2hw5KTPT7ybwQ5uZEWLwd8W
 U7/ddBwpMkMFLsElVAmll4OUIre9sis2p8YdzKIYWeZXvkTlpl8ymV5EywwaJIo8HGxh
 wb7TqwaxB0sdNU+w6xL/t3poGwxNe9LmwNS3bZCd1RVUfBCKnOAeucHY1aLbBMiYmZ/O
 Q+vO3zJX06r/oW1vl445t6xtA/HPtoQtehRaSQ5+1Zj4lUxwgofG/bIjjqIyV4dZfMSB
 oKOTHdvDyxZFQlq0AX9n9QiVb06WAvI+eFTFYAkKCUB092Wt6fIziqFkLgkSvYobRPoH
 lPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733310598; x=1733915398;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmvDv+aJXodq+mhX0D5y6kJ1JtvDvnKdqZyOWQy8lzc=;
 b=FOOm7jjWL/97X4rglJY7b+ImA9jYHqC0YOlB+CYh1sR9W2Qo04sNUAcfmKa+WraOY5
 x4mfVkyn2s0k+uxPBiee/weHpNppaAZIL5g6uA28Q4o1L8a/4Bj4yDtLWqTKWepYpnBw
 MFH6kr7FCUoydOfN2qBNxgtCKM7TYvZFxSgbGTTkYXqx5AwMFiPcZ+N/xlCenzFj/vqV
 kkk7hqXLI9GuuLRsuUKiXATy6OMjQhVZtj8QcA16bdAWRqlfXa6ZvnzEJuZBwgJvMUYI
 Ef6TmIPdp+unArnTACK4xmnpmclrpQax/myhb3SAeJUEQxFZzyXlQjlDUMMN355X1w2u
 fxNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV793ifboP7u6noubkuuWVBbTBWKSve9Pc5mh3esvwL/RPyHcCx0kTuLrJJfa4x8B2L8ZlBPpLmpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYc13TrH6vSWt+rInwZvdkWQg/2ot87tuAehaebprWzuJkuv+3
 XDQdc2uS8kML+ewn9mAjJhRY/rQnjGDW4JNUYWmOdsza2PtCncYZJbezXv2dBCE=
X-Gm-Gg: ASbGncvb94IAL5d2SoJ+nKKjXlG7QcBmsIJuH6spKUrmzbXYTV0NX5xQZeodhk8IppT
 de6J17Rdpay8t9sXiDM+z41aot0y+u5ZC+Oy669xogj6HBtd5n07DJI3aDuBjCISO2SdfL3jq6m
 RVw+OZHSu20C5Go7LdTYrxNV3xWxqq5A1ILGjUB/qipVGQakodJdRLusURbUxiQzoyg3337CdRs
 E8G7JKgVvONHL56zDNPxSh2lgwDyqSW+BcBH4VMa0YipTWw9AMVO/atRSprLfBSVNwHctcobtAK
 TcMeX1aFs+w0mXq7jeOM/iVs4CVLTw==
X-Google-Smtp-Source: AGHT+IFyqI3egCOEc9OzhfUKK2S/yE8XPBtr9AUCyqUOlyCRKeSwjfIHLpWDvtQ93zwWyBHTRLlv9g==
X-Received: by 2002:a05:651c:b1f:b0:2ff:d81f:2d34 with SMTP id
 38308e7fff4ca-30009c0de15mr41820741fa.8.1733310597934; 
 Wed, 04 Dec 2024 03:09:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfca12b8sm19252051fa.99.2024.12.04.03.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 03:09:56 -0800 (PST)
Date: Wed, 4 Dec 2024 13:09:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: msm: sm8350-mdss: document the
 third interconnect path
Message-ID: <e2ldpjkymkqz7twlhfthba3datrdunacay23znikdregd5p5mb@vwzpwhushgmw>
References: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
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

On Wed, Dec 04, 2024 at 11:36:37AM +0100, Neil Armstrong wrote:
> Document the missing third "cpu-cfg" interconnect path for the MDSS hardware
> found on the Qualcomm SM8350 platform.
> 
> This fixes:
> display-subsystem@ae00000: interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> 
> Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
