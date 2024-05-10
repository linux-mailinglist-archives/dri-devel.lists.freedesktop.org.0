Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3448C23BD
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 13:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C415610E990;
	Fri, 10 May 2024 11:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tcF4nxlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA27010E39B;
 Fri, 10 May 2024 11:39:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B24F1CE1DA6;
 Fri, 10 May 2024 11:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD37EC113CC;
 Fri, 10 May 2024 11:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715341160;
 bh=gBgODkg3DdI9NzHPa1K7qm2JszTbSglDjzlA/h4YKWM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tcF4nxlg0QDEweWZwzWRCeVMhoRIu7J1gmdn73ynftzzX5dbSA1P4W8ujpGv0+jrm
 nbOzvPAqUbgaOYo/PdyUL81APw3bP5ZqUlEA1bv2v06ThVSZ+1EGMPEOkJGIiyfYGJ
 kCkxZxWZtBeI1+Ib7DROy4aZjp3wcPfVzFz4kwz+SAnlI9U2RPXX7ELddRRwyhmnGF
 djstVSRcMGs3bD5X3DNa8uPLVYL5h5TL6IyZsAv6NnYu8t3K0W+2r1dDyIki3R/AJK
 NVBFC0k1dteGFqP6NSb5O4MZkFfK9HiWqs8V/gqLo9ApsQQzr7m7Unm72abzdxhsLM
 EC1q/CFOAekrQ==
Date: Fri, 10 May 2024 12:39:11 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, Jon
 Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <20240510123911.34f050b5@sal.lan>
In-Reply-To: <CAA8EJprcjDnpsriXOrRO4cVh5Sm9KDbHbsyKePru=6pn0-bfJA@mail.gmail.com>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan>
 <87o79ehtbz.fsf@intel.com>
 <CAA8EJprcjDnpsriXOrRO4cVh5Sm9KDbHbsyKePru=6pn0-bfJA@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Em Fri, 10 May 2024 13:39:17 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> escreveu:

> On Fri, 10 May 2024 at 13:09, Jani Nikula <jani.nikula@intel.com> wrote:
> >
> > On Fri, 10 May 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote: =
=20
> > > Em Fri, 10 May 2024 11:08:38 +0300
> > > Jani Nikula <jani.nikula@intel.com> escreveu:
> > > =20
> > >> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =
wrote: =20
> > >> > The drm/msm driver had adopted using Python3 script to generate re=
gister
> > >> > header files instead of shipping pre-generated header files. Docum=
ent
> > >> > the minimal Python version supported by the script.
> > >> >
> > >> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> > ---
> > >> >  Documentation/process/changes.rst | 1 +
> > >> >  1 file changed, 1 insertion(+)
> > >> >
> > >> > diff --git a/Documentation/process/changes.rst b/Documentation/pro=
cess/changes.rst
> > >> > index 5685d7bfe4d0..8d225a9f65a2 100644
> > >> > --- a/Documentation/process/changes.rst
> > >> > +++ b/Documentation/process/changes.rst
> > >> > @@ -63,6 +63,7 @@ cpio                   any              cpio --v=
ersion
> > >> >  GNU tar                1.28             tar --version
> > >> >  gtags (optional)       6.6.5            gtags --version
> > >> >  mkimage (optional)     2017.01          mkimage --version
> > >> > +Python (optional)      3.5.x            python3 --version =20
> > >>
> > >> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the poi=
nt in
> > >> using anything older than the oldest supported version of Python,
> > >> i.e. 3.8 at this time? =20
> > >
> > > What's the point of breaking compilation with on older distros?
> > > The idea of minimal versions here is to specify the absolute minimum
> > > version that it is required for the build to happen. If 3.5 is
> > > the minimal one, then be it. =20
> >
> > AFAICT 3.5 was an arbitrary rather than a deliberate choice. We should
> > at least be aware *why* we'd be sticking to old versions. =20
>=20
> From my side, the 3.5 was chosen basing on the previous feedback from
> Jon Hunter: https://lore.kernel.org/dri-devel/20240412165407.42163-1-jona=
thanh@nvidia.com/

Patch there seems small/simple enough if it is all it takes for 3.5.

Yet, it would be nice to hear from Jon Hunter about the rationale
for 3.5 support (if any).

> > Minimum versions here also means sticking to features available in said
> > versions, for Python just as well as for GCC or any other tool. That's
> > not zero cost.
> >
> > I guess there are two angles here too. The absolute minimum version
> > currently required, and the, uh, maximum the minimum version can be
> > safely bumped to. Say, you want to use a feature not available in the
> > current minimum, how far up can you bump the version to?
> >
> > Could we define and document the criteria (e.g. based on distros as you
> > suggest below) so we don't have to repeat the discussion?

Agreed. While we should not bump version randomly, defining a
criteria about when we should update the requirement sounds a great idea.

For me, the criteria is:

- the minimal version shall be at least the minimal one required for the
  Kernel to build at the most used LTS distros that are not EOL, e. g.:=20
  Debian, openSUSE/SUSE, CentOS/RHEL and Ubuntu LTS[1].

[1] In practice, Ubuntu LTS usually has a python version newer than
    Debian LTS, and CentOS versions are identical to RHEL ones, so
    I guess checking for Debian, openSUSE, SUSE and RHEL should be
    enough.

Regards,
Mauro
