Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCD582DD9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 19:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BB1BF2E7;
	Wed, 27 Jul 2022 17:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0128BBF2E7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 17:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=G1yxjX0ml7bWjfSawJ8KXkM7VbWITujIankz7OQDQDU=;
 b=jVM4agKAWmOwyeSa7KfEytokRMEy91zpRYZ1NLJSLohJKav/IH4ouKcVky9D2m31qboTIRepA65IP
 aebcArchP+KYFud7n8Ar/0HyY2vkibNKiEJpIVFUX593g8guc09F45+BJfD5xuesQl/ahpWRkbk2Cp
 mVuWtKIdbOCamxgL9ES6KRDHzyT63GI38lnbMhVAsFFEC1/1nsDFjaXY5a9IwFzo033DrNWN7+fsf7
 Jn8KtD2dNw+qizO9gksC35QEiE+M3ldYWOoKyKVkHKAjkY0FVMvXpJxdmxrAMW0QuyRudI3Q7d4hnp
 SWjbcEdB74BUyXJj/KELhPa99Vk9iDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=G1yxjX0ml7bWjfSawJ8KXkM7VbWITujIankz7OQDQDU=;
 b=lDk1ZjUPf5ZpN4MXa95KlvR0P9gIsDqDNA2gITqap0cMWkMJAGeAc7mQQND/XPpzx3GziAs6twqUL
 JCjKCq6Aw==
X-HalOne-Cookie: 8a64bf85c0aa5d803b906c36b6265a74ceb1f174
X-HalOne-ID: 2a675d83-0dce-11ed-a6c8-d0431ea8a283
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 2a675d83-0dce-11ed-a6c8-d0431ea8a283;
 Wed, 27 Jul 2022 17:04:24 +0000 (UTC)
Date: Wed, 27 Jul 2022 19:04:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: use spi-peripheral-props.yaml
Message-ID: <YuFwF/sOk4svIlkK@ravnborg.org>
References: <20220727164312.385836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727164312.385836-1-krzysztof.kozlowski@linaro.org>
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
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Schocher <hs@denx.de>, David Lechner <david@lechnology.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On Wed, Jul 27, 2022 at 06:43:12PM +0200, Krzysztof Kozlowski wrote:
> Instead of listing directly properties typical for SPI peripherals,
> reference the spi-peripheral-props.yaml schema.  This allows using all
> properties typical for SPI-connected devices, even these which device
> bindings author did not tried yet.
> 
> Remove the spi-* properties which now come via spi-peripheral-props.yaml
> schema, except for the cases when device schema adds some constraints
> like maximum frequency.
> 
> While changing additionalProperties->unevaluatedProperties, put it in
> typical place, just before example DTS.
> 
> The sitronix,st7735r references also panel-common.yaml and lists
> explicitly allowed properties, thus here reference only
> spi-peripheral-props.yaml for purpose of documenting the SPI slave
> device and bringing spi-max-frequency type validation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

I assume this will be added to the same tree as the SPI CPHA and CPOL
patch.

	Sam
