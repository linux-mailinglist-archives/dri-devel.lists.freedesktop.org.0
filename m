Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6517D2C46
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E349710E170;
	Mon, 23 Oct 2023 08:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7578810E16F;
 Mon, 23 Oct 2023 08:12:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507a98517f3so4076906e87.0; 
 Mon, 23 Oct 2023 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698048750; x=1698653550; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=P4emxNeW9kdked7j0IM7OPKoJHrt2GCIyosEaRbO7gI=;
 b=l4p+Itocj6DtJsg9yzYlcvNFos8KjbHFOu1Igl+dikq0hOOEUKhEVeD2SdsT+B3JoG
 p7VIrNFdzitENi/t04M/TPadhkq78KmCeOtiDns2QjaFnJPFG//YzSajLKj7rqNqNFC6
 FcMLWue+YZr9KrPeqGe1GStRsJ6MscMEE/Z+BlKHmBvIGFoH/uKgNIWwXWrCw9iiX6fI
 ZIp78OArO7X4pCCr7IFNO4UOJ6GbsG5lPQDC3kXgd4yWlsRQCS+/93U0Y0+VuZLJAeHX
 veYSd3XsjeuPvk0U7Z3/Q5BK57sLzhzLekaSQIzjH6tV1GUcfXcV/66RYKImHZSq2XvP
 BAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698048750; x=1698653550;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P4emxNeW9kdked7j0IM7OPKoJHrt2GCIyosEaRbO7gI=;
 b=SzrJGobNVzlx57eosArDtQ+qEycrI8p1SO1DLrxWoup+ZSjI16QF+71exeFsDPvbtY
 hp3ZM1t/i0EwEwt/BKHcJAtlFLFi4PLAxMOotj3eBE/ZiLxzJqpO7v5QORoAzCUzSH/R
 ZSG7NzOM+8LW5vKscL0zLoi2I0jJLhmzAs9qNBLnwJDaH0hrpdD0Gcp1Q60CwgrhEVXa
 +HcqnxxyL0KHQqeN6I0GpbDmkkhLlXPrC46W8QWN2rzxITYphRi3xn/Jwj6tqE7dlpVw
 ELlEtIigvY9HXqqKD02tzR7Zvc5qPbAjjs3apls5NaXK+RC54LVtvzyJV865dlQymIpj
 oxdw==
X-Gm-Message-State: AOJu0Yxt8CqOofX8S6bSxiKyhoz/SYMqAFsHpCxek8oG56pF2fNi5tHL
 FZNEzEJfOgzxt8gpSjovGKw=
X-Google-Smtp-Source: AGHT+IEeiowvibKUMHfuZ925eat58DP+Fv2n6n2O9zf7fa1GGETmh47m00t28Di6g35SxO43GX4L7Q==
X-Received: by 2002:ac2:5311:0:b0:507:a1e0:22f4 with SMTP id
 c17-20020ac25311000000b00507a1e022f4mr5181140lfh.29.1698048750202; 
 Mon, 23 Oct 2023 01:12:30 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 e9-20020a05651236c900b004ff973cb14esm1587065lfs.108.2023.10.23.01.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 01:12:29 -0700 (PDT)
Date: Mon, 23 Oct 2023 11:12:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231023111219.6e287958@eldfell>
In-Reply-To: <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qqd_W1sAF/Y7YaGl/gFKxlf";
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Hector Martin <marcan@marcan.st>,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qqd_W1sAF/Y7YaGl/gFKxlf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Oct 2023 11:23:28 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-10-20 10:57, Pekka Paalanen wrote:
> > On Fri, 20 Oct 2023 16:22:56 +0200
> > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >  =20
> >> Thanks for continuing to work on this!
> >>
> >> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote: =20
> >>> v2:
> >>>  - Update colorop visualizations to match reality (Sebastian, Alex Hu=
ng)
> >>>  - Updated wording (Pekka)
> >>>  - Change BYPASS wording to make it non-mandatory (Sebastian)
> >>>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
> >>>    section (Pekka)
> >>>  - Use PQ EOTF instead of its inverse in Pipeline Programming example=
 (Melissa)
