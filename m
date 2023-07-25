Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C03676173B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 13:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD60C10E0DE;
	Tue, 25 Jul 2023 11:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6281E10E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 11:46:13 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0C0CC20231;
 Tue, 25 Jul 2023 13:46:09 +0200 (CEST)
Date: Tue, 25 Jul 2023 13:46:06 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: msm: sm6125-mdss: drop unneeded
 status from examples
Message-ID: <5w2hvzmwzqm4ffopzewveaviebq2ig7awimeo6ipcehx5a43ae@mlwffkf2ctn5>
References: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-25 12:16:10, Krzysztof Kozlowski wrote:
> Example DTS should not have 'status' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml   | 6 ------

This is not needed: it has already been corrected in v3 and v4 of the
respective series (among other changes) and the patches were only picked
to a preliminary (draft) pull to get an overview of the outstanding work
for this subsystem.  That branch happens to be included in regular -next
releases though.

6.6 drm/msm display pull: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/69
v3: https://lore.kernel.org/linux-arm-msm/20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org/
v4: https://lore.kernel.org/linux-arm-msm/20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org/

- Marijn

>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
> index 2525482424cb..479c82e6a0d8 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
> @@ -95,8 +95,6 @@ examples:
>          #size-cells = <1>;
>          ranges;
>  
> -        status = "disabled";
> -
>          display-controller@5e01000 {
>              compatible = "qcom,sm6125-dpu";
>              reg = <0x05e01000 0x83208>,
> @@ -170,8 +168,6 @@ examples:
>              #address-cells = <1>;
>              #size-cells = <0>;
>  
> -            status = "disabled";
> -
>              ports {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> @@ -210,8 +206,6 @@ examples:
>  
>              required-opps = <&rpmpd_opp_svs>;
>              power-domains = <&rpmpd SM6125_VDDMX>;
> -
> -            status = "disabled";
>          };
>      };
>  ...
> -- 
> 2.34.1
> 
