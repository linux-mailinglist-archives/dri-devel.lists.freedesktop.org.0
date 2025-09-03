Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B9DB425AE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E61B10E8CE;
	Wed,  3 Sep 2025 15:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="crZ41H40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A325210E8CE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 15:38:11 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45cb5e5e71eso503165e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 08:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756913890; x=1757518690; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VPbwCRLjCS0JlRjDhk1ZHzDpInRFzDVXs0glfOj9Nmk=;
 b=crZ41H40GH3H579YJcSxOacXuKeWw1pP8LMBGjlpm4q21XeW92xIxVSmwpBWjmGflm
 F0yAl+l/q7pj4nZ5e35Ke/l1VSHNkF0uMutC0K9hTKS4aYX9MjzfoKgmb7Z+xbKgSvFe
 607yd0MUxtJ9CjP2M8RUSVstY7mN4Kzmr1Z74FWWfL44jx37oYz8iGktZS3n1/8rNHeK
 8RmV5jupEeCcb9U2c8NHQ9vOnDRW7gTVAEwawTX+mvEbIdLBSFrkcMApbeVYkIy0C3/f
 BDnVjswLagXyY77rHxZJ+X5gvlKzZg8b/9JR1Cmh4zsk/DX3uoLt4IRRkUYBwpg95aCy
 tfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756913890; x=1757518690;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPbwCRLjCS0JlRjDhk1ZHzDpInRFzDVXs0glfOj9Nmk=;
 b=eO74tN8AjeVkAS1ZIUOO6GUsIMx4hfxNB+TWCX8Fhd3l44uHPs3aSWr0kCCsZ7Cavx
 sQg3En7/JaOUkoYUY23oxnZcUgOukMT0zvikf3WoEPrZhxGoTYKzleb3l1EvSZqBtgah
 lJHgMG5esiwa4FpWevpJDnUNXm/S410kN7MONQa9DdIcPycI+4HhkwSTNG/zHfgyNPq6
 zyyazgewHT1WOxS0Q9x3WO2tHwovU+sd4g4XToeJdzdgJ6Tpe0vm+wWkCh4SclE8aDT3
 QaBlj84b+YlTknuC2F+69QqnGejLViyIOFvEQ3IQOda4rhzpIzdQYKcEdGqStUEOZZnA
 3M8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrh/mPy7jpGM5qASnHAtMETe/teB/QytR8PhtZ+lTPKFiyvVE9qqhUWZdtd5cNeZlpTwKMZj6kK94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8lYUk2JExAV1GJeKs/pxKkz+8P40UWLmyVjGY7V56UIa6TWoe
 KDS6ep7p71A0iHk+Ex2iHMRhSsyQK9ugJYZYqzKdnewhJ1hGGeDZa9zz
X-Gm-Gg: ASbGncsFGWtKg4aU6H1Avy9h/ZnA2acnCOVSswc+wMskl6SSPF2PX5wu+ewOiLNQyKd
 hKDHAqLjJ9BtOBEdik9dTK7KyRpUAq328EkYCdZg1l1fVpf6fWFTal0uy9CG7Ra2/qqvoTyS5La
 /YjhoEe03rXbCI3PlLjDowg5c361Ec2mjI2qCcj3lpjVcHYVOd3yVZzPO5NfVIHCx0/deEIbNmi
 h1xfM+UORzaBop4BkubehfV0aaiHbz9zNDXqjVFoIgwriKxGE//EzWfug4XCYBejOPzv41c+Rf2
 /jlPye+QcJ0EqSsoBlq4cxNtWO0fJ0EZMnFS4PTLPNj1nRbjUe9E8y2DM4MdKT44k6GfpWN8gFG
 sZSKlZYrR3VwpRjax3SbL6woxAQn7DBqj5rUCm4pQH+J/bI/YogfgSbjTwA9pQPz2u/g8F4v+DW
 xAhMVLr0VPKv7RvvNykIU=
