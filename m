Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFAC672390
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C92210E7A0;
	Wed, 18 Jan 2023 16:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B89B10E79C;
 Wed, 18 Jan 2023 16:39:29 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id d188so17925593oia.3;
 Wed, 18 Jan 2023 08:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IEVtWKwmkzW9LdqES8Bi2ZC05uDEdMU5/2KSOeqSZP4=;
 b=RtgWe+hxSVRSIPxcmCAn6BlwfNL/lSJ411NQvySncBQFTmDHoj+y1810MQVhYKTjuq
 JIVOJPVjrZtJmg1FWOrUZDaX2nIz9mnW5ebk2iE7mRdwcVgQJ9pUvDYTMhi7cKSOtCQf
 pYcFejPU/BJdCwNluPNqqmv7U6Bf+ORxLcFPP1r2XXgWAWgznjOvrUNJgB77iv46z28j
 ZEqL1VdQwoRDPuiuuHSyRfX9+KX4BYZhkRuRufAO3Vdhzo2yjcJYYeMvCANbznKK2Kx0
 DDKqcr8e/VJDnscy0GI9qvdwWjYugF+632DZMJQ2lzPTuMNiTGo71ZAFaudstpviCcxI
 A8kQ==
X-Gm-Message-State: AFqh2kr9qYJ7tBYafl/lTPdJOzWkhlW4JZ/O0jwjWxTjxMM7D1Ih47TR
 YM3QzNOWq9NzK83MiHHhPQ==
X-Google-Smtp-Source: AMrXdXsZeF0y1QALz6H8wcZKbTQwL6oosAD2gIFs26uCmDUZqToflGqn1LL2oxzHS8/HGpGU4jFK9A==
X-Received: by 2002:a05:6808:f0e:b0:364:ace4:b499 with SMTP id
 m14-20020a0568080f0e00b00364ace4b499mr3450753oiw.56.1674059968370; 
 Wed, 18 Jan 2023 08:39:28 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a056808148d00b0036a97066646sm2296768oiw.8.2023.01.18.08.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:39:28 -0800 (PST)
Received: (nullmailer pid 135326 invoked by uid 1000);
 Wed, 18 Jan 2023 16:39:27 -0000
Date: Wed, 18 Jan 2023 10:39:27 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main:
 remove #address/#size-cells
Message-ID: <167405996678.135293.4200911334846022588.robh@kernel.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118032432.1716616-2-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 05:24:29 +0200, Dmitry Baryshkov wrote:
> Stop mentioning #address-cells/#size-cells which are defined in
> display/dsi-controller.yaml. Use unevaluatedProperties instead of
> additionalProperties to allow skipping properties defined in other
> schema files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml           | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
