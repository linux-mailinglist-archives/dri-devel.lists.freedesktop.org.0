Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207531CE05D
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 18:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3677389970;
	Mon, 11 May 2020 16:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958ED89970
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 16:26:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 24955804E0;
 Mon, 11 May 2020 18:26:24 +0200 (CEST)
Date: Mon, 11 May 2020 18:26:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: robh+dt@kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
 laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200511162622.GA19798@ravnborg.org>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506155320.GC15206@pendragon.ideasonboard.com>
 <20200511145911.2yv3aepofxqwdsju@rcn-XPS-13-9360>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511145911.2yv3aepofxqwdsju@rcn-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=_bxB9wg1tD68s7t2c6IA:9 a=wPNLvfGTeEIA:10
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ricardo.

On Mon, May 11, 2020 at 04:59:11PM +0200, Ricardo Ca=F1uelo wrote:
> Hi Rob,
> =

> What's your opinion on this?

I'm not Rob, but anyway.
> =

> Some context: It's about bindings that define signed integer properties
> with range checks that go below and above zero. The schema checker fails
> because, apparently, it interprets every cell value as an uint32, which
> makes the range check fail for negative numbers.
> =

> > > >    b) Redefine this property to be closer to the datasheet descript=
ion
> > > >    (ie. unsigned integers from 0 to 7) and adapt the driver accordi=
ngly.
> > > >    This would also let us define its range properly using minimum a=
nd
> > > >    maximum properties for it.
> > > > =

> > > >    I think (b) is the right thing to do but I want to know your
> > > >    opinion. Besides, I don't have this hardware at hand and if I up=
dated
> > > >    the driver I wouldn't be able to test it.

Based on the discussions option b) above seems like the best compromise.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
