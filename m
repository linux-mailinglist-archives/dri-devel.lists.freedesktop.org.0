Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29B5788C8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 19:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA60942BF;
	Mon, 18 Jul 2022 17:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ED2942A8;
 Mon, 18 Jul 2022 17:50:26 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id r4so2226563ilb.10;
 Mon, 18 Jul 2022 10:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qo+O3LtYsVt3ukwggOHDQf2oi2D8i1x0+YuYG/drp00=;
 b=Hb03a4SO9hraq/Md56gVG0MRyMuVp9QW3r/RW6Nvr+xKZp+W3qcALGT5R+hE6u+pkA
 kCrnV7f6F1Dkzl4ulkC9CdODOkpD7l++gIMm96sgTVTowetVtw8khkYfa/x2SzqXxuYY
 zedqFGRBc34N3vK2nC44Kb3RFEzq/HxDldykADQAcrQ1Y3rvGw6P5k5DIBv09CydkkrY
 9yTcsloRKrUJFrdXwxRcxytE8wHTO5ytJYEAcD/NLaDzQrmNUuh5E+SttNX+NmE/S1Pt
 40xeQhs1I6rp6jzam+nOqOqUKUPJafX5GyjK/YMev/qg8zsewI208bBM07JdFsllCKZV
 UwVw==
X-Gm-Message-State: AJIora+4DcOZEi+cEs9Ouamq2NFiIghZG3rEyUy3ClzvltH+MYtugNEy
 w7eJ18Ee+3hBraqACTLFaQ==
X-Google-Smtp-Source: AGRyM1vW0jj+2K/+MnMJmlvpDJ+vIEj6eMNRycI2GUzxrkQTlF3EGll5aFibyTPPNbtPr1MMDnGyzA==
X-Received: by 2002:a92:dd82:0:b0:2d9:126:5bed with SMTP id
 g2-20020a92dd82000000b002d901265bedmr14367423iln.97.1658166625399; 
 Mon, 18 Jul 2022 10:50:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 y27-20020a02731b000000b0033f51b3b0d9sm5764589jab.138.2022.07.18.10.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:50:24 -0700 (PDT)
Received: (nullmailer pid 3238778 invoked by uid 1000);
 Mon, 18 Jul 2022 17:50:23 -0000
Date: Mon, 18 Jul 2022 11:50:23 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 11/11] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <20220718175023.GA3216365-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-12-dmitry.baryshkov@linaro.org>
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

On Sun, Jul 10, 2022 at 12:00:40PM +0300, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-common.yaml      | 42 ++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 43 ++-----------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 39 ++---------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 43 ++-----------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 43 ++-----------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 43 ++-----------------
>  6 files changed, 62 insertions(+), 191 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> new file mode 100644
> index 000000000000..14eda883e149
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -0,0 +1,42 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties (common properties)
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |
> +  Common properties for QCom DPU display controller.
> +
> +properties:
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc.

From the last version:

> In case of MDSS all ports are output, they are connected to the external
> interfaces (DSI, DP, HDMI, etc). The driver uses them to bind available
> interfaces (using components framework). The reg property of the port is
> completely ignored.

It doesn't matter what the driver does or doesn't do. Without 
describing port nodes at all, you are not validating what port nodes 
can contain. Just try adding any property under a port node. You need at 
least:

'^port@[0-N]$':
  $ref: graph.yaml#/properties/port

where N is the max number of ports.

Rob
