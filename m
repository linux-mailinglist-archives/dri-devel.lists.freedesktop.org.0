Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA07AB4CF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E2010E695;
	Fri, 22 Sep 2023 15:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CB010E696
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:30:11 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1d63d38c74fso1183726fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 08:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695396610; x=1696001410; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4TJHGEmsDY+NAj3iBtyvpvCWy99F2/68mZJZrN4IAhk=;
 b=dzL//9gojFVjigkJubwxoPhPEurOI+PXghiSmXaCcKb19fewg7MEj/v97evXuVOUg2
 Q63t1IFzPAqa6RVJnE2sk1pujzW3QEIZOra1GsxwzjpRdLy78BJ+uMsd4LwnFpzSWlI9
 oLuqpOMUL4Lm62wp9/ixrSnUkWbnv1Fdm+Aoz/adaSTO7DkYXyTBX0atO66FzSiganqq
 gMc5S1O84QINJJqh9adAEfnX+YnuFoL2ANeyyw1rr0NGLS3BsoNUQMBKIpNF/05wtroi
 zc/JM919np+TXn1+NpLHwHTf7if9P59hSk+PQs0z9y9Ocofz7MZ8Sagd7m8In+Q7Oayj
 n1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695396610; x=1696001410;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4TJHGEmsDY+NAj3iBtyvpvCWy99F2/68mZJZrN4IAhk=;
 b=gFe7uxJI7g5X/uPjs30Y9xkbYOUAc2GOpGAtWAOKCFH+sPOX8OYxwTRsBVa4cJXL74
 /nUKHS/SXuRlA9eXMEFO2gSytWCpkZlY/rMxpalV3yMRIltfHsGMYk0rkqG3S17zT60g
 0/CT9UaP8l9NGkG0iLsAUP96TVKBXI+IV6lCvmGqjPkCKF9lZwgH5/cGlayPKKvS9tbP
 QZIS7/3hLxRCalb+ZgH0aXYpJQVie2Odjli72UIyII/CydzkXG9uJN0aH4f5LN80yBA9
 ndynJRrCaXdkDb44OkBvM1tvciEhq+0LlaGRp2yPMRT3El+Dydg6OXr6Gn3LYJljapxY
 x1+g==
X-Gm-Message-State: AOJu0YyiDWpk65WRjAj2ZNotl6KgjfTXX5CXK+EetUyFUOq1TpgGOa05
 uz4YrtDvjxB3NkcE5UrDthc=
X-Google-Smtp-Source: AGHT+IFpSNDfMbLwVAsfGTShXUDcaUIcejeAJrl4tdhrT/QF27f/mmhhBUZ++d9tBy4mUoUcC2tnuA==
X-Received: by 2002:a05:6870:ad84:b0:1dc:86e5:ebd7 with SMTP id
 ut4-20020a056870ad8400b001dc86e5ebd7mr3924903oab.58.1695396610376; 
 Fri, 22 Sep 2023 08:30:10 -0700 (PDT)
Received: from neuromancer. ([75.28.21.198]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056870530200b001cd20f30898sm1071170oan.24.2023.09.22.08.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 08:30:09 -0700 (PDT)
Message-ID: <650db301.050a0220.81e83.87ad@mx.google.com>
X-Google-Original-Message-ID: <ZQ2y/d2GX9H77Ko9@neuromancer.>
Date: Fri, 22 Sep 2023 10:30:05 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: display: newvision,nv3051d: Add
 Anbernic 351V Support
References: <20230809153941.1172-1-macroalpha82@gmail.com>
 <20230809153941.1172-2-macroalpha82@gmail.com>
 <20230810232409.GA1548096-robh@kernel.org>
 <64d648ae.0d0a0220.531ba.5b33@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64d648ae.0d0a0220.531ba.5b33@mx.google.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 09:41:48AM -0500, Chris Morgan wrote:
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

I don't want to lose sight of this, but I am not sure how to proceed.
What I can do instead is change the compatible string inside the driver
from newvision,nv3051d to either anbernic,rg353p-panel or 
anbernic,rg351v-panel. Then, I can remove anbernic,rg353v-panel as an
enum and replace it with anbernic,rg351v-panel. The gist of this is
that we have a Newvision NV3051D panel that will still be supported by
this driver in 2 different configurations, the 353P (which is identical
to the 353V) and the 351V (which has different mode flags but is
otherwise identical).

So long story short would it work if I did this, and modified the
driver and all in-use devicetrees accordingly? To my knowledge this
panel is only in use on boards that I submitted so I can update all
those and test them.

      - enum:
          - anbernic,rg351v-panel
          - anbernic,rg353p-panel
      - const: newvision,nv3051d

Thank you,
Chris.

> 
> > 
> > Rob
