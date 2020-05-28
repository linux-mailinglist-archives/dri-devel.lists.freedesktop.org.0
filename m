Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C0F1E6086
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 14:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEC4899B7;
	Thu, 28 May 2020 12:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C18899B7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:13:14 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z13so23393463ljn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=r4LHdRLCJvJwBdLw8weBqnKkfBYAQMvc7SO3ADrUECY=;
 b=Cm2ZyhWEl49lFVgLJgZJUMCul8dhP45ccvmt1Do2BLJnlbWinYYIq8ydGrzHNawceo
 eGK2ZBKNiG6ZDDB2YFokGC14z0rm0nEwiMWVYhJuTbOoP/yM1Xx1N7wN457ukRiRm1yH
 CeQXlVSlKFbQRF/CaQwVmjqteCyCnKFhhjG9y01E9R1Y0UikGZonlqirddl4yX/YH+At
 fvlqixI0XkkpDA8celZdcReoNWkH4ZORoLf8TKEzQ+18u+i+em4Of8b42iGwAVtreJLS
 nA+iHM/kMiurS6Wfg9LwvYSUB/1B+RtNr+x/b0REo3AYuUITN7Hr/uTLPnE22TfL4qs3
 6W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=r4LHdRLCJvJwBdLw8weBqnKkfBYAQMvc7SO3ADrUECY=;
 b=j++af3yzM6GUl7EbVy2Rgd2FW3B+NkjE/n646XckSUep0kZfTOQfIN0qPdbihZ72xq
 8tUsmlMsPPVvP0llVzBFMOhfKUmi5suSKjuxAMkaaOE8RFK9AN0zjRA+zqYSbUBb6ppj
 rSkxK5seEFkbxKGA/rtGY8CZSwVSUs1AOVZM4aYAE9BCHnal3vtQdv3HdJXoQpRHo0md
 Uo2X3rOvtIV7S1w3wMYtQXkdU90F/s87ztURwD3xu5WIp3+gLPLHIYmnVKDKI9FUEi68
 7Z6i6FEVx99D6AkRtuvBz5Du8sFaiDgH8QxH3DI8ybzwJUFmf5h3tjX6v7rn+JpG9Ncr
 jxog==
X-Gm-Message-State: AOAM532Rv3IXMlR1ZqaqMSDrTWgtSjdfBfCuWHVcqPaeC7udMSrcazOI
 wTzPm7CqhmgTZNQxtJLBcw0=
X-Google-Smtp-Source: ABdhPJw7hMX8IhuXsVjw/Z5gjovX16xvSYAWd+lFgKqMG+dev/VKnlsvTs5SsyT//7G1cGS2eHiMcw==
X-Received: by 2002:a2e:a58a:: with SMTP id m10mr1337191ljp.346.1590667993032; 
 Thu, 28 May 2020 05:13:13 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q26sm1407662ljc.41.2020.05.28.05.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:13:12 -0700 (PDT)
Date: Thu, 28 May 2020 15:13:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200528151302.7f4509ae@eldfell.localdomain>
In-Reply-To: <CAKMK7uHf11TAvunaWyH7=JdNOUO3KJ9pXOsFX0Kur1wOPVQS4w@mail.gmail.com>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <db6e57bd-a5c0-f156-93ca-80828d98064e@amd.com>
 <20200527094428.4b4a7ca6@eldfell.localdomain>
 <63d2e957-ae79-8c70-29c9-fd53a7de92cf@amd.com>
 <CAKMK7uGHrPfAeN-PVZ5ixf7hSGj-RatTebt-nR5pTsykWOMkAw@mail.gmail.com>
 <c7c207ab-97bf-d153-0cb7-9e39c51c0045@amd.com>
 <44696a76-4a33-a19f-7e11-dd431e1703e6@amd.com>
 <CAKMK7uHf11TAvunaWyH7=JdNOUO3KJ9pXOsFX0Kur1wOPVQS4w@mail.gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0107594645=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0107594645==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/c4nfd=YRzdl_ds_hVj+ODyU"; protocol="application/pgp-signature"

--Sig_/c4nfd=YRzdl_ds_hVj+ODyU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 27 May 2020 22:25:00 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, May 27, 2020 at 9:44 PM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 27.05.20 um 17:23 schrieb Andrey Grodzovsky: =20
> > >
> > > On 5/27/20 10:39 AM, Daniel Vetter wrote: =20
> > >> On Wed, May 27, 2020 at 3:51 PM Andrey Grodzovsky
> > >> <Andrey.Grodzovsky@amd.com> wrote: =20
> > >>>
> > >>> On 5/27/20 2:44 AM, Pekka Paalanen wrote: =20
> > >>>> On Tue, 26 May 2020 10:30:20 -0400
> > >>>> Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:
> > >>>> =20
> > >>>>> On 5/19/20 6:06 AM, Pekka Paalanen wrote: =20
> > >>>>>> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > >>>>>>
> > >>>>>> Set up the expectations on how hot-unplugging a DRM device should
> > >>>>>> look like to
> > >>>>>> userspace.
> > >>>>>>
> > >>>>>> Written by Daniel Vetter's request and largely based on his
> > >>>>>> comments in IRC and
> > >>>>>> from
> > >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.html&a=
mp;data=3D02%7C01%7CAndrey.Grodzovsky%40amd.com%7C3c671803b2ba41b2ceac08d80=
24bcc9a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637261871869742519&amp=
;sdata=3DZnhylRubOM0%2BjoreSSYMqVDzZuUdybEsoyBVcTKgxWE%3D&amp;reserved=3D0
> > >>>>>> .
> > >>>>>>
> > >>>>>> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > >>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> > >>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > >>>>>> Cc: Dave Airlie <airlied@redhat.com>
> > >>>>>> Cc: Sean Paul <sean@poorly.run>
> > >>>>>>
> > >>>>>> ---
> > >>>>>>
> > >>>>>> Disclaimer: I am a userspace developer writing for other
> > >>>>>> userspace developers.
> > >>>>>> I took some liberties in defining what should happen without
> > >>>>>> knowing what is
> > >>>>>> actually possible or what existing drivers already implement.
> > >>>>>> ---
> > >>>>>>     Documentation/gpu/drm-uapi.rst | 75
> > >>>>>> ++++++++++++++++++++++++++++++++++
> > >>>>>>     1 file changed, 75 insertions(+)

