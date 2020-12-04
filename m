Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE62CF0F0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 16:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741926E190;
	Fri,  4 Dec 2020 15:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07DD6E190
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 15:46:10 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id a16so9336738ejj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 07:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DbuAyN4iS3jE4U8EbiNHXJ2azbl7Kvh289+qu9c177I=;
 b=qo2LjP/5aSlrSTKxBszJVbRALYQEyunOrGSTat7HnEImAsVNH/dsiqnnc/oSJug0o2
 CUpls6t4Di/qckyok9rz0J7q1HJzRJZp25u9MUEKDc1UwjZfpOaB/oCUOoQkcTSa0yOd
 kD98xdt+C5yB2eM+hpCaJh2BhCA6Unikuon6GD9Ro2dY/3KBhXSx63YzuM+SFtVDUurV
 34CcQI1gQQiW9abg14HoZhCnX+jGW1jtzU829y/BZn4zsnvtL3YvC00TEQfD1KJ0p5B5
 IAUir0Mr3BW6R63WqaTlBkilwaM/1U/ZujJtKlIgBJSH8ooB0qJcroLVBioT+7JcrvP9
 sjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DbuAyN4iS3jE4U8EbiNHXJ2azbl7Kvh289+qu9c177I=;
 b=t6wZtMlbd3IY1unMufC5eLXtaHL9MAurtzrfJZMF0jSV7WYYdbTit3OqEhEGXx5Km0
 20qiERG3/lOhbBarpRacxt2O6VfCkZhNSMyjL2h4gk7y3CIF/FWtdOcTbhm8rLt9F1Zy
 igWIyjSMX7aIM9vaarm5KgY9IwWx2qHC761fgG+YVYATs0vO2XZgDoAIx0WzG8lLCsR9
 OMTfxm8MTPJNEEbiTg9UGcR3gc8o6yuZQZNrBWPzNoZEsptOGp3bk4B1MfErm8ZSWpUb
 Y0w5K9WYs6wU/lQLQqyrgIhz7OVnu85EtkMm2j/GwXYzwlx7Xf603XPkTS4c5uVeOKFf
 I/vw==
X-Gm-Message-State: AOAM533QAOECWqBrrbc302RKVg4HwbjCPU7wiPSNFUTxY5gV7MBgIO0f
 c7xK79TNp5rHNgHWIFSNFQs=
X-Google-Smtp-Source: ABdhPJzK6eXffhjqFGkcAWdUBfAlJi9OXl7yvUZWgm9NnuvukHyyyS6UAK2lT0tx6lcjkCDWIy/LvA==
X-Received: by 2002:a17:906:2581:: with SMTP id
 m1mr7556254ejb.28.1607096769272; 
 Fri, 04 Dec 2020 07:46:09 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id mb22sm3310243ejb.35.2020.12.04.07.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 07:46:07 -0800 (PST)
Date: Fri, 4 Dec 2020 16:46:06 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: memory: tegra20: emc: Document
 opp-supported-hw property
Message-ID: <X8pZviQW2BHSMlg6@ulmo>
References: <20201203192439.16177-1-digetx@gmail.com>
 <20201203192439.16177-2-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201203192439.16177-2-digetx@gmail.com>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: multipart/mixed; boundary="===============0781893075=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0781893075==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ldeiUs9kZMXTziz"
Content-Disposition: inline


--6ldeiUs9kZMXTziz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 10:24:30PM +0300, Dmitry Osipenko wrote:
> Document opp-supported-hw property, which is not strictly necessary to
> have on Tegra20, but it's very convenient to have because all other SoC
> core devices will use hardware versioning, and thus, it's good to maintain
> the consistency.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt      | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--6ldeiUs9kZMXTziz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/KWb0ACgkQ3SOs138+
s6FH1w//dN0K/ARFuRyDWigwOrKReFJQh4EOwjQKryEpjjTg8Uvrc7Y/OWrIo/qB
yja+Mk9p9mxkYJXxn6IY2mW2Seph8nmzG35zy0JBL+N+eZ/XiPvqt85W518oHxaa
asyYw335HlTappz23Kdx9IIfeHQXX76H96+gUyUughgMA+7y4G2n2G4xTP916EFd
fZ53xB5EUYyp37nROQASYoPCmCnIgZBAQchJoOvRPqDeSc2ce+/kdU+faoo0ltGz
gX5OF6zTkC+6NVVS3aBy1gIZg/wqQMo1Yiz1kslAf2n8Pk4JOgDKobzUDL9NZX7F
HQhmjBwV9yBsjnWEydVEz+hHf+UG1QRbYHCyURDMnNw4qK6/b1tUpz9paE40l2BP
RQCNEDMb+AhhOx8gyeqtIQJd6XErNR5vJi/kMZV0bWaxjdzaFKSnvNKTZ92VoZvN
UCsn0kFSmheUTE6xlOW/k2YXnD3Qcoo7pOc0LWqIuSUizqBAbSJen6VFWyKngZ+4
hkgZW2w0sHoOE9Fut2HxuGc7mg/2da37r+NxI66fzcR4DU0igQeeDJoMVmC9B7gj
EIqwOMy2hrRUrK64rDJ1fxKeRplINR7LZL9yBKEGsLwACi5wdFYNZwZr9xcP4TCy
yiEcJJH8F80dhvV8e/AuZyBPfrVhz4qDeWXr/EcuAenYLZnQ9sg=
=JFZn
-----END PGP SIGNATURE-----

--6ldeiUs9kZMXTziz--

--===============0781893075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0781893075==--
