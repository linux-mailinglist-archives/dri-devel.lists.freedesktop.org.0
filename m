Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF3A3D003A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BC76E223;
	Tue, 20 Jul 2021 17:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541196E223
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 17:29:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B198600D4;
 Tue, 20 Jul 2021 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626802186;
 bh=dQ6r/chbOgykjGAd23iEH80jHjtf0Qtrm8TBrM0+oPg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=h//eQ0MpXU8d/CgDmQfQz/MYnx0cKNqQTcfCM8ar22itSA1O5Xihy6N9/8lEShRGV
 CJTjqen/MKr8ItMYdZLvn+ywUQE/0hecv0cnC7u6aTluj0N6Q/Y2N30/oxrADheGfa
 xwhwh3iFezb/QgtPLJO2GM4yFhwyrmtIHX3JrIKpLN2ixAyeEbPyGgJ6X5Urg7gCyl
 3j5nu0QbePUvMid8Rx//IkaxcXURUs+D8omSdzFTtDuZzDdBFG3G2Pc926Z67e8R00
 ih+1mMj/HyMGlrBg7d3tKVlOe+1nHqGwKtEM5SWpbEgeJC7WvN7bbs4vwwzsVmV6Qp
 5UTMzx0/Ymt3A==
Subject: Re: [PATCH v3 2/3] dt-bindings: Clean-up OPP binding node names in
 examples
To: Rob Herring <robh@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Tony Lindgren <tony@atomide.com>
References: <20210720144121.66713-1-robh@kernel.org>
 <20210720144121.66713-2-robh@kernel.org>
From: Georgi Djakov <djakov@kernel.org>
Message-ID: <b30f82df-86f3-51b7-df78-607d4f83f1ab@kernel.org>
Date: Tue, 20 Jul 2021 20:29:40 +0300
MIME-Version: 1.0
In-Reply-To: <20210720144121.66713-2-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Leonard Crestez <leonard.crestez@nxp.com>,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.07.21 17:41, Rob Herring wrote:
> In preparation to convert OPP bindings to DT schema, clean-up a few OPP
> binding node names in the binding examples.
> 
> Cc: Georgi Djakov <djakov@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-pm@vger.kernel.org
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Georgi Djakov <djakov@kernel.org>

> ---
>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml   | 2 +-
>   Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml   | 2 +-
>   .../devicetree/bindings/interconnect/fsl,imx8m-noc.yaml       | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 0f73f436bea7..4bea51d1e7ea 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -136,7 +136,7 @@ examples:
>         resets = <&reset 0>, <&reset 1>;
>       };
>   
> -    gpu_opp_table: opp_table0 {
> +    gpu_opp_table: opp-table {
>         compatible = "operating-points-v2";
>   
>         opp-533000000 {
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> index 696c17aedbbe..d209f272625d 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> @@ -160,7 +160,7 @@ examples:
>         #cooling-cells = <2>;
>       };
>   
> -    gpu_opp_table: opp_table0 {
> +    gpu_opp_table: opp-table {
>         compatible = "operating-points-v2";
>   
>         opp-533000000 {
> diff --git a/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml b/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
> index a8873739d61a..b8204ed22dd5 100644
> --- a/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/fsl,imx8m-noc.yaml
> @@ -81,10 +81,10 @@ examples:
>           noc_opp_table: opp-table {
>               compatible = "operating-points-v2";
>   
> -            opp-133M {
> +            opp-133333333 {
>                   opp-hz = /bits/ 64 <133333333>;
>               };
> -            opp-800M {
> +            opp-800000000 {
>                   opp-hz = /bits/ 64 <800000000>;
>               };
>           };
> 

