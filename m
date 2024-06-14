Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BDF9090A1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868BA10EDE3;
	Fri, 14 Jun 2024 16:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="hWjBWfze";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="HJywb6KP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 308 seconds by postgrey-1.36 at gabe;
 Fri, 14 Jun 2024 16:41:09 UTC
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9096310EDE3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:41:09 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.nyi.internal (Postfix) with ESMTP id 9145713800F0;
 Fri, 14 Jun 2024 12:36:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 14 Jun 2024 12:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1718382960;
 x=1718469360; bh=PkGApFBREGuRhO/9Y9dLO5PAQtVTrhTya74KjowbegM=; b=
 hWjBWfze7ZPRdSjSrq7pFRjtWlaJYTJ7GJp/dXoltDmLNkrPtGwMssdB82X3O2QR
 sQo+JuHXWhcJQ+f82Asm9O/GB6Cgthe+OCxndfxoKuUz0iEA/u9o8GGlehEGE+ch
 qze8akGXTlK+J9ifFJcxU6DXHYw6WfQ05D5eHsHi7lEcFcnDhiGpimdKDV1sHm8p
 KeND1jeRNzBmxsXiAEkPlAhJXDwudnQNnxGcbfKVvZI82owt0KZ3zvsmu30N2mcG
 jBOImjJa2Kj97ndvWMXXLtakLrjHAlisYBl7dfbmFFdaX1pCnOlHTr2cjnfHT83f
 55JKSWcQ+apNMHSp1q0wMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1718382960; x=1718469360; bh=PkGApFBREGuRhO/9Y9dLO5PAQtVT
 rhTya74KjowbegM=; b=HJywb6KPyTz3qQccZCJwa6LME0lEq95DRMR+bL5o6MXC
 Qbo/ElcAAVj0+JwptM14acNb3RyXVTkjKsgLEGrcLb0lJa+IFtDDxyYsktFE6P/I
 sRBimxfSjcmhzEgJiKU91W0r+yNMhmBgxQEWn1OoilbQJECHfFo43nFgwERvBgyN
 RCCS7ez5fvkOkpj5MwknJEet7DuRE3wK0dK2w2i05GRl/U+lKCDZgQgeZzACuAQ0
 myt01EOwdYBRSEjYtQNdkcGzpTShaVcWcaQkDB2KnrvbUx4V1R7Jht3HahNQqmpx
 Z9Z7RTY6R/jMk8uzBxogcviw8TagUUHqPJMXXaes6Q==
X-ME-Sender: <xms:cHFsZoqpJwrVSzhtQ5eQjFNjX9ksLW3AOfZqlZw28I00xew8nBydjA>
 <xme:cHFsZupHYzTaezVUWTgzIqu27fMVsdq9KLMl3M_eIU55igpkLp4vjvLdJpD75leMH
 r7ryGA_ukcICNE>
X-ME-Received: <xmr:cHFsZtMy-q9mEwd-bpeqSJJzTH5plx_Lk3EeBGMYzo50DqzkRrcyRorZ-wHI9ezqdMdo63Jz2QhFXSH0kAPhEbe1nzPLVDNCH6G7c5oq3LBhKIIe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
 ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
 hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffej
 geejgeffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
 shhlrggsrdgtohhm
X-ME-Proxy: <xmx:cHFsZv6hmNADnkOYJqpzqHvltPEtuFlBN8jr_kD5AUUsAooV9MxVYQ>
 <xmx:cHFsZn7x8sgmL-1N5WunEIqYlCwzucsQBEcABTYjCobNT1es0gNxBA>
 <xmx:cHFsZviidjkl_3EY8KybBy9JOLte9j2yukHKQ49ToNfj6LEv1ObFOQ>
 <xmx:cHFsZh7FK81y7YiZ24ABDQghFCcdi-xGMlNiYtQObzBb_bkDsDQ9zw>
 <xmx:cHFsZht2NwJrYdetW_vRHdRn8ywcJYo5qB3vhrw-R-BtKh9xuwC4Ydp5>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 12:35:59 -0400 (EDT)
