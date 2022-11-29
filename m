Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC163C35B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 16:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC00E8908B;
	Tue, 29 Nov 2022 15:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02B08908B;
 Tue, 29 Nov 2022 15:15:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 66EC55C00CF;
 Tue, 29 Nov 2022 10:15:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 29 Nov 2022 10:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1669734915; x=
 1669821315; bh=Sselh9PMPp+YXx0b/8C6fFInUaOfP3jD6verSMjxhVM=; b=D
 SbZ+WdKDRP/8Ypqbx8RaSRttN5rGOWO/bLOlkeUbmzjI8JMMdgkk9WBc5xuFGmin
 dMUt0C/5vW3ZOkPLapoxIHRKZD6KVz9LXx3L5UKnQEDLx7HfsWB1VcBndcHVf9dH
 H4lXZPp0LrunYuxuaAkTvg/PLAXs441upTNf0cC9o7GT7EVqI5AS2RhxMyNt3RCO
 sgg5vTtt2DoBO4sPieGeVlxmwJB29PLkMY7SVDfocT4styC6lsXIT9Ngko9XeJxl
 PVMai/wQ+ikjL3RIflAX6GunDAd0qIlXj2dMha+DlsSiLCRl57xfB+2vzXLPCvGc
 ZM8rRMeCgGMi5sck4j2Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669734915; x=1669821315; bh=Sselh9PMPp+YXx0b/8C6fFInUaOf
 P3jD6verSMjxhVM=; b=NQu39eszLsMlTbbZhV5nP6SPUjLTkF7cqZm3BjAcH9yA
 qx89mT1+eh3XNBPr3AHrkBncoJVrM1H2K7rxbnbP4V17uJNVJffDKuBtsuop9Aul
 dXpq3ozSWfbENecyWH1Btm78kVHbU1u1Bor9clnIKSq6LUMQnqfMJnjV2sQCHVto
 7suWA2+qdkqDIRQ9lmYwugbfUDADCHsCujHzodkRCEETV7GZ0QpcMqX0PI0Hc17d
 FhNS/+O4+wzxX3Cku1iWLrMcKAdHvKF+yIyKlZcm/+Aew/VBMC2BBku8cvHgUhHJ
 jgIjTr0NHjqt0rUIpgUddBP46LpooqnwbRR9hM/cXw==
X-ME-Sender: <xms:ASKGY0c_VQUEd80G-qdjJTURCmAJfzV0k_X0JEzrAn1sOWxyLHDL2g>
 <xme:ASKGY2PXjwuX3tGNCi8iMCL6lBfZ-AN1B0SOSBTlWHa2KbHLlEZRRP_IFSAZylv1n
 rd-BxY4wWhfYA>
X-ME-Received: <xmr:ASKGY1j_ZYix7HKg0n-Q0HHXo5S_QOTQo6ovfzBs0qGdcdtf3ELcvWdUBIai1IZGP2iwxJUyrIBtLEMk1ji4A4bKvxLgDsPfzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtddtgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetueeg
 fefhffdvffetleeltdelkedvlefhkeehgfehhffhheehudeitdegheejleenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:AiKGY5802rBC-FmyHJMBKAsxHpVRHv57Shb4X1JPunnjVCHn3CtATA>
 <xmx:AiKGYwsGB_mHWDvOM6HNoe2fYZAABoAsoPaxrnutQVkZyx2vciX08w>
 <xmx:AiKGYwERdvQueWfSZ53vUphekMqtLND5N57nI4n2DOaDG9qYEp_ILg>
 <xmx:AyKGY8I1ldEJtPL-GeMehBMyJU5b9S8xQN4qJBQ0uGCGjuEx80MRQg>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Nov 2022 10:15:12 -0500 (EST)
Date: Tue, 29 Nov 2022 16:15:10 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: AMD GPU problems under Xen
Message-ID: <Y4Yh/gyt48zoIOyL@mail-itl>
References: <Y4Mz0glMNwDPaFPO@itl-email>
 <CADnq5_NfupG-DzNDJfntg+uSWH2m_8mLfj=ddkMdnNYNRhXWUw@mail.gmail.com>
 <Y4Vngz5tTA74Qr8L@itl-email>
 <CADnq5_P8kuSsSFatMq4g0r2yE3TW0Rqzm07+Kpv9wKTi0GGS-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ldwT7sa60O/uU5QD"
Content-Disposition: inline
In-Reply-To: <CADnq5_P8kuSsSFatMq4g0r2yE3TW0Rqzm07+Kpv9wKTi0GGS-Q@mail.gmail.com>
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
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ldwT7sa60O/uU5QD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Nov 2022 16:15:10 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	christian.koenig@amd.com,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: AMD GPU problems under Xen

