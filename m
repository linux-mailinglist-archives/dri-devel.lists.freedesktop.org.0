Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37349B5332
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 21:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D68110E046;
	Tue, 29 Oct 2024 20:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="k8rf1+W1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A1810E6F8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 20:16:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D60D08918D;
 Tue, 29 Oct 2024 21:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1730233014;
 bh=H+lGWeiG62Rx2h95bhSpgfprwsFOBg0cam5XaKgmB+E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k8rf1+W1QI+Bn3HpsSJ3PGPYleL3mhY6IGCarQR+dnEHaYpnC6ZAeam853jtGV0yh
 oft9S2JdB0GNHqx34C9YmZ18acIx9QCZYc14t5tPy3aHcNf8UCK0RcZ7bDUc1/5++f
 OCzZYm34JLOlRQcYx+OccDNXFNcYR35cw4I6OHT0+H8hjqoKmuIrtbipAe2OEmNHH4
 3gYAcB4BMDs2u+jRCP4KwaX+CS3/esR3IW0nfaIGYJ/Up5i8grzc+VALIcIzLNgQFJ
 VobB4dVzR5hYvw0Tsc6umiZ/uyr3lriEJJM4+GS09M+cGqBYFbPq/VHlx/GwveMgY5
 Hcbd9gkLRqoxw==
Message-ID: <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
Date: Tue, 29 Oct 2024 21:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: a.fatoum@pengutronix.de, andreas@kemnade.info, kernel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20241029191640.379315-1-festevam@gmail.com>
 <20241029191640.379315-2-festevam@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241029191640.379315-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/29/24 8:16 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> 
> This causes dt-schema warnings as the current binding only
> allow 'fsl,imx6sx-lcdif' as fallback.
> 
> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> The imx6sx-lcdif programming model has more advanced features, such
> as overlay plane and the CRC32 support than the imx28-lcdif IP.
> 
> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
> fsl,imx28-lcdif fallback:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This helps keeping DT compatibility as well as using the more advanced
> lcdif features found on imx6sl and imx6sll.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Make the three compatible entres the only valid combination
> for imx6sl and imx6sll (Andreas).
> 
>   Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index ad0cca562463..72e509bc975b 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -23,14 +23,18 @@ properties:
>             - fsl,imx93-lcdif
>         - items:
>             - enum:
> -              - fsl,imx6sl-lcdif
> -              - fsl,imx6sll-lcdif
>                 - fsl,imx6ul-lcdif
>                 - fsl,imx7d-lcdif
>                 - fsl,imx8mm-lcdif
>                 - fsl,imx8mn-lcdif
>                 - fsl,imx8mq-lcdif
>             - const: fsl,imx6sx-lcdif
> +      - items:
> +          - enum:
> +              - fsl,imx6sl-lcdif
> +              - fsl,imx6sll-lcdif
> +          - const: fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif
Shouldn't this be

- enum:
   - fsl,imx6sl-lcdif
   - fsl,imx6sll-lcdif
   - fsl,imx6sx-lcdif
- const: fsl,imx28-lcdif

So you wouldn't have to write three compatible strings for the 6sl/sll , 
but only two ? I.e. this:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

?
