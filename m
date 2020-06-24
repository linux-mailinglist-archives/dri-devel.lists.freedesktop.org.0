Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731AE207478
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DFC6EB55;
	Wed, 24 Jun 2020 13:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9046EB4C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:28:38 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200624132837euoutp024c144c4dd489405a897a159fff3751cf~bfeVO5tTN2217222172euoutp02p
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:28:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200624132837euoutp024c144c4dd489405a897a159fff3751cf~bfeVO5tTN2217222172euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593005317;
 bh=+BVFHsIaHxxf5sNngKe2tcvXYhFFq09+cJEbPx8Juh0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=P0VYXq6cWGPU4+3SgaotVxlpxRuqpm0FwLThGtgxwgxfcPShlfT8cyNYzGusFVibG
 UoEcSSRZL2ttROnKTbG0a1y92LbDJ8Ogjpx+wBhQW8iIq4h2KoIUxjzzE9+vD9KTLp
 zljawienuQrDhpRXefwKVyuoL4IWZ9XzGm6poDH0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200624132836eucas1p168afaff6bfae6863178963b94c201008~bfeU2nsjZ3176931769eucas1p1L;
 Wed, 24 Jun 2020 13:28:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.30.05997.40553FE5; Wed, 24
 Jun 2020 14:28:36 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200624132836eucas1p13876eb90301f41ada796d6ed4e84df67~bfeUhNix_2578925789eucas1p1F;
 Wed, 24 Jun 2020 13:28:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200624132836eusmtrp2f2c8409c0fbe659b7fb303e5ec6e4064~bfeUgdWFi3192631926eusmtrp2R;
 Wed, 24 Jun 2020 13:28:36 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-dc-5ef355047b6f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 94.E4.06314.40553FE5; Wed, 24
 Jun 2020 14:28:36 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200624132835eusmtip20a653f6e73b772478b9a0069e23e93f3~bfeTji1Ld0065300653eusmtip2B;
 Wed, 24 Jun 2020 13:28:35 +0000 (GMT)
Subject: Re: [RESEND PATCH v5 2/5] driver core: add deferring probe reason
 to devices_deferred property
