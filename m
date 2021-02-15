Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7550A31B7AC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 11:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBA46E0A2;
	Mon, 15 Feb 2021 10:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19006E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 10:54:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v15so8320844wrx.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 02:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uGu99I5tzLeDdp+2g+ba6apu/y/h/hr3frLJyD5N4cw=;
 b=EHJ+cjfRtYeM9aodchWZwUsQqBe4vv0h0kve1mejFKWcx/jTFLo/iE9mue2QlJXBEP
 ebMhzY/BbT+PDAjkj964v9ZTuoIjUXhf4WwFcmMhU8VQnY9de0r0qwTprUSxfipEzH7A
 1rqkUd4x0GIXCory4RczaPpXmakIOMGDxoU/JRGdCq7nUw62oBzx3UpoYFp5mVaMzmJw
 qsWWti+4B5S4rImd8iRCYwtSUYprArymHlqiTOp2XIznN1CIlXtyseISfzmkTwslyYkM
 S/Dst1+v7yM2/JoWUwS1YsdQUvlxMK1lbl2mAJ5Uy+ty9fzNtiH5n8CutbjA4mKtsQV+
 l1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uGu99I5tzLeDdp+2g+ba6apu/y/h/hr3frLJyD5N4cw=;
 b=eOWI3TrKyDOZqhuCxEqGh+t5bcCKozNpjuTQNwMgJwyNFb5HIKrTE7enydBWCmzSYF
 umXxZZyn6gdj6Q+Bbnu8Dgj8aG91hx0yejEQcbXLQ7/v9H6VnCRzybRolLOViI7l2mui
 nqvxKGqWCfwo0JEYM9OdNOIhcpjx/9trzy0DMqxyUXEJ0wCi3rG/KwADAfISNJiyCF5n
 fwAo+ONnFL9JepZLyBwpgc0Pkl57h1XxWCJGgYF9bOzYyNPRyDYjrgHeQ0EZFWHknst4
 joEc3QX4hBiBTPazag4f/8OLcD66tZDVc87pb8t9msn7QHeyfB9sE2nfvfOhe6S7Po1q
 KRKQ==
X-Gm-Message-State: AOAM5308jn6nlBTacDBh006v4zlaHCYMhgDqKpOuqKNs5RkaUDU/PK8E
 ZLNDtyajg/vZGQK1wdRDzbQ=
X-Google-Smtp-Source: ABdhPJz/1dQf3G5GOMETQsTr/h5daiylqroYk2UrcnbnbUDHEr/uG4ZoKAtnia6QxZ17h7YVsTdN+Q==
X-Received: by 2002:adf:80e7:: with SMTP id 94mr18261760wrl.5.1613386446569;
 Mon, 15 Feb 2021 02:54:06 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id o13sm32176597wrs.45.2021.02.15.02.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:54:05 -0800 (PST)
Date: Mon, 15 Feb 2021 11:54:04 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/3] NVIDIA Tegra NVDEC support
Message-ID: <YCpSzEvf7nZqRDKm@ulmo.localdomain>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <8a50f133-12ed-e81c-47a5-07c51924ec6a@baylibre.com>
 <YCpEA8K6vgxfz8uC@ulmo.localdomain>
 <d634884e-e40e-50c7-40bb-75df64f281f2@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <d634884e-e40e-50c7-40bb-75df64f281f2@baylibre.com>
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
Content-Type: multipart/mixed; boundary="===============1114857374=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1114857374==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X7Lx3J9uiuPisHOc"
Content-Disposition: inline


