Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD427D0D5C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF6C10E07E;
	Fri, 20 Oct 2023 10:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0F10E07E;
 Fri, 20 Oct 2023 10:37:04 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5079f3f3d7aso930295e87.1; 
 Fri, 20 Oct 2023 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697798222; x=1698403022; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=REs6mB5BcnxtLLTVTCnN4NPo9t4lbA9VyG6zp7z5Vz0=;
 b=V4q3x6jgdbC3fU0J1lJpk/iMpE2wRjmZwCdf1dXFZCMAYmegX9LAk2FcJagUzi0K+D
 cxGN1JJpgRvlc0slKr3Lyk7v/EDnZ0TToM4+TcmscF7eK/0jSi/2ulSTzseNMVmPPKYd
 RetAM7CPShlAE+FZyR2Mjw9nAPzXeMGGu81LUNlSrksk/lblG2tTl3EiNTsZQ1SJA1A3
 MG00xdQJW+S2GgQNOIBMnOhvwq7RSOBsJk/Envxi9/No8vO9+VE9YbF6EVJoWEP0YQvJ
 fZ9aiTtulzSPQ/zn/CFPe1w0I1bQ7pgffsYQiuJ/FErxT4C05Hz/CtmL8HYZos57kDTd
 sQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697798222; x=1698403022;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=REs6mB5BcnxtLLTVTCnN4NPo9t4lbA9VyG6zp7z5Vz0=;
 b=mnhv9S0ikdC1ULDBUVO/tLrCBHtxUwR/Qxkyrido7zu8ug3e/s0mu9W+lNsbrP5I8k
 MSgZhdznpCw8cFTKpJoZySEmIh3OCRrttwzElTbOsV7A2AsX7U3HIoK4ADinWiEH/4jZ
 JFMJ4BY3M/It9xGJIv5HoHhdeZfXsd3zS6EI/7QzROloHYDTnlNp4C4Vc+5zE8RcavVX
 hDHYduYPaHR0n/yoblpfo/O4Oe9e3LGH3IoA8IPkd96oH1MAf6IEbqFtlecmvj4tX474
 uRHjCr9P4du+YnPXqaJQSz3B7q8LLICsDbIB9bYy9tVEopv7OOTCLDcROKlNQKzG8g6w
 zguw==
X-Gm-Message-State: AOJu0Yxk0CDf/qk0S9j4kvbBqcpbDstxRJ5M0yDcT3FPAEv5NWtItfhX
 W7jbWMQAkjebmEcWn3A0w6E=
X-Google-Smtp-Source: AGHT+IEorN82xKkAfJk8+JbPINAxJ36nRET/z8kWlCRaK6aKueVRhoX80yXEx2eNOh8hkZzMmxBgQg==
X-Received: by 2002:a05:6512:3989:b0:507:b084:d6be with SMTP id
 j9-20020a056512398900b00507b084d6bemr1237958lfu.50.1697798222147; 
 Fri, 20 Oct 2023 03:37:02 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u8-20020ac258c8000000b004fe0fead9e2sm297929lfo.165.2023.10.20.03.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 03:37:01 -0700 (PDT)
Date: Fri, 20 Oct 2023 13:36:58 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20231020133658.4cff9f42@eldfell>
In-Reply-To: <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CU9hdsSY276VeV21FC_8Fc4";
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
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/CU9hdsSY276VeV21FC_8Fc4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Oct 2023 10:56:40 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-10-10 12:13, Melissa Wen wrote:
> > O 09/08, Harry Wentland wrote: =20
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>

...

> > Also, with this new plane API in place, I understand that we will
> > already need think on how to deal with the mixing between old drm color
> > properties (color encoding and color range) and these new way of setting
> > plane color properties. IIUC, Pekka asked a related question about it
> > when talking about CRTC automatic RGB->YUV (?)=20
> >  =20
>=20
> We'll still need to confirm whether we'll want to deprecate these
> existing properties. If we do that we'd want a client prop. Things
> should still work without deprecating them, if drivers just pick up
> after the initial encoding and range CSC.
>=20
> But realistically it might be better to deprecate them and turn them
> into explicit colorops.

The existing properties would need to be explicitly reflected in the
new pipelines anyway, otherwise there would always be doubt at which
point of a pipeline the old properties apply, and they might even
need to change positions between pipelines.

I think it is simply easier to just hide all old color related
properties when userspace sets the client-cap to enable pipelines. The
problem is to make sure to hide all old properties on all drivers that
support the client-cap.

As a pipeline must be complete (describe everything that happens to
pixel values), it's going to be a flag day per driver.

Btw. the plane FB YUV->RGB conversion needs a colorop in every pipeline
as well. Maybe it's purely informative and non-configurable, keyed by
FB pixel format, but still.

We also need a colorop to represent sample filtering, e.g. bilinear,
like I think Sebastian may have mentioned in the past. Everything
before the sample filter happens "per tap" as Joshua Ashton put it, and
everything after it happens on the sample that was computed as a
weighted average of the filter tap inputs (texels).

There could be colorops other than sample filtering that operate on
more than one sample at a time, like blur or sharpness. There could
even be colorops that change the image size like adding padding that
the following colorop hardware requires, and then yet another colorop
that clips that padding away. For an example, see
https://lists.freedesktop.org/archives/dri-devel/2023-October/427015.html

If that padding and its color can affect the pipeline results of the
pixels near the padding (e.g. some convolution is applied with them,
which may be the reason why padding is necessary to begin with), then
it would be best to model it.


Thanks,
pq

--Sig_/CU9hdsSY276VeV21FC_8Fc4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUyWEoACgkQI1/ltBGq
qqfPWA/8DNNq202JDHLazj9NpPpGW9wg+itXGv6iQHkLVc+WrNJBbk5hahrzp6lG
tyMgksL16BTtvSeDkp292rn29/yj/Z0+xFcZSRYwPgjCL78vHJnD6u2C/3GrM2I6
5sV0Dtq+0tvV3Dbk1iOWngYiHHqsuWR1eha8yRDj7bYiM1/u5MWqf5oJWl0noe2Y
ZDJkwzN8lAs8pqL4q7SAELopKyjZKFH1odBga/HX534iEKHvmrVvA1FpxVzX1vSe
d5aLexnve1otdZz22Trg8qnZC4o+slHAGKwRQYUZnfEHZBrslDyRPBppFkgmVwwO
Gc+WoiLOLKlYNLBtxlTpvJlx4f/RC0XULn+jK9JnKccD2gBgr/iWaE+TNTUSUPCH
gEdivc6GCJF4bjpIdgt1OWBnbBrzWtPjA7Dcu1HgnH4ygb8ljSLW+DPDZ9WT2WBl
CNbsfSKtWy09hei5AWP8PR8wmfKHQGxNSzi8NSUcgBZXicejMah9Ux5ble/JscpI
0ihr1P3AjA0zXm3hyi8JNlpgdZTOUogTypbxsMFJhDTVFZsL2yrl8n2JYOKeGTKX
btITohQLz267ipAK0TsSPXiTsZymK82oBN5RUdurGlLpRpPOMyN7ypJR39Alfjak
tznWtVqemzf0IwsyqC7E97bBeOjVsdKlBELlWydczH6h9ohS5jU=
=R9KS
-----END PGP SIGNATURE-----

--Sig_/CU9hdsSY276VeV21FC_8Fc4--
