Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55BDE599
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 09:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDCD89ACC;
	Mon, 21 Oct 2019 07:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D9D89ACC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:56:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r141so2100074wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 00:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dAcSd8D+7fB4wU96Xp20TOFZ2zgzU4rzzT/+HNArHBM=;
 b=XjA0WVeQn4ebO/NEx28Q0aMptIMuQB/TlrUFH1FqYzBZLDJrX072MMDSgcVKlR4zQs
 1plsqcPNvCQsb/CFFvOB4QoHmcut8Zy7NRcduuP+s093f8t5LgctHe7t6I16flW2lwT0
 dlt+xFDP5XKWlpZD3Llq+q8qbYBT+RxSgujWnNYqP8Cx8C0yckS9E4H03ySEwOmxJGE5
 76PnYPwk/I04vo3Tu11ihPdIKMDh4z4OGvvsyby7ETVzql2TZC/8pH1g927oFamhEXaC
 6FU2pGlvLxEsUWqeCc38iughLXQ5pd/0bCHutq8ltl8+/AmciA6JGCq96YLRhKcYKZdJ
 jV7g==
X-Gm-Message-State: APjAAAWcz9QPd1ulehr3qiFJB8b+n0evxEe34mhu79dAGLOYfZpvFY1N
 fzdid8yTjWGgoCi9FnUlkF+Q2zzj
X-Google-Smtp-Source: APXvYqw/bEwjL0PDMBBrpDRBzamso8k8iBH+3U9hodF42kt/DsElTWraFp/+uyKV9qqnfmcWBBMIGg==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr16856662wmc.23.1571644559775; 
 Mon, 21 Oct 2019 00:55:59 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id s13sm12787599wmc.28.2019.10.21.00.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 00:55:57 -0700 (PDT)
Date: Mon, 21 Oct 2019 09:55:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 06/15] drm/dp: Read AUX read interval from DPCD
Message-ID: <20191021075556.GA1118266@ulmo>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-7-thierry.reding@gmail.com>
 <83d91ac4c67768d013615ee6312b84da3fb959fe.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <83d91ac4c67768d013615ee6312b84da3fb959fe.camel@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dAcSd8D+7fB4wU96Xp20TOFZ2zgzU4rzzT/+HNArHBM=;
 b=hlJVUjctc8RXUA83M6sB+JDKfVmSleslZaFq/RtgV5dHBrWCTsgrdakNzmM+n872q3
 dEsJ0uHV41ZXr6J6PgxYM0KqSWjM7KVAZlmjtwqwXIIogkNIC1QFwsZqNImWy6m3vOXw
 DmsRfZ5+veWDtm61LE/gJyfRiexGVrFUTzylbmTlDFl2X0RzEFM/f+1U/CWeLCjgbTUC
 wKkp6TNra49ejbPMmbXJNIBKgRdT3V3FXXOUud/0hJMKIQ7gnTw5U+habhUTZLds/DXF
 DIeu5Y1BQucMx8CpH9rQO/pf4UsPk1rr0IoMxLMPEhoMS8ZUUfR9I+bnh8cHYhU2nfva
 uQJQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1472450498=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1472450498==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 05:27:59PM -0400, Lyude Paul wrote:
