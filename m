Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894F18D508C
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 19:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28AF10E077;
	Thu, 30 May 2024 17:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MmaiGfS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AD910E077;
 Thu, 30 May 2024 17:07:54 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2e95a1f9c53so14055071fa.0; 
 Thu, 30 May 2024 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717088873; x=1717693673; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S754fL6eVqgTIUZX2+nFqHKkShFVnRKXXFJgDcc1ZDI=;
 b=MmaiGfS3g+2rwkoXKgnJVOgeFzV6/jZK3ZFTMORLc1Uz7hQIqgnQngi3Pei2Il+Lyg
 0k3j/QAF79XepVlZLToELxOnX5pV1amYZGqJcTBmHo4JX+fKg83XkYl+DdHLapAJ4aIz
 J/cGzMFzMogp4AjXIV5JrFHvm+atyTwiGc7Li8e4ydh1moRM95IUPjBeQsMHdlVbglXn
 LOKLdnGfFHWAax2WXcEB5SOeiuCenOLuSHsJuBCAaoAJ+BcDWI22sBdEe/Rs+KGjC+M+
 DpwSnooi7H2lW2KamR2PRU8fKLioSse2KwCxxyc+i5MMqqmfvniqTgdWZcT5ZA2maRR2
 dRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717088873; x=1717693673;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S754fL6eVqgTIUZX2+nFqHKkShFVnRKXXFJgDcc1ZDI=;
 b=aqbV1VnEdFnTdLm2gMwnsq7NI6lJY1JGDmHZJU661MlHreCAb5oyuHCLDPPAPSiDxk
 cL+CkT/M3bAT/EnBBvaVHrNTM9EgYw46aCL1lrEdKGXYvXWAu8R/QEvCJUm5bun7GwqE
 EYLU0Up2OBRnHlA4e1ZYXWNmWUPhTTqd+QLVDb1yMIdE01qG1omqkwEMMdD9a+5KB04W
 tMCOFF1GMSGL3vQag92mjvgfDICi1GAWo81YivmoqFovUXiwVWCt9h+9M051SnblPHOk
 ZdLTNQhTVboEivOw0FaUz75RDY9xTAA171UqpALMt/jTn2ZIkOi0vNO5HMaF2qaqoBUJ
 dY2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV85CGF1njoq8k8G84NhI/vB0ZjV+eoHp6mqL5FIuiy4XcuhQlkF0FYSbH2lbBJekR7/n5aK0+C5ZL/TuCNckhDl/weHSzVnlQOIrfldk6sNVmvXlmsQxpskGa8rX7ohIzSs1/ECre7DVuIHb/qScDp
X-Gm-Message-State: AOJu0YwGEefeWue4WOd46CZeUllTaoRi0SFaW/s3OK7u4d4sOoN2tMTe
 L7Uy3zlW9O9aoqPVJ+NThvw1RsXh0Id1A0g4OfznznXwuFV08KQF
X-Google-Smtp-Source: AGHT+IHwjTCFVGR50yNchGzCdFfdFMN0b/atDi7Tr/wiD7aw8w8AAvWmC3KTr7YpU1+nPKK4cCRg1g==
X-Received: by 2002:a2e:a417:0:b0:2ea:844b:1b16 with SMTP id
 38308e7fff4ca-2ea84830962mr16211881fa.34.1717088872356; 
 Thu, 30 May 2024 10:07:52 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421270ad410sm30167835e9.45.2024.05.30.10.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 10:07:51 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=e8d29550c8c6ecc345e96308e31e05adf5d0599eed8c116befc5ef55e617;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Thu, 30 May 2024 19:07:51 +0200
Message-Id: <D1N57DK5Z2XU.2VP8OXFUMC709@gmail.com>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Jonathan Corbet" <corbet@lwn.net>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, <workflows@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Masahiro
 Yamada" <masahiroy@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] docs: document python version used for compilation
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Rob Clark" <robdclark@gmail.com>, "Jani Nikula" <jani.nikula@intel.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan>
 <87o79ehtbz.fsf@intel.com>
 <CAF6AEGvTkL=JxGDaOab9XpJ4htWQnBA1dTEOUxBUTAavM0DB4w@mail.gmail.com>
