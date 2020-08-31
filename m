Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91525780A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD28289907;
	Mon, 31 Aug 2020 11:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F8E89907;
 Mon, 31 Aug 2020 11:15:50 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l63so5022241edl.9;
 Mon, 31 Aug 2020 04:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wB2qZKe8kJ4DOSk+iMZuE+HL46/zEWqLBDYicDmejYQ=;
 b=NqltErlr9fRjntqRGNJfCqQ5EzbMfOP6JdW3aSDVaoP6PV1Uzn8d0pmeZcyl268UYE
 MgdN3RwHVkz0L8BhZiwj4WJQWMNatQEY8fLA01vicXaPl5BxH/HlQJVmNV3dEuOhYzf5
 TjAwNR01gf11HnJPX44qxwISgRhgamZ5tq7T2zcKN6OTJhhC4gUrqTgnWXQ/RSUHmMRy
 cZIp179TQsjYMBm78SxHyM9suPwrENrBnc7xirlCjflw0X65Nzk6PBvhl/hLFMgl4urq
 +3ODlAjG5EnFZEKMCg3ObRBFAh6J/9Izma49CKVw747hQIueqHVmdVXaFuIpFkjzknYM
 mPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wB2qZKe8kJ4DOSk+iMZuE+HL46/zEWqLBDYicDmejYQ=;
 b=DkFzGCEVcNBBVJlPz3Jo7Q71yoW6vFLFEGZl10aQJnVJHpmVINmF3FCfkPqWMMU9dt
 T4HoG8c2snRp3GleU4WxzjLzFKQ/I3lKp+8RJRCPUZMnmMlg5bivhFyW4z68kCjMC/q6
 AfYguDdVjH5GbSEH5n8VkdFAmfbGJN7ImEex6X6Sbm4UYuPSH27xjMjqW4y6qi1z8cI5
 lWsDyX+cCksSGh2njD7WzKP7iBy0R4F1fZgMMuRKP/Y9qaES+J0ysQ2M/H2886ElfZ3s
 86qTXJHuVyaNN2CEOobpDKnnFSgUCWb+VqtccnwCg6IIfV4noP+bQukKt1ifEhg4sdQi
 yoTw==
X-Gm-Message-State: AOAM5323c7LBzwIMit6uXcLojx3MEo3MqIaCE38ZSjOiNJUzAv0d0mQN
 6/77B0SQYadk9hnvHMmV2XdaWbFBRjuu2g==
X-Google-Smtp-Source: ABdhPJy54EuS2k166Uf/hEVlXns0X/peHx00E0yh/sQjntKViO0xu8sUkwn/hHO1sds2siIEFmhmSA==
X-Received: by 2002:a50:ef15:: with SMTP id m21mr759661eds.300.1598872549215; 
 Mon, 31 Aug 2020 04:15:49 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u10sm7436744edo.14.2020.08.31.04.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 04:15:48 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:15:47 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 10/17] pwm: crc: Fix period changes not having any
 effect
Message-ID: <20200831111547.GI1688464@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-11-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200830125753.230420-11-hdegoede@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0188537666=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0188537666==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="svExV93C05KqedWb"
Content-Disposition: inline


--svExV93C05KqedWb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 02:57:46PM +0200, Hans de Goede wrote:
> The pwm-crc code is using 2 different enable bits:
> 1. bit 7 of the PWM0_CLK_DIV (PWM_OUTPUT_ENABLE)
> 2. bit 0 of the BACKLIGHT_EN register
>=20
> The BACKLIGHT_EN register at address 0x51 really controls a separate
> output-only GPIO which is earmarked to be used as output connected to the
> backlight-enable pin for LCD panels, this GPO is part of the PMIC's
> "Display Panel Control Block." . This pin should probably be moved over
> to a GPIO provider driver (and consumers modified accordingly), but that
> is something for an(other) patch.
>=20
> Enabling / disabling the actual PWM output is controlled by the
> PWM_OUTPUT_ENABLE bit of the PWM0_CLK_DIV register.
>=20
> As the comment in the old code already indicates we must disable the PWM
> before we can change the clock divider. But the crc_pwm_disable() and
> crc_pwm_enable() calls the old code make for this only change the
> BACKLIGHT_EN register; and the value of that register does not matter for
> changing the period / the divider. What does matter is that the
> PWM_OUTPUT_ENABLE bit must be cleared before a new value can be written.
>=20
> This commit modifies crc_pwm_config() to clear PWM_OUTPUT_ENABLE instead
> when changing the period, so that period changes actually work.
>=20
> Note this fix will cause a significant behavior change on some devices
> using the CRC PWM output to drive their backlight. Before the PWM would
> always run with the output frequency configured by the BIOS at boot, now
> the period time specified by the i915 driver will actually be honored.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pwm/pwm-crc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--svExV93C05KqedWb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M2+IACgkQ3SOs138+
s6E5KxAApXK34q3C3ieCWdzG1PdQ1k6JHm5UL/g7oRjpm8tKaVsZBkQUaG7zwYuQ
jkG6bBRDtF/X2CLcncU4Dw6UYGzTcmh6byoYAkBggVgVVK789jq60jB87snEW8Wd
DhnT5eO/XWiJmBT02roJYDpo02kmysXPJfP4224Be6aRfxaD0DVCpa4LAKFHYeSk
Pu/u1ydColi8w2mgMb+MKj2bB8QNsaBTrG6N/BI1IwNVsUkerOQ9EjnmVy2f9b2N
0eWgby389QqZ242pVrWs8o6WOe/Ju+2Sq7POWLTBmiab3u2ngxPRRkiUDr2ZI9+l
Auz8Fa8n1aOHRvIggyr/5oXH6UtqmcxIqWLL+D037/zSaWCmZsr09fLA8K+ZHpYg
ymffnKrABbhMZciobvNrfbxQXGZQp2xp1oAqTAv0qrtuILYneL/sqA1vn24eNsK1
j1dDf5oDGrCij0ySeFx0dnKeEPfdRwGGC5fauVUoFwAxGonUFwiAcT1Ad6fOJvNG
+w45vNKkn41+xl4FcpdmrEZRjogheai96ZMJVo/bJMnFawIxG7N9mDLMEH5biU3D
U1YcTHdu5i2MYvALntwgOJ5kgRkjNIwbXRKqXNStimcmPq3I9pfaeFjkyvBiHTbt
FChyPvjlvqBIqizaoy8CEQRPXRZ9eRQWCI90n3ax64irhCtkGdY=
=bb6R
-----END PGP SIGNATURE-----

--svExV93C05KqedWb--

--===============0188537666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0188537666==--