Date: Fri, 14 Jun 2024 12:35:56 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <Zmxxbk-xWp9AjqIB@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="D2GztDBVOaciOnPi"
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


--D2GztDBVOaciOnPi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Jun 2024 12:35:56 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>
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

My understanding is:

- Discrete GPUs require the memory to be VRAM, rather than system RAM.
- Various APIs require dmabufs.  Xen's support for dmabufs doesn't work
  with PV dom0.
- The existing virtio-GPU protocol (which is not Xen-specific and so
  gets more testing and has broader support than anything that _is_
  Xen-specific) requires backend allocation for native contexts.
- There might be other issues (caching?  memory management?) involved.

I'm CCing dri-devel in hopes of getting a better response.

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

> Jan
>=20
> >    Open question: what if the other domain goes away?  Ideally,
> >    unmapping would (vacuously) succeed in this case.  Qubes OS doesn't
> >    care about domid reuse but others might.
> >=20
> > ### Kernel changes
> >=20
> > Linux will add support for mapping userspace memory into an emulated PCI
> > BAR.  This requires Linux to automatically revoke access when needed.
> >=20
> > There will be an IOREQ server that handles page faults.  The discussion
> > assumed that this handling will happen in kernel mode, but if handling
> > in user mode is simpler that is also an option.
> >=20
> > There is no async #PF in Xen (yet), so the entire vCPU will be blocked
> > while the fault is handled.  This is not great for performance, but
> > correctness comes first.
> >=20
> > There will be a new kernel ioctl to perform the mapping.  A possible C
> > prototype (presented at design session, but not discussed there):
> >=20
> >     struct xen_linux_register_memory {
> >         uint64_t pointer;
> >         uint64_t size;
> >         uint64_t gpa;
> >         uint32_t id;
> >         uint32_t guest_domid;
> >     };
>=20

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


--D2GztDBVOaciOnPi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZscW4ACgkQsoi1X/+c
IsHvCBAAl+tCh1f7kjd+HLnREQzv/rbTzudePwPEuBqtMR3KXAx5hNihrkiI+uFx
4p1SCa+DoxK1WhT0WZ3zUzD8QGN5vSaFgrdhL5mZz3X12bQGDPoTdyRsUQyW+Ne4
rH/l5iNU+dDDTQE6bzao24FOvLmk/ySxP2ZC2ZsPHg6O2HqUYk8E4Y6VI/bTQRdx
PWIaSC8RXxjmwxPFlod6fIqsOjO7fO1vAOYdeh/vhvZhJEvvygMpQk601Z45rnoA
Ubv8lfLcg8ldC478UmBGldogFLMWmEH1QSPmff4z3n1fcH1VEIdURYEZTXoHmuuV
x53oozzajM/fD4cPyFFmrj1xMJJi4RTudqZJhkyI2QSSMGPpOr+4lzolkAw/LkkD
IyvyvLdbAt/fT74939OXDY0IXhfDKebxWUWbnmcajkesOK7nIuF69kKHEgAClOHe
TLOqZLDQ29eDxffTJfOJvQsbZB879AB6OVbATnbi0RGxCLrzmfepf6jiw+EJeY2D
uQu3hOydVh6uDTx9z/1u9Qv1uwlzHpJGVKIeQnMPS5EZt4a2rbKUDz8ZWZDCVQnt
gFlhomfPUoWzM5XfgEkH0VXuzaJWM2BwhXGd2EuJEvizDCe8uTvLr4KoizoANzJQ
ARcvfsR9Y3GIMwKlKTjNC8Z/7oeSh83fKFNIf+MU11AjSCtcEbY=
=dfeY
-----END PGP SIGNATURE-----

--D2GztDBVOaciOnPi--
