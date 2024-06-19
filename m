Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A0590EB50
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 14:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E0B10E073;
	Wed, 19 Jun 2024 12:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fYkzG+7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366510E073
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 12:42:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4217990f997so47232815e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 05:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718800946; x=1719405746; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SByv/3h9r3a4Qn4WiJyJL8zDWTb94P7sc74/rI4gJdE=;
 b=fYkzG+7oRJCLnD4aW4PBH7N45loHZjTWmjboldWflgjffNljexT6aJj0xgdrJBYMlg
 XcivwK5pf/Fs6VwLxcHh7Ic+jdZ845EM0iIS8O/HPInjcW3Wlb26uuxOd/S76C/eMkPx
 cOaPFNr+NwNdT7R2C3r4gWyhiTfqI5t6vUcsospiDG/MNqWWpGWP1Y6Cicr0ojd6olZ1
 Zqs6gdOc3Nkto7gZsiU3QJeGV25SlZMqDbMdqCmOhT3b158J5AF0opcG6ncwjofOg67C
 891rwi2eTixnCq1dC7kirhBxgV2WrhNLNQ/led50WpCsc1GlROCcolBl3ZrxDMm4SPst
 7jhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718800946; x=1719405746;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SByv/3h9r3a4Qn4WiJyJL8zDWTb94P7sc74/rI4gJdE=;
 b=OMavWjhz0GeY1012KfsyiHU7QpJ2qVAbxnADb5kZRFnGAj0L4a+ECm6cDZuFKKCurn
 cozUujVBdJfY4HP3zmuS29iC/ITeh5w6Gb8ZwJsu24lkzlzTWoJXfuz4jymgPeV+Al8z
 c7hmPWbu77depxo26Io9yim3yh921p/8rXw37EfJxuNiBALU/1Rw6fU3+HANMAJKXpaF
 6N/evjMO6wpPSdFrzrOrzDxEQuFnc+GmvUySZk8VhCoTRbSjRKtEBbgNFp6rHEbBOcKW
 9VfhIiNZpDYHj1ZCDIvYah7oO+icUmpkGsdICSNL+Ypss+3ShaqcWT+FT6W+P/VgkAwD
 Zudw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULO8LFXdLBTaBnqXbEdWkK/2zG7y10Xjx6Ud9iy5y7yJXF/CXW+DfLY0E+IloMXsOvAcod1A3AxEX06Vto5BjJiHd4ll9C3toYLMuMhjWb
X-Gm-Message-State: AOJu0YzF5yhqY1Bv/IPvgrOEpwuyQbzJwCQz4+nw2yStt71mkLbMa012
 WCWr7BxAfcI4kv6buuhvCKsHAUCD6ynowdMJBlqfyuI3XS7DArNL
X-Google-Smtp-Source: AGHT+IF/Ojl1lCzIwbb45P/jSm86hTqAzckOlwd+zvudCih8xPEeyV/X1b+GBHx7mkaxSTjUHPDwzQ==
X-Received: by 2002:a5d:5259:0:b0:35f:1f13:9638 with SMTP id
 ffacd0b85a97d-36317898472mr1843020f8f.28.1718800945924; 
 Wed, 19 Jun 2024 05:42:25 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6?
 ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104b8bsm17125682f8f.105.2024.06.19.05.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 05:42:25 -0700 (PDT)
Message-ID: <412eb0f294b4bdef69b0d988e8f1c8a36c29d22e.camel@gmail.com>
Subject: Re: [v11 3/7] iio: core: Add new DMABUF interface infrastructure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Markus Elfring
 <Markus.Elfring@web.de>,  lkp@intel.com, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  linux-iio@vger.kernel.org,
 dmaengine@vger.kernel.org,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap
 <rdunlap@infradead.org>
Date: Wed, 19 Jun 2024 14:42:24 +0200
In-Reply-To: <15edbedcac80961ec9b7834041e54143657cd48b.camel@crapouillou.net>
References: <202406191014.9JAzwRV6-lkp@intel.com>
 <a4dd1d73-5af3-4d3d-8c0f-92dc439fa119@web.de>
 <d452ecc4fc703a1f98aa4f243c6ded7fbfe54b0e.camel@crapouillou.net>
 <cbcfb64a-e5c2-41a7-8847-227d4f6872de@web.de>
 <e948cd137da8e4f97bfbf7ef68a5450476aeee0c.camel@crapouillou.net>
 <41fa9904-28a8-46fa-bf2a-014875409b83@web.de>
 <15edbedcac80961ec9b7834041e54143657cd48b.camel@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
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

On Wed, 2024-06-19 at 14:21 +0200, Paul Cercueil wrote:
> Le mercredi 19 juin 2024 =C3=A0 13:56 +0200, Markus Elfring a =C3=A9crit=
=C2=A0:
> > =E2=80=A6
> > > https://lore.kernel.org/linux-iio/219abc43b4fdd4a13b307ed2efaa0e6869e=
68e3f.camel@gmail.com/T/#eefd360069c4261aec9621fafde30924706571c94
> > >=20
> > > (and responses below)
> > >=20
> > > It's more nuanced than I remembered.
> > =E2=80=A6
> >=20
> >=20
> > > > * Will the desire grow for further collateral evolution according
> > > > to
> > > > =C2=A0 affected software components?
> > >=20
> > > Not sure what you mean by that.
> >=20
> > Advanced programming interfaces were added a while ago.
> >=20
> > Example:
> > https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/cleanup=
.h#L8
> >=20
> > Corresponding attempts for increasing API usage need to adapt to
> > remaining change reluctance,
> > don't they?
>=20
> Sure, I guess.
>=20
> But that does not change the fact that I cannot use cleanup.h magic in
> this patchset, yet, as the required changes would have to be done in a
> separate one.
>=20
>=20
Not to speak on the added churn in doing that now. This is already v11 and
complicated enough for us to add another dependency.

Moreover, yes, cleanup stuff is very nice but if some interface/API does no=
t support
it, it's not up to the developer using that interface/API on some other pat=
ch series
to add support for it.

- Nuno S=C3=A1

