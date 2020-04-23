Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87441B5F19
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 17:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFD26E8CE;
	Thu, 23 Apr 2020 15:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328F96E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:25:53 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200423152551euoutp02eeefc26c98766c2b013be276f1dd2b7a~IfE-0rfpO1646316463euoutp02c
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:25:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200423152551euoutp02eeefc26c98766c2b013be276f1dd2b7a~IfE-0rfpO1646316463euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587655551;
 bh=4CcgJX+hMyyt8NIG6umkE7GDivLV5CaWJh6tXmz7IAM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=t3BwxSwoSx1mkbPrk0RXM78rPZZyYc2pjOa9WI3m4l9z2woCViVmUq4HYLoK+Q5Mc
 mYi2UvWn+SGK7fxJXuYnhBWQXKkFmiDereAZrC5JLtw0BwssO7kkWg2JT+i85xxtU2
 SjCHIxhy4Mxv5lJKi/6ySubMCB4wykN25gVSAHiI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200423152551eucas1p1f74c81ba9a55483c9b2b6707c5dae3c2~IfE-mfEiU0758907589eucas1p16;
 Thu, 23 Apr 2020 15:25:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BB.4E.60698.F73B1AE5; Thu, 23
 Apr 2020 16:25:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200423152550eucas1p1c7555e091e310f29f5d99bec04a90107~IfE_2qBz60759507595eucas1p1M;
 Thu, 23 Apr 2020 15:25:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200423152550eusmtrp19943a6fb8b63ad410d060f79349dc093~IfE_1_-cT3134831348eusmtrp1j;
 Thu, 23 Apr 2020 15:25:50 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-3f-5ea1b37f359b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9C.FB.07950.E73B1AE5; Thu, 23
 Apr 2020 16:25:50 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200423152549eusmtip1a56fe5afbd52660c5da01981adefc06e~IfE_WE6Wq1007910079eusmtip1b;
 Thu, 23 Apr 2020 15:25:49 +0000 (GMT)
Subject: Re: [PATCH v2] console: console: Complete exception handling in
 newport_probe()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <051e7dee-d64c-c54c-6bdd-6e60444c0a26@samsung.com>
Date: Thu, 23 Apr 2020 17:25:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd8kC6ub-=pwe3QtdZ=FBqka3F1bbHea6__G5_Vm_ybcQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGKsWRmVeSWpSXmKPExsWy7djPc7r1mxfGGTx7zWvxcsJhRosrX9+z
 WXTOvMZo0bx4PZvFib4PrBaXd81hs7i0R8Vi86apzBaHmw4yW+x6dJPZgcuj9dJyFo+ds+6y
 e3z4GOfx7tw5do+jK9cyeeyfu4bd4373cSaPz5vkAjiiuGxSUnMyy1KL9O0SuDL27tzEVrCb
 t2Lm3JlMDYztXF2MnBwSAiYSy37OZ+pi5OIQEljBKNHb9YMZwvnCKHHwwTko5zOjxIt7C1lg
 Wlb0d7BDJJYzSnzcsZkNwnnLKNH85AbQMA4OYYEoiY/HOLsY2TlEBPQl9peBVDAL/GaSWP//
 AyvIHDYBK4mJ7asYQWxeATuJTUfXgdksAqoSz17+ZgKxRQUiJD49OMwKUSMocXLmE7AbOAUC
 JY7tuMoGYjMLiEvcejKfCcKWl9j+dg7Y0RICt9glrn6GOdpFYuuH1ewQtrDEq+NboGwZidOT
 e1ggGtYxSvzteAHVvZ1RYvnkf2wQVdYSd879YgN5jFlAU2L9Ln2IsKPEh11LwMISAnwSN94K
 QhzBJzFp23RmiDCvREebEES1msSGZRvYYNZ27VzJPIFRaRaS12YheWcWkndmIexdwMiyilE8
 tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzB1nf53/OsOxn1/kg4xCnAwKvHwGpQujBNiTSwr
 rsw9xCjBwawkwrvh4bw4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqemFqQW
 wWSZODilGhgDWH7/cJ8fbLr6l+3URwl7JjyZ1ryqXvjLOe9M2UPy05+fYnS+XxN9o6em3zhy
 67OZRwt8NkyTunM543P/0m3hb7afFrj+lvtCpRtf+DW+Yq8/z891fnaeG/K/KFIhiaWKhXX7
 3K19InlT2c9t1zvPUJI+w8Rru43x/fqDE4/ZPyvljfh2UHmpEktxRqKhFnNRcSIAU2FTDlkD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsVy+t/xu7p1mxfGGdw/K2HxcsJhRosrX9+z
 WXTOvMZo0bx4PZvFib4PrBaXd81hs7i0R8Vi86apzBaHmw4yW+x6dJPZgcuj9dJyFo+ds+6y
 e3z4GOfx7tw5do+jK9cyeeyfu4bd4373cSaPz5vkAjii9GyK8ktLUhUy8otLbJWiDS2M9Awt
 LfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DL27tzEVrCbt2Lm3JlMDYztXF2MnBwSAiYS
 K/o72LsYuTiEBJYyStz/PY21i5EDKCEjcXx9GUSNsMSfa11sILaQwGtGiX0L+EBKhAWiJD4e
 4+xiZOcQEdCX2A9WzCzwl0niyIpciOJOJok5mx1AbDYBK4mJ7asYQWxeATuJTUfXgdksAqoS
 z17+ZgKxRQUiJA7vmAVVIyhxcuYTFhCbUyBQ4tiOq2wQ89Ul/sy7xAxhi0vcejKfCcKWl9j+
 dg7zBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECY3TbsZ9b
 djB2vQs+xCjAwajEw2tQujBOiDWxrLgy9xCjBAezkgjvhofz4oR4UxIrq1KL8uOLSnNSiw8x
 mgI9N5FZSjQ5H5g+8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
 MC6TW5unNUtuUWiY5RZLpdYemYIzmspZHVNn/o17PyPv/I+wxVd9p57ZFjvpwnH/bsGZInsZ
 Tlu49D6eb9fCXc0Y2HSDz9Qz/r7+/80hb+QddOYpZZZmHDAzncj7Upuh2n1FeOPeF048PYnN
 CROOc5kxujrbFfOkP7mhNCFyfvvTxznB4p1HlViKMxINtZiLihMBYdIREucCAAA=
