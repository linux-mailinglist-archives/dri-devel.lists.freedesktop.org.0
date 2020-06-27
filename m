Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76B20C204
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 16:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BC96E067;
	Sat, 27 Jun 2020 14:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C796E067
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 14:18:07 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC7DF21655;
 Sat, 27 Jun 2020 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593267487;
 bh=cIt6opZa+yAA6PsRPnToKEVJTOvIWVfLvMCDwYPe3Xk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dTMsD6U1Gd9Qs59wnuvSXVIWP5yBbcKqUWOEqIRqRg003TxHdGjemMqUAOW021M3y
 LDlPtAuI31mU3xn8qrXtq2QDqTSP5QolxLsRAKvrYHTzpwdnUsjZGyjJuFuLOycqOU
 AnY4+beRGssrk+yVQP7fbEVlO0Tvb6GdFd3ZedEA=
Date: Sat, 27 Jun 2020 16:18:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Erwan Le Ray <erwan.leray@st.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: add generic DT binding for
 announcing RTS/CTS lines
Message-ID: <20200627141801.GA1945477@kroah.com>
References: <20200520133932.30441-1-erwan.leray@st.com>
 <20200520133932.30441-2-erwan.leray@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520133932.30441-2-erwan.leray@st.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 linux-serial@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020 at 03:39:31PM +0200, Erwan Le Ray wrote:
> Add support of generic DT binding for annoucing RTS/CTS lines. The initial
> binding 'st,hw-flow-control' is not needed anymore since generic binding
> is available, but is kept for backward compatibility.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> 
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 75b8521eb7cb..06d5f251ec88 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -35,9 +35,11 @@ properties:
>      description: label associated with this uart
>  
>    st,hw-flow-ctrl:
> -    description: enable hardware flow control
> +    description: enable hardware flow control (deprecated)
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> +  uart-has-rtscts: true
> +
>    dmas:
>      minItems: 1
>      maxItems: 2
> -- 
> 2.17.1
> 

Did this get ignored by the DT maintainers?  :(
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
