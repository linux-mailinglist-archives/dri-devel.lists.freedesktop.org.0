Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED82B8C3D2E
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 10:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B54C10E2E7;
	Mon, 13 May 2024 08:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E46dqIV6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756FE10E2E7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715588992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ACGTg+jqwLvGd3uIYLEqlsb3DEYNKvz+FsT7qMFK+3A=;
 b=E46dqIV6RJAbuiqYLT+wGBDTx20xT68UmPLeooiV02m+oX+nthdC/ZCgiZCwLQjRXVqz/m
 NibQGU7NAH5jSeViULZz/lzV5fUVrQtaJraqbjEQFb3kmT50V8D3wkwp23LBn+XuegJ6Sb
 7JhDCdoCWHwv99vfVo0ZBn7szM9u25M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-Ohl1teFVMoaoY6AIXGAotQ-1; Mon, 13 May 2024 04:29:35 -0400
X-MC-Unique: Ohl1teFVMoaoY6AIXGAotQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-34dc7b83209so2416843f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 01:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715588974; x=1716193774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACGTg+jqwLvGd3uIYLEqlsb3DEYNKvz+FsT7qMFK+3A=;
 b=J5P4tNNNWz+ApeqGaTVzOSw6ZbpPHnBckDfaJpBfGLTrsph2NNpKVyHjVXtGOCynfH
 DzS82R3OXwZ7TChV/pG1CO8MDpxkWJStHX5Xgwj9fS2D/H7N56EAUwLX6anrxBM5CEN9
 rBFlxrn1nw8xE/IQF+cwG4U5rW4HlBAssrezIXwQWZ9JGvIqXlMsY4zrb4KoC/mm/ZQ2
 QmkE9QhjJZazZHdVh8RQGq4SKa06D4NXlMwIH2nWMGxICDfjuBYF3xrF8f6Lg+3mgOWE
 Z9zGKO0yeAUBVdLPf1BiYAbyMv/vfplHBlDCOlN+3EB6PscV1sFxtxehrHBThbt/kvok
 IF8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvcQXUj6FUWZND3NX62xQrPTGuWezLU6x00p4bPYhB9gRMdU0lHt2kplgF998L+TBkJX2Ue+th5SFAE/LJDUBnfTuFNcSknXKf2v9/6QZX
X-Gm-Message-State: AOJu0YwRBgkV+Jqki04N1sreYxuuGjNgEexzTLSIyJY0pYq0MaQYr5B8
 OrlsfriN/UJA12P3gZQi4EUBTcz3mZBHbVcks3ncnCa7vTX5oAyGBuebnWGBzFJGs/HQeIHjp9f
 hQOUPwogfR0Uz0Wz43r/gx971jaG7yt48zNlJG1MPbuQEXFvyhuzzJw6SU81lLUtwrQ==
X-Received: by 2002:a5d:444b:0:b0:34e:4cc2:7015 with SMTP id
 ffacd0b85a97d-3504a73bc06mr5553395f8f.31.1715588974251; 
 Mon, 13 May 2024 01:29:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvlr1r3nrAIBq+G7ChUWvWgw+OvWO5SlmWK/Uy2RAOomeNeCf7DAAnSfqycFznvhJ7OQM6xQ==
X-Received: by 2002:a5d:444b:0:b0:34e:4cc2:7015 with SMTP id
 ffacd0b85a97d-3504a73bc06mr5553375f8f.31.1715588973707; 
 Mon, 13 May 2024 01:29:33 -0700 (PDT)
Received: from localhost ([193.32.126.216]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a789asm10513081f8f.51.2024.05.13.01.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 01:29:33 -0700 (PDT)
Date: Mon, 13 May 2024 10:29:22 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>, 
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>, 
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240513-heretic-didactic-newt-1d6daf@penduick>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="uitctc2p333ggqzy"
Content-Disposition: inline
In-Reply-To: <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
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


--uitctc2p333ggqzy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2024 at 10:36:08AM +0200, Daniel Vetter wrote:
> On Tue, May 07, 2024 at 04:07:39PM -0400, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 07 mai 2024 =E0 21:36 +0300, Laurent Pinchart a =E9crit=A0:
> > > Shorter term, we have a problem to solve, and the best option we have
> > > found so far is to rely on dma-buf heaps as a backend for the frame
> > > buffer allocatro helper in libcamera for the use case described above.
> > > This won't work in 100% of the cases, clearly. It's a stop-gap measure
> > > until we can do better.
> >=20
> > Considering the security concerned raised on this thread with dmabuf he=
ap
> > allocation not be restricted by quotas, you'd get what you want quickly=
 with
> > memfd + udmabuf instead (which is accounted already).
> >=20
> > It was raised that distro don't enable udmabuf, but as stated there by =
Hans, in
> > any cases distro needs to take action to make the softISP works. This
> > alternative is easy and does not interfere in anyway with your future p=
lan or
> > the libcamera API. You could even have both dmabuf heap (for Raspbian) =
and the
> > safer memfd+udmabuf for the distro with security concerns.
> >=20
> > And for the long term plan, we can certainly get closer by fixing that =
issue
> > with accounting. This issue also applied to v4l2 io-ops, so it would be=
 nice to
> > find common set of helpers to fix these exporters.
>=20
> Yeah if this is just for softisp, then memfd + udmabuf is also what I was
> about to suggest. Not just as a stopgap, but as the real official thing.
>=20
> udmabuf does kinda allow you to pin memory, but we can easily fix that by
> adding the right accounting and then either let mlock rlimits or cgroups
> kernel memory limits enforce good behavior.

I think the main drawback with memfd is that it'll be broken for devices
without an IOMMU, and while you said that it's uncommon for GPUs, it's
definitely not for codecs and display engines.

Maxime

--uitctc2p333ggqzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkHPWQAKCRAnX84Zoj2+
duxcAX0X7gUdYVGGk8sIw/t/75URUn2L5jsx1bztYmSAMrIPZpJ7dy/qcltWYmgI
q0DvusYBf1GwSIDpuk/d4mHAtHlq5OHKP4OPgGrWsyOdD3IsotlmEl1GTuBDF6Eq
cHFRahQOCA==
=o8us
-----END PGP SIGNATURE-----

--uitctc2p333ggqzy--

