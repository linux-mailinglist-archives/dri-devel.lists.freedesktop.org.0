Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D41720AEA1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 11:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D88F6EC36;
	Fri, 26 Jun 2020 09:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75FC6EC36
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 09:00:14 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n23so9519767ljh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 02:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Ao9YTadEp0s2FWKTOdd0MJFofVwfH7gY8WnZItIgTv8=;
 b=R3A3XX5hvcZ5c3Uo7PL8SHK588RpcT+z26LsvfxNumtko2h6GBOgJ/+3lUSc+eY405
 DppNdteVLEyvmFhtDyf3tBAh5e+Xed5hKYYrStIU4WO4K75/w3Gr1LBrEQwTx38Ow1eE
 DPe5fMiMYJ9eULdK1EYRt9tSq4sLCNqnkkuWjK8w89DRzRlW0xoYz69LCtGr2olX0XTH
 Cx7EmOf7pJKagozsJbq+NN6VRJtygd5K3eii2O021jZdfsG3S++o6fQwU3a8g6Tj2qCr
 JX3Snnqk7FKhck1SPRHNvE0KXxKaND2qiSvSTSKAR11IW+r1ZMVmgbBnqifG5Pw1ybxO
 ffAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Ao9YTadEp0s2FWKTOdd0MJFofVwfH7gY8WnZItIgTv8=;
 b=dc6fNfLNC5HEIIPhk478kcRTy/5UobZ33tRo143HVCxkbXpGIfskX5izThZcvchxwS
 JjxEtDOAm9h3b8mfZTNFT0N+rBZ3jMM1nfmiHv7iV7fedsJbG2ZhCqBcD+WP0yqr8Yp8
 Y8IR4Vl+6yAgWbR+uFAhyFoz1R6/OBhIQXuTzsRzFKIoBgLHo2+sKc8VhzyedwLEK+pg
 BQJCBmDpCyEhH3Jtzw0lIDFPtDGsYcA2yrrxbrMjyJokqaq+oMWQLIHA6FJllSgYGis9
 E19kRuSw81of9hA1rFs7zuN5ttYM0QyyTSK9dnOJuUAHM7Gwrs8zHv0n417g+0OxlU8S
 KYcQ==
X-Gm-Message-State: AOAM531P0RqHVAHA+uBrFNnyAnKEdvAc08H+XhHBDV33jXEjVgMTrqeE
 vgPU2C07AVoI+KcNB/5Jxqo=
X-Google-Smtp-Source: ABdhPJzs9zYgb0haM+Ksfy8ux78Nnvp/+fMdG2RUAF4IySl/oHXbP7C7C4kvcyZD3TJfpItm13bJlQ==
X-Received: by 2002:a2e:9d99:: with SMTP id c25mr920225ljj.404.1593162012963; 
 Fri, 26 Jun 2020 02:00:12 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d20sm6636423lfi.22.2020.06.26.02.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 02:00:12 -0700 (PDT)
Date: Fri, 26 Jun 2020 11:59:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
Message-ID: <20200626115957.566efa5b@eldfell>
In-Reply-To: <CAKMK7uGF_t+zW4tyO42HN2BbV1j6fVFfVHF8Xph10bAygdsXPQ@mail.gmail.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org>
 <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local>
 <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
 <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
 <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com>
 <20200625075655.GC3278063@phenom.ffwll.local>
 <CAKMK7uF70UO=vDDnERnQ49rH1yN8gQQD91GKq1j8+eQV9mf1xA@mail.gmail.com>
 <20200625133157.0e749602@eldfell>
 <CAKMK7uGF_t+zW4tyO42HN2BbV1j6fVFfVHF8Xph10bAygdsXPQ@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1671387931=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1671387931==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F4=b=qzv72TRNlRwlpgbuD_"; protocol="application/pgp-signature"

--Sig_/F4=b=qzv72TRNlRwlpgbuD_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Jun 2020 12:44:36 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Jun 25, 2020 at 12:32 PM Pekka Paalanen <ppaalanen@gmail.com> wro=
te:
> >
> > On Thu, 25 Jun 2020 09:57:44 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > =20
> > > On Thu, Jun 25, 2020 at 9:56 AM Daniel Vetter <daniel@ffwll.ch> wrote=
: =20
> > > >
> > > > On Wed, Jun 24, 2020 at 03:40:42PM -0400, Alex Deucher wrote: =20

