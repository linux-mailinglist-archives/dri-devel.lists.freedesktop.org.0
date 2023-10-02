Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854257B50CF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 13:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97DF10E289;
	Mon,  2 Oct 2023 11:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vulcan.natalenko.name (vulcan.natalenko.name [104.207.131.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D9810E289
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 11:03:07 +0000 (UTC)
Received: from spock.localnet (unknown [94.142.239.106])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 581591528A26;
 Mon,  2 Oct 2023 13:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1696244584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ksUEqlapOqMH7Fpkxrstb3/2J4U6ZMZEKSj22Lx69To=;
 b=nXbu0B5U9WFnOcE6otIg3HRZYvOcelja3QsWbQZDPnRutm26R11HBWyp6WFDgLSSBp6nq8
 /1WYQ4la6D+GmuhwIjcj0Srr+SYdZjxRXsBy9bIJ63+42UWzOF+ujcMNfkUXn8syNxz1fB
 TEYUODPJ/yUrGybI4sUlUf5zagzRhsA=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Date: Mon, 02 Oct 2023 13:02:52 +0200
Message-ID: <2300189.ElGaqSPkdT@natalenko.name>
In-Reply-To: <ZRqeoiZ2ayrAR6AV@debian.me>
References: <13360591.uLZWGnKmhe@natalenko.name>
 <2701570.mvXUDI8C0e@natalenko.name> <ZRqeoiZ2ayrAR6AV@debian.me>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4837470.GXAFRqVoOG";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Maxime Ripard <mripard@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart4837470.GXAFRqVoOG
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Date: Mon, 02 Oct 2023 13:02:52 +0200
Message-ID: <2300189.ElGaqSPkdT@natalenko.name>
In-Reply-To: <ZRqeoiZ2ayrAR6AV@debian.me>
MIME-Version: 1.0

/cc Matthew, Andrew (please see below)

On pond=C4=9Bl=C3=AD 2. =C5=99=C3=ADjna 2023 12:42:42 CEST Bagas Sanjaya wr=
ote:
> On Mon, Oct 02, 2023 at 08:20:15AM +0200, Oleksandr Natalenko wrote:
> > Hello.
> >=20
> > On pond=C4=9Bl=C3=AD 2. =C5=99=C3=ADjna 2023 1:45:44 CEST Bagas Sanjaya=
 wrote:
> > > On Sun, Oct 01, 2023 at 06:32:34PM +0200, Oleksandr Natalenko wrote:
> > > > Hello.
> > > >=20
> > > > I've got a VM from a cloud provider, and since v6.5 I observe the f=
ollowing kfence splat in dmesg during boot:
> > > >=20
> > > > ```
> > > > BUG: KFENCE: memory corruption in drm_gem_put_pages+0x186/0x250
> > > >=20
> > > > Corrupted memory at 0x00000000e173a294 [ ! ! ! ! ! ! ! ! ! ! ! ! ! =
! ! ! ] (in kfence-#108):
> > > >  drm_gem_put_pages+0x186/0x250
> > > >  drm_gem_shmem_put_pages_locked+0x43/0xc0
> > > >  drm_gem_shmem_object_vunmap+0x83/0xe0
> > > >  drm_gem_vunmap_unlocked+0x46/0xb0
> > > >  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
> > > >  drm_fb_helper_damage_work+0x96/0x170
> > > >  process_one_work+0x254/0x470
> > > >  worker_thread+0x55/0x4f0
> > > >  kthread+0xe8/0x120
> > > >  ret_from_fork+0x34/0x50
> > > >  ret_from_fork_asm+0x1b/0x30
> > > >=20
> > > > kfence-#108: 0x00000000cda343af-0x00000000aec2c095, size=3D3072, ca=
che=3Dkmalloc-4k
> > > >=20
> > > > allocated by task 51 on cpu 0 at 14.668667s:
> > > >  drm_gem_get_pages+0x94/0x2b0
> > > >  drm_gem_shmem_get_pages+0x5d/0x110
> > > >  drm_gem_shmem_object_vmap+0xc4/0x1e0
> > > >  drm_gem_vmap_unlocked+0x3c/0x70
> > > >  drm_client_buffer_vmap+0x23/0x50
> > > >  drm_fbdev_generic_helper_fb_dirty+0xae/0x310
> > > >  drm_fb_helper_damage_work+0x96/0x170
> > > >  process_one_work+0x254/0x470
> > > >  worker_thread+0x55/0x4f0
> > > >  kthread+0xe8/0x120
> > > >  ret_from_fork+0x34/0x50
> > > >  ret_from_fork_asm+0x1b/0x30
> > > >=20
> > > > freed by task 51 on cpu 0 at 14.668697s:
> > > >  drm_gem_put_pages+0x186/0x250
> > > >  drm_gem_shmem_put_pages_locked+0x43/0xc0
> > > >  drm_gem_shmem_object_vunmap+0x83/0xe0
> > > >  drm_gem_vunmap_unlocked+0x46/0xb0
> > > >  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
> > > >  drm_fb_helper_damage_work+0x96/0x170
> > > >  process_one_work+0x254/0x470
> > > >  worker_thread+0x55/0x4f0
> > > >  kthread+0xe8/0x120
> > > >  ret_from_fork+0x34/0x50
> > > >  ret_from_fork_asm+0x1b/0x30
> > > >=20
> > > > CPU: 0 PID: 51 Comm: kworker/0:2 Not tainted 6.5.0-pf4 #1 8b557a417=
3114d86eef7240f7a080080cfc4617e
> > > > Hardware name: Red Hat KVM, BIOS 1.11.0-2.el7 04/01/2014
> > > > Workqueue: events drm_fb_helper_damage_work
> > > > ```
> > > >=20
> > > > This repeats a couple of times and then stops.
> > > >=20
> > > > Currently, I'm running v6.5.5. So far, there's no impact on how VM =
functions for me.
> > > >=20
> > > > The VGA adapter is as follows: 00:02.0 VGA compatible controller: C=
irrus Logic GD 5446
> > > >=20
> > >=20
> > > Do you have this issue on v6.4?
> >=20
> > No, I did not have this issue with v6.4.
> >=20
>=20
> Then proceed with kernel bisection. You can refer to
> Documentation/admin-guide/bug-bisect.rst in the kernel sources for the
> process.

Matthew, before I start dancing around, do you think ^^ could have the same=
 cause as 0b62af28f249b9c4036a05acfb053058dc02e2e2 which got fixed by 863a8=
eb3f27098b42772f668e3977ff4cae10b04?

In the git log between v6.4 and v6.5 I see this:

```
commit 3291e09a463870610b8227f32b16b19a587edf33
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Wed Jun 21 17:45:49 2023 +0100

drm: convert drm_gem_put_pages() to use a folio_batch

Remove a few hidden compound_head() calls by converting the returned page
to a folio once and using the folio APIs.
```

Thanks.

=2D-=20
Oleksandr Natalenko (post-factum)
--nextPart4837470.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmUao1wACgkQil/iNcg8
M0s3dg/8CO8fmsx9fjX8gK4rbe7C3aYWo6KhaJzggfPgPFgo5PQOrus8j3SbGlan
iSoJjWDouEEpQsp/ftMc1vlT1zdNOIVp8j/1wM/SL+PG3LeY5Ne2DCnV4Z+UB9aB
sugKZfA7I+//+gt+3AxD6zv/M95+rYG2bXIDxauNP8Zus+Pngs3u+bx2XU5Bmr0v
ed5pLuWCkY9KTa/BXv6Gl8j8prDr+5DynpvxwhLLF+qt/0yQRgNnvO9s7alC3t7p
H6q0EFFm2GcWqsznsUtzuDjywpekUOrFqUZO9uBWDXNmT5jts2w6RwINj4fgvwvd
I5em4uumMTGcvAQcAmYxB1apft6azpTpCTO908QvKE1tnL+TZtWIsul8pYslm58f
oOfyq2C7u0szwMByqQ+Sw0w6sLbd9za+4J/dn5tIk6kTsX/0Y7MCAV7LYz1T5yLf
XkRN8k/Dw5cUD6pBRUoAtMipeZng+VIifDLM+qDYVak3xUKb6NQ7hONni6q34Hvs
ph3FijRzIqpnRzneEGU/j8BpGvk7bH3ILo7oSfuAVv0mwPANgMszdIBQEWE8BQrG
9vjqepw5SOVl2TADXsLRiH99MLJTlx0u5UX1rc4Gwzq84H07JwLuvf2UOk3xJDn1
BbgVDW5QMh00GYz/DYpI3zf2R1u+lhtMnmp25uex9np0sqfac8k=
=QDDU
-----END PGP SIGNATURE-----

--nextPart4837470.GXAFRqVoOG--



