Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8C1B42633
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9BC10E164;
	Wed,  3 Sep 2025 16:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fD1tcqbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CBE10E164
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:05:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3c46686d1e6so72780f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756915539; x=1757520339; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yLCSap59X655LjRRdRVDlno90QWSbu9XZF5TPpJulw8=;
 b=fD1tcqbf/QgN4OW9AsZhDbFBKG1SPWHL11pmDVMQCKs74/DFphxyERGlrg3sItKIeO
 ISqekCmyTLNn42MSGv8l+yEYP7MY54zv4eB58SqQNduIvjOihw8E6DgLIJV34NoSqBb1
 mXRADjgb3PYrhZKNAkvljX2YFb7KxCi/lGpSxEoospqPK8i6r5hhkHKzBJDF5daTMcfj
 Y7evAIJ/OVa9G0VYM55YFtPkj84Gs8u8qbxFfyAFQc0R5wZzbL2VIJsKn6iJ/oZZB+hb
 6lmEQjaFKpSqK7GbTHNMxppu47DTCTUYOt3RhLDG8yG8Bz22aao5Sqfe4qGDqvJERctK
 tuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756915539; x=1757520339;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLCSap59X655LjRRdRVDlno90QWSbu9XZF5TPpJulw8=;
 b=skigPhYvpu/yQMKK1u4suVR/10iUmI4rqXlNXqBd6PmU6VUXIL8i3qEOYG39FJA4xX
 ZD3vyzZyROTqu2GLr87+pZK3SKZEEn3l4vAmOlre2+jNl1H0VfYMDzelm7kOMLDbTjXF
 u/+PRyw2PUqvGn3FyNR5RRwyBTUYYW3jgN/BPYXy3uKz9b6HOaygT5778xNTT5VYAwtM
 pxUY+iQbV53qakJaK81YF0Ft7ZqrwvvcqFfJW8lynDIFuCLAW//24fGyy2ZYu5vUvHqc
 Y+8d8iwuUfTVMEuxA/eCmJaFXCaBQmgaMaqj6rYekB3FPLXqtT7JxCK6tmW+kxVHgUii
 I37A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCuliYR+byt9ZSaf/n507IS/YgYI3kCs5DT9p4y7UYZYWWabwjhFGWJgXjz+huyS/tMQYXNDLJFZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI2jyCTFC8eqV4rfYk9ovJdtBLKOAS+xOM54NOJGcmUao4B737
 e2ulFbdFhBqEjziIWCTxH7T17kW+fMMcOb5DtCeYWPr54HUUGA1fVA2H
X-Gm-Gg: ASbGncuISbe2fMyBvjrgBJcykrOmuF60i1cidh6xl2f5BcFpZ02krd51h/Gffac5n/N
 wy9RSf8mL9ZuqkEkiWctjnvsXBe87P34ikXD3HL+Mi+JVWi9FglRohGbLm2JeGxKftLBi4dU2TU
 LVOVp16MDjg7TeZgZfkZ6BTDcyCPzjsQ2hc0se3/vuasmdgZpNDusQjdxq2RdWjz3QPqZe0oyO5
 8I/joD5XtlMi+IlbOr2i4j6M8XtLKHVSUjsNqHw/k/IkcmG+QwPn7sRR1UbDnig13Uhlu3rJLvO
 0kDvLO5swoNrttCiWJ7vQeMT6wa+RAwE8gg0sM9888K46ISoEt0pevlh/ourIeERmOETvY7jeQ4
 +h0wL+sEyzM4lDjjQx4xFkqRFkYma86lZlVXsA7yOzA+I6zLvCQyCtu1JrSI8AQ7vDdrjv8Is/H
 DXlSNIER7Y
X-Google-Smtp-Source: AGHT+IEK8F7kNjGc7W/OtAYN0SPufkeKfdMjFea1WYfcRndMdqBIHchu0H33lCxAbsFDmGMqVedfpQ==
X-Received: by 2002:a05:6000:3111:b0:3db:c7aa:2c4a with SMTP id
 ffacd0b85a97d-3dbc7aa304amr3472709f8f.42.1756915538938; 
 Wed, 03 Sep 2025 09:05:38 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d66b013b7dsm13160799f8f.28.2025.09.03.09.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 09:05:37 -0700 (PDT)
Date: Wed, 3 Sep 2025 18:05:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Frank van der Linden <fvdl@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
Message-ID: <v7zrmrhvemyymq6qamz6wbgzr4cijfe4n76ivwyadmltadlot7@3csy442wfasf>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-4-thierry.reding@gmail.com>
 <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cd2jrjiunyvxx6e3"
Content-Disposition: inline
In-Reply-To: <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
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