On Tue, Nov 29, 2022 at 09:32:54AM -0500, Alex Deucher wrote:
> On Mon, Nov 28, 2022 at 8:59 PM Demi Marie Obenour
> <demi@invisiblethingslab.com> wrote:
> >
> > On Mon, Nov 28, 2022 at 11:18:00AM -0500, Alex Deucher wrote:
> > > On Mon, Nov 28, 2022 at 2:18 AM Demi Marie Obenour
> > > <demi@invisiblethingslab.com> wrote:
> > > >
> > > > Dear Christian:
> > > >
> > > > What is the status of the AMDGPU work for Xen dom0?  That was menti=
oned in
> > > > https://lore.kernel.org/dri-devel/b2dec9b3-03a7-e7ac-306e-1da024af8=
982@amd.com/
> > > > and there have been bug reports to Qubes OS about problems with AMD=
GPU
> > > > under Xen (such as https://github.com/QubesOS/qubes-issues/issues/7=
648).
> > >
> > > I would say it's a work in progress.  It depends what GPU  you have
> > > and what type of xen setup you are using (PV vs PVH, etc.).
> >
> > The current situation is:
> >
> > - dom0 is PV.
> > - VMs with assigned PCI devices are HVM and use a Linux-based stubdomain
> >   QEMU does not run in dom0.
> > - Everything else is PVH.
> >
> > In the future, I believe the goal is to move away from PV and HVM in
> > favor of PVH, though HVM support will remain for compatibility with
> > guests (such as Windows) that need emulated devices.
> >
> > > In general, your best bet currently is dGPU add in boards because they
> > > are largely self contained.
> >
> > The main problem is that for the trusted GUI to work, there needs to
> > be at least one GPU attached to a trusted VM, such as the host or a
> > dedicated GUI VM.  That VM will typically not be running graphics-
> > intensive workloads, so the compute power of a dGPU is largely wasted.
> > SR-IOV support would help with that, but the only GPU vendor with open
> > source SR-IOV support is Intel and it is still not upstream.  I am also
> > not certain if the support extends to Arc dGPUs.
>=20
> Can you elaborate on this?  Why wouldn't you just want to pass-through
> a dGPU to a domU to use directly in the guest?

You can do that, but if that's your only GPU in the system, you'll lose
graphical interface for other guests.
But yes, simply pass-through of a dGPU is enough in some setups.

> Are you sure?  I didn't think intel's GVT solution was actually
> SR-IOV.  I think GVT is just a paravirtualized solution.

Yes, it's a paravirtualized solution, with device emulation done in dom0
kernel. This, besides being rather unusual approach in Xen world
(emulators, aka IOREQ servers usually live in userspace) puts rather
complex piece of code that interacts with untrusted data (instructions
=66rom guests) in almost the most privileged system component, without
ability to sandbox it in any way. We consider it too risky for Qubes OS,
especially since the kernel patches were never accepted upstream and the
Xen support is not maintained anymore.

The SR-IOV approach Demi is talking about is newer development,
supported since Adler Lake (technically, IGD in Tiger Lake presents
SR-IOV capability too, but officially it's supported since ADL). The driver
for managing it is in the process of upstreaming. Some links here:
https://github.com/intel/linux-intel-lts/issues/33
(I have not tried it, yet)

>  That aside,
> we are working on enabling virtio gpu with our GPUs on xen in addition
> to domU passthrough.

That's interesting development. Please note, Linux recently (part of
6.1) gained support to use grant tables with virtio. This allows having
backends without full access to guest's memory. The work is done in
generic way, so a driver using proper APIs (including DMA) should work
out in such setup out of the box. Please try to not break it :)

> >
> > > APUs and platforms with integrated dGPUs
> > > are a bit more complicated as they tend to have more platform
> > > dependencies like ACPI tables and methods in order for the driver to
> > > be able to initialize the hardware properly.
> >
> > Is Xen dom0/domU support for such GPUs being worked on?  Is there an
> > estimate as to when the needed support will be available upstream?  This
> > is mostly directed at Christian and other people who work for hardware
> > vendors.
>=20
> Yes, there are some minor fixes in the driver required which we'll be
> sending out soon and we had to add some ACPI tables to the whitelist
> in xen, but unfortunately the ACPI tables are AMD platform specific so
> there has been pushback from the xen maintainers on accepting them
> because they are not an official part of the ACPI spec.

Can the driver work without them? Such dependency, as you noted above,
make things rather complicated for pass-through (specific ACPI tables
can probably be made available to the guest, but usually guest wouldn't
see all the resources they talk about anyway).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ldwT7sa60O/uU5QD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOGIf0ACgkQ24/THMrX
1ywEbQf+PEElPPxfmzpsF7KCl9us8eI4hUgwXur7ALf7DdhApavQOMgYmyMp47lO
shMbFQygjqSJ4YCTvtRCWmEDIqmUduv/q6M69Hxv5bldxDx2qe/2/wwcUcQ4jKQB
34BJNGeLyuuxtgJ1Fw7EvmUVVm3TKTa57r5YqVpxmXkQ28or+2vbHmY8BGeQgYmn
k6rJ24EDNfTs/fINw68+Rigvdt8tNKRvl69aHpwGMO1F6/k4EfBmqYUB6Al19xrY
SIXSRI9skw/5UGR7fJ6ST7Cmm1FSOKWWkq/gmTMNy7qWbtSbelUouNPa+WAorBHr
xBAtDguDGYb4pWCilHWOxHrC05G7Zw==
=qLiG
-----END PGP SIGNATURE-----

--ldwT7sa60O/uU5QD--
