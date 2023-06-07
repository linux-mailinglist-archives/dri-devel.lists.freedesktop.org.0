Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6C7258B1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432E710E1F5;
	Wed,  7 Jun 2023 08:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0198510E1F5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:54:06 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6ovb-0007f2-IU; Wed, 07 Jun 2023 10:54:03 +0200
Message-ID: <e0eeae3b35e8efac7c577ca3159abcf7f43d5082.camel@pengutronix.de>
Subject: Re: [PATCH 3/9] drm/verisilicon: Add basic drm driver
From: Lucas Stach <l.stach@pengutronix.de>
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org,  linaro-mm-sig@lists.linaro.org
Date: Wed, 07 Jun 2023 10:53:57 +0200
In-Reply-To: <20230602074043.33872-4-keith.zhao@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-4-keith.zhao@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <kernel@esmil.dk>, christian.koenig@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jagan Teki <jagan@edgeble.ai>, Jack Zhu <jack.zhu@starfivetech.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Shawn Guo <shawnguo@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Keith,

Am Freitag, dem 02.06.2023 um 15:40 +0800 schrieb Keith Zhao:
> Add a basic platform driver of the DRM driver for JH7110 SoC.
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  MAINTAINERS                          |   2 +
>  drivers/gpu/drm/Kconfig              |   2 +
>  drivers/gpu/drm/Makefile             |   1 +
>  drivers/gpu/drm/verisilicon/Kconfig  |  13 ++
>  drivers/gpu/drm/verisilicon/Makefile |   6 +
>  drivers/gpu/drm/verisilicon/vs_drv.c | 284 +++++++++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_drv.h |  48 +++++
>  include/uapi/drm/drm_fourcc.h        |  83 ++++++++
>  include/uapi/drm/vs_drm.h            |  50 +++++
>  9 files changed, 489 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>  create mode 100644 include/uapi/drm/vs_drm.h
>=20
>=20
> [...]
> +#endif /* __VS_DRV_H__ */
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index de703c6be969..af4fb50f9207 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -419,6 +419,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_VS      0x0b
> =20
>  /* add more to the end as needed */
> =20
> @@ -1519,6 +1520,88 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 mo=
difier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>  	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
> =20
> +#define DRM_FORMAT_MOD_VS_TYPE_NORMAL        0x00
> +#define DRM_FORMAT_MOD_VS_TYPE_COMPRESSED    0x01
> +#define DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT  0x02
> +#define DRM_FORMAT_MOD_VS_TYPE_MASK     ((__u64)0x3 << 54)
> +
> +#define fourcc_mod_vs_code(type, val) \
> +	fourcc_mod_code(VS, ((((__u64)type) << 54) | (val)))
> +
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_MODE_MASK    0x3F
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X8_XMAJOR   0x00
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X8_YMAJOR   0x01
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X4     0x02
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X4      0x03
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_4X8      0x04
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_16X4   0x06
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_64X4     0x07
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X4     0x08
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_256X1  0x09
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_128X1  0x0A
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_64X4   0x0B
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_256X2  0x0C
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_128X2  0x0D
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_128X4  0x0E
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_64X1   0x0F
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X8     0x10
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X16     0x11
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_512X1  0x12
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_32X4   0x13
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_64X2   0x14
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_32X2   0x15
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_32X1   0x16
> +#define DRM_FORMAT_MOD_VS_DEC_RASTER_16X1   0x17
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_128X4    0x18
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_256X4    0x19
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_512X4    0x1A
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X16    0x1B
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X16    0x1C
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_64X16    0x1D
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_128X8    0x1E
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_8X4_S    0x1F
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X4_S   0x20
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X4_S   0x21
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_16X4_LSB 0x22
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X4_LSB 0x23
> +#define DRM_FORMAT_MOD_VS_DEC_TILE_32X8     0x24
> +
> +#define DRM_FORMAT_MOD_VS_DEC_ALIGN_32      (0x01 << 6)
> +#define DRM_FORMAT_MOD_VS_DEC_ALIGN_64      (0x01 << 7)
> +
> +#define fourcc_mod_vs_dec_code(tile, align) \
> +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VS_TYPE_COMPRESSED, \
> +				((tile) | (align)))
> +
> +#define DRM_FORMAT_MOD_VS_NORM_MODE_MASK        0x1F
> +#define DRM_FORMAT_MOD_VS_LINEAR                0x00
> +#define DRM_FORMAT_MOD_VS_TILED4x4              0x01
> +#define DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR    0x02
> +#define DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR    0x03
> +#define DRM_FORMAT_MOD_VS_TILE_8X8              0x04
> +#define DRM_FORMAT_MOD_VS_TILE_MODE1            0x05
> +#define DRM_FORMAT_MOD_VS_TILE_MODE2            0x06
> +#define DRM_FORMAT_MOD_VS_TILE_8X4              0x07
> +#define DRM_FORMAT_MOD_VS_TILE_MODE4            0x08
> +#define DRM_FORMAT_MOD_VS_TILE_MODE5            0x09
> +#define DRM_FORMAT_MOD_VS_TILE_MODE6            0x0A
> +#define DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR_8X4    0x0B
> +#define DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR_4X8    0x0C
> +#define DRM_FORMAT_MOD_VS_TILE_Y                0x0D
> +#define DRM_FORMAT_MOD_VS_TILE_128X1            0x0F
> +#define DRM_FORMAT_MOD_VS_TILE_256X1            0x10
> +#define DRM_FORMAT_MOD_VS_TILE_32X1             0x11
> +#define DRM_FORMAT_MOD_VS_TILE_64X1             0x12
> +#define DRM_FORMAT_MOD_VS_TILE_MODE4X4          0x15
> +
> +#define fourcc_mod_vs_norm_code(tile) \
> +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VS_TYPE_NORMAL, \
> +				(tile))
> +
> +#define fourcc_mod_vs_custom_code(tile) \
> +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT, \
> +				(tile))
> +

You are opening a new namespace for what is effectively the VIVANTE
tiling. While your list seems much more exhaustive than the (reverse
engineered) list provided under the VIVANTE namespace, this is still
unacceptable as it adds new aliases for existing modifiers.

Also any modifier additions should be in a separate patch and not
buried in another change.

Regards,
Lucas
