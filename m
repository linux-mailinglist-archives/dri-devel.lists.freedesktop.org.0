Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8467A6615
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 16:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CC410E11F;
	Tue, 19 Sep 2023 14:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5C410E11F;
 Tue, 19 Sep 2023 14:03:09 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bf7a6509deso42043005ad.3; 
 Tue, 19 Sep 2023 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695132188; x=1695736988; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PYn4vYjqybxZ2CzfvZ1C7yMXEKjRphlK8G76dbCmVAc=;
 b=IiKFPtEUaQ4C0meJN3bGGdbsTvzXwdNb9jfe4dc1HaQ/XMJ8DgyUGIK1qEEStBT4i1
 73P334dGpdWzbwbgqbZ5rw3Ag5SiGOp+YAU9vMbvDqVA+ceqlSnE2hFNS1Bc23ysLWqT
 wohQwpOqyToPvRrlAPhXz9UHbgLtzIE9YVWTyXQ7AdCo18soxDeXaAjKqPieWB2Qb1Kv
 xXqUDZtUa6/wPDXzTbXwMvXplWc+aVfxHHXgkQX/QU6nqgYK0S1fC8YP9I7ZbN1K/9vY
 SewMti6//arnEGG5Si9F2kd3eM3s3yWMWOYazL5NsJ0zhSsa8sa222jN5yqOTsQAuLYm
 eWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695132188; x=1695736988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYn4vYjqybxZ2CzfvZ1C7yMXEKjRphlK8G76dbCmVAc=;
 b=kWvOn04Y+DSIS8NH2MgGZUhCTVFJnifYecSEu4m4l36HZIl4d2G0mKJT3/eBastrVF
 WQnttIiNRHVzF9WlBU1sA6ffco7djh7swi+cTTYwzC/W3iMy1+D3JIk364nrGFbNWur2
 9evByWttrH5hTZGegZG8JkdrSD78ktPKJ5MIfgjijbbBYzi+83LBG/D3XLlIcR96YUgE
 XamChJTBE6ORbe7JN7UFREvL5iTYzHwmo1EPwZNRy7NIyoS5ccADVjl9sWfq2Yw0HyG3
 MPBQwOx5lRjcShIMv78YyCNWjB5Iv5RrxInVAelWc0WJKuoEa1+a71c4i/sT2gYAyv+2
 jhLw==
X-Gm-Message-State: AOJu0YwfLxXijCvRbhl7S2SYP2Q+qOS1fxMzS1hUBHlFzQxcV1zMss4T
 MPc6Bc0GcgYx2vO5dryojz4=
X-Google-Smtp-Source: AGHT+IGwwKUALeHqOp8CRjZ7BjDjcFcSYhkLiMtNnowNteilCqrInFdFlEZiMXIIUrM2Bcc35bHHPg==
X-Received: by 2002:a17:902:e5c4:b0:1c5:82bb:223e with SMTP id
 u4-20020a170902e5c400b001c582bb223emr3883918plf.67.1695132188320; 
 Tue, 19 Sep 2023 07:03:08 -0700 (PDT)
Received: from debian.me ([103.124.138.83]) by smtp.gmail.com with ESMTPSA id
 z12-20020a170903018c00b001beef2c9bffsm10062609plg.85.2023.09.19.07.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 07:03:07 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id CCEAD81A82C8; Tue, 19 Sep 2023 21:03:03 +0700 (WIB)
Date: Tue, 19 Sep 2023 21:03:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Intel-gfx] [REGRESSION] [BISECTED] Panic in
 gen8_ggtt_insert_entries() with v6.5
Message-ID: <ZQmqF7oyrZ32Qdhb@debian.me>
References: <4857570.31r3eYUQgx@natalenko.name>
 <6287208.lOV4Wx5bFT@natalenko.name>
 <2612319.ElGaqSPkdT@natalenko.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qr0otETeDhzUuptw"
Content-Disposition: inline
In-Reply-To: <2612319.ElGaqSPkdT@natalenko.name>
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Linux Regressions <regressions@lists.linux.dev>,
 Matt Roper <matthew.d.roper@intel.com>,
 Linux Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Nathan Chancellor <nathan@kernel.org>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qr0otETeDhzUuptw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 03:23:28PM +0200, Oleksandr Natalenko wrote:
> /cc Bagas as well (see below).
>=20
> On =C3=BAter=C3=BD 19. z=C3=A1=C5=99=C3=AD 2023 10:26:42 CEST Oleksandr N=
atalenko wrote:
> > /cc Matthew Wilcox and Andrew Morton because of folios (please see belo=
w).
> >=20
> > On sobota 2. z=C3=A1=C5=99=C3=AD 2023 18:14:12 CEST Oleksandr Natalenko=
 wrote:
