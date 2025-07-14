Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3634BB03B63
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0811610E1FC;
	Mon, 14 Jul 2025 09:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g34F/pqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69C310E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:53:33 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so5436903e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752486812; x=1753091612; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9X61o1toElFjW4EGc0qCV1uxCE7n857B9KnQrGKNsPQ=;
 b=g34F/pqpIDygqITv4RArrPFvC48JF07Z+ZmSnTqGf8AotwE6iDflCzvadE9ZbQ51Wx
 PA+wlW4C2O9z0O9ZZAqc0OyxRc1d9v2OhCbKRURzz6LA76Vnvt6hUFW8LNxcpSmgjjfA
 JFhdaAS8mC4soPhuf2CIMu3E3d729AWECuBsbSvYJWyRqqKhK0yoleGRVzaaPpXMwC0H
 Qla4dPdYhHGfk4c5Rb6Z4OSgzj9ShrWoo+K6Pqfe0XB+qA6Ca5yp/RPYRs22YcnUj+xo
 SD12zL7hdui2TZiE4cQ05MS6XmduCGVnuVew2Y2uyiKN6syjoecNQJF+FFfb44tqqyhc
 221A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752486812; x=1753091612;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9X61o1toElFjW4EGc0qCV1uxCE7n857B9KnQrGKNsPQ=;
 b=UKDOmfnuYevd/Sm7K7ZYT1rqG2YWTqpa/3uYrv0o4Dx7BF1WIA/WSedvAELajPGr1i
 zz6S/Ri95VofidzlHfRvH76lPwREfhraeoUyZxgrjWnNI/ElWyAlK4xtw6OWAjKGiPay
 yiEXpchDlQUY/rHi2g/29qE6bkNHrFUf3RydORR67hqsBe3ZLJFB+DyFFWX2dkiQMC6i
 bdBxtXQJ2m5yPs3wjTAM2+JGrCSMwck3srC1KrucLd5SIlO//b5s93X65GAtbQEs8Vr+
 ssPSywzGy8w//4MqJnZo2vc/Oy1azMJQioIK5OjsKNfOpwb5yXEsdAxnNcSLJ7KASVMX
 6yyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFKngbS92qSDMiFTq0dEKcRw3HLY6bVcnBJ+1VpOexyuOx4OuQn6//rwRSRMwkOlbBeeeBS99a2zo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmgsGNNpgPxwuTBK6wrVa/5XhrEznpgR2gOfOuNc1J6n6+0Ny3
 8UHlKSdhuuWqLz1CE6NzxPcKOe5TIi2cgNTeZch+okFbfKRReOfBhYEt
X-Gm-Gg: ASbGnct7YaX1oNhpLyToG1v2yMr+Z0HDqnYILc1o1r12h5+W50U278IPSB+l47gcFsp
 rwdCvCnVlxXotOM12d9tghHcuafveWUd2pIkrsiL4/UOm8rwSoLRPhzFeR4fnXloR1aZ7vIn56H
 Bh2opjoXF16+Zm+b9ka7JrwvncMbgeFOwLXPJaEkFUle102qo7iWhu3H2WUGqi1afzcl/DRfzfn
 zIuruKSgYzhtv+li8UHfvGsGQ8OLLomWWRAU8iajMYGojPNGf1cx+31WZf+p3bVcViN3q/Vw7zR
 u4mTUBnuUKShtq5V695qfJ5gL9pwIfzeYWkWcyySr1NvpXw2kVI2domJezh6yYZUYA86Tte1b8p
 gXieTd26cwmFWX04nqblnrabFSfQBlN5++Is8Fi02FUUaT4wibF3hBWH6d2IXIn0+NS7MKw==
X-Google-Smtp-Source: AGHT+IGV0OnVPhct9hOpTRxWG6mjtuDaMUJXFWk9S5aL02iJNxqSWm0eRCQ5NNbKKfS1/BupTCWSXQ==
X-Received: by 2002:a05:6512:6cd:b0:553:3892:5ec6 with SMTP id
 2adb3069b0e04-55a0463a2dcmr3780494e87.35.1752486811517; 
 Mon, 14 Jul 2025 02:53:31 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c9d32absm1894249e87.118.2025.07.14.02.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 02:53:30 -0700 (PDT)
Date: Mon, 14 Jul 2025 11:53:28 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/format-helper: introduce
 drm_fb_xrgb8888_to_gray2()
Message-ID: <aHTTmORf7aoPxZdu@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
 <20250714-st7571-format-v1-4-a27e5112baff@gmail.com>
 <bc37c3e9-0e58-4d63-b271-d2b026adf3a0@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tWh33p2Y97tbbhG9"
Content-Disposition: inline
In-Reply-To: <bc37c3e9-0e58-4d63-b271-d2b026adf3a0@suse.de>
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


--tWh33p2Y97tbbhG9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,


Thank you for your comments!

On Mon, Jul 14, 2025 at 11:13:04AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 14.07.25 um 10:04 schrieb Marcus Folkesson:
> > drm_fb_xrgb8888_to_gray2() works like and share much code with
> > drm_fb_xrgb8888_to_mono(), but converts XRGB8888 to
> > 2bit grayscale instead.
> >=20
> > It uses drm_fb_xrgb8888_to_gray8() to convert the pixels to gray8 as an
> > intermediate step before converting to gray2.
>=20
> Please don't share code here.=A0 This needs a serious rework anyway. The =
best
> thing for now is to add a new, separate function for _gray2().

I see. I will instead add a separate _gray() function, even though it
will look very similar to _mono.

>=20
> Best regards
> Thomas

Best regards,
Marcus Folkesson

--tWh33p2Y97tbbhG9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmh005QACgkQiIBOb1ld
UjKZ4BAAw/2UefV8Jq9HhLvLy3L1LSnhR0WRTHG0NoEnPSSYqjm3g9FIu8TBZTam
UXsOv3u5txdvZHncT0OGbDk/s9FmcwShRunWCs4NA1+qFFb3ojT5bQwY3VD0Q5CT
MplaW9hXNcjrG1oCIzRvY2BubEJqOtSundpy0yhhRFFchQh6i6OBhXL7Nb0Z2cki
VuBbC4FXBdRUd1pKmApaH9/z2jAqRpfFCvWDbGciBcwajkol9pktjm2GQJz+NP1D
6DY3Pfh93uc3eqJgLQwJS7QfTRV5uYdYUWeXPwHoEs1KZQBukCs1/LPGC2DVpepD
lNELZnnAklnQ0e9J7qSyQR1bPySSvU1aYA6vg6NwXUrIE9DbsebRyTpDcv3ad79P
OMAkYPg9j8xvSaa9Va3nysgMhV/7I0UoZFTFtNMpPzmHLQiKEG09CAGdAmRWlivB
TN2SnV26rmYemhofNnhi437VYqoKZT91om5Au0RbPQEDhVJ1HgQNc4G8nSsnjlcZ
AJGrd7qNBi7ia07MTwezV92eEsmXuZNPrZnb8WkDzjFbg9MOiTq7AD5E8wM/6JaM
B+SMvo/nqAz0HdEYNZW/5h9iROnzXG9TYFmhLI01Sp5HCzrVo0XR6h8wEDlD/QGe
Vfy70LhlVTZlWOWdLIdmBsaSi/sGacB1aQTs+jduTxPj83nZm2w=
=zzGr
-----END PGP SIGNATURE-----

--tWh33p2Y97tbbhG9--
