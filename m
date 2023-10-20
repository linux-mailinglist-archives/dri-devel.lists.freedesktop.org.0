Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56A17D11F2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 16:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A731F10E5BB;
	Fri, 20 Oct 2023 14:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5B810E0F3;
 Fri, 20 Oct 2023 14:57:18 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507975d34e8so1309724e87.1; 
 Fri, 20 Oct 2023 07:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697813837; x=1698418637; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=aQCdU2HRUSXRlLXk2M1v3tfh3DgY+A6XhhMAKECk5Qw=;
 b=Wfpz1Ay55kecFiBQZNkiWHDp03aIZgYNOXIThc1cBgJ7zJKksMuG4D6LKA3DCGlyMU
 WVVsBZRyGyNaSkrFIdkEeSoI2ZejqAg9S2J15llsfgZ+76VzHL0tKxuv7yAcF1a/GccM
 b79Lp/k0wPEZooLZzbAM19WJqmNWcKhxjyS2/OasH1//zUxzjuZVP0ETpR0wXWAkV26u
 9j05gD9jHX8TXOj4bmGMRepZZAg/3b6VXwng9qA3BPnxFNPyXqjsu0OVlCXbpMVrU34I
 4x0XCZWtlJW43Unux/GltAtbsbUytXLbGl9+xWbo3/t+oXIj/5HvBptHqAvpSx1n3jPP
 AHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697813837; x=1698418637;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aQCdU2HRUSXRlLXk2M1v3tfh3DgY+A6XhhMAKECk5Qw=;
 b=JQ/rp1pPeZniw9FJQnJZPywTxR7IOByaaPbC4JXBK/xA/6luYRt+QPaXEdBsOfbo+u
 KmWDGTlYBPDy8BkNC3AIV9vQzi+GTs7YjDgx1MEbIlUer9F7wdCMbIqu0u+D2Hv2VIeR
 oHUsO3IhpGuVjBH/iBWZsWmsN4hAqxachnlg1XwmKC8tmjgfc1D6vLGhn1dfg1SgdHBs
 SgYPI8K4M7Tw2+v3cImCfwAxZNpP//G8sDDT3OkZrXGOtwIokdU+RYdvC/4/nCwIWv3+
 /hSwxDphywAI2iMQaedfeEm1HtbgLNOcOflcZUyxrD/kc2OYH9GgRRSSFLFZSKDxAu8q
 7xuw==
X-Gm-Message-State: AOJu0YwGWkWnfWePeQwuqKFzWYCCKL7GauCwQNVThK0XgwwIIZR6CK3H
 dBFkXdokqr7WtoZ2/dsykps=
X-Google-Smtp-Source: AGHT+IEVU8yw3ovt9FlbXR/V2TZUJ56KERftRNoZo8N64rXVl0bP+OUnNRpSWR5PY4oYNWuU+fp9Bg==
X-Received: by 2002:ac2:4ec6:0:b0:507:9787:6773 with SMTP id
 p6-20020ac24ec6000000b0050797876773mr1395217lfr.36.1697813836496; 
 Fri, 20 Oct 2023 07:57:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p26-20020ac246da000000b0050799f7cd6esm395902lfo.208.2023.10.20.07.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 07:57:15 -0700 (PDT)
Date: Fri, 20 Oct 2023 17:57:03 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231020175703.09cd2578@eldfell>
In-Reply-To: <20231020142256.GA859375@toolbox>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ST9RKiWkNfwKq5eElzq76VW";
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
 Christopher Braga <quic_cbraga@quicinc.com>, Aleix Pol <aleixpol@kde.org>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ST9RKiWkNfwKq5eElzq76VW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Oct 2023 16:22:56 +0200
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> Thanks for continuing to work on this!
>=20
> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:
> > v2:
> >  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
> >  - Updated wording (Pekka)
> >  - Change BYPASS wording to make it non-mandatory (Sebastian)
> >  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
> >    section (Pekka)
> >  - Use PQ EOTF instead of its inverse in Pipeline Programming example (=
Melissa)
> >  - Add "Driver Implementer's Guide" section (Pekka)
> >  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekk=
a)
> >=20