> On Tue, 2019-10-15 at 16:35 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Store the AUX read interval from DPCD, so that it can be used to wait
> > for the durations given in the specification during link training.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  include/drm/drm_dp_helper.h | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >=20
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 7a537ffc2fb1..6c12de6f7e46 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -25,8 +25,11 @@
> > =20
> >  #include <linux/delay.h>
> >  #include <linux/i2c.h>
> > +#include <linux/time64.h>
> >  #include <linux/types.h>
> > =20
> > +#include <drm/drm_print.h>
> > +
> >  /*
> >   * Unless otherwise noted, all values are from the DP 1.1a spec.  Note=
 that
> >   * DP and DPCD versions are independent.  Differences from 1.0 are not
> > noted,
> > @@ -1297,6 +1300,36 @@ drm_dp_alternate_scrambler_reset_cap(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE])
> >  			DP_ALTERNATE_SCRAMBLER_RESET_CAP;
> >  }
> > =20
> > +/**
> > + * drm_dp_read_aux_interval() - read the AUX read interval from the DP=
CD
> > + * @dpcd: receiver capacity buffer
> > + *
> > + * Reads the AUX read interval (in microseconds) from the DPCD. Note t=
hat
> > the
> > + * TRAINING_AUX_RD_INTERVAL stores the value in units of 4 millisecond=
s. If
> > no
> > + * read interval is specified and for DPCD v1.4 and later, the read
> > interval
> > + * is always 100 microseconds.
> > + *
> > + * Returns:
> > + * The read AUX interval in microseconds.
> > + */
> > +static inline unsigned int
> > +drm_dp_aux_rd_interval(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +	unsigned int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > +					DP_TRAINING_AUX_RD_MASK;
> > +
> > +	if (rd_interval > 4)
> > +		DRM_DEBUG_KMS("AUX interval %u, out of range (max: 4)\n",
> > +			      rd_interval);
> Do you think it might be worth clamping the value to 4 here?

Yeah, I think that makes sense. It might also be worth increasing the
log level for this, perhaps even make it a WARN to make sure we catch
it when this happens.

> > +
> > +	if (rd_interval > 0 && dpcd[DP_DPCD_REV] < DP_DPCD_REV_14)
>=20
> Also small  nit pick: you can just use rd_interval instead of rd_interval=
 > 0

Yeah, I suppose so. I thought > 0 was making it really explicit, but I
don't really mind either way.

Thierry

> > +		rd_interval *=3D 4 * USEC_PER_MSEC;
> > +	else
> > +		rd_interval =3D 100;
> > +
> > +	return rd_interval;
> > +}
> > +
> >  /*
> >   * DisplayPort AUX channel
> >   */
> --=20
> Cheers,
> 	Lyude Paul
>=20

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2tZIgACgkQ3SOs138+
s6HX8A/8DacwJDyqrDa4GNX6+jugk6R6dxsc0VTH9H25CZpUwy+8DxXDjdBY3Wr5
Rx1pSD2rJooEZF9v+IJsYD6Sn4ZrEPfa/Tdzd+YbCZGkdQvO7dFbsIB91L7fPv+u
oNlGwXnKLBdTTZtxRJuvEUBKBVxB6kOoaSD1tDvCt9YPrOLpVUgiM3Pv/n4cK2L8
5plMSOIGp1Mt1KqRxLJTe21voDGqTMYwXBY7NhWlYoSR4R3ZqBHQr+cjplXXQKBA
SHG2wAPU43bSZpyeyod2IidEDVssc0Lrmuq2fznqbVJ/fB42I8PULiRZgREqKxXE
ew29Vd/s8fZw5U+jEczQvAnHNXWCgR10v20mjc/jMgUNA2wUdqfxxbemwp39wweJ
iXbQqzct+K4jHRGCsvTLnIPxNFVxANLePcqmQGf2V7MLSCP44Ec21zhLKmO8fc3/
GmISUnnMbvMr/tIwJoG1dpgE2q7/6mqicI0g6XRkUd1djC0Nq1xG0rwK7TsGJI+y
yRAEg+BXhtN6ud8awDMEsXP4c1g7NTAym2sp5x0LDq+aRpLj35umcehCWhNb6kMM
xn5+CyunOan2iIilcOMUdvywomFJfWmNBq7QTjo1Etkk1bJE9Tz3cJgcNEuk9wm1
WpFjQxUFJDXeLOTN4e2J5+baR59dStdZ+V5nInm6KnNJz85RiQQ=
=J92J
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--

--===============1472450498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1472450498==--
