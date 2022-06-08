Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17E3542890
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B8710EBA9;
	Wed,  8 Jun 2022 07:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5610E08E;
 Wed,  8 Jun 2022 07:53:52 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id be31so31965779lfb.10;
 Wed, 08 Jun 2022 00:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Jcejieg8fSGD4FRUiB6XtubXegORq7N0Vn+r4bqLdgc=;
 b=eH/vCnnbKdMwkddXmNC1+Lo+dfzNPzFJfJd/ViqiUkzrBBkZIHlHyCNUeikZKCX3Lx
 orWOKOeZt1vx3sAcZVxjqUdvKOFObFo0a4ku40eM2ikgBbl+4hTPxSdd5R7YFi/AaLFk
 K2bUJUvsf5KCy2diFjBdBDWaI0gof+LSKX35NGqxYdgxVHQQ+kq2ljA/WUz6JfnpFB+s
 KRpGBiztHO5qYqhyLJSoPoOEq+Ghgb42P1HduMAqrQhgUJHgqvqybxHJgYfvY55anMHH
 rE28hmsZfgeoJvYuXYVAEcD3LIwJ5N7p4Bnr53ZzYG/gDupf5qBoc7hJQzYQ6aqidhCp
 iCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Jcejieg8fSGD4FRUiB6XtubXegORq7N0Vn+r4bqLdgc=;
 b=zODWBJ0H+D5meJVOGyjBNsczPOn8bTmSy30L757RUALugP37AmRQpHzmcc4o7zbIPs
 dh2y3Ca3FOXpimSzh+sXyDym9z1pAk+W2xMnrJGFW9xQgavbLqDeNzpmNaNYbDay/QLq
 n9JZSqfnIgFV5CSKWnVqNygs9FsEIUJIy8Nxf/+geyiiNRATJQO1WdkM8V+ioVYOq8vL
 JBoTLIdzMCVisxKn13YS2+R6S53G36WUUXCAY3cArASQGp6wxYz8XS9yZH9monBd1zld
 Ic/O46dd2ecvP6IzF2UvPAQvmdt7z3YenUtDhzGw09yYocMyRNiLuOBO/c3BhYojp9nR
 sd1g==
X-Gm-Message-State: AOAM531afbEEPi+C6n5WaNXpIiC0JEqucSsKP4W77eho1mhGrONM16KW
 iNXJRFGySncJV4otsGIr7p4=
X-Google-Smtp-Source: ABdhPJwJz7cEqBvxSfkUu6N3Jxp078wmmdD1srX8qIqCdpzBvL5F516W+lYzRTRivzd+u8AwRdl1uA==
X-Received: by 2002:a05:6512:3b0e:b0:479:150a:ed09 with SMTP id
 f14-20020a0565123b0e00b00479150aed09mr17976568lfv.231.1654674830484; 
 Wed, 08 Jun 2022 00:53:50 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h11-20020ac24d2b000000b00477a287438csm3615901lfk.2.2022.06.08.00.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 00:53:50 -0700 (PDT)
Date: Wed, 8 Jun 2022 10:53:38 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220608105338.22592a09@eldfell>
In-Reply-To: <197201d5da2c504502b8c2225d6766338b18d732.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <20220607110707.02eccda5@eldfell>
 <197201d5da2c504502b8c2225d6766338b18d732.camel@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zu+NI+kUJ.7ddHqdr9LH9zQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/zu+NI+kUJ.7ddHqdr9LH9zQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Jun 2022 17:50:24 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Tue, 2022-06-07 at 11:07 +0300, Pekka Paalanen wrote:
