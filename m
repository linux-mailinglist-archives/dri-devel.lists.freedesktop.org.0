Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED7872F8B8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 11:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC9610E18E;
	Wed, 14 Jun 2023 09:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5162B10E434
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 09:10:09 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686733806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAO5PoZt2knoBaPqUHhj1MWZZ6nSInLED8yri3KtZlU=;
 b=dbO9elaRNuDZck4qiTEc3pGJCibUD8JclWSoc7sNAJymaXu4bKXWjqeflYagBks5OOEHZX
 3a1D+82Dypr6PV+d0T5CbS99ulko1Pu6FX7mYCIcAkAmeaotiBRWUNx6L3fHlFTTHfzy3d
 8RHn4031SlvyhG7J25Q9crNfdud4jwP6A1ow/6k14qObkDJEL4UU5s/7/lajqa34kNJe3r
 AJZWgo9+ASO+HEXUs+VP5eBcXrGfPEeHQnBBhwDGNQq59LVPCxE3sk0TUU7kZeneMm5e7f
 fEhB4Y93yo9sC4O9vjp9JIunrte2yHJrY0e09P7bSbrazwoa2EXrSOC/Pjzt3Q==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD1FA1BF20C;
 Wed, 14 Jun 2023 09:10:02 +0000 (UTC)
Date: Wed, 14 Jun 2023 11:10:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: liao jaime <jaimeliao.tw@gmail.com>
Subject: Re: [PATCH v4] mtd: rawnand: macronix: OTP access for MX30LFxG18AC
Message-ID: <20230614111001.6b0417d4@xps-13>
In-Reply-To: <CAAQoYR=aU-tpFYhfKUae=2zbvpzmP3_d4PYp_252qxSsPcVbaQ@mail.gmail.com>
References: <20230523101637.3009746-1-AVKrasnov@sberdevices.ru>
 <20230612185354.09b88e0d@xps-13>
 <CAAQoYR=aU-tpFYhfKUae=2zbvpzmP3_d4PYp_252qxSsPcVbaQ@mail.gmail.com>
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
Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 oxffffaa@gmail.com, kernel@sberdevices.ru,
 Mason Yang <masonccyang@mxic.com.tw>, linux-media@vger.kernel.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Jaime Liao <jaimeliao@mxic.com.tw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi liao,

jaimeliao.tw@gmail.com wrote on Wed, 14 Jun 2023 17:06:16 +0800:

> Hi Miquel
>=20
>=20
> >
> > Hello,
> >
> > AVKrasnov@sberdevices.ru wrote on Tue, 23 May 2023 13:16:34 +0300:
> > =20
> > > This adds support for OTP area access on MX30LFxG18AC chip series. =20
> >
> > Jaime, any feedback on this? Will you test it?
> >
> > How are we supposed to test the OTP is locked? I see this is still an
> > open point. =20
> After checking with internal, sub feature parameter are volatile register.
>=20
> It could be change after enter/exit OTP region or power cycle even OTP
>=20
> region have been locked.
>=20
> OTP operation mode still could be enter/exit and region is read only
> after OTP in protect mode.
>=20
> #program command could execute but no use after setting OTP region in
> protect mode.
>=20
> So that we can't check whether OTP region is locked via get feature.
>=20
> And we don't have region for checking status of OTP locked.

Ah, too bad. But thanks a lot for the explanation. Arseniy, can you
please change your comment to explain that the bit is volatile and thus
there is no way to check if an otp region is locked? I would return
EOPNOTSUPP in this case and verify that the core cleanly handles the
situation.

Thanks,
Miqu=C3=A8l

