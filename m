Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D7C27A7DC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 08:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A4489F9F;
	Mon, 28 Sep 2020 06:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE34889F9F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 06:50:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c18so10912891wrm.9
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 23:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6BUCtRQudyL3oZudd2zI1GLfqtbwrgqT+bYMsIQL7nA=;
 b=IW3m/iIqKFlwSWbpCzIa9cKS8cOZwhypErZ+Tye+vUl5ZLu+MBkOF5j8Z0mmXZGASX
 chh2MSg7XEJBGh+kpahF0LVtlbjR52VfQbmSzqZ1d231Nd+Pyha+N8nJRW7r5ZnB9CMz
 getrzScqFk+NvDqus+Q5H7HfVIFMlpHfEyn9jQADzKLrIAXdUwxKO1geqAWsyZn7FVLD
 zmDOCfpAYCFYu8AFXdZhOEioovq1qC7X/drFnUac7u6EaJkiU5JWOCrhqxk31l28bRaI
 m2lURiMhNmx3Lj7Wvms8rhn4PUxg1eA41xHbNOo9Ac3Q64A5yIyUxWzWibGU4e7vLIaL
 sT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6BUCtRQudyL3oZudd2zI1GLfqtbwrgqT+bYMsIQL7nA=;
 b=O4pqClwiJ6ZhU/nJIUregVga61xDujB58CeAvTjPnZTllyIrJtRC+0B7VuRR2ibe5L
 /Al+LU4SGMm4XVYmjMIzsAd25z/LmzxlUJRUUkMHSmrca4Atg4fN5lsbpfvip7I9eIC+
 bStGtdBxaYYjJQ9FNxCFMQETn+QT01CYVB9rYe/O319s7GZ/iMntpnlUReLB/KVWy1b8
 5rSF7OOoETSxqW4bj0QSDH8U7pVNKpHd4286c0PXwLncmZe3DKh+zyufAmBF24NuidBL
 l7cvRJfHGNqKTnrvgDLcHdMKNfKjGl14Vnlgf3tdnaJLZ4QZHHVDxSxtKG/x+yMYaflj
 XgSQ==
X-Gm-Message-State: AOAM531SPraBSfoihKXtrf2CR8o2bVq+j0EMIVrjN+N1Vf2P4QBxQxo7
 FsgsICHoQVMzsTqVWt4cJQQ=
X-Google-Smtp-Source: ABdhPJydUek7h89ikzl2Ha2RAi7hyyWpqnPoMpeZKtP9W8ECKRs6bvysmD1T/CKzC4ap+3fHGVSvuA==
X-Received: by 2002:adf:f885:: with SMTP id u5mr16542136wrp.382.1601275842549; 
 Sun, 27 Sep 2020 23:50:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id x10sm8002713wmi.37.2020.09.27.23.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 23:50:41 -0700 (PDT)
Date: Mon, 28 Sep 2020 08:50:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH v1 3/3] dt-binding: display: Require two rests on
 mantix panel
Message-ID: <20200928065039.GB2837573@ulmo>
References: <cover.1600707235.git.agx@sigxcpu.org>
 <71a9108f3472ba9af4bead01b1b770d1e73eb08e.1600707235.git.agx@sigxcpu.org>
 <20200924193807.GA1223313@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200924193807.GA1223313@ravnborg.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1404680081=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1404680081==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 09:38:07PM +0200, Sam Ravnborg wrote:
> Hi Guido.
>=20
> On Mon, Sep 21, 2020 at 06:55:52PM +0200, Guido G=C3=BCnther wrote:
> > We need to reset both for the panel to show an image.
> >=20
> > Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>
> > ---
> >  .../bindings/display/panel/mantix,mlaf057we51-x.yaml       | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/mantix,mla=
f057we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,ml=
af057we51-x.yaml
> > index 937323cc9aaa..ba5a18fac9f9 100644
> > --- a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we5=
1-x.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we5=
1-x.yaml
> > @@ -35,7 +35,9 @@ properties:
> >    vddi-supply:
> >      description: 1.8V I/O voltage supply
> > =20
> > -  reset-gpios: true
> > +  reset-gpios:
> > +    minItems: 2
> > +    maxItems: 2
>=20
> reset-gpios is, as you already wrote, defined in panel-common.yaml.
> Do not try to change it here.
> It would be much better, I think, to introduce a mantix,reset-gpios
> property.
>=20
> This would avoid that we had two different reset-gpios definitions.

My understanding is that this will only override the defaults defined in
panel-common.yaml. So everything else about the
panel-common.yaml#/properties/reset-gpios definition remains valid and
all this does is say that when this matched on "mantix,mlaf057we51-x",
then the "reset-gpios" property is expected to contain two entries as
opposed to the single entry that is expected by default.

Thierry

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9xh78ACgkQ3SOs138+
s6FB8g//QtBW3j5TqyMHUoddPBCtKSfsY10GMjvB1UNVnf3COAo+qKbNI+aCEeJV
EXr7Nek9zLYPMfbSGaNkk9T36D4SMBVJdpTLm93kXAHSE3CW4e/mNpA78MRDPzPN
rORuQHrZ7yhNnZbKZIrIXCP9o38Y5HPuPM/3qoc5Yx2cnUFSCCN+O2SGyAMbZw26
sXOsGKOZ2p0nHXrEf1YZ4DyX8u+WJzYV8NOWLfaZgs6HkEFRE+4nF3IwYmeU8h7E
5BkqKiTWiruu1hK9I6v7CLWQj6efG1VuNL5dZwqYiJU4q9vqr/Cw23GxBeBhu8z8
umUV5LRHxf4CK5+1Rp9hPJHdjwG6gm3FoeXABD/uY5pzbcjoxqxzgN0GGE5At5KZ
2yRc1jfWC8ZIQOg9iI9XKhOP+id8GXmlHZT0CazBtesDbm2g3/J+zdzzJgheYRzz
wHKkAb5AZjBzVhc8R8UbbczdPUEwMn6hnO4d5Whg41PGcD9PsfzGRx92KUNpkmK/
Ofj1ZgfhAKNGoJSoKjkBX6b7bviU9q1BHKKr7hryAS04r7M9kBWcF3iC7m7/cDsP
WtyDubuGQOqQ43kL+frGrjgLXnF7iy/m16kPgjD7DlxeWYL8kFYfRnSr/976oXdH
5zKXEIdFrPEHmcs89OBFRchJ91m531oM+wbTv6N4Ec8i8X2R6X0=
=sjb9
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--

--===============1404680081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1404680081==--
