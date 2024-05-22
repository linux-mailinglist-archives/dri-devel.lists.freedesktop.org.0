Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A08CC238
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 15:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D21A10E1B8;
	Wed, 22 May 2024 13:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eMXd6peJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A67810E1B8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 13:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716384896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dUqK+C+8pYfPJIKtQMFJE42yDM9CCMGY3faQLsz8g6w=;
 b=eMXd6peJ8uAJbBm8BoOMuw+XDpZ2u38VG+f7XJ4LW+WZbwxOq4B0ewWuJCePFzRXIl8o38
 Ox3KEq3BvC6U91clMb+RSpvbuDqUsJnK8hQfv7M7iLevx/UeYe34Q8mx4sLKoiVvgGpR/d
 VgMnji3cQNlUZ+QrdyUpbGqq96fXyeM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-9FCDYphmNH-ambzwuf6mKw-1; Wed, 22 May 2024 09:34:55 -0400
X-MC-Unique: 9FCDYphmNH-ambzwuf6mKw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-354e233a2b3so320748f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 06:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716384894; x=1716989694;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUqK+C+8pYfPJIKtQMFJE42yDM9CCMGY3faQLsz8g6w=;
 b=Z6NbonR5retIJa37FUbEQc+xl8SH+6tBAl+H3hH4D4WrnljPsmLc5hzgtWjXd4dO5H
 4dt6GgxSFAnahul1f4ilksfRK9ZQhKGQSC3GexP/oIgVd4HFGnFMBwXmuWjOG+FPw7+f
 wtNTP+1+5yAGPvCYlTapEaymUF6tLiJvmL5yUlyAx4S6NGpRbD9RXVz4nW4cK2rlHpwn
 KG8N2lqJy9XM6kRuA140/Dl+HDOIiDUU36jLZqA7cChJbM7jMOm5T1N4fQW8gKVxGRNu
 BjR+0R7K8V3+EOsUQhkOkAq0Y5QjWcyAuFng1Eqi+g8fnA7DADt6XSPeGjOR8m3Qq01V
 ES9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdlSFG2x5GPHOSEYRKPWCj2JIElooD4feKQq1vOa6+8b0EK9tPZKJGJB2aIm6ap5m45zuKhhep9rQoW1iQtaIOjRaTe46F8kthJcqIA5a7
X-Gm-Message-State: AOJu0Yym48GHNRHI6athVjZC2qXxykFYG1Egem9amymVrxeZZtouIvPs
 fvukZayqBLwOKl/c1NTftRm+dGlvA9NpFtEbaljOiZ3Ot/Kn3385HDNyI73UN60lzuJD59gu4w9
 BObDHFRlb9RiSnuOwWKQDNrN94rovyybs5cySPtcjtOMSUtM08zC9isYC3CibZ18tIQ==
X-Received: by 2002:a05:6000:b8a:b0:34b:e446:3d4 with SMTP id
 ffacd0b85a97d-354d8da39demr1439952f8f.58.1716384893875; 
 Wed, 22 May 2024 06:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErtdZkkoK6JkxFwy4LNegEoex81yx9NccIdCSNk/jLtIVySlgXMJi/3cvC6sJfv/m8nqQrUw==
X-Received: by 2002:a05:6000:b8a:b0:34b:e446:3d4 with SMTP id
 ffacd0b85a97d-354d8da39demr1439928f8f.58.1716384893361; 
 Wed, 22 May 2024 06:34:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351b55b4655sm27866245f8f.76.2024.05.22.06.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 06:34:53 -0700 (PDT)
Date: Wed, 22 May 2024 15:34:52 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>, 
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240522-thankful-cow-of-freedom-f0cbf8@houat>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hxnhtv33zytmu6lb"
Content-Disposition: inline
In-Reply-To: <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
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


--hxnhtv33zytmu6lb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 06, 2024 at 03:38:24PM GMT, Daniel Vetter wrote:
> On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> > > Hi dma-buf maintainers, et.al.,
> > >=20
> > > Various people have been working on making complex/MIPI cameras work =
OOTB
> > > with mainline Linux kernels and an opensource userspace stack.
> > >=20
> > > The generic solution adds a software ISP (for Debayering and 3A) to
> > > libcamera. Libcamera's API guarantees that buffers handed to applicat=
ions
> > > using it are dma-bufs so that these can be passed to e.g. a video enc=
oder.
> > >=20
> > > In order to meet this API guarantee the libcamera software ISP alloca=
tes
> > > dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> > > the Fedora COPR repo for the PoC of this:
> > > https://hansdegoede.dreamwidth.org/28153.html
> >=20
> > For the record, we're also considering using them for ARM KMS devices,
> > so it would be better if the solution wasn't only considering v4l2
> > devices.
> >=20
> > > I have added a simple udev rule to give physically present users acce=
ss
> > > to the dma_heap-s:
> > >=20
> > > KERNEL=3D=3D"system", SUBSYSTEM=3D=3D"dma_heap", TAG+=3D"uaccess"
> > >=20
> > > (and on Rasperry Pi devices any users in the video group get access)
> > >=20
> > > This was just a quick fix for the PoC. Now that we are ready to move =
out
> > > of the PoC phase and start actually integrating this into distributio=
ns
> > > the question becomes if this is an acceptable solution; or if we need=
 some
> > > other way to deal with this ?
> > >=20
> > > Specifically the question is if this will have any negative security
> > > implications? I can certainly see this being used to do some sort of
> > > denial of service attack on the system (1). This is especially true f=
or
> > > the cma heap which generally speaking is a limited resource.
> >=20
> > There's plenty of other ways to exhaust CMA, like allocating too much
> > KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> > differently than those if it's part of our threat model.
>=20
> So generally for an arm soc where your display needs cma, your render node
> doesn't. And user applications only have access to the later, while only
> the compositor gets a kms fd through logind. At least in drm aside from
> vc4 there's really no render driver that just gives you access to cma and
> allows you to exhaust that, you need to be a compositor with drm master
> access to the display.
>=20
> Which means we're mostly protected against bad applications, and that's
> not a threat the "user physically sits in front of the machine accounts
> for", and which giving cma access to everyone would open up. And with
> flathub/snaps/... this is very much an issue.
>=20
> So you need more, either:
>=20
> - cgroups limits on dma-buf and dma-buf heaps. This has been bikeshedded
>   for years and is just not really moving.

For reference, are you talking about:

https://lore.kernel.org/r/20220502231944.3891435-1-tjmercier@google.com

Or has there been a new version of that recently?

Maxime

--hxnhtv33zytmu6lb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZk30ewAKCRAnX84Zoj2+
draWAYDLJIiS8Msi/y+wAUwHnzf1kXf7kVHqMhUIoYE8ndNmYlwqBzACVvj3PUVB
N0AgXyoBfioOGDi7CM19X5rtjvPyTVNdo3UuTQN/8N35V28aULcBS8FlUqHm1UCO
jZ9Oi4jvXA==
=rT0Y
-----END PGP SIGNATURE-----

--hxnhtv33zytmu6lb--

