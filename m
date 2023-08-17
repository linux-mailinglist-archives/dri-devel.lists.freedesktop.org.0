Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486F577FA34
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F8610E058;
	Thu, 17 Aug 2023 15:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570610E058
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 15:05:21 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1bff2d2c141so4598706fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692284720; x=1692889520;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=deyjZLeLJlZBKubG6uZiC2GX/sQ0rpTBXelPhs8NNsk=;
 b=WCX1YMDceHg90Q9VDL/ZTou3tFbnUMBONWxIBO4pyfKoUEzF4PFwte1LISKChgB5/t
 eabHyn6JSK54nDzUHMEFq3vwJ+5mzh2WqJQsX1nmgrhyNuchtyIsqg6CFqpdzl2Xjab7
 fyRnsMz7e+Flq8+B9TsjgpzoUP/WtKSCB5xkCjMBlU5oOtYbume0WIjp0QdnijO8lC/n
 C8jHwEsnFVubjaB0QQzJuDTu6DWTLnFkKZT5mP2IEnhw7iQ0PXXKcbl1QlUjjbZNBpvN
 8rewbAUoxhgwtLytYpU4EWqdujeb5L/Fz+SroZRyy/zK7klRLaMcxV3xrpgx1rur98nF
 IqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692284720; x=1692889520;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=deyjZLeLJlZBKubG6uZiC2GX/sQ0rpTBXelPhs8NNsk=;
 b=cgjdEfg0MtHGRCmJPQJQY1IKUQmd1QAxfNgVtHeQ1NxaIpjBJwga0+Owhzvhzi8a3l
 57nxzjI2AHzzRJZUQ2AYf9TjkUIHrrv/5AoZ3zQLM2PYJriiuoaE3HsrSQ7ZJ5wyCOkM
 QdbbJedG+C4SLVfpkGm4UXLmA/rKf7TyXaI/xsuzE/JvnL8c7qH0E3PsXOH2+KSpGCen
 t/NmUwRTVkb2PQkxU56eUNGP+f/Nw+PxrrE+duNfdhFEI1/E2TOLnUp5aP6s4/n04JDs
 DeRgT+GILWpOE50549S1QKWPr34+UF8klTPJs3hrU6ca10j9Yh13dTahliard7JJa5Wa
 lN+A==
X-Gm-Message-State: AOJu0Ywt57XvPeKjV+ZSOnVa8fh+kZ4cZhDP0NY8LfqsaVPdozxNwWKf
 2JXa5il60yckx3iS3rsEVZMARmJjLC8=
X-Google-Smtp-Source: AGHT+IGs5rYhDcqho7rv8u5Z89EZt3O4Lm4CO/AsjRZBf+TzcBRtA0xL7NBRP7/I9upLKdtp+TH3vw==
X-Received: by 2002:a05:6871:212:b0:1be:e6d6:15c4 with SMTP id
 t18-20020a056871021200b001bee6d615c4mr5563102oad.9.1692284720360; 
 Thu, 17 Aug 2023 08:05:20 -0700 (PDT)
Received: from neuromancer. ([75.28.21.198]) by smtp.gmail.com with ESMTPSA id
 e4-20020a9d63c4000000b006b9d21100d0sm7070234otl.64.2023.08.17.08.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 08:05:19 -0700 (PDT)
Message-ID: <64de372f.9d0a0220.f75e0.abb0@mx.google.com>
X-Google-Original-Message-ID: <ZN43Lk+GKhSPZY8o@neuromancer.>
Date: Thu, 17 Aug 2023 10:05:18 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: display: newvision,nv3051d: Add
 Anbernic 351V Support
References: <20230809153941.1172-1-macroalpha82@gmail.com>
 <20230809153941.1172-2-macroalpha82@gmail.com>
 <20230810232409.GA1548096-robh@kernel.org>
 <ZNZIrOYaOar4DSkO@neuromancer.>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNZIrOYaOar4DSkO@neuromancer.>
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

On Fri, Aug 11, 2023 at 09:41:50AM -0500, Chris Morgan wrote:
> On Thu, Aug 10, 2023 at 05:24:09PM -0600, Rob Herring wrote:
> > On Wed, Aug 09, 2023 at 10:39:40AM -0500, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Document the Anbernic RG351V panel, which appears to be identical to
> > > the panel used in their 353 series except for in inclusion of an
> > > additional DSI format flag.
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  .../display/panel/newvision,nv3051d.yaml       | 18 ++++++++++--------
> > >  1 file changed, 10 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > > index 116c1b6030a2..576f3640cb33 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > > @@ -7,9 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >  title: NewVision NV3051D based LCD panel
> > >  
> > >  description: |
> > > -  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
> > > -  this driver only supports the 640x480 panels found in the Anbernic RG353
> > > -  based devices.
> > > +  The NewVision NV3051D is a driver chip used to drive DSI panels.
> > >  
> > >  maintainers:
> > >    - Chris Morgan <macromorgan@hotmail.com>
> > > @@ -19,11 +17,15 @@ allOf:
> > >  
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - enum:
> > > -          - anbernic,rg353p-panel
> > > -          - anbernic,rg353v-panel
> > > -      - const: newvision,nv3051d
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - anbernic,rg353p-panel
> > > +              - anbernic,rg353v-panel
> > > +          - const: newvision,nv3051d
> > > +
> > > +      - items:
> > > +          - const: anbernic,rg351v-panel
> > 
> > I don't understand. Is this panel not based on newvision,nv3051d? If 
> > not, then it probably should be a different binding. Lot's of panel 
> > bindings have similar properties.
> 
> It appears to be the same panel (or extremely similar, honestly I don't
> know because there are no external markings on it). However, this
> specific implementation seems to require MIPI_DSI_CLOCK_NON_CONTINUOUS,
> not using it prevents the panel from working. As for the existing panel
> MIPI_DSI_CLOCK_NON_CONTINUOUS stops it from working. The different
> binding essentially determines whether or not that flag is present, but
> otherwise everything else is identical.
> 
> Chris

If this is not correct I could also change it so instead there is a
property that toggles the MIPI_DSI_CLOCK_NON_CONTINUOUS flag, something
like "newvision,clk_non_continuous". Again aside from this flag the
panel itself is identical to the one already supported by this driver.

Thank you,
Chris

> 
> > 
> > Rob
