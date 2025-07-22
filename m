Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3396EB0DA7A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8871E10E680;
	Tue, 22 Jul 2025 13:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtJw39HN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5962910E691
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189442; x=1784725442;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=M9Vw3KUZFsgEmCfhOhsRP4t6JpAYCh+PJDWJBaOwz3A=;
 b=DtJw39HNieyEtkXKlIPyFEneErTH9dMLtRujXhCZOUxrR5/Kv5b1g6D4
 A6kPnjWiiuCKECBKLjraN6fkFLj6waDeTsy97hspOU5IpWIB+75xqdHxa
 dVrGhUQfXCLx26J/v5u8aDiH0tK+uyjTQGLuJVbTDUFZ5YQMBUNefx9ng
 aPpwfzWNVtbKQvqdcjDAHVxHr0xZmHjWtR/yM7RI6PLBGkoL7agti2Txb
 cgy26OtD53+EFkJQD/2TvpjnmnDtOHflcC/2SlmIdgOykH7YdZD7niSBn
 q3VWYXK+RDEy7uK5qv3AR2YwaVM10JnlHURM7inoLf6r1AaTPnLwzFYAG w==;
X-CSE-ConnectionGUID: zuijzStSSOmwzM68/U9SIA==
X-CSE-MsgGUID: bQUaw0vCSTm2hkCJEpfdXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66868865"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="66868865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:04:01 -0700
X-CSE-ConnectionGUID: s9F4wQS3SoOdr768O6l/2w==
X-CSE-MsgGUID: a83p41ZBQmuPngQa5/7AJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="159209027"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.254])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:03:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Jul 2025 16:03:48 +0300 (EEST)
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, 
 Hans de Goede <hdegoede@redhat.com>, sven@kernel.org, alyssa@rosenzweig.io, 
 neal@gompa.dev, support.opensource@diasemi.com, duje.mihanovic@skole.hr, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v2 01/15] platform/x86: dell-uart-backlight: Use blacklight
 power constant
In-Reply-To: <90d816ba-aaf3-4b7b-9c52-72613be5b85a@suse.de>
Message-ID: <19aaca56-6784-209c-3076-cc63f733a021@linux.intel.com>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-2-tzimmermann@suse.de>
 <c380d3a4-2a99-cf52-0952-ee916b6c9676@linux.intel.com>
 <90d816ba-aaf3-4b7b-9c52-72613be5b85a@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-860532718-1753189428=:920"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-860532718-1753189428=:920
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 21 Jul 2025, Thomas Zimmermann wrote:

> Hi
>=20
> Am 21.07.25 um 13:43 schrieb Ilpo J=C3=A4rvinen:
> > On Tue, 15 Jul 2025, Thomas Zimmermann wrote:
> >=20
> > > The backlight subsystem has gotten its own power constants. Replace
> > > FB_BLANK_UNBLANK with BACKLIGHT_POWER_ON.
> > >=20
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > > Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > >   drivers/platform/x86/dell/dell-uart-backlight.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c
> > > b/drivers/platform/x86/dell/dell-uart-backlight.c
> > > index 8f868f845350..f323a667dc2d 100644
> > > --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> > > +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> > > @@ -305,7 +305,7 @@ static int dell_uart_bl_serdev_probe(struct
> > > serdev_device *serdev)
> > >   =09dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, res=
p +
> > > RESP_DATA);
> > >     =09/* Initialize bl_power to a known value */
> > > -=09ret =3D dell_uart_set_bl_power(dell_bl, FB_BLANK_UNBLANK);
> > > +=09ret =3D dell_uart_set_bl_power(dell_bl, BACKLIGHT_POWER_ON);
> > >   =09if (ret)
> > >   =09=09return ret;
> > Hi Thomas,
> >=20
> > Do you expect this entire series to go in this cycle through some other
> > tree than pdx86? If not, I'll take this through pdx86 tree in this cycl=
e.
>=20
> I don't know when the series will get merged, but it might still take a b=
it.
> Please take this patch through your tree. Good to have it off the list.

Thanks.

Applied it to the review-ilpo-next branch.

--=20
 i.

--8323328-860532718-1753189428=:920--
