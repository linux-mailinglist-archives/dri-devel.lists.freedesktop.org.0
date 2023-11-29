Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 576427FD3BC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 11:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548F810E45B;
	Wed, 29 Nov 2023 10:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAAD10E45B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 10:13:19 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50bba1dd05fso2536741e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 02:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701252797; x=1701857597; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=gCZTkTf5gNqH/rsoLk7etD6DwWJwR710k5LJwshNSuI=;
 b=b3d8k/tu006bXcg+iOKous/B7aUDAP1bSMHIhs1oEVHRqMrxHfNoBB19GjMqCiBSvG
 aeji+Nxvat4a9gybedzcEuHxzCvLtqbRDIRkIueaaI33lOK2SC2OjCdSEktOC+6TYdRj
 5Oot8RP46QRSeL9UmgB60gRPIjyfdNTvdlQFGQzaRPmoDcqcBK3ZDgJ0V0nnESsRy87L
 7fC3IZaoD2PDqfQnKgBlQDM5b14xO2owTtRq1CQIAfhk7kKSyppwhttV3dB4cV+KwOSV
 AUynfuIVjDjWGTCKOs1IOQipSfOA2ixHgkYRaKcUNEF3wjsE1tMkAwaDu9UCNUVyjEHG
 krDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701252797; x=1701857597;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gCZTkTf5gNqH/rsoLk7etD6DwWJwR710k5LJwshNSuI=;
 b=CaMfTfv3koOSJ3uao3FteFU2XbcNB+59xtdHpk+yTzUdfCnHajZdbdfXsPZu3fWgZG
 gTLWjCPJ19XxbvFBGG2IfBXohqObrekOyR/9N3XU3HPq/DZy5OksdjMWSrxGTZoOfT4T
 8W4lvnV9/XiJd7bJjKzwX1zWAilbE+26HsGZO0/Rw5G+mW9Oglu7hWZcjOsEKl8CtlHA
 OcV2ZvPqSGItclx8u2EsxvTp52m+M52SnRXKqUylYnz/1CQyVkYOID0lwDgCO3xSsYiN
 9j0tZe/ZQ6w22FD6Nt8QdIkRZNk/+Ap67p+Q7en/OnH2rTok6+DQlqSc2sOe5LPFPAjg
 DUjg==
X-Gm-Message-State: AOJu0YwJVEcHTadnrzeJKsoWzkmpDZfWmV/PyJO9/wAMYolRrPdZEvbW
 GXQtDS6vUT/Tjo7R7IkXNqY=
X-Google-Smtp-Source: AGHT+IEqoByK4nUUfepBkFUQYGj/+qIG7mkFMGeDo/wE/qhqodU6sLdPk1cmUua5FNVdwpoUj02mkQ==
X-Received: by 2002:a19:f60e:0:b0:507:cfbc:bf8d with SMTP id
 x14-20020a19f60e000000b00507cfbcbf8dmr11730596lfe.16.1701252797196; 
 Wed, 29 Nov 2023 02:13:17 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q9-20020a0565123a8900b0050abbda2c52sm2140292lfu.157.2023.11.29.02.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 02:13:16 -0800 (PST)
Date: Wed, 29 Nov 2023 12:12:59 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <20231129121259.47746996@eldfell>
In-Reply-To: <ZWXv1Oi_sH0BRWao@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qS7Sjt2IF0HAAZwDWVWm5Tz";
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qS7Sjt2IF0HAAZwDWVWm5Tz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Nov 2023 15:49:08 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> Should we perhaps start to use the (arguably hideous)
>  - void f(struct foo *bar)
>  + void f(struct foo bar[static 1])
> syntax to tell the compiler we don't accept NULL pointers?
>=20
> Hmm. Apparently that has the same problem as using any
> other kind of array syntax in the prototype. That is,
> the compiler demands to know the definition of 'struct foo'
> even though we're passing in effectively a pointer. Sigh.


__attribute__((nonnull)) ?


Thanks,
pq

--Sig_/qS7Sjt2IF0HAAZwDWVWm5Tz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVnDqsACgkQI1/ltBGq
qqde7A/+LfG5e8v6ABH2JqANkfijej4EDU9sSC3ZWBaUspi3UJEY1U0ZrDHgQd27
lLSoxs0tguK5Dtehhk/Mn4S1XmyDtRrKNB/2L/rNqilREqQa5ciQG9OFjpqnepS2
3kONuuooZchgnujkUjmgCg+L1X05peA166I3R9MkD4N3eqBH++XmohBaeUJDpUnN
n1OATmnWyX2df7p/qBpOhVaNT+zu8HCgsIZq//PDNTxQxmHP5CPqbxbxuBjcwFHt
bX1coZ602jx16CsrwaVYgVsHehXW0ru901OSPJ4flgpx/EyAjA4hHuVg+lJIZKqs
wQRR4p/QdyBRULqGl/+4VML92ccuHFCedEtbLyH+RXSTlM547Q9nwtUPw1lB7tYQ
Zx0BchNXyqKGnYvQUx5rTpJlTjwwq/IqkGkXnzpc3tIuj7hNTXEE1+3voPqNlnlU
J16Lt49s2r4J2ufAykGzgqC19HM5baSykl006GFCpzLrH6iETMejOymRxAFlnE8m
NdVHVD2YMPW9c21sJ+UjfbGrvF3H6E6MYZLDQLRnL44aHuYkCK6uSBfpgF1ugEqP
Tzqd5wGEhEeH6OmzYEiwWHBkNJdiGnA4yo1dzpLdgdGaEKHRfdcGePGcNlLdtNcI
AQZwl9NR+mk0zozfoa9HsXTUv+Su0TXpgD/prZ7PyqzSeM/SmkE=
=Sfat
-----END PGP SIGNATURE-----

--Sig_/qS7Sjt2IF0HAAZwDWVWm5Tz--
