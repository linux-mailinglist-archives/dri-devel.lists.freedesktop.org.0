Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90423DE839
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 10:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD6989C18;
	Tue,  3 Aug 2021 08:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FE989C18
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 08:21:36 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3F9A21A6F;
 Tue,  3 Aug 2021 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627978895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i0o15fEmTJ3krZZi3S30roBvTy1240D5Q3DgIxaPpdc=;
 b=HIpe2y+jEv6IDD8ShFkrksAj8lsJrAwhfz9tDKZrjmWC267XshtV14FxPFre5XLFLwdw/7
 dK3uwvporfIrouyDyu2e8EN0SqNfDUDOtHXXJmt3iQ+VYR+MsI9yUcsTkRTfKO/hscgd4y
 N1WZbsl1F6dRIQ0GW2YcpnhVoi4kRSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627978895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i0o15fEmTJ3krZZi3S30roBvTy1240D5Q3DgIxaPpdc=;
 b=JyhLpFnLnQT9iEnHyrJmLUCHF8KJJqvmo+AIu2L8TmMTtKPRNk4kIKdpyA3QeAWtXcZIx2
 gnnE9+9zYQWJAMDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AEFF213709;
 Tue,  3 Aug 2021 08:21:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2Fh+KY78CGG8bQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 08:21:34 +0000
Subject: Re: [PATCH 3/4] drm/tiny: add simple-dbi driver
To: Icenowy Zheng <icenowy@sipeed.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210802063538.75583-1-icenowy@sipeed.com>
 <20210802063538.75583-4-icenowy@sipeed.com>
 <bfd59539-fc71-4994-ca33-f5fd3851243b@suse.de>
 <f69afa7ac2984c5145f38c037a06668b9e08fe44.camel@sipeed.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4825d604-668e-38bc-96c8-dc86ed782a10@suse.de>
Date: Tue, 3 Aug 2021 10:21:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f69afa7ac2984c5145f38c037a06668b9e08fe44.camel@sipeed.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WhUbIWH3pPYFh42QYTdCT0P5aP4koy46B"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WhUbIWH3pPYFh42QYTdCT0P5aP4koy46B
Content-Type: multipart/mixed; boundary="eZx9Yh76VAGmp4DuNyQGtyjyLLs5AvRgx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Icenowy Zheng <icenowy@sipeed.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <4825d604-668e-38bc-96c8-dc86ed782a10@suse.de>
Subject: Re: [PATCH 3/4] drm/tiny: add simple-dbi driver
References: <20210802063538.75583-1-icenowy@sipeed.com>
 <20210802063538.75583-4-icenowy@sipeed.com>
 <bfd59539-fc71-4994-ca33-f5fd3851243b@suse.de>
 <f69afa7ac2984c5145f38c037a06668b9e08fe44.camel@sipeed.com>
In-Reply-To: <f69afa7ac2984c5145f38c037a06668b9e08fe44.camel@sipeed.com>