To: "Rafael J. Wysocki" <rafael@kernel.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2d01c2eb-ad40-f510-f4a9-392a0a2494a9@samsung.com>
Date: Wed, 24 Jun 2020 15:28:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0hv-jKSegVtNQ2uMde5A6hQ0_ksK0m1CBapqaXZWmV_zg@mail.gmail.com>
Content-Language: pl
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUwTYRDN191ul4aSpUA6KnjUI8ED72SNioqabOIf+WE8UHSRBYm0YAsK
 /hCMSAAFiora0nogaoMYtAJCRcFqBCIQEIp4AB5EU1KshlODVNqFyL83b+bNvJcMiUl/CmeS
 McoETqVkY+WEGK949bt5Gb5rIHxFwdW5tE3zAtEPr5YK6fzPvQTdPuQg6DO3SgnaOmLD6Aa7
 Facz84pEtOlrh5BuM+sJ2pL/FNH3X3aJaEtOGG0YzMc2ezFtHa0Y4+g8K2KqdF0ipiBDK2RM
 xZkEU695I2BqDCUipudcnYB5VJTC5JQVI6Y2+yLODJhm7/TcJ94QycXGHOdUy4MPiY8Yzmah
 +JagpJt3v+OpaGB+FvIggVoDldXZeBYSk1LKiKDkfh7GF4MIzO+NiC8GEHz4lotNSZzdtUK+
 cRdBi94+qXcguPS2U+Sa8qFioMBZ71b4UkugqNDq3otRYzg01owKXQ2CCoS/j94RLiyhguGr
 6ZpbjFMLYfx2lpv3ow7A+Z4+jJ/xhgZtL+7CHlQoPCstdGOMmgOP+/UYj32h80ua2zdQWhKG
 vukR73sbNPQbcR77QF9dmYjH/uCsui7gcQr0GNMwXpyBoPxB1WTo9fCx+c+EI3LiQiCUmpfz
 9BboNj9300B5QWe/N+/BCy5UXMF4WgIZ6VJ+eh70NJVPLpTB7ZYhQoPkumnJdNPS6Kal0f2/
 ewPhxUjGJaoV0Zx6lZI7EaRmFepEZXTQ4TiFCU384evxusFKZB6LsCCKRHJPyYNPv8KlQva4
 OllhQUBicl9JSNPrcKkkkk0+yaniDqoSYzm1Bc0icblMsrrQdkBKRbMJ3FGOi+dUU10B6TEz
 FR1LHd7DPfEPXxvQZXFE7VizG0UsavdOiFfkRNq3BuyPanWWbD86fEpikO1oTOsIeX9xb4lx
 dfY6/SatZ1HoIoVP5jLxiY/s9QDD0pFbudrcuMtsvzFpVFNNdvsJrgzXLNg4wxr21PBdRX2m
 06Pr7nTb7hWfbq+3mQLDOPuZHyONclx9hF25GFOp2X/79ULXgwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleLIzCtJLcpLzFFi42I5/e/4PV2W0M9xBg92cFm8nHCY0WLjjPWs
 FlMfPmGzuPL1PZtF8+L1bBZXv79ktjj55iqLRefEJewWmx5fY7W4vGsOm8WhqXsZLdYeuctu
 cagv2mLul6nMDnwel69dZPZ4f6OV3WPnrLvsHrM7ZrJ6bFrVyeZxYsIlJo/9c9ewe9zvPs7k
 sXlJvUffllWMHgd6J7N4fN4kF8ATpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtl
 ZKqkb2eTkpqTWZZapG+XoJcxt7WLseCCXsXC5c9ZGhg/K3cxcnJICJhI/L93gLWLkYtDSGAp
 o8TpWxMYIRLiErvnv2WGsIUl/lzrYoMoesso0fZhBztIQlggU+LM1uNsILaIgLbEkkVXmUGK
 mAX+sEj8OrCCEaKjgUni1f7FYFVsApoSfzffBLN5BewkHm+aBzaJRUBV4t/SLrC4qECsRPfi
 H+wQNYISJ2c+YQGxOQUCJfatXwRmMwuYSczb/JAZwpaX2P52DpQtInHjUQvjBEahWUjaZyFp
 mYWkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECE8C2Yz8372C8tDH4EKMAB6MS
 D++GBx/jhFgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cDk
 lFcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgbHpAv/Gsjd/+/b1
 nG/Ns+8tn6jTccjOgm97+6fjjU93x/iazFeastMlgm8xW+7OX1N+GFonnDQu6Irbd39JpN9f
 s5lLGSdmhaUr/Pl+ZXrRq/if51rmnMv6Wxq82K4tb7IIy+1rf19cTOhtNhQ5EW04t+rJy4oU
 Wd2EB8UOnxOfmjCfl5ROb1RiKc5INNRiLipOBAAK6VOwFgMAAA==
