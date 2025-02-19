Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7013A3B2E1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 08:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A01F10E474;
	Wed, 19 Feb 2025 07:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YJmdXYM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B69F10E477
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 07:57:02 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-219f8263ae0so117391035ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739951821; x=1740556621; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P/kpZ0JFyS8K2bUvvNK9hIZS7U9RMBG2F3Uw3zx/60k=;
 b=YJmdXYM0uJWq6SP4awIV8IQaU/RHZ46tqS7bF7m5lyeQispQ2e3QDQ0/8RsAAqyJik
 RZzE7oarlseO4PF+bIzkj0Ripb31fr91KA2UdtXUer3mFlMr2pNLBDcsIaDhFmvwmOH4
 7C0QH+uqrfmcF0mTaQXLyTbtHoTCLoy/aYmHJOW+CVRiT2kXSpjIbGNSwpYsOxTyhzAr
 JG2OOJSepXnsNegnzudTrenUz9qTSGG/GflX9MH5euTM53ntdripqcKyXSI4fylDGTmf
 5s+9fz0PGzGh5lf2O084G2m8k3uNYTZ7TnIO76o+bxWkNaSNbz7aSUNy+25+V2alfvtO
 Vxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739951821; x=1740556621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/kpZ0JFyS8K2bUvvNK9hIZS7U9RMBG2F3Uw3zx/60k=;
 b=dam4+5PpUAed6A07tLGgMW61cxEHM64FznXIDFjbg1H0CLkf26Nr0tEVAQJm1MBFVq
 Dw12Qc9TC34ySogji/7se5kPdX+AOAcRvBV4fwo0KQHZiojfQrvmqY1+6JXswetmZggq
 ZybrW2y7xTdt17RtxoJUg3YHiH1SeViN3wSOX5ed9P2PEYKj2MDUGAGoJeFRZiQibLTE
 3r5HPvKA3k+wdfE4Ddq0XJx9we1O9et9jXl8mgB/Z4orcFnm0szSqdbUGn9hIk23sL9d
 9AxruTIQ1A3UHwZOpSf5/AQMTnvh6qQ5P8aDJTL5OtCSMEr/ngRu9YhjfXKUteArAW9D
 dpZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhYVURZ1gMEQv66FOPVd5pZ/PRib4WtsP4GNNTvNVGSti31QSXpjaOksePj6qlY9TvkJp9zwaXZNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkHEfPSAxzh1OnyKp+pHbilHEcybiAQI4uSVxJSKRo/UEdXYQY
 wAO25k3HNKSEq7ciEvcBR0FjNabB/iAxrZ09AA0zAmmflKksTCkL
X-Gm-Gg: ASbGnctoiqcSmNuPel5p/Szt9lfB8uX7oeZnmtgh4VaOTCrcxwijHpE5jnkmfq2JPKl
 fhpQ2Gmz2bG9+4KSTfk+vCSqcv9TufeYyMV0gG7gA65Tn3OY4NPnG8FjCuW4BK8y2pNK+3TwJ9A
 fR1I3GRzRVVVlhXW1y7W066xvD8JidU9980eHuRnlbmb9VWbbyo8g88nBC/dCTIihY9hRNqiDzI
 KWqxsywW6whclXgHFww58uEy8kTV5WgnxZ+Hmj7VgecIzS6TuKTHTUjsTtkQmDZqKhksLNTz0gk
 /WhEeS0UPdfw75k=
X-Google-Smtp-Source: AGHT+IEJD6274fxtcOpikxcjTZmPbe/QYievTKtzYG/3d2LzY4XIXg6MjLwRdaeB83HEkRnMk5cYhw==
X-Received: by 2002:a05:6a21:394c:b0:1ee:d7b1:38ad with SMTP id
 adf61e73a8af0-1eed7b139b5mr2915550637.0.1739951821365; 
 Tue, 18 Feb 2025 23:57:01 -0800 (PST)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242546177sm11328548b3a.5.2025.02.18.23.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 23:57:00 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 4BD094208F47; Wed, 19 Feb 2025 14:56:58 +0700 (WIB)
Date: Wed, 19 Feb 2025 14:56:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
Message-ID: <Z7WOym9fl8GNPJiO@archie.me>
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me>
 <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
 <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BToSCmPd5dm/qara"
Content-Disposition: inline
In-Reply-To: <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
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


--BToSCmPd5dm/qara
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 11:05:39PM +0530, Pranav Tyagi wrote:
> Hi,
>=20
> Just a gentle follow-up on this patch. It has been reviewed but hasn't
> been applied yet.

You may need to resend the patch, but with scripts/get_maintainer.pl
output Cc'ed so that DRM maintainers can be notified on the patch.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--BToSCmPd5dm/qara
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ7WOxQAKCRD2uYlJVVFO
ozkoAP0eKLrhmoKPcsU785IBYgu8CdHmCLy3XmrPIMibyJI/QgD/ZJDL9komfCvv
38f91wD0Ik059kbk8dCpCTrK/qTtIgA=
=qgWc
-----END PGP SIGNATURE-----

--BToSCmPd5dm/qara--
