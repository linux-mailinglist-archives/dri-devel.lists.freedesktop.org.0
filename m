Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4E5533740
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 09:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8542910FB72;
	Wed, 25 May 2022 07:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B540910FB72
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 07:17:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id g7so4115574lja.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 00:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=2BNWwm74xmmG3Z4OtfjXVgcybC+kX/wuCErShnBf+go=;
 b=jET/TEaXvyc1o9wA4HNlWlXzE0VCYrfb5qUbniEo55ot3aXl3Ln0wWWoLPWYOA3Qh0
 Jz+tELtgxDZ567LWdAovXR7OdtZNGBI1bTcPFAZyKwJcLzQIZzb8KIQObNdk0LBefMZ1
 /VOjp+q4mvG6o0Ymtbg0KtFCUbBTHGEot/Y+Xh/V7QHKaDO5hLFzyVrl/1dfheHAy78w
 6FiHD2/OrEis/AVY09mAx4fEdo22L+K/HNTmanijbdVCEpXUiw0HuzGzMSRywpSiljQ9
 Sx0+NMQ6EYRkb3c8szjgt5hBLok2BzLZ4QSzuWOX0jn6M+tY6EsXgGYUaxDytW9Jd18k
 vBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=2BNWwm74xmmG3Z4OtfjXVgcybC+kX/wuCErShnBf+go=;
 b=BEtPCKHtNC0oBWCSn8wjjkMxXbYOjGBRrzxHJO1sKU2HadTNXQyCssGDLoFMkG7Z0k
 jz3pwWgLIict9Qm0RITJwUBwJLHMP6WyLNr+a8DrS0xoLnVjEhaqktMLnlzlV5p50Ad7
 c+vxGKJJJkYnsprCaRDZithVcWCFtUjREPPlL3R2Z53of4r8f59/X8crfjgGqgT4sglD
 7XHbMXuCEy6yd2iXauYY1aeZM+syUPwgvNxRbjAHQBynfi0hCTwGIadAiSM1rHr0D7bO
 DcTs7dGSwA3bQj93Qhkk6/aKKxjisv1Nrvz/1SIgYceIkcEpzCx0BVGhRpVXt59xWmKI
 6sww==
X-Gm-Message-State: AOAM530a8lkpoeTSnfDlHx5bV9Ua/rk+3g1JniwIAWRQw+WD2ogdITEO
 hBQxupGflEih6m1MhdGT+Qs=
X-Google-Smtp-Source: ABdhPJwA5aNjCRFgJYuRjjI+Czx24y8eepNobMNV7Z5/pOn96mn8an38i8wwZ7q7fXEk0yl2vJDN/w==
X-Received: by 2002:a2e:95d7:0:b0:249:7117:b7ad with SMTP id
 y23-20020a2e95d7000000b002497117b7admr6871155ljh.85.1653463037663; 
 Wed, 25 May 2022 00:17:17 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w9-20020ac254a9000000b0047255d211c0sm2937017lfk.239.2022.05.25.00.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 00:17:17 -0700 (PDT)
Date: Wed, 25 May 2022 10:17:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <20220525101706.3e607514@eldfell>
In-Reply-To: <Y40sjQZk7WCHYqiIgIMlwqwdc329-6OzQvtggcXybRTILpeNyk7rwWg4nVr5yxQFg4V6N9LPv6jXaoLehWDUx5LXu9r72dW8MJMh6mBbFHg=@emersion.fr>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <d9c4b940-4a16-cd6f-2672-752a2678c32c@redhat.com>
 <Yoz9GisEO9M4KRPB@intel.com>
 <CADnq5_N9gLzLnmPa4K9+40wTfgyC5TN4sZsuaK6+011DAgMPPA@mail.gmail.com>
 <Y40sjQZk7WCHYqiIgIMlwqwdc329-6OzQvtggcXybRTILpeNyk7rwWg4nVr5yxQFg4V6N9LPv6jXaoLehWDUx5LXu9r72dW8MJMh6mBbFHg=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H9XmSAQUYaGo6wV9bRStqi8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/H9XmSAQUYaGo6wV9bRStqi8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 25 May 2022 06:04:44 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, May 25th, 2022 at 00:03, Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>=20
> > > Why would anyone want to run at 8bpc when they have a panel with
> > > higher color depth? So I think someone is going to be doing that
> > > modeset eventually anyway. =20
> >
> > We used to do something similar, but then got piles of bug reports
> > about the displays running at 30Hz rather than 60 so we changed it to
> > 8. It's hard to say what a user will prefer. =20
>=20
> "max bpc" is a maximum, ie. it shouldn't make a modeset fail, the kernel
> should automatically reduce the bpc if the link bandwidth is insufficient.
> So that sounds like there's an amdgpu bug here?

Yes, that's an amdgpu bug in my opinion too. A video mode is always
explicit about timings, while "max bpc" is just a max and not "use this
exactly", so I believe the explicit setting should win.

There is no "use this bpc exactly" KMS UAPI yet.


Thanks,
pq

--Sig_/H9XmSAQUYaGo6wV9bRStqi8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKN1/IACgkQI1/ltBGq
qqdqBBAAtS7LRjqEEzawv2r4pzhERJcnH9GOScLvDagMsb3kXAcy9NAvHy5Ep6gb
u/s3Dgqx5JQClm+vzuSa5L/GL2muYJ9+j5BZo4lffPt3BszQQYRL+PHCtTVOiJPl
l3OGGvYvejGKSka7MV3QmvOcjhHqxw0f2JZF7GN2eJbB8WIoJXp5tS3xnlTeOrjO
kpuS5ZGtJl9JO0nDF8Tw/4sD2IEEj2ZVbrXuKtmb8yE/g27QW1c/pp28MeQ0CBi4
/rUw53aRQn4nmeK4WVznRupvhFPwcQ8P2bdAudFNeUQPdkDu/scOl/g8NUT0z4Sm
YGxmb6a+EAkSS6/F7ujXsEiuDp5pb5KBpbxZMCc7AgHs2sbDAUrFfSMKFX0IQCqG
MO5c5vh39FPmZuLjnxpxW3KnDttUjCdhng2rojjSF0WretClFUWB8etNqtc2lcrx
vEMLbmubBjonhX+N9ZwU4Rb9MpRtGmSTPht6QIIGFZ59GPwAoGeO9JJrcKOyQvgU
q9MhjyZVZsYyyGvBuFBAdec02M4F8h0IJQ+Dtft9eigxOlmk2lYYkjSDiaVDlDmT
MNh0aRZ0MP1u0qZbvS55NyX1ISLCZ5IuuTNmsmWIowWVykdYxFlC2MztkQkvEFiq
rr9gA3KkQ4CONMT3Q7mczXff/SFbiyLa0XtxgaN/bW/XZkG9fng=
=bcYE
-----END PGP SIGNATURE-----

--Sig_/H9XmSAQUYaGo6wV9bRStqi8--
