Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B9710631
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 09:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E2A10E479;
	Thu, 25 May 2023 07:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36C910E12A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 07:06:44 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id F34475FD04;
 Thu, 25 May 2023 10:06:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1684998402;
 bh=agFIjKwzbyB8WuER8TCB0K9IOpWFK4T2scVpmozyr78=;
 h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
 b=GxjDQt6163BnfyDN17PH9SISn73cPMHG3rXk63xOETLhyC973LId/tVLTUK7Buxhf
 s07X9sVbDquX1ZsNc1mgRGg01kXdsvla9NvS4zxVZXZlQ2opev9aKvVrfz7GI66qTt
 4KrjTjk5o1/lyzz1OmNdhTwxIHvY0bZXeplDOtio5OBAnXG9N6E+EVAXDVi4U7KDXL
 y0Nri+qdO5tER2dYdpQpGKiJrA8R1G0rLx9z9tQJ7bbzNgkAJBdsuZAuic3MESUAmm
 yXrP/es+lzE5UM6lRB5d3rGw4AtL0tntivgkwztW2kVWmoEeUjp5fqkUq4iCNKvpOu
 y2fwkdsgu1Ttw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Thu, 25 May 2023 10:06:36 +0300 (MSK)
Message-ID: <693c003b-f993-d2dd-73ce-44836185b1f6@sberdevices.ru>
Date: Thu, 25 May 2023 10:02:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RESEND PATCH v3] mtd: rawnand: macronix: OTP access for
 MX30LFxG18AC
Content-Language: en-US
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
To: liao jaime <jaimeliao.tw@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
References: <20230511152120.3297853-1-AVKrasnov@sberdevices.ru>
 <c873b5a9-17ad-767c-5b20-35a49ab2bd40@sberdevices.ru>
 <aa67ee8b-898b-319b-f167-b554700842b3@sberdevices.ru>
 <20230522161446.16d1f307@xps-13>
 <CAAQoYRkTMpeHABxwRAXVtyuUNXhEk8njcXxJiH7PWg3UsERVVQ@mail.gmail.com>
 <038d48cc-cdc6-cdc2-69e6-7768fb965fbe@sberdevices.ru>
In-Reply-To: <038d48cc-cdc6-cdc2-69e6-7768fb965fbe@sberdevices.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/05/25 04:52:00 #21357441
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Thu, 25 May 2023 07:22:59 +0000
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
 linaro-mm-sig@lists.linaro.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 oxffffaa@gmail.com, kernel@sberdevices.ru,
 Mason Yang <masonccyang@mxic.com.tw>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.05.2023 10:13, Arseniy Krasnov wrote:
