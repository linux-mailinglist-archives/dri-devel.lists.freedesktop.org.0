Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1180A44EF0F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 23:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77BB6E0E1;
	Fri, 12 Nov 2021 22:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBAE6E037;
 Fri, 12 Nov 2021 22:06:42 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so15936220otl.3; 
 Fri, 12 Nov 2021 14:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fAH2FOMt6ByFuulhcFjd5qWVzjhUNrdP0WgFpwV39B0=;
 b=CZPcQUPO6SJLX3Re3z381RoKV1SNX22jfThMHZVh/5Wf79T1hwfIifjq0qPysvmyBk
 WE5ZahbaOaPFu7lnARv7UnEXsTf9+402Pwqy/kX4QF+AxBwd3UCHvAtAd1iFjIzyzYH2
 MERRyrJ8PLxtreYIw5HZkjStcGtTXSGQyZechQzhYbiiY/meiVX4O2X1O2abnMGabaSr
 YHLy8FX0Mn9LHxwlig2X6lSzRJesBJqWWIkRQu9kx4HjNTEEsRxnOGI7kwu77O4+GvFY
 G1phWnMtX5tEsFtPDL5KcwGv4YBAyr1vWI3/hNTzMDoWzTHsL4QdnYaDWTy4mRN5+mNr
 sZvQ==
X-Gm-Message-State: AOAM530YKYEEuEAnZM3UdPn/J5nQeI/FioYhRGjJWtwKZtCR1A8OhfaB
 Xv5Pq/c1NZq09nREJ5j+Pg==
X-Google-Smtp-Source: ABdhPJzYCaZPSoDKSlmsF80rRO7ILm+llkMdr8lAkIa0PoG+u4OX6b9xy2pxwRPJ/XupxrXEJePnkw==
X-Received: by 2002:a9d:6e09:: with SMTP id e9mr10631391otr.230.1636754801498; 
 Fri, 12 Nov 2021 14:06:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j5sm1465590ots.68.2021.11.12.14.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 14:06:40 -0800 (PST)
Received: (nullmailer pid 3458175 invoked by uid 1000);
 Fri, 12 Nov 2021 22:06:39 -0000
Date: Fri, 12 Nov 2021 16:06:39 -0600
From: Rob Herring <robh@kernel.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v4 12/14] dt-bindings: msm/dp: Add bindings for HDCP
 registers
Message-ID: <YY7lb9k2UArZf7I/@robh.at.kernel.org>
References: <20211105030434.2828845-1-sean@poorly.run>
 <20211105030434.2828845-13-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105030434.2828845-13-sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 11:04:29PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
> 
> We'll use a new compatible string for this since the fields are optional.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3
> 
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml    | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index b36d74c1da7c..f6e4b102373a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -21,12 +21,16 @@ properties:
>        - qcom,sc8180x-edp
>  
>    reg:
> +    minItems: 5
> +    maxItems: 7

This should be a warning. Not sure why the bot didn't run. You just need 
'minItems: 5'

>      items:
>        - description: ahb register block
>        - description: aux register block
>        - description: link register block
>        - description: p0 register block
>        - description: p1 register block
> +      - description: (Optional) Registers for HDCP device key injection
> +      - description: (Optional) Registers for HDCP TrustZone interaction
>  
>    interrupts:
>      maxItems: 1
> @@ -111,7 +115,9 @@ examples:
>                <0xae90200 0x200>,
>                <0xae90400 0xc00>,
>                <0xae91000 0x400>,
> -              <0xae91400 0x400>;
> +              <0xae91400 0x400>,
> +              <0x0aed1000 0x174>,
> +              <0x0aee1000 0x2c>;

Be consistent and drop the leading 0.

>          interrupt-parent = <&mdss>;
>          interrupts = <12>;
>          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> 
