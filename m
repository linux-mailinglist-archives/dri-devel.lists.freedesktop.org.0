Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNd2B/K3jGnlsQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 18:10:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6F712672A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 18:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0EB10E62E;
	Wed, 11 Feb 2026 17:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FPUCpqes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E1810E62C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 17:10:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D5DC60053;
 Wed, 11 Feb 2026 17:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C51EC4CEF7;
 Wed, 11 Feb 2026 17:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770829803;
 bh=7upHBVEG2uZ4tUa36JEchClxWzr7WEN4Moqq4nZx3TQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FPUCpqeshNrFe7QwVZo35hpGE0PPMURxmpxFlY59YAgwUHkpowMwHp8PzUVj3Ucie
 5G3Gm61SeYcAxxh9q0FFJlTHdGJxInsnz02k/5sa5bQBFvOzXj1HefF/V0qmC2WUlD
 qka/8lepkA8dZNqia0wv7vahTt6/JPKswRilyCVfFYQ7hAztI4hVlYiiAyKMZ7nXVB
 hypZXN47GCC6Z+tyE3EdU8cMskxnxyjGftL6cPRWxF14LPJUMOHR6oumE+gaTvwrXT
 U/JTKnYQtQyTRk2VXBVOCwCT9dCfXTVXW4lmH96GcYOKPNXjH7FQlPJRrOmeePZfkj
 DuCD2HQtB+nqQ==
Date: Wed, 11 Feb 2026 18:10:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, 
 Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: PWM implementation in HWMON and backlight
Message-ID: <aYy0bO7ZWUsj0ENu@monoceros>
References: <CAFLxGvyhdpQMnW6VqyXjLPKyZSQvrV-+GFdUogV4JX7DiGePyg@mail.gmail.com>
 <aYxaXmguGRk1pWpT@monoceros>
 <e5ccfd91-9c0c-45f1-bbc8-40e93bffca43@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r5nv7bzmwhj2lfjf"
Content-Disposition: inline
In-Reply-To: <e5ccfd91-9c0c-45f1-bbc8-40e93bffca43@roeck-us.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:richard.weinberger@gmail.com,m:richardweinberger@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ukleinek@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4C6F712672A
X-Rspamd-Action: no action


--r5nv7bzmwhj2lfjf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: PWM implementation in HWMON and backlight
MIME-Version: 1.0

Hello Guenter,

On Wed, Feb 11, 2026 at 07:47:36AM -0800, Guenter Roeck wrote:
> On 2/11/26 02:46, Uwe Kleine-K=F6nig wrote:
> > On Wed, Feb 11, 2026 at 10:28:55AM +0100, Richard Weinberger wrote:
> > > The backlight of a board I am working with is controlled via PWM.
> > > Naturally, I thought this would be a straightforward task using the
> > > pwm-backlight driver.
> > >=20
> > > However, the PWM in question is implemented using an NCT6106D chip.
> > > The associated HWMON driver, nct6775-core.c, does not implement a
> > > standard PWM device interface but rather its own custom one.
> >=20
> > Looking around in drivers/hwmon made me a sad. There are four drivers
> > that handle parsing #pwm-cells:
> >=20
> > 	$ git grep pwm-cell drivers/hwmon/
> > 	drivers/hwmon/adt7475.c:        ret =3D fwnode_property_get_reference_=
args(fwnode, "pwms", "#pwm-cells", 0, 0, &rargs);
> > 	drivers/hwmon/amc6821.c:        if (of_parse_phandle_with_args(fan_np,=
 "pwms", "#pwm-cells", 0, &args))
