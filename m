Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53E2577DF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33A789FF7;
	Mon, 31 Aug 2020 11:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5BB89FD4;
 Mon, 31 Aug 2020 11:03:14 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id a26so7947536ejc.2;
 Mon, 31 Aug 2020 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qiWf16bEkbIxIbt47pSSmSFJYYSoidLtqGuD+HmFqX4=;
 b=jUoOJFwVgB8HUTapnyBOZFJbVgSUKZl/UWcPBcV1FrIZoZgHZYSDZhloU9z81Z0Asg
 cN9MM2pOooJevU6dOAa2CrWeHvZ6FpaJls5JSUwJF1fMRQRMXfw3E4nXATmnGj0u13e3
 sdjq515ETDQ7C+Sxpnd3Z9hsHJAmb/itrTm44c2k6vKWhaO/yrsKNYVreaNOFUHdg3GW
 HBeTuXAFOLbuzOSYM79c2xlWkWLj88FQ2lmRliS4kQe1kbMTLxkYn16BBwhmb+CKIWo9
 4ZMJTKQuOFyunHlXoTLeutzDeMCNq9YWOTe0RowQwtl0+9iiEtI4C7DYIgBvUQkEn1b3
 Q0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qiWf16bEkbIxIbt47pSSmSFJYYSoidLtqGuD+HmFqX4=;
 b=fP6bfHfVnAER7F8iEYic0vonmPw91Z8NQ7EIaPlae3PZpWQuSJknuKLcn2flXT1dAz
 ezUFvmtxkq8GSOi19mFGEBl6rjFFUFvXpN6KXwaUCQkJ0GaXO7CqCt2Z9dNpU+GGb8jv
 F5s/NApsJbgs3PWo886DEF/O4gV+BiMbutNgnILLeKravJjdpvHq6pVnD5TBhvQ/eeKr
 d80162jTr2O9XGX+kVjwPReeLJIsds9xmMGigGOzyTmHQfXpFFk+9bzCIH32aTpSzQ4R
 Rfl8oe8fPQ68jo7KvHn0uTLd9hhRSYAeW8h/8LIBzWfPevOF8lgFtgRJHY5QDAsm2wH2
 EQIA==
X-Gm-Message-State: AOAM532iD50EiWtGQ6OZNbXjCDuWosYoVl7uddbiaW5zpYWqwLfJfH66
 qVJ7YyHLmDvgjlfp8yXdZCM=
X-Google-Smtp-Source: ABdhPJxpalZvGztc9OM/9Nrw8ULCaRGBBhIMcbzO/TmzeKrer6F4s8xg0IzOsJgoiV2F1GmjjYtweg==
X-Received: by 2002:a17:906:12c7:: with SMTP id
 l7mr594853ejb.306.1598871793227; 
 Mon, 31 Aug 2020 04:03:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id w6sm8002543ejy.63.2020.08.31.04.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 04:03:11 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:03:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 05/17] pwm: lpss: Add pwm_lpss_prepare_enable() helper
Message-ID: <20200831110310.GC1688464@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-6-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200830125753.230420-6-hdegoede@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0039316767=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0039316767==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 02:57:41PM +0200, Hans de Goede wrote:
> In the not-enabled -> enabled path pwm_lpss_apply() needs to get a
> runtime-pm reference; and then on any errors it needs to release it
> again.
>=20
> This leads to somewhat hard to read code. This commit introduces a new
> pwm_lpss_prepare_enable() helper and moves all the steps necessary for
> the not-enabled -> enabled transition there, so that we can error check
> the entire transition in a single place and only have one pm_runtime_put()
> on failure call site.
>=20
> While working on this I noticed that the enabled -> enabled (update
> settings) path was quite similar, so I've added an enable parameter to
> the new pwm_lpss_prepare_enable() helper, which allows using it in that
> path too.
>=20
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pwm/pwm-lpss.c | 45 ++++++++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M2O4ACgkQ3SOs138+
s6FcaBAAmahm7vjnpEjic+s1cnpr0uL01wcrb3qNbQNL6mIidS0z9E6STXPkY5f0
qLpKaWjYR4iNTxu/Ygu4HhQY7z2ApkY/2L70fidb8uhac0o06DBmXXBgH5fkOq0r
kjZ206Chh7gBwiD1BtW/Uvt1nK4VtBAWuxybt78oOGV2B5a35TW/PNdY0VGiP6KS
kS7oPJctfvzevNcsyXNt2uiKfOWtDIgU/eLLLO0X/U3h90jDYghljDIUEA4dlG8/
3RghmPV2pP5QuzfSXn7FCRZbbT9ZdrTCj9ZUcPIlrIIOQZEkaWsUOlkgmYewWPXq
BcIlRqidHLQIlkJiodPo/A0MEncupBKnNh3zszR1XNquCBaRw05O3Z+y0KjKmXOT
k2CerltsPRBVwEFLeaWuRlERlJCc3DY1bwD1NG9SbDmPlK4Y2pdIiz0llUNpe9gF
PnMnbCxBoA0QmK6mJvbQJT3HZsIodDBqCzFyd2Smj5uA8fDRkYWrLCRnHIiGTvj4
uqp0ysjaR54ZTMbbJ+swkgYOuP/TaHfHE3y7eIOZSPnePe+zC0k/LXQ/5QqF8MHm
rKPHAYK+dKjiF7j/uCz+rUIkF63z6FSHjxRkPxVhfJSWicURqTKPI4sOweSqazr6
lB4xqswBFHfWUJqRb+xqb/EXJPvWGMoE1sTqqKu/n0rWZk0p2AA=
=xuNM
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--

--===============0039316767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0039316767==--
