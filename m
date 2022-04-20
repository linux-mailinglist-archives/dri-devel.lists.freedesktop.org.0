Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B284509219
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 23:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA1710F2C0;
	Wed, 20 Apr 2022 21:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3CD10F2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 21:30:27 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id a10so3536346oif.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 14:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oKAyPnurUXqIpBjCXwQJqvX5yNXzu0aL/OrfPo6b7fE=;
 b=QTizAuTVVj26nzyuZTvyXFwdX/gBWHv3qEb6hNWSI1LqTh+q9u4skuvBWc2u2M5iaM
 fV9zlN4AnBWrRSva1WdPUTZXNUWCwszSjU/EKLTp8714L/UiaeTsrk5NUbRkBlRv2lWV
 wqPWfy6FeHrswI0BvLmKE0Yf+0Ou4e10smifXqqGmAjG7JA4NHuHdI5xEPSga9vPg1oX
 gp3LWWbyA0JYDowDKXAAUvDbnJRPOdxZ9QLmBtM3DEzswmfdPnv768GY+2WdmBAsF7rE
 xMZKYleKd6Xbg6ZUQXnWqgztwfi/OM6WSnZpkbZbUt+Xg/nu4MFD3fs3RHQdPvJ/rSzh
 bdgw==
X-Gm-Message-State: AOAM532+2XAWOfN44yNdWVseU1nlxCX+ESXmLkzxqaVoFiz8BZ7T7lgV
 0gb7+GZ0wCFpMhOlqKJOvA==
X-Google-Smtp-Source: ABdhPJxq9dTo9U+3/KCPdMhKSiga9fBO1UGN4lQPRboNsT8JQZfOkPOQL2vKXUutOjDSBWzmgyVeRA==
X-Received: by 2002:a05:6808:1691:b0:2f9:4bd7:581e with SMTP id
 bb17-20020a056808169100b002f94bd7581emr2558521oib.144.1650490225602; 
 Wed, 20 Apr 2022 14:30:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 pp23-20020a0568709d1700b000e2d876505dsm406800oab.32.2022.04.20.14.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 14:30:25 -0700 (PDT)
Received: (nullmailer pid 1882568 invoked by uid 1000);
 Wed, 20 Apr 2022 21:30:24 -0000
Date: Wed, 20 Apr 2022 16:30:24 -0500
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,am65x-dss: Add missing
 register & interrupt
Message-ID: <YmB7cE0LsyWoiOsh@robh.at.kernel.org>
References: <20220419070302.16502-1-a-bhatia1@ti.com>
 <20220419070302.16502-2-a-bhatia1@ti.com>
 <Yl7FEuHEy66KUc5F@robh.at.kernel.org>
 <f5eb63b1-8381-99c8-55fa-cc9287103aa8@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5eb63b1-8381-99c8-55fa-cc9287103aa8@ideasonboard.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 10:05:34AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 19/04/2022 17:20, Rob Herring wrote:
> > On Tue, Apr 19, 2022 at 12:33:01PM +0530, Aradhya Bhatia wrote:
> > > The DSS IP on the ti-am65x soc supports an additional register space,
> > > named "common1". Further. the IP services a maximum number of 2
> > > interrupts.
> > > 
> > > Add the missing register space "common1" and the additional interrupt.
> > > 
> > > Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> > > ---
> > >   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml   | 10 +++++++---
> > >   1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > > index 5c7d2cbc4aac..102059e9e0d5 100644
> > > --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > > @@ -26,6 +26,7 @@ properties:
> > >         Addresses to each DSS memory region described in the SoC's TRM.
> > >       items:
> > >         - description: common DSS register area
> > > +      - description: common1 DSS register area
> > 
> > You've just broken the ABI.
> > 
> > New entries have to go on the end.
> 
> I'm curious, if the 'reg-names' is a required property, as it is here, does
> this still break the ABI?

Yes, the order is part of the ABI.

Sometimes we just give up with multiple optional entries or inherited 
any order allowed, but here there is no reason. Just add 'common1' to 
the end.

Rob
