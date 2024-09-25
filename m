Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B169866DA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 21:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C90410E84B;
	Wed, 25 Sep 2024 19:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LhiSNyaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C40110E2F7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 19:27:38 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f75b13c2a8so2124191fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 12:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727292456; x=1727897256; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IOk2ilwD8/6jXKUXlPWg7dSTzszA+5KavKN4vZvX19c=;
 b=LhiSNyaVaIrJewlo/Pedjfd+ae71P6Mjc66za/dMwwWxz9ueOgOW3QIkt6M7QunYDi
 ixiuf6kqFxyj043gWkuSEShqM0iLqsYgva6OBVJJ2XZD8OlYIq9KPFgDYVO+lplpfyf9
 mYIDi9XtwuIEciUc946WUdjLLH7ufe4JfXdc+Pry2fdgiENfpte8he1IUx5HMxGGMm4S
 3hgc8A4tSwBf6fCu3h5r2wOLTCti/fWPPKG5b2KvhqpPleblmZYosN/jFBGJ2q7u/Eka
 QXcRtL5alet0zBZi95Xe7j/TocwvJwKyzaxY43oB7rFrZgq5CfHvwPkLvwmg7y5gJJcj
 3wdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727292456; x=1727897256;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOk2ilwD8/6jXKUXlPWg7dSTzszA+5KavKN4vZvX19c=;
 b=GPrkciD+bTWeLaP9hRSK94mfb0HYJhQRMA49LKIzcvalKq6Bzeh1UGIGa68jVadxZW
 WN/FUDouuJ8hm/f1oGQ+e5EB7nt1+U+nTXDgR8x92hSKQ3bqVXBPLR5xILRw+GwvQLY5
 s4khAckDbGLnh61mNbz+6NNiYTmdnTB3PqlWecoKYSkCjV7/n7SQYZUHROl8Ja+MgZnG
 N4YApxHb5yiZitcYQ2KbHSaz2qc7HTIBpTjgRdHTfLy8s3Hl1JIsUNaUgKCkLKLHBPp6
 hKKMDLPdxYWQWdFUZjs3KsC4GTzjaztq+Wc8+aVPeTHMc4nhW+AiILW9/5Yl0NYHju8J
 Fccw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOfWyY4YhvwMwnuAEoo0JXbfkjAEC6DDHiKClo79AUdtLf34PkLbEBL3xINadVPnNw2Dn6xPKIpSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3EzPU0QugkTyBVcq9rgj5T3UJOBih5q52W/Z7kOD+eQv6VL/u
 /cHJeT7fhICbZLrv8QgpwMHV+8J0Ddv6Q1TVwDvGMTXsKTxzDqhd
X-Google-Smtp-Source: AGHT+IE66I0+nQZftqv9oUzLNYnEcqlO1PGHsm46biJpo+iqRc4tUp2XOBMBWin5tG1frsXuusHxIw==
X-Received: by 2002:a2e:5152:0:b0:2f7:4e8c:9bfa with SMTP id
 38308e7fff4ca-2f91ca6eee3mr21232841fa.33.1727292456244; 
 Wed, 25 Sep 2024 12:27:36 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c78ce07056sm644232a12.43.2024.09.25.12.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 12:27:35 -0700 (PDT)
Date: Wed, 25 Sep 2024 21:27:34 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@lst.de>, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Set up device DMA parameters
Message-ID: <vpxqpczluuvlgbt2alzog3jidsfihfewvczhgligvxizncgsc6@iolgydqi6a5d>
References: <20240916133320.368620-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nb5sg25lsdaxq4y3"
Content-Disposition: inline
In-Reply-To: <20240916133320.368620-1-thierry.reding@gmail.com>
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


--nb5sg25lsdaxq4y3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 03:33:20PM GMT, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> In order to store device DMA parameters, the DMA framework depends on
> the device's dma_parms field to point at a valid memory location. Add
> backing storage for this in struct host1x_memory_context and point to
> it.
>=20
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/context.c | 1 +
>  include/linux/host1x.h       | 1 +
>  2 files changed, 2 insertions(+)

Applied.

Thierry

--nb5sg25lsdaxq4y3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb0ZCYACgkQ3SOs138+
s6EZUxAAg5OiC6juTO52hvoyWiI8zGhZBFgUS/+ks2riD+KRrrei73ixDui/q0vp
hv226dIE+u8qBKcagk8FYFDx8lJvOB3rT+K/cZ6PAqc6AvvwPq9RysWuFvHWNXpe
OEAfQCiDCl6PvYFv+I82SmA6LtmNS9C+NXRanjSqjKrclhVEo6oy0X3r9BdN4YAs
FKuG6o3RvYEKqEtfYGhQDdYW1Ysf+qWy6E/UW5raDFJsrBS0w9p7Fx/KxwSOko1O
fxRkDhzY7YL6JIjpsnPvVildkDZGkL1NHOtuZRIXIAUK9FG1H4vA2JjVPZfk8XeZ
QDaCZZpQ3tNO3AggLgtF1TL96Hkn2Y0qrnWRkkgMEloDG2PUao5QyKOHcnP/ZDTI
EKzA0CADDat6z06XB7nzJ3LMUE1volYINBeF6z9G+Y0/vSWlEMyv5oL946dHlf1Q
bJzMJ65VCy0celWF1NSkLya7Gcd3ldGUSuJLQbzs8tAhy4oZNhCEF3Z//vEkml6Q
h2tyo8ApK1l8ijsqCbB4iLVA7lLCvHWvOCvBXhKYc2uPV8UjCeqnNABwsj444kX9
YEX4ktAAoJXqLqwI8UGrAL1SP7rjxs+NqnstEP9VdOoB2qPxflI2Jg8ZxEVqvP1N
sMuVDP/hZ9MtLAhWbo3x7pItxTpEB03y2vHpfw8/zfsiRE1YgJU=
=Olm0
-----END PGP SIGNATURE-----

--nb5sg25lsdaxq4y3--
