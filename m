Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E622A29576F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 06:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4BE6E075;
	Thu, 22 Oct 2020 04:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D95C6E075
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 04:59:34 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E906A80659;
 Thu, 22 Oct 2020 06:59:30 +0200 (CEST)
Date: Thu, 22 Oct 2020 06:59:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 0/3] drm/panel: mantix panel reset fixes
Message-ID: <20201022045929.GA2775675@ravnborg.org>
References: <cover.1602584953.git.agx@sigxcpu.org>
 <20201016142916.GA1184974@ravnborg.org>
 <20201017091307.GA2885@bogon.m.sigxcpu.org>
 <20201017104736.GA2822081@ravnborg.org>
 <20201019154437.GE401619@phenom.ffwll.local>
 <20201020115711.GA102703@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020115711.GA102703@bogon.m.sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=ze386MxoAAAA:8 a=7gkXJVJtAAAA:8 a=rBIqfxwrrtgd4LGA3nsA:9
 a=wPNLvfGTeEIA:10 a=vwX7oiHrwKcA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=iBZjaW-pnkserzjvUTHh:22
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
Cc: David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido.

On Tue, Oct 20, 2020 at 01:57:11PM +0200, Guido G=FCnther wrote:
> Hi Daniel, Sam,
> On Mon, Oct 19, 2020 at 05:44:37PM +0200, Daniel Vetter wrote:
> > On Sat, Oct 17, 2020 at 12:47:36PM +0200, Sam Ravnborg wrote:
> > > Hi Guido.
> > > =

> > > On Sat, Oct 17, 2020 at 11:13:07AM +0200, Guido G=FCnther wrote:
> > > > Hi Sam,
> > > > On Fri, Oct 16, 2020 at 04:29:16PM +0200, Sam Ravnborg wrote:
> > > > > Hi Guido.
> > > > > On Tue, Oct 13, 2020 at 12:32:45PM +0200, Guido G=FCnther wrote:
> > > > [..snip..]
> > > > > > =

> > > > > > Changes from v1:
> > > > > >  - As per review comments by Fabio Estevam
> > > > > >    https://lore.kernel.org/dri-devel/CAOMZO5B5ECcConvKej=3DRcaF=
8wvOxgq7nUzKJ-ad0aSAOzUqtbQ@mail.gmail.com/
> > > > > >    - Fix typo in commit messages
> > > > > >  - As per review comments by Rob Herring
> > > > > >    https://lore.kernel.org/dri-devel/20200929174624.GA832332@bo=
gus/
> > > > > >    - Don't use an array of reset lines
> > > > > > =

> > > > > > Guido G=FCnther (3):
> > > > > >   drm/panel: mantix: Don't dereference NULL mode
> > > > > >   drm/panel: mantix: Fix panel reset
> > > > > >   dt-binding: display: Require two resets on mantix panel
> > > > > =

> > > > > All applied to drm-misc-next and pushed out.
> > > > > And then I remembered you had commit right - sigh.
> > > > =

> > > > Thanks! Is there any special care needed to get that into 5.10? The
> > > > driver landed there in 72967d5616d3f0c714f8eb6c4e258179a9031c45.
> > > =

> > > As the patches was applied to drm-misc-next the easiet path would
> > > be to cherry-pick them and apply to drm-misc-fixes.
> > > dim has cherry-pick support - try to use it rahter than doing it by
> > > hand.
> > =

> > drm-misc-next-fixes while we're between freeze and merge window end:
> > =

> > https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.h=
tml#where-do-i-apply-my-patch
> =

> Great. Thanks for the pointer, that works. Now i get:
> =

>   $ ../maintainer-tools/dim push --dry-run
>   dim: 3532f0117258 ("dt-binding: display: Require two resets on mantix p=
anel"): mandatory review missing.
>   dim: c90f95ad6d05 ("drm/panel: mantix: Fix panel reset"): mandatory rev=
iew missing.
>   dim: 8b557f793e69 ("drm/panel: mantix: Don't dereference NULL mode"): m=
andatory review missing.
>   dim: ERROR: issues in commits detected, aborting
> =

> and in fact there's only Signed-off-by's on it:
> =

>   Fixes: 72967d5616d3 ("drm/panel: Add panel driver for the Mantix MLAF05=
7WE51-X DSI panel")
>   Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
>   Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>   Link: https://patchwork.freedesktop.org/patch/msgid/ba71a8ab010d263a805=
8dd4f711e3bcd95877bf2.1602584953.git.agx@sigxcpu.org
> =

> Sam, I assume your Signed-off-by's should have been Reviewed-by ?
> O.k. to fix that up in the commit message before pushing to
> drm-misc-next?
Fine to add my r-b.

For patches I push I always read the patch - but seldom claim that I
review them. It seems a bit implicit I think - but maybe this is just
bad practice on my side.

Then I also avoid the endless discussion with myself it what I did
warrant an a-b or r-b.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
