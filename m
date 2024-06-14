Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B10A909358
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 22:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A2E10EE54;
	Fri, 14 Jun 2024 20:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="dEp5aFQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C330B10EE54;
 Fri, 14 Jun 2024 20:24:15 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 6C7F71C00A9; Fri, 14 Jun 2024 22:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1718396654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=11wEK8Clby+612CgqiRJqYq/lMXJ8CEG8ZdCUKNN3o4=;
 b=dEp5aFQothUREbECVVo0OdD6dmKTHwx+KFVhdcLYq0IGkj13qouAtxiS+MunjcCC9hGcgu
 Gvl+5rzBnsQkCMnJ8aVU+iPE1US3jKon9Ootv8/mW6vJc6r9AzwBbwb9WookOPoXknCNm6
 792V+QKfgwbM0PQ0EEknai/R0cjX164=
Date: Fri, 14 Jun 2024 22:24:13 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rafael Wysocki <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Linux 6.10-rc1
Message-ID: <Zmym7SuLa32UjVyZ@duo.ucw.cz>
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <ZmrTZozoi0t/tuva@duo.ucw.cz>
 <CAHk-=wjqHL7KjOWYBVKFewcKPWL7CJxddWfJnvL3AfOqfR8vMg@mail.gmail.com>
 <ZmwHGviv/6J6FQLf@duo.ucw.cz>
 <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
 <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="u7NG0n/GuAps+/Vo"
Content-Disposition: inline
In-Reply-To: <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
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


--u7NG0n/GuAps+/Vo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Let's bring in the actual gpu people.. Dave/Jani/others - does any of
> > this sound familiar? Pavel says things have gotten much slower in
> > 6.10: "something was very wrong with the performance, likely to do
> > with graphics"
>=20
> Actually, maybe it's not graphics at all. Rafael just sent me a pull
> request that fixes a "turbo is disabled at boot, but magically enabled
> at runtime by firmware" issue.
>=20
> The 6.10-rc1 kernel would notice that turbo was disabled, and stopped
> noticing that it magically got re-enabled.
>=20
> Pavel, that was with a very different laptop, but who knows... That
> would match the "laptop is much slower" thing.
>=20
> So current -git might be worth checking.

Is that:

commit 0cac73eb3875f6ecb6105e533218dba1868d04c9
Merge: 94df82fe5bfd 350cbb5d2f67
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri Jun 14 09:52:51 2024 -0700

    Merge tag 'pm-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/gi=
t/rafael/linux-pm
   =20
    Pull power management fix from Rafael Wysocki:
     "Restore the behavior of the no_turbo sysfs attribute in the
      intel_pstate driver which allowed users to make the driver start using
      turbo P-states if they have been enabled on the fly by the firmware
      after OS initialization (Rafael Wysocki)"
   =20
    * tag 'pm-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/ra=
fael/linux-pm:
      cpufreq: intel_pstate: Check turbo_is_disabled() in store_no_turbo()


? I don't think I tweaking no_turbo in the sysfs.

But the thermal stuff looks important:

commit cee84c0b003f2e0f486f200a72eca2bcdb3a49a7
Merge: d20f6b3d747c b6846826982b
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri Jun 14 09:28:56 2024 -0700

    Merge tag 'thermal-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kern=
el/git/rafael/linux-pm

So I guess I'll have to try again.

Thanks and best regards,
							Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--u7NG0n/GuAps+/Vo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZmym7QAKCRAw5/Bqldv6
8kb0AJ97gwIRHUiD47Mml3lQACLV5Xsu2wCdFT+Pwv7O4oovUY9/KqIbjbSEaUE=
=YIIy
-----END PGP SIGNATURE-----

--u7NG0n/GuAps+/Vo--