> >>>  - Add "Driver Implementer's Guide" section (Pekka)
> >>>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pe=
kka)
> >>> =20
> >=20
> > ...
> >  =20
> >>> +Driver Forward/Backward Compatibility
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +As this is uAPI drivers can't regress color pipelines that have been
> >>> +introduced for a given HW generation. New HW generations are free to
> >>> +abandon color pipelines advertised for previous generations.
> >>> +Nevertheless, it can be beneficial to carry support for existing col=
or
> >>> +pipelines forward as those will likely already have support in DRM
> >>> +clients.
> >>> +
> >>> +Introducing new colorops to a pipeline is fine, as long as they can =
be
> >>> +disabled or are purely informational. DRM clients implementing suppo=
rt
> >>> +for the pipeline can always skip unknown properties as long as they =
can
> >>> +be confident that doing so will not cause unexpected results.
> >>> +
> >>> +If a new colorop doesn't fall into one of the above categories
> >>> +(bypassable or informational) the modified pipeline would be unusable
> >>> +for user space. In this case a new pipeline should be defined.   =20
> >>
> >> How can user space detect an informational element? Should we just add=
 a
> >> BYPASS property to informational elements, make it read only and set to
> >> true maybe? Or something more descriptive? =20
> >=20
> > Read-only BYPASS set to true would be fine by me, I guess.
> >  =20
>=20
> Don't you mean set to false? An informational element will always do
> something, so it can't be bypassed.

Yeah, this is why we need a definition. I understand "informational" to
not change pixel values in any way. Previously I had some weird idea
that scaling doesn't alter color, but of course it may.


> > I think we also need a definition of "informational".
> >=20
> > Counter-example 1: a colorop that represents a non-configurable =20
>=20
> Not sure what's "counter" for these examples?
>=20
> > YUV<->RGB conversion. Maybe it determines its operation from FB pixel
> > format. It cannot be set to bypass, it cannot be configured, and it
> > will alter color values.
> >=20
> > Counter-example 2: image size scaling colorop. It might not be
> > configurable, it is controlled by the plane CRTC_* and SRC_*
> > properties. You still need to understand what it does, so you can
> > arrange the scaling to work correctly. (Do not want to scale an image
> > with PQ-encoded values as Josh demonstrated in XDC.)
> >  =20
>=20
> IMO the position of the scaling operation is the thing that's important
> here as the color pipeline won't define scaling properties.
>=20
> > Counter-example 3: image sampling colorop. Averages FB originated color
> > values to produce a color sample. Again do not want to do this with
> > PQ-encoded values.
> >  =20
>=20
> Wouldn't this only happen during a scaling op?

There is certainly some overlap between examples 2 and 3. IIRC SRC_X/Y
coordinates can be fractional, which makes nearest vs. bilinear
sampling have a difference even if there is no scaling.

There is also the question of chroma siting with sub-sampled YUV. I
don't know how that actually works, or how it theoretically should work.


Thanks,
pq

--Sig_/qqd_W1sAF/Y7YaGl/gFKxlf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmU2KuMACgkQI1/ltBGq
qqe9sg//e+2tZwcGWLQ9z0wf1mod3a8u8/p+A5K26jyirflbuCs2PWiZzyrfMUAX
KU3DOs5Fn8GBjU8Kif4tG4pqwQhJdU/ymYq8yWHP2fcYdg3RVw/LHJaPi2W6wfHn
HH1001rUVcpEQrDsL+cVseezQwE3yDCik+cYFyBU8PvJvB6R5+TM95FEXfLBaDqE
QQg+HRxLkoViiXTfkfLeT0Afl9Q6JtaFgGGStLudIWlVF1QfKr6HdDm5ttylYVHF
44plzuWdWps6FXQtUG3plU0B6Y+5aDvvl8k3NjChbCFmEfLDEHN7rt6/9JUcG31q
eCLaflJAZkTCLbpDtRa3cHxxmJ50+EXlbAdOCa/Tx1Py8w4OFTdt4dvisgdhvZgk
FldYi9hqwYIx3b0RJ+ii/pilsK8glCTHrum4pWMK8WNDQIRSZaG8u1R5SfSBXdH3
+ZdEe7dGQh2nnp1tH04OX0O5VrpSvq18MHsMH8o9qRsw+gQOLjFvJYtggtrYT/1W
UvqE3BdZ2xCVFDEWZKgJp+nd/diXfuZGKcQNYn8iU/rhI4kj31RU9dAOK42UdIfe
SNC5akhkrqL9MhLasPuLatIf4v6yocKtTN7StqGT7QbvJTgoEpoKZKxattE2R+O3
i3xXgDq9ZxetVWEN/tgegko2tHyQqMQsmSFKOYqEd1RzK4UVbws=
=UB3z
-----END PGP SIGNATURE-----

--Sig_/qqd_W1sAF/Y7YaGl/gFKxlf--
