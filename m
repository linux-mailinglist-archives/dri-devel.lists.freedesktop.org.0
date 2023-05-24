Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DD470F04A
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 10:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B83D10E59E;
	Wed, 24 May 2023 08:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D532410E046
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 06:33:31 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ae454844edso4418075ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 23:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684910011; x=1687502011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZytcZ3VwuCq76/D3BihoAAg5jsM5s58IhQgHv2bVFM=;
 b=GpblBLOMdDyZ+rJGSJxBbZCR9/80prxCXE+n6rOOpHjWfF8CY2Six/JuqKmwYhOkaG
 HBdgLQgpecx7bLSVh/jBSO6nbpzmg6hqwfoOSOpx0IfaRfHLqP3uMCdB7W8I/1U1MjYy
 bQ4/XqYTbvclzL7LtYmYC/ziLw17xj0uT+Czto+8UuDURPlLlQxpOcF/mqN1hPxDw8jy
 ZrrpHMiYW66mhXFmIxVkMpjTCufKQ9HILNOqaffEME5UtEppPVnw1dj9in5szCTQ+REU
 +lpzl8jGJN+KjbULvKyRpniR9qvtMPPLWcuJuObwqUOREPZn/stfxnYoHETREkHWgJ13
 XE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684910011; x=1687502011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZytcZ3VwuCq76/D3BihoAAg5jsM5s58IhQgHv2bVFM=;
 b=bqWP+3XcFUEZFB/mkOT4gzDNSVOAiEZlZzCOAc/bekoutBmgLfArdXjSiUX4h10Nde
 uPFujglzCOHX7zDh54Drmxk9coaujQCK+EQXVUaqPJEgt1QNglKtpTuCAZbVj8L/wJPQ
 vQBe4KwiyzRoB8TD8ebmIm4FZuEjS3cryWTRsOyablWNDmcs/eikAWM4rcASJiQ/28HK
 Kv1E+ghHyY5TSMrjLRz+uvWQOVZ7Ra53aKfqaCBnmtuoSJcrlHBwsy8mhPRTRKEM6OU5
 QJVh79l743MlKhZ9hXJPvnSauHqRPhlSYIpWkmuIGbXELNgpXlMEe59kI+yMQF0Aj8Dl
 eWuw==
X-Gm-Message-State: AC+VfDxXTguxsxsuit60e9ZitIo2k9biOKm6UPfo7FUJ9e8rBAhLRkda
 6RZiuDjmsDIJV4D2EtmrLPNLokEGp0wrwA8Oy84=
X-Google-Smtp-Source: ACHHUZ5wUYGy14v/X3nxf4KjcKO/yzfIyoOlWFtzMxIPOAsvC35YFvTWQcIvTclY9hddhQ+5BkP1YhLf3yt9BZdFThU=
X-Received: by 2002:a17:90b:e8f:b0:24e:3b85:a8a with SMTP id
 fv15-20020a17090b0e8f00b0024e3b850a8amr17345777pjb.8.1684910010949; Tue, 23
 May 2023 23:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230511152120.3297853-1-AVKrasnov@sberdevices.ru>
 <c873b5a9-17ad-767c-5b20-35a49ab2bd40@sberdevices.ru>
 <aa67ee8b-898b-319b-f167-b554700842b3@sberdevices.ru>
 <20230522161446.16d1f307@xps-13>
In-Reply-To: <20230522161446.16d1f307@xps-13>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Wed, 24 May 2023 14:33:18 +0800
Message-ID: <CAAQoYRkTMpeHABxwRAXVtyuUNXhEk8njcXxJiH7PWg3UsERVVQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v3] mtd: rawnand: macronix: OTP access for
 MX30LFxG18AC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 24 May 2023 08:10:24 +0000
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
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 oxffffaa@gmail.com, kernel@sberdevices.ru,
 Mason Yang <masonccyang@mxic.com.tw>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel

>
> Hi Arseniy,
>
> avkrasnov@sberdevices.ru wrote on Mon, 15 May 2023 12:49:50 +0300:
>
> > Hello @Miquel!
> >
> > Sorry, but who could review this patch? :) IIUC this logic is very hw s=
pecific and we need
> > someone who knows it well? I tested this patch on our devices (with alr=
eady known Meson NAND
> > controller).
>
> + Jaime, who might test
>
> >
> > Thanks, Arseniy
> >
> > On 11.05.2023 21:21, Arseniy Krasnov wrote:
> > > Cc: Mason Yang <masonccyang@mxic.com.tw> and Boris Brezillon <boris.b=
rezillon@collabora.com>
> > >
> > > On 11.05.2023 18:21, Arseniy Krasnov wrote:
> > >> This adds support for OTP area access on MX30LFxG18AC chip series.
> > >>
> > >> Changelog:
> > >>   v1 -> v2:
> > >>   * Add slab.h include due to kernel test robot error.
> > >>   v2 -> v3:
> > >>   * Use 'uint64_t' as input argument for 'do_div()' instead
> > >>     of 'unsigned long' due to kernel test robot error.
> > >>
> > >> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> > >> ---
> > >>  drivers/mtd/nand/raw/nand_macronix.c | 213 ++++++++++++++++++++++++=
+++
> > >>  1 file changed, 213 insertions(+)
> > >>
> > >> diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand=
/raw/nand_macronix.c
> > >> index 1472f925f386..2301f990678e 100644
> > >> --- a/drivers/mtd/nand/raw/nand_macronix.c
> > >> +++ b/drivers/mtd/nand/raw/nand_macronix.c
> > >> @@ -6,6 +6,7 @@
> > >>   * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
> > >>   */
> > >>
> > >> +#include <linux/slab.h>
> > >>  #include "linux/delay.h"
> > >>  #include "internals.h"
> > >>
> > >> @@ -31,6 +32,20 @@
> > >>
> > >>  #define MXIC_CMD_POWER_DOWN 0xB9
> > >>
> > >> +#define ONFI_FEATURE_ADDR_30LFXG18AC_OTP  0x90
> > >> +#define MACRONIX_30LFXG18AC_OTP_START_PAGE        0
> > >> +#define MACRONIX_30LFXG18AC_OTP_PAGES             30
> > >> +#define MACRONIX_30LFXG18AC_OTP_PAGE_SIZE 2112
> > >> +#define MACRONIX_30LFXG18AC_OTP_START_BYTE        \
> > >> +  (MACRONIX_30LFXG18AC_OTP_START_PAGE *   \
> > >> +   MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
> > >> +#define MACRONIX_30LFXG18AC_OTP_SIZE_BYTES        \
> > >> +  (MACRONIX_30LFXG18AC_OTP_PAGES *        \
> > >> +   MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
> > >> +
> > >> +#define MACRONIX_30LFXG18AC_OTP_EN                BIT(0)
> > >> +#define MACRONIX_30LFXG18AC_OTP_LOCKED            BIT(1)
> > >> +
> > >>  struct nand_onfi_vendor_macronix {
> > >>    u8 reserved;
> > >>    u8 reliability_func;
> > >> @@ -316,6 +331,203 @@ static void macronix_nand_deep_power_down_supp=
ort(struct nand_chip *chip)
> > >>    chip->ops.resume =3D mxic_nand_resume;
> > >>  }
> > >>
> > >> +static int macronix_30lfxg18ac_get_otp_info(struct mtd_info *mtd, s=
ize_t len,
> > >> +                                      size_t *retlen,
> > >> +                                      struct otp_info *buf)
> > >> +{
> > >> +  if (len < sizeof(*buf))
> > >> +          return -EINVAL;
> > >> +
> > >> +  /* Don't know how to check that OTP is locked. */
>
> Jaime, any idea?

OTP info could be check by GET_FEATURE command.
GET_FEATURE command with address 90h could read sub-feature
parameter table, P1 is "3" means OTP protection.

Thanks
Jaime

>
> > >> +  buf->locked =3D 0;
> > >> +  buf->start =3D MACRONIX_30LFXG18AC_OTP_START_BYTE;
> > >> +  buf->length =3D MACRONIX_30LFXG18AC_OTP_SIZE_BYTES;
> > >> +
> > >> +  *retlen =3D sizeof(*buf);
> > >> +
> > >> +  return 0;
> > >> +}
> > >> +
> > >> +static int macronix_30lfxg18ac_otp_enable(struct nand_chip *nand)
> > >> +{
> > >> +  uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0 };
> > >> +
> > >> +  feature_buf[0] =3D MACRONIX_30LFXG18AC_OTP_EN;
> > >> +  return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
> > >> +                           feature_buf);
> > >> +}
> > >> +
> > >> +static int macronix_30lfxg18ac_otp_disable(struct nand_chip *nand)
> > >> +{
> > >> +  uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0 };
> > >> +
> > >> +  return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
> > >> +                           feature_buf);
> > >> +}
> > >> +
> > >> +static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
> > >> +                                  loff_t offs_in_flash,
> > >> +                                  size_t len, size_t *retlen,
> > >> +                                  u_char *buf, bool write)
> > >> +{
> > >> +  struct nand_chip *nand;
> > >> +  size_t bytes_handled;
> > >> +  off_t offs_in_page;
> > >> +  uint64_t page;
> > >> +  void *dma_buf;
> > >> +  int ret;
> > >> +
> > >> +  /* 'nand_prog/read_page_op()' may use 'buf' as DMA buffer,
> > >> +   * so allocate properly aligned memory for it. This is
> > >> +   * needed because cross page accesses may lead to unaligned
> > >> +   * buffer address for DMA.
> > >> +   */
> > >> +  dma_buf =3D kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERNEL=
);
> > >> +  if (!dma_buf)
> > >> +          return -ENOMEM;
> > >> +
> > >> +  nand =3D mtd_to_nand(mtd);
> > >> +  nand_select_target(nand, 0);
> > >> +
> > >> +  ret =3D macronix_30lfxg18ac_otp_enable(nand);
> > >> +  if (ret)
> > >> +          goto out_otp;
> > >> +
> > >> +  page =3D offs_in_flash;
> > >> +  /* 'page' will be result of division. */
> > >> +  offs_in_page =3D do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
> > >> +  bytes_handled =3D 0;
> > >> +
> > >> +  while (bytes_handled < len &&
> > >> +         page < MACRONIX_30LFXG18AC_OTP_PAGES) {
> > >> +          size_t bytes_to_handle;
> > >> +
> > >> +          bytes_to_handle =3D min_t(size_t, len - bytes_handled,
> > >> +                                  MACRONIX_30LFXG18AC_OTP_PAGE_SIZE=
 -
> > >> +                                  offs_in_page);
> > >> +
> > >> +          if (write) {
> > >> +                  memcpy(dma_buf, &buf[bytes_handled], bytes_to_han=
dle);
> > >> +                  ret =3D nand_prog_page_op(nand, page, offs_in_pag=
e,
> > >> +                                          dma_buf, bytes_to_handle)=
;
> > >> +          } else {
> > >> +                  ret =3D nand_read_page_op(nand, page, offs_in_pag=
e,
> > >> +                                          dma_buf, bytes_to_handle)=
;
> > >> +                  if (!ret)
> > >> +                          memcpy(&buf[bytes_handled], dma_buf,
> > >> +                                 bytes_to_handle);
> > >> +          }
> > >> +          if (ret)
> > >> +                  goto out_otp;
> > >> +
> > >> +          bytes_handled +=3D bytes_to_handle;
> > >> +          offs_in_page =3D 0;
> > >> +          page++;
> > >> +  }
> > >> +
> > >> +  *retlen =3D bytes_handled;
> > >> +
> > >> +out_otp:
> > >> +  if (ret)
> > >> +          dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret)=
;
> > >> +
> > >> +  ret =3D macronix_30lfxg18ac_otp_disable(nand);
> > >> +  WARN(ret, "failed to leave OTP mode after %s\n",
> > >> +       write ? "write" : "read");
>
> Let's avoid WARN() calls (none in this driver are relevant IMHO). Just a
> dev_err() should be enough.
>
> > >> +  nand_deselect_target(nand);
> > >> +  kfree(dma_buf);
> > >> +
> > >> +  return ret;
> > >> +}
> > >> +
> > >> +static int macronix_30lfxg18ac_write_otp(struct mtd_info *mtd, loff=
_t to,
> > >> +                                   size_t len, size_t *rlen,
> > >> +                                   const u_char *buf)
> > >> +{
> > >> +  return __macronix_30lfxg18ac_rw_otp(mtd, to, len, rlen, (u_char *=
)buf,
> > >> +                                      true);
> > >> +}
> > >> +
> > >> +static int macronix_30lfxg18ac_read_otp(struct mtd_info *mtd, loff_=
t from,
> > >> +                                  size_t len, size_t *rlen,
> > >> +                                  u_char *buf)
> > >> +{
> > >> +  return __macronix_30lfxg18ac_rw_otp(mtd, from, len, rlen, buf, fa=
lse);
> > >> +}
> > >> +
> > >> +static int macronix_30lfxg18ac_lock_otp(struct mtd_info *mtd, loff_=
t from,
> > >> +                                  size_t len)
> > >> +{
> > >> +  uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0 };
> > >> +  struct nand_chip *nand;
> > >> +  int ret;
> > >> +
> > >> +  if (from !=3D MACRONIX_30LFXG18AC_OTP_START_BYTE ||
> > >> +      len !=3D MACRONIX_30LFXG18AC_OTP_SIZE_BYTES)
> > >> +          return -EINVAL;
> > >> +
> > >> +  dev_dbg(&mtd->dev, "locking OTP\n");
> > >> +
> > >> +  nand =3D mtd_to_nand(mtd);
> > >> +  nand_select_target(nand, 0);
> > >> +
> > >> +  feature_buf[0] =3D MACRONIX_30LFXG18AC_OTP_EN |
> > >> +                   MACRONIX_30LFXG18AC_OTP_LOCKED;
> > >> +  ret =3D nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
> > >> +                          feature_buf);
> > >> +  if (ret) {
> > >> +          dev_err(&mtd->dev,
> > >> +                  "failed to lock OTP (set features): %i\n", ret);
> > >> +          nand_deselect_target(nand);
> > >> +          return ret;
> > >> +  }
> > >> +
> > >> +  /* Do dummy page prog with zero address. */
> > >> +  feature_buf[0] =3D 0;
> > >> +  ret =3D nand_prog_page_op(nand, 0, 0, feature_buf, 1);
> > >> +  if (ret)
> > >> +          dev_err(&mtd->dev,
> > >> +                  "failed to lock OTP (page prog): %i\n", ret);
> > >> +
> > >> +  ret =3D macronix_30lfxg18ac_otp_disable(nand);
> > >> +  WARN(ret, "failed to leave OTP mode after lock\n");
> > >> +
> > >> +  nand_deselect_target(nand);
> > >> +
> > >> +  return ret;
> > >> +}
> > >> +
> > >> +static void macronix_nand_setup_otp(struct nand_chip *chip)
> > >> +{
> > >> +  static const char * const supported_otp_models[] =3D {
> > >> +          "MX30LF1G18AC",
> > >> +          "MX30LF2G18AC",
> > >> +          "MX30LF4G18AC",
> > >> +  };
> > >> +  struct mtd_info *mtd;
> > >> +
> > >> +  if (!chip->parameters.supports_set_get_features)
> > >> +          return;
> > >> +
> > >> +  if (match_string(supported_otp_models,
> > >> +                   ARRAY_SIZE(supported_otp_models),
> > >> +                   chip->parameters.model) < 0)
> > >> +          return;
>
> I would start by checking the model, then it's list of supported ops.
>
> > >> +
> > >> +  bitmap_set(chip->parameters.get_feature_list,
> > >> +             ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
> > >> +  bitmap_set(chip->parameters.set_feature_list,
> > >> +             ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
> > >> +
> > >> +  mtd =3D nand_to_mtd(chip);
> > >> +  mtd->_get_fact_prot_info =3D macronix_30lfxg18ac_get_otp_info;
> > >> +  mtd->_read_fact_prot_reg =3D macronix_30lfxg18ac_read_otp;
> > >> +  mtd->_get_user_prot_info =3D macronix_30lfxg18ac_get_otp_info;
> > >> +  mtd->_read_user_prot_reg =3D macronix_30lfxg18ac_read_otp;
> > >> +  mtd->_write_user_prot_reg =3D macronix_30lfxg18ac_write_otp;
> > >> +  mtd->_lock_user_prot_reg =3D macronix_30lfxg18ac_lock_otp;
> > >> +}
> > >> +
> > >>  static int macronix_nand_init(struct nand_chip *chip)
> > >>  {
> > >>    if (nand_is_slc(chip))
> > >> @@ -325,6 +537,7 @@ static int macronix_nand_init(struct nand_chip *=
chip)
> > >>    macronix_nand_onfi_init(chip);
> > >>    macronix_nand_block_protection_support(chip);
> > >>    macronix_nand_deep_power_down_support(chip);
> > >> +  macronix_nand_setup_otp(chip);
> > >>
> > >>    return 0;
> > >>  }
>
>
> Thanks,
> Miqu=C3=A8l
