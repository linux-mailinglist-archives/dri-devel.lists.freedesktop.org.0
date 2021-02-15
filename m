Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B261231B6B5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 10:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA63C6E156;
	Mon, 15 Feb 2021 09:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E396E156
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 09:51:04 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id a22so4264749iot.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wGgIJlfiUH/6IxaZ9Qqh9CygCIMjRjbBNumaQx/5Lr8=;
 b=Bup1ksadwEzaokJ6s3gLnbvV6gPC8VvpDGUw9HIP+Vs5vb7IwQPd7OjHYS4AlSpEow
 0qT0AleoIMYItrQlq27TK6HZD0+ADpGyYomLZrW56xB+tpU4NRj2arYXmXPUEeZlzRqW
 eL7fBN96yPjD4epcqD7VcsUfE7ylLGqUTKNhVtmkz9QEqTTlzk0gLso7aeobWeboP5qn
 GsFDDfIL9hBjVtujJQamuwW5vzIKh8K1KLj4j6cPxgt49aLkjOxknJL+Uoa8cry+i9mF
 RCbK2ZkSmG0vAXqgwK0TT/PDwSe+kMpX4BnLm0w9e9KF3lHjP13JztJo0vfzXsdS+vzz
 ndBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wGgIJlfiUH/6IxaZ9Qqh9CygCIMjRjbBNumaQx/5Lr8=;
 b=uCOm7sQj4DsoWLT4s3Ch4mDOTzEaiVLiO2BVTCOd223/L8a4cLQZ5F1FZsdWcmfhUS
 n+3ToqZqa7gz9h/OTn9knWc9ZKe4PbruiksKCjNbyixKGuoQ1VaCMoIpgK1atl5zXqrx
 U4w1uEiZi0aZchDnL5l5m8eCpms573YPJarHT4j4MSvHosn9VK85TXJwj9WovS5WHELR
 cCU5NFGsdijl7uMj33QZSXBEQAFwLW66RT22R6c5t/F1o3lSViPHq5C9VDkFb9MbUJUo
 SYgzTiF0y0BXXY75hfWsGpnqt4J03TCejY5pRf5L3Y4IUqn+o/39suWeoVwCNroqZf2l
 B9AA==
X-Gm-Message-State: AOAM531PX1sUmEbDXij6crGHy24Pitm2/rMF6QmI7tZF9clGLIESP7Gv
 0VdUByLnYMCO3vrOJNP5YmINn2Yj4ws=
X-Google-Smtp-Source: ABdhPJytaOmQQmRCp20XrC2tqZfAdPy67bAv+L6zitKLuezaK+IA7nAb7X39NFgpM+xCadtwKFtUwg==
X-Received: by 2002:a02:a497:: with SMTP id d23mr3215454jam.22.1613382663735; 
 Mon, 15 Feb 2021 01:51:03 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f9sm9036129ilu.36.2021.02.15.01.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:51:02 -0800 (PST)
Date: Mon, 15 Feb 2021 10:50:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/3] NVIDIA Tegra NVDEC support
Message-ID: <YCpEA8K6vgxfz8uC@ulmo.localdomain>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <8a50f133-12ed-e81c-47a5-07c51924ec6a@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <8a50f133-12ed-e81c-47a5-07c51924ec6a@baylibre.com>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2114571023=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2114571023==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m3tBd9pz6GyPOiCL"
Content-Disposition: inline


--m3tBd9pz6GyPOiCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 10:10:26AM +0100, Neil Armstrong wrote:
> Hi,
>=20
> On 13/02/2021 11:15, Mikko Perttunen wrote:
> > Hi all,
> >=20
> > with the release of documentation headers for Tegra multimedia engines
> > (NVDEC, NVENC, NVJPG) [1], I have started working on the corresponding
> > implementations. Here's the first one, NVDEC.
> >=20
> > The kernel driver is a simple Falcon boot driver based on the VIC
> > driver. Some code sharing should be considered there in the future.
> > The userspace driver to accompany this is a bit more complicated -
> > I have expanded vaapi-tegra-driver[2] to support MPEG2 decoding.
> > It should be noted that the implementation is still very clunky
> > and has poor performance, but it's a start.
>=20
> Funny how all this tries to avoid all the DRM, remoteproc, V4L2-M2M state=
less & co
> all the other vendors tries to make usage of...

Care to elaborate why you think this is trying to avoid anything? Mikko
pointed you at the documentation for these engines, provided a link to
an open-source (albeit work in progress) userspace driver and posts an
extension to an existing DRM driver to add the required kernel
functionality. That's a standard approach for submitting this kind of
driver.

Thierry

--m3tBd9pz6GyPOiCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAqQ/8ACgkQ3SOs138+
s6GlRRAAmolOLqnCKFxCY9gq0Ay9d/vc47N5KPOJ235ZsTtEPw5HWVjgHAzXxq2W
ek3U8BYNf+s2OLNMI5zTUWZVfx7feZ8La6nv6Vbaj5nBQfpLC7fCWyzF37UcDZOy
nloZNtUX2wADF9wisEPHXfpKoIUw40zxHXyGDaMoU5AzDok11VhyoegndzHfpsFy
6xFboaLecyZ+wr9NzokgNCl4sTYt4T364zkPZjsaDUJl7NtwPA+2qwJ7Y1p9VfdZ
3eNEezs3kkgEzQS+3ShABC0sK90bvZbbkRZD6Nm4gbVdC/KjiMQqqw2PTDwwpt7i
VLQOfMHHp9kVEbS/weMCPchSgv+mArYvUYp9ACsJwGSA8v1N51AW0HEcePYKeFDK
VzS39Ho03H391aqw2f8dvyZ1Y7SV5adcvHxvQa/HeZGLPbMp9wWgsjuMddPELioK
2FlQ+rEfjuaxBZixhgV4tL6PbYbmPWX6issXQ7g3yytjF0tDs1FMGP4nAb6fe6B0
mzTjEscUpNfriduEapSLKO2anfXIvpoh+CNVwaStkcpcE/jXaq7W2ZXKNZCQCoL6
U1VIn62avABQnABT3J+bsjvTToE77/LI6148nj/uEND2XDUPxr0/1Jk2u3AfZAVw
75rQM/VRsP5J41sWghQefz71RhbQieGn0OS0f45vSw0r0MvUST0=
=bWnZ
-----END PGP SIGNATURE-----

--m3tBd9pz6GyPOiCL--

--===============2114571023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2114571023==--
