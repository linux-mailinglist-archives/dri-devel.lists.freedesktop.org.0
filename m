Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37538C5C3C
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 22:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD91510E20A;
	Tue, 14 May 2024 20:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Cs6nU13e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6C710E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 20:22:31 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-de604ca3cfcso5988343276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1715718150; x=1716322950;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=d+VcjteYj9SNA9aGf0rBf0JG873t1FLnFV29qq/mXjI=;
 b=Cs6nU13eX4yvV0+32xN23jBYD16HhZrREvsmsBXD3qOrVCw6qrDDUABv6jHxMeZpQu
 Gem9OqYp5IqMdRK44BM8FdMii6yHmyimyO20b3+E4s8usLRIHnSx9frD7NnqGk7GsnxG
 vYi+B5rLgeO+EyBoPGV7jnU8floJ2wWYZ09qwaobcz/3l4MK8ee3i3RP29w/m5p2a7rJ
 mJMC7otAnzWsteayUYGvzFSz4Qwm/RvZkT7jiqSy/DaJ3QfVeJO44551DyWwGb9U1EY0
 Kn7ctIDPJ1cEvbCsEIKt7G4YiSahrAP8OJFEgRxKzdzLm4wFaXqIiJHBiN7pmC2F2CaH
 yr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715718150; x=1716322950;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d+VcjteYj9SNA9aGf0rBf0JG873t1FLnFV29qq/mXjI=;
 b=EdNtRnrAMaWnKwOIgfCNtz7gK0/HqL9Hp3XuyCT/yAOhmM47EgaBF0xEhDZVxv3gJr
 PsYFoCSQPUom7mdIkwjlrUVztfuS6H/ZJ1AQRyClk1b8didpptwS69+BOb+gk11uzxMD
 pGpdXqiUJ/LoNPCo1GPM1dKpTRsmoLyLAoSOD65vtGvKb2OgNiah6elABOXrfCZ/cvx2
 nh1J1lLjRqLZgAA6iugbzt8y3BIQ1gH0N1pdtGkZJXC3t6f5KA8BZSDhVeLp0LioMuN7
 EdYXfGh4qxkDi3TqCyQDT34y+Fhog4V1nWsNt+pmK5LQsR4umoqQEwZ2rRhNmO1FGAoW
 qn7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcrSTtFiaAgn1tyzxHBoPo7RHkeFt8VJAiy68Pk/NOL4pKVZ0DnARU8ivbR9k2YC4rqgk9efGx4WcHIIo/IdFfV62auu17Cqb88URxUiAa
X-Gm-Message-State: AOJu0YwzPnY9rr0F20xvBDTgyrSFc08txq2HsoHDTRBIVx/mptTzEN/r
 F9Sw2osH1zBAiWzXplMKO6gZkUw3xnjO1jpc4IuUubYdV6J5zkhrhoKtYA2+20M=
X-Google-Smtp-Source: AGHT+IGKbrei/hBF59KPSMuKtm8FOwgj1uruWeGRRZhnJ24IqE3wDufQHwIuC3NPjleyRye7SlHKsQ==
X-Received: by 2002:a25:a322:0:b0:de1:2843:9465 with SMTP id
 3f1490d57ef6-dee4f3089e4mr12934632276.30.1715718150626; 
 Tue, 14 May 2024 13:22:30 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6448::7a9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1ccd42sm56648326d6.91.2024.05.14.13.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:22:30 -0700 (PDT)
Message-ID: <432f336e6d4b0666cfbb431591624d0e1fefd773.camel@ndufresne.ca>
Subject: Re: [PATCH v7 7/8] media: imagination: Round to closest multiple
 for cropping region
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Devarsh Thakkar <devarsht@ti.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org,  linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com,  sebastian.fricke@collabora.com,
 dri-devel@lists.freedesktop.org,  laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com,  a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,  p-mantena@ti.com,
 vijayp@ti.com, andrzej.p@collabora.com, p.zabel@pengutronix.de, 
 airlied@gmail.com, daniel@ffwll.ch, akpm@linux-foundation.org, 
 gregkh@linuxfoundation.org, adobriyan@gmail.com, jani.nikula@intel.com
Date: Tue, 14 May 2024 16:22:28 -0400
In-Reply-To: <7e3ad816-6a2a-4e02-9b41-03a8562812ad@ti.com>
References: <20240509184001.4064820-1-devarsht@ti.com>
 <Zj447ePSnccbj76v@smile.fi.intel.com>
 <7e3ad816-6a2a-4e02-9b41-03a8562812ad@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
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

Le samedi 11 mai 2024 =C3=A0 22:38 +0530, Devarsh Thakkar a =C3=A9crit=C2=
=A0:
> Hi Andy,
>=20
> Thanks for the quick review.
> On 10/05/24 20:40, Andy Shevchenko wrote:
> > On Fri, May 10, 2024 at 12:10:01AM +0530, Devarsh Thakkar wrote:
> > > If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
> > > (V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
> > > multiple of requested value while updating the crop rectangle coordin=
ates.
> > >=20
> > > Use the rounding macro which gives preference to rounding down in cas=
e two
> > > nearest values (high and low) are possible to raise the probability o=
f
> > > cropping rectangle falling inside the bound region.
> >=20
> > This is arguable. How do we know that the bigger range is supported?
> > The safest side is to go smaller than bigger.
> >=20
>=20
> Yes and that's what the driver does when do when application passes
> V4L2_SEL_FLAG_LE while doing the selection. If application does not
> specify explicitly whether to round down or round up the cropping
> parameters requested by it (i.e app is neither passing V4L2_SEL_FLAG_LE
> nor V4L2_SEL_FLAG_GE flags), then it is preferred by driver to round the
> cropping parameters to nearest possible value by either rounding down or
> rounding up to align with hardware requirements.
>=20
> For e.g. If requested width for cropping region is 127 and HW requires
> width to be multiple of 64 then we would prefer to round it up to 128
> rather than rounding down to a more distant value (i.e. 64), but if
> requested cropping width is 129 then we would prefer to instead round it
> down to 128. But if requested cropping width is 160 then there are two
> nearest possible values 160 - 32 =3D 128 and 160 + 32 =3D 192 and in whic=
h
> case we prefer the smaller value as you suggested and that's why the
> driver uses round_closest_down.
>=20
> For any reason, if still the cropping rectangle falls beyond the bound
> region, then driver will return out of range error (-ERANGE) to
> application.

I would appreciate if this change was based on specification text, meaning
improving the next if that behaviour is undefined. We might not be able to =
fix
it everywhere, but we can recommend something.

Nicolas

>=20
> Regards
> Devarsh
>=20
>=20

