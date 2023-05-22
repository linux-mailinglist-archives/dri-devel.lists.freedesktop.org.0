Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C844570C0C7
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 16:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A628810E08B;
	Mon, 22 May 2023 14:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6CA10E08B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:17:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C999BCF6E4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:14:54 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E517440004;
 Mon, 22 May 2023 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1684764889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e73NFB0LH5KzeW3SzDSh0SMfVYWak5UGN49zHTPP/gM=;
 b=LyUnlyWMLMc8Ho+cynrdVXFNrQBEcIXG4ktfDDyu392QRLvpkYLL9s8o06RyEXqw1ZvRJF
 OloNNsifgs7dWMb6pvdCkkyEIBPbcZksDFRrdQoSLJaYW6Dq8Uuc+UPBdn3Nrh+4A6SDV+
 gQMlcaic5ce1lo+fOPgRyIOKUIPazAHnL1x63Zty5yHrgcBtbIT/r3Y8pHAHBrIAJ7DlpP
 F8v89mmB1YnkpiypBcZvpoBG80fnGZCvHnpJ0SM5pbQpmj81HSviJdijJif+vdBikLSLNc
 R4SOGctawrmzXZwbl99mCt4yXTbqCAHIoLmY3rS9IgYMmVPJquNJLuqvA6h4+Q==
Date: Mon, 22 May 2023 16:14:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Subject: Re: [RESEND PATCH v3] mtd: rawnand: macronix: OTP access for
 MX30LFxG18AC
Message-ID: <20230522161446.16d1f307@xps-13>
In-Reply-To: <aa67ee8b-898b-319b-f167-b554700842b3@sberdevices.ru>
References: <20230511152120.3297853-1-AVKrasnov@sberdevices.ru>
 <c873b5a9-17ad-767c-5b20-35a49ab2bd40@sberdevices.ru>
 <aa67ee8b-898b-319b-f167-b554700842b3@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Jaime Liao <jaimeliao.tw@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 oxffffaa@gmail.com, kernel@sberdevices.ru,
 Mason Yang <masonccyang@mxic.com.tw>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arseniy,

avkrasnov@sberdevices.ru wrote on Mon, 15 May 2023 12:49:50 +0300:

> Hello @Miquel!
>=20
> Sorry, but who could review this patch? :) IIUC this logic is very hw spe=
cific and we need
> someone who knows it well? I tested this patch on our devices (with alrea=
dy known Meson NAND
> controller).

+ Jaime, who might test

