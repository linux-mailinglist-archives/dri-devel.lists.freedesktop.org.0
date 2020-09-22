Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8A274004
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 12:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875E889F92;
	Tue, 22 Sep 2020 10:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B6A6E0FA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 09:48:30 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d15so17294793lfq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 02:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=aIaAg5TnEPPyGmIARxbR4Z4XZ2GdlULQK6Wliq3wsQU=;
 b=u4z5jAiG1Cta/zB3Gd92XXpv0TxICE+MNxT9yLSqsOhJKOCljjCUkDsf4hGRGx01j2
 A/hBRPxu1pPbXh0w0/MEu+sIXA7QKEydJYz/vMGXdIIHrm+BbnXrrOuHd9QGQFw2fzcm
 hFIOLS3YC7ULMk/s4tqtt+0un3YAOBI+c629pHbdLgCnubGT2REVFa/ChTodVLTB+rqm
 J3hmJVdFMzdasdy7b+S0vRC47PZI80oBz5oVoTKXGZQLKCviBEimrwU/nCxdhNjCIJe4
 x2SXxbxcEf2u5IiyFmIvM8SXExUi2JMWKS/Cd0+FCcUs8aHYZH7zy9fiUl8RxrgxexgB
 k8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=aIaAg5TnEPPyGmIARxbR4Z4XZ2GdlULQK6Wliq3wsQU=;
 b=tMARXe+IctmpKrolsBQ5TlsvBagQxaneJo103w1UtXM96pn9l8t6hjg4QykqrK0ZTh
 HfXWXZEAVHdK/ROwFkDxgd7HRaW2WhyyWy2aeprOrDrQVAy644m7FnPFw+RzsKtQzefw
 FLzI3XXyQPT/uIddA/jp+iMMQ8lXZA8IwxpwIp3DFyWTiIfjUipDWBh03DF0C+xWZl4H
 +5ETChDsQ1SY0ouKJucqT8F4M/ov/cMaYj6AYjEBOfgw1r0bkbRZW0qjYtcx4FcYO92h
 +mFW2FWKbOHCegQsaOkIfO4zaaPUASHdDZ1IZQijObUiTv3KNqcblUDpuGB8j6Yvjvcm
 Gj1A==
X-Gm-Message-State: AOAM533OYL3jRxLzi+codV30zmWcCcGzBO92HGV+S/E1MfScffmO+LO/
 MrPdM89vNZ43tF7vYG9/hL0=
X-Google-Smtp-Source: ABdhPJx891tYn9ccFYdpJn6q6PYbVIgie8kQte2EwzrdjaHBL+Z8NKzOVEcVCOB+16HoC6yXU9WGbw==
X-Received: by 2002:ac2:4c01:: with SMTP id t1mr1471313lfq.351.1600768108691; 
 Tue, 22 Sep 2020 02:48:28 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x5sm3361080lff.280.2020.09.22.02.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 02:48:28 -0700 (PDT)
Date: Tue, 22 Sep 2020 12:48:17 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 4/7] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
Message-ID: <20200922124817.6c59bca5@eldfell>
In-Reply-To: <b06e3c39-2a87-c5e0-0fdb-162eead5d36e@ti.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-5-tomi.valkeinen@ti.com>
 <20190903152413.GB8247@pendragon.ideasonboard.com>
 <b44372e2-1bb7-ddb8-d121-ae096b38d918@ti.com>
 <20190904111105.GA4811@pendragon.ideasonboard.com>
 <d75b942b-0256-3824-9055-1f6b68bb8c3b@ti.com>
 <CAKb7Uvhcvi5AQZq21ky8V07wjeNfdpV0y+5j=O=S1PTp=4o5Bw@mail.gmail.com>
 <5beadfb2-86a5-a782-ff88-ce77c727ecfe@ti.com>
 <20200921144944.3f2aa593@eldfell>
 <b06e3c39-2a87-c5e0-0fdb-162eead5d36e@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1228770182=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1228770182==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/o.SXiir7SK+68COw1f.ncNS"; protocol="application/pgp-signature"

