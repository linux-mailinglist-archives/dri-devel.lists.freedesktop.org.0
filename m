Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E71A2917A5
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 15:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0756E0C6;
	Sun, 18 Oct 2020 13:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5096E6E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 13:38:49 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 388F320020;
 Sun, 18 Oct 2020 15:38:47 +0200 (CEST)
Date: Sun, 18 Oct 2020 15:38:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 0/3] drm/panel: mantix panel reset fixes
Message-ID: <20201018133845.GA361365@ravnborg.org>
References: <cover.1602584953.git.agx@sigxcpu.org>
 <20201016142916.GA1184974@ravnborg.org>
 <20201017091307.GA2885@bogon.m.sigxcpu.org>
 <20201017104736.GA2822081@ravnborg.org>
 <20201018130122.GA3705@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201018130122.GA3705@bogon.m.sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=I_DR3_W_4JJieZY4840A:9 a=wPNLvfGTeEIA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Hi Guido
> On Sun, Oct 18, 2020 at 03:01:22PM +0200, Guido G=FCnther wrote:
> Hi Sam,
> On Sat, Oct 17, 2020 at 12:47:36PM +0200, Sam Ravnborg wrote:
> > Hi Guido.
> > =

> > On Sat, Oct 17, 2020 at 11:13:07AM +0200, Guido G=FCnther wrote:
> > > Hi Sam,
> > > On Fri, Oct 16, 2020 at 04:29:16PM +0200, Sam Ravnborg wrote:
> > > > Hi Guido.
> > > > On Tue, Oct 13, 2020 at 12:32:45PM +0200, Guido G=FCnther wrote:
> > > [..snip..]
> > > > > =

> > > > > Changes from v1:
> > > > >  - As per review comments by Fabio Estevam
> > > > >    https://lore.kernel.org/dri-devel/CAOMZO5B5ECcConvKej=3DRcaF8w=
vOxgq7nUzKJ-ad0aSAOzUqtbQ@mail.gmail.com/
> > > > >    - Fix typo in commit messages
> > > > >  - As per review comments by Rob Herring
> > > > >    https://lore.kernel.org/dri-devel/20200929174624.GA832332@bogu=
s/
> > > > >    - Don't use an array of reset lines
> > > > > =

> > > > > Guido G=FCnther (3):
> > > > >   drm/panel: mantix: Don't dereference NULL mode
> > > > >   drm/panel: mantix: Fix panel reset
> > > > >   dt-binding: display: Require two resets on mantix panel
> > > > =

> > > > All applied to drm-misc-next and pushed out.
> > > > And then I remembered you had commit right - sigh.
> > > =

> > > Thanks! Is there any special care needed to get that into 5.10? The
> > > driver landed there in 72967d5616d3f0c714f8eb6c4e258179a9031c45.
> > =

> > As the patches was applied to drm-misc-next the easiet path would
> > be to cherry-pick them and apply to drm-misc-fixes.
> > dim has cherry-pick support - try to use it rahter than doing it by
> > hand.
> =

> Does that require any further ACKs or just cherry-pick and push out?
To the best of my knowledge just cherry-pick, test and push out.

	Sam

> =

> > When you apply to drm-misc-fixes include a Fixes: tag so the tooling
> > will pick the patches automagically.
> =

> Will do. It was unfortunate that the initial ones didn't get them but
> i think the drm merge happened while v2 was out on the list. I'll try
> add that relevant information to the cover letter in the future.
> =

> Cheers,
>  -- Guido
> =

> > =

> > In hindsight the patches should have carried a Fixes: tag from a start
> > and should have been applied to drm-misc-fixes from a start too.
> > =

> > I have done something like above once or twice but anyway reach out if
> > you have questions. Or ask at #dri-devel.
> > =

> > 	Sam
> > =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
