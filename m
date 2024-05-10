Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA28C230E
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 13:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64DC10E56E;
	Fri, 10 May 2024 11:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ihXfjw4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001AD10E56E;
 Fri, 10 May 2024 11:22:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 149DCCE106D;
 Fri, 10 May 2024 11:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CA4C113CC;
 Fri, 10 May 2024 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715340120;
 bh=HSGNzI8VBlGMlvbRbsd2ObIVJhvcS30eOk4bSfP6pl0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ihXfjw4mBP7X4WTIHWRYrSBF3iVhrYj3c4Dx5l+jpT+FTgsJffGRO9vSgHrM7zUOj
 kOlXC4rU0xe8kX/Vro7lspV3JguR6RF+N1ERTAjFiVCf/vbxcdUh20Di/13AdAq4Jn
 2SAEzUwnAIMnIsr5M7XU0f+0eH2wk9EACxYDCsz2wqfhADAPo3+ydQi3lMo4PurSPs
 UT8KJCpOPJznFR3FMg1H8MQgq1cVEexFlEc6dV24BAvOi3yEzJgZ16+zZhNvXj67YS
 o+iYYnxGzKicaIfalY9tSWfJYYggbPz/0e3U4c5WZ66vLghF5pUzH8QinBEBLaiZVB
 wY7PMNUvznMoQ==
Date: Fri, 10 May 2024 12:21:52 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <20240510122152.76e79ac9@sal.lan>
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
>=20
> After checking distros that I can easily use, I don't think I will be
> able to test the script with Python versions earlier than 3.7.3
> (Debian oldoldstable).
> I can try setting up Debian stretch (old-old-old-stable), which has
> Python 3.5 and so cover the needs of Jon.

Fedora 40 supports version 3.6 and above (plus 2.7):
	https://developer.fedoraproject.org/tech/languages/python/multiple-pythons=
.html

You could do something similar with Ubuntu/Debian:
	https://askubuntu.com/questions/682869/how-do-i-install-a-different-python=
-version-using-apt-get

Once an old version is installed, you can enable it with:

	$ python3.6 -m venv v3.6  # create the environment
	$ . v3.6/bin/activate

Then, if needed, install whatever dependencies are needed with pip,
inside the venv (for instance if you want to also test Sphinx, you
can install it there via pip).

I guess it should be possible to use a similar venv procedure with
older versions, but you may need to compile it from the sources if
you don't have binaries available for your distro.

Regards,
Mauro
