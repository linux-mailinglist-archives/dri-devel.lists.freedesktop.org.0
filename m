Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E51B8EF6D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 06:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6D710E3A7;
	Mon, 22 Sep 2025 04:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d1KtTAPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CD010E3A7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 04:58:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45e03730f83so15471405e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 21:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758517121; x=1759121921; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAvsa2EzVq4+dzbR4C+qjrwq8bLpvzRB2OJRPqfQHYU=;
 b=d1KtTAPDdErrFpJZyWoaky1XFAS+YRcDcMx4pzKz//0qQHZYZR1BIanGqDugFZa7DL
 RhX6z0leeNH4GPCwPZkPvvnlKcog0oIgYUSJ6L1vz4LYwuAZwFopxDLHbB03CdjyKek3
 kGixFfClGRE8XIiQKajHdKocbct8PWtYewjUjWoBz17sYrgZ+QtRo6RbXXMCHLJ37WKe
 d4Fge1jFP3onVv/cCommITwDWUsSyT1Zt+clMcy15Onf8v22FepLeWaNYJUhGr21UkD9
 1wn1AXFsyEIK+msSCb03qCd57lUffhm6kn8ZFUWT28b+n/r1Jzad0TDyDKccPLy5V54V
 C7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758517121; x=1759121921;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AAvsa2EzVq4+dzbR4C+qjrwq8bLpvzRB2OJRPqfQHYU=;
 b=bggHcryVz+LhsBTOmpHe93VbSmReiGS9zxjw/olllJ/qx+KOebCaWRo+RRVL6QupgE
 Ccl2i1gw3znrSC4UkNz0VoDzx45d7M3DDcIoIqCp9eKimzHkkCe2219zBOv+/iuFn1gI
 KkThvja3yBUx+2wbws9IWCj4+XCxm8qc/XsMsM+2q6lva9JCHn0VKVKXBeLF+iut81S2
 SAGAylLxZLtVCmNOhJAplX0K4QW4QSeLrdsCHc4KJIoZokfspRjv8XEP+rrFdPGO6jH+
 +0Rln5Zmlrem/ia+XGwJwYrHjwV93W2Ia06rIdwBXH7d0d9aULODeosyb6S6q42tlJDZ
 vYEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOPSZZcqi+J35mSEO0/JAuk0LJr0VwBsrTYBo/BIKIV2LagsU9d28gLzFN8nddTG3dwi1WLkywtjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZJCgRQhz2Xa6RZbPF5ZWcxCu3P2bcy/kZf9COzdTcxVZ+VDUU
 2qkLUHjAF8nahCGmY8ZD3DELusbyCyGek6DgZqZVYv7NaGu3wi93kaChWSeyCkYmZ7b+yt2jfxQ
 r0O7M0lVqYJ2d2uUeB4jcO/uUuSrn8xA=
X-Gm-Gg: ASbGncs6XF9FFUmWfYZtE8MsNb1QGDdBFT4ZtMIqMzU0iorHx/jRmMvK6Qq4gn+Gye3
 vYycszKeZQC21eKttmPSXCL8PAZhDcb0ffNEd+HiREmRvBSnO3O13lOx+yxGzBiij2/zthmDdVp
 cQMdtmmfCRZp3ZXTHr1GP/rJuOVljrNaHSG5AqQewVZ5dhpY93lta6xlaPEy9J+0Vr9htzS8k+K
 Twdw4I3
X-Google-Smtp-Source: AGHT+IEqpf+fahmlNxfcBD+gdZTresTyKx8zIRWfM243PFo4NiJuTkwOy4u6cIIp5K/YP1nuLHVN24tHIMe3nvhD4kQ=
X-Received: by 2002:a05:600c:1f90:b0:45d:d609:1199 with SMTP id
 5b1f17b1804b1-467f06887b5mr105306365e9.30.1758517120934; Sun, 21 Sep 2025
 21:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-19-clamor95@gmail.com>
 <2331830.3VsfAaAtOV@senjougahara>
In-Reply-To: <2331830.3VsfAaAtOV@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 22 Sep 2025 07:58:28 +0300
X-Gm-Features: AS18NWAi5iIH6gMmyrHteYV1m4FMyO6_CjTfEQzBzZCFo1CBmqpAnZAs7VssVwE
Message-ID: <CAPVz0n2AjRPMuZbLAnc=9TriPHDLOFok+Qz3zoSpQSKX1R=cqg@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
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

=D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:54 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Increase maximum VI clock frequency to 450MHz to allow correct work wit=
h
> > high resolution camera sensors.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stag=
ing/media/tegra-video/tegra20.c
> > index e0da496bb50f..3c5bafebfcd8 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -590,7 +590,7 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> >       .ops =3D &tegra20_vi_ops,
> >       .hw_revision =3D 1,
> >       .vi_max_channels =3D 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
> > -     .vi_max_clk_hz =3D 150000000,
> > +     .vi_max_clk_hz =3D 450000000,
> >       .has_h_v_flip =3D true,
> >  };
> >
> >
>
> Where does the 450MHz come from? Instead of hardcoding this value for eac=
h SoC, could we just clk_set_rate(ULONG_MAX) like e.g. the vic driver does,=
 or does that get a too high rate?
>

This values comes from downstream 3.1 tegra30 sources and setting it
higher breaks VI, I have tried. If it is set lower (150MHz as it was)
it breaks VI for cameras with resolution higher then 2MP

>
