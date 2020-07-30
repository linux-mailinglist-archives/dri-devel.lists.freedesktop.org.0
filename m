Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77C232F7B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 11:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A676E8A8;
	Thu, 30 Jul 2020 09:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACB56E8A6;
 Thu, 30 Jul 2020 09:26:56 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id l23so5726965edv.11;
 Thu, 30 Jul 2020 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Z5rcJ3PIRid71pmNvabLfr1qVb/Jv0urwP+jgUIadm8=;
 b=gVVvIofRYNzrHOGvf+MLexZ/iMvev+wnDlg03ZiQL0XjxMzgZJIS46g/1ebfuI6M54
 zN4BjLh1FKl1ZvpJf9yiUxuBJkORERBG972Qgj07ud+e5RTG1Wgih8FRUibfEUvmOtvg
 hIQP0FbV+LRGZgR3lDaczNKx+KYViTzdMdxcJCV8Rql/oVfKW6c+9Cy8oGw0R/Xe261t
 XqsgKpnYQB0Qkdan1xPgSZKVsJulKQnWzx8d6CU1Sm3BVke8uR8MokFHnbmZXiPGIRoZ
 eL+c/ILPwwP23qKAnqQbxpga1C/MHmF32tgNL3paI9qIlICuBQU1uRwCpOSD9N9Wp4dh
 KPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z5rcJ3PIRid71pmNvabLfr1qVb/Jv0urwP+jgUIadm8=;
 b=sO00sx8JhScZlWh3fZuDdPqZOTG9sUkDhlA3JKFGjg1zZ2exnk/9+k4nFIhWVujUP0
 Lo/gqCvpt6mUTfVWWTi89tD4hTt0YC/fj07LDIbDxYdYnOvu3kdMGA2FzvW2c3T6nHd2
 N4dq+HpUQx0OFCZrgaGCpl9fWX3zxaKYkAwX80hNSd2pP4mnO4pVtiBCdwLG2Vz1+AsR
 axw9EEUDavsb/XsBDrjKbS6X4YtdXtgqbyJSTCsfJDtcgK3wVajFNBPwX+FMmkMAWkkR
 R4vqsHhw4xfmhdW2Uwcedz+pmyFgjzVC+cacqGBVwvb0TAms8GkdVNjSm42CATXgwtGC
 TwNw==
X-Gm-Message-State: AOAM532VRtIcTMP6mTiYIS53/h8Fwgz7Ms0+3HNTmy/qmEpT/9i4wXe6
 hsg3e8+3fZ8uGdbT9pZkwVk=
X-Google-Smtp-Source: ABdhPJxS+qC3fU+sNK3opLqUlnMGjMvQo3Y+b/Ur5QYKMQbMzwsapHjaf7g5HNrCtiikFyVAmyBM/g==
X-Received: by 2002:a05:6402:17ab:: with SMTP id
 j11mr1776286edy.28.1596101214648; 
 Thu, 30 Jul 2020 02:26:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id js19sm5332164ejb.76.2020.07.30.02.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 02:26:52 -0700 (PDT)
Date: Thu, 30 Jul 2020 11:26:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 00/16] acpi/pwm/i915: Convert pwm-crc and i915
 driver's PWM code to use the atomic PWM API
Message-ID: <20200730092650.GA4077384@ulmo>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200727074120.GB2781612@ulmo>
 <20200729082305.GK3703480@smile.fi.intel.com>
 <b87c535a-022f-2894-1e38-5be035c6fbfc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b87c535a-022f-2894-1e38-5be035c6fbfc@redhat.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
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
Content-Type: multipart/mixed; boundary="===============1836544369=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1836544369==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2020 at 11:32:28AM +0200, Hans de Goede wrote:
> cHi,
>=20
> On 7/29/20 10:23 AM, Andy Shevchenko wrote:
> > On Mon, Jul 27, 2020 at 09:41:20AM +0200, Thierry Reding wrote:
> > > On Fri, Jul 17, 2020 at 03:37:37PM +0200, Hans de Goede wrote:
> >=20
> > > I've applied patches 3 through 12 to the PWM tree. I thought it was a
> > > bit odd that only a handful of these patches had been reviewed and th=
ere
> > > were no Tested-bys, but I'm going to trust that you know what you're
> > > doing. =3D) If this breaks things for anyone I'm sure they'll complai=
n.
>=20
> Thank you for picking up these patches, but ...
>=20
> > Can we postpone a bit?
>=20
> I have to agree with Andy here, as mentioned my plan was to push the
> entire series through drm-intel-next-queued once the last few PWM
> patches are reviewed.
>=20
> There are some fixes, to the pwm-crc driver which change behavior in
> a possibly undesirable way, unless combined with the i915 changes.
>=20
> E.g. there is a fix which makes the pwm-crc driver actually honor
> the requested output frequency (it was not doing this due to a bug)
> and before the i915 changes, the i915 driver was hardcoding an output
> freq, rather then looking at the video-bios-tables as it should.
>=20
> So having just the pwm-crc fix, will change the output frequency
> which some LCD panels might not like.
>=20
> Note things are probably fine with the hardcoded output freq, but I
> would like to play it safe here.
>=20
> Also Andy was still reviewing some of the PWM patches, and has requested
> changes to 1 patch, nothing functional just some code-reshuffling for
> cleaner code, so we could alternatively fix this up with a follow-up patc=
h.
>=20
> Either way please let us know how you want to proceed.

