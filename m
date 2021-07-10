Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D253C3407
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 11:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334306EB19;
	Sat, 10 Jul 2021 09:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6832E6EB19
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 09:59:26 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 857f2c5c-e165-11eb-8d1a-0050568cd888;
 Sat, 10 Jul 2021 09:59:31 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3AF6D194B15;
 Sat, 10 Jul 2021 11:59:34 +0200 (CEST)
Date: Sat, 10 Jul 2021 11:59:22 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Innolux EJ030NA
Message-ID: <YOlvev0nvXVYU01y@ravnborg.org>
References: <20210625121045.81711-1-paul@crapouillou.net>
 <YOk60yTP9L1gT3+W@ravnborg.org>
 <HBW0WQ.NHPOJDIT9XWR1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HBW0WQ.NHPOJDIT9XWR1@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> > >  +  backlight: true
> > >  +  port: true
> > >  +  power-supply: true
> > >  +  reg: true
> > >  +  reset-gpios: true
> > >  +
> > >  +required:
> > >  +  - compatible
> > >  +  - reg
> > >  +  - power-supply
> > >  +  - reset-gpios
> > >  +
> > >  +unevaluatedProperties: false
> > I had expected:
> > additionalProperties: false
> > 
> > With this fixed:
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I am not sure; the doc states that this (additionalProperties: false) "can't
> be used in case where another schema is referenced", which is the case here,
> as we include "panel-common.yaml".

This DT schema already list all relevant properties like:

	backlight: true

So "additionalProperties: false" tells that no other properties are
allowed other than the listed properties.

To my best understanding unevaluatedProperties: false is less strict and
should be used if one does not list all possilbe properties.
This could be the case for a panel haging below a SPI controller as in
this case. So in other words giving this some extra thought I think
unevaluatedProperties: false is OK here.

So my r-b is ok if you keep it as it.

PS. Where do you guys hang out with the downfall of freenode - somewhere
on oftc?

	Sam
