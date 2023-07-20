Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112A75AA5E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ED610E57C;
	Thu, 20 Jul 2023 09:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767EE10E57C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 09:08:05 +0000 (UTC)
Date: Thu, 20 Jul 2023 09:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689844083; x=1690103283;
 bh=neR4m36MJlySxhg9lAQS6vxG6wnX258Sd+fFs8ZjIPw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=eJDoOW3l416y9O6oaQFgzPALagbGZn0+X1Okrfajv30CgUGHx3aL7KLsprT33+YPC
 44ZP5D5yj+Gz4w5P8kUq/X8ZjrHvABl6OtwFRUjrNoSrQWhvEzc8kMaJKq7aSC2inV
 Q8vJvZgwFHK6qrdyGMHcQ64QzV3bkGKUK2/vtnuDnrRidKRbPplX5OAWAmsd510TKM
 9TGVqpU1qC+7ceQ3GCI0tCFsZcyIfS0qmOPnv2hoInFngoaXNwEsvcYeTqFM/yU4l7
 f9oTz94CYQuA+Adx40Muar/olYbc+yXluCxxZXDLUlMhLkVhhYcxRH9EmHu9FJ2LdA
 Imzum2G4HJcbA==
To: Javier Martinez Canillas <javierm@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
Message-ID: <YpGDUfd-_k9UGRn9xM-lwrWFXim3YiYG1wzgbk_lvSTQ2JL3zxxDuZef4ZTJe_NtOlwMMDy5OoDqK-Ia4VN3p-fibO_gaR7t6pH3oxyEI8Y=@emersion.fr>
In-Reply-To: <87sf9jhspo.fsf@minerva.mail-host-address-is-not-set>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-10-zack@kde.org> <20230719111541.33c05b14@eldfell>
 <41590ef35281fbc54be1ee58d9187ede8bc44698.camel@vmware.com>
 <xhJhUmlWt6a9ajOdF2Wodjm6IQBab4jqySRdBAPLaA4No87O7zfEX9v4d-ugWWAPgJBIWQeLV4RVuuRoZPK7aTYgNWp2YofiHra2GVLBfpY=@emersion.fr>
 <87sf9jhspo.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Michael Banack <banackm@vmware.com>, aesteve@redhat.com,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, July 20th, 2023 at 10:50, Javier Martinez Canillas <javierm@re=
dhat.com> wrote:

> > On Thursday, July 20th, 2023 at 07:03, Zack Rusin zackr@vmware.com wrot=
e:
> >=20
> > > I'll give this series a few more hours on the list and if no one obje=
cts I'll push
> > > it to drm-misc later today. Thanks!
> >=20
> > Sorry, but this doesn't seem to be enough to satisfy the DRM merge
> > requirements. This introduces a new uAPI but is missing user-space
> > patches and IGT. See 1 and 2.
>=20
>=20
> Albert (Cc'ed) wrote IGT tests for this new uAPI and was waiting for
> Zack's patches to land to post them. I believe his branch is [0] but
> he can correct me if I'm wrong on that.
>=20
> Zack also has mutter patches and Albert has been testing those too.
>=20
> [0]: https://gitlab.freedesktop.org/aesteve/igt-gpu-tools/-/commits/modes=
et-cursor-hotspot-test/

Ah, nice. Please do post all of these (without merging them) and
include links to them in the commit message. Posting is important
to make sure there are no gaps/mistakes in the tests and user-space
impl.
