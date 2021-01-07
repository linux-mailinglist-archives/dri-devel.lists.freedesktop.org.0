Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9B62ED341
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 16:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B1C6E480;
	Thu,  7 Jan 2021 15:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ACB6E480
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 15:11:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DB7C233CE;
 Thu,  7 Jan 2021 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610032273;
 bh=ieX6ecPN9UA3rbGggwa4WOTDV//OXXUxU1o7k3YBIA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OW3R0bGUWfiqzvZLPy/Cu7U8bxOCSzohHQfJ2bgFb+3o2sJj8sDVbQfIKh0O9koeW
 fsfBOyXbF/0YMtfnnTdUa0peuxQS779Xa2roeuFYYQ0ujVAwgLpSgfdWgdh0wpzwhY
 sC9rl8rKA/iFHS2bn1oPYDctP2QX6xKAdG2ATC4c=
Date: Thu, 7 Jan 2021 16:12:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 2/3] drm: uapi: Use SPDX in DRM drivers uAPI headers
Message-ID: <X/ck4e4563Akbf9N@kroah.com>
References: <20200621020703.864-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621020703.864-2-laurent.pinchart+renesas@ideasonboard.com>
 <1e5f7ae2-8b41-dcda-4306-7751e8fbf02b@amd.com>
 <20200622092933.GY20149@phenom.ffwll.local>
 <20200717022716.GA1845@pendragon.ideasonboard.com>
 <843d7b34-418d-991b-d1d9-0ad5089d20a4@amd.com>
 <X9ltvZIEHjiYoLVp@pendragon.ideasonboard.com>
 <MN2PR12MB4488A356AC7AF9FD844F0F89F7C50@MN2PR12MB4488.namprd12.prod.outlook.com>
 <X9ooRDIL3vu6VfRS@kroah.com>
 <CADnq5_Ngd6A4-RMvXX7oofLLayK9YBm1+7-GakDrjtoBtnXW2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_Ngd6A4-RMvXX7oofLLayK9YBm1+7-GakDrjtoBtnXW2w@mail.gmail.com>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 10:01:00AM -0500, Alex Deucher wrote:
> On Wed, Dec 16, 2020 at 10:30 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Dec 16, 2020 at 02:52:25PM +0000, Deucher, Alexander wrote:
> > > [AMD Public Use]
> > >
> > > > -----Original Message-----
> > > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Sent: Tuesday, December 15, 2020 9:15 PM
> > > > To: Koenig, Christian <Christian.Koenig@amd.com>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>; Laurent Pinchart
> > > > <laurent.pinchart+renesas@ideasonboard.com>; dri-
> > > > devel@lists.freedesktop.org; Dave Airlie <airlied@gmail.com>; Greg =
Kroah-
> > > > Hartman <gregkh@linuxfoundation.org>; Thomas Gleixner
> > > > <tglx@linutronix.de>; Deucher, Alexander <Alexander.Deucher@amd.com=
>;
> > > > Rob Clark <robdclark@gmail.com>; Sean Paul <sean@poorly.run>; Ben
> > > > Skeggs <bskeggs@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>;
> > > > Thierry Reding <thierry.reding@gmail.com>; Eric Anholt <eric@anholt=
.net>;
> > > > VMware Graphics <linux-graphics-maintainer@vmware.com>; Thomas
> > > > Hellstrom <thellstrom@vmware.com>
> > > > Subject: Re: [PATCH 2/3] drm: uapi: Use SPDX in DRM drivers uAPI he=
aders
> > > >
> > > > Hi Christian,
> > > >
> > > > On Fri, Jul 17, 2020 at 04:05:42PM +0200, Christian K=F6nig wrote:
> > > > > Am 17.07.20 um 04:27 schrieb Laurent Pinchart:
> > > > > > On Mon, Jun 22, 2020 at 11:29:33AM +0200, Daniel Vetter wrote:
> > > > > >> On Mon, Jun 22, 2020 at 09:58:44AM +0200, Christian K=F6nig wr=
ote:
> > > > > >>> Am 21.06.20 um 04:07 schrieb Laurent Pinchart:
> > > > > >>>> Most of the DRM drivers uAPI headers are licensed under the =
MIT
> > > > > >>>> license, and carry copies of the license with slight variati=
ons.
> > > > > >>>> Replace them with SPDX headers.
> > > > > >>> My personal opinion is that this is a really good idea, but my
> > > > > >>> professional is that we need the acknowledgment from our legal
> > > > department for this.
> > > > > >> I think official ack from amd on first patch, especially the .=
rst
> > > > > >> snippet, would be really good indeed.
> > > > > > Any update on this one ?
> > > > >
> > > > > Sorry totally forgot to forward this because I was waiting for sp=
lit
> > > > > up patches.
> > > > >
> > > > > Going to do so right now.
> > > >
> > > > Has there been any update ? :-)
> > >
> > > AMD legal requires the full license.
> >
> > Um, what?  Please let me talk to them about this, it's not ok for one
> > individual company, out of 450+, to somehow decide to do something
> > different.
> >
> > Please put your lawyers in contact with me and I will have them discuss
> > it with the proper lawyers on our side.
> =

> After more discussion, the lawyers have allowed us to use the SPDX licens=
es now.

Wonderful, thanks for pushing this through and letting us know!

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