...

> > > > > No, you are right; you will have the EDID so this shouldn't be an
> > > > > issue.  I was mis-remembering the original issue.  We originally
> > > > > always reported connected for LVDS in radeon if the panel was pre=
sent,
> > > > > but then we got flack because some userspace expected unknown in
> > > > > certain cases (e.g., lid or muxed displays).  Either way the EDID=
 info
> > > > > is still there. =20
> > > >
> > > > Yeah I think i915 started that habit, but I guess people realized i=
t's
> > > > unreliable enough that they should have their own lid handler in the
> > > > desktop enviromnent doing whatever they want to do on lid close.
> > > >
> > > > Should we perhaps document that somewhere, that panels are always m=
arked
> > > > as connected? Not even sure where to put that in the docs ...
> > > >
> > > > Maybe adding a few of the usual suspects from the compositor side, =
Simon,
> > > > Pekka? =20
> > >
> > > Actually adding Simon and Pekka this time around ... =20
> >
> > I don't know what anyone else does, but Weston (is not a DE) does not
> > look at any lid switch, and assumes that if connector status is not
> > DRM_MODE_CONNECTED, then it is disconnected. So, if a driver switched
> > to "Unknown" status, it would be taken as disconnected. =20
>=20
> Maybe an aside, but the guideline is for autoconfiguration:
> - Light up everything that has connector status connected.
> - If nothing has that status, try to light up the connectors with
> status "unknown".
>=20
> This is only really relevant on older platforms, mostly for VGA and
> somewhat for dvi outputs.
>=20
> Maybe another thing we should put down somewhere in the uapi docs ...

As I had no idea what "unknown" means or when it can happen, I assumed
that it must mean "the hardware cannot know". If the hardware cannot
know, then I certainly will not be trying to enable that, unless
explicitly configured to do so. Having a phantom output is worse than
having a real output that does not light up, because it's not obvious at
first with phantom output that anything is wrong. You may just be
wondering where your windows disappear, or where did you mouse cursor
go, or why you see a wallpaper but no login dialog, etc.

I certainly do hope no-one uses this quirk of Weston to get their lid
do what they want... it's possible, OTOH the desktop user base of
Weston according to what I've heard is around one person. It's not me.


Thanks,
pq

--Sig_/F4=b=qzv72TRNlRwlpgbuD_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl71uQ0ACgkQI1/ltBGq
qqeY1Q/+MhwP6N1Y9lobFwLXKaEM3tJONA3OP40VDs+2S+ZeD181qptSKPPHySb1
lHr+0f/QGr3nWPSEA7hRG+bsKDdcqGXOwyTK1it/YrtrevYp21aG0mzre2QZsSBl
xiWxKSvC+3BAU5YiVN5u3FJEzUtp7gwr1OPvQdFhvq4+QZYM+hi8x5+O5ci6GSBT
xi9W2nt4XdAImCfRqVxZhDuTO9NncyY0+6/GSTMoeMf3Xw+3qi3HCthF8kBl/Fz3
dd0Elo2Q860lHny42YosSOzKW8CYBLykv24PctKcZjpEZMNWAHjJximHz68MqEvT
DvK1PcFwAOJOJFTn+mCI9UW/dy2uczxtXexbcdw/dvBTClrQ+t7Wz9umog+Xz084
GJZjbjrZf8PUUNMkX89+XluETS+SRj4CK0CiJ9jAOaHrW+pdTfOI6OZMDJgDFdK3
jmIrMhgJeOs/uuxc4KEjag6eDR7A2SFcQEau3Bet5zJgrImCElFRsKn5hFAFldme
ttxBmegyobK5G3R4olUa0LHUUBCg2tCTfaBMQdzNcQtOiEyllwoMnB7NlV475gOo
GOTsczaSMlp0uLc1ckqZWa/m0ybFKVGaC7GXQ9QWZw4x+4uB48HDoVylG3CZQnn2
YskecrYToTJYyu7U1B8gpwThUmsvhd0InOuy1PyK7fpBGss6Idg=
=y3r3
-----END PGP SIGNATURE-----

--Sig_/F4=b=qzv72TRNlRwlpgbuD_--

--===============1671387931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1671387931==--
