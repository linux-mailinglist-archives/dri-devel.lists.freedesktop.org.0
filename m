Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F77166A4CC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 22:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0E610E202;
	Fri, 13 Jan 2023 21:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1587310E202;
 Fri, 13 Jan 2023 21:08:10 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 y18-20020a0568301d9200b0067082cd4679so12894110oti.4; 
 Fri, 13 Jan 2023 13:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ACwV8GdlK5Pn0GPirboYIEragSvuKbdIfuMOvJXHSM=;
 b=347kJxrzXTjEgMfLWrdy2kN1WiQzYF9e/yA3guuD2VS5NeYp3frGKgltvgCQEd9Kle
 0aJW1/8zitjOmghCiVeA4zYAcLV5PM7/wo5pbigftBnTWUaJBM8tfDSa5iiu0V3GkKsZ
 EcH4ZPTfR26jeVrs4c2fUol/4GPjYCCOSIgdOuSpgFh7G+y4ZgGjWgCp9VVAEwT1yUlW
 kpACed4Ukh0cjaY844uELkUut+f5TL8vudLfA7iEeYjafyC2J+w0cJzbOZTyAs6zzCkd
 7HhYjdYCoWi9gRST7SUt3bjimuxgHoiw4575HOjbbIdXueThfX/PXrKWUc+EbitykRXi
 LNiA==
X-Gm-Message-State: AFqh2koAa+Bj93R9oTX6i5Ajn0vB2weh7H8yXiQxwe0fJiVSwtahuBh6
 F2aJgS5Yzd3KeJ5XZROkoA==
X-Google-Smtp-Source: AMrXdXtOCyFNSTM7/jynGGVXcLk6sca17HjsYUlJ2g4cHUoMhCLJo9KZbNWVX4kBQpjW+02DAUFr1A==
X-Received: by 2002:a9d:7416:0:b0:66c:37a2:d87d with SMTP id
 n22-20020a9d7416000000b0066c37a2d87dmr5097303otk.26.1673644089136; 
 Fri, 13 Jan 2023 13:08:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c26-20020a9d481a000000b006849e3aff8dsm6381829otf.44.2023.01.13.13.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 13:08:08 -0800 (PST)
Received: (nullmailer pid 2923605 invoked by uid 1000);
 Fri, 13 Jan 2023 21:08:07 -0000
Date: Fri, 13 Jan 2023 15:08:07 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm/dsi-phy: drop unused allOf
 clauses
Message-ID: <20230113210807.GA2901424-robh@kernel.org>
References: <20230113063351.24131-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113063351.24131-1-dmitry.baryshkov@linaro.org>
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

On Fri, Jan 13, 2023 at 08:33:51AM +0200, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml          | 3 +--
>  .../devicetree/bindings/display/msm/dsi-phy-14nm.yaml          | 3 +--
>  .../devicetree/bindings/display/msm/dsi-phy-20nm.yaml          | 3 +--
>  .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml          | 3 +--
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 3 +--
>  5 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> index 3ec466c3ab38..71702151bafa 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -9,8 +9,7 @@ title: Qualcomm Display DSI 10nm PHY
>  maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
> -allOf:
> -  - $ref: dsi-phy-common.yaml#
> +$ref: dsi-phy-common.yaml#

Convention is how it was. Partly this is legacy because earlier versions 
of json-schema required the 'allOf' form or everything in addition to 
the $ref would be ignored. I left these thinking more than 1 $ref here 
might be common. But probably more common is a $ref and if/then schemas 
and I'd somewhat rather keep $ref at the top and if/then schemas at the 
bottom. So maybe this is the right direction.

I don't really care to define one way or the other if we can't enforce 
it in the meta-schema. I don't need more nits to look for in reviews. 
Adding a check (i.e. allOf must have 2 or more entries) would be quite 
invasive and wouldn't allow having 1 entry when we expect a 2nd entry 
soonish.

Rob
