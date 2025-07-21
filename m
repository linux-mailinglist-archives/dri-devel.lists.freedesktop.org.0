Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8BFB0C374
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D64510E277;
	Mon, 21 Jul 2025 11:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJT02HYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5578E10E277
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753098212; x=1784634212;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=hrgwN/w7MfcXcqLWZdBF/zPXpxKvQfR7TLLQJgj1w5s=;
 b=aJT02HYbTVag092hOhZBLAP1xdIqXb6KSTxEui9H2ezH7XTYU9+o/KoM
 uaaDJYZfJ9VC+UUKj/56VRgcYqOooB2YFkStW4LHYbUxSQq2khtYUuTuM
 YwA9MH8ugHpE1Xrah0z9YpUDqsBTZ6yuvaiVJguHM2RRbuQN8r/TQhreW
 u4JN2pA6NM0kmR/rJFvZ1e3YYguITdib0KEy/E0qria9MdKMI2r8/3wx/
 poZ+XYfdLY6pP4/sHFQoKGBCYX8mBxJWLiAQjW7pO6eJgOE+F/lHGCdTB
 Lc8ylI+G4gf94S4H3TeY+oYFc3YudG9LjQ8VphxN3Rn3aKHLrl3fbJ2MB w==;
X-CSE-ConnectionGUID: M1vbrGsiTMCt9TFzAD/U2Q==
X-CSE-MsgGUID: RtK4SwMwRfifq8YWRNpeGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="59122818"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="59122818"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 04:43:31 -0700
X-CSE-ConnectionGUID: OYVcffK3Q/uchzoYBJ7H7A==
X-CSE-MsgGUID: k7jugmWySG2MAQVowyMegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="158476181"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.225])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 04:43:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 21 Jul 2025 14:43:22 +0300 (EEST)
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
In-Reply-To: <20250715122643.137027-2-tzimmermann@suse.de>
Message-ID: <c380d3a4-2a99-cf52-0952-ee916b6c9676@linux.intel.com>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-766033278-1753098202=:69097"
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

--8323328-766033278-1753098202=:69097
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Jul 2025, Thomas Zimmermann wrote:

> The backlight subsystem has gotten its own power constants. Replace
> FB_BLANK_UNBLANK with BACKLIGHT_POWER_ON.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/platform/x86/dell/dell-uart-backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/pl=
atform/x86/dell/dell-uart-backlight.c
> index 8f868f845350..f323a667dc2d 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -305,7 +305,7 @@ static int dell_uart_bl_serdev_probe(struct serdev_de=
vice *serdev)
>  =09dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + R=
ESP_DATA);
> =20
>  =09/* Initialize bl_power to a known value */
> -=09ret =3D dell_uart_set_bl_power(dell_bl, FB_BLANK_UNBLANK);
> +=09ret =3D dell_uart_set_bl_power(dell_bl, BACKLIGHT_POWER_ON);
>  =09if (ret)
>  =09=09return ret;

Hi Thomas,

Do you expect this entire series to go in this cycle through some other=20
tree than pdx86? If not, I'll take this through pdx86 tree in this cycle.

--=20
 i.

--8323328-766033278-1753098202=:69097--