> > > Hello.
> > >=20
> > > Since v6.5 kernel the following HW:
> > >=20
> > > * Lenovo T460s laptop with Skylake GT2 [HD Graphics 520] (rev 07)
> > > * Lenovo T490s laptop with WhiskeyLake-U GT2 [UHD Graphics 620] (rev =
02)
> > >=20
> > > is affected by the following crash once KDE on either X11 or Wayland =
is started:
> > >=20
> > > i915 0000:00:02.0: enabling device (0006 -> 0007)
> > > i915 0000:00:02.0: vgaarb: deactivate vga console
> > > i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=3Dio+mem,d=
ecodes=3Dio+mem:owns=3Dmem
> > > i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/skl_dmc_v=
er1_27.bin (v1.27)
> > > [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 1
> > > fbcon: i915drmfb (fb0) is primary device
> > > i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
> > > =E2=80=A6
> > > memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3D674 'kwin_=
wayland'
> > > BUG: unable to handle page fault for address: ffffb422c2800000
> > > #PF: supervisor write access in kernel mode
> > > #PF: error_code(0x0002) - not-present page
> > > PGD 100000067 P4D 100000067 PUD 1001df067 PMD 10d1cf067 PTE 0
> > > Oops: 0002 [#1] PREEMPT SMP PTI
> > > CPU: 1 PID: 674 Comm: kwin_wayland Not tainted 6.5.0-pf1 #1 a6c58ff41=
a7b8bb16a19f5af9e0e9bce20f9f38d
> > > Hardware name: LENOVO 20FAS2BM0F/20FAS2BM0F, BIOS N1CET90W (1.58 ) 11=
/15/2022
> > > RIP: 0010:gen8_ggtt_insert_entries+0xc2/0x140 [i915]
> > > =E2=80=A6
> > > Call Trace:
> > >  <TASK>
> > >  intel_ggtt_bind_vma+0x3e/0x60 [i915 a83fdc6539431252dba13053979a8b68=
0af86836]
> > >  i915_vma_bind+0x216/0x4b0 [i915 a83fdc6539431252dba13053979a8b680af8=
6836]
> > >  i915_vma_pin_ww+0x405/0xa80 [i915 a83fdc6539431252dba13053979a8b680a=
f86836]
> > >  __i915_ggtt_pin+0x5a/0x130 [i915 a83fdc6539431252dba13053979a8b680af=
86836]
> > >  i915_ggtt_pin+0x78/0x1f0 [i915 a83fdc6539431252dba13053979a8b680af86=
836]
> > >  __intel_context_do_pin_ww+0x312/0x700 [i915 a83fdc6539431252dba13053=
979a8b680af86836]
> > >  i915_gem_do_execbuffer+0xfc6/0x2720 [i915 a83fdc6539431252dba1305397=
9a8b680af86836]
> > >  i915_gem_execbuffer2_ioctl+0x111/0x260 [i915 a83fdc6539431252dba1305=
3979a8b680af86836]
> > >  drm_ioctl_kernel+0xca/0x170
> > >  drm_ioctl+0x30f/0x580
> > >  __x64_sys_ioctl+0x94/0xd0
> > >  do_syscall_64+0x5d/0x90
> > >  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> > > =E2=80=A6
> > > note: kwin_wayland[674] exited with irqs disabled
> > >=20
> > > RIP seems to translate into this:
> > >=20
> > > $ scripts/faddr2line drivers/gpu/drm/i915/gt/intel_ggtt.o gen8_ggtt_i=
nsert_entries+0xc2
> > > gen8_ggtt_insert_entries+0xc2/0x150:
> > > writeq at /home/pf/work/devel/own/pf-kernel/linux/./arch/x86/include/=
asm/io.h:99
> > > (inlined by) gen8_set_pte at /home/pf/work/devel/own/pf-kernel/linux/=
drivers/gpu/drm/i915/gt/intel_ggtt.c:257
> > > (inlined by) gen8_ggtt_insert_entries at /home/pf/work/devel/own/pf-k=
ernel/linux/drivers/gpu/drm/i915/gt/intel_ggtt.c:300
> > >=20
> > > Probably, recent PTE-related changes are relevant:
> > >=20
> > > $ git log --oneline --no-merges v6.4..v6.5 -- drivers/gpu/drm/i915/gt=
/intel_ggtt.c
> > > 3532e75dfadcf drm/i915/uc: perma-pin firmwares
> > > 4722e2ebe6f21 drm/i915/gt: Fix second parameter type of pre-gen8 pte_=
encode callbacks
> > > 9275277d53248 drm/i915: use pat_index instead of cache_level
> > > 5e352e32aec23 drm/i915: preparation for using PAT index
> > > 341ad0e8e2542 drm/i915/mtl: Add PTE encode function
> > >=20
> > > Also note Lenovo T14s laptop with TigerLake-LP GT2 [Iris Xe Graphics]=
 (rev 01) is not affected by this issue.
> > >=20
> > > Full dmesg with DRM debug enabled is available in the bugreport I've =
reported earlier [1]. I'm sending this email to make the issue more visible.
> > >=20
> > > Please help.
> > >=20
> > > Thanks.
> > >=20
> > > [1] https://gitlab.freedesktop.org/drm/intel/-/issues/9256
> >=20
> > Matthew,
> >=20
> > Andrzej asked me to try to revert commits 0b62af28f249, e0b72c14d8dc an=
d 1e0877d58b1e, and reverting those fixed the i915 crash for me. The e0b72c=
14d8dc and 1e0877d58b1e commits look like just prerequisites, so I assume 0=
b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch") is=
 the culprit here.
> >=20
> > Could you please check this?
> >=20
> > Our conversation with Andrzej is available at drm-intel GitLab [1].
> >=20
> > Thanks.
> >=20
> > [1] https://gitlab.freedesktop.org/drm/intel/-/issues/9256
>=20
> Bagas,
>=20
> would you mind adding this to the regression tracker please?
>=20

Will add shortly, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--qr0otETeDhzUuptw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQmqAgAKCRD2uYlJVVFO
ow2JAP0edcVoa2ibxwmEKL50V95Q+tuCyFU5b9EKHD4pXbLNgQD+PIaHonsixovR
szsV8iCL4IaV/XCjda0iGXeUtnR3XgM=
=rxM3
-----END PGP SIGNATURE-----

--qr0otETeDhzUuptw--
