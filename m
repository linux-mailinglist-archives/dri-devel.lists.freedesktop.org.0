Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED1A1D454
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 11:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCF889DFB;
	Mon, 27 Jan 2025 10:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="RrzLYm/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C44289DFB;
 Mon, 27 Jan 2025 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yD/D2+nscyMs4rmMHdMo35IBdi5XMB2qp4Gun29olS8=; b=RrzLYm/hJNnp8Iawo14KFujD1B
 dgYwgU2sXAB2bMOc9kXkeA1pldRUvEnrwMkqpmid5ZG2T6C+urJ9CSzsBpe9RtIPWCrAWnBpljibR
 NCL6ZpDEQlc8P0nyaYxJv9b3f+hD7oAFcvRg0KxuASNAfECabdSEHqH5mfkKhKTa+iasGrkDGffGL
 O0Vdbzy0TulqAF9xPP+B9kv/majU4pzGgGln2J31ccubtKed6WKjOkM/Vm0VeXrPumVpaX4lCq49c
 LrHuuFQcN2b9LiiRnxYAalDysrPaEgHdgn6/jid11xHnyJox4jSl4p6w+0FiYVDp2hLfQdw/BcZRd
 6rPRc1Ag==;
Received: from [194.136.85.206] (port=38530 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tcMHD-00016b-2a;
 Mon, 27 Jan 2025 12:23:31 +0200
Date: Mon, 27 Jan 2025 12:23:28 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Xaver Hugl <xaver.hugl@kde.org>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v10 2/4] drm/doc: Document device wedged event
Message-ID: <20250127122328.6d85bca1@eldfell>
In-Reply-To: <Z5CAkXSOpNiiFbv4@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-3-raag.jadav@intel.com>
 <CAFZQkGy3R0TMY5CARPQZF70fdKGLX8GQjV_YQAHzEXsiuNHj+w@mail.gmail.com>
 <Z5CAkXSOpNiiFbv4@black.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WDsb8DKWCL+/WckgwZn74cK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/WDsb8DKWCL+/WckgwZn74cK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Jan 2025 07:22:25 +0200
Raag Jadav <raag.jadav@intel.com> wrote:

> On Tue, Jan 21, 2025 at 02:14:56AM +0100, Xaver Hugl wrote:
> > > +It is the responsibility of the consumer to make sure that the devic=
e or
> > > +its resources are not in use by any process before attempting recove=
ry. =20
> > I'm not convinced this is actually doable in practice, outside of
> > killing all apps that aren't the one trying to recover the GPU.
> > Is this just about not crashing those processes if they don't handle
> > GPU hotunplugs well, about leaks, or something else? =20
>=20
> Correct, all of it. And since the compositor is in charge of device resou=
rces,
> this way it atleast has the opportunity to recover the device and recreate
> context without all the userspace violence.

Hi Raag,

sorry, I haven't followed this series, so I wonder, why should
userspace be part of recovering the device? Why doesn't the kernel
automatically load a new driver instance with a new DRM device node?

Of course userspace needs to deal with stuff suddenly erroring out, and
destroy existing related resources, then wait for a working device
to appear and rebuild all state. The kernel driver already needs to
make the existing open stuff inert and harmless, why does it need an
acknowledgement from userspace to unbind and re-bind?

> I'm not entirely aware of its feasibility though, perhaps something for t=
he
> consumers to experiment.

If consumers mean userspace, then no, not reliably. But the kernel can
do it.

I see in the commit message written:

	"For example, if the driver supports multiple recovery methods,
	consumers can opt for the suitable one based on policy
	definition."

How could consumers know what to do? How can they guess what would be
enough to recover the device? Isn't that the kernel driver's job to
know?

(More important for userspace would be know if dmabuf fds remain
pointing to valid memory retaining its contents or if the contents are
lost. Userspace cannot tell which device a dmabuf originates from,
AFAIK, so this would need to be added in the generic dmabuf UAPI.)

	"Consumers can also choose to have the device available for
	debugging or additional data collection before performing the
	recovery."

Couldn't the wedged driver instance remain detached from the hardware
while a new driver instance initializes? Then debug data remains until
the wedged device is fully closed from userspace, or maybe devcore dump
retains it.

I presume that WEDGED=3Dnone case should retain the debug data somehow as
well.

> > > +With IOCTLs blocked and device already 'wedged', all device memory s=
hould

btw. when I see "blocked" I think of the function call not returning
yet. But in this patch "blocked" seems to be synonymous for "returns
an error immediately". Would it be possible to avoid the word "blocked"
for this?

> > > +be unmapped and file descriptors should be closed to prevent leaks. =
=20
> > Afaiu from a userspace POV, a rebind is just like a GPU hotunplug +
> > hotplug with matching "remove" and "add" udev events. As long as the
> > application cleans up resources related to the device when it receives
> > the event, there should be no leaks with a normal hotunplug... Is this
> > different enough that we can't have the same expectations? =20
>=20
> The thing about "remove" event is that it is generated *after* we opt for=
 an
> unbind, and at that point it might be already too late if userspace doesn=
't
> get enough time to clean things up while the device is removed with a live
> client resulting in unknown consequences.
>=20
> The idea here is to clean things up *before* we opt for an unbind leaving
> no room for side effects.

Something here feels fragile. There should not be a deadline for
userspace to finish cleaning up. What was described for KMS device nodes
in this same document seems like a more reliable approach: keep the
dead driver instance around until userspace has closed all references
to it. The device node could be removed earlier.


Thanks,
pq

--Sig_/WDsb8DKWCL+/WckgwZn74cK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmeXXqAACgkQI1/ltBGq
qqcM/Q/+Ipt9pMHVb7G+gEvEnhJkrg1fVIHMg2XIo3dIkwC7T8Jrtv8D8eRsbQ6Y
SRlCSt2FjhlzcLDVVz3li5BgYxyHvEoFdu7KNvgmPydLvdXvUIsBDpluSHhzOCFf
b3XgaplCG7QlsQMAkP5w0PATD3J0yp8izHFwtlIymst7loPhmTqDd8fJNCfhpA1a
1qLe3Y8fE+1gzVA3ScrH+H+wWLXi3hKPM5S8ukghCkTUqrO1pc41HDVt2yQ+0UR4
d2DPAgUayv2uVJvU3mVUpYAU519xFswrtFJ5oGtHMf1aAb4GS4GvUDmQr0TE2ZVo
l0gc9v1RQ7KLGy3nTNu56a8d3rSYML4OoG569IlW7OyzncE9rsofMMAJ8Z4snzoY
0+A8lQsJX76gxgdDk7NEZgPdm/9SzY5pZmR/uVn2/ilrnozOy57xKNIU1uYS//IG
iXGCj8gk+zPUyvId1eLFsCLELOnujTK3g7llRYXR5axdQn2/GElJ4nPbGi0KyZWQ
whJ6u48Qek6n+3aX1tjuL6EeIhW9aiTXQ4PmS4owwKvi0SB+vys8WRwFvynDLP5Z
BNq9mUASWrRZE6M7qycKhcAjccZuDyAfz//++5clDmfL05dIntTYzctamLilwWdy
wsRSNEB/o2ikguHw6NOSTTRL1Lk4usLjPQwoAIi0+kWvEMCjXr4=
=axF5
-----END PGP SIGNATURE-----

--Sig_/WDsb8DKWCL+/WckgwZn74cK--
