Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567121AD95E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 11:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBFA6E3DF;
	Fri, 17 Apr 2020 09:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ECA6E3DF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 09:02:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y4so1231544ljn.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=jiY4XEC0fXZcOcaFTgjtS8Pfj2qGB7Hz4INuVeHlWFk=;
 b=IB+l0jCfYsCYBE40uo7TvcKGSIql9NCsWT3k5ZIUqWcQEoe3NNCp8W95eQZhkCgvOt
 I1JQvu6ENj3cPnx7ug3PxgIy+FMzze5kFaYMndpdWL8G7+yZZyDEYD8R7grGtWkkgQ6i
 NPwtD+FIP95U2HaOA4gZ4nlaAE0Dn5p83Tyn+WPsBrH8cM60vy1Obmkg9gfpCbxKxo93
 JzOJjUOJqHYWdUXu/bJWqTNBpCeJnoCr9K3njB91mWVhO1RGrpjxoGnXfCrzwXXbPJxW
 rn8h4cZFhCOw/HeXMM7rLvavc35eEolA2G64IfrO3uygBuZge200XjjW9/NRWoErN6UY
 d1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=jiY4XEC0fXZcOcaFTgjtS8Pfj2qGB7Hz4INuVeHlWFk=;
 b=qbf5TSl6g4pgJhAcWI2G0Zd+LZDZ3r2bSuAfy/GuM4cqXkmCUSd4lkiaYp+XusP+MO
 S9sOoRkpecolaT394aeURv1Otpv2ASXBX6KC8jw/kkfBYI0kLHgiQKNnk00EHMpagdT6
 GETNu2pGj99zTGYEJyQQTlt5/JY/YRf3SptNR9f8e2bPVQhPf/DvCxqIcb6YFp5qIzjE
 FajDesdwpcH5UZPCXqufMhPOFq21rTcYgAY0uEFR9a6SGCuz74LmEwQCeiy2Z8EIfoQw
 RB3tA6QtHFSXnAUrILcrt5D/SqiA0i3BbhWKPYcv2W6E8vYsG4uwjQPVSNmkOAEafsHR
 /zrg==
X-Gm-Message-State: AGi0Pua99hNSnlGo7MSANGT8n1T1hRI9q+FfcYhoWH1iGZJ4Z8lbCblO
 FdqGglLBFKUcSxsqkLErPT8=
X-Google-Smtp-Source: APiQypJLCY1MHwEYi3m8fjzE0BITL1Di6uDl56aS83Fjkxpaw5OM9h/c2Pc2SPjlGC7pb06Q2qofOA==
X-Received: by 2002:a2e:a554:: with SMTP id e20mr1441641ljn.88.1587114165458; 
 Fri, 17 Apr 2020 02:02:45 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q6sm16828465ljp.21.2020.04.17.02.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 02:02:44 -0700 (PDT)
Date: Fri, 17 Apr 2020 12:02:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, Mark Pearson <mpearson@lenovo.com>
Subject: Re: RFC: Drm-connector properties managed by another driver /
 privacy screen support
Message-ID: <20200417120226.0cd6bc21@eldfell.localdomain>
In-Reply-To: <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Nitin Joshi1 <njoshi1@lenovo.com>, Benjamin Berg <bberg@redhat.com>
Content-Type: multipart/mixed; boundary="===============1672255789=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1672255789==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H9LjsdHj/A6D9PBwROV74Ym"; protocol="application/pgp-signature"

--Sig_/H9LjsdHj/A6D9PBwROV74Ym
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Apr 2020 17:40:46 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 4/15/20 5:28 PM, Jani Nikula wrote:
> > On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote: =20
> >> ii. Currently the "privacy-screen" property added by Rajat's
> >> patch-set is an enum with 2 possible values:
> >> "Enabled"
> >> "Disabled"
> >>
> >> We could add a third value "Not Available", which would be the
> >> default and then for internal panels always add the property
> >> so that we avoid the problem that detecting if the laptop has
> >> an internal privacy screen needs to be done before the connector
> >> is registered. Then we can add some hooks which allow an
> >> lcdshadow-driver to register itself against a connector later
> >> (which is non trivial wrt probe order, but lets ignore that for now). =
=20
> >=20
> > I regret dropping the ball on Rajat's series (sorry!).
> >=20
> > I do think having the connector property for this is the way to go. =20
>=20
> I 100% agree.
>=20
> > Even
> > if we couldn't necessarily figure out all the details on the kernel
> > internal connections, can we settle on the property though, so we could
> > move forward with Rajat's series? =20
>=20
> Yes please, this will also allow us to move forward with userspace
> support even if for testing that we do some hacks for the kernel's
> internal connections for now.
>=20
> > Moreover, do we actually need two properties, one which could indicate
> > userspace's desire for the property, and another that tells the hardware
> > state? =20
>=20
> No I do not think so. I would expect there to just be one property,
> I guess that if the state is (partly) firmware controlled then there
> might be a race, but we will need a notification mechanism (*) for
> firmware triggered state changes anyways, so shortly after loosing
> the race userspace will process the notification and it will know
> about it.
>=20
> One thing which might be useful is a way to signal that the property
> is read-only in case we ever hit hw where that is the case.
>=20
> > I'd so very much like to have no in-kernel/in-firmware shortcuts
> > to enable/disable the privacy screen, and instead have any hardware
> > buttons just be events that the userspace could react to. However I
> > don't think that'll be the case unfortunately. =20
>=20
> In my experience with keyboard-backlight support, we will (unfortunately)
> see a mix and in some case we will get a notification that the firmware
> has adjusted the state, rather then just getting a keypress and
> dealing with that ourselves.  In some cases we may even be able to
> choose, so the fw will deal with it by default but we can ask it
> to just send a key-press.  But I do believe that we can *not* expect
> that we will always just get a keypress for userspace to deal with.

