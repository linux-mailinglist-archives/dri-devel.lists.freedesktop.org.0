Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A387B75B803
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 21:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBB610E604;
	Thu, 20 Jul 2023 19:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BC410E604
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 19:32:15 +0000 (UTC)
Date: Thu, 20 Jul 2023 19:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689881532; x=1690140732;
 bh=BqNLxmUonDD8/tRXUzf/uSM4ZGtj+1p5Ql1PI5UeUg0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=HxsKEMB3pdBsXJPrfSfJ1MfRF4UeuVrE7hJ5LhmuqKF6XZChxDnvLXElpdjTutKXD
 MHINu6FoaQk7/aFv7Oz0k/apdTiE/k3WKuQyR8JKRbvP7szo0F/exdvFvcrfkPxVtH
 XutzZiWAFQkj0IFwtby3Pb+xM/5wMso55ZLRKaHjCwi3tttnQSa7/AA01YGXG/0ZvR
 DB09/chFOKZF0Jri2/iJAvz9pO+T/98M4Znd/GrIS8RYFwJhh8eHaX/FQfNHxfHt9G
 IFe9DaqVFZGX3xtTBL4sEA8tq8wtCHzNgeDvGPUprdj8rxIEb4CIbW6ldxpPZwQumE
 XZ5kXjcfH8gvg==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
Message-ID: <Tgp5V2I8rIgxaVYHTqX5kWeyeqgaKygNFitQeObTXCR2hUDcaR-mAn_37bUhKrTxeqlwf2GlPIOmkSlOzZHQ5D-hkHu5jeYhEDm1x45oePw=@emersion.fr>
In-Reply-To: <b4f00adeeaec35aacd008fe7a6ca9283760f6421.camel@vmware.com>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-10-zack@kde.org> <20230719111541.33c05b14@eldfell>
 <41590ef35281fbc54be1ee58d9187ede8bc44698.camel@vmware.com>
 <xhJhUmlWt6a9ajOdF2Wodjm6IQBab4jqySRdBAPLaA4No87O7zfEX9v4d-ugWWAPgJBIWQeLV4RVuuRoZPK7aTYgNWp2YofiHra2GVLBfpY=@emersion.fr>
 <87sf9jhspo.fsf@minerva.mail-host-address-is-not-set>
 <YpGDUfd-_k9UGRn9xM-lwrWFXim3YiYG1wzgbk_lvSTQ2JL3zxxDuZef4ZTJe_NtOlwMMDy5OoDqK-Ia4VN3p-fibO_gaR7t6pH3oxyEI8Y=@emersion.fr>
 <b4f00adeeaec35aacd008fe7a6ca9283760f6421.camel@vmware.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "aesteve@redhat.com" <aesteve@redhat.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 Michael Banack <banackm@vmware.com>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, July 20th, 2023 at 21:28, Zack Rusin <zackr@vmware.com> wrote:

> On Thu, 2023-07-20 at 09:07 +0000, Simon Ser wrote:
>=20
> > !! External Email
> >=20
> > On Thursday, July 20th, 2023 at 10:50, Javier Martinez Canillas
> > javierm@redhat.com wrote:
> >=20
> > > > On Thursday, July 20th, 2023 at 07:03, Zack Rusin zackr@vmware.com =
wrote:
> > > >=20
> > > > > I'll give this series a few more hours on the list and if no one =
objects
> > > > > I'll push
> > > > > it to drm-misc later today. Thanks!
> > > >=20
> > > > Sorry, but this doesn't seem to be enough to satisfy the DRM merge
> > > > requirements. This introduces a new uAPI but is missing user-space
> > > > patches and IGT. See 1 and 2.
> > >=20
> > > Albert (Cc'ed) wrote IGT tests for this new uAPI and was waiting for
> > > Zack's patches to land to post them. I believe his branch is 0 but
> > > he can correct me if I'm wrong on that.
> > >=20
> > > Zack also has mutter patches and Albert has been testing those too.
> >=20
> > Ah, nice. Please do post all of these (without merging them) and
> > include links to them in the commit message. Posting is important
> > to make sure there are no gaps/mistakes in the tests and user-space
> > impl.
>=20
> What should those links point to? Because my private mutter repository is=
 definitely
> not going to last long so I'm not sure if there's any point in putting th=
at in a
> kernel commit log. Or would you like the links to those in the cover lett=
er?

The kernel docs say: "The userspace side must be fully reviewed and
tested to the standards of that userspace project".

So you need to open a merge request for mutter. Same for IGT.
