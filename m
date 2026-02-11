Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGjVE/tdjGmWlwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:46:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8893123904
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18E510E38A;
	Wed, 11 Feb 2026 10:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PKm85Uje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEDF10E38A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 10:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F19CF600AD;
 Wed, 11 Feb 2026 10:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE7DC4CEF7;
 Wed, 11 Feb 2026 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770806773;
 bh=2x0IV+kSfIJ0GzDwMyJqVo44FSQyWPaHiFqrTCxYLQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PKm85Uje8dWY1H9cuXmW6csiL+eyoD60a9uAtHnlhI5fjJukm0fbl7q1fDomZAtQN
 8gV9OwernkT476DFElSwC47tzJGMlyfpQa+1VhjzEwO+c/nOhtb451vDmVhGQd4RAE
 lQHFW9511iZOo8v020YhRM1shSb5tDhV38n74hQFeXPCWx7N7iqcBrVv8jcw06KzjH
 cds10Y7ZfChc8DRRc2s3S6Vh90CPoTnCcJrmvMi9PQKU7Sy43jXPQODwtgGleUuTE/
 W333pL+fFp3X0OpL+IVgyERtBSrnx+y1+mKaAtFieKEgQEkyJ/RIM+CLsi8mvOKBWT
 jhJLzf/yAcaeg==
Date: Wed, 11 Feb 2026 11:46:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, 
 Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: PWM implementation in HWMON and backlight
Message-ID: <aYxaXmguGRk1pWpT@monoceros>
References: <CAFLxGvyhdpQMnW6VqyXjLPKyZSQvrV-+GFdUogV4JX7DiGePyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3g76ma3xf4oo32nw"
Content-Disposition: inline
In-Reply-To: <CAFLxGvyhdpQMnW6VqyXjLPKyZSQvrV-+GFdUogV4JX7DiGePyg@mail.gmail.com>
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
X-Rspamd-Queue-Id: A8893123904
X-Rspamd-Action: no action


--3g76ma3xf4oo32nw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: PWM implementation in HWMON and backlight
MIME-Version: 1.0

Hello Guenter,

On Wed, Feb 11, 2026 at 10:28:55AM +0100, Richard Weinberger wrote:
> The backlight of a board I am working with is controlled via PWM.
> Naturally, I thought this would be a straightforward task using the
> pwm-backlight driver.
>=20
> However, the PWM in question is implemented using an NCT6106D chip.
> The associated HWMON driver, nct6775-core.c, does not implement a
> standard PWM device interface but rather its own custom one.

Looking around in drivers/hwmon made me a sad. There are four drivers
that handle parsing #pwm-cells:

	$ git grep pwm-cell drivers/hwmon/
	drivers/hwmon/adt7475.c:        ret =3D fwnode_property_get_reference_args=
(fwnode, "pwms", "#pwm-cells", 0, 0, &rargs);
	drivers/hwmon/amc6821.c:        if (of_parse_phandle_with_args(fan_np, "pw=
ms", "#pwm-cells", 0, &args))
	drivers/hwmon/emc2305.c:        ret =3D of_parse_phandle_with_args(child, =
"pwms", "#pwm-cells", 0, &args);
	drivers/hwmon/nct7363.c:        ret =3D of_parse_phandle_with_args(child, =
"pwms", "#pwm-cells",

instead of using the pwm subsystem. Also the driver mentioned by Richard
above has some self-made PWM handling including a set of driver specific
sysfs files to control the PWMs. I stopped looking at the output of

	git grep pwm drivers/hwmon/

after finding some more sad things. (My "favourite" so far was:

	dev_dbg(dev, "chmod -w pwm%d failed\n", nr + 1);
=20
=2E)

> I am a bit puzzled, is there a specific reason why HWMON does not
> utilize the standard PWM framework in this case?

Yes please!

I think that the PWM waveform API that exists since v6.13-rc1 is
flexible enough that hwmon chips should be able to both implement and
use it properly.

Can you please make sure that the next hardware driver for a pwm capable
chip uses a proper PWM chip? Feel free to send patch authors in my
direction for that.

And if I'm wrong and using the pwm subsystem in these cases is a burden,
I want to hear about that and discuss how this can be made better.

Thanks
Uwe

--3g76ma3xf4oo32nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmMXfAACgkQj4D7WH0S
/k7joAf/c52aGGunHs5yjL8dsP/QyJ2X+3laEnNnlzswH5qzwRZXgFUp6a0Agi2U
Hng8Rd3NIj6+Lyxn+3HbpzKbFJ9s8+6b0XgFGip7/Cw4kg0D3+nCE/p9lfzkJM/K
CylbMHX0amrF5C4JO2jbfGmvAKBvx3EfyJXXhb+WVJrjOT6Qp7V3fhk7UKSVGS7+
HwfiXLHvh6W8Me/7FlsQuWiP7bKxC6D2mUSa/ZSN3iu+plWp+ncS3LZb49eRWjQu
sq62l3R2E5cOFq/2BzCoEw2fJC//cmnkehpPIK7hFnhv4arhJI0Pvf0oI+U0peko
k+snDrxS2n4yRtJkLMdcZ2MG8/oteA==
=aCwC
-----END PGP SIGNATURE-----

--3g76ma3xf4oo32nw--