X-Google-Smtp-Source: AGHT+IFJMszbSGSF1PbWonv1NoW4j1E7tepFW666Fw1sEE/F4ZJzmOwpg3R8c/5zqgWpxpRXy3A2Sg==
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id
 5b1f17b1804b1-45b934f6a56mr68840825e9.23.1756913889833; 
 Wed, 03 Sep 2025 08:38:09 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9c234b24sm59432145e9.16.2025.09.03.08.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 08:38:08 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:38:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
Message-ID: <e6twhwxi55eesb7xirei7wezzb77qjiji2mccgqlziisjzl3q5@3ny5e6lbgebz>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-5-thierry.reding@gmail.com>
 <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sulytsn4e2thgtl4"
Content-Disposition: inline
In-Reply-To: <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
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


--sulytsn4e2thgtl4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 03:37:45PM -0700, John Stultz wrote:
> On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Add a callback to struct dma_heap_ops that heap providers can implement
> > to show information about the state of the heap in debugfs. A top-level
> > directory named "dma_heap" is created in debugfs and individual files
> > will be named after the heaps.
> >
>=20
> I know its debugfs, but this feels a little loosey-goosey as an uAPI.

Well, the whole point of debugfs is that it's not really an ABI. Nothing
should ever rely on the presence of these files.

> Is there any expected format for the show function?
>=20
> What would other dmabuf heaps ideally export via this interface?

I've thought about this a bit and I'm not sure it makes sense to
standardize on this. I think on one hand having a list of buffers
exported by the dma-buf heap is probably the lowest common denominator,
but then there might be a bunch of other things that are very heap-
specific that some heap might want to export.

> Is there some consistent dma_heap-ish concept for it to justify it
> being under a dma_heap directory, and not just an independent debugfs
> file for the driver implementing the dmabuf heap?

Well, I think just the fact that it's a dma-heap would qualify its
corresponding debugfs to be in a well-known location. We could of course
pick some arbitrary location, but that's just a recipe for chaos because
then everybody puts these whereever they want. There's really no
standard place for driver-specific debugfs files to go, so putting it
into some "subsystem"-specific directory seems like the better option.

Thierry

--sulytsn4e2thgtl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi4YNsACgkQ3SOs138+
s6FLbg//VYHy8TOrGMpDWro/ULEXXUAldaCb7nmtSEpNIXvKqfV5j9D/dcMLpLtY
LC53YPVnMm9g5c6mZ0w7DfUU5q+qAwCe2mvhA+Fm3UaRF2jMKhD/5LG4rk7ELWsL
Xb3raJAlnNFO9AHgE7oEwGYjF8q94yEiAZHNO62j1kxJ00CpZCxyG2rie7iaTAMh
VToay43MFoIv9ulrESaonZk84vL4HzYJZIZXeIgjs+mS0BmFH5fxvCPerNuiG4gf
Z4N4cCDGWfJ+EYFuMZ3p2pbLivKlTqI3QdihV8BO13OMaADW7vmSPMdDzYSgQ/R9
KdwIIctBlRpiGYOJCPb83kZFsFXwU4Cvnfc3HJDTjwLwlbIrAFTlPnyhL9eWEeZD
oD4Jdnf/tHXH9tFJUEZ+cPA8mCHjMrnL3mTItfYILkvaGuZGRRdacy5fyICO0fbv
xB0k9rSgPfwlafKgaHj3wQD02D1qmGZqATxAVYXu/RT682hMAYX8JJS5ar64fQ35
esRjjoSdlzaVisao/gog2ThKdoPsThxcMXcM4nHHMfkd+wURKomTszYl8lZGew3Y
dzUR7jKgI/rPUUUpBD7D+cPzNy5p2JzoQMPoBtKMPOOq6tQ1BXYJgXZtfW8DO1T6
QgUM6P7kdw0Dce+0PdZOD3TvkpPucxyqZlLA13ZLCYeW8xZKwsk=
=6VMq
-----END PGP SIGNATURE-----

--sulytsn4e2thgtl4--
