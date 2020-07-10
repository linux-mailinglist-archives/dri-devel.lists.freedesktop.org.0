Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B021BD2F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 20:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DC46EC2E;
	Fri, 10 Jul 2020 18:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9916EC2E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 18:47:34 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 593238051B;
 Fri, 10 Jul 2020 20:47:31 +0200 (CEST)
Date: Fri, 10 Jul 2020 20:47:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/3] dt-bindings: display: convert panel bindings to
 DT Schema
Message-ID: <20200710184730.GA628995@ravnborg.org>
References: <20200704102806.735713-1-sam@ravnborg.org>
 <20200704103408.GA735964@ravnborg.org>
 <20200709233502.GA1103707@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709233502.GA1103707@bogus>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=SIG6TxBT1hdypITfUdwA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Zhong <zyw@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

> > On Sat, Jul 04, 2020 at 12:28:03PM +0200, Sam Ravnborg wrote:
> > > This patch-set convert 3 of the remaining panel bindings to yaml.
> > > 
> > > This is a follow-up on v2 that converted a lot of panel bindings:
> > > https://lore.kernel.org/dri-devel/20200408195109.32692-1-sam@ravnborg.org/
> > > All was applied except for the reaming three patches included here.
> > > 
> > > One binding is a DSI binding so just added to panel-simple-dsi.
> > > The other two bindings addressed review feedback from Rob.
> > > 
> > > Sebastian Reichel has a pending patch to address the remaining
> > > panel binding in display/panel/
> > > 
> > > All bindings pass dt-binding-check.
> > > Based on top of drm-misc-next.
> > > 
> > > 	Sam
> > > 
> > > 
> > > Sam Ravnborg (3):
> > >       dt-bindings: display: convert innolux,p079zca to DT Schema
> > >       dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
> > >       dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema
> > 
> > git format-patch adds a space after the ',' - in the subject.
> > This is often a good idea, but not for binding files.
> > Will fix when I apply - if I do not forget that is..
> 
> Sure about that? I'm pretty sure it's dri-devel doing it. Look at 
> lore.kernel.org copies for different lists. I've been fighting with that 
> first in patchwork (which had this bug) and then in b4 (which is where 
> it got nailed down to dri-devel).
You are right.

The patches that I copied myself on had the correct subject.
Only the dri-devel mails had the mangled subject.

	Sam

> 
> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
