Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1633C9216
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 22:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0066E48F;
	Wed, 14 Jul 2021 20:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAC86E48F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 20:30:17 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id a11so2892154ilf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 13:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M9lwU/VCLeE/+nWVD4Z39mOZ46afUvQ9sGuTfqHArMo=;
 b=O2hyNvDrTT2+WUj5vtdnnpceLinCLJ3tFRKCoQCEtjrpb984XW6XnLXiGC/cBkHeF3
 I36ygm8Qwks2NwieoW/HTQhOM/WwIz15ENZMoVHRhDIMU6nw6Oht389J3xhT73/f0kOg
 D0m3D+Z5Pg2wH3mPC5Z9Nj3tKdSb8OAcOLU7ZzdvhzA2snXzIm7QgFO6jrwTGpkU1ePX
 pBjU3m+zuMtxUXnw3pimvzBkhlkAIG+uVeIvBgF1lyJxVWAwz0z2zFqb+5yKmjNxDvXm
 dY5fHE4+4Tm7NDJDf+JRLMlb/m9wBrR94qO0jOdueLaD9QLTNFMdRorBv1glnSzyFyi9
 jjZw==
X-Gm-Message-State: AOAM531b/kAREhyygp7IWy4aNMqcQuBYt5WbSxa/IrRm5IFzilBLwyYV
 dhX5PE6Aq8nbJGTXkermLA==
X-Google-Smtp-Source: ABdhPJzuzxDWx8MQSmyJj28+lBodjVhYnmHjPlW4BVR12Iypy4Ks1HdtN9MJue3JLnOTdrlwpA06AA==
X-Received: by 2002:a92:c544:: with SMTP id a4mr8336682ilj.266.1626294616647; 
 Wed, 14 Jul 2021 13:30:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id x1sm1721778ioa.54.2021.07.14.13.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:30:15 -0700 (PDT)
Received: (nullmailer pid 3466302 invoked by uid 1000);
 Wed, 14 Jul 2021 20:30:13 -0000
Date: Wed, 14 Jul 2021 14:30:13 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Innolux EJ030NA
Message-ID: <20210714203013.GA3287208@robh.at.kernel.org>
References: <20210625121045.81711-1-paul@crapouillou.net>
 <YOk60yTP9L1gT3+W@ravnborg.org>
 <HBW0WQ.NHPOJDIT9XWR1@crapouillou.net>
 <YOlvev0nvXVYU01y@ravnborg.org>
 <K4Y0WQ.MLS1MDCVFJWL3@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <K4Y0WQ.MLS1MDCVFJWL3@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, Christophe Branchereau <cbranchereau@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 10, 2021 at 11:21:56AM +0100, Paul Cercueil wrote:
> 
> [...]
> 
> > >  I am not sure; the doc states that this (additionalProperties:
> > > false) "can't
> > >  be used in case where another schema is referenced", which is the
> > > case here,
> > >  as we include "panel-common.yaml".
> > 
> > This DT schema already list all relevant properties like:
> > 
> > 	backlight: true
> > 
> > So "additionalProperties: false" tells that no other properties are
> > allowed other than the listed properties.
> > 
> > To my best understanding unevaluatedProperties: false is less strict and
> > should be used if one does not list all possilbe properties.

Right. There's some value of listing which common properties you are 
using as well.

> > This could be the case for a panel haging below a SPI controller as in
> > this case. So in other words giving this some extra thought I think
> > unevaluatedProperties: false is OK here.
> 
> A panel below a SPI controller would have all its SPI-specific properties
> covered by spi-controller.yaml, I believe? So maybe "additionalProperties:
> false" would work?

No. Because spi-controller.yaml is evaluated on the SPI host node and 
this one is evaluated on the SPI slave. There's some work to address 
this, but it means every SPI slave will have to reference a SPI device 
schema. The bigger issue here is SPI controller specific device 
properties. So for this case, we'll have to use unevaluatedProperties.

> 
> In any case, if I use "additionalProperties: false", "make dt_binding_check"
> complains that my example's "spi-max-frequency" property is not covered. So
> maybe you are right.
> 
> > So my r-b is ok if you keep it as it.
> > 
> > PS. Where do you guys hang out with the downfall of freenode - somewhere
> > on oftc?
> 
> We moved to #opendingux on Libera.
> 
> Cheers,
> -Paul
> 
> 
> 
