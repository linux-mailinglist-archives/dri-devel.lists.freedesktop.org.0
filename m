Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5590938D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 22:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6392C10E296;
	Fri, 14 Jun 2024 20:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="Mt5B9ogH";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="EmkugCjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FA410E296
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 20:56:40 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.nyi.internal (Postfix) with ESMTP id 0738013800FD;
 Fri, 14 Jun 2024 16:56:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 14 Jun 2024 16:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1718398600;
 x=1718485000; bh=GZPfKZ/Rz0jT5WuRTnq+r2l0cpFH+3QRn9r5BMxT+Ts=; b=
 Mt5B9ogHpW1dhxnaLK59J5ig5ZJWDOk5db/jq4tUMQ2ox52KOTKQy9UaBLS2wbjm
 nkBMZc898CGrcZ8GZH+5xShl5vVXNhfXGgDG+kshuVj8CABS668Y9fAvnozR2D5o
 RQTFzeVdRNN2p7M94tWuF3Z+/MUhUM7kGb7+TA/+xYsbrocOQ65DvmLBp0DJRyPN
 W+b2k5h+qxWSJKdTbl5V6EBg8AJB76OIYKZRSZhcFhgKOpYxleH19qqgjK5oqk1H
 dbbMbljKMvaJgRx+4EdxA/54UVvflhru/lVIh+dj8dStLrKNd96wcXtML5U0Mr04
 NPJkJPfNVAiFVAdK5B6JNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1718398600; x=1718485000; bh=GZPfKZ/Rz0jT5WuRTnq+r2l0cpFH
 +3QRn9r5BMxT+Ts=; b=EmkugCjsSEP+9Srmhwxh5eneGc8BRY3mw0rwtq+IcWn5
 xGI4qvdP0wYo6NnjH5hv9TblYpHDvz9abkg27jqZTGGacuCKni8v7948B/nxXzRy
 N62Ywnomj/pTCqhDlhodcnPlK/RKh+z+AGcKTuo6itasQ9Tyci2CoU2h8ZTNqTZA
 3D5W+OklbQbsmykljZ8dODJP0MtEtq5mbe7o5J3aPPe7P8mzU5gXwaBAtxCziV0x
 juNV8OIyF4EY6z+JGR2sCz1AeS4IpUVeYsP7/4/dxnU60tbngOiS7A0G7j3+1Rpa
 jwW3ok4A6ZbAUzewgI7JP8KJDOnZ5yhMH6DGkvKR2g==
X-ME-Sender: <xms:h65sZk72XJs0HKW8UQatexwDrD9GGPjJBa5iNXdy0DwHvuAuPLqhxA>
 <xme:h65sZl4Pvaefasuz-sShVLrEkuLAnTtnKRDpmgDezzJot1_jqKIZE2_IhJvPvfZZI
 nsT9BI77jItKjA>
X-ME-Received: <xmr:h65sZjdXVu0QxA9Uh-Lst5YVCtPfLxcrqM01twdBF1iaJzts0B3s-AfVfZ1T4YiDWZvAlovtk9H1FHnpnp-5vNojjDlP7Vl0BNuZLok2E2Qi85vL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgudehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
 ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
 hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffej
 geejgeffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
 shhlrggsrdgtohhm
X-ME-Proxy: <xmx:h65sZpL4tf3cQXEmmpwHCVckqTZF-n6MXtAa3ubaKoOua9KbTfpEGA>
 <xmx:h65sZoLGqYKy_CrKTcv4NpEnXKPqUZEUdQgR0FRJjpxMhoGyptwomg>
 <xmx:h65sZqztYGeYvgGkgnwFpw63dIst23dyXgZZEJ7PqR1lAtPitTlDSg>
 <xmx:h65sZsJL-877f7QIWuPZNoy6m3SGo9FQYgV_yeNehhy_7S4cxrxyow>
 <xmx:h65sZlD99sM47HY8pBaFvYzpFUjTkEH3q7vghxPlhdmzjzheYv5WUy0o>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 16:56:38 -0400 (EDT)
Date: Fri, 14 Jun 2024 16:56:35 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Direct Rendering Infrastructure development <dri-devel@lists.freedesktop.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Rob Clark <robdclark@gmail.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZmyuhRQlHxo2JXPu@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Gd/4I9Ey0Xn0VJx2"
Content-Disposition: inline
In-Reply-To: <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
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


--Gd/4I9Ey0Xn0VJx2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Jun 2024 16:56:35 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Direct Rendering Infrastructure development <dri-devel@lists.freedesktop.org>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Rob Clark <robdclark@gmail.com>
Subject: Re: Design session notes: GPU acceleration in Xen

On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
> On 13.06.2024 20:43, Demi Marie Obenour wrote:
> > GPU acceleration requires that pageable host memory be able to be mapped
> > into a guest.
>=20
> I'm sure it was explained in the session, which sadly I couldn't attend.
> I've been asking Ray and Xenia the same before, but I'm afraid it still
> hasn't become clear to me why this is a _requirement_. After all that's
> against what we're doing elsewhere (i.e. so far it has always been
> guest memory that's mapped in the host). I can appreciate that it might
> be more difficult to implement, but avoiding to violate this fundamental
> (kind of) rule might be worth the price (and would avoid other
> complexities, of which there may be lurking more than what you enumerate
> below).