Hi,

let's think about how userspace uses atomic KMS UAPI. The simplest way
to use atomic correctly is that userspace will for every update send the
full, complete set of all properties that exist, both known and unknown
to userspace (to recover from temporarily VT-switching to another KMS
program that changes unknown properties). Attempting to track which
properties already have their correct values in the kernel is extra
work for just extra bugs.

Assuming the property is userspace-writable: if kernel goes and
changes the property value on its own, it will very likely be just
overwritten by userspace right after if userspace does not manage to
process the uevent first. If that happens and userspace later
processes the uevent, userspace queries the kernel for the current
proprerty state which is now what userspace wrote, not what firmware
set.

Therefore you end up with the firmware hotkey working only randomly.

It would be much better to have the hotkey events delivered to
userspace so that userspace can control the privacy screen and
everything will be reliable, both the hotkeys and any GUI for it. The
other reliable option is that userspace must never be able to change
privacy screen state, only the hardware hotkeys can.

>=20
> Regards,
>=20
> Hans
>=20
>=20
> *) Some udev event I guess, I sorta assume there already is a
> notification mechanism for property change notifications ?

Yes, such mechanism has been discussed before, see the thread containing
https://lists.freedesktop.org/archives/dri-devel/2019-May/217588.html

TL;DR: the mechanism exists and is called the hotplug event. But the
problem with the hotplug event is that it carries no information about
what changed, so userspace is forced re-discover everything about the
DRM device. That thread discusses extending the hotplug event to be
able to signal changes in individual properties rather than "something
maybe changed, you figure out what".


Thanks,
pq

--Sig_/H9LjsdHj/A6D9PBwROV74Ym
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6ZcKIACgkQI1/ltBGq
qqcI6g//Xav05YOUy0RM9WB4Btp03Wnoub6HtF8myUwXcNLUSs31rY7z1UJ/AXQx
tCAIvsjwKGnvHtqcno+pWVFpoMlIQvBHqIIlC2lIx1SWra1cS21TaTX22d8JNcHl
YIXUHWB2ymMbAe1fJXKilCRIc4VUKXGYZchJ9BchpLQBg9XwArEl/J0vwRTvjFf9
UoVhZy0yHKz94JKQvvkeXgi9pkBJjaMMSOwwoBtr4yg531XEUNGtZ2/zO3oIRFP1
kYm4qNM3IFqCxU8vE+3ID5mKq3sJe1IBZE0A2LdoK3tCIhUDDNk4SyT2tAxwPjU4
zOdV+TshPo21cGlxjSousQJ30pekygcTvP2R3iJOIQeB2HjM2AIyqz/E7+JX3BeH
zlRSZzhdLTtKhQHLTmENdqyzLWouOYXyaqpIULo+kqHeSSFaVvrKU3qFiUW5O2Ef
RPtHIvddeCjjNZcPn7IsME02aQWvcC4YjGmp2XJEQkD+1nqofbXs19YH4geLwskq
MPjYQR/nyMwraeGt+0sYU5JXhwMlSE5O5bcOZ0Q9l1bw5FTnuSS0VfS1a9bDMLHI
c6G1noATW2iV1gOpzXVgGXHW5VN0pMngH3dEIPhqCQeVf+00/YoypIhMVup+bvBp
o2k+R034zkfld0gi00ZUB1Oyz/TBB4YwdQAsfRbJxcmgwTOp7Bk=
=4boR
-----END PGP SIGNATURE-----

--Sig_/H9LjsdHj/A6D9PBwROV74Ym--

--===============1672255789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1672255789==--
