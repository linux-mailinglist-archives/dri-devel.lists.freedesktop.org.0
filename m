Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD6BEBF45
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65A96F778;
	Fri,  1 Nov 2019 08:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B966F778
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 08:37:03 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j5so6677397lfh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 01:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=xWZs8/fnT/r8gId5pKmcM5RuU5573AIEATKaihBR5SU=;
 b=oQSijOOabZRLtH+oawPDuo+VsMwWCIYs610CS/GII7xWJXkMvTiX+aKmgd5VkHjxfk
 PEJNj1eIwknkfsTe7o/njFlpKJ3KSpRW7HBHItV7KztqxvlwpyByMXQ8SnXpItJFd1CI
 wdCqjSlXw78x0GD7AV5jTeKbOicT4uPzvqH14jPu3N8CSKEjq2Y884gBhHFOUg3IJX9H
 W9X56UpE6j3L7rKEBAMugf7P39wXHINVYG+g+9SSQqcBSUWS+TkMX4uW++TBYWxI1WlY
 QTL6EYnzvfFeiitiHNSXlwfShEJhCXOItRSUms6mcWv25bMCP7wlvxAenTtas0LEiMAk
 fwrg==
X-Gm-Message-State: APjAAAX0rd+JRpCnpc5ZTmM3QYBdDVxUs3OBI88ImAWDzGIYZrAy0hL8
 g+eWwDM6Vua4Bvd+VoNpGSo=
X-Google-Smtp-Source: APXvYqzGB1mB4M1eUDq/Zn4mKH+yMDrbTh1PbJVV5oo/lpe0wlb1E5N4YG6mthyOXySHRgDWSHBQ2w==
X-Received: by 2002:ac2:4a8a:: with SMTP id l10mr6599110lfp.185.1572597421272; 
 Fri, 01 Nov 2019 01:37:01 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z6sm2513554lfa.10.2019.11.01.01.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 01:37:00 -0700 (PDT)
Date: Fri, 1 Nov 2019 10:36:57 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Yiwei Zhang <zzyiwei@google.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
Message-ID: <20191101103657.2107c6e1@eldfell.localdomain>
In-Reply-To: <CAOWid-cy3LWHP5JZK1y_GiO_D1ioH2e4LVN-H4MruPr=dU-u=A@mail.gmail.com>
References: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
 <20191028152602.GA5057@redhat.com>
 <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
 <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <CAOWid-c_5+Z438kHpgn-h9KGt12kzoSD43nRfg0-v10NUKa+tw@mail.gmail.com>
 <CAKT=dD=Jyqn25hrZycQu96pwqcEWepjJFy2yVMyAp2RL42b+Hw@mail.gmail.com>
 <CAOWid-cy3LWHP5JZK1y_GiO_D1ioH2e4LVN-H4MruPr=dU-u=A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=xWZs8/fnT/r8gId5pKmcM5RuU5573AIEATKaihBR5SU=;
 b=Yg2su7VgzGx/xLpDrIltM/UKvK9maa+TqTaahRdjoRiBhmJnwBOR7Pj1M5m41pm583
 FQh3CkmzDEpH87EoQADjC72lycv4W9fDZbbhwJVZ9mV5xRaNv0++mwLTkvphc3fiINFD
 XXL9o1fp/pHpDwDmWYRQm8C777zXfVz+6+N0cfXanE2UNErOBhNIs/+wC2/mXetQjE7l
 XqludqWUV425J9o5TWY46ieuMO74NwpKPaN5x+A98OuBolMHsCmZ0bPCfzkDPYl42khn
 Cqpk3/c9hLeUkXArdWhh7z/33XcDh4hB1kVP6SSbR8t/MG2+nzfrmOJq9gOGRBdeseqU
 6U1Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alistair Delva <adelva@google.com>, Rohan Garg <rohan.garg@collabora.com>,
 Jerome Glisse <jglisse@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Prahlad Kilambi <prahladk@google.com>, Sean Paul <seanpaul@chromium.org>,
 kraxel@redhat.com, Kenny Ho <y2kenny@gmail.com>,
 Chris Forbes <chrisforbes@google.com>, kernel-team@android.com