Okay, that's fine, I'll drop them again.

> > > That said I see that Rafael has acked patches 1-2 and Jani did so for
> > > patches 13-16. I'm not sure if you expect me to pick those patches up=
 as
> > > well. As far as I can tell the ACPI, PWM and DRM parts are all
> > > independent, so these patches could be applied to the corresponding
> > > subsystem trees.
> > >=20
> > > Anyway, if you want me to pick those all up into the PWM tree, I supp=
ose
> > > that's something I can do as well.
>=20
> drm-intel-next-queued is usually seeing quite a bit of churn, so the i915
> patches really should go upstream through that branch.

During my build tests I ran into a small issue caused by this series
interacting with the conversion of period and duty-cycle to u64 that
I've queued for v5.9. This causes a build failure on x86.

I have this local diff to fix that:

--- >8 ---
diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
index 370ab826a20b..92e838797733 100644
--- a/drivers/pwm/pwm-crc.c
+++ b/drivers/pwm/pwm-crc.c
@@ -76,7 +76,9 @@ static int crc_pwm_apply(struct pwm_chip *chip, struct pw=
m_device *pwm,
=20
 	if (pwm_get_duty_cycle(pwm) !=3D state->duty_cycle ||
 	    pwm_get_period(pwm) !=3D state->period) {
-		int level =3D state->duty_cycle * PWM_MAX_LEVEL / state->period;
+		u64 level =3D state->duty_cycle * PWM_MAX_LEVEL;
+
+		do_div(level, state->period);
=20
 		err =3D regmap_write(crc_pwm->regmap, PWM0_DUTY_CYCLE, level);
 		if (err) {
@@ -141,10 +143,9 @@ static void crc_pwm_get_state(struct pwm_chip *chip, s=
truct pwm_device *pwm,
=20
 	clk_div =3D (clk_div_reg & ~PWM_OUTPUT_ENABLE) + 1;
=20
-	state->period =3D
-		DIV_ROUND_UP(clk_div * NSEC_PER_USEC * 256, PWM_BASE_CLK_MHZ);
-	state->duty_cycle =3D
-		DIV_ROUND_UP(duty_cycle_reg * state->period, PWM_MAX_LEVEL);
+	state->period =3D DIV_ROUND_UP(clk_div * NSEC_PER_USEC * 256, PWM_BASE_CL=
K_MHZ);
+	state->duty_cycle =3D duty_cycle_reg * state->period + PWM_MAX_LEVEL - 1;
+	do_div(state->duty_cycle, PWM_MAX_LEVEL);
 	state->polarity =3D PWM_POLARITY_NORMAL;
 	state->enabled =3D !!(clk_div_reg & PWM_OUTPUT_ENABLE);
 }
--- >8 ---

So perhaps you want to integrate that or something equivalent into your
series.

Also this could result in a tricky dependency between PWM and drm-misc,
although if you're targetting drm-misc it's too late for v5.9 anyway. In
that case you should be able to rebase your series on v5.9-rc1 when it's
out and then you'll get the prerequisite PWM changes for the u64
conversion as part of that. No need to track the dependency explicitly.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8iklQACgkQ3SOs138+
s6H3Mw//b+1gLqtJsfdaGmX8Xz0xgbWmQ24cqIr1HBnuEgytvm4zS0hC7jHPujb9
DB/8b+IyzICj750/d/sa+B7sfz//5LgsEz97I4QhHyyzNStZpk9oYtsTEaX4qOYj
nfE2JTP3vDSUtejtScTSABOyjYrj1NrXKRZ8+w6BIlwA9m074LoO/nZpEGEOKuFw
SjSzG3kbuu9FlQwkvyWfZaIoiRk3yOjz+3GJFJbk7JdFPD/360BiAEHvU9Xphuex
nlRG6nm62M+NlnCVOYLiBKOEwMFB+LJTfg+L8SzeLgU/KRKNGcOZ2l0iTME/Tr96
qCDhCezgjcFJwRiiXUOKBzAsmZYEqFkg+9iM7cULnoLxvAvahJcsGmdv1M3HD4Tj
mywN4uVtqPMgsCFm+5Jde75VncxLIDD4n9JGP0RPMNDIBCcS1FHMDSxaUDKIkvN8
7gTIS4Evd1qmClcb2FNJMdvR4qc2iBLZUDtzECIM+VtMIWGMA8rydB5k7/0F91zv
0wP3LNVPuhgrIBCCiTE+5dNu0+JKAy02d/qAEiFJquGQY6/+SqdSi6Rg81iSXaH9
BDRJaZL3xEfHWWevrkN68qD6n6rFe3gdS9FwHF1DdxWTtWeWq8eal13i+8a0MIAy
soemOlWMQqBiYwVoPegKzwaSCsCr9KzG2YFnzK+FYLrsDm8wpoA=
=PVVO
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============1836544369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1836544369==--