--X7Lx3J9uiuPisHOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 11:21:27AM +0100, Neil Armstrong wrote:
> Hi Thierry,
>=20
>=20
> On 15/02/2021 10:50, Thierry Reding wrote:
> > On Mon, Feb 15, 2021 at 10:10:26AM +0100, Neil Armstrong wrote:
> >> Hi,
> >>
> >> On 13/02/2021 11:15, Mikko Perttunen wrote:
> >>> Hi all,
> >>>
> >>> with the release of documentation headers for Tegra multimedia engines
> >>> (NVDEC, NVENC, NVJPG) [1], I have started working on the corresponding
> >>> implementations. Here's the first one, NVDEC.
> >>>
> >>> The kernel driver is a simple Falcon boot driver based on the VIC
> >>> driver. Some code sharing should be considered there in the future.
> >>> The userspace driver to accompany this is a bit more complicated -
> >>> I have expanded vaapi-tegra-driver[2] to support MPEG2 decoding.
> >>> It should be noted that the implementation is still very clunky
> >>> and has poor performance, but it's a start.
> >>
> >> Funny how all this tries to avoid all the DRM, remoteproc, V4L2-M2M st=
ateless & co
> >> all the other vendors tries to make usage of...
> >=20
> > Care to elaborate why you think this is trying to avoid anything? Mikko
> > pointed you at the documentation for these engines, provided a link to
> > an open-source (albeit work in progress) userspace driver and posts an
> > extension to an existing DRM driver to add the required kernel
> > functionality. That's a standard approach for submitting this kind of
> > driver.
>=20
> Thanks for the reply, I didn't look extensively at all the documents & us=
erspace
> libraries, but I wonder why this couldn't fit in the V4L2-M2M approach an=
d avoid
> having userspace drivers and specific libraries to handle this.

Ah, I see. Without going too much into the details, the reason for this
is that the multimedia engines on Tegra use host1x for command
submission. host1x is roughly a command stream parser with built-in
capability for synchronization and (in newer generations) process
isolation, etc. This same engine is used for things like 2D and 3D
acceleration on older chips and there are other hardware blocks that use
it, such as the video image compositor (used for some post-processing
tasks). The GPU can also interoperate with host1x for synchronization
with these multimedia engines.

The userspace interfaces for 2D and 3D have existed for a long time, and
the fundamental programming sequences are largely the same, so we chose
to use the same interface for simplicity rather that duplicating most of
this into the kernel.

Constructing these command streams can be fairly complicated and a
number of extra data structures are needed for each command. Putting all
of that into userspace reduces the potential for bugs and crashes in the
kernel that may take down the whole system.

As for the userspace drivers argument, this isn't adding anything new
but rather provides a driver for the existing VAAPI library that's
already widely supported in multimedia applications.

Thierry

--X7Lx3J9uiuPisHOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAqUskACgkQ3SOs138+
s6G1nA/9HbD+J7svtzJz5oTwH8YmsWhdoCdf8+IFaMtMhRf7feKcSM6clC44t+7N
JLnUjshbuUt+RNglbkvdk9NNJl17xl41bP5cUi3zLi0kn+G2QftxyqBrd9k8Dk+h
ezAH2vY7CXuMOHgdXIOEfGGS6XY4NVPzVaaaa4RQQ1A6Q77LERrK2rsDvtl4Scmc
Tav9zVWvUV+NcKQxwtHxtb4/YhGkPUN6B/ZautcGyxCu9E3JCHu4TvNGjlIfrEhZ
nMIVIKXV3D8dyyFNaYxJ2JXxNr2YRCBH/+oSlHJRdLen1Ol0X37VQO3gQrDyX8Ze
gvg1xH0FTAWRvkzwEguyrd4DP++Akd56sIS23m8m6TEBvbqubl96fok9Z+FCAAPz
qz1Fsn5KRvo3bQrc+U3DET5XrPm+KXZ6zFA4leSxjKYwCWqQ3gwh+RSbcYnxUKqE
hA8RSU86FRq+LvM9kgXiIvxY9jheDRx4/v4C9neYbohkvvwuYrDoCSRvRMRQTonE
Yu2iwPfOSS+3dl9nfSC11xnSVuifgKSaJDjq//5Z6Km2HUfHZ5OV4h5ANdPUpDyP
x5bBBtDMyfQL4QR5ySyLhI7arGAccJ5gM0uweIwaC0HUt9Vc2PBFxb87b6MPyIIr
5wqnTxNHRKjhl9KyCzw/ZwlNbmyW/2qbING/l1jCEXjTMGoPrC0=
=hxOs
-----END PGP SIGNATURE-----

--X7Lx3J9uiuPisHOc--

--===============1114857374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1114857374==--
