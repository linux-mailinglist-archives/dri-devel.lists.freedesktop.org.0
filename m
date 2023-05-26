Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0356E712758
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 15:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B46F10E1CF;
	Fri, 26 May 2023 13:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9937B10E1A6;
 Fri, 26 May 2023 13:16:55 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-4f3b337e842so740717e87.3; 
 Fri, 26 May 2023 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685107013; x=1687699013;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=udLYJuH/AxUnoRRd9RVT20tfBwN9yl79aTJR7ICJ2NI=;
 b=NXi3X4VrRxdKZGeaB7oMXMrmwKk1rVPQd7lIweZgTvplLcpE90vnQ02SpMenmuY+t0
 fmEgIpeOCwgjZfSgRgxIZal952qeySEg+fdzZMgNrluChnEw/kIlFgmnv7gawin+QTAt
 uPZXDeEdfWiGH3+Vnm1aDnJhZkNtV0nHmjjz1ry2jrBQf2YuXy0FbFWXa6HH78sdPbmN
 BZtODNnOyrQzpAXHwuTqHXlBvnpMIA6jDMezLmaaNasOaVH2ddlcshU+QIzsSGDd0w/9
 +0r5wQ1vVsZ378bBi+y4J/4dZg7GzhUCRC2fF9EKec/vRvHGH50cNO6PxTHQdo9j8FWV
 rB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685107013; x=1687699013;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=udLYJuH/AxUnoRRd9RVT20tfBwN9yl79aTJR7ICJ2NI=;
 b=MaKM2vJB1lRM0VLqcM4L82uJ5LwX4qfuZL+tlE4blugG2DpbBJFOmMKZdFUKnDA3M9
 vtU0QA73rd4Hhi+NSNBjodo05c4SYODxq9POajATQpqryiN0Ro+oTc9PMLpR+iJmDcKm
 auMiZQVAnB2CtcSfYJ0EIabS0/CO0eAhMsUIlAZ/IVR9mMnqNZKarq/KMr5tcIK7+jOL
 66DHddPZH59N3RqIkfhBN2b1ej789l1LyNzzm59KsLtROxJvQZW44yMFfdsktSgLH5Zp
 pep2JBuW8fhN3bsxWPtApyp5f2ohdl63vGFniXIIElMclbbmq9KObkLeeDeJU15CNh/f
 WKRQ==
X-Gm-Message-State: AC+VfDyww/AuYo6onxD13L6iFqLQq2SZb1jDtfJNB2T0Irtt3Ndmr6Nm
 LufnqYbSq5NCCkrv68h8nmo=
X-Google-Smtp-Source: ACHHUZ4PlV0lNaSxnL/x9OcHFe6gT5nLS12DPv5ww421leTDUB5pR1d1cwQBEJxNXqpn+CqeQBLDSg==
X-Received: by 2002:ac2:5ddc:0:b0:4f4:2b83:f4a3 with SMTP id
 x28-20020ac25ddc000000b004f42b83f4a3mr608990lfq.51.1685107013144; 
 Fri, 26 May 2023 06:16:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g8-20020a19ee08000000b004f1383d57ecsm617716lfb.202.2023.05.26.06.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 06:16:52 -0700 (PDT)
Date: Fri, 26 May 2023 16:16:48 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v4 00/13] Enable Colorspace connector property in amdgpu
Message-ID: <20230526161648.5865ce1a@eldfell>
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n+=R6j1dgu2y9fB8LJq.JWj";
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
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/n+=R6j1dgu2y9fB8LJq.JWj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 25 May 2023 15:17:56 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> This patchset is based on Joshua's previous patchset [1], as well
> as my previous patchset [2].
>=20
> It is
> - enabling support for the colorspace property in amdgpu, as well as
> - allowing drivers to specify the supported set of colorspaces, and
>=20
> Colorspace, Infoframes, and YCbCr matrix
> ---------------------------------------
>=20
> Even though the initial intent of the colorspace property was to set the
> colorspace field in the respective HDMI AVI and DP SDP infoframes that
> is not sufficient in all scenarios. For DP the colorspace information
> also affects the MSA (main stream attribute) packet. For YUV output the
> colorspace affects the RGB-to-YCbCr conversion matrix. The colorspace
> field of the infopackets also depends on the encoding used, which is
> something that is decided by the driver and not known to userspace.

