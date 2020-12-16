Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0052DC323
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 16:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27E86E1F7;
	Wed, 16 Dec 2020 15:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBB06E1F7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 15:30:17 +0000 (UTC)
Date: Wed, 16 Dec 2020 16:31:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1608132617;
 bh=/5Y1TGycWyjXCwMyS3C9cBgyazr7zrzUM5OnlvmxAWg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=2BjVA5E75Dss2uZ1JwpjsLcJCjzbWU7t1GXfJzpJ/BLkrvKfOl3+e0fvg/+C9V8n3
 kV2R62HXhAtL1RdGpfS7mx76HgkDzKdrPVXtKDEj2QVCrVOy8fZTSV74U/wX6yV9yn
 wM/+nO4qOEmWPZA6ok7o2OiK2uMe48Na+ES42xHk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 2/3] drm: uapi: Use SPDX in DRM drivers uAPI headers
Message-ID: <X9ooRDIL3vu6VfRS@kroah.com>
References: <20200621020703.864-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621020703.864-2-laurent.pinchart+renesas@ideasonboard.com>
 <1e5f7ae2-8b41-dcda-4306-7751e8fbf02b@amd.com>
 <20200622092933.GY20149@phenom.ffwll.local>
 <20200717022716.GA1845@pendragon.ideasonboard.com>
 <843d7b34-418d-991b-d1d9-0ad5089d20a4@amd.com>
 <X9ltvZIEHjiYoLVp@pendragon.ideasonboard.com>
 <MN2PR12MB4488A356AC7AF9FD844F0F89F7C50@MN2PR12MB4488.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR12MB4488A356AC7AF9FD844F0F89F7C50@MN2PR12MB4488.namprd12.prod.outlook.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 02:52:25PM +0000, Deucher, Alexander wrote:
> [AMD Public Use]
> =

> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: Tuesday, December 15, 2020 9:15 PM
> > To: Koenig, Christian <Christian.Koenig@amd.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>; Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>; dri-
> > devel@lists.freedesktop.org; Dave Airlie <airlied@gmail.com>; Greg Kroa=
h-
> > Hartman <gregkh@linuxfoundation.org>; Thomas Gleixner
> > <tglx@linutronix.de>; Deucher, Alexander <Alexander.Deucher@amd.com>;
> > Rob Clark <robdclark@gmail.com>; Sean Paul <sean@poorly.run>; Ben
> > Skeggs <bskeggs@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>;
> > Thierry Reding <thierry.reding@gmail.com>; Eric Anholt <eric@anholt.net=
>;
> > VMware Graphics <linux-graphics-maintainer@vmware.com>; Thomas
> > Hellstrom <thellstrom@vmware.com>
> > Subject: Re: [PATCH 2/3] drm: uapi: Use SPDX in DRM drivers uAPI headers
> > =

> > Hi Christian,
> > =

> > On Fri, Jul 17, 2020 at 04:05:42PM +0200, Christian K=F6nig wrote:
> > > Am 17.07.20 um 04:27 schrieb Laurent Pinchart:
> > > > On Mon, Jun 22, 2020 at 11:29:33AM +0200, Daniel Vetter wrote:
> > > >> On Mon, Jun 22, 2020 at 09:58:44AM +0200, Christian K=F6nig wrote:
> > > >>> Am 21.06.20 um 04:07 schrieb Laurent Pinchart:
> > > >>>> Most of the DRM drivers uAPI headers are licensed under the MIT
> > > >>>> license, and carry copies of the license with slight variations.
> > > >>>> Replace them with SPDX headers.
> > > >>> My personal opinion is that this is a really good idea, but my
> > > >>> professional is that we need the acknowledgment from our legal
> > department for this.
> > > >> I think official ack from amd on first patch, especially the .rst
> > > >> snippet, would be really good indeed.
> > > > Any update on this one ?
> > >
> > > Sorry totally forgot to forward this because I was waiting for split
> > > up patches.
> > >
> > > Going to do so right now.
> > =

> > Has there been any update ? :-)
> =

> AMD legal requires the full license.

Um, what?  Please let me talk to them about this, it's not ok for one
individual company, out of 450+, to somehow decide to do something
different.

Please put your lawyers in contact with me and I will have them discuss
it with the proper lawyers on our side.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
