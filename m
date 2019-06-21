Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386454E9FE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 15:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039B76E8BA;
	Fri, 21 Jun 2019 13:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D726B6E8BA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 13:56:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s15so6709806wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 06:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/DIMaSlji7ZIlnxDyKozOkAkwgbCCXj2vTiik3OAASw=;
 b=aC4wWEWA7ILAFhrg+O/BkTATPG3dku+kDIr8vxRT6uDkdqaPqizTgAlgR5GCO5OZHS
 jJnIc62XeYrFkWzbrjEMVAb7+iljl5FEBxUX1rw3m7BSLAzOEK+NEmaVMkdc2NvuWpgB
 x1wBZcBxnhGE/cHpQsU8+guC9Td9hG2A9PM7DUGXDNKQke3EQ3g78cFv8pFt4gpaO/xX
 AI4XjFQmnc0H7KKIZjG10nwKSn5ofX+d0zQjfQtmRzrZDHbbmgymGNOrD+WGE5p9gvm7
 YZiWp/J6cfCB0uZHBx3YMUFpG/r1KWvsAegfWL5HoPeuzhuJLtRiYAta5Val8k7PJYG5
 yInA==
X-Gm-Message-State: APjAAAVB8Pe371Zme/lTw62LHWacqJh1GrmUxvFKTl284poxwMjRLlAg
 D8TXMRJu7iFK0RlXC6TrCCk=
X-Google-Smtp-Source: APXvYqzqy1h6OQWgqgNmEmDviD2cZZkdEywQ4kW1Yanl64pYPbYKM6dAa4lSMcxwf6AEWoyr4JDJAA==
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr3981949wmt.136.1561125370316; 
 Fri, 21 Jun 2019 06:56:10 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id x83sm2188067wmb.42.2019.06.21.06.56.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 06:56:09 -0700 (PDT)
Date: Fri, 21 Jun 2019 15:56:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: pwm_bl: Set pin to sleep state when powered
 down
Message-ID: <20190621135608.GB11839@ulmo>
References: <20190522163428.7078-1-paul@crapouillou.net>
 <5b0f8bb3-e7b0-52c1-1f2f-9709992b76fc@linaro.org>
MIME-Version: 1.0
In-Reply-To: <5b0f8bb3-e7b0-52c1-1f2f-9709992b76fc@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/DIMaSlji7ZIlnxDyKozOkAkwgbCCXj2vTiik3OAASw=;
 b=UUIxir8ge2Vq6sEK1qUdOxvaLgEi0hBQz3PxGL54RMsSaWiWabMHyW4Sq4HU793OmO
 LnMVyOR7I/1+LkkL74Vz9nPcDkmDFxAvdnDrRFCBZI3rc9cvo3ADvgBV6P+EJbQhdc1t
 Symp1dRR947s5+aKqDwVFK5+Kf1R97P8FbLuVsziRclGJ75SpAJgiYBlwbgMVVMMMqio
 3wqolOT9Ih42mg2iFeamrsaTKyh1BQdjg3IEOLkhAiUq6uJa5+JbG4xh8Kx648CJa3aA
 8+CmdpadPhbyzBEMaCLkrEJmxDLHcR2fAFKoI1S94RGXcVf8KIfjlsZmq5tl/AqLvC2p
 Br8A==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============1726521930=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1726521930==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 01:41:45PM +0100, Daniel Thompson wrote:
> On 22/05/2019 17:34, Paul Cercueil wrote:
> > When the driver probes, the PWM pin is automatically configured to its
> > default state, which should be the "pwm" function.
>=20
> At which point in the probe... and by who?

The driver core will select the "default" state of a device right before
calling the driver's probe, see:

	drivers/base/pinctrl.c: pinctrl_bind_pins()

which is called from:

	drivers/base/dd.c: really_probe()

> > However, at this
> > point we don't know the actual level of the pin, which may be active or
> > inactive. As a result, if the driver probes without enabling the
> > backlight, the PWM pin might be active, and the backlight would be
> > lit way before being officially enabled.
> >=20
> > To work around this, if the probe function doesn't enable the backlight,
> > the pin is set to its sleep state instead of the default one, until the
> > backlight is enabled. Whenk the backlight is disabled, the pin is reset
> > to its sleep state.
> Doesn't this workaround result in a backlight flash between whatever enab=
les
> it and the new code turning it off again?

Yeah, I think it would. I guess if you're very careful on how you set up
the device tree you might be able to work around it. Besides the default
and idle standard pinctrl states, there's also the "init" state. The
core will select that instead of the default state if available. However
there's also pinctrl_init_done() which will try again to switch to the
default state after probe has finished and the driver didn't switch away
=66rom the init state.

So you could presumably set up the device tree such that you have three
states defined: "default" would be the one where the PWM pin is active,
"idle" would be used when backlight is off (PWM pin inactive) and then
another "init" state that would be the same as "idle" to be used during
probe. During probe the driver could then switch to the "idle" state so
that the pin shouldn't glitch.