--eZx9Yh76VAGmp4DuNyQGtyjyLLs5AvRgx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.08.21 um 03:25 schrieb Icenowy Zheng:
> =E5=9C=A8 2021-08-02=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 17:08 +0200=EF=
=BC=8CThomas Zimmermann=E5=86=99=E9=81=93=EF=BC=9A
>> Hi
>>
>> Am 02.08.21 um 08:35 schrieb Icenowy Zheng:
>>> Add a driver for generic MIPI DBI panels initialized with MIPI DCS
>>> commands.
>>>
>>> Currently a ST7789V-based panel is added to it. This panel has its
>>> configuration pre-programmed into the controller, so no vendor-
>>> specific
>>> configuration is needed.
>>>
>>> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
>>> ---
>>>  =C2=A0 drivers/gpu/drm/tiny/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 12 ++
>>>  =C2=A0 drivers/gpu/drm/tiny/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
>>>  =C2=A0 drivers/gpu/drm/tiny/simple-dbi.c | 244
>>> ++++++++++++++++++++++++++++++
>>>  =C2=A0 3 files changed, 257 insertions(+)
>>>  =C2=A0 create mode 100644 drivers/gpu/drm/tiny/simple-dbi.c
>>>
>>> diff --git a/drivers/gpu/drm/tiny/Kconfig
>>> b/drivers/gpu/drm/tiny/Kconfig
>>> index d31be274a2bd..6cfc57b68a46 100644
>>> --- a/drivers/gpu/drm/tiny/Kconfig
>>> +++ b/drivers/gpu/drm/tiny/Kconfig
>>> @@ -144,6 +144,18 @@ config TINYDRM_REPAPER
>>>   =20
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If M is selec=
ted the module will be called repaper.
>>>   =20
>>> +config TINYDRM_SIMPLE_DBI
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "DRM support for =
generic MIPI DBI panels"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on DRM && SPI
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_KMS_HELPER
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_KMS_CMA_HELPER
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_MIPI_DBI
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM driver for gene=
ric DBI panels that are MIPI DCS
>>> compatible
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and needs no vendor=
-specific setup commands.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If M is selected th=
e module will be called simple-dbi.
>>> +
>>>  =C2=A0 config TINYDRM_ST7586
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "DRM suppor=
t for Sitronix ST7586 display panels"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on DRM && SP=
I
>>> diff --git a/drivers/gpu/drm/tiny/Makefile
>>> b/drivers/gpu/drm/tiny/Makefile
>>> index e09942895c77..2553de651aa3 100644
>>> --- a/drivers/gpu/drm/tiny/Makefile
>>> +++ b/drivers/gpu/drm/tiny/Makefile
>>> @@ -13,3 +13,4 @@ obj-$(CONFIG_TINYDRM_MI0283QT)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
+=3D
>>> mi0283qt.o
>>>  =C2=A0 obj-$(CONFIG_TINYDRM_REPAPER)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0+=3D repaper.o
>>>  =C2=A0 obj-$(CONFIG_TINYDRM_ST7586)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D st7586.o
>>>  =C2=A0 obj-$(CONFIG_TINYDRM_ST7735R)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0+=3D st7735r.o
>>> +obj-$(CONFIG_TINYDRM_SIMPLE_DBI)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0+=3D simple-dbi.o
>>> diff --git a/drivers/gpu/drm/tiny/simple-dbi.c
>>> b/drivers/gpu/drm/tiny/simple-dbi.c
>>> new file mode 100644
>>> index 000000000000..2b207e43d500
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/tiny/simple-dbi.c
>>> @@ -0,0 +1,244 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * DRM driver for display panels with configuration preset and
>>> needs only
>>> + * standard MIPI DCS commands to bring up.
>>> + *
>>> + * Copyright (C) 2021 Sipeed
>>> + */
>>> +
>>> +#include <linux/backlight.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/dma-buf.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/module.h>
>>> +#include <linux/property.h>
>>> +#include <linux/spi/spi.h>
>>> +#include <video/mipi_display.h>
>>> +
>>> +#include <drm/drm_atomic_helper.h>
>>> +#include <drm/drm_drv.h>
>>> +#include <drm/drm_fb_helper.h>
>>> +#include <drm/drm_gem_atomic_helper.h>
>>> +#include <drm/drm_gem_cma_helper.h>
>>> +#include <drm/drm_managed.h>
>>> +#include <drm/drm_mipi_dbi.h>
>>> +
>>> +#define MIPI_DCS_ADDRESS_MODE_BGR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(3)
>>> +#define MIPI_DCS_ADDRESS_MODE_REVERSE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(5)
>>> +#define MIPI_DCS_ADDRESS_MODE_RTL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(6)
>>> +#define MIPI_DCS_ADDRESS_MODE_BTT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(7)
>>> +
>>> +struct simple_dbi_cfg {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct drm_display_m=
ode mode;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int left_offset;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int top_offset;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool inverted;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool write_only;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool bgr;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool right_to_left;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool bottom_to_top;
>>> +};
>>> +
>>> +struct simple_dbi_priv {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mipi_dbi_dev dbidev=
;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Must be first for
>>> .release() */
>>
>> Which release?
>=20
> Ah, some copy-n-paste waste.
>=20
> Will drop this in v2.
>=20
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct simple_dbi_cf=
g *cfg;
>>> +};
>>> +
>>> +static void simple_dbi_pipe_enable(struct drm_simple_display_pipe
>>> *pipe,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_crtc_state *crtc_sta=
te,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_plane_state
>>> *plane_state)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mipi_dbi_dev *dbide=
v =3D drm_to_mipi_dbi_dev(pipe-
>>>> crtc.dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct simple_dbi_priv *pr=
iv =3D container_of(dbidev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct
>>> simple_dbi_priv,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dbidev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mipi_dbi *dbi =3D &=
dbidev->dbi;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret, idx;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 addr_mode =3D 0x00;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!drm_dev_enter(pipe->c=
rtc.dev, &idx))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DRM_DEBUG_KMS("\n");
>>
>> I'm not a friend of such debugging statements. If you absolutely want
>> to
>> keep it, rather use drm_dbg_kms().
>=20
> Should be copy-n-paste waste too.
>=20
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D mipi_dbi_poweron_r=
eset(dbidev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto out_exit;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mipi_dbi_command(dbi, MIPI=
_DCS_EXIT_SLEEP_MODE);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0msleep(5);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Currently tinydrm suppo=
rts 16bit only now */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mipi_dbi_command(dbi, MIPI=
_DCS_SET_PIXEL_FORMAT,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MIP=
I_DCS_PIXEL_FMT_16BIT);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (priv->cfg->inverted)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0mipi_dbi_command(dbi, MIPI_DCS_EXIT_INVERT_MODE);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (priv->cfg->bgr)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0addr_mode |=3D MIPI_DCS_ADDRESS_MODE_BGR;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (priv->cfg->right_to_le=
ft)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0addr_mode |=3D MIPI_DCS_ADDRESS_MODE_RTL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (priv->cfg->bottom_to_t=
op)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0addr_mode |=3D MIPI_DCS_ADDRESS_MODE_BTT;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (dbidev->rotation) =
{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 90:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_REVERSE;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_RTL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 180:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_RTL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_BTT;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case 270:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_REVERSE;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_BTT;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mipi_dbi_command(dbi, MIPI=
_DCS_SET_ADDRESS_MODE,
>>> addr_mode);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mipi_dbi_command(dbi, MIPI=
_DCS_ENTER_NORMAL_MODE);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mipi_dbi_command(dbi, MIPI=
_DCS_SET_DISPLAY_ON);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mipi_dbi_enable_flush(dbid=
ev, crtc_state, plane_state);
>>> +out_exit:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_dev_exit(idx);
>>> +}
>>> +
>>> +static const struct drm_simple_display_pipe_funcs
>>> simple_dbi_pipe_funcs =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.enable=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D simple_dbi_pipe_enable,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disable=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D mipi_dbi_pipe_disable,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.update=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D mipi_dbi_pipe_update,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.prepare_fb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=3D drm_gem_simple_display_pipe_prepare_fb,
>>> +};
>>> +
>>> +static const struct simple_dbi_cfg zsx154_b1206_cfg =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.mode=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D { DRM_SIMPLE_MODE(240, 2=
40, 28, 28) },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.inverted=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=3D true,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.write_only=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=3D true,
>>> +};
>>> +
>>> +DEFINE_DRM_GEM_CMA_FOPS(simple_dbi_fops);
>>> +
>>> +static const struct drm_driver simple_dbi_driver =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver_features=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D DRIVER_GEM | DRIVER_MODESET |
>>> DRIVER_ATOMIC,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fops=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D &simple_dbi_fops,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DRM_GEM_CMA_DRIVER_OPS_VMA=
P,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.debugfs_init=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D mipi_dbi_debugfs_i=
nit,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.name=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D "simple-dbi",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.desc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D "Generic MIPI-DCS compatible DBI
>>> panel",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.date=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D "20210723",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.major=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=3D 1,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.minor=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=3D 0,
>>> +};
>>> +
>>> +static const struct of_device_id simple_dbi_of_match[] =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "zsx,zsx=
154-b1206", .data =3D
>>> &zsx154_b1206_cfg },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ },
>>> +}
>>> +MODULE_DEVICE_TABLE(of, simple_dbi_of_match);
>>> +
>>> +static int simple_dbi_probe(struct spi_device *spi)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device *dev =3D &sp=
i->dev;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct simple_dbi_cf=
g *cfg;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mipi_dbi_dev *dbide=
v;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct simple_dbi_priv *pr=
iv;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_device *drm;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mipi_dbi *dbi;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct gpio_desc *dc;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 rotation =3D 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cfg =3D device_get_match_d=
ata(&spi->dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!cfg)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0cfg =3D (void *)spi_get_device_id(spi)->driver_data;=