>=20
> Thanks, Arseniy
>=20
> On 11.05.2023 21:21, Arseniy Krasnov wrote:
> > Cc: Mason Yang <masonccyang@mxic.com.tw> and Boris Brezillon <boris.bre=
zillon@collabora.com>
> >=20
> > On 11.05.2023 18:21, Arseniy Krasnov wrote: =20
> >> This adds support for OTP area access on MX30LFxG18AC chip series.
> >>
> >> Changelog:
> >>   v1 -> v2:
> >>   * Add slab.h include due to kernel test robot error.
> >>   v2 -> v3:
> >>   * Use 'uint64_t' as input argument for 'do_div()' instead
> >>     of 'unsigned long' due to kernel test robot error.
> >>
> >> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> >> ---
> >>  drivers/mtd/nand/raw/nand_macronix.c | 213 +++++++++++++++++++++++++++
> >>  1 file changed, 213 insertions(+)
> >>
> >> diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/r=
aw/nand_macronix.c
> >> index 1472f925f386..2301f990678e 100644
> >> --- a/drivers/mtd/nand/raw/nand_macronix.c
> >> +++ b/drivers/mtd/nand/raw/nand_macronix.c
> >> @@ -6,6 +6,7 @@
> >>   * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
> >>   */
> >> =20
> >> +#include <linux/slab.h>
> >>  #include "linux/delay.h"
> >>  #include "internals.h"
> >> =20
> >> @@ -31,6 +32,20 @@
> >> =20
> >>  #define MXIC_CMD_POWER_DOWN 0xB9
> >> =20
> >> +#define ONFI_FEATURE_ADDR_30LFXG18AC_OTP	0x90
> >> +#define MACRONIX_30LFXG18AC_OTP_START_PAGE	0
> >> +#define MACRONIX_30LFXG18AC_OTP_PAGES		30
> >> +#define MACRONIX_30LFXG18AC_OTP_PAGE_SIZE	2112
> >> +#define MACRONIX_30LFXG18AC_OTP_START_BYTE	\
> >> +	(MACRONIX_30LFXG18AC_OTP_START_PAGE *	\
> >> +	 MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
> >> +#define MACRONIX_30LFXG18AC_OTP_SIZE_BYTES	\
> >> +	(MACRONIX_30LFXG18AC_OTP_PAGES *	\
> >> +	 MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
> >> +
> >> +#define MACRONIX_30LFXG18AC_OTP_EN		BIT(0)
> >> +#define MACRONIX_30LFXG18AC_OTP_LOCKED		BIT(1)
> >> +
> >>  struct nand_onfi_vendor_macronix {
> >>  	u8 reserved;
> >>  	u8 reliability_func;
> >> @@ -316,6 +331,203 @@ static void macronix_nand_deep_power_down_suppor=
t(struct nand_chip *chip)
> >>  	chip->ops.resume =3D mxic_nand_resume;
> >>  }
> >> =20
> >> +static int macronix_30lfxg18ac_get_otp_info(struct mtd_info *mtd, siz=
e_t len,
> >> +					    size_t *retlen,
> >> +					    struct otp_info *buf)
> >> +{
> >> +	if (len < sizeof(*buf))
> >> +		return -EINVAL;
> >> +
> >> +	/* Don't know how to check that OTP is locked. */

Jaime, any idea?

> >> +	buf->locked =3D 0;
> >> +	buf->start =3D MACRONIX_30LFXG18AC_OTP_START_BYTE;
> >> +	buf->length =3D MACRONIX_30LFXG18AC_OTP_SIZE_BYTES;
> >> +
> >> +	*retlen =3D sizeof(*buf);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int macronix_30lfxg18ac_otp_enable(struct nand_chip *nand)
> >> +{
> >> +	uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0 };
> >> +
> >> +	feature_buf[0] =3D MACRONIX_30LFXG18AC_OTP_EN;
> >> +	return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
> >> +				 feature_buf);
> >> +}
> >> +
> >> +static int macronix_30lfxg18ac_otp_disable(struct nand_chip *nand)
> >> +{
> >> +	uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0 };
> >> +
> >> +	return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
> >> +				 feature_buf);
> >> +}
> >> +
> >> +static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
> >> +					loff_t offs_in_flash,
> >> +					size_t len, size_t *retlen,
> >> +					u_char *buf, bool write)
> >> +{
> >> +	struct nand_chip *nand;
> >> +	size_t bytes_handled;
> >> +	off_t offs_in_page;
> >> +	uint64_t page;
> >> +	void *dma_buf;
> >> +	int ret;
> >> +
> >> +	/* 'nand_prog/read_page_op()' may use 'buf' as DMA buffer,
> >> +	 * so allocate properly aligned memory for it. This is
> >> +	 * needed because cross page accesses may lead to unaligned
> >> +	 * buffer address for DMA.
> >> +	 */
> >> +	dma_buf =3D kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERNEL);
> >> +	if (!dma_buf)
> >> +		return -ENOMEM;
> >> +
> >> +	nand =3D mtd_to_nand(mtd);
> >> +	nand_select_target(nand, 0);
> >> +
> >> +	ret =3D macronix_30lfxg18ac_otp_enable(nand);
> >> +	if (ret)
> >> +		goto out_otp;
> >> +
> >> +	page =3D offs_in_flash;
> >> +	/* 'page' will be result of division. */
> >> +	offs_in_page =3D do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
> >> +	bytes_handled =3D 0;
> >> +
> >> +	while (bytes_handled < len &&
> >> +	       page < MACRONIX_30LFXG18AC_OTP_PAGES) {
> >> +		size_t bytes_to_handle;
> >> +
> >> +		bytes_to_handle =3D min_t(size_t, len - bytes_handled,
> >> +					MACRONIX_30LFXG18AC_OTP_PAGE_SIZE -
> >> +					offs_in_page);
> >> +
> >> +		if (write) {
> >> +			memcpy(dma_buf, &buf[bytes_handled], bytes_to_handle);
> >> +			ret =3D nand_prog_page_op(nand, page, offs_in_page,
> >> +						dma_buf, bytes_to_handle);
> >> +		} else {
> >> +			ret =3D nand_read_page_op(nand, page, offs_in_page,
> >> +						dma_buf, bytes_to_handle);
> >> +			if (!ret)
> >> +				memcpy(&buf[bytes_handled], dma_buf,
> >> +				       bytes_to_handle);
> >> +		}
> >> +		if (ret)
> >> +			goto out_otp;
> >> +
> >> +		bytes_handled +=3D bytes_to_handle;
> >> +		offs_in_page =3D 0;
> >> +		page++;
> >> +	}
> >> +
> >> +	*retlen =3D bytes_handled;
> >> +
> >> +out_otp:
> >> +	if (ret)
> >> +		dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret);
> >> +
> >> +	ret =3D macronix_30lfxg18ac_otp_disable(nand);
> >> +	WARN(ret, "failed to leave OTP mode after %s\n",
> >> +	     write ? "write" : "read");

Let's avoid WARN() calls (none in this driver are relevant IMHO). Just a
dev_err() should be enough.

