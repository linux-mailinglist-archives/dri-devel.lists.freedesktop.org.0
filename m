Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD482563869
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 19:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E05113426;
	Fri,  1 Jul 2022 17:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEB812A182
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 17:08:57 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id p128so2887806iof.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 10:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7x9Mh8w297MwFJ5ekAbnyTjXL0rl1Jcq1H4Y3M0yNlk=;
 b=olvGjTklbTtrRztXJnjmccCVojYXSHFoLt1ZYTESODexO0vqBAOXu9h1zdpuNcT3P9
 Eo4YhleMvOsVTBA0CnKoBWb3X+A/HSx8kF4uTS8NaISxJarBy82YpZyAfFzDxAb7nECk
 WpJjBY/KOKaPyLMrp/4a63Jwb8I8FRPsLcsef5wbWen+jL1nT5TqQkdSi+dOoHr/DD9j
 tkmQEr/yQF0IC6tg/GZfLRlxC8vXbDOZka0GRRqvX+BOYCNKF8DkONbk+KK4TvJCi3Ov
 YvboiWteQ3m6NOKBiiakUcdBTo3xKE7WILzAn1g69q3Hg/KmNpvRWQ160eELw9boQoum
 VJTA==
X-Gm-Message-State: AJIora86IDefMMqzep39ddjt/ogiJKCpbeE2q/eVCRMwJ21w0X7K5jLd
 jxT9qKNUG9lQRAQGckK+9g==
X-Google-Smtp-Source: AGRyM1vBRNpsTzEOkSJyjDkutfX14+32xQ6Li0MoOtnjvfsPztC0GvxitNjaHnOMuLw2m0eRj4VzBg==
X-Received: by 2002:a05:6602:2112:b0:675:8c8f:e8c with SMTP id
 x18-20020a056602211200b006758c8f0e8cmr7385488iox.70.1656695336690; 
 Fri, 01 Jul 2022 10:08:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a02cc50000000b0033d76a6196asm2235378jaq.171.2022.07.01.10.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 10:08:56 -0700 (PDT)
Received: (nullmailer pid 1146926 invoked by uid 1000);
 Fri, 01 Jul 2022 17:08:54 -0000
Date: Fri, 1 Jul 2022 11:08:54 -0600
From: Rob Herring <robh@kernel.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel-common: allow for
 additional port node properties
Message-ID: <20220701170854.GA1092383-robh@kernel.org>
References: <20220628181838.2031-1-max.oss.09@gmail.com>
 <20220628181838.2031-2-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628181838.2031-2-max.oss.09@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 max.krummenacher@toradex.com,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 08:18:35PM +0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Allow bindings which reference panel-common.yaml to add additional
> properties under the port node.
> I.e. 'panel-dpi' needs to add a new property to 'port/endpoint'.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> 
> ---
> 
> Changes in v3:
> - New commit to allow for additional port node properties
> 
>  .../devicetree/bindings/display/panel/panel-common.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index 5b38dc89cb21..ff8dc07ef3b5 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -68,7 +68,7 @@ properties:
>  
>    # Connectivity
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base

This will allow extra properties for everyone using this. That means 
either bus-format needs to go in here (so that it is the only extra 
property allowed) or we should remove 'port' here and push this into all 
the users.

But we should reach agreement on bus-format before doing anything.

Rob
