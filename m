Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4BB645E3B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B4410E3D8;
	Wed,  7 Dec 2022 15:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1034910E10F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 15:59:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AC014853BD;
 Wed,  7 Dec 2022 16:59:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670428791;
 bh=ms2mwtT7aRwGzjGYHlW5n2LBfPTpWBYZ4lzdTnO5gKc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TgBgPeATS8TMOzxM9kZs2BM94lq8bTkD2vYBADV+Rpnubl9kBfusFI2i/U4Owhyd5
 GNI1qd50fQFgrZM1rKcLuk7dkhAhLw2BsgKBXOZwRgB/W3GLGIbR5++pK3q3wT1sWZ
 djdhaICoh6RSLkA/eqyo5su3lb/MfYrkiqGVNhbcPYUv9W/ZAWc+tYOTBp2GKy7DyA
 e72swAKR0ArZvaKI4VTtHtMGSFDp0bRuZ+ZdmkzFNi+hDOJOHhKXJmRghDcskJIYaZ
 iTXuj7Y+Ib1XQYvSGrwMKOfCvWVe77HRf/ulbAXpSu2hXBCjdua/Np36ySdgH46oLv
 ujRnyXzWRLTXg==
Message-ID: <e5d8f530-9814-48eb-76b3-e4712300466d@denx.de>
Date: Wed, 7 Dec 2022 16:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] dt-bindings: lcdif: Fix clock constraints for imx8mp
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/22 16:13, Alexander Stein wrote:
> i.MX8MP uses 3 clocks, so soften the restrictions for clocks & clock-names.
> 
> Fixes: f5419cb0743f ("dt-bindings: lcdif: Add compatible for i.MX8MP")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 876015a44a1e6..793e8eccf8b8b 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -70,7 +70,9 @@ allOf:
>         properties:
>           compatible:
>             contains:
> -            const: fsl,imx6sx-lcdif
> +            enum:
> +              - fsl,imx6sx-lcdif
> +              - fsl,imx8mp-lcdif
>       then:
>         properties:
>           clocks:

Reviewed-by: Marek Vasut <marex@denx.de>

btw you might want to update the clock-names and clock proerty order in 
imx8mp.dtsi to match the clock-names order in these bindings.