...

> > >>> Next related question is more for Daniel/Christian - about the
> > >>> implementation of this paragraph, I was thinking about something li=
ke
> > >>> checking for device disconnect in ttm_bo_vm_fault_reserved and if so
> > >>> remap the entire VA range for the VMA where the fault address
> > >>> belongs to
> > >>> the global zero page (i.e. (remap_pfn_range(vma, vma->vm_start,
> > >>> page_to_pfn(ZERO_PAGE(vma->vm_start), vma->vm_end - vma->vm_start,
> > >>> vma->vm_page_prot)). Question is, when the doc says 'writes are
> > >>> ignored'
> > >>> does it mean i should use copy on write for the vma->vm_page_prot
> > >>> and if
> > >>> so how i actually do it as i was not able to find what flags to set
> > >>> into
> > >>> vm_page_prot to force copy on write behavior. =20
> > >> Already discussed this with Pekka on irc, I think simply a private
> > >> page (per gpu ctx to avoid leaks) is good enough. Otherwise we need =
to
> > >> catch write faults and throw the writes away, and that's a) a bit
> > >> tricky to implement and b) slow, which we kinda don't want to. If the
> > >> desktop is stuck for a few seconds because we're trapping every write
> > >> of a 4k buffer that's getting uploaded, the user is going to have a
> > >> bad time :-/
> > >> -Daniel =20
> > >
> > >
> > > So like allocating a page per process context in the driver (struct
> > > amdgpu_ctx in amdgpu) and mapping this page into the faulting VMAs
> > > for when device is disconnected ? I am still not clear how i make the
> > > mapping ignore writes without catching write faults and ignoring them.
> > > I cannot just make it read only obviously and i can't make it writable
> > > as then reading back will start returning non 0's. My question is what
> > > set of flags in vm_area_struct.vm_flags can (if at all) give me
> > > 'ignore writes' behavior for the mapping of that page. =20
> >
> > I'm not aware of a possibility like that on x86 CPUs. As far as I know
> > we only have something like an ignore write functionality on our GPUs
> > for PRTs.
> >
> > Could we use an address which points to a non allocated MMIO space or
> > something like this? We would might get 0xffffffff on reads instead of
> > 0x0, but writes would be certainly ignored. =20
>=20
> I think just a page with garbage in, garbage out semantics is going to
> be ok. I think pretty much anything has a chance to upset userspace,
> so whether it's 0 or all 1s or anything else doesn't really matter.
>=20
> Only thing that does matter a bit is that we have a page per fd, so
> that we don't accidentally leak something between processes where we
> shouldn't. I think as long as we don't crash&burn in a SIGBUS it's
> good enough.

Hi,

the v2 I sent on Monday already changed the wording to have undefined
reads/writes instead of read zero / ignore write. v3 is coming.


Thanks,
pq

--Sig_/c4nfd=YRzdl_ds_hVj+ODyU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7Pqs8ACgkQI1/ltBGq
qqe+HQ/8CjJnw/LR6aNtm7AH+BQoy5FZEKbYJGZEPWqtYn8NuRp76sazAEttFIaf
hRB4P/WPCn+B0xhhmSLyaOTYj7pvw1LZcm8nxP4NK7o0Q8adxpWGkynBxYXC8nIw
u/huNj0BHxuBVPVjVrdpSr9iiy3GZCy6xt+uiuZDQ+3upUENlQFK3i7T7pHeovvy
MhQGV63vrtfB3V9mWUgl9NcCPUs0ZaguozZA3zYS0sq+mOcWRedlovQk25hixIXO
c/flyonZ0Z5DeDi5tbcZlsKxH5RqChUTIuSzXkjUD5SDHCoIW8OcQCwty47onVJR
YO/9ZDOIY/FS1i8YdGSjJ282L7cf/sMp4c0bAo+fdF1XCyjFVKjv4SHNTCOrEuUQ
V5UZhqh4wlccczSKfqNHKS+piSrUhE08jh7i+pu/HDkpP2hhzhwYWriZHvP++meR
gs+RZ3XpDomtFRn3JxvmbRp0dcO3Qxefdxk3ecyWqyc4MrBAjrN78ZzUcZpz9X8N
5yFA+7oadCQ9JTbtynzlnr61urHAPd+Q+RWbpdfaTdIdrmCqa/XKNZhFvuCtD6QF
xW8ct19Fg8fGEBuSvxU5zqZlLRd/4Cc/5HxbqeSYmLiBuq4F5edrfzAMfHU2abS6
7gPQhWoUfSUwz1Y5ObGDvdq3Cb/vB7ZqEw29fLES2xYtqDp3WJE=
=8SKe
-----END PGP SIGNATURE-----

--Sig_/c4nfd=YRzdl_ds_hVj+ODyU--

--===============0107594645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0107594645==--
