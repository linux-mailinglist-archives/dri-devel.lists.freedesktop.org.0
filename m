Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53E763B78C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 02:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C3D10E362;
	Tue, 29 Nov 2022 01:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE0810E1B1;
 Tue, 29 Nov 2022 01:59:37 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 470565C00C1;
 Mon, 28 Nov 2022 20:59:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Nov 2022 20:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1669687174; x=
 1669773574; bh=bCzCW4/+DVi1mzJ0xQmcTMOHmu4kfPgKqlGu0numccY=; b=U
 RmYDHJ3F7x35fkfLBKI1Yo7XVUTRRsN45Ny5R/P3xVK3+G0SBNwwIHAcqpMuRKdQ
 oWxfudlkLYSzENGbXPCCcNO5ekFGmsd6aPoNy7AaMB9FqtCymC46XybioL8bgckH
 /6CIO84fjtTQ0nVg2Zh5FHy4ilJFX4eS0tv23Y5jorCPXWJdHfLjuzdwHw8JpiHP
 bLLQGV2pNBlVNdfg/EmDh3zO5I9VOM+YTjwSCm92rfLmegjIjh+MayTgjDDB03WS
 5c4wUeb2wa9IX6pcPWYm8u1tBK1ismm0DPcot1aTE52IDMlslGQbsJoBOGJGR5/6
 nnMcAfcYSVLJOvksNY69g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669687174; x=1669773574; bh=bCzCW4/+DVi1mzJ0xQmcTMOHmu4k
 fPgKqlGu0numccY=; b=NIJS1wT1ugY8hKu5vKDZbYa4OE4PqOrDqCRC5w+GcxXq
 aFS2t6g9r87n2OeMeAhK01dyokuD8pPfNaNthqDB4oQMB92nLotQ3aPIWL4owj5h
 7qeu9XOcv1WZRgo6uBMn00VmZENQAxl+NjPEpFSj3cVsOqlWnoX2AqBkoLKUy5mz
 Kl1cBr931HsTm4dyYvAaFbF9dQikX23UJQtAV3GMR+Z0DOa8OrTRegTKoNBtUijy
 hLyq3b0zMgctvuAA3O6adHmIvH3Xkz7dptacZ7QxI7rOmqpqDibR4j7ouVa6sET3
 kRYGd91pkl7LX+1kW8YiKNuV9D2cIvTf+YMf4hIDQA==
X-ME-Sender: <xms:hmeFYxTHm_9kBPzYBGxkgu86VYLchQqD9KX3nBkrEVzijL26XL57Jg>
 <xme:hmeFY6zXlfBGJkg0d--OA7d7zbqg6We1E4aq5Hd1ElOlJBzuvC2TAthVUQwKtnnrL
 urGoZCivaEytMQ>
X-ME-Received: <xmr:hmeFY220gQECshzXv-scsal88PUAQC37Jg3ZJIUJ-PXog7krHOTZrdlZZRiR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjeefgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
 ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvvefhlefhhfetledvgefhvddukeet
 jeffvdeigeeiteetjefhjefgvdelveehgfenucffohhmrghinhepkhgvrhhnvghlrdhorh
 hgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
 hm
X-ME-Proxy: <xmx:hmeFY5Ass0uI--XdYAk0U_TS5KrJ9Sm7xFbOfLTlPAc2qv5koRidJg>
 <xmx:hmeFY6gdV2ZwIfbTJpU2ybTrfI7S8-9L34VUB8p6QeJnKe9c1COtAQ>
 <xmx:hmeFY9osg18XXGjnvK1Ok0mmRpr46-7ODtZLRjRFDuG5okFgcFDNKg>
 <xmx:hmeFY7uT7o_FHUYHmNTsyoQy3Q_TgyEhh3piLsTpX8udzlraq3ecyg>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 20:59:33 -0500 (EST)
Date: Mon, 28 Nov 2022 20:59:28 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: AMD GPU problems under Xen
Message-ID: <Y4Vngz5tTA74Qr8L@itl-email>
References: <Y4Mz0glMNwDPaFPO@itl-email>
 <CADnq5_NfupG-DzNDJfntg+uSWH2m_8mLfj=ddkMdnNYNRhXWUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wz46AtdtDi0AOdbm"
