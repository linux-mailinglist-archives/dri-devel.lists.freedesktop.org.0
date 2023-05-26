Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34919712472
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4D810E7D7;
	Fri, 26 May 2023 10:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D65E10E7D7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 10:20:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30ab87a1897so300681f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685096435; x=1687688435;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K3s8ooFUr7HL+mpTddtdIbpP60KFH9AqWFjPieFL2f0=;
 b=p544sBJGWXY4zsoCH8La6KGT/b7IZ3KC4/Cb2RBc6TTAQ079uZ0TwZKZIDE9bY9mdN
 jSyDQeGQHabEWxnqNhx+63wreMSikab92tS6SWP0/5800mboefbLbjXRsQMYDiedr1WA
 KIEhNxV63VtqbDewUfiGREsbFWZZsTzTxdWXp6ufmAiqrfiH5WGmBkgpMk2SHJtBRcRp
 EmlqjNdxsElkCSvP/mwKx7jx83BCMzCjjf+Ufqv4D47faVqctT4cyWTwNlRZ6P9XLUaO
 1vePDY7gGucj3mMbS8Jv1+7zmqhSzuCEVMaa5xmHv/zb8F/ivWyzy8DSK/Giu8OVFr8o
 SHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685096435; x=1687688435;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3s8ooFUr7HL+mpTddtdIbpP60KFH9AqWFjPieFL2f0=;
 b=PyODxOlx/l3jt569ae7Rg3bLE1GYCjNxsaJDasftelZp2Umjq62JwHvzEHbjz7CJ+c
 iTL7/goO0sgFtSSx4fWjMuprNiRhzncwHANMxHQTnlvnTUulJPTLofSvSyQan8xY+FBF
 2nz6v6Rbwob1672cbnmQQafSWBJ2FZY/a++L31HczdItB0DypLzcqIdYHGnCQcpq8nbA
 S1BXLVXop7RsRr4YBhVq8tb6rbigwObQyH7jgJ+IpxyrQgStf0eTKuNX0CkTuOI4u+Q1
 m1y1EODhINvp29lElFLu3Dj0iZLu3t8ODKKcX/uXFQ1C8tiMm5yWdGh8WjPczLTkSHmM
 p7sA==
X-Gm-Message-State: AC+VfDzC2M8UBpjsRbqpieHMsSSE7wx38SKLywNrdIL5syqbpHuh0r0h
 hOqswPnMalHxOuMlVFjprQ4N/w==
X-Google-Smtp-Source: ACHHUZ6Yy3l1CCvu264LHxVdtKGZKPPjZRT/yx0dNniT9+GDgWRelslel+8Hr4u3Yzz8fMPt5HybXQ==
X-Received: by 2002:a5d:5402:0:b0:30a:b030:9cdd with SMTP id
 g2-20020a5d5402000000b0030ab0309cddmr956532wrv.25.1685096435053; 
 Fri, 26 May 2023 03:20:35 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a5d508f000000b002ceacff44c7sm4535860wrt.83.2023.05.26.03.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 03:20:34 -0700 (PDT)
Date: Fri, 26 May 2023 11:20:32 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH 2/2] dt-bindings: backlight: document new property
 default-brightness-level
Message-ID: <20230526102032.GB626291@aspen.lan>
References: <20230519200520.10657-1-alex@shruggie.ro>
 <20230519200520.10657-2-alex@shruggie.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519200520.10657-2-alex@shruggie.ro>
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Philippe CORNU <philippe.cornu@foss.st.com>, pavel@ucw.cz,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 11:05:20PM +0300, Alexandru Ardelean wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
>
> Add documentation for new default-brightness-level property.
>
> Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---
>
> Link to original patch:
>   https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14ffd49892c4ce663cdafe98
>
>  .../bindings/leds/backlight/gpio-backlight.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> index 584030b6b0b9..b96c08cff0f0 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> @@ -23,6 +23,15 @@ properties:
>      description: enable the backlight at boot.
>      type: boolean
>
> +  default-brightness-level:
> +    description:
> +      The default brightness level (index into the array defined by the
> +      "brightness-levels" property).

gpio-backlight does not have a brightness-levels array property!

I think it is also necessary to improve the docs of both properties to
distinguish between the meaning of default-on and
default-brightness-level. The result of setting default-on and
default-brightness level to zero is that the GPIO will be off (this is
correct behaviour but hard to figure out from the current text).

default-on is a control that can "enable" the backlight at boot when it
is not linked to a display in the DT (e.g. it is mostly for legacy
cases). When the backlight is linked to a display then the backlight
enable state will be automatically linked to the display enable state
instead.

default-brightness-level is useful for handling displays that
are still readable with the backlight off (e-ink, reflective/
transflexive LCD, etc), otherwise is should be absent or set to 1.


> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +dependencies:
> +  default-brightness-level: [ "brightness-levels" ]

As above, depending on brightness-levels doesn't make any sense here.


Daniel.