>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv =3D devm_drm_dev_allo=
c(dev, &simple_dbi_driver,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct simple_dbi_priv,
>>> dbidev.drm);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(priv))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return PTR_ERR(priv);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dbidev =3D &priv->dbidev;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv->cfg =3D cfg;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dbi =3D &dbidev->dbi;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm =3D &dbidev->drm;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dbi->reset =3D devm_gpiod_=
get(dev, "reset", GPIOD_OUT_HIGH);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(dbi->reset))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return dev_err_probe(dev, PTR_ERR(dbi->reset),
>>> "Failed to get reset GPIO\n");
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dc =3D devm_gpiod_get_opti=
onal(dev, "dc", GPIOD_OUT_LOW);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(dc))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return dev_err_probe(dev, PTR_ERR(dc), "Failed to
>>> get D/C GPIO\n");
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dbidev->backlight =3D devm=
_of_find_backlight(dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(dbidev->backlig=
ht))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return PTR_ERR(dbidev->backlight);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0device_property_read_u32(d=
ev, "rotation", &rotation);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D mipi_dbi_spi_init(=
spi, dbi, dc);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (cfg->write_only)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0dbi->read_commands =3D NULL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D mipi_dbi_dev_init(=
dbidev, &simple_dbi_pipe_funcs,
>>> &cfg->mode,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rotation);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_mode_config_reset(drm)=
;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_dev_register(d=
rm, 0);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spi_set_drvdata(spi, drm);=

>>
>> AFAIK dev files are being created during drm_dev_register(). It's
>> probably safer to set the drvdata before.
>=20
> Okay, thanks.
>=20
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fbdev_generic_setup(dr=
m, 0);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>>> +}
>>> +
>>> +static int simple_dbi_remove(struct spi_device *spi)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_device *drm =3D=
 spi_get_drvdata(spi);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_dev_unplug(drm);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_atomic_helper_shutdown=
