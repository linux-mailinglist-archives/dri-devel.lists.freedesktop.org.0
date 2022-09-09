Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2F5B2BC4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 03:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EC810E170;
	Fri,  9 Sep 2022 01:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3501710E170
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 01:42:37 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-127ba06d03fso393618fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 18:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=k3ScBrdUpQV0mmDuXkh/kVD6wa4mJPKptDrQ+It7jBE=;
 b=mZ8LGmIwvxg2Cmgf4bU2D3xXR2eCAYiF9uXQl5iODnBMCicikQomPO3jYhFmWKsdkS
 out/d+UOgqGqJNvpEhePMOU5AmQk1lSMH9QuCu/JG62bb7YXQDuVQvJ22B5kuD4WsY6W
 QTLLm54lYghAAZDwfjbD2zWsI5i4SsSaDw0FnuGeijm4Ll/zYHNkmq/EQvj+2wr1DcEO
 mdc/kCdaZhCnzPFgK/4W1U9k2y5xIsOjvKovrprmCTTjer9RAAFK44MdS7BgJq89bfpr
 xK8opG5AGs1bzHuGjOiId72k/0QFmkNeWnNkapvHQw9TqjH7efYghDe7yEthSH/ik3vh
 ns8Q==
X-Gm-Message-State: ACgBeo00wqed5AcCBhwsTKuy6Ld+5oJfHrT9L2CxrTF8YGNMk92rF5iQ
 btCvejlqUAK5QnjTU8dOFg==
X-Google-Smtp-Source: AA6agR4rlV0mC72q/deH/XOz9cifwLj3z/poG7D26YoSR8U4jbt0FhSHug0ssxzK70/h73qpUQPhVw==
X-Received: by 2002:a05:6808:aa1:b0:34d:f86a:4364 with SMTP id
 r1-20020a0568080aa100b0034df86a4364mr234214oij.141.1662687756414; 
 Thu, 08 Sep 2022 18:42:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y15-20020a056870b48f00b00127dc5bb89esm426063oap.37.2022.09.08.18.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 18:42:36 -0700 (PDT)
Received: (nullmailer pid 3743638 invoked by uid 1000);
 Fri, 09 Sep 2022 01:42:35 -0000
Date: Thu, 8 Sep 2022 20:42:35 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add NewVision NV3051D
 panel bindings
Message-ID: <20220909014235.GA3737396-robh@kernel.org>
References: <20220906185208.13395-1-macroalpha82@gmail.com>
 <20220906185208.13395-2-macroalpha82@gmail.com>
 <cbdbc7d8-a3b9-d960-68c7-457c947e4285@linaro.org>
 <SN6PR06MB534207102C2E8AFCE63C3231A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR06MB534207102C2E8AFCE63C3231A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 08:35:13AM -0500, Chris Morgan wrote:
> On Wed, Sep 07, 2022 at 02:53:56PM +0200, Krzysztof Kozlowski wrote:
> > On 06/09/2022 20:52, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Add documentation for the NewVision NV3051D panel bindings.
> > > Note that for the two expected consumers of this panel binding
> > > the underlying LCD model is unknown.
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  .../display/panel/newvision,nv3051d.yaml      | 48 +++++++++++++++++++
> > >  1 file changed, 48 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > > new file mode 100644
> > > index 000000000000..016168d8d7b2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> > > @@ -0,0 +1,48 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fpanel%2Fnewvision%2Cnv3051d.yaml%23&amp;data=05%7C01%7C%7C69d30de15aea41517acb08da90d0079f%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637981520397977782%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=qfuvbrQYP3rKnp%2ByPmPmn%2BCJJOQkNkTGT49FkJmIics%3D&amp;reserved=0
> > 
> > You need to document vendor prefix... but the filename does not match
> > compatible.
> 
> Okay, will do that. This is a tricky one because while I know the panel
> controller IC (a NewVision NV3051D) I don't actually know the LCD panel
> itself, the vendor is somewhat tight lipped. I do know the product it
> goes into, so that's why I did what I did with the compatible strings.
> If that's not correct I guess let me know. I did see for other drivers
> (such as the NewVision NV3052C) the driver was written for the IC
> and the panel name was listed differently, hence what I was going for
> here.

I think most cases like this targeting a specific LCD driver IC, there's 
a driver IC compatible as a fallback. 

(TBC, 'driver' here is not Linux driver, but the h/w chip.)

Rob