--cd2jrjiunyvxx6e3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 10:27:01AM -0700, Frank van der Linden wrote:
> On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > There is no technical reason why there should be a limited number of CMA
> > regions, so extract some code into helpers and use them to create extra
> > functions (cma_create() and cma_free()) that allow creating and freeing,
> > respectively, CMA regions dynamically at runtime.
> >
> > Note that these dynamically created CMA areas are treated specially and
> > do not contribute to the number of total CMA pages so that this count
> > still only applies to the fixed number of CMA areas.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  include/linux/cma.h | 16 ++++++++
> >  mm/cma.c            | 89 ++++++++++++++++++++++++++++++++++-----------
> >  2 files changed, 83 insertions(+), 22 deletions(-)
[...]
> I agree that supporting dynamic CMA areas would be good. However, by
> doing it like this, these CMA areas are invisible to the rest of the
> system. E.g. cma_for_each_area() does not know about them. It seems a
> bit inconsistent that there will now be some areas that are globally
> known, and some that are not.

That was kind of the point of this experiment. When I started on this I
ran into the case where I was running out of predefined CMA areas and as
I went looking for ways on how to fix this, I realized that there's not
much reason to keep a global list of these areas. And even less reason
to limit the number of CMA areas to this predefined list. Very little
code outside of the core CMA code even uses this.

There's one instance of cma_for_each_area() that I don't grok. There's
another early MMU fixup for CMA areas in 32-bit ARM that. Other than
that there's a few places where the total CMA page count is shown for
informational purposes and I don't know how useful that really is
because totalcma_pages doesn't really track how many pages are used for
CMA, but pages that could potentially be used for CMA.

And that's about it.

It seems like there are cases where we might really need to globally
know about some of these areas, specifically ones that are allocated
very early during boot and then used for very specific purposes.

However, it seems to me like CMA is more universally useful than just
for these cases and I don't see the usefulness of tracking these more
generic uses.

> I am being somewhat selfish here, as I have some WIP code that needs
> the global list :-) But I think the inconsistency is a more general
> point than just what I want (and the s390 code does use
> cma_for_each_area()). Maybe you could keep maintaining a global
> structure containing all areas?

If it's really useful to be able to access all CMA areas, then we could
easily just add them all to a global linked list upon activation (we may
still want/need to keep the predefined list around for all those early
allocation cases). That way we'd get the best of both worlds.

> What do you think are the chances of running out of the global count
> of areas?

Well, I did run out of CMA areas during the early VPR testing because I
was initially testing with 16 areas and a different allocation scheme
that turned out to cause too many resizes in common cases.

However, given that the default is 8 on normal systems (20 on NUMA) and
is configurable, it means that even with restricting this to 4 for VPR
doesn't always guarantee that all 4 are available. Again, yes, we could
keep bumping that number, but why not turn this into something a bit
more robust where nobody has to know or care about how many there are?

> Also, you say that "these are treated specially and do not contribute
> to the number of total CMA pages". But, if I'm reading this right, you
> do call cma_activate_area(), which will do
> init_cma_reserved_pageblock() for each pageblock in it. Which adjusts
> the CMA counters for the zone they are in. But your change does not
> adjust totalcma_pages for dynamically created areas. That seems
> inconsistent, too.

I was referring to just totalcma_pages that isn't impacted by these
dynamically allocated regions. This is, again, because I don't see why
that information would be useful. It's a fairly easy change to update
that value, so if people prefer that, I can add that.

I don't see an immediate connection between totalcma_pages and
init_cma_reserved_pageblock(). I thought the latter was primarily useful
for making sure that the CMA pages can be migrated, which is still
critical for this use-case.

Thierry

--cd2jrjiunyvxx6e3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi4Z0wACgkQ3SOs138+
s6HhmA//SMOIdCPTIhm9/2hI6bIiP7AY1j6GdkcEqHRdfrj9+7vySjIRju4hKC3/
YFfr1tCxniYIMxmH+EBUK8bZT3ul0IYLIAO0WA2a8Tc2MypvKL7bvvo4lf+ecbUE
Nsu3LO8MVZQTZ2KFR6mFiXKVi4MTs7XD05csQuvxazvHixU+AueWaKsSwhL1YWmK
yZ14mjJNHFwVJrZ+4Pj4nsmjQw6Qe9D8eZ+d1gXMeTyPg+RJDay+EJBxM7/Vs8Sy
T0m/UudLZIle+EYXBzhlKyHvkFDuUuutaZaYESuiRvts7iwQnhLYaIheHIj9x2gG
VC1vjkFeh4RhbB1srxB71CzyJPKbwJ5oIdvnA1kBeDUlPGuFGm1wM+FygAwoKXvR
HHCF+FaX4H/FeFz0y6z0fkvhfLm+LLuBBuj5KHTCblCLk3cYfVha+Lr4msWjbI4I
51F8NtxQehBsHWv1F2JOguGRE4lv3svHyb3yuQeJC9SPdN12/2gmY85xnm3knlhB
hq9a/y2r622vqFwgPTg5kKhBdjIwWf6tdxefR230K+Qw5ypbrNQQoPhFR/4lG2IX
n/BX8IGEoVCHH7OC3/JfinZyE2td7+xKs/GF81elCfACdkeCRJhL4EWSGVRTI/TP
3OcUwmEbp+Cr0gdYspxD0nxw7bP5SUuAIZRRBEH1KfamNw5DEcE=
=TbFN
-----END PGP SIGNATURE-----

--cd2jrjiunyvxx6e3--
