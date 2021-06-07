Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072639D6BA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 10:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4476E873;
	Mon,  7 Jun 2021 08:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF056E86F;
 Mon,  7 Jun 2021 08:06:37 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z22so5003310ljh.8;
 Mon, 07 Jun 2021 01:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=eyePaBGmpqwFtJTw3decZ+zo/NqxGl1QTrI3CsTKpHg=;
 b=i0msT2A2akzBLZIXg3oeRXhAt6dYn7/C38kxE8AlxMO7R3DjKzmlHBrlWWB6B/uKur
 Z0J3qKbkl29HWYuy7ycZBH10+ih2aNggNLlT68Is/WWsKJ+w8pTi9LvpeI6AhGuH1s/T
 hN7OxVhiaXL94s2P0UOkRlUsXGBz82Vs7RNodB/QAh+ibRi7VHWIIDY/0uZsbvATP/OI
 V+jc3U60beCfXWYKhuCL45aCQpUJ3mo3MCUSPkeuO2kbSNlZGoQutRdAJ5WrVRL0og7W
 6gO8d12jy+rof6ynBRn3d22ETp+c2uZkVMlznRV1zj+PXQWpMOJ63dmhjQ+FdV4rj28U
 wBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=eyePaBGmpqwFtJTw3decZ+zo/NqxGl1QTrI3CsTKpHg=;
 b=J2K4QKLvB71Xxv4qVpXd1TPiHEnNG0rYhSQ6nvm7KRf7Hz4gZ0Zaa1oshR+MFz+vAi
 SVRNXGu9zKsZu88wcWcApA7ZoDC+5ZEfqYRNciOSjjkYD56RFd22E0l/YpTCfNpsqfqO
 S0wU4JIInT4FS2vis94pboQlM4aJzSelr3gZUi4n4CdLMrmWzDgbZWfchCDZZYqBDnw+
 8Kks6T1rkiPhO6b2ZGf3e6Bp5X34Rk+h5EQP+sh4GNabqfktHHOFCkV9+3PBkmhXUl4a
 P49Zr+C54I+E7Zmyd9qFiN5/VYx7AI2BTWI1UT5+gWkF8cf3ZkywI/pjZ4kxOKYGs0OQ
 /pxQ==
X-Gm-Message-State: AOAM532irRWp+btyS5D/ufCyebrLK6LcE2lBM888YZsvO8zqQV/UUIBG
 7+Do6x/tFh29Qv/ZaohreqY=
X-Google-Smtp-Source: ABdhPJy0L81pGMA1sdOx3mHywKnkhaSeCHCIbhmKJCwXq18AwhWRUAmr1THrUkJx3nG3TqZFDpb4fQ==
X-Received: by 2002:a2e:9f4c:: with SMTP id v12mr13494509ljk.176.1623053195729; 
 Mon, 07 Jun 2021 01:06:35 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id bu14sm881716lfb.65.2021.06.07.01.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 01:06:35 -0700 (PDT)
Date: Mon, 7 Jun 2021 11:06:32 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <20210607110632.6ec38e38@eldfell>
In-Reply-To: <20210607074805.bmonbg5nhr4etab2@gilmour>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
 <20210607074805.bmonbg5nhr4etab2@gilmour>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yof8fdu=MosNqMNpnuybyzU"; protocol="application/pgp-signature"
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yof8fdu=MosNqMNpnuybyzU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Jun 2021 09:48:05 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> I've started to implement this for the raspberrypi some time ago.
>=20
> https://github.com/raspberrypi/linux/pull/4201
>=20
> It's basically two properties: a bitmask of the available output pixel
> encoding to report both what the display and the controller supports,
> and one to actually set what the userspace wants to get enforced (and
> that would return the active one when read).

Hi Maxime,

I would like to point out that I think it is a bad design to create a
read/write property that returns not what was written to it. It can
cause headaches to userspace that wants to save and restore property
values it does not understand. Userspace would want to do that to
mitigate damage from switching to another KMS client and then back. The
other KMS client could change properties the first KMS client does not
understand, causing the first KMS client to show incorrectly after
switching back.

Please, consider whether this use-case will work before designing a
property where read-back may not necessarily return the written value.


Thanks,
pq

--Sig_/yof8fdu=MosNqMNpnuybyzU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC904gACgkQI1/ltBGq
qqeRjRAAr2qAqV+qFCJ4350hoO6pWNIOtRS+q72DuMuvyBbI8VoCIg+gv4q1O270
gY63QrvH3GPdWsYyTdNCt6BGWS/6aWvpwpLfUzBt4ldcDZxfx+HdJjHAPHlp6puy
DS7Oz4BeAzYPlKHV1EEvyfZ0YnOBsm0/FgxEXmhNUfrUAh7MNzSwL5J3d9qf10EQ
sOtrD4rs6i3kJawKKtnCGYNy3hP0oa0Svc1V4tlYvQJIARE+XioY0a59mOetonRC
ONrn4Cy15MPFa4yCuB4aZTvXfDEN9HawV9udmaFe8PzmjmJD0p1k7YHif+t/FctH
/1i4h1XKWVNb23yPIyTuBVRvgNppJOkkfjia7b16sg93i6Dreo5RfiEKaEwqU/d/
vqsILZQ/XKv5E2wRsJbPnuqtGKEt2kPAnTSkZBnnQn5bJOshCfZe0lPkCNC+1DWw
Fo3buMd3sJbgSYG2UEml8uftNinblkpBQZfropaB5cDJzWJAxHUGx8pdHzFlrHZT
ADQspRyEAW07BbNsXcU//aIs4WfdoOp3FtE+TYsrCLOllOERI6T3YY2PjMmceXh3
iDwwYVXRA+lvAnWra3HWew3dOk5+H1cjv9L2wQpvHjiodqdpqISw8qW2q16KfEk0
raYSjJwCR/vefFajLoYildAjtpGjCv6hf/l4/N5sQGYIQd5hiKQ=
=wYNI
-----END PGP SIGNATURE-----

--Sig_/yof8fdu=MosNqMNpnuybyzU--
