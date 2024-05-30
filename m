Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F61F8D507B
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 19:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263F010EB2B;
	Thu, 30 May 2024 17:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OT1FpYe9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775B810E70E;
 Thu, 30 May 2024 17:06:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42125bfa28fso14632815e9.1; 
 Thu, 30 May 2024 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717088775; x=1717693575; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pSoUzpghMgKgPNRSR5S6LQ+u83p2do0Jb8qm1RA2ZPk=;
 b=OT1FpYe9IpOTv0WMq4Dhw+Y5C5nc0vFsZrMIIqtA/jBv1/ww5/JUofOuYsI/d139BK
 tS20kCmKhLa2UPRPg6Yz4hGrRA77dQyc6GvldA9CZVz7OxV8BZFPdp/x7+1084p53/+B
 hIOo6L/htqCIE/lxAFEUTYD7CZTMgznlayeFOtHO+DOmTZnfW8qkIgOmADPHrn2FWAcp
 sKH6JSSGKqpOPXzvH37ZfYQ0HXDVrZKxl0zRV08P21uU8dzg6IgS7dgoq6Nr9/y9eFGi
 her5NeYe9NI+omhSw0sHklCvi4ZW0BGGa4C3Sa1iNqbMkAQaC5PlF4KMlIEsTEnLB9WA
 pqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717088775; x=1717693575;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSoUzpghMgKgPNRSR5S6LQ+u83p2do0Jb8qm1RA2ZPk=;
 b=eesLAY04Z8ep5bGRg2JzeD4X8DIUPTBP7t1G/reospCmqOEPqOB2rLKFf6Y2Ij+0VT
 k00rV043IcUpMyrGLcZ7jCThAKDzBmaw5La+fNlRhQJVjH1GBqnAlXiA5qC6r+9mWb+1
 OCCBJaOSTIqiDQuYjzgAoxyaqZKk4upyR1bm6+cM+DkyANfz9ZKDDP6LU/OtX5ydxEH8
 zAXtdbp4HTOVDV/aPnIwRYOUI6p8VnkETpMJGu1U7O4VhMyHqSJnaFcoDC/2OstqWpOO
 QeAITYLc050cpE3O+4MYYL2rm154v4GVnjxgh0lQ1QUTwcODP/FoU3DPM4sakYtm20BJ
 bZmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMt8N3mvSKRjMUIw1T6dw1V4cWjwC23HkElGe/q2WDaquu6hTAXrBFygXkWo96gOxnsd4VCtSg+GfftXqFvs0ZUQUBhMw77Bju4XOwyCfw5a6krwmNawGmSFqY0lagpNwhW568lg+qf4vD50Lv4pcL
X-Gm-Message-State: AOJu0YwusuZy4Wg4cU+DM3EuPEXDRHLnYiKqGasYr+UMbOf8Yvk90kXR
 8kl3BACBiBjeGcWnCHA8K/W655i2btq6u2UIVErG1c53J8WtSvDG
X-Google-Smtp-Source: AGHT+IE07+jFmD4tsq0YkWo2ZvEXF5/9W5Sn0y4kUj7pi2LLryIUNFMmQtrQNqIVHInfXzsH/nPW/A==
X-Received: by 2002:a05:6000:dd0:b0:35d:cc6e:9fab with SMTP id
 ffacd0b85a97d-35dcc6ea738mr1227194f8f.30.1717088774477; 
 Thu, 30 May 2024 10:06:14 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dbdc776c3sm2833601f8f.61.2024.05.30.10.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 10:06:13 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=e14441a93509a3d277ebc86de6e5514a086381ac1db1c0825d540e138362;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Thu, 30 May 2024 19:06:13 +0200
Message-Id: <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>
Cc: <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Masahiro Yamada" <masahiroy@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] docs: document python version used for compilation
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net>
In-Reply-To: <87o79faq4a.fsf@meer.lwn.net>
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

--e14441a93509a3d277ebc86de6e5514a086381ac1db1c0825d540e138362
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu May 9, 2024 at 6:48 PM CEST, Jonathan Corbet wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > The drm/msm driver had adopted using Python3 script to generate registe=
r
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
> > @@ -63,6 +63,7 @@ cpio                   any              cpio --versio=
n
> >  GNU tar                1.28             tar --version
> >  gtags (optional)       6.6.5            gtags --version
> >  mkimage (optional)     2017.01          mkimage --version
> > +Python (optional)      3.5.x            python3 --version
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> Is it really optional - can you build the driver without it?
>
> This document needs some help... I'm missing a number of things that are
> *not* marked as "optional" (jfsutils, reiserfsprogs, pcmciautils, ppp,
> ...) and somehow my system works fine :)  It would be nice to document
> *why* users might need a specific tool.
>
> But I guess we aren't going to do that now.  I can apply this, but I do
> wonder about the "optional" marking.

I guess it depends a bit on what exactly "optional" implies. It's
optional in the sense that you can easily disable the driver and then
build without Python.

So does "optional" mean that allmodconfig for all platforms builds
without the dependency? Or does it mean some definition of "core" kernel
builds for a set of defined platforms?

Maybe this really needs to be annotated with the exact Kconfig options
that need this. Although that could get out of hands rather quickly. At
some point we may have to list a *lot* of these options.

Alternatively, maybe Kconfig could be taught about build dependencies?

Thierry

--e14441a93509a3d277ebc86de6e5514a086381ac1db1c0825d540e138362
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYsgUACgkQ3SOs138+
s6Freg/+LIh2+rKXPwb4yFREYQAFPpMlCXnGsILcqDxUm9SJdjAtMH9brNBWjjLu
+2fpXg9D2/DrUhtsW/hBYht1Y74Mvu+x32N9vc2P1IVwy02AQzCjjNUeT5COq7Av
GSVCn2funNAcTlXW0yLzywErepa9A5ba9Qynf2g/NirW7QygF0eyBWKj7bViybd9
JNVmpOFg/7YmATQbqxN3EAVbU96LTPxXEgnf38X2CBnBOkc7cSVlGnpXvxcCa/MC
uqA/JX5PPNbDR/ZKmVvhqrxLML11RXGEmNcxsWk8PMiEAV3sa/atjht/arY99TC0
3ln92bZj2efq/UOgkhbBMbEs69yG8gRaJUM7gKtmuU+8yy8KPm/xXJlzVCQ+t9j7
IV5OqhWze/yjaGLxcZ66zYvg5Roue5T537/C4wM1w2ksBG7CnqRn0Gd1ofskMNI3
NU7lZlfi5rU9oytk2CPK4EKW+QrUu5WgW2AZcRPOw1lCBnh4B4fJv4Z2BjFRp9xT
qxq5wduTgt43EtWrrR/15mke+P3l5gXdTeLMdA+M1TfU5z/UMGIQuahfaP8mO8XF
odg/vESBCl/jLwIYfuIskPsLHLEnund3PdLuHynSYoClnzeinm0KvkQIxaZs/QAA
C2sHCEAPWK7buSeUieAtzZh/9IeHFz9VP4gxwifN3NEgnBHhmlc=
=73sE
-----END PGP SIGNATURE-----

--e14441a93509a3d277ebc86de6e5514a086381ac1db1c0825d540e138362--
