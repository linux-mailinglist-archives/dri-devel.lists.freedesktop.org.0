Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A4229117A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 12:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A5D6E0EF;
	Sat, 17 Oct 2020 10:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409656E0EF
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 10:47:42 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id ECE2E2001E;
 Sat, 17 Oct 2020 12:47:37 +0200 (CEST)
Date: Sat, 17 Oct 2020 12:47:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 0/3] drm/panel: mantix panel reset fixes
Message-ID: <20201017104736.GA2822081@ravnborg.org>
References: <cover.1602584953.git.agx@sigxcpu.org>
 <20201016142916.GA1184974@ravnborg.org>
 <20201017091307.GA2885@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201017091307.GA2885@bogon.m.sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=PFafjgERKE-Fj2KKUhgA:9 a=wPNLvfGTeEIA:10 a=AjGcO6oz07-iQ99wixmX:22
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

Hi Guido.

On Sat, Oct 17, 2020 at 11:13:07AM +0200, Guido G=FCnther wrote:
> Hi Sam,
> On Fri, Oct 16, 2020 at 04:29:16PM +0200, Sam Ravnborg wrote:
> > Hi Guido.
> > On Tue, Oct 13, 2020 at 12:32:45PM +0200, Guido G=FCnther wrote:
> [..snip..]
> > > =

> > > Changes from v1:
> > >  - As per review comments by Fabio Estevam
> > >    https://lore.kernel.org/dri-devel/CAOMZO5B5ECcConvKej=3DRcaF8wvOxg=
q7nUzKJ-ad0aSAOzUqtbQ@mail.gmail.com/
> > >    - Fix typo in commit messages
> > >  - As per review comments by Rob Herring
> > >    https://lore.kernel.org/dri-devel/20200929174624.GA832332@bogus/
> > >    - Don't use an array of reset lines
> > > =

> > > Guido G=FCnther (3):
> > >   drm/panel: mantix: Don't dereference NULL mode
> > >   drm/panel: mantix: Fix panel reset
> > >   dt-binding: display: Require two resets on mantix panel
> > =

> > All applied to drm-misc-next and pushed out.
> > And then I remembered you had commit right - sigh.
> =

> Thanks! Is there any special care needed to get that into 5.10? The
> driver landed there in 72967d5616d3f0c714f8eb6c4e258179a9031c45.

As the patches was applied to drm-misc-next the easiet path would
be to cherry-pick them and apply to drm-misc-fixes.
dim has cherry-pick support - try to use it rahter than doing it by
hand.

When you apply to drm-misc-fixes include a Fixes: tag so the tooling
will pick the patches automagically.

In hindsight the patches should have carried a Fixes: tag from a start
and should have been applied to drm-misc-fixes from a start too.

I have done something like above once or twice but anyway reach out if
you have questions. Or ask at #dri-devel.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