> > On Fri, 03 Jun 2022 14:14:59 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >  =20
> > > Hi,
> > >=20
> > > Please, read this thread:
> > > https://lists.freedesktop.org/archives/dri-devel/2020-March/thread.ht=
ml#259615
> > >=20
> > > It has a lot of information about the pitfalls of cursor hotspot and
> > > other things done by VM software.
> > >=20
> > > In particular: since the driver will ignore the KMS cursor plane
> > > position set by user-space, I don't think it's okay to just expose
> > > without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
> > >=20
> > > cc wayland-devel and Pekka for user-space feedback.
> > >=20
> > > On Thursday, June 2nd, 2022 at 17:42, Zack Rusin <zack@kde.org> wrote:
> > >  =20
> > > > - all userspace code needs to hardcore a list of drivers which requ=
ire
> > > > hotspots because there's no way to query from drm "does this driver
> > > > require hotspot"   =20
> > >=20
> > > Can you elaborate? I'm not sure I understand what you mean here.
> > >  =20
> >=20
> > Hi Zack and everyone,
> >=20
> > I would like to try to reboot this discussion and explain where I come
> > from. Maybe I have misunderstood something. =20
>=20
> <snip> First of all thanks for restarting the discussions. I think Gerd d=
id a good
> job responding to individual points, so let me take a step back and expla=
in the big
> picture here so we can reboot.
>=20
> > Which root problems do you want to solve exactly? =20
>=20
> The problem that this patch set is solving is the relatively trivial prob=
lem of not
> having a way of setting the hotspot in the atomic kms interface. When we
> (virtualized drivers) are using the native cursor we need to know not onl=
y the image

Could you clarify what is "native cursor" here?
I guess it is the host window system pointer's cursor?

> and position of the cursor, we need to know which point within that curso=
r activates
> the click (going back to analogy from the previous email: cursor image wi=
th arrow
> point top-left and cursor image image with arrow pointing bottom-right wi=
ll have
> different hotspots, likely  [0, 0] in the first case and [cursor_width,
> cursor_height] in the latter). To correctly route the mouse clicks we nee=
d to be
> aware of the hotspot coordinates. Currently even though all virtualized d=
rivers are
> atomic userspace has to explicitly disable atomic kms for those drivers b=
ecause
> mouse clicks are offset incorrectly as soon as the cursor image changes f=
rom the
> top-left pointing arrow, i.e. the hotspot isn't at [0,0]).
>=20
> So we would like to be able to enable atomic kms with gnome and kde on vi=
rtualized
> drivers and to do that we need a way to pass hotspot coordinates from use=
rspace to
> virtualized driver.
>=20
> That seems to be pretty self-explanatory and, I think, we all agree that =
will go
> through properties like in the attached patch set.

Right.

> Now, where the disagreements come from is from the fact that all virtuali=
zed drivers
> do not implement the atomic KMS cursor plane contract exactly as specifie=
d. In
> atomic kms with universal planes the "cursor" plane can be anything so as=
king for
> hotspot's for something that's not a cursor is a bit silly (but arguably =
so is
> calling it a cursor plane and then complaining that people expect cursor =
in it).
>=20
> So the argument is that we can't put hotspot data into atomic kms without=
 first
> rewriting all of the virtualized drivers cursor code to fix the underlyin=
g contract
> violation that they all commit. That would likely be a lot easier sell if=
 not that
> gnome/kde don't put none cursor stuff in the cursor plane, so all this wo=
rk is to
> fix breakages that seem to affect 0 of our users (and I completely unders=
tand that
> we'd still like all the drivers to be correct and unified in terms of the=
ir
> behaviour, I'm just saying it's a hard sell without something that we can=
 point to
> and say "this fixes/improves things for our customers")=20

What's the cost of making paravirtualized drivers honour the UAPI contract?
Can't you do that on the side of implementing these new hotspot
properties, with the little addition to allowing guest userspace to be
explicit about whether it supports commandeering or not?

The deny-lists exist in guest userspace already, and they are not going
anywhere any time soon that I can see. So the delay in getting those
deny-lists side-stepped is the same delay it would take to have the
guest userspace use the new UAPI to properly say they do support
commandeering.

In your mind, how do you expect guest userspace like Mutter to drop the
deny-lists? What would make GNOME developers be willing to do that? And
why is that somehow easier or faster than a new proper UAPI to be
explicit about commandeering?

You already need patches to guest userspace to fill in the hotspot
properties, so I don't get the resistance to adding another flag to be
explicit about commandeering as well. Especially when, as you say, the
big desktops do not even try to put non-cursor images on cursor planes,
it should be trivial for them to set the flag, easier than filling in
the hotspot properties.