In-Reply-To: <CAF6AEGvTkL=JxGDaOab9XpJ4htWQnBA1dTEOUxBUTAavM0DB4w@mail.gmail.com>
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

--e8d29550c8c6ecc345e96308e31e05adf5d0599eed8c116befc5ef55e617
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 10, 2024 at 10:04 PM CEST, Rob Clark wrote:
> On Fri, May 10, 2024 at 3:09=E2=80=AFAM Jani Nikula <jani.nikula@intel.co=
m> wrote:
> >
> > On Fri, 10 May 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > > Em Fri, 10 May 2024 11:08:38 +0300
> > > Jani Nikula <jani.nikula@intel.com> escreveu:
> > >
> > >> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =
wrote:
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
> > >> > +Python (optional)      3.5.x            python3 --version
> > >>
> > >> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the poi=
nt in
> > >> using anything older than the oldest supported version of Python,
> > >> i.e. 3.8 at this time?
> > >
> > > What's the point of breaking compilation with on older distros?
> > > The idea of minimal versions here is to specify the absolute minimum
> > > version that it is required for the build to happen. If 3.5 is
> > > the minimal one, then be it.
> >
> > AFAICT 3.5 was an arbitrary rather than a deliberate choice. We should
> > at least be aware *why* we'd be sticking to old versions.
> >
> > Minimum versions here also means sticking to features available in said
> > versions, for Python just as well as for GCC or any other tool. That's
> > not zero cost.
>
> At this point, the cost to having a lower minimum version is pretty
> small, so I'm not worrying too much about it.
>
> Maybe once kernel developers discover mako, and start generating more
> at build time, we'll have to re-evaluate. ;-)

You're making an interesting point. Does the build dependency here
denote Python (& standard library) or do we assume that if people have
Python installed that they can also install arbitrary extra packages?
Would a Mako dependency need to be explicitly mentioned here?

Thierry

--e8d29550c8c6ecc345e96308e31e05adf5d0599eed8c116befc5ef55e617
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYsmcACgkQ3SOs138+
s6GwDhAAk7AgMlJlfnIXUZpOj/rOLWcb600MiHHFNHwSQCe4Uth9OdBvDjdFqsUH
IOsRHerjzQEwlXmSafIOpXa2PZIdyxpGhW5b3regoBNfy9BeGgQLPyFwcQht6qh2
VI2nrMek6YghkNYEOJgj/mR3pKgPdubbvenIHKRqjoOVO+dviJfnRCWGyBAmD/A7
vBa21JJQ8xMZ4+uBFmwGfD6z3wzmNJejyeMTrSEspmmWzp1EouxwEy/gtUPv4xKQ
zC1HEk/hWUEYaFgY0zgsT+HH80QhfpO2A93RM/DhcON8UPG0zkPXjNGy7PR49kAm
8dHvyVnT42uD2ziXfp6sDAlCw5StvmPNyEDxltCBmZXWlana1DkQZarfNuBpuTBl
Uf1C2GBc1I9AjH0Dui+jdzBurfBTRi0p5OTMh4xtfTuBKLQnNwCZ+Loc+Ft4uzX1
ziaoZtR9q2PpElDhruxNAHH19a7DpfB71HYvcnhkrlpCH85ivsFIGditzYlMxuOK
uoMZchMwVyzqptRpyKHsfgaIYNWffFB/vmLI27m4HrRYGl5qg4tx7te8FK9RP7cC
mSM7KS36BA/BlJV9dLePmcKHylabI1HgJRKQ5nwFo5TyCHIh00EEpC01k7hcW/N3
qrVTwB7kDgm0w1udks5zBp0D9+xquWiRWF9uVpwLQOvTfzcp434=
=RSh3
-----END PGP SIGNATURE-----

--e8d29550c8c6ecc345e96308e31e05adf5d0599eed8c116befc5ef55e617--
