Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083B207608
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 16:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD54B6E02F;
	Wed, 24 Jun 2020 14:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0B26E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 14:48:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200624144852euoutp01aa8e39aa1f302bbcc50181f5b0c0cad6~bgkabpa331970919709euoutp01K
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 14:48:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200624144852euoutp01aa8e39aa1f302bbcc50181f5b0c0cad6~bgkabpa331970919709euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593010133;
 bh=gk+6L9SyIjyjcohw+SFaR+eg2gYwWjkwejeyaRU+9mM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=mCLarGy9hX/cUaTj5yDJGDE9upepnO1/blRBaWPYlKZAx6AfiupQ+6H7ozS8Nhgn/
 2OO3Uzmg1bIcEAmH8jh9dVlI3vKWAIS0q8V0EgdaZGxyqOONTGif3GPU7i/sCscQRq
 DEWKy1S9qnw9BR5kLqyakp0mDHhoPR5I3b06Oz1c=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200624144852eucas1p264dbc40689d489f8a5af294b7eba9ffb~bgkaI1elI0982909829eucas1p2P;
 Wed, 24 Jun 2020 14:48:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 36.18.06318.4D763FE5; Wed, 24
 Jun 2020 15:48:52 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200624144852eucas1p14494d9e37b4dc8b9d5085420ac0ba59e~bgkZsIA7j1776317763eucas1p1s;
 Wed, 24 Jun 2020 14:48:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200624144852eusmtrp2b7afbbfe2e1ecc26ec0eaa3a9fbae2f2~bgkZrMBge1794317943eusmtrp2C;
 Wed, 24 Jun 2020 14:48:52 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-31-5ef367d48a78
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 30.D0.06314.4D763FE5; Wed, 24
 Jun 2020 15:48:52 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200624144850eusmtip25b030f29292dc7fabc30f2be376cd4f9~bgkYhCLFy0441504415eusmtip2Y;
 Wed, 24 Jun 2020 14:48:50 +0000 (GMT)
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <4d60e086-92a3-f692-e7b5-1c75e913709e@samsung.com>
Date: Wed, 24 Jun 2020 16:48:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624123008.GA1773782@kroah.com>
Content-Language: pl
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbVBMYRTHe7p3795eNteKzlTDtCZDg958uKjGS81cPmB8MBOKxbVMtTW7
 NjKjwpZCK2qHtlKpZJqazfZm89q2JKmkFxmyKhqlNKZSjKTbzejb75z/+T/nf2YeEhMPCZzJ
 4/ITrEIuDZcQtnjVs5/Na9plo6FehssSeiC1DtF3b+gFtLbnE0G3j48Q9Pl8PUF3TAxgdMNQ
 B04nXy0Q0oa+TgHdVpNF0CbtQ0SXmruFtEmzj84e02KbHJi2zlaMGelKEDJGXbeQyUzKEDCG
 4mSCeZ762pp5nF0iZCyX6q2Z8oI4RlNRjJgnKWk4M2pYust+r63fETb8eDSr8Aw4aHvsynQR
 HpXudmos8wMRj/qcLyIbEqh18O3BTewisiXF1B0E75704nwxhiCn1oz4YhRB0oda/J+l90W/
 kBeKEDw9OzA3NYLgUfL4jEKSi6jDYEzx4QyOlC9cadLNGjCqCgf9kBrjBIJaBVPlbwmORVQA
 vPmSJuC8OOUOFYNhXHsxFQKawty5kYXQkPEJ50ZsKG/4kR/LtTFqGVQPZ2E8O0JXr3o2DlBa
 EvLq+jE+dCBc7ehBPC+CwfoKIc+uMG3MseY5Dix31BhvTkJQWWacM2+E982/CG4xNpNZX+PJ
 IVCbwVi7nUcH6BpeyEdwgGtV1zG+LYKkRDH/hhtYmirn3nOCwlfjRCqS6ObdpZt3jG7eMbr/
 a3MRXoycWJUyQsYqfeXsybVKaYRSJZetPRwZYUAzf7DxT/34PfTo9yETokgksReVffweKhZI
 o5UxESYEJCZxFG1pagwVi45IY06zisgDClU4qzQhFxKXOIl8bw2EiCmZ9AQbxrJRrOKfak3a
 OMejhMdjS+z8s1Vlkx7nXNItVukrygN3rIw2D/oH9RHyRi87V/Pk55a8nobS3cvXG3aqC0vI
 vBQrTGzDWrZN+NQLGjXB1Ymu92HV6m2k3wJ3wVHVusJgK+ngg62JsValdW5v95+ZYiiNZ3Dr
 deJ2X8u+9RuG/JkLw6P6wO49X18GySW48pjU2wNTKKV/ARQ0c7h/AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42I5/e/4Pd0r6Z/jDO5sZLN4OeEwo8XGGetZ
 LaY+fMJmceXrezaL5sXr2Syufn/JbHHyzVUWi86JS9gtNj2+xmpxedccNotDU/cyWqw9cpfd
 4lBftMXcL1OZHfg8Ll+7yOzx/kYru8fOWXfZPWZ3zGT12LSqk83jxIRLTB77565h97jffZzJ
 Y/OSeo++LasYPQ70Tmbx+LxJLoAnSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbK
 yFRJ384mJTUnsyy1SN8uQS+j//9yloIpihVfZt9ja2B8LNXFyMkhIWAi8ejUM/YuRi4OIYGl
 jBLTti1kg0iIS+ye/5YZwhaW+HOtiw2i6C2jxJ6dS1m6GDk4hAWSJXb2GoHUiAgYS/SfnQU2
 iFlgF4vEun//oKY+YJS42fGbEaSKTUBT4u/mm2AbeAXsJK6/mMwKMohFQFViy6tskLCoQKzE
 t3tboEoEJU7OfAK2i1PAUOLb4jqQMLOAmcS8zQ+ZIWx5ie1v50DZIhI3HrUwTmAUmoWkexaS
 lllIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMPa3Hfu5eQfjpY3BhxgFOBiV
 eHg3PPgYJ8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjKZAr01klhJNzgem
 pbySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYzzjASObA6UvvWC
 f0dCio+zszK/Op/x7VzJr7HVOm5Ot29/Nd18VyOCvavdTezVu70qMlH/DZi1SgSczfYrqTl3
 5u5ZGxAcOr2F79vN5H01x/5wblH1jtpaw9Owv+WTxuIkRuNnr0LnntVwFBHh5shk+Xn3+u69
 Im8XLAwRVDxgtWDOWSUzcyWW4oxEQy3mouJEANVYAjMTAwAA
