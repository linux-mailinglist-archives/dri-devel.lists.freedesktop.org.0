Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05968E1F5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 21:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1311A10E078;
	Tue,  7 Feb 2023 20:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB8410E078
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 20:37:18 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id c15so13561356oic.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 12:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2sF5RkIuECxkMvmcFPNdqGchQ0B4cLoOA3/te7YcOjE=;
 b=jX2EJ0gxMLQzKVWL8VHeNWsHqaDO7Y7MPjF0qQVnYqE1D9L2rSlth56wMWjw8rg7cj
 pmV0aCQ5rTIzk+zOwVXRMvYeouNjXM/BCGHvzkKPYRZpYozJ8r82drexmUbS+jU6Q//K
 ng8gACw+IkZJohBOKcVLy7sB2o6cAIUlAwNjXRXEbl2pbWc81ngi3YfD+C9kCVa/PgMX
 N0jhZ2BmMLlFhZA15+1tufzeOd0z3LlY6yggsFD9Q+3u+UcsMKVDxTm/fsH8SLASdHEa
 ABO9JEYjzTKeC1p0BbVy+wcLt6yWKzuPQkcgEYLhaJXvG/I8w9PrKlmI7pQUsFRmGgD/
 2dkg==
X-Gm-Message-State: AO0yUKUWTZt3a9F1ctJN0nIuQ4qvC6f6F00HcpTrGI4N0lj8AGXN1qhi
 PvSe4CAqXybudLTLZgLrcT+krU3MDw==
X-Google-Smtp-Source: AK7set/B4ylgU1A5htRkefbyGbhW6WJBI6o253nOAnJexKv2HHGfEtibv9DgFl2VyHQPuILgCzC9VQ==
X-Received: by 2002:a05:6808:30c:b0:35e:d787:ec7f with SMTP id
 i12-20020a056808030c00b0035ed787ec7fmr2022331oie.50.1675802237344; 
 Tue, 07 Feb 2023 12:37:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o66-20020acaf045000000b0037af1a17692sm3717631oih.27.2023.02.07.12.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 12:37:16 -0800 (PST)
Received: (nullmailer pid 4113072 invoked by uid 1000);
 Tue, 07 Feb 2023 20:37:16 -0000
Date: Tue, 7 Feb 2023 14:37:16 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] dt-bindings: display: panel: visionox,vtdr6130: add
 missing reg property
Message-ID: <20230207203716.GA4104426-robh@kernel.org>
References: <20230207-topic-sm8550-upstream-vtdr6130-bindings-fix-v1-1-0ba2323420c5@linaro.org>
 <Y+KaEPO7he39Gmd5@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+KaEPO7he39Gmd5@ravnborg.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 07, 2023 at 07:36:00PM +0100, Sam Ravnborg wrote:
> Hi Neil.
> 
> 
> On Tue, Feb 07, 2023 at 11:04:36AM +0100, Neil Armstrong wrote:
> > Add missing reg property and update example to add dsi top node.
> > 
> > Fixes: ef85db911134 ("dt-bindings: display: panel: document the Visionox VTDR6130 AMOLED DSI Panel")
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  .../bindings/display/panel/visionox,vtdr6130.yaml  | 34 ++++++++++++++--------
> >  1 file changed, 22 insertions(+), 12 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> > index 49e2fd4b4e99..84562a5b710a 100644
> > --- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> > @@ -16,6 +16,10 @@ properties:
> >    compatible:
> >      const: visionox,vtdr6130
> >  
> > +  reg:
> > +    maxItems: 1
> > +    description: DSI virtual channel
> > +
> Other panels using dsi uses a simple
> "	reg: true"
> 
> I think that would suffice here too.

Yes, because dsi-controller.yaml restricts it to a single entry. 
However, it's description says there can be more than 1 virtual channel 
for a device. In that case, it shouldn't be restricted in 
dsi-controller.yaml and the above with 'maxItems: 1' would be correct. 
So I'd keep this as-is.

Acked-by: Rob Herring <robh@kernel.org>

Rob