> >> +	nand_deselect_target(nand);
> >> +	kfree(dma_buf);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int macronix_30lfxg18ac_write_otp(struct mtd_info *mtd, loff_t=
 to,
> >> +					 size_t len, size_t *rlen,
> >> +					 const u_char *buf)
> >> +{
> >> +	return __macronix_30lfxg18ac_rw_otp(mtd, to, len, rlen, (u_char *)bu=
f,
> >> +					    true);
> >> +}
> >> +
> >> +static int macronix_30lfxg18ac_read_otp(struct mtd_info *mtd, loff_t =
from,
> >> +					size_t len, size_t *rlen,
> >> +					u_char *buf)
> >> +{
> >> +	return __macronix_30lfxg18ac_rw_otp(mtd, from, len, rlen, buf, false=
);
> >> +}
> >> +
> >> +static int macronix_30lfxg18ac_lock_otp(struct mtd_info *mtd, loff_t =
from,
> >> +					size_t len)
> >> +{
> >> +	uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0 };
> >> +	struct nand_chip *nand;
> >> +	int ret;
> >> +
> >> +	if (from !=3D MACRONIX_30LFXG18AC_OTP_START_BYTE ||
> >> +	    len !=3D MACRONIX_30LFXG18AC_OTP_SIZE_BYTES)
> >> +		return -EINVAL;
> >> +
> >> +	dev_dbg(&mtd->dev, "locking OTP\n");
> >> +
> >> +	nand =3D mtd_to_nand(mtd);
> >> +	nand_select_target(nand, 0);
> >> +
> >> +	feature_buf[0] =3D MACRONIX_30LFXG18AC_OTP_EN |
> >> +			 MACRONIX_30LFXG18AC_OTP_LOCKED;
> >> +	ret =3D nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
> >> +				feature_buf);
> >> +	if (ret) {
> >> +		dev_err(&mtd->dev,
> >> +			"failed to lock OTP (set features): %i\n", ret);
> >> +		nand_deselect_target(nand);
> >> +		return ret;
> >> +	}
> >> +
> >> +	/* Do dummy page prog with zero address. */
> >> +	feature_buf[0] =3D 0;
> >> +	ret =3D nand_prog_page_op(nand, 0, 0, feature_buf, 1);
> >> +	if (ret)
> >> +		dev_err(&mtd->dev,
> >> +			"failed to lock OTP (page prog): %i\n", ret);
> >> +
> >> +	ret =3D macronix_30lfxg18ac_otp_disable(nand);
> >> +	WARN(ret, "failed to leave OTP mode after lock\n");
> >> +
> >> +	nand_deselect_target(nand);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void macronix_nand_setup_otp(struct nand_chip *chip)
> >> +{
> >> +	static const char * const supported_otp_models[] =3D {
> >> +		"MX30LF1G18AC",
> >> +		"MX30LF2G18AC",
> >> +		"MX30LF4G18AC",
> >> +	};
> >> +	struct mtd_info *mtd;
> >> +
> >> +	if (!chip->parameters.supports_set_get_features)
> >> +		return;
> >> +
> >> +	if (match_string(supported_otp_models,
> >> +			 ARRAY_SIZE(supported_otp_models),
> >> +			 chip->parameters.model) < 0)
> >> +		return;

I would start by checking the model, then it's list of supported ops.

> >> +
> >> +	bitmap_set(chip->parameters.get_feature_list,
> >> +		   ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
> >> +	bitmap_set(chip->parameters.set_feature_list,
> >> +		   ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
> >> +
> >> +	mtd =3D nand_to_mtd(chip);
> >> +	mtd->_get_fact_prot_info =3D macronix_30lfxg18ac_get_otp_info;
> >> +	mtd->_read_fact_prot_reg =3D macronix_30lfxg18ac_read_otp;
> >> +	mtd->_get_user_prot_info =3D macronix_30lfxg18ac_get_otp_info;
> >> +	mtd->_read_user_prot_reg =3D macronix_30lfxg18ac_read_otp;
> >> +	mtd->_write_user_prot_reg =3D macronix_30lfxg18ac_write_otp;
> >> +	mtd->_lock_user_prot_reg =3D macronix_30lfxg18ac_lock_otp;
> >> +}
> >> +
> >>  static int macronix_nand_init(struct nand_chip *chip)
> >>  {
> >>  	if (nand_is_slc(chip))
> >> @@ -325,6 +537,7 @@ static int macronix_nand_init(struct nand_chip *ch=
ip)
> >>  	macronix_nand_onfi_init(chip);
> >>  	macronix_nand_block_protection_support(chip);
> >>  	macronix_nand_deep_power_down_support(chip);
> >> +	macronix_nand_setup_otp(chip);
> >> =20
> >>  	return 0;
> >>  } =20


Thanks,
Miqu=C3=A8l