Then projects like Weston who would indeed need larger surgery to
support commandeering will simply not set the flag, nor program hotspot
properties, and will get correct (but with high cursor latency)
behaviour from guest KMS.

> Finally there's a discussion on how to fix it and whether virtualized dri=
vers need
> to do funky stuff with the cursor. I'd like to first make sure we're on t=
he same
> page and then discuss how to fix it next, so let me finish by saying why =
not
> "software cursor".
>=20
> The easiest way to understand why we do what we do with the cursor, avoid=
ing any
> complex and weird cases lets go back to the latency issue: the round trip=
s to the
> guest to move the cursor are certainly noticeable when running locally, b=
ut with my
> VMware hat on, "local" is not the case that interest us, e.g. on ESXi eve=
ry VM is
> accessed over a network so now we're dealing with remote round trips. When
> multiplied by slow connections and scale at which we're operating the "so=
ftware
> cursors" go from "some latency" to "completely unusable". That's what I w=
as alluding
> to in the earlier email when I said they're broken in different ways beca=
use if
> asked what would you prefer: cursor that when clicked is always incorrect=
ly offset,
> or choppy/unusably slow cursor - you'll get different answers, depending =
on who you
> ask. Virtualization vendors tend to invest pretty heavily into protocols =
that
> improve on vnc/rdp for remote machine access and we'd like to not lose th=
at.

Very good.

It is important to be clear about the different ways of being broken,
so that we can discuss which faults are being fixed by a proposal
rather than arguing whether the proposal fixes "the fault" or not. If
one side understands "the fault" to be one thing and the other side
thinks it's two separate things, there can never be agreement.

> All in all, what we'd like:
>  - is to be able to run at least the dominant desktops with atomic kms
> what we need:
>  - we need the hotspot data,
> what we want to avoid:
>  - fallbacks to software cursors
>  - large additions to user-space
>=20
> I hope this clarifies things a bit.

Yes, it does, to me at least.


Thanks,
pq

--Sig_/zu+NI+kUJ.7ddHqdr9LH9zQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKgVYIACgkQI1/ltBGq
qqeO4xAAi6cKWeNeEAB046e6P+t553WHx/HbKmy07DtpksX+98/DXkEbSJliJaPc
coUaiZ9i0Sq4g6QR3tH5t+a8kl72jOz94klXGecMn+MXL9xi3KBv++mfRsS8B8xQ
u7mps6Mf7bvT20/i6Dab4L1xwZ2cuIWMpDsnm7yU09jj/J4MU93+0p6nT69XqfZC
DMp5Iqya0OfnmyhCnkWdG4AJ8VF7wlBmdrqNYCbFiDL37BT5GiTSXd2p0fdKNFt0
kn2cLLgRsoEfFBOXZpVRvT1qBrvzVdRA+gcyqDcrLa2CUasc7Ydc97tEFUMYlNsb
1ixiX3YqFNUUV9I1nX9/fdzV+eR+rP8Fazorcep0VhpniHg53fNGFcFflIgfYJL1
fL4P4tTqEFa2qt8qu4XkPRxfQEDm3Ra0nBLNvGPzcEJGjXyZ0B0wTUeMBy8U9Mgm
ibnmJama/rhn21m7tr7zI7qNCUgz/TElgROyg6sc1KN0gvBxbV9Tq7wc3o3TqS/s
aMYxKRBfsOUyeDR0JuSrbbrZ+dbmRN5rNfZbpdChaHJcB7KDH/zcR9svGXsNwJP3
2ZnPLnRUNWQn3G5dmEyUqVxZpzKmY5j9wdQwFhVrgRRV+pl2JYv7306Kptyz/b3i
IalsyTAeXj8dFEUp7P5mNnLtdYpt/6d3TGSTJY5HibcfRCQ6pBw=
=Z0MA
-----END PGP SIGNATURE-----

--Sig_/zu+NI+kUJ.7ddHqdr9LH9zQ--
