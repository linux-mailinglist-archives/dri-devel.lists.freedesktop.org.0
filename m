Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C49A209CD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 12:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD6010E675;
	Tue, 28 Jan 2025 11:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="oy0bVQhu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D78E10E190;
 Tue, 28 Jan 2025 11:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cax5VVE1FBXLtV5rAkGDYyeqn6F+PmH2sWIcspZqQmA=; b=oy0bVQhuWWRNUrfXjqTfoWLFea
 Z6fX7evmnj4ZXBaulL8FpEqXQcH78hMFKbXKxQPuskHh3uUbsKpMhjmekkEBjVk0tMSJEl0SYbyAZ
 cXRs64lQ/EIdqt+vA5lIf1B8WUC2/ej8M/u0csi+eWO5PWUeHh8m0bo5sayqrrOd7SFwSFIfiScMy
 uNAdhs208Pvt1zFTl8zoAVsnVAoydrEh70Wc2BUy1uKPJQAHmoL6tT16jZgLB5gpTyFIYq2NhfBMQ
 otfz0Rp8bl1hostB9d1PnbD6e9wFNAzqZDjUf69txYV+gKPqbvx1ZJkzfuuE7M7KFET34E4o/yFng
 ZWwf3Igw==;
Received: from [194.136.85.206] (port=51020 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tcjv9-0001aW-2Q;
 Tue, 28 Jan 2025 13:38:19 +0200
Date: Tue, 28 Jan 2025 13:38:09 +0200
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
Message-ID: <20250128133809.1e5ed2be@eldfell>
In-Reply-To: <Z5ilcc0hC8nvz0Li@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-3-raag.jadav@intel.com>
 <CAFZQkGy3R0TMY5CARPQZF70fdKGLX8GQjV_YQAHzEXsiuNHj+w@mail.gmail.com>
 <Z5CAkXSOpNiiFbv4@black.fi.intel.com>
 <20250127122328.6d85bca1@eldfell>
 <Z5ilcc0hC8nvz0Li@black.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B=BzF7y2RMP=D2.kl/VkcSu";
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

--Sig_/B=BzF7y2RMP=D2.kl/VkcSu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Jan 2025 11:37:53 +0200
Raag Jadav <raag.jadav@intel.com> wrote:

> On Mon, Jan 27, 2025 at 12:23:28PM +0200, Pekka Paalanen wrote:
> > On Wed, 22 Jan 2025 07:22:25 +0200
> > Raag Jadav <raag.jadav@intel.com> wrote:
> >  =20
> > > On Tue, Jan 21, 2025 at 02:14:56AM +0100, Xaver Hugl wrote: =20
> > > > > +It is the responsibility of the consumer to make sure that the d=
evice or
> > > > > +its resources are not in use by any process before attempting re=
covery.   =20
> > > > I'm not convinced this is actually doable in practice, outside of
> > > > killing all apps that aren't the one trying to recover the GPU.
> > > > Is this just about not crashing those processes if they don't handle
> > > > GPU hotunplugs well, about leaks, or something else?   =20
> > >=20
> > > Correct, all of it. And since the compositor is in charge of device r=
esources,
> > > this way it atleast has the opportunity to recover the device and rec=
reate
> > > context without all the userspace violence. =20
> >=20
> > Hi Raag,
> >=20
> > sorry, I haven't followed this series, so I wonder, why should
> > userspace be part of recovering the device? Why doesn't the kernel
> > automatically load a new driver instance with a new DRM device node? =20
>=20
> There are things like bus level reset (PCI SBR) and re-enumeration that a=
re
> not possible from driver context (or atleast I'm not aware of it), so a n=
ew
> instance is just as useful/less as the old one.

Ok, "not possible from driver context" is a key revelation. I wonder if
starting an overview section with that in the documentation would help
getting the right mindset.

Did I miss that somewhere?

I thought bus level reset meant resetting the PCI device by some bus
API. Clearly mistaken, I suppose you mean resetting the whole bus
including everything on it?

> > I see in the commit message written:
> >=20
> > 	"For example, if the driver supports multiple recovery methods,
> > 	consumers can opt for the suitable one based on policy
> > 	definition."
> >=20
> > How could consumers know what to do? How can they guess what would be
> > enough to recover the device? Isn't that the kernel driver's job to
> > know? =20
>=20
> Yes, 'WEDGED=3D' value are the known methods that are expected to work. T=
he
> policy is how the consumer can decide which one to opt for depending on t=
he
> scenario. For example, the less drastic method could work in most cases, =
but
> you'd probably want to opt for a more drastic method for repeat offences =
or
> perhaps if something more serious is discovered from "optional telemetry
> collection".

Aha, cool.

> > (More important for userspace would be know if dmabuf fds remain
> > pointing to valid memory retaining its contents or if the contents are
> > lost. Userspace cannot tell which device a dmabuf originates from,
> > AFAIK, so this would need to be added in the generic dmabuf UAPI.) =20
>=20
> Not sure if I understand, perhaps Christian can shed some light here.

A system might have multiple GPUs, and one GPU going down may leave all
the rest working as usual. A Wayland compositor would want to tell the
difference between still-good and possibly or definitely lost dmabufs
it received from its clients.

But this is off-topic in this thread I believe, nothing to the series
at hand.

> > > > > +With IOCTLs blocked and device already 'wedged', all device memo=
ry should =20
> >=20
> > btw. when I see "blocked" I think of the function call not returning
> > yet. But in this patch "blocked" seems to be synonymous for "returns
> > an error immediately". Would it be possible to avoid the word "blocked"
> > for this? =20
>=20
> It is meant as "blocking the access", but fair enough. We can have a quick
> fix later on if it's not too big of a concern.

Sure, I don't mind.

> > > > > +be unmapped and file descriptors should be closed to prevent lea=
ks.   =20
> > > > Afaiu from a userspace POV, a rebind is just like a GPU hotunplug +
> > > > hotplug with matching "remove" and "add" udev events. As long as the
> > > > application cleans up resources related to the device when it recei=
ves
> > > > the event, there should be no leaks with a normal hotunplug... Is t=
his
> > > > different enough that we can't have the same expectations?   =20
> > >=20
> > > The thing about "remove" event is that it is generated *after* we opt=
 for an
> > > unbind, and at that point it might be already too late if userspace d=
oesn't
> > > get enough time to clean things up while the device is removed with a=
 live
> > > client resulting in unknown consequences.
> > >=20
> > > The idea here is to clean things up *before* we opt for an unbind lea=
ving
> > > no room for side effects. =20
> >=20
> > Something here feels fragile. There should not be a deadline for
> > userspace to finish cleaning up. What was described for KMS device nodes
> > in this same document seems like a more reliable approach: keep the
> > dead driver instance around until userspace has closed all references
> > to it. The device node could be removed earlier. =20
>=20
> I'm not sure if I'm following here. The driver instance will exist as long
> as the dead device exists, which the consumer can remove if/when it choos=
es
> to trigger an unbind from userspace. There is no deadline for it.

I was going by your words: "it might be already too late if userspace
doesn't get enough time to clean things up".

> The consumer can choose to rely on hotplug events if it wishes, but the p=
oint
> here is that it doesn't guarantee a clean recovery in all cases.

Clearly I don't understand the whole picture here. No worries,
nevermind.


Thanks,
pq

--Sig_/B=BzF7y2RMP=D2.kl/VkcSu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmeYwaEACgkQI1/ltBGq
qqesNhAAhIiqicalz5Fb2lGKFYSceSRQCkSA6YX6Outjyyob9n6/Cggx1GZc9tyl
kPpSGq3uxttTBEBfO+YjvT5NOV6I7SOv1XThfwAtUCTD2xU+3gp0CBxP6Jt1vIOr
N+GaydjKm69Pc2tLO4rm8TfeAF+njQ2NBf5qkbRN5a5K6eWZCI4fkV07kAsq4JJo
sSOWDZLHC9tWr2BixmaXEXBlY4LCjeQgitvaFRCpZWayhZcVcnS5XhFQPC98l2pm
3ZWeVRDtdT0F3JtF1Q/dh08SZ7+AkhoUEo+y+zpzJVISHNh4VF1InkUdhmL5b+VX
NxbZiKnX+CROkMxG8X433huyZFc/mXZFV7oV1HHTH0jIqUsAT38vV/f8yfUL9rkH
qCdNrpk9Yw4RDGpuX7jBzDefsFUL/e/9ugho8xtI470EGcYMXTBt0x+eeLH3c2pp
xMoWSVpDDx91jXUu4t5DB5Orxuizz7h+L61Npl/FodCOd55kQETMovMSvCgheAd8
Q6Kqt5Qmcj/0TpaBIoQfVcNt2knrX0BBKMQrJMEgD9n8JfVRpOjP8wxJKN42/9Zw
PSchC5zkNLMRDisTvD6+I0cg1V+RS2/TxMpq4RQLT4h3L3PvEgvkyk9YXe82kqnb
oAFefbdsPc40B8W2P+DeRQYdKGmY8KBmCo+2QSY48RSzZn1uEaM=
=qgtN
-----END PGP SIGNATURE-----

--Sig_/B=BzF7y2RMP=D2.kl/VkcSu--
