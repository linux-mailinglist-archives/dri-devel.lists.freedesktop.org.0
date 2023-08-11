Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0B677920E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 16:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055D710E6A6;
	Fri, 11 Aug 2023 14:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E8710E6A8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 14:41:51 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3a78604f47fso1889704b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 07:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691764911; x=1692369711;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=GJ+3y/UeL698SKMPCe4hX3oqNICH320JUvgW4hYZIVo=;
 b=CLJwpvlG7SCn1yQ8lMwgPWrrEWXv+GIyNSo7wAvFhaUtJ+FWvUq7NNWcGU/gruSIvn
 C5xXfL9prWRNhJeY98fbm7ufZjBc7MLCHfBud2MzEjNjWm0+jxV7lUIH4ohjyXn6Eo3e
 BGtCkEEhnO/3tSvDPZ6RKxD3ccSPJB+kzKnplcBSemeQXXYEiu4XrLYS05jq5CGDs8H5
 m+w3X2rFx6tGQlNN5tNLE8y7wtDHSuBrn624rMmxUiE/wLLF1TLSLnyo2fMCl9d+LLwv
 En2VHviqLOXJnZBWISClxkkrKmjFeqWgaHjlROZxAnuLeozsz1SeHw1xlS1ObFzAR9im
 8JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691764911; x=1692369711;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJ+3y/UeL698SKMPCe4hX3oqNICH320JUvgW4hYZIVo=;
 b=NbBB4gDpZni7em4LV7EG8YXt7B/to6yl9q/qwMAlOBvy8tj195Fp3uTpg8hNBjkjbr
 55hgMmD7mrz5GRPIFS48CV20lOMEXlHfwK1K4ZdnVOFrGkTRfph6RdtaWuVbnz/1RIoK
 nuoPV6b8yRzizg6HKqEeY/0WyBNrIMWp3uOkfIzW4PrP6uCfcaoFzIaL1hx2zOtpvJ0Z
 DLHQQDlMMZ2b89zlFIBwvRpGJOBVClmxH5ZoiwYQlcQck1JnEW3HR0X5xCjI8HhqJnN7
 dNpvhfbNTUueqWwbEHotdzTKTpo5NRMEu5mz2hJo9QTFulmizv10qLgAFJJvEzm32uz4
 b1sA==
X-Gm-Message-State: AOJu0Yz8N2sfCJcUcYlVErnSpzo2vk7aRHtLH5y66yvm//Cf//dd/gPa
 O1nCPdktpJ/ZY3JnVRRvSV0=
X-Google-Smtp-Source: AGHT+IH7Yr2nJH13kJ35wMx2sSnCVkYBYijI0LrIht7R9FB2EydwHt44OhImJFMS+0zigImwIb/4JA==
X-Received: by 2002:a05:6870:524f:b0:1bf:c55b:eef9 with SMTP id
 o15-20020a056870524f00b001bfc55beef9mr2338317oai.27.1691764911078; 
 Fri, 11 Aug 2023 07:41:51 -0700 (PDT)
Received: from neuromancer. ([75.28.21.198]) by smtp.gmail.com with ESMTPSA id
 o123-20020a0dfe81000000b005773b750d95sm1029946ywf.28.2023.08.11.07.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 07:41:50 -0700 (PDT)
Message-ID: <64d648ae.0d0a0220.531ba.5b33@mx.google.com>
X-Google-Original-Message-ID: <ZNZIrOYaOar4DSkO@neuromancer.>
Date: Fri, 11 Aug 2023 09:41:48 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: display: newvision,nv3051d: Add
 Anbernic 351V Support
References: <20230809153941.1172-1-macroalpha82@gmail.com>
 <20230809153941.1172-2-macroalpha82@gmail.com>
 <20230810232409.GA1548096-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810232409.GA1548096-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 05:24:09PM -0600, Rob Herring wrote:
> On Wed, Aug 09, 2023 at 10:39:40AM -0500, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Document the Anbernic RG351V panel, which appears to be identical to
> > the panel used in their 353 series except for in inclusion of an
> > additional DSI format flag.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../display/panel/newvision,nv3051d.yaml       | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > index 116c1b6030a2..576f3640cb33 100644
> > --- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > @@ -7,9 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: NewVision NV3051D based LCD panel
> >  
> >  description: |
> > -  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
> > -  this driver only supports the 640x480 panels found in the Anbernic RG353
> > -  based devices.
> > +  The NewVision NV3051D is a driver chip used to drive DSI panels.
> >  
> >  maintainers:
> >    - Chris Morgan <macromorgan@hotmail.com>
> > @@ -19,11 +17,15 @@ allOf:
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - anbernic,rg353p-panel
> > -          - anbernic,rg353v-panel
> > -      - const: newvision,nv3051d
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - anbernic,rg353p-panel
> > +              - anbernic,rg353v-panel
> > +          - const: newvision,nv3051d
> > +
> > +      - items:
> > +          - const: anbernic,rg351v-panel
> 
> I don't understand. Is this panel not based on newvision,nv3051d? If 
> not, then it probably should be a different binding. Lot's of panel 
> bindings have similar properties.

It appears to be the same panel (or extremely similar, honestly I don't
know because there are no external markings on it). However, this
specific implementation seems to require MIPI_DSI_CLOCK_NON_CONTINUOUS,
not using it prevents the panel from working. As for the existing panel
MIPI_DSI_CLOCK_NON_CONTINUOUS stops it from working. The different
binding essentially determines whether or not that flag is present, but
otherwise everything else is identical.

Chris

> 
> Rob
