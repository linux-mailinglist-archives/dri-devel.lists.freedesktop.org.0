Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A0662AB3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 17:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA26F10E4A9;
	Mon,  9 Jan 2023 16:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB31F10E4AC;
 Mon,  9 Jan 2023 16:00:07 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-142b72a728fso9037899fac.9; 
 Mon, 09 Jan 2023 08:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NmIlgEFtXavdJf8Lq/cH9FoF1zSgoXLLeAA66q8BH/Q=;
 b=oDJNjXzdIqcVtaQmChMkHT3yHgKYVU6ZGHeQkyUEN43O04ce3VI/GxT8izgTrFrxtC
 0GLrVGIse4b5CxzeEYLKup/+/BVq9VabzeD8FhGdsg9eb2KEq7jRO2n9y1w1SiWiGGWG
 8vGjAx7wQEFrKTBRh3MhYgP0h1Sqckkpn07/mpGa50bemE9U1wA731/8U+rYeL5HCgPC
 WIYb2ynzteNwt6XxFYZVxuPfbRCpr5vEWGzC8jzcJhQ8bMhZO0axlG71ayCbH18zJrEJ
 f+JyJdIvvyAuasSNLHhWsaSpa4eDSpTUstTzG4zeZFkvB7gVfKzmRNElRCkvxo5GNTdf
 NvuA==
X-Gm-Message-State: AFqh2koFRKzw9OkIgdqmCwo4MvhFvkRCmeoQgC7QIyfdumciK6334Kg0
 ba/RJ0XMJu3U/X26O+ZBAQ==
X-Google-Smtp-Source: AMrXdXuXJvBT3dt96q3KMmD15McdlaQh3O3qs1191wR2cMHTCinqo+Y5JobLAeehoewg+Ou02LotoQ==
X-Received: by 2002:a05:6871:891:b0:148:6804:e60c with SMTP id
 r17-20020a056871089100b001486804e60cmr37077630oaq.35.1673280006846; 
 Mon, 09 Jan 2023 08:00:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h24-20020a056870171800b0014f9cc82421sm4366524oae.33.2023.01.09.08.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 08:00:06 -0800 (PST)
Received: (nullmailer pid 722135 invoked by uid 1000);
 Mon, 09 Jan 2023 16:00:05 -0000
Date: Mon, 9 Jan 2023 10:00:05 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: rename mdss nodes to
 display-sybsystem
Message-ID: <20230109160005.GA721066-robh@kernel.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
 <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 07:13:57AM +0200, Dmitry Baryshkov wrote:
> Follow the 'generic names' rule and rename mdss nodes to
> display-subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index 59f17ac898aa..ccd7d6417523 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -15,7 +15,15 @@ description:
>    Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>    sub-blocks like DPU display controller, DSI and DP interfaces etc.
>  
> +# Do not select this by default, otherwise it is also selected for qcom,mdss
> +# devices.

for NON qcom,mdss devices?

> +select:
> +  false

select: false

> +
>  properties:
> +  $nodename:
> +    pattern: "^display-subsystem@[0-9a-f]+$"
> +
>    reg:
>      maxItems: 1
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index c218c9172608..47fde9b6779f 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -15,6 +15,9 @@ description:
>    encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
>  
>  properties:
> +  $nodename:
> +    pattern: "^display-subsystem@[0-9a-f]+$"
> +
>    compatible:
>      enum:
>        - qcom,mdss
> @@ -153,7 +156,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/qcom,gcc-msm8916.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    mdss@1a00000 {
> +    display-subsystem@1a00000 {
>          compatible = "qcom,mdss";
>          reg = <0x1a00000 0x1000>,
>                <0x1ac8000 0x3000>;
> -- 
> 2.39.0
> 
> 