> > 	drivers/hwmon/emc2305.c:        ret =3D of_parse_phandle_with_args(chi=
ld, "pwms", "#pwm-cells", 0, &args);
> > 	drivers/hwmon/nct7363.c:        ret =3D of_parse_phandle_with_args(chi=
ld, "pwms", "#pwm-cells",
> >=20
> > instead of using the pwm subsystem. Also the driver mentioned by Richard
> > above has some self-made PWM handling including a set of driver specific
> > sysfs files to control the PWMs. I stopped looking at the output of
> >=20
> > 	git grep pwm drivers/hwmon/
> >=20
> > after finding some more sad things. (My "favourite" so far was:
> >=20
> > 	dev_dbg(dev, "chmod -w pwm%d failed\n", nr + 1);
>=20
> That code is from 2006. Are you serious ? Did you bother to read
> the context ? Did you bother considering that this was possibly the
> best means available at the time to control visibility of an
> attribute file ?

This was just something that I spotted while looking at the git-grep
output. The thing that actually triggered my mail was commit
46b94c485ed197bc681da242440c6e2315697c57 and less that it doesn't use
the pwm stuff (which was only in next at that time probably), but more
that I wasn't involved.

> For the most part the pwm implementation in hwmon chips is tied to suppor=
ting
> pwm output for fans and isn't usable for anything else. This gets worse f=
or
> chips where pwm vs. voltage control on the output signal can be selected.
>=20
> Unless there is an actual use case for utilizing the pwm subsystem for a
> given chip, doing so would just create overhead. _If_ there is a proven
> use case, I don't mind if people submit patches to add generic support
> for the the pwm subsystem to such drivers. Keep in mind though that suppo=
rt
> for the ability to switch between pwm and voltage control (as is very com=
mon
> for fans) is mandatory for chips with that capability.
>=20
> Talking about this specific driver, it has been in the upstream kernel si=
nce v3.10
> (2013). Almost all hwmon drivers supporting pwm fan control are much olde=
r than
> v6.13. While many of those would benefit from a modernization update, sup=
porting
> the pwm subsystem just because it exists would, from my perspective, be a=
 waste
> of time. I most certainly won't do it.

The bit I don't like about these drivers is that their binding (using
#pwm-cells) suggests that these chips are usable as generic PWM. That's
what Richard seems to have expected, too.

> In my opinion calling it "sad" that drivers are not re-implemented to use=
 a
> newly available out-of-subsystem API is close to being an insult to those
> who would have to do that work.
>=20
> Sorry, you folks really got me on the wrong foot. If there is anything sa=
d,
> it is people complaining about 20 year old code without doing anything ab=
out
> it themselves. I by now spent months if not years of my time modernizing =
hwmon
> drivers. Did you ?

That wasn't the message that I intended to transport and I'm taking the
blame for that. The actual intended take away was: Please for the next
driver implementing PWM stuff, poke me, such that the nice things in
drivers/pwm are reused instead of partly reimplemented with less
functionality and that the maybe not so nice things are improved.

I didn't want to blame you (or anyone else) with my mail, and I'm sorry
that this was how you received my mail.

Thanks for being honest,
Uwe

--r5nv7bzmwhj2lfjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmMt7sACgkQj4D7WH0S
/k6EZgf+LK4+qEc/Wf3mhkqpelRgXUyxLRPmvypGyjy1ysoP11EC9EkBvEp9y+ZX
Su87iK9acDmUa5mAB+Ql/EXiKI4NhIi/CuqOPT8vPW7yKKIAGtmrOsBxjj/YqGfq
62XifKi6mb60CVBqQDd4TrLu/qCEWIRppFHBazBei9UutCzynFWfklc1o+85Axyc
fgqF4YHx8sUC5mVJ7yqJ15p0iqcX5NxIV86seZoZHBuRq3eNY6SgnxGzqQ8T9Obz
+y5ujU7SQJMoyQH1K5DvuHsJBD98hbx/nMvwlwOQDqwxDNc81TmYxEOGcHPQkunh
/aZpDQqlqVP8NuizNPEcaUsS7AeQDg==
=MzJ3
-----END PGP SIGNATURE-----

--r5nv7bzmwhj2lfjf--
