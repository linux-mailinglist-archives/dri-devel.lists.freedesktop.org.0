Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9FC163ED1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E5B6EB19;
	Wed, 19 Feb 2020 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E68A6EA5B;
 Tue, 18 Feb 2020 18:03:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t3so25076441wru.7;
 Tue, 18 Feb 2020 10:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=V/tjhq7oBEyOycP7UZixOMOtUlTvd2hXQJK9Eop241Y=;
 b=DDyhwFE4de9F78yd1ZPlzxTgEeAp+R7qKvINaKsqzab98Bhiw1IzW4Hfout+GyH9wq
 VZEEok99wm14lIHZhVAgOZH3rllXIPqsBBMCW7QWxNu52fR/JbtbSv7nHTjI3AaVf4Hi
 D5kPt135GHHHZ8IYDfwPDA0i5vcVCGzV8X0505FxninFfNbdeiyAkOLhpPT0t70ivMvu
 O2KZCH7OQ2dOk2Ksb9DRkb8eoi0rjSp4EybIAi1INXt/r0fT91iKohal+LAqa2l87UA6
 gBZQLnMEcG+EA92Fcrqk2u+o0jEXSRK6NAKRw96ej9lVzlQnm1qnlgqwhkxLvGZlZinK
 qzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=V/tjhq7oBEyOycP7UZixOMOtUlTvd2hXQJK9Eop241Y=;
 b=mEQARp25vP9UBF4H1Iw+3rhmnbpFlWFY41QeYnplRzx/u0cGnMLu+bLI2hEl7BTMxU
 zOrCzpQSDHsmJBRGKIQ44lbSy+D+anvkQRRIvG08sW0leh0isrwe1jEBtjuCd8x1ODUz
 bQdsV+AP6d0psGoduR0tvBwBA66BIZCn5TSfcbsn1bB0deYN/RU4IowV2iNOs12ypZfj
 1zsOpskbOs5r3KSs3LJNoqqcQvbWANHjrAvt0LXowzB2r6vDFf4RcrMIx+koiEWp3PDA
 2gUxqIB52KqkAZbhKZXwT5wOkbDDhQzuwDoT0r/RKVvTbvIH7BDhBcRBBnqphRmxx17c
 GjVA==
X-Gm-Message-State: APjAAAWYQJMQ3NZr0SWwut55cnh0foHMkqqeYmUe9m0ZSGU8RZZgg8/q
 rV0shWRYbsFDxe3oUfwz2xI=
X-Google-Smtp-Source: APXvYqzuZqIlzAcXP+ZKKIIA3TCwv6a2IseAjKCamN6X7gGt4vqM+Z/JqeNkVqO66rFMw8/UajOi/A==
X-Received: by 2002:a5d:61d1:: with SMTP id q17mr31130089wrv.156.1582048989986; 
 Tue, 18 Feb 2020 10:03:09 -0800 (PST)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id o2sm4309335wmh.46.2020.02.18.10.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 10:03:08 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Tue, 18 Feb 2020 21:02:56 +0300 (EAT)
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: remove check for return value of drm_debugfs
 function
In-Reply-To: <71275b167f41ca424216c2bda0459bf305a1162c.camel@pengutronix.de>
Message-ID: <alpine.LNX.2.21.99999.375.2002182102230.20178@wambui>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <20200218172821.18378-4-wambui.karugax@gmail.com>
 <71275b167f41ca424216c2bda0459bf305a1162c.camel@pengutronix.de>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux+etnaviv@armlinux.org.uk, Wambui Karuga <wambui.karugax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Tue, 18 Feb 2020, Lucas Stach wrote:

> On Di, 2020-02-18 at 20:28 +0300, Wambui Karuga wrote:
>> As there is no need to check the return value if
>> drm_debugfs_create_files,
>
> And here is where the commit message skips a very important
> information: Since 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail) this function never returns
> anything other than 0, so there is no point in checking. This
> information should be in the commit message, so the reviewer doesn't
> need to look up this fact in the git history.
>
Okay, I can add that to the commit message and resend.
Thanks.

> Regards,
> Lucas
>
>>  remove the check and error handling in
>> etnaviv_debugfs_init and have the function return 0 directly.
>>
>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>> ---
>>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 16 ++++------------
>>  1 file changed, 4 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> index 6b43c1c94e8f..a65d30a48a9d 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> @@ -233,19 +233,11 @@ static struct drm_info_list
>> etnaviv_debugfs_list[] = {
>>
>>  static int etnaviv_debugfs_init(struct drm_minor *minor)
>>  {
>> -	struct drm_device *dev = minor->dev;
>> -	int ret;
>> -
>> -	ret = drm_debugfs_create_files(etnaviv_debugfs_list,
>> -			ARRAY_SIZE(etnaviv_debugfs_list),
>> -			minor->debugfs_root, minor);
>> +	drm_debugfs_create_files(etnaviv_debugfs_list,
>> +				 ARRAY_SIZE(etnaviv_debugfs_list),
>> +				 minor->debugfs_root, minor);
>>
>> -	if (ret) {
>> -		dev_err(dev->dev, "could not install
>> etnaviv_debugfs_list\n");
>> -		return ret;
>> -	}
>> -
>> -	return ret;
>> +	return 0;
>>  }
>>  #endif
>>
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