>=20
> > =20
> > >
> > > Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> > > ---
> > >   v1 -> v2:
> > >   * Add slab.h include due to kernel test robot error.
> > >   v2 -> v3:
> > >   * Use 'uint64_t' as input argument for 'do_div()' instead
> > >     of 'unsigned long' due to kernel test robot error.
> > >   v3 -> v4:
> > >   * Use 'dev_err()' instead of 'WARN()'.
> > >   * Call 'match_string()' before checking 'supports_set_get_features'
> > >     in 'macronix_nand_setup_otp().
> > >   * Use 'u8' instead of 'uint8_t' as ./checkpatch.pl wants.
> > >
> > >  drivers/mtd/nand/raw/nand_macronix.c | 216 +++++++++++++++++++++++++=
++
> > >  1 file changed, 216 insertions(+)
> > >
> > > diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/=
raw/nand_macronix.c
> > > index 1472f925f386..be1ffa93bebb 100644
> > > --- a/drivers/mtd/nand/raw/nand_macronix.c
> > > +++ b/drivers/mtd/nand/raw/nand_macronix.c
> > > @@ -6,6 +6,7 @@
> > >   * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
> > >   */
> > >
> > > +#include <linux/slab.h>
> > >  #include "linux/delay.h"
> > >  #include "internals.h"
> > >
> > > @@ -31,6 +32,20 @@
> > >
> > >  #define MXIC_CMD_POWER_DOWN 0xB9
> > >
> > > +#define ONFI_FEATURE_ADDR_30LFXG18AC_OTP     0x90
> > > +#define MACRONIX_30LFXG18AC_OTP_START_PAGE   0
> > > +#define MACRONIX_30LFXG18AC_OTP_PAGES                30
> > > +#define MACRONIX_30LFXG18AC_OTP_PAGE_SIZE    2112
> > > +#define MACRONIX_30LFXG18AC_OTP_START_BYTE   \
> > > +     (MACRONIX_30LFXG18AC_OTP_START_PAGE *   \
> > > +      MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
> > > +#define MACRONIX_30LFXG18AC_OTP_SIZE_BYTES   \
> > > +     (MACRONIX_30LFXG18AC_OTP_PAGES *        \
> > > +      MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
> > > +
> > > +#define MACRONIX_30LFXG18AC_OTP_EN           BIT(0)
> > > +#define MACRONIX_30LFXG18AC_OTP_LOCKED               BIT(1)
> > > +
> > >  struct nand_onfi_vendor_macronix {
> > >       u8 reserved;
> > >       u8 reliability_func;
> > > @@ -316,6 +331,206 @@ static void macronix_nand_deep_power_down_suppo=
rt(struct nand_chip *chip)
> > >       chip->ops.resume =3D mxic_nand_resume;
> > >  }
> > >
> > > +static int macronix_30lfxg18ac_get_otp_info(struct mtd_info *mtd, si=
ze_t len,
> > > +                                         size_t *retlen,
> > > +                                         struct otp_info *buf)
> > > +{
> > > +     if (len < sizeof(*buf))
> > > +             return -EINVAL;
> > > +
> > > +     /* Don't know how to check that OTP is locked. */
> > > +     buf->locked =3D 0;
> > > +     buf->start =3D MACRONIX_30LFXG18AC_OTP_START_BYTE;
> > > +     buf->length =3D MACRONIX_30LFXG18AC_OTP_SIZE_BYTES;
> > > +
> > > +     *retlen =3D sizeof(*buf);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int macronix_30lfxg18ac_otp_enable(struct nand_chip *nand)
> > > +{
> > > +     u8 feature_buf[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0 };
> > > +
> > > +     feature_buf[0] =3D MACRONIX_30LFXG18AC_OTP_EN;
> > > +     return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
> > > +                              feature_buf);
> > > +}
> > > +
> > > +static int macronix_30lfxg18ac_otp_disable(struct nand_chip *nand)
> > > +{
> > > +     u8 feature_buf[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0 };
> > > +
> > > +     return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
> > > +                              feature_buf);
> > > +}
> > > +
> > > +static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
> > > +                                     loff_t offs_in_flash,
> > > +                                     size_t len, size_t *retlen,
> > > +                                     u_char *buf, bool write)
> > > +{
> > > +     struct nand_chip *nand;
> > > +     size_t bytes_handled;
> > > +     off_t offs_in_page;
> > > +     void *dma_buf;
> > > +     u64 page;
> > > +     int ret;
> > > +
> > > +     /* 'nand_prog/read_page_op()' may use 'buf' as DMA buffer,
> > > +      * so allocate properly aligned memory for it. This is
> > > +      * needed because cross page accesses may lead to unaligned
> > > +      * buffer address for DMA.
> > > +      */
> > > +     dma_buf =3D kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERN=
EL);
> > > +     if (!dma_buf)
> > > +             return -ENOMEM;
> > > +
> > > +     nand =3D mtd_to_nand(mtd);
> > > +     nand_select_target(nand, 0);
> > > +
> > > +     ret =3D macronix_30lfxg18ac_otp_enable(nand);
> > > +     if (ret)
> > > +             goto out_otp;
> > > +
> > > +     page =3D offs_in_flash;
> > > +     /* 'page' will be result of division. */
> > > +     offs_in_page =3D do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE=
);
> > > +     bytes_handled =3D 0;
> > > +
> > > +     while (bytes_handled < len &&
> > > +            page < MACRONIX_30LFXG18AC_OTP_PAGES) {
> > > +             size_t bytes_to_handle;
> > > +
> > > +             bytes_to_handle =3D min_t(size_t, len - bytes_handled,
> > > +                                     MACRONIX_30LFXG18AC_OTP_PAGE_SI=
ZE -
> > > +                                     offs_in_page);
> > > +
> > > +             if (write) {
> > > +                     memcpy(dma_buf, &buf[bytes_handled], bytes_to_h=
andle);
> > > +                     ret =3D nand_prog_page_op(nand, page, offs_in_p=
age,
> > > +                                             dma_buf, bytes_to_handl=
e);
> > > +             } else {
> > > +                     ret =3D nand_read_page_op(nand, page, offs_in_p=
age,
> > > +                                             dma_buf, bytes_to_handl=
e);
> > > +                     if (!ret)
> > > +                             memcpy(&buf[bytes_handled], dma_buf,
> > > +                                    bytes_to_handle);
> > > +             }
> > > +             if (ret)
> > > +                     goto out_otp;
> > > +
> > > +             bytes_handled +=3D bytes_to_handle;
> > > +             offs_in_page =3D 0;
> > > +             page++;
> > > +     }
> > > +
> > > +     *retlen =3D bytes_handled;
> > > +
> > > +out_otp:
> > > +     if (ret)
> > > +             dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", re=
t);
> > > +
> > > +     ret =3D macronix_30lfxg18ac_otp_disable(nand);
> > > +     if (ret)
> > > +             dev_err(&mtd->dev, "failed to leave OTP mode after %s\n=
",
> > > +                     write ? "write" : "read");
> > > +
> > > +     nand_deselect_target(nand);
> > > +     kfree(dma_buf);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int macronix_30lfxg18ac_write_otp(struct mtd_info *mtd, loff_=
t to,
> > > +                                      size_t len, size_t *rlen,
> > > +                                      const u_char *buf)
> > > +{
> > > +     return __macronix_30lfxg18ac_rw_otp(mtd, to, len, rlen, (u_char=
 *)buf,
> > > +                                         true);
> > > +}
> > > +
> > > +static int macronix_30lfxg18ac_read_otp(struct mtd_info *mtd, loff_t=
 from,
> > > +                                     size_t len, size_t *rlen,
> > > +                                     u_char *buf)
> > > +{
> > > +     return __macronix_30lfxg18ac_rw_otp(mtd, from, len, rlen, buf, =
false);
> > > +}
> > > +
> > > +static int macronix_30lfxg18ac_lock_otp(struct mtd_info *mtd, loff_t=
 from,
> > > +                                     size_t len)
> > > +{
> > > +     u8 feature_buf[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0 };
> > > +     struct nand_chip *nand;
> > > +     int ret;
> > > +
> > > +     if (from !=3D MACRONIX_30LFXG18AC_OTP_START_BYTE ||
> > > +         len !=3D MACRONIX_30LFXG18AC_OTP_SIZE_BYTES)
> > > +             return -EINVAL;
> > > +
> > > +     dev_dbg(&mtd->dev, "locking OTP\n");
> > > +
> > > +     nand =3D mtd_to_nand(mtd);
> > > +     nand_select_target(nand, 0);
> > > +
> > > +     feature_buf[0] =3D MACRONIX_30LFXG18AC_OTP_EN |
> > > +                      MACRONIX_30LFXG18AC_OTP_LOCKED;
> > > +     ret =3D nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OT=
P,
> > > +                             feature_buf);
> > > +     if (ret) {
> > > +             dev_err(&mtd->dev,
> > > +                     "failed to lock OTP (set features): %i\n", ret);
> > > +             nand_deselect_target(nand);
> > > +             return ret;
> > > +     }
> > > +
> > > +     /* Do dummy page prog with zero address. */
> > > +     feature_buf[0] =3D 0;
> > > +     ret =3D nand_prog_page_op(nand, 0, 0, feature_buf, 1);
> > > +     if (ret)
> > > +             dev_err(&mtd->dev,
> > > +                     "failed to lock OTP (page prog): %i\n", ret);
> > > +
> > > +     ret =3D macronix_30lfxg18ac_otp_disable(nand);
> > > +     if (ret)
> > > +             dev_err(&mtd->dev, "failed to leave OTP mode after lock=
\n");
> > > +
> > > +     nand_deselect_target(nand);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void macronix_nand_setup_otp(struct nand_chip *chip)
> > > +{
> > > +     static const char * const supported_otp_models[] =3D {
> > > +             "MX30LF1G18AC",
> > > +             "MX30LF2G18AC",
> > > +             "MX30LF4G18AC",
> > > +     };
> > > +     struct mtd_info *mtd;
> > > +
> > > +     if (match_string(supported_otp_models,
> > > +                      ARRAY_SIZE(supported_otp_models),
> > > +                      chip->parameters.model) < 0)
> > > +             return;
> > > +
> > > +     if (!chip->parameters.supports_set_get_features)
> > > +             return;
> > > +
> > > +     bitmap_set(chip->parameters.get_feature_list,
> > > +                ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
> > > +     bitmap_set(chip->parameters.set_feature_list,
> > > +                ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
> > > +
> > > +     mtd =3D nand_to_mtd(chip);
> > > +     mtd->_get_fact_prot_info =3D macronix_30lfxg18ac_get_otp_info;
> > > +     mtd->_read_fact_prot_reg =3D macronix_30lfxg18ac_read_otp;
> > > +     mtd->_get_user_prot_info =3D macronix_30lfxg18ac_get_otp_info;
> > > +     mtd->_read_user_prot_reg =3D macronix_30lfxg18ac_read_otp;
> > > +     mtd->_write_user_prot_reg =3D macronix_30lfxg18ac_write_otp;
> > > +     mtd->_lock_user_prot_reg =3D macronix_30lfxg18ac_lock_otp;
> > > +}
> > > +
> > >  static int macronix_nand_init(struct nand_chip *chip)
> > >  {
> > >       if (nand_is_slc(chip))
> > > @@ -325,6 +540,7 @@ static int macronix_nand_init(struct nand_chip *c=
hip)
> > >       macronix_nand_onfi_init(chip);
> > >       macronix_nand_block_protection_support(chip);
> > >       macronix_nand_deep_power_down_support(chip);
> > > +     macronix_nand_setup_otp(chip);
> > >
> > >       return 0;
> > >  } =20
> >
> >
> > Thanks,
> > Miqu=C3=A8l =20
>=20
> Thanks
> Jaime


