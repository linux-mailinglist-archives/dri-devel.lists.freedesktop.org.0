Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305BF272314
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 13:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CAD6E153;
	Mon, 21 Sep 2020 11:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF7E6E153
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 11:49:56 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k25so10785250ljg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 04:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=E+EBvehdtoUnO2GFu9uz9WCmrPkUauqMMjX3kiG803M=;
 b=lp8gI9EdFsryk5vzGYa2+FK0hK7xdqMN/R9OLKjdwDS+2wULK9/fsV0qaBrc7ObitH
 n1JUsq4wsmEUAME9fS+XOxvnkBNEc4joi+h5lMeHBZW9k5+P8epaYSMCVYJYy1+/A0Xx
 /eupv1JgM2Ha4bDNRiaMhYT5dO1AFr3OGPqGkxLg9zovQ7wqkgGRCXNM6QCVHYqZxgWo
 2TKHnu35vvsme7H0dS+ymcBiTgHpO7GhnaWPT4ckJDIKi/Qw6UC5qeCTXQa4QwlR6UI7
 nYgqS2S+491IV479Y5nWPNDjpOLHtyEgaegVJ6WszhbtBb0aU7VLYaGL2GRn9N+EzkgZ
 jO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=E+EBvehdtoUnO2GFu9uz9WCmrPkUauqMMjX3kiG803M=;
 b=nmFHdGVHlzTb58g8sR8HT0FXOovDLH1AgyGJGOI7LkCk19QDXNHQFd4+YYxAjG3oDs
 nObkXJ99tK5QrxqHpauxsoJazaAI9ICa8vKqc3tQUODi/Ae16+2nMKhiFUcLokGuCWdJ
 stZG3TDHHznl73/2pUjyQlNLR1j4uCZKPNyJtrEhWc6Dl0RYhxC2qZXtbHq7kz7oY642
 nsR7bHEQh+eUnM3UBt918vjxA/+m1xLQcwUi9ghI7c9bl/MiHWbVv0BplDRePdqgWNoo
 52rd6vxVAWxHKx4XrQ4H2u3Q3YEQaXZe+SAulnX+wjXaX3fujGYBNFsV0Eu88ZWZs0PE
 mHRw==
X-Gm-Message-State: AOAM532eXFWls/Bvo6/o4QawaUS5g3ZemqyGuvKP3rdnasEU1VKUlK5Y
 2zRdPcpmoW+NDnSM9oyoXAQ=
X-Google-Smtp-Source: ABdhPJzqDGl08dahMsXg9vxnLTIi5SNnYBwR0OyTFy3S66GotKvJkh1AgkRg6M+BMLuHk8+Xz4vkpg==
X-Received: by 2002:a2e:8114:: with SMTP id d20mr15121141ljg.409.1600688995026; 
 Mon, 21 Sep 2020 04:49:55 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 13sm2481941lfn.239.2020.09.21.04.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 04:49:54 -0700 (PDT)
Date: Mon, 21 Sep 2020 14:49:44 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 4/7] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
Message-ID: <20200921144944.3f2aa593@eldfell>
In-Reply-To: <5beadfb2-86a5-a782-ff88-ce77c727ecfe@ti.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-5-tomi.valkeinen@ti.com>
 <20190903152413.GB8247@pendragon.ideasonboard.com>
 <b44372e2-1bb7-ddb8-d121-ae096b38d918@ti.com>
 <20190904111105.GA4811@pendragon.ideasonboard.com>
 <d75b942b-0256-3824-9055-1f6b68bb8c3b@ti.com>
 <CAKb7Uvhcvi5AQZq21ky8V07wjeNfdpV0y+5j=O=S1PTp=4o5Bw@mail.gmail.com>
 <5beadfb2-86a5-a782-ff88-ce77c727ecfe@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1470516936=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1470516936==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QwUTBqyWWXwbw2gJRQ07G2/"; protocol="application/pgp-signature"

--Sig_/QwUTBqyWWXwbw2gJRQ07G2/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Sep 2020 14:08:48 +0300
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> Hi,
>=20
> On 04/09/2019 23:20, Ilia Mirkin wrote:
>=20
> >>>>>> Implement CTM color management property for OMAP CRTC using DSS
> >>>>>> overlay manager's Color Phase Rotation matrix. The CPR matrix does=
 not
> >>>>>> exactly match the CTM property documentation. On DSS the CPR matri=
x is
> >>>>>> applied after gamma table look up. However, it seems stupid to add=
 a