--Sig_/o.SXiir7SK+68COw1f.ncNS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Sep 2020 10:44:38 +0300
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> On 21/09/2020 14:49, Pekka Paalanen wrote:
>=20
> > would it not be simplest if KMS UAPI specification defined the abstract
> > color pipeline with all the blocks that may be exposed with
> > driver-agnostic UAPI, and then just say that if a block is not present,
> > it behaves as pass-through, a no-op?
> >=20
> > Each block would be represented by standardised KMS properties, that
> > either exist or don't.
> >=20
> > I think that would be fairly easy for userspace to grasp, but I don't
> > know if the abstract model itself would be feasible considering all the
> > hardware out there.
> >=20
> > If we happened to be limited to
> >=20
> > FB -> plane-degamma -> plane-CTM -> plane-gamma -> (blending) ->
> > degamma -> CTM -> gamma -> encoder -> wire
> >=20
> > it would still be tractable.
> >=20
> > No funny business with new KMS properties changing how old KMS
> > properties behave. Old userspace understands and uses old KMS
> > properties but not new KMS properties, so it wouldn't even work. =20
>=20
> Isn't this how it's currently defined for the output side? So if I
> understand right, your suggestion means that a HW that has:
>=20
> gamma -> CTM -> out
>=20
> would map those to DRM's degamma and CTM, and the userspace should
> use degamma to do gamma? I'm ok with that, and it's probably more
> manageable than having properties which would describe the order of
> the blocks.

Hi,

yes.

When I have been thinking about using the KMS pipeline elements for
Weston, I didn't take "degamma" or "gamma" literally. I just think of
them as arbitrary LUTs at specific points in the pipeline.

Legacy KMS UAPI implementation for drmModeSetGamma() ioctl or whatever
could use the same heuristic: look at all the pipeline blocks after the
blending step, set everything to identity except for the last (or
first? or largest?) LUT which is used as "the gamma LUT".

> While using degamma for gamma sounds a bit illogical, but thinking of it =
as:
>=20
> pregamma -> ctm -> postgamma
>=20
> sounds fine.

Indeed. Better naming for new blocks in the future, I hope. :-)

I think even "gamma" is a little too much meaning, they're just LUTs.
Not sure if 3x 1D vs. 3D LUTs should be different blocks in the
pipeline, depends if the UAPI can handle both kinds.

Having blending -> degamma -> CTM even implies incorrect pipeline,
because blending should happen in linear space while degamma is about
converting from non-linear space into linear space.



Thanks,
pq

--Sig_/o.SXiir7SK+68COw1f.ncNS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9pyGEACgkQI1/ltBGq
qqddkw//W0hNkxslnFY1GFV0A8FHAtwbmYhZK33exyOmauffZ8P4L70voCkWISKo
d4YtcMT+bzN09lLNJnQaQiw1OePy2t+M6sPAjzabite5T+n1zzBWw35+IdUS4E8l
FYWPlY/BoqxyutSo9NRL5pT+umdfgumQQ2I+S+E+CJhBX+Y1j+17XmthW6a42tlW
1vS1tNh1ciQCXmD0agMzQN8gE1P3bFVIdroH90iTlMpU/GZM9i5iZQHRCHA/oy/E
79m8K1J/JarQMwe8dVWj8QOEqXTg04dhkaVwE3CUP3Gc1mFkF1XuV7YK/QITaxVL
+uCMXSK5LtUS0OWLFixp/a1mW+JN8fqv3tER8Xkwlhm6nB3U6C4dhfa1S+z4VbdZ
qdMIDpNQ+SKvY5JvyoFq6ryvoMVhMMBIBmBHgvfUr5+bfHRnIDyYsfC7CYc8y/bT
PWOycIF7aFf7AMOiHw+kHLmxskvXUWTAxTxrtaWBI0kK6gidd2h+OND9i0gskgpw
/I8ZQb/6f8PjmyOX/Tlt0iPo/Hfm7P4iJcikYYwXbXvUKP1dAaoyE1dFpdGOpuuk
Ibpko+nhEbNND0K+5pAgduHRquYhGpfPWuBnlwgYm8YPSw9IiMfqWy5RO4stU1DK
GBaojIMg3lFTw2A2OcKMoLpMTHwr1GvArohFlo9M5+pqlAon+U8=
=R5qS
-----END PGP SIGNATURE-----

--Sig_/o.SXiir7SK+68COw1f.ncNS--

--===============1228770182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1228770182==--
