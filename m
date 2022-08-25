Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC745A1A15
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 22:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D8810E0C7;
	Thu, 25 Aug 2022 20:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4880910E0BB;
 Thu, 25 Aug 2022 20:11:51 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 o15-20020a9d718f000000b00638c1348012so14693705otj.2; 
 Thu, 25 Aug 2022 13:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Oj86uGkClNsnwE1dPgwe6HKsJXAs0gnD9U8fRVhpgYA=;
 b=JdILOSDpyhcrKH036Xzm8VwOFj7qgTpasYD7FekFrP902D5+WYNMFHZMz5bNOMkSlJ
 IMPxHgEPU7xkROd8/a/6xVh2WZKvkLzJHw5/dyLP6PWd5cuwraYE/U9JLADH2wmaWym0
 Rn0wo6DmQkNbJp0dNic4D1VE0tUnrqOhWsBH0V+/dc9t8DUUMLoomzcArcKWf/Lacw9k
 fdk07062mjpQbf8elkwCmVhsrDGwXsqwHAzMobTR4Pnm3hVNrPHDcqX9EyaGzqkBxrQX
 Wx5LpVjw1R+hVpsTUIkPcZKcoDvi5GCuRpkGbpXQiQ9DD2mws/yCtAS8cQE7lgXyUFLu
 ULHQ==
X-Gm-Message-State: ACgBeo1FC2/lVy/qWfV77QAnjoM6l921+KbhWaElqZ0ugod/xBqrDW0z
 MW/KiR+IaJYOvoO2pwIb+Q==
X-Google-Smtp-Source: AA6agR5hwcOt2GSmumZQPTU+DdvLWeb8FIdquxqTRq407DHgvOQFNI+9yln3wmNE7EjAWVfmy4sDkw==
X-Received: by 2002:a05:6830:d7:b0:639:ac3:7a6 with SMTP id
 x23-20020a05683000d700b006390ac307a6mr276969oto.162.1661458310460; 
 Thu, 25 Aug 2022 13:11:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056870429000b0010bf07976c9sm73446oah.41.2022.08.25.13.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 13:11:49 -0700 (PDT)
Received: (nullmailer pid 1610468 invoked by uid 1000);
 Thu, 25 Aug 2022 20:11:48 -0000
Date: Thu, 25 Aug 2022 15:11:48 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 00/10] dt-bindings: display/msm: rework MDSS and DPU
 bindings
Message-ID: <20220825201148.GA1607980-robh@kernel.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 25, 2022 at 12:50:53PM +0300, Dmitry Baryshkov wrote:
> Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
> devices). Cleanup DPU schema files, so that they do not contain schema
> for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
> afterwards.
> 
> Changes since v3:
>  - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
>    dependin on the mdss compatible string.
>  - Added sm8250 dpu schema and added qcom,sm8250-mdss to mdss.yaml

My scripts tell me I reviewed these, but I don't really follow what's 
changed.

Rob