X-CMS-MailID: 20200624132836eucas1p13876eb90301f41ada796d6ed4e84df67
X-Msg-Generator: CA
X-RootMTR: 20200624114136eucas1p1a3a31d95d86754201c7965f26ccd5de0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114136eucas1p1a3a31d95d86754201c7965f26ccd5de0
References: <CGME20200624114136eucas1p1a3a31d95d86754201c7965f26ccd5de0@eucas1p1.samsung.com>
 <20200624114127.3016-1-a.hajda@samsung.com>
 <20200624114127.3016-3-a.hajda@samsung.com>
 <CAJZ5v0hv-jKSegVtNQ2uMde5A6hQ0_ksK0m1CBapqaXZWmV_zg@mail.gmail.com>
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24.06.2020 14:11, Rafael J. Wysocki wrote:
> On Wed, Jun 24, 2020 at 1:41 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>> /sys/kernel/debug/devices_deferred property contains list of deferred devices.
>> This list does not contain reason why the driver deferred probe, the patch
>> improves it.
>> The natural place to set the reason is probe_err function introduced recently,
>> ie. if probe_err will be called with -EPROBE_DEFER instead of printk the message
>> will be attached to deferred device and printed when user read devices_deferred
>> property.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> Reviewed-by: Mark Brown <broonie@kernel.org>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> ---
>>   drivers/base/base.h |  3 +++
>>   drivers/base/core.c | 10 ++++++----
>>   drivers/base/dd.c   | 21 ++++++++++++++++++++-
>>   3 files changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/base/base.h b/drivers/base/base.h
>> index 95c22c0f9036..93ef1c2f4c1f 100644
>> --- a/drivers/base/base.h
>> +++ b/drivers/base/base.h
>> @@ -93,6 +93,7 @@ struct device_private {
>>          struct klist_node knode_class;
>>          struct list_head deferred_probe;
>>          struct device_driver *async_driver;
>> +       char *deferred_probe_msg;
> What about calling this deferred_probe_reason?
>
>>          struct device *device;
>>          u8 dead:1;
>>   };
>> @@ -134,6 +135,8 @@ extern void device_release_driver_internal(struct device *dev,
>>   extern void driver_detach(struct device_driver *drv);
>>   extern int driver_probe_device(struct device_driver *drv, struct device *dev);
>>   extern void driver_deferred_probe_del(struct device *dev);
>> +extern void __deferred_probe_set_msg(const struct device *dev,
>> +                                    struct va_format *vaf);
> I'd call this device_set_deferred_probe_reson() to follow the naming
> convention for the function names in this header file.
>
>>   static inline int driver_match_device(struct device_driver *drv,
>>                                        struct device *dev)
>>   {
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> index ee9da66bff1b..2a96954d5460 100644
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
>> @@ -3962,6 +3962,8 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>>    *
>>    * This helper implements common pattern present in probe functions for error
>>    * checking: print message if the error is not -EPROBE_DEFER and propagate it.
>> + * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
>> + * later by reading devices_deferred debugfs attribute.
>>    * It replaces code sequence:
>>    *     if (err != -EPROBE_DEFER)
>>    *             dev_err(dev, ...);
>> @@ -3977,14 +3979,14 @@ int probe_err(const struct device *dev, int err, const char *fmt, ...)
>>          struct va_format vaf;
>>          va_list args;
>>
>> -       if (err == -EPROBE_DEFER)
>> -               return err;
>> -
>>          va_start(args, fmt);
>>          vaf.fmt = fmt;
>>          vaf.va = &args;
>>
>> -       dev_err(dev, "error %d: %pV", err, &vaf);
>> +       if (err == -EPROBE_DEFER)
>> +               __deferred_probe_set_msg(dev, &vaf);
>> +       else
>> +               dev_err(dev, "error %d: %pV", err, &vaf);
>>
>>          va_end(args);
>>
>> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
>> index 9a1d940342ac..f44d26454b6a 100644
>> --- a/drivers/base/dd.c
>> +++ b/drivers/base/dd.c
>> @@ -27,6 +27,7 @@
>>   #include <linux/async.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pinctrl/devinfo.h>
>> +#include <linux/slab.h>
>>
>>   #include "base.h"
>>   #include "power/power.h"
>> @@ -136,6 +137,8 @@ void driver_deferred_probe_del(struct device *dev)
>>          if (!list_empty(&dev->p->deferred_probe)) {
>>                  dev_dbg(dev, "Removed from deferred list\n");
>>                  list_del_init(&dev->p->deferred_probe);
>> +               kfree(dev->p->deferred_probe_msg);
>> +               dev->p->deferred_probe_msg = NULL;
>>          }
>>          mutex_unlock(&deferred_probe_mutex);
>>   }
>> @@ -211,6 +214,21 @@ void device_unblock_probing(void)
>>          driver_deferred_probe_trigger();
>>   }
>>
>> +/*
>> + * __deferred_probe_set_msg() - Set defer probe reason message for device
> I'd change this into a full kerneldoc comment.


OK I will apply all changes in next version. Thx for review.


Regards

Andrzej


>
>> + */
>> +void __deferred_probe_set_msg(const struct device *dev, struct va_format *vaf)
>> +{
>> +       const char *drv = dev_driver_string(dev);
>> +
>> +       mutex_lock(&deferred_probe_mutex);
>> +
>> +       kfree(dev->p->deferred_probe_msg);
>> +       dev->p->deferred_probe_msg = kasprintf(GFP_KERNEL, "%s: %pV", drv, vaf);
>> +
>> +       mutex_unlock(&deferred_probe_mutex);
>> +}
>> +
>>   /*
>>    * deferred_devs_show() - Show the devices in the deferred probe pending list.
>>    */
>> @@ -221,7 +239,8 @@ static int deferred_devs_show(struct seq_file *s, void *data)
>>          mutex_lock(&deferred_probe_mutex);
>>
>>          list_for_each_entry(curr, &deferred_probe_pending_list, deferred_probe)
>> -               seq_printf(s, "%s\n", dev_name(curr->device));
>> +               seq_printf(s, "%s\t%s", dev_name(curr->device),
>> +                          curr->device->p->deferred_probe_msg ?: "\n");
>>
>>          mutex_unlock(&deferred_probe_mutex);
>>
>> --
>> 2.17.1
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://protect2.fireeye.com/url?k=5adb7884-070fc5c0-5adaf3cb-0cc47a31381a-5588a624ab84213e&q=1&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