(drm);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>>> +}
>>> +
>>> +static void simple_dbi_shutdown(struct spi_device *spi)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_atomic_helper_shutdown=
(spi_get_drvdata(spi));
>>> +}
>>> +
>>> +static struct spi_driver simple_dbi_spi_driver =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0.name =3D "simple-dbi",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0.of_match_table =3D simple_dbi_of_match,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe =3D simple_dbi_prob=
e,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove =3D simple_dbi_rem=
ove,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.shutdown =3D simple_dbi_s=
hutdown,
>>> +};
>>> +module_spi_driver(simple_dbi_spi_driver);
>>> +
>>> +MODULE_DESCRIPTION("Simple DBI panel DRM driver");
>>> +MODULE_AUTHOR("Icenowy Zheng <icenowy@aosc.io>");
>>> +MODULE_LICENSE("GPL");
>>>
>>
>> Trailing blank line. (?)
>=20
> Ah I do not know what happened, I just `git format-patch` and then `git=

> send-email`.
>=20
> At least I have no trailing blank line in the file inside patch :-)

No problem. Could have been my email client.

After you cleaned up the patch as you outlined above, you can add

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

to the patch. I don't have much insight into the MIPI code. Maybe ask=20
for someone else's review as well.

Best regards
Thomas

>=20
>>
>> Best regards
>> Thomas
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eZx9Yh76VAGmp4DuNyQGtyjyLLs5AvRgx--

--WhUbIWH3pPYFh42QYTdCT0P5aP4koy46B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEI/I4FAwAAAAAACgkQlh/E3EQov+Dj
Xw/+OQS5ClgOtTTQldj/MgXq7U2Abt8OnJobbA1R2FCBHMp5BM5oTMbr7iU+1YC8t2E9/LODpuxk
4g/ziwbiH+xXiL6bKFeZ3mdJFUl7Z4JRXdjPrO66cc0fMTKTuuvWxKZmY2IntLWxmZRQWjDhy2GO
r7rmKFI8ydAjJfODTf7RrqQSqRgj2ExFjoqaH4rB/gDJ/qcA7KgyeccUW4gZWCmHVntgDCY5QVv4
5sLF7qULc4xac+XwuDs6LZqC6THrAqOSvC8AIsqdM4IqHE1vAOcmOMm97iKfpUYCYkXp675eCX13
AKLXPUkfJkWfTEsDJagJK95Kdvc3q9+lLEtX6tfnnih9KQxXhr0HytaoANfls4rSQE7VHy4AcXH2
MvOtpRP/D+4pXB06ttTFWzIYy4qOg1H4ImdM6HWv+BH3xhBYqNQ5VOx8/0nTK9nVaodEXZyk0J1E
DjMsyb6JbifqylF7/Gkb1CJZlwwpZP71thgrUpHzy5nLRtqzfwF9xJCHUtEGpO8rNQLnTNUKl9os
DLYvIYjXgWZ9Ii1K5i6UHVLCAI0iSMVCiRCat5XYQ5AoggT3AHCqIl2G2j8t6nGDrsBefL5NTxwl
k/ooVps9/kQQQKFTgo9m87LQB4oLa3C3QicAYMWlZIH9sH641DGs8Wv6TdMcdFF5ZWLZ8ADsKIOA
zRA=
=Kli6
-----END PGP SIGNATURE-----

--WhUbIWH3pPYFh42QYTdCT0P5aP4koy46B--
