Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F2B25BFC8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 13:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F222B6E99A;
	Thu,  3 Sep 2020 11:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C9E6E99A;
 Thu,  3 Sep 2020 11:00:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b12so2176523edz.11;
 Thu, 03 Sep 2020 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yYnEhusLXt+hTyNwij80s+Gh0oRryAwxqx+BI6vUKbE=;
 b=gTvX8FwXfFQlpDzzVsS3ip59h/XuerPrvVdnqrG5HcIi0cwxOp/w/0CGVCLZiXunDa
 Si4JRPhN46mTAW0harbqSN0VL6x4uD/uUbpUahC0z9lIAn9G998blexk8fAo0McVyy2q
 J7iMSvDdzMXtnMx3ZO3cK9AgTQF1qPFxtYxyEcrDlQTimYuw6VSjxjSwIohmVkPS0jZ7
 UWyAoP+0ISccomDzz9ok/mpEuW6NAk5wgeSNurjfk2MLkTUQmFUuWZ4jpfKkfyJs5Ff2
 /oIF3cC7+96yKk25gXRHoMvtIpYK7wy/zEsu2WUrhJqLd1/b5SMEsXneE4qoSShVejDt
 PT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yYnEhusLXt+hTyNwij80s+Gh0oRryAwxqx+BI6vUKbE=;
 b=Qn1fkkd9UPKrEliIoJRHC65zA66XMoQVdvcIripV9+WAfx5kzw1AOOAsmjnVHx7Aus
 d7zeuN6rvcCUIs4SrilbNM8e+ghZQFrOH6pMOTkj3305GDtQxDNkKIXGOWQJdmanbotl
 w4z3aBrl+nWZTTUKl94YPQ4nBR2tRVwe3OryRGkmmvobKh0eLiXhKQWX7vL3myydDowE
 cUayk+fzLvA8JMvyl5imrMnh0w3u38KlLRhKyXOoiqSPSIjQad68YPdQ1pbLAthK3X++
 9/OUBWmOAr+E3bgmtkksAi3HaYHRIY2l2OMmZexsKIKm1AOnvHfqvGlyNZOChnGtDfyZ
 Kt5Q==
X-Gm-Message-State: AOAM533Ft1PUuHJaKFACTeRcYG0jzsW07KGX9kK0JbUHg6YbsaqIOOf/
 wASFS+sfhhzSWl/nwxmceCk=
X-Google-Smtp-Source: ABdhPJwwigy71b9GHpZk/fZqbXWJuk42q2qwbW6hq0JrDrtGYE2aQTX2CZ9GJMutQVQv23fU0NgwLg==
X-Received: by 2002:aa7:d417:: with SMTP id z23mr2362298edq.62.1599130815291; 
 Thu, 03 Sep 2020 04:00:15 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c8sm2877359ejp.30.2020.09.03.04.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:00:14 -0700 (PDT)
Date: Thu, 3 Sep 2020 13:00:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v9 07/17] pwm: lpss: Remove suspend/resume handlers
Message-ID: <20200903110012.GB3756465@ulmo>
References: <20200903105114.9969-1-hdegoede@redhat.com>
 <20200903105114.9969-8-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200903105114.9969-8-hdegoede@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1269301440=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1269301440==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 12:51:04PM +0200, Hans de Goede wrote:
> PWM controller drivers should not restore the PWM state on resume. The
> convention is that PWM consumers do this by calling pwm_apply_state(),
> so that it can be done at the exact moment when the consumer needs
> the state to be stored, avoiding e.g. backlight flickering.
>=20
> The only in kernel consumers of the pwm-lpss code, the i915 driver
> and the pwm-class sysfs interface code both correctly restore the
> state on resume, so there is no need to do this in the pwm-lpss code.
>=20
> More-over the removed resume handler is buggy, since it blindly
> restores the ctrl-register contents without setting the update
> bit, which is necessary to get the controller to actually use/apply
> the restored base-unit and on-time-div values.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pwm/pwm-lpss-platform.c |  1 -
>  drivers/pwm/pwm-lpss.c          | 24 ------------------------
>  drivers/pwm/pwm-lpss.h          |  3 ---
>  3 files changed, 28 deletions(-)

Nice!

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9QzLwACgkQ3SOs138+
s6HB4w/7BWTWBa37E/k/JCj9g8/G5zhz6bPtbVQvfjK9uo2SR3Cw9i8ICbGP4kBz
Hws/izNzkiZT1xylqpMH29fNoLekSTTmA8xxMMwGwbxlqEWdGXgOzKR5cgJ25rCb
VmEvNxXpITvKR7PeHDrUspOtpZl3CscbScJDA2vxE7W0SeTF2iO19fgF8B//u/tu
DUQ7aEiORHBGwnIMefulW3bYO2yq8iFG18Iq+vVnPIcak/YqYxKlDaDs+5jY/Oqa
Jqh250h+36HM0cSYvSMxIqDV1pP6HarcgRavj5daC1V/ymQqZFfmmiq+XVplJSxO
+CPyioI2QcaRX2iQtOUFd5aAQSaj3E7sKCsv9APE2TqSushpoufrkwnKi1/1lIll
YMzlXmVRivUg94dYeKWASJ5D9wWzCz5H67aBtu5V21oNcZc3L7Y1Xuztyxhp9ESH
TDEIiFxqDyritfY+jqC4XXJiwtQYrI16310kEwi2wFA3PB4x2tRmWAi6BQuU5+tU
y7hCBcSZZaOxbVlKG2dHsUawLT4pJ35G73YjsPzsJJLFfHN504aVSLIbZEogNt3r
jq466Qm87cD0M6eqT8b338dmUffjZn+bJtp6b0i9FRny+i0Yy3z4KfaT7kh0EP79
OsdzaUeoPDhyFupUt5Rai5wmOflTsqOupN4bA4OEKDwD8XM35f8=
=hZTz
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--

--===============1269301440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1269301440==--