Content-Disposition: inline
In-Reply-To: <CADnq5_NfupG-DzNDJfntg+uSWH2m_8mLfj=ddkMdnNYNRhXWUw@mail.gmail.com>
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
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wz46AtdtDi0AOdbm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Nov 2022 20:59:28 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: christian.koenig@amd.com,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: AMD GPU problems under Xen

On Mon, Nov 28, 2022 at 11:18:00AM -0500, Alex Deucher wrote:
> On Mon, Nov 28, 2022 at 2:18 AM Demi Marie Obenour
> <demi@invisiblethingslab.com> wrote:
> >
> > Dear Christian:
> >
> > What is the status of the AMDGPU work for Xen dom0?  That was mentioned=
 in
> > https://lore.kernel.org/dri-devel/b2dec9b3-03a7-e7ac-306e-1da024af8982@=
amd.com/
> > and there have been bug reports to Qubes OS about problems with AMDGPU
> > under Xen (such as https://github.com/QubesOS/qubes-issues/issues/7648).
>=20
> I would say it's a work in progress.  It depends what GPU  you have
> and what type of xen setup you are using (PV vs PVH, etc.).

The current situation is:

- dom0 is PV.
- VMs with assigned PCI devices are HVM and use a Linux-based stubdomain
  QEMU does not run in dom0.
- Everything else is PVH.

In the future, I believe the goal is to move away from PV and HVM in
favor of PVH, though HVM support will remain for compatibility with
guests (such as Windows) that need emulated devices.

> In general, your best bet currently is dGPU add in boards because they
> are largely self contained.

The main problem is that for the trusted GUI to work, there needs to
be at least one GPU attached to a trusted VM, such as the host or a
dedicated GUI VM.  That VM will typically not be running graphics-
intensive workloads, so the compute power of a dGPU is largely wasted.
SR-IOV support would help with that, but the only GPU vendor with open
source SR-IOV support is Intel and it is still not upstream.  I am also
not certain if the support extends to Arc dGPUs.

> APUs and platforms with integrated dGPUs
> are a bit more complicated as they tend to have more platform
> dependencies like ACPI tables and methods in order for the driver to
> be able to initialize the hardware properly.

Is Xen dom0/domU support for such GPUs being worked on?  Is there an
estimate as to when the needed support will be available upstream?  This
is mostly directed at Christian and other people who work for hardware
vendors.

> Additionally, GPUs map a
> lot of system memory so bounce buffers aren't really viable.  You'll
> really need IOMMU,

Qubes OS already needs an IOMMU so that is not a concern. =20
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--wz46AtdtDi0AOdbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOFZ4MACgkQsoi1X/+c
IsHybQ//VsSMy5gMOlPDvJX8SVGfDZwZ0OEKd3sBJjaGIsMRg4BtgxkDu1qH2oKw
cV0ADVylb7KnBZtpGDeeAChhi7TQ8Jty8OKgzTuxQ/lkDOVJo1rZ5mxe70kVDfww
6Vyn9kWkG0P1ht0IZqpqwjTis0yrqvlmwauEcxmZtWMo/wL/EZwoPSCadF6ch3Mv
JGvIbiXdNbVRVQAIU0wyl/jYvXDxGxgtcZWWChp6RoHZfu7zzjbUY5UirKtIRBbH
q/lyplg3VjDkvd6iSwu7SbfgorjmFa/bIRL5JAL4QQGmyUYORjbsozXpTA8gzQt0
8dEZzD2NRcFX+6m10m45sQKjKY7FWoeWlOIRzag/5uYTpe0ay9gu5FNjVlLWzgQp
Hyml5L8MutGMp0+Zy7dSwdrZXU4iAVMctNDSDIPKkKngXG2fcHgNc6QeaHbX075z
FbjPyItnZt5XnUMkUpdvElJYvKJkzVb9WkzOUgnN8j9Nmm+h8T1sQFzNF4i/Mlv/
9eywtNvN4jn9Qtb4DaRz3n4Gtactx3sjNcaaqK4MG6rYFKuW0FghEzdz2W1Sgoil
kIVyuaTwcbq+SL+m8PlmTnL765/tKyV6pWWvaqiDsxm0Y8bSrvnumPCtnzADdn1F
Eb71xoPQH8Idhrftp+DjU2O7TaOPogKg5e8iPkBUm8hQCSltDpE=
=rqwd
-----END PGP SIGNATURE-----

--wz46AtdtDi0AOdbm--