...

> > +Driver Forward/Backward Compatibility
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +As this is uAPI drivers can't regress color pipelines that have been
> > +introduced for a given HW generation. New HW generations are free to
> > +abandon color pipelines advertised for previous generations.
> > +Nevertheless, it can be beneficial to carry support for existing color
> > +pipelines forward as those will likely already have support in DRM
> > +clients.
> > +
> > +Introducing new colorops to a pipeline is fine, as long as they can be
> > +disabled or are purely informational. DRM clients implementing support
> > +for the pipeline can always skip unknown properties as long as they can
> > +be confident that doing so will not cause unexpected results.
> > +
> > +If a new colorop doesn't fall into one of the above categories
> > +(bypassable or informational) the modified pipeline would be unusable
> > +for user space. In this case a new pipeline should be defined. =20
>=20
> How can user space detect an informational element? Should we just add a
> BYPASS property to informational elements, make it read only and set to
> true maybe? Or something more descriptive?

Read-only BYPASS set to true would be fine by me, I guess.

I think we also need a definition of "informational".

Counter-example 1: a colorop that represents a non-configurable
YUV<->RGB conversion. Maybe it determines its operation from FB pixel
format. It cannot be set to bypass, it cannot be configured, and it
will alter color values.

Counter-example 2: image size scaling colorop. It might not be
configurable, it is controlled by the plane CRTC_* and SRC_*
properties. You still need to understand what it does, so you can
arrange the scaling to work correctly. (Do not want to scale an image
with PQ-encoded values as Josh demonstrated in XDC.)

Counter-example 3: image sampling colorop. Averages FB originated color
values to produce a color sample. Again do not want to do this with
PQ-encoded values.


Thanks,
pq

--Sig_/ST9RKiWkNfwKq5eElzq76VW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUylT8ACgkQI1/ltBGq
qqcEbw//Yqi8R4yPjbVcqMiKMpIEbK/XXuXEHHtD6yf4aLRZ9liS/JQ5zsms2VH7
OAGl92JyyF+zQ8btylZ5jCJkdqa9hHrqeDixByvtcR/9mppBnqAYvpuFgeqB8CIX
7k9zUWdhr32NnfUIHyDAhoCcKENsokuGR0SgjXaVFAAUhi0QvZ+B5iOB96K+bfzx
X1V86qgwD8xb9YXHrDpkKm31O9lMBLvuTE13EWlfvP+f8TBdAuBq+msk7Vz3WqsI
RZtNOBDxbZiKJaP20B+jeI1CFjrg3Iifh78Cv61GWWayKopUJ+M47KVIju6ErUcm
8azl0CaK0FbfFdHK3elnLkNVm+nyTNXk1SgKKhMh5h9NWBD25JQdgbmMX+t4EcU9
1+Ou/8s7jJ2R15yfzj8y4M/4qwydfeY1xdFlkWQB2UAbVQF2i/6b3e0qEFcVJht9
d/872fGLiNqrkp3IyoqRAvqDjmSdtGA2cxKzltfDc1IK7RJSULIc74I7YYCle/p/
ii8Lc2EZiuGTR4Bxm4hJ66hXsiAXH6+d69AtI/1/2WwFBhflf+kbfCI4vn7iq/wt
AU0FByapOHJ2loVI2ttzNYw8umdlj2NF1TdQwXoToTNtvuDWTbirdQRnH+ZmVRNV
dq294BE/RFjNKUm3AOaXH757WsYUoUjdJAknOBli4iCeH38Yago=
=sD3k
-----END PGP SIGNATURE-----

--Sig_/ST9RKiWkNfwKq5eElzq76VW--
