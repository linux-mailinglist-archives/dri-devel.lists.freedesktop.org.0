Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1D28D169
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 17:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E476E117;
	Tue, 13 Oct 2020 15:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA586E117
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 15:42:38 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 16so22905394oix.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 08:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7HBDGBEJfyjtmUpYlLyhbIBIpuYqlwSspPw7rMsxz2U=;
 b=aeBF3SGrOxBEq+jfAsncc9K8pDCiz4P1ZktNQl0h9+9LVH9lohdOG7NeZo6FiGBa86
 2X6Ye3QyyqSqFX+213wLig7dYWLUkFVsWWcR3XE8QlPth/jM5muD2cgHQTnVS6aMRhyD
 7TovS7GaRt6XcOOSRoJrIhP+1y7O9BFcHtSmB4JUacxT/8g8ak6ibqY/GORb6PLlxMGC
 D0+MURrxZw75kGIRXOsgpTFfUfOQ7btOrwIkOFJ1iFG2nL2PqlCawtGt5UwD3zkB6xyP
 eWXO1WAWiwfzt//Ut4Bvq/k0YfhwKmQ2rslkQ7wmnrLETfDVrKFuuePYqs5E+xiScqyv
 dKfg==
X-Gm-Message-State: AOAM531yExHlXLeKMUK5La0KJTkRnMgOFZCEUuF8jZ+cC6jJjJ3U5RVX
 5Qelk0IYSVmz03KvKtoZdQ==
X-Google-Smtp-Source: ABdhPJzNo1mwBWQ0pardH8uKZ+d/cwmUY5rjx3lm4PdGa4S0bZqBqsudnhysYq5uJGcdyzX0fegL0g==
X-Received: by 2002:aca:40f:: with SMTP id 15mr222689oie.44.1602603757535;
 Tue, 13 Oct 2020 08:42:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y13sm25534ote.45.2020.10.13.08.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 08:42:36 -0700 (PDT)
Received: (nullmailer pid 3571584 invoked by uid 1000);
 Tue, 13 Oct 2020 15:42:36 -0000
Date: Tue, 13 Oct 2020 10:42:36 -0500
From: Rob Herring <robh@kernel.org>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
 KeemBay Display
Message-ID: <20201013154236.GA3562909@bogus>
References: <1602205443-9036-1-git-send-email-anitha.chrisanthus@intel.com>
 <1602205443-9036-2-git-send-email-anitha.chrisanthus@intel.com>
 <dc12f5ea-60bc-8a09-9b93-a4472183adc4@baylibre.com>
 <BY5PR11MB41827BBE3556CD7972E6C4328C040@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB41827BBE3556CD7972E6C4328C040@BY5PR11MB4182.namprd11.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 12:24:38AM +0000, Chrisanthus, Anitha wrote:
> Hi Neil,
> 
>  Thanks for your review, please see my reply inline.
> 
> > -----Original Message-----
> > From: Neil Armstrong <narmstrong@baylibre.com>
> > Sent: Friday, October 9, 2020 2:10 AM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; dri-
> > devel@lists.freedesktop.org; devicetree@vger.kernel.org; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Cc: Dea, Edmund J <edmund.j.dea@intel.com>; sam@ravnborg.org
> > Subject: Re: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
> > KeemBay Display
> > 
> > Hi,
> > 
> > On 09/10/2020 03:03, Anitha Chrisanthus wrote:
> > > This patch adds bindings for Intel KeemBay Display
> > >
> > > v2: review changes from Rob Herring
> > >
> > > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > ---
> > >  .../bindings/display/intel,keembay-display.yaml    | 99
> > ++++++++++++++++++++++
> > >  1 file changed, 99 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/intel,keembay-
> > display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-
> > display.yaml
> > > new file mode 100644
> > > index 0000000..a38493d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/intel,keembay-
> > display.yaml
> > > @@ -0,0 +1,99 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/intel,keembay-
> > display.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Devicetree bindings for Intel Keem Bay display controller
> > > +
> > > +maintainers:
> > > +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > +  - Edmond J Dea <edmund.j.dea@intel.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: intel,kmb_display
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: Lcd registers range
> > > +      - description: Mipi registers range
> > 
> > Looking at the registers, the MIPI transceiver seems to be a separate IP,
> > same for D-PHY which should have a proper PHY driver instead of beeing
> > handled
> > here.
> > 
> The LCD, MIPI DSI, DPHY and MSSCAM as a group, are considered the 
> display subsystem for Keem Bay. As such, there are several 
> interdependencies that make splitting them up next to impossible and 

Please detail what those inter-dependencies are. It's doubtful that you 
have anything we have not had to deal with in other SoCs.

> currently we do not have the resources available for that effort.

That is certainly not justification for accepting this.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