I'm not sure this would actually work because I think the way that
pinctrl handles states both "init" and "idle" would be the same pointer
values and therefore pinctrl_init_done() would think the driver didn't
change away from the "init" state because it is the same pointer value
as the "idle" state that the driver selected. One way to work around
that would be to duplicate the "idle" state definition and associate one
instance of it with the "idle" state and the other with the "init"
state. At that point both states should be different (different pointer
values) and we'd get the init state selected automatically before probe,
select "idle" during probe and then the core will leave it alone. That's
of course ugly because we duplicate the pinctrl state in DT, but perhaps
it's the least ugly solution.

Adding Linus for visibility. Perhaps he can share some insight.

On that note, I'm wondering if perhaps it'd make sense for pinctrl to
support some mode where a device would start out in idle mode. That is,
where pinctrl_bind_pins() would select the "idle" mode as the default
before probe. With something like that we could easily support this
use-case without glitching.

I suppose yet another variant would be for the PWM backlight to not use
any of the standard pinctrl states at all. Instead it could just define
custom states, say "active" and "inactive". Looking at the code that
would prevent pinctrl_bind_pins() from doing anything with pinctrl
states and given the driver exact control over when each of the states
will be selected. That's somewhat suboptimal because we can't make use
of the pinctrl PM helpers and it'd require more boilerplate.

Thierry

> > Signed-off-by: Paul Cercueil <paul@crapouillou.net> > ---
> >   drivers/video/backlight/pwm_bl.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >=20
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight=
/pwm_bl.c
> > index fb45f866b923..422f7903b382 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -16,6 +16,7 @@
> >   #include <linux/module.h>
> >   #include <linux/kernel.h>
> >   #include <linux/init.h>
> > +#include <linux/pinctrl/consumer.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/fb.h>
> >   #include <linux/backlight.h>
> > @@ -50,6 +51,8 @@ static void pwm_backlight_power_on(struct pwm_bl_data=
 *pb)
> >   	struct pwm_state state;
> >   	int err;
> > +	pinctrl_pm_select_default_state(pb->dev);
> > +
> >   	pwm_get_state(pb->pwm, &state);
> >   	if (pb->enabled)
> >   		return;
> > @@ -90,6 +93,8 @@ static void pwm_backlight_power_off(struct pwm_bl_dat=
a *pb)
> >   	regulator_disable(pb->power_supply);
> >   	pb->enabled =3D false;
> > +
> > +	pinctrl_pm_select_sleep_state(pb->dev);
> >   }
> >   static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
> > @@ -626,6 +631,10 @@ static int pwm_backlight_probe(struct platform_dev=
ice *pdev)
> >   	backlight_update_status(bl);
> >   	platform_set_drvdata(pdev, bl);
> > +
> > +	if (bl->props.power =3D=3D FB_BLANK_POWERDOWN)
> > +		pinctrl_pm_select_sleep_state(&pdev->dev);
>=20
> Didn't backlight_update_status(bl) already do this?
>=20
>=20
> Daniel.
>=20
>=20
> > +
> >   	return 0;
> >   err_alloc:
> >=20
>=20

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0M4fUACgkQ3SOs138+
s6HOkQ/+LbUhpnHIQP1vYEaPlj84ZxnKK1Y2dsbvsBPgry6U/vvqXTICQ/Z25op/
Q3PbxTQtU+XnulIhDNfGiwDm426bxBI7XGWfYuYqCjMgkWjlnozlNKCS+GUU4hno
asckWM11gkQ5BIFQDtzaeof6HPezKy7UJ/PT6TrQuAkJmKiNPfXdcLpJ4Qe7FsR4
TRRIDQBdulh20rsyxUNcbhQRAMX6y8rL8rZNAHkZpYQSyGTNxMd54pJDiNuhGpDY
zvti2jQdLMWn9+7AwaFeu2aZ/a88Xc3OYMoRozSBs9iRQKQE7Patba45fqVBRB2k
h3ZXRU0P27wmsi7MmlBsltv21jIFLKsDoNrfPmy76ON09iaTSVA67jQq2SovLZO2
MSyFKSARWe7jVEknURpy2R3MHnhsxy6lvqu5919RcwCjBQ1MkOW/C0ItZMMXlvEl
XV4XERYdNAEbneTkqbx5LdekXzrnq69Dkauaonac7yF++xKVb+3a+G71rbd5/2B/
19MYN6r3eSz/C8Q88oqnXJ/yloPrvdh5l8hMGMvWD/8dUVxbBW8NObCnotjLjNIm
WKGYcQuX5scJtrSopF30GClAeM+lr7pmj9v0PwOB1b0ftx1p/wNIsucLqhMk//fs
pnW9J9GG6wlsWFwKX34QDfbfWnWgCpwrDqS9ooXO5tsh8oJZdTA=
=x+jh
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--

--===============1726521930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1726521930==--
