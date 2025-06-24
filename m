Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653CDAE63AA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 13:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB33010E577;
	Tue, 24 Jun 2025 11:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by7cf22X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C48A10E577
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750765005; x=1782301005;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=0QPLj8k1RfrRJykPno6tnMdX52dcMJxf3LHllaynLDw=;
 b=by7cf22XaEy+fw2+Lrqw6U3dTmwCd2mAXOkp9GpcSiaUa92m1nlI8+co
 kDFOygCGglG/c33BWFZpytdbwo5EzMLNqlcpG5epqpZ9UzEtf7FjuT0Vt
 faPSXLb/97Nn0SPHMKyxjhnvgLmAZ2ssrseJYVw1vNrsi10BGCjgKZpxX
 xjw3U3o512ns3DWiKSDrdh2t+WbgbhlcPOV1XV0oR6dw7+OoMsgWRxfp7
 K+nY+LAKaIuve4w9t3Q1YrOnzeWEMGz8sn3KBonvaIFTQRl6KxnIoOoNm
 S3ci+NU4eP6i3G/pNNtjWY2ZKKMCa0rKPVn2+SiXp9doGi7+4WwpCCJFu g==;
X-CSE-ConnectionGUID: 60Klu9ODQ12YEfR+9P+ikA==
X-CSE-MsgGUID: YDFYVgCnTIWslOpVExNA6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="75537678"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="75537678"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:36:44 -0700
X-CSE-ConnectionGUID: ZHCD7C6DTR2lmQR8qI5exA==
X-CSE-MsgGUID: 7CPkk997S2yicYNRtR1V4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="156185875"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 04:36:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Jun 2025 14:36:34 +0300 (EEST)
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, 
 Hans de Goede <hdegoede@redhat.com>, sven@kernel.org, alyssa@rosenzweig.io, 
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com, 
 duje.mihanovic@skole.hr, dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 01/12] platform/x86: dell-uart-backlight: Use blacklight
 power constant
In-Reply-To: <20250618122436.379013-2-tzimmermann@suse.de>
Message-ID: <63e0be02-f7b5-2b14-d858-6b66d0a51bd2@linux.intel.com>
References: <20250618122436.379013-1-tzimmermann@suse.de>
 <20250618122436.379013-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-584399545-1750764994=:943"
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

--8323328-584399545-1750764994=:943
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 18 Jun 2025, Thomas Zimmermann wrote:

> The backlight subsystem has gotten its own power constants. Replace
> FB_BLANK_UNBLANK with BACKLIGHT_POWER_ON.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-584399545-1750764994=:943--