Hi Harry,

the "deprecation" of BT2020 RGB vs. YCC is now dropped completely.
Should there still be a patch that adds some UAPI documentation only,
saying that drivers are free to swap e.g. between BT2020 RGB and YCC
based which encoding they actually chose?

Even if just BT2020 variant specifically.

I have nothing against with this series now.


Thanks,
pq

>=20
> For these reasons a driver will need to be able to select the supported
> colorspaces at property creation.
>=20
> Note: There seems to be an understanding that the colorspace property
> should ONLY modify the infoframe. While this is current behavior and
> sufficient in some cases it is nowhere specified that this should be the
> only use of this property. As outlined above this limitation is not
> going to work in all cases.
>=20
> This patchset does not affect current behavior for the drivers that
> implement this property: i915 and vc4.
>=20
> In the future we might want to give userspace control over the encoding
> format on the wire, in particular to avoid use of YUV420 when image
> fidelity is important. This work would likely go hand in hand with a
> min_bpc property and wouldn't conflict with the work done in this
> patchset. I would expect this future work to tag along with a drm_crtc
> or drm_connector's Color Pipeline, similar to the one propsed for
> drm_plane [3].
>=20
> Colorspace on crtc or connector?
> --------------------------------
>=20
> There have been suggestions of programming 'colorspace' on the drm_crtc
> but I don't think the crtc is the right place for this property. The
> drm_plane and drm_crtc will be used to offload color processing that
> would normally be done via the GFX or other pipelines. The drm_connector
> controls the signalling with the display and ensures the wire format is
> appropriate for the encoding by programming the RGB-to-YCbCr matrix.
>=20
> [1] https://patchwork.freedesktop.org/series/113632/
> [2] https://patchwork.freedesktop.org/series/111865/
> [3] https://lists.freedesktop.org/archives/dri-devel/2023-May/403173.html

--Sig_/n+=R6j1dgu2y9fB8LJq.JWj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRwsUAACgkQI1/ltBGq
qqeWyQ//Sm+oRIQjNlcqJgJBgqolxHetmn2v2PN2e3HPVb1eKvwNGcjfZ0PNwqDB
uZeOd64GPvATbTn5ReR1uLSwTlPniaAvHeINCL4A8YalYiObS/lQ9OTM6MrTjlVD
ZCabwLkE79ruFXVd3aHMyXkSeYCLul+jLAQbnsQwi1IIFqTJPkiRnMbAcVgc/AY4
bjzI/px9VLQu8l+sQQNt0io33U+Lkifxmm+U+aZuk72WOa1OcQT2VrqH4kZ/sLyJ
BgXOAhgJJ4xKDR0h6QKtAQ8IsdaRmt44YIlgwDyJ8/tIIwcLoriZcgBxPb0d9hPE
LvSqHmRIYpQ8oeDxzUhAQ0sLriLf7bGXj98DCeMF6y/w8+uvvZW9lrQqdVGSHhNV
YyDjSq5AcOklKaylGjbbS6qkzSnp81wdcHdnexRm+L2wHZ0tn+obWLgPNOojSEbD
rewkaGBG74UnSkB1566SpXeUjYKbcD0trXAoaK+JvYQkS3q9OpfFmOW2CcM9+ssW
yuHMAbKiO8Kz76sTY+MTpivA23TxMByQoVxy+YxZGebszszuJR3vUi7hL/p3KSJC
eQCb4zybbiybLBE3cexDJ+K7syegpE5N60OCv+D3MwZNjVrSh95ZVwFth9k2R/pG
DJkwOJv4YMcC1gajXB+kSBzPdawEHvv1EW/4cL7WKx09kuFyQ5k=
=sDYX
-----END PGP SIGNATURE-----

--Sig_/n+=R6j1dgu2y9fB8LJq.JWj--
