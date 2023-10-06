Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959597BB665
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 13:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAB910E0CA;
	Fri,  6 Oct 2023 11:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Fri, 06 Oct 2023 11:26:22 UTC
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDB410E0CA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1696591567;
 bh=oWIxnG2J+Jy/dMyxMYG3xUlceaQ+HsSfWnd1NKXS+fw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=qDQ5//3QD4yPpoaHg4ykXbwyg6+EI0xuxL7f2p64sQTR8pCr9vWyn1Zr1ganNMO4J
 J6p7FGDHSqtlXnsDEe5aeA0JHtLILvh+983+V/ihipLgZ8+RebvOruV2oZu7EtewfK
 qmFWXFiWMRtP5kK/Bi0hMtmgszM6+qlNy6ma0BkY=
Received: from [10.255.201.129] ([122.14.229.79])
 by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
 id 4D906841; Fri, 06 Oct 2023 19:19:25 +0800
X-QQ-mid: xmsmtpt1696591165t6inxp8yd
Message-ID: <tencent_B2B6C2C0E43CB415F6506B24B66ED26BB909@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznDRsIcsNQ+c8SApwT/aeO2z0Gmtae0OnHojt/PWMwiJrUAFbnj0
 mA/lVdwN2n9K9h/e2nieBg1QjnDXgN4YREP5/+MvhYFqWV34B/vkPYWtOu1CzyMwqPpcccIKDWzl
 E5CTqO5GkYvpTfpCjjfkz+aGNsDmPOR19PrOD0lHp/lY7VlF5Sox6YL2GKMiBeNAM814qLeOUQdi
 UHRi2T8Qf7e/1Bvz9NFACZfI2sWST6jjPeDZi0V+mAqUQ2qupLph6Wi2ntFys21xVdTgS+RB6pQd
 bmutlMiYuI9ZR1BwCRj8zO3ojbZ3/8AQxvqLiiEvs0DjQDRrgE7sPY0LF6m4uKOiw0DeOhpaVb4U
 EM10JFzHcf1Y0vdNBI5ytzajDptk3hq2kddK34Tw2+guWVglnN69O8NidJhOfO9Ge9zhh1Jbz1Nk
 Axqdp0rQWdXlMfQKB6jxrhJeErNhSf5MUSC5o/NW9tIe5XokSGBL6MRPgB6apq01IfHU8Q1G1GuP
 Ic+uoDQXLk8K1uOuXge9dIG4/XAaCpCzjj+bAkmVZgN9cbOYCAZR3N8kgGRwRaeCNVr2CvtRCDAg
 gj89CtUYENULRkbBmeuz7iraUgPd7D1V6kXBYFB7GkQtghEIKi/mXz3qVG8aQs4XYE2fcuTW1b1d
 fAbEdmmRWp3EhKnHOaJj58gH7l2lSqVCPWIdqEXNhI7gZfS/HkXP0JBQOMoBed4+ZqteDUL18eZc
 ES2C1M2F1ieky+JVDetTawztUg/lFmbrVdkH+fkPoLmyx3/cyeCQUrNbw0SLs6kqMeMDJcbwENFi
 jsiYzJCdUXAn5pPgmhpuFiNpVHOwe+EYXV1YrCu2clJbKzdHZNkTMteZBD03+jHlwyE9RxMijIrn
 XBtUcZhnq0utcurPsjeGR1qZb3Eu635NTECXgkOGNVwK9+lPX+i9VaUo6KilSPeDsFcPJTYEXMiM
 ek8zx5jSGSWxpp9XDxdrMm6EoKMmoqFX1CbD2BNlpe3KfwOVMlLo2CRDgsgtHvP2sFLJT+3Q3BW7
 Gn1QY8GJhGmyISynz4
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-OQ-MSGID: <2fc26726-9db8-466c-9760-ce2fc57e3338@foxmail.com>
Date: Fri, 6 Oct 2023 19:19:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: arkfb: fix possible object reference leak
Content-Language: en-US
To: Helge Deller <deller@gmx.de>
References: <tencent_55C1A344A101B55762ECA6A6366D0B0F8C05@qq.com>
 <b9e51034-bc6c-81d8-39ef-9fc74fa09c62@gmx.de>
From: Zhang Shurong <zhang_shurong@foxmail.com>
In-Reply-To: <b9e51034-bc6c-81d8-39ef-9fc74fa09c62@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: jiapeng.chong@linux.alibaba.com, linux-fbdev@vger.kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the graphic card in question is quite old, I haven't had the 
opportunity
to personally test it yet.

I decided to send the patch because, upon careful consideration,
I couldn't find any compelling reasons not to include the call to
pci_disable_device(). However, I completely understand your point,
and I agree that if there is no definitive explanation for why
it should be ignored, it would be prudent to locate the actual hardware
and conduct proper testing.

I genuinely appreciate your thorough review and valuable feedback on
this matter. Maybe I will find this old card and test this patch.


Thank you and best regards,

Shurong

On 2023/10/6 16:09, Helge Deller wrote:
> On 10/5/23 09:01, Zhang Shurong wrote:
>> Add missing pci_disable_device() in error path in ark_pci_probe().
>
> Do you have this hardware and tested your patch?
> I'm sure there is a reason, why "pci_disable_device()" was commented
> out in the original submission in commit 681e14730c73c...
>
> Additionally I'm wondering why your patch doesn't show up in
> the fbdev patchwork, although you added linux-fbdev mailing list.
> Probably a vger issue.
>
> Helge
>
>
>> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
>> ---
>>   drivers/video/fbdev/arkfb.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
>> index 60a96fdb5dd8..6c4e5065646f 100644
>> --- a/drivers/video/fbdev/arkfb.c
>> +++ b/drivers/video/fbdev/arkfb.c
>> @@ -1064,7 +1064,7 @@ static int ark_pci_probe(struct pci_dev *dev, 
>> const struct pci_device_id *id)
>>   err_dac:
>>       pci_release_regions(dev);
>>   err_request_regions:
>> -/*    pci_disable_device(dev); */
>> +    pci_disable_device(dev);
>>   err_enable_device:
>>       framebuffer_release(info);
>>       return rc;
>> @@ -1085,7 +1085,7 @@ static void ark_pci_remove(struct pci_dev *dev)
>>
>>           pci_iounmap(dev, info->screen_base);
>>           pci_release_regions(dev);
>> -/*        pci_disable_device(dev); */
>> +        pci_disable_device(dev);
>>
>>           framebuffer_release(info);
>>       }
>