X-CMS-MailID: 20200624144852eucas1p14494d9e37b4dc8b9d5085420ac0ba59e
X-Msg-Generator: CA
X-RootMTR: 20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
 <20200624123008.GA1773782@kroah.com>
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
Cc: andy.shevchenko@gmail.com, Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24.06.2020 14:30, Greg Kroah-Hartman wrote:
> On Wed, Jun 24, 2020 at 01:41:25PM +0200, Andrzej Hajda wrote:
>> Many resource acquisition functions return error value encapsulated in
>> pointer instead of integer value. To simplify coding we can use macro
>> which will accept both types of error.
>> With this patch user can use:
>> 	probe_err(dev, ptr, ...)
>> instead of:
>> 	probe_err(dev, PTR_ERR(ptr), ...)
>> Without loosing old functionality:
>> 	probe_err(dev, err, ...)
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>   drivers/base/core.c    | 25 ++-----------------------
>>   include/linux/device.h | 25 ++++++++++++++++++++++++-
>>   2 files changed, 26 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> index 2a96954d5460..df283c62d9c0 100644
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
>> @@ -3953,28 +3953,7 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>>   
>>   #endif
>>   
>> -/**
>> - * probe_err - probe error check and log helper
>> - * @dev: the pointer to the struct device
>> - * @err: error value to test
>> - * @fmt: printf-style format string
>> - * @...: arguments as specified in the format string
>> - *
>> - * This helper implements common pattern present in probe functions for error
>> - * checking: print message if the error is not -EPROBE_DEFER and propagate it.
>> - * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
>> - * later by reading devices_deferred debugfs attribute.
>> - * It replaces code sequence:
>> - * 	if (err != -EPROBE_DEFER)
>> - * 		dev_err(dev, ...);
>> - * 	return err;
>> - * with
>> - * 	return probe_err(dev, err, ...);
>> - *
>> - * Returns @err.
>> - *
>> - */
>> -int probe_err(const struct device *dev, int err, const char *fmt, ...)
>> +int __probe_err(const struct device *dev, int err, const char *fmt, ...)
>>   {
>>   	struct va_format vaf;
>>   	va_list args;
>> @@ -3992,7 +3971,7 @@ int probe_err(const struct device *dev, int err, const char *fmt, ...)
>>   
>>   	return err;
>>   }
>> -EXPORT_SYMBOL_GPL(probe_err);
>> +EXPORT_SYMBOL_GPL(__probe_err);
>>   
>>   static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
>>   {
>> diff --git a/include/linux/device.h b/include/linux/device.h
>> index 40a90d9bf799..22d3c3d4f461 100644
>> --- a/include/linux/device.h
>> +++ b/include/linux/device.h
>> @@ -965,7 +965,30 @@ void device_links_supplier_sync_state_pause(void);
>>   void device_links_supplier_sync_state_resume(void);
>>   
>>   extern __printf(3, 4)
>> -int probe_err(const struct device *dev, int err, const char *fmt, ...);
>> +int __probe_err(const struct device *dev, int err, const char *fmt, ...);
>> +
>> +/**
>> + * probe_err - probe error check and log helper
>> + * @dev: the pointer to the struct device
>> + * @err: error value to test, can be integer or pointer type
>> + * @fmt: printf-style format string
>> + * @...: arguments as specified in the format string
>> + *
>> + * This helper implements common pattern present in probe functions for error
>> + * checking: print message if the error is not -EPROBE_DEFER and propagate it.
>> + * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
>> + * later by reading devices_deferred debugfs attribute.
>> + * It replaces code sequence:
>> + * 	if (err != -EPROBE_DEFER)
>> + * 		dev_err(dev, ...);
>> + * 	return err;
>> + * with
>> + * 	return probe_err(dev, err, ...);
>> + *
>> + * Returns @err.
>> + *
>> + */
>> +#define probe_err(dev, err, args...) __probe_err(dev, (long)(err), args)
> Shouldn't that be "unsigned long" instead of "long"?  That's what we put
> pointers in last I looked...

Unless we know this is error inside pointer, in such case we follow 
practice from PTR_ERR function.


Regards

Andrzej


>
> thanks,
>
> greg k-h
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://protect2.fireeye.com/url?k=75712e41-28bf2f92-7570a50e-000babff317b-a5a76e98e30aecc2&q=1&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
