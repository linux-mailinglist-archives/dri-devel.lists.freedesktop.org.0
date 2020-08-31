Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7A257816
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92DB6E0F9;
	Mon, 31 Aug 2020 11:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEF36E0CA;
 Mon, 31 Aug 2020 11:17:36 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id b17so7928315ejq.8;
 Mon, 31 Aug 2020 04:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DSSVd8p6/dHeCEBoP4aiz1EfuW8J6OaQI2DYqDCSq5c=;
 b=KJVm8zv0+8kriTrjuETpgAnoY27wt07gGtULILLJX7MCS1Ed9W2T0Ba2cihQ4octqu
 mU5WlmkWuDiXycn+pLJ8pLmvsTyGCWRBNIxFljC8ZR9Bi7ssUcOeG6hHyPNxz3SXdwpY
 dbRd8bjqzcz/bMXTHBaqyQ8TK+T5ELY10qGCvLMJmQvKgb28O4e+NAlnRZY//ZdcwxPs
 rWalvhMFcitabEYR0o+JjzWOvhKzEp3f81GnSsCjMuiHb+srpv7+jt0a9aqOeUJfSz41
 +cFGIcAU9msGESVS1wuCLb72WisiJ0Q9L9t6BmeFOPSNrqTYvh9cuQl/LG4BoLko4/tU
 UmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DSSVd8p6/dHeCEBoP4aiz1EfuW8J6OaQI2DYqDCSq5c=;
 b=ZsEJg3ESJWBRGtxP8P2SJ4d4jrh6JRY7oVSxRFplqSmT4HijlBeaG7UsAmDkW+ui63
 diFqLyVOM1MZ2j4HiEgULG/t50CZzoJkmikC3RBvQqb35Luwt9t+xguuG9TWcJbEk0hF
 su6v1yLLsm2spGtyU0PNbLDnG0A3o6zJK2RlTi6msAFfMQWMmQqM4nkJ7L9qtDVTXfax
 qim8qaF5IVm1uHLazdvLxE8XkOZlzx24aKS0eLYQh+43jOF/W3aRLdrcWquqhkLGLksu
 qW1CxXN6I275AcyNtvU/WQ1XJcTE6uGEIMGksHd3E6OKzZMM6EUZQGo6EVBEu2yCYFUc
 8HVg==
X-Gm-Message-State: AOAM530waiR+SmDSa8pLlxkTcJay+K69cT5AkgLD7OQRSCqqocQhbd+0
 f+OOre2X2y19f8gMwFZu848=
X-Google-Smtp-Source: ABdhPJyQ5vu+8Qs6gYtaLvyhMSoJ9W6H5b5/CY8OKCToCH0O2wKCDeXkfoJz2rWxd0eEG9p8UH/bkA==
X-Received: by 2002:a17:906:5246:: with SMTP id
 y6mr656291ejm.316.1598872655608; 
 Mon, 31 Aug 2020 04:17:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id m12sm7211555eda.51.2020.08.31.04.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 04:17:34 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:17:33 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 12/17] pwm: crc: Implement apply() method to support
 the new atomic PWM API
Message-ID: <20200831111733.GK1688464@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-13-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200830125753.230420-13-hdegoede@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1055657420=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1055657420==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2feizKym29CxAecD"
Content-Disposition: inline


--2feizKym29CxAecD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 02:57:48PM +0200, Hans de Goede wrote:
> Replace the enable, disable and config pwm_ops with an apply op,
> to support the new atomic PWM API.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v6:
> - Rebase on 5.9-rc1
> - Use do_div when calculating level because pwm_state.period and .duty_cy=
cle are now u64
>=20
> Changes in v3:
> - Keep crc_pwm_calc_clk_div() helper to avoid needless churn
> ---
>  drivers/pwm/pwm-crc.c | 89 ++++++++++++++++++++++++++-----------------
>  1 file changed, 54 insertions(+), 35 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--2feizKym29CxAecD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M3E0ACgkQ3SOs138+
s6FjbBAAtshiQemFYzlF29cpAiz3Y8sEV7441JLRKFgwbpreSRChITG83WrA/Wbp
Ica8diIGjrL07RYcAnm6T+pLsXI2Ep0GyJ0QxQyk08KKXDIZQOaaW90F6P0iu1nK
drHNm3bbHrAUM0Mjw+H8FQHqggFUr04ugC8y8b44fdUSdg2nwRtUbiKtSreGQWsu
Jg/Zukj7QNod54XzQGtR6RVxlt/99B6g69zGhiwDVwNbuIuFs+SBiaTa7zhQWUdh
qRjbbnLnUYELBa6Dn3oDXDCNUDFTG1zHNwJUVNoDmD4TMPBId6hStZkWVVSpRpZZ
XZiiiv9K6JD9a94XwkQbHvf+oaL3xxazt2roDaLNtyHoIxuaMiMgkMFqk7VJLxil
Jln+1PuEZF7IIqiKsoNTmFZ8bFAJWErv9grdDMNVqMRL8ThcS6vRN4j28oHn+GWA
AlhzxP4kiIQ6Fgz9aUwJNqhbFQdInriBLQ5PIWFJONM4U0uPrfi3mwOARoGNFFFE
SifX93MB7CdAZJCDKz1aQX4MvEUL9SDzcOGSpPGtZZHeCu+F3daJs2rNHK2wSeg9
CMYULqOBSyQhzjbIqfocinzZNUNkW6h/YRazDuXU/tgnByCV/nYZFfMqPSN+aYSD
vnDB5WvyzCI8xwGr0/8OjE8+e+LivnIMSIu/E77H+pBaLnJN2oE=
=VWBE
-----END PGP SIGNATURE-----

--2feizKym29CxAecD--

--===============1055657420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1055657420==--