The GPU driver knows how to allocate buffers that are usable by the GPU.
On a discrete GPU, these buffers will generally be in VRAM, rather than
in system RAM, because access to system RAM requires going through the
PCI bus (slow).  However, VRAM is a limited resource, so the driver will
migrate pages between VRAM and system RAM as needed.  During the
migration, a guest that tries to access the pages must block until the
migration is complete.

Some GPU drivers support accessing externally provided memory.  This is
called "userptr", and is supported by i915 and amdgpu.  However, it
appears that some other drivers (such as MSM) do not support it, and
since GPUs with VRAM need to be supported anyway, Xen still needs to
support GPU driver-allocated memory.

I also CCd dri-devel@lists.freedesktop.org and the general GPU driver
maintainers in Linux in case they can give a better answer, as well as
Rob Clark who invented native contexts.

> >  This requires changes to all of the Xen hypervisor, Linux
> > kernel, and userspace device model.
> >=20
> > ### Goals
> >=20
> >  - Allow any userspace pages to be mapped into a guest.
> >  - Support deprivileged operation: this API must not be usable for priv=
ilege escalation.
> >  - Use MMU notifiers to ensure safety with respect to use-after-free.
> >=20
> > ### Hypervisor changes
> >=20
> > There are at least two Xen changes required:
> >=20
> > 1. Add a new flag to IOREQ that means "retry this instruction".
> >=20
> >    An IOREQ server can set this flag after having successfully handled a
> >    page fault.  It is expected that the IOREQ server has successfully
> >    mapped a page into the guest at the location of the fault.
> >    Otherwise, the same fault will likely happen again.
>=20
> Were there any thoughts on how to prevent this becoming an infinite loop?
> I.e. how to (a) guarantee forward progress in the guest and (b) deal with
> misbehaving IOREQ servers?

Guaranteeing forward progress is up to the IOREQ server.  If the IOREQ
server misbehaves, an infinite loop is possible, but the CPU time used
by it should be charged to the IOREQ server, so this isn't a
vulnerability.

> > 2. Add support for `XEN_DOMCTL_memory_mapping` to use system RAM, not
> >    just IOMEM.  Mappings made with `XEN_DOMCTL_memory_mapping` are
> >    guaranteed to be able to be successfully revoked with
> >    `XEN_DOMCTL_memory_mapping`, so all operations that would create
> >    extra references to the mapped memory must be forbidden.  These
> >    include, but may not be limited to:
> >=20
> >    1. Granting the pages to the same or other domains.
> >    2. Mapping into another domain using `XEN_DOMCTL_memory_mapping`.
> >    3. Another domain accessing the pages using the foreign memory APIs,
> >       unless it is privileged over the domain that owns the pages.
>=20
> All of which may call for actually converting the memory to kind-of-MMIO,
> with a means to later convert it back.

Would this support the case where the mapping domain is not fully
priviliged, and where it might be a PV guest?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Gd/4I9Ey0Xn0VJx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZsroUACgkQsoi1X/+c
IsEFXQ//QMybLNE90OiAvTVes1tBRcRaHkgZqnorLYTtL0spBy81VQCcOYtw1M8m
OcWvJrV0xhbCg82ALyiw4IWvPMwqNg17x5S+WAE4pNMhr7zbTzxGYtT/QS2wXeZ3
/MA7AidErZtH6qHuC5uyXvjI7FIh67M7AiSUnjT14sygwB4s9JTc1qqIwBK8DoH9
ll5mWBrh4Dez/Tf+Z5oJptCBv86+jP6/kopJymasvVAV3NFjngm7/mbEOrk41sHp
616ZpooGaNYqUW19ilIsVnW1vgcmL1N9icFIskgSTPrvto2MZynwEzJFhN5NBfBi
HiVrMk2XZUsQX19r0kx2vOh3iWD3ou4WRKOCYaaR7Y96PTKi+uQO1RPo+iUm/DHo
0kkd1om1OgI5fV+qLszMpY93GE+fs3GHn1B/qtGc1SRtqxu6V9Rjoj+wMr40sI6L
k/p9dqQAT+XwbdFupCtTA34pVHUcJKhmckchObddbVrzfsQ+iM+om9jORy5nmose
hcAzXtSap8gwVMjEU/t8zzMeNgcNXQn9nzP2LmSygfHqOLxDrrbeB6KuSUirVRgy
t4GE9zBKy+zU0umR7RJ8zIOPj3PApAmzdIGdzNv7m0vtu5IMiDcbl4N/JzZrkl11
NvufwCaM2kV1/g6JXYNM+46fOgWPUeQFscfiBG3nm8aR8mxpjP4=
=l9yO
-----END PGP SIGNATURE-----

--Gd/4I9Ey0Xn0VJx2--