Content-Type: multipart/mixed; boundary="===============0728738959=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0728738959==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/71_1y_/UebQwU77xs.ZB44P"; protocol="application/pgp-signature"

--Sig_/71_1y_/UebQwU77xs.ZB44P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Oct 2019 13:57:00 -0400
Kenny Ho <y2kenny@gmail.com> wrote:

> Hi Yiwei,
>=20
> This is the latest series:
> https://patchwork.kernel.org/cover/11120371/
>=20
> (I still need to reply some of the feedback.)
>=20
> Regards,
> Kenny
>=20
> On Thu, Oct 31, 2019 at 12:59 PM Yiwei Zhang <zzyiwei@google.com> wrote:
> >
> > Hi Kenny,
> >
> > Thanks for the info. Do you mind forwarding the existing discussion to =
me or have me cc'ed in that thread?
> >
> > Best,
> > Yiwei
> >
> > On Wed, Oct 30, 2019 at 10:23 PM Kenny Ho <y2kenny@gmail.com> wrote: =20
> >>
> >> Hi Yiwei,
> >>
> >> I am not sure if you are aware, there is an ongoing RFC on adding drm
> >> support in cgroup for the purpose of resource tracking.  One of the
> >> resource is GPU memory.  It's not exactly the same as what you are
> >> proposing (it doesn't track API usage, but it tracks the type of GPU
> >> memory from kmd perspective) but perhaps it would be of interest to
> >> you.  There are no consensus on it at this point.

Hi Yiwei,

I'd like to point out an effort to have drivers label BOs for debugging
purposes: https://lists.freedesktop.org/archives/dri-devel/2019-October/239=
727.html

I don't know if it would work, but an obvious idea might be to use
those labels for tracking the kinds of buffers - a piece of UAPI which I
believe you are still missing.


Thanks,
pq

--Sig_/71_1y_/UebQwU77xs.ZB44P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl277qkACgkQI1/ltBGq
qqdasg/+L7AMBuEcOctPh2xN9N7udurjruTsynKBCsvu31KWXg4dAqxHdDe5fWF7
MFqpii0DJ4DMlBSkLi/0WhS9Wdih+nL/pDdwUGFTMMuA/O/mzsbffXJEsvmUO7zK
hc07JvxtqMRHY3j9OQmjwTMUP6gEauc0TFkCKoWmhGCYXxaGp9eLp+jIgUJQDnSY
nIvslAwtQqB3tRUlM4DegGy1+Ne7w/vVXSGmQ/FMVy50zJEhUFwqY8evVKg+3iCd
9LHZSo63LuwOQIuPC8/gZaDhsYfFOBHIiwEFtd2fIerI/kcS7/ZDwTk08Dk5AOj2
QEiv7H+jrIEuuS+MyRgLqoT9gandPQN1dpF6ry9Oh+jciCd+oyDoKbBsgaBo3WvW
wSNHowHbr/+yDnm+Ynm6S9BLohX2viSKHkngx0+mmC7BgKMz2rJfFbcG4tFv0/C1
FG2loZLBw1h+sk1lRHb4B5C1nlcGdylszXFkCKIJirHwcSrBxamuU15ZZQursaOg
TMrpNW/bi6I9QzVUKw+VuG3LF38vHwwxbT9gppwnILm/epp9RAWGy6dhg32Jnj0Q
DFG4EHn1/CosageOlxuHsSoxYHd44WyAxBorpjdLe0X4tQ3/Ur4aS0CyznuAJc1I
uiZUKjK9WISpG6tSPl1xT/F6l40v8D7+ELDNd7xWMdbqBdtSClQ=
=uIbm
-----END PGP SIGNATURE-----

--Sig_/71_1y_/UebQwU77xs.ZB44P--

--===============0728738959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0728738959==--