X-CMS-MailID: 20200423152550eucas1p1c7555e091e310f29f5d99bec04a90107
X-Msg-Generator: CA
X-RootMTR: 20200423142637eucas1p2ea543e281d96c75aa4292b49756f2146
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200423142637eucas1p2ea543e281d96c75aa4292b49756f2146
References: <CGME20200423142637eucas1p2ea543e281d96c75aa4292b49756f2146@eucas1p2.samsung.com>
 <20200423142627.1820-1-zhengdejin5@gmail.com>
 <081f8192-1708-80ff-6eef-885d72bdf5c5@samsung.com>
 <CAHp75Vd8kC6ub-=pwe3QtdZ=FBqka3F1bbHea6__G5_Vm_ybcQ@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, FlorianSchandinat@gmx.de,
 Dejin Zheng <zhengdejin5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/23/20 5:05 PM, Andy Shevchenko wrote:
> On Thu, Apr 23, 2020 at 5:55 PM Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
> 
>>> +     if (err)
>>> +             iounmap((void *)npregs);
>>
>> Looks OK but while you are at it, could you please also add missing
>> release_mem_region() on error and on device removal:
>>
>>         newport_addr = dev->resource.start + 0xF0000;
>>         if (!request_mem_region(newport_addr, 0x10000, "Newport"))
>>                 return -ENODEV;
>>
>>         npregs = (struct newport_regs *)/* ioremap cannot fail */
>>                 ioremap(newport_addr, sizeof(struct newport_regs));
>>         console_lock();
>>         err = do_take_over_console(&newport_con, 0, MAX_NR_CONSOLES - 1, 1);
>>         console_unlock();
>>         return err;
>> }
>>
>> static void newport_remove(struct gio_device *dev)
>> {
>>         give_up_console(&newport_con);
>>         iounmap((void *)npregs);
>> }
>>
>> ?
> 
> Don't you think that proper solution is rather switch to memremap()?

Doesn't seem to be a case here (used memory region in uncached).

On MIPS (this is MIPS-only driver):

...
#define ioremap(offset, size)						\
	__ioremap_mode((offset), (size), _CACHE_UNCACHED)
#define ioremap_uc		ioremap
...

While memremap() is only for cacheable memory:

...
 * memremap() - remap an iomem_resource as cacheable memory
 * @offset: iomem resource start address
 * @size: size of remap
 * @flags: any of MEMREMAP_WB, MEMREMAP_WT, MEMREMAP_WC,
 *		  MEMREMAP_ENC, MEMREMAP_DEC
...


>>>       return err;
>>>  }
> 
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
