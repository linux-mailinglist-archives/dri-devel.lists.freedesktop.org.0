Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562EE4CACE2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 19:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2070810E3C6;
	Wed,  2 Mar 2022 18:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB46C10E2D7;
 Wed,  2 Mar 2022 18:04:11 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso2829341ooi.1; 
 Wed, 02 Mar 2022 10:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NyCZbFNG5zXvLkeeXgNZuh7pG1t1jvI75UWVDVGd5RM=;
 b=X61KhJlUWNlEIGa0tS/dhJyb3itQSNqVAmd9tBmr0a7aqZHjlpPLdO9GMjQknrgHRv
 y1Vf7TjGS/z12jRydUV5RzNCTPyGChV94DTNysga4cndUKSI6q94jA7An58p8A/cNau5
 2Qww5ax5QQ+ra0bGPnXC4BENGWvlzo8n+vnQRvxSZWlLbmGKZYN416jhgxcry4cFfA+t
 T53aNY1WII2U5GZzpGcSwQL3g0YCEYIpcUEwLrR7o++vpXIgNW2YwpAHfWCdPVJMIsK/
 dBuyFtdxdscN9nidgpqGiUOuOdHQSotyaDhqBoiWCo+EUdlZHzLwgLvissgFzWn/2DQQ
 U9yQ==
X-Gm-Message-State: AOAM533opFeRPH+30SIBZhMaelb1M57fo7qvCxz/bw85O1ujYFV5RiTQ
 NXS5o7Hho4cXFX2wQOuTcxf8kIEwmA==
X-Google-Smtp-Source: ABdhPJxRfEvne9Olzfj87R4/ZAFsMzyq/AgkwsOQIj7de/21zewdDmDo8cR0oklkbOky7y2+ovYPKg==
X-Received: by 2002:a05:6870:f611:b0:d6:d3ad:75d0 with SMTP id
 ek17-20020a056870f61100b000d6d3ad75d0mr796616oab.101.1646244251160; 
 Wed, 02 Mar 2022 10:04:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 gz3-20020a056870280300b000c2e2d0a326sm7449557oab.38.2022.03.02.10.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:04:10 -0800 (PST)
Received: (nullmailer pid 3973831 invoked by uid 1000);
 Wed, 02 Mar 2022 18:04:09 -0000
Date: Wed, 2 Mar 2022 12:04:09 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RESEND PATCH] dt-bindings: display/msm: add missing brace in
 dpu-qcm2290.yaml
Message-ID: <Yh+xmSaLHc14ZNnV@robh.at.kernel.org>
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 03:14:10AM +0300, Dmitry Baryshkov wrote:
> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Didn't include freedreno@ in the first email, so resending.
> ---
>  Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks for fixing.

Acked-by: Rob Herring <robh@kernel.org>