> >>>>>> custom property just for that. =20
> >>>>>
> >>>>> In that case the DRM documentation should be updated to mention that
> >>>>> both options are allowed. =20
> >>>>
> >>>> Ok, if that is alright. But if we do that, then I guess all the driv=
ers
> >>>> implementing CTM should document the point where it is applied in the
> >>>> pipeline. =20
> >>>
> >>> Whatever solution we end up picking, I think it should at least be
> >>> discussed with a broader upstream audience and not just swept under t=
he
> >>> omapdrm carpet :-)
> >>> =20
> >>
> >> I'll try to write something and send the next series to wider audience.
> >> Let's see what jury says. =20
> >=20
> > In case it's useful ... the pipeline normally goes degamma -> ctm ->
> > gamma. If your ctm is applied after gamma, perhaps you can just rename
> > "gamma" to "degamma" and be done? (There's the unfortunate case of
> > legacy gamma which does end up in "GAMMA" when using atomic helpers.
> > But in such a case, you won't have a CTM.) =20
>=20
> Waking up old thread, as I started looking at these patches again. So the=
 problem was that DRM
> defines the output color transformations as:
>=20
> degamma -> ctm -> gamma -> out
>=20
> whereas OMAP DSS has
>=20
> gamma -> ctm -> out
>=20
> The omapdrm driver could declare the gamma table as degamma, as suggested=
 by Ilia, and for the
> legacy drmModeCrtcSetGamma, the omapdrm driver could implement its own ve=
rsion, and use the degamma
> table internally (with no ctm).
>=20
> For legacy, that would work fine and as expected, but I think the atomic =
version would be a bit odd,
> with only degamma, and no gamma.
>=20
> Quick grep for drm_crtc_enable_color_mgmt shows that there are other driv=
ers that have CTM and
> gamma, but no degamma. I wonder if all those have ctm -> gamma -> out, or=
 are they similar to OMAP DSS.
>=20
> Any thoughts on how to proceed with this?
>=20
> Should we have a property that describes the order? Or new property name =
for gamma before ctm
> (PREGAMMA)? Or just have it as degamma, and let the userspace deal with i=
t (i.e. figure out there's
> no gamma, but there's degamma, so use degamma)?

Hi,

would it not be simplest if KMS UAPI specification defined the abstract
color pipeline with all the blocks that may be exposed with
driver-agnostic UAPI, and then just say that if a block is not present,
it behaves as pass-through, a no-op?

Each block would be represented by standardised KMS properties, that
either exist or don't.

I think that would be fairly easy for userspace to grasp, but I don't
know if the abstract model itself would be feasible considering all the
hardware out there.

If we happened to be limited to

FB -> plane-degamma -> plane-CTM -> plane-gamma -> (blending) ->
degamma -> CTM -> gamma -> encoder -> wire

it would still be tractable.

No funny business with new KMS properties changing how old KMS
properties behave. Old userspace understands and uses old KMS
properties but not new KMS properties, so it wouldn't even work.


Thanks,
pq

--Sig_/QwUTBqyWWXwbw2gJRQ07G2/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9ok1gACgkQI1/ltBGq
qqessBAAhPUKtw3yFcym5WpK6hd5+Yu59x7BoBBYaeCObpWTpKgLpL1o6UsKExLS
OeAsStDJI3+ZYtYANikmmSW0d+k5kWmDM9q2IUhZHhWTnK+AJQJAkOa3EOByNl7K
yvOVemH9DrhtQq1HOd6Q6BJj8ZJ9YQ+8kndddCNGCneOm7bvza9dNzqi8YpnJhBc
T03ks4FCz2ANOXWYWQoV+KO0jfHYdafw7yCIa76vG6RPupnPcM2wChovJpl0ZBsr
tWI33lbDQxgJ5jq7tKIDSdp+pGXY29wSrOkwyLniYXQ5IVUIdasjMOMHFS4MFgJN
8f+OZpVUl7FLfvFdSacSURzofvOdkqt2W6aUlVbkYI1FV8FIDN6CiIoCsemplVN1
W1NeHX9X7WMvawle5Np1uiIgKbxCOrlaYs9t+KwYqAKDFjNsM0jTDeWVTBM5eF1C
pKLVHeR6jbN6X1bjI6FWOgvUilSSuY4hJ/VV04VMXbmOk0iz29T7tbgtRldIHclZ
G2D+NyrSn7+2+Xev8JUvvE6pYgsm8JeQnQWaWdcKQFo58pOwZsA/Txr7r5zt5+6i
Pb3E1X+Pl+gUHPa2Yi9ASW+j+ufF6J0/4OvyeJ7cX1O1HRhiZFr3z0Vi7fDCepsn
MxtiBjRDscPmgIPD8rgBekGZjG78xDhUw8yrvw/UJyQsUszysYQ=
=PfvG
-----END PGP SIGNATURE-----

--Sig_/QwUTBqyWWXwbw2gJRQ07G2/--

--===============1470516936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1470516936==--