> 
> 
> On 24.05.2023 09:33, liao jaime wrote:
>> Hi Miquel
>>
>>>
>>> Hi Arseniy,
>>>
>>> avkrasnov@sberdevices.ru wrote on Mon, 15 May 2023 12:49:50 +0300:
>>>
>>>> Hello @Miquel!
>>>>
>>>> Sorry, but who could review this patch? :) IIUC this logic is very hw specific and we need
>>>> someone who knows it well? I tested this patch on our devices (with already known Meson NAND
>>>> controller).
>>>
>>> + Jaime, who might test
>>>
>>>>
>>>> Thanks, Arseniy
>>>>
>>>> On 11.05.2023 21:21, Arseniy Krasnov wrote:
>>>>> Cc: Mason Yang <masonccyang@mxic.com.tw> and Boris Brezillon <boris.brezillon@collabora.com>
>>>>>
>>>>> On 11.05.2023 18:21, Arseniy Krasnov wrote:
>>>>>> This adds support for OTP area access on MX30LFxG18AC chip series.
>>>>>>
>>>>>> Changelog:
>>>>>>   v1 -> v2:
>>>>>>   * Add slab.h include due to kernel test robot error.
>>>>>>   v2 -> v3:
>>>>>>   * Use 'uint64_t' as input argument for 'do_div()' instead
>>>>>>     of 'unsigned long' due to kernel test robot error.
>>>>>>
>>>>>> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>>>>>> ---
>>>>>>  drivers/mtd/nand/raw/nand_macronix.c | 213 +++++++++++++++++++++++++++
>>>>>>  1 file changed, 213 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
>>>>>> index 1472f925f386..2301f990678e 100644
>>>>>> --- a/drivers/mtd/nand/raw/nand_macronix.c
>>>>>> +++ b/drivers/mtd/nand/raw/nand_macronix.c
>>>>>> @@ -6,6 +6,7 @@
>>>>>>   * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
>>>>>>   */
>>>>>>
>>>>>> +#include <linux/slab.h>
>>>>>>  #include "linux/delay.h"
>>>>>>  #include "internals.h"
>>>>>>
>>>>>> @@ -31,6 +32,20 @@
>>>>>>
>>>>>>  #define MXIC_CMD_POWER_DOWN 0xB9
>>>>>>
>>>>>> +#define ONFI_FEATURE_ADDR_30LFXG18AC_OTP  0x90
>>>>>> +#define MACRONIX_30LFXG18AC_OTP_START_PAGE        0
>>>>>> +#define MACRONIX_30LFXG18AC_OTP_PAGES             30
>>>>>> +#define MACRONIX_30LFXG18AC_OTP_PAGE_SIZE 2112
>>>>>> +#define MACRONIX_30LFXG18AC_OTP_START_BYTE        \
>>>>>> +  (MACRONIX_30LFXG18AC_OTP_START_PAGE *   \
>>>>>> +   MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
>>>>>> +#define MACRONIX_30LFXG18AC_OTP_SIZE_BYTES        \
>>>>>> +  (MACRONIX_30LFXG18AC_OTP_PAGES *        \
>>>>>> +   MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
>>>>>> +
>>>>>> +#define MACRONIX_30LFXG18AC_OTP_EN                BIT(0)
>>>>>> +#define MACRONIX_30LFXG18AC_OTP_LOCKED            BIT(1)
>>>>>> +
>>>>>>  struct nand_onfi_vendor_macronix {
>>>>>>    u8 reserved;
>>>>>>    u8 reliability_func;
>>>>>> @@ -316,6 +331,203 @@ static void macronix_nand_deep_power_down_support(struct nand_chip *chip)
>>>>>>    chip->ops.resume = mxic_nand_resume;
>>>>>>  }
>>>>>>
>>>>>> +static int macronix_30lfxg18ac_get_otp_info(struct mtd_info *mtd, size_t len,
>>>>>> +                                      size_t *retlen,
>>>>>> +                                      struct otp_info *buf)
>>>>>> +{
>>>>>> +  if (len < sizeof(*buf))
>>>>>> +          return -EINVAL;
>>>>>> +
>>>>>> +  /* Don't know how to check that OTP is locked. */
>>>
>>> Jaime, any idea?
>>
>> OTP info could be check by GET_FEATURE command.
>> GET_FEATURE command with address 90h could read sub-feature
>> parameter table, P1 is "3" means OTP protection.
>>
>> Thanks
>> Jaime
>>
> 
> Hello Jaime, thanks for quick reply!
> 
> I have two devices - with locked and unlocked OTP. I call the following thing for each of them:
> 
> @@ -339,6 +341,26 @@ static int macronix_30lfxg18ac_get_otp_info(struct mtd_info *mtd, size_t len,
>                 return -EINVAL;
>  
>         /* Don't know how to check that OTP is locked. */
> +       {
> +               u8 feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
> +               struct nand_chip *nand;
> +               int res;
> +
> +               nand = mtd_to_nand(mtd);
> +
> +               nand_select_target(nand, 0);
> +
> +               res = nand_get_features(nand, 0x90, feature_buf);
> +
> +               nand_deselect_target(nand);
> +
> +               printk(KERN_EMERG "\n\nRES %i OTP BUF %hhx %hhx %hhx %hhx\n\n\n",
> +                                       res,
> +                                       feature_buf[0],
> +                                       feature_buf[1],
> +                                       feature_buf[2],
> +                                       feature_buf[3]);
> +       }
>         buf->locked = 0;
>         buf->start = MACRONIX_30LFXG18AC_OTP_START_BYTE;
>         buf->length = MACRONIX_30LFXG18AC_OTP_SIZE_BYTES;
> 
> And get for both devices:
> 
> [    4.228721] RES 0 OTP BUF 0 0 0 0
> 
> May be i'm doing something wrong?
> 
> Thanks, Arseniy

Small upd: I tried to

1) Call 'nand_get_features()' when OTP mode is enabled, it just returns 1 0 0 0 (e.g. OTP mode enabled, on both locked and unlocked devs).
2) Increase timings and delays in NAND controller driver - it didn't help.

Anyway, I see, that OTP status (enabled or disabled) is returned successfully, but locked status is always missed.

Thanks, Arseniy

> 
>>>
>>>>>> +  buf->locked = 0;
>>>>>> +  buf->start = MACRONIX_30LFXG18AC_OTP_START_BYTE;
>>>>>> +  buf->length = MACRONIX_30LFXG18AC_OTP_SIZE_BYTES;
>>>>>> +
>>>>>> +  *retlen = sizeof(*buf);
>>>>>> +
>>>>>> +  return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int macronix_30lfxg18ac_otp_enable(struct nand_chip *nand)
>>>>>> +{
>>>>>> +  uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
>>>>>> +
>>>>>> +  feature_buf[0] = MACRONIX_30LFXG18AC_OTP_EN;
>>>>>> +  return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
>>>>>> +                           feature_buf);
>>>>>> +}
>>>>>> +
>>>>>> +static int macronix_30lfxg18ac_otp_disable(struct nand_chip *nand)
>>>>>> +{
>>>>>> +  uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
>>>>>> +
>>>>>> +  return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
>>>>>> +                           feature_buf);
>>>>>> +}
>>>>>> +
>>>>>> +static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
>>>>>> +                                  loff_t offs_in_flash,
>>>>>> +                                  size_t len, size_t *retlen,
>>>>>> +                                  u_char *buf, bool write)
>>>>>> +{
>>>>>> +  struct nand_chip *nand;
>>>>>> +  size_t bytes_handled;
>>>>>> +  off_t offs_in_page;
>>>>>> +  uint64_t page;
>>>>>> +  void *dma_buf;
>>>>>> +  int ret;
>>>>>> +
>>>>>> +  /* 'nand_prog/read_page_op()' may use 'buf' as DMA buffer,
>>>>>> +   * so allocate properly aligned memory for it. This is
>>>>>> +   * needed because cross page accesses may lead to unaligned
>>>>>> +   * buffer address for DMA.
>>>>>> +   */
>>>>>> +  dma_buf = kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERNEL);
>>>>>> +  if (!dma_buf)
>>>>>> +          return -ENOMEM;
>>>>>> +
>>>>>> +  nand = mtd_to_nand(mtd);
>>>>>> +  nand_select_target(nand, 0);
>>>>>> +
>>>>>> +  ret = macronix_30lfxg18ac_otp_enable(nand);
>>>>>> +  if (ret)
>>>>>> +          goto out_otp;
>>>>>> +
>>>>>> +  page = offs_in_flash;
>>>>>> +  /* 'page' will be result of division. */
>>>>>> +  offs_in_page = do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
>>>>>> +  bytes_handled = 0;
>>>>>> +
>>>>>> +  while (bytes_handled < len &&
>>>>>> +         page < MACRONIX_30LFXG18AC_OTP_PAGES) {
>>>>>> +          size_t bytes_to_handle;
>>>>>> +
>>>>>> +          bytes_to_handle = min_t(size_t, len - bytes_handled,
>>>>>> +                                  MACRONIX_30LFXG18AC_OTP_PAGE_SIZE -
>>>>>> +                                  offs_in_page);
>>>>>> +
>>>>>> +          if (write) {
>>>>>> +                  memcpy(dma_buf, &buf[bytes_handled], bytes_to_handle);
>>>>>> +                  ret = nand_prog_page_op(nand, page, offs_in_page,
>>>>>> +                                          dma_buf, bytes_to_handle);
>>>>>> +          } else {
>>>>>> +                  ret = nand_read_page_op(nand, page, offs_in_page,
>>>>>> +                                          dma_buf, bytes_to_handle);
>>>>>> +                  if (!ret)
>>>>>> +                          memcpy(&buf[bytes_handled], dma_buf,
>>>>>> +                                 bytes_to_handle);
>>>>>> +          }
>>>>>> +          if (ret)
>>>>>> +                  goto out_otp;
>>>>>> +
>>>>>> +          bytes_handled += bytes_to_handle;
>>>>>> +          offs_in_page = 0;
>>>>>> +          page++;
>>>>>> +  }
>>>>>> +
>>>>>> +  *retlen = bytes_handled;
>>>>>> +
>>>>>> +out_otp:
>>>>>> +  if (ret)
>>>>>> +          dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret);
>>>>>> +
>>>>>> +  ret = macronix_30lfxg18ac_otp_disable(nand);
>>>>>> +  WARN(ret, "failed to leave OTP mode after %s\n",
>>>>>> +       write ? "write" : "read");
>>>
>>> Let's avoid WARN() calls (none in this driver are relevant IMHO). Just a
>>> dev_err() should be enough.
>>>
>>>>>> +  nand_deselect_target(nand);
>>>>>> +  kfree(dma_buf);
>>>>>> +
>>>>>> +  return ret;
>>>>>> +}
>>>>>> +
>>>>>> +static int macronix_30lfxg18ac_write_otp(struct mtd_info *mtd, loff_t to,
>>>>>> +                                   size_t len, size_t *rlen,
>>>>>> +                                   const u_char *buf)
>>>>>> +{
>>>>>> +  return __macronix_30lfxg18ac_rw_otp(mtd, to, len, rlen, (u_char *)buf,
>>>>>> +                                      true);
>>>>>> +}
>>>>>> +
>>>>>> +static int macronix_30lfxg18ac_read_otp(struct mtd_info *mtd, loff_t from,
>>>>>> +                                  size_t len, size_t *rlen,
>>>>>> +                                  u_char *buf)
>>>>>> +{
>>>>>> +  return __macronix_30lfxg18ac_rw_otp(mtd, from, len, rlen, buf, false);
>>>>>> +}
>>>>>> +
>>>>>> +static int macronix_30lfxg18ac_lock_otp(struct mtd_info *mtd, loff_t from,
>>>>>> +                                  size_t len)
>>>>>> +{
>>>>>> +  uint8_t feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
>>>>>> +  struct nand_chip *nand;
>>>>>> +  int ret;
>>>>>> +
>>>>>> +  if (from != MACRONIX_30LFXG18AC_OTP_START_BYTE ||
>>>>>> +      len != MACRONIX_30LFXG18AC_OTP_SIZE_BYTES)
>>>>>> +          return -EINVAL;
>>>>>> +
>>>>>> +  dev_dbg(&mtd->dev, "locking OTP\n");
>>>>>> +
>>>>>> +  nand = mtd_to_nand(mtd);
>>>>>> +  nand_select_target(nand, 0);
>>>>>> +
>>>>>> +  feature_buf[0] = MACRONIX_30LFXG18AC_OTP_EN |
>>>>>> +                   MACRONIX_30LFXG18AC_OTP_LOCKED;
>>>>>> +  ret = nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
>>>>>> +                          feature_buf);
>>>>>> +  if (ret) {
>>>>>> +          dev_err(&mtd->dev,
>>>>>> +                  "failed to lock OTP (set features): %i\n", ret);
>>>>>> +          nand_deselect_target(nand);
>>>>>> +          return ret;
>>>>>> +  }
>>>>>> +
>>>>>> +  /* Do dummy page prog with zero address. */
>>>>>> +  feature_buf[0] = 0;
>>>>>> +  ret = nand_prog_page_op(nand, 0, 0, feature_buf, 1);
>>>>>> +  if (ret)
>>>>>> +          dev_err(&mtd->dev,
>>>>>> +                  "failed to lock OTP (page prog): %i\n", ret);
>>>>>> +
>>>>>> +  ret = macronix_30lfxg18ac_otp_disable(nand);
>>>>>> +  WARN(ret, "failed to leave OTP mode after lock\n");
>>>>>> +
>>>>>> +  nand_deselect_target(nand);
>>>>>> +
>>>>>> +  return ret;
>>>>>> +}
>>>>>> +
>>>>>> +static void macronix_nand_setup_otp(struct nand_chip *chip)
>>>>>> +{
>>>>>> +  static const char * const supported_otp_models[] = {
>>>>>> +          "MX30LF1G18AC",
>>>>>> +          "MX30LF2G18AC",
>>>>>> +          "MX30LF4G18AC",
>>>>>> +  };
>>>>>> +  struct mtd_info *mtd;
>>>>>> +
>>>>>> +  if (!chip->parameters.supports_set_get_features)
>>>>>> +          return;
>>>>>> +
>>>>>> +  if (match_string(supported_otp_models,
>>>>>> +                   ARRAY_SIZE(supported_otp_models),
>>>>>> +                   chip->parameters.model) < 0)
>>>>>> +          return;
>>>
>>> I would start by checking the model, then it's list of supported ops.
>>>
>>>>>> +
>>>>>> +  bitmap_set(chip->parameters.get_feature_list,
>>>>>> +             ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
>>>>>> +  bitmap_set(chip->parameters.set_feature_list,
>>>>>> +             ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
>>>>>> +
>>>>>> +  mtd = nand_to_mtd(chip);
>>>>>> +  mtd->_get_fact_prot_info = macronix_30lfxg18ac_get_otp_info;
>>>>>> +  mtd->_read_fact_prot_reg = macronix_30lfxg18ac_read_otp;
>>>>>> +  mtd->_get_user_prot_info = macronix_30lfxg18ac_get_otp_info;
>>>>>> +  mtd->_read_user_prot_reg = macronix_30lfxg18ac_read_otp;
>>>>>> +  mtd->_write_user_prot_reg = macronix_30lfxg18ac_write_otp;
>>>>>> +  mtd->_lock_user_prot_reg = macronix_30lfxg18ac_lock_otp;
>>>>>> +}
>>>>>> +
>>>>>>  static int macronix_nand_init(struct nand_chip *chip)
>>>>>>  {
>>>>>>    if (nand_is_slc(chip))
>>>>>> @@ -325,6 +537,7 @@ static int macronix_nand_init(struct nand_chip *chip)
>>>>>>    macronix_nand_onfi_init(chip);
>>>>>>    macronix_nand_block_protection_support(chip);
>>>>>>    macronix_nand_deep_power_down_support(chip);
>>>>>> +  macronix_nand_setup_otp(chip);
>>>>>>
>>>>>>    return 0;
>>>>>>  }
>>>
>>>
>>> Thanks,
>>> Miquèl
