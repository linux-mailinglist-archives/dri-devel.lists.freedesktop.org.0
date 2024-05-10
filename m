Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4532A8C20C5
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 11:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0B110E71D;
	Fri, 10 May 2024 09:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HhD7eivR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843CD10E71D;
 Fri, 10 May 2024 09:20:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 129AECE1CBC;
 Fri, 10 May 2024 09:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE08C2BD11;
 Fri, 10 May 2024 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715332853;
 bh=AxwApNMrl0If02f8zgxWuzVZRRdNUt9GnNFM8XGVwGE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HhD7eivRAHbJ3IYYPaM5LFruHmwMlsw66b4VN+OkyMT7k05DneC7BwsD/+ZCASNZM
 H5C4sl6cp23hvujJoJck5jF9/+WNJrsx8yHhFoxUJqvhmKIrn3mM+Uu4cxSU+luwrX
 DeQwKp/wiku5eg1u6nHC2hgYhxt54/P3KrSbRUxFweMO+nvH1J2F68YGFKrWeGl9BX
 LpvINgXg9f9Wuvx4zy0CfI2Ud3V9LkrQJWXTbcLVMeD8ZIw3djcDaMxHTyAzEhA482
 Du7npEWQ7r2vww0gblMOR32u2hUpIUO/BPqEfpkeIg9xN4svfNzVrush3wPUtnnQlK
 6s3SE8oWPYeMg==
Date: Fri, 10 May 2024 10:20:44 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <20240510102036.3ea40b37@sal.lan>
In-Reply-To: <878r0ijdh5.fsf@intel.com>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com>
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

Em Fri, 10 May 2024 11:08:38 +0300
Jani Nikula <jani.nikula@intel.com> escreveu:

> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > The drm/msm driver had adopted using Python3 script to generate register
> > header files instead of shipping pre-generated header files. Document
> > the minimal Python version supported by the script.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/process/changes.rst | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/process/changes.rst b/Documentation/process/=
changes.rst
> > index 5685d7bfe4d0..8d225a9f65a2 100644
> > --- a/Documentation/process/changes.rst
> > +++ b/Documentation/process/changes.rst
> > @@ -63,6 +63,7 @@ cpio                   any              cpio --version
> >  GNU tar                1.28             tar --version
> >  gtags (optional)       6.6.5            gtags --version
> >  mkimage (optional)     2017.01          mkimage --version
> > +Python (optional)      3.5.x            python3 --version =20
>=20
> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the point in
> using anything older than the oldest supported version of Python,
> i.e. 3.8 at this time?

What's the point of breaking compilation with on older distros?
The idea of minimal versions here is to specify the absolute minimum
version that it is required for the build to happen. If 3.5 is
the minimal one, then be it.

-

Now, a criteria is needed to raise the minimal version. IMO, the
minimal version shall be at least the minimal one present on most
used LTS distros that are not EOL.

I would look for at least 4 such distros:

- Debian

  Looking at https://wiki.debian.org/LTS, Debian 10 EOL will be on
  June, 2024.

  Looking at:

	https://distrowatch.com/table.php?distribution=3Ddebian

  Debian 10 uses python 3.7.3.

- Looking at Distrowatch for openSUSE Leap 15.5, it uses Python
  3.6.15 and has an EOL schedule for Dec, 2024.

- RHEL 8.9 uses a bigger version than those two - 3.11.5 - again
  looking at Distrowatch to check it.

- SLES 15 SP4 and above uses Python 3.11, according with:
  https://www.suse.com/c/python-3-11-stack-for-suse-linux-enterprise-15/

=46rom the above, IMO kernel shall support building with Python 3.6=20
at least until the end of this year.

Regards,
Mauro
