Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9B3D7492
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 13:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E286E864;
	Tue, 27 Jul 2021 11:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3006E864
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F404161A38;
 Tue, 27 Jul 2021 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627386609;
 bh=CbbKxZmvqXa5f6Cv+jVJXJPOOuQ73wMFssz88LmyaQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LVZ1Rt7X33CFGQ+b4g8ZDMN9SimoYoyNvq6tCi1Pnq9m/5mEau2+CtrKnSHAsDIKU
 BahPtai/NXbiKBisJrE8Aatv4PzLdwXz+86FeRcCQBKOY1UhhzKL3Wi4KnPcSFoCMb
 uc4AX3Me4QnDhpRT9D4r+BonV+tIFanScXKP+KnqiBiMRYRgUR6a31PDT7heTnkV4+
 94tLmVuLpEdW+sfbhTAd0tganWJ0FLgJMl/u8hlGG15s4ozjstAhwHX4p7vzoSqn0e
 bNlXG9Rkt9gj8tSEIGsXqbeKAqzDqITC7begZZEtEXWbZo/nGPmu5hJs3te3pWwhrb
 cdg6i/7jGz1Uw==
Date: Tue, 27 Jul 2021 12:49:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] drivers/firmware: fix SYSFB depends to prevent build
 failures
Message-ID: <20210727114959.GQ4670@sirena.org.uk>
References: <20210727093015.1225107-1-javierm@redhat.com>
 <CAMuHMdXXoHLO=jsjb+xtW7GDQsvu8Zuz=JmbaEXT49w5o4SJ9A@mail.gmail.com>
 <f9df82c9-1e1a-d657-d712-312f5f17cab0@redhat.com>
 <CAMuHMdVh4XgXeaLXXTmPxMuWM4C1mTDnhSmDmff6T37PwNxupg@mail.gmail.com>
 <e3f0f7a0-2130-18be-48a4-af1918017eca@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Tcb1KvpfnM4LxW2s"
Content-Disposition: inline
In-Reply-To: <e3f0f7a0-2130-18be-48a4-af1918017eca@redhat.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Colin Ian King <colin.king@canonical.com>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Tcb1KvpfnM4LxW2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 01:32:29PM +0200, Javier Martinez Canillas wrote:
> On 7/27/21 1:17 PM, Geert Uytterhoeven wrote:

> > Do all (embedded) EFI systems have a frame buffer?

> That's a good question. I don't know if all EFI firmwares are expected
> to provide a GOP or not. But even the u-boot EFI stub provides one, if
> video output is supported by u-boot on that system.

No, GOP is only mandatory for systems with a graphical console device
even assuming things fully conform to the spec.  Indeed I've got a
non-embedded EFI based system sitting next to my desk here which only
has a serial console, never mind anything embedded. =20

--Tcb1KvpfnM4LxW2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD/8ucACgkQJNaLcl1U
h9D2JAf+NGVLNxPa5q2FZ6m7i69j9I4JgGEXgtoHn/z4QE2TDJ/f33WiC916tIQz
Mpowzpelz8aHwGcsK4ZOLOwt51HbuPMOLkBSZmLzuo8ARzYv3jGcptxzIbrQ09iT
VnUeQFoimNSrW2dXvXvDVQjB3JNo4Dd26J3xuswUwTCEqnrCvXffq5IKSWLXIXQl
Khn6LVmg5lj5rP6/an1MJNYSINFqfW0UD4cgP06lXkIxEP1Mx/0HhERompDU4bhW
koKSxuC7rdDkBq6OnL0ri9B//7J3uOVIMPW+Z6XoeQBKwO6AZ28Jt47fBK1X6oTQ
OUw6sCm9SPZHtP4QNLszdR6RZh3rTQ==
=gY8u
-----END PGP SIGNATURE-----

--Tcb1KvpfnM4LxW2s--
