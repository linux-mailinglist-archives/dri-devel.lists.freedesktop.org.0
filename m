Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD3AE1B90
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 15:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FF110E22B;
	Fri, 20 Jun 2025 13:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="WQCuEozH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E5110E22B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 13:09:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so306003866b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750424998; x=1751029798; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70ctTpSJsq+bQHgnXDWzVP4qaU3/3WUnYFhQbeURUT8=;
 b=WQCuEozHoFynPVS97rTHPzXpu92Lf6HGdw8+Isj+p4NrfMkmEB0yM27LzO9TbMqZxn
 iDTvjEgj+zZaU1HOfSpJkj4KtLjIBcpJoHEscM+gYk1hXlXBrzuB4DIbt2wuZdjjsDt6
 a3X7+W1A2GEeQBDbTLF1F3gd6KXZOBUuSru5l7cAYb9+jxYDi+5tauzAZ5H0uhuzy8kG
 L3TehLVz1siY42Ztx1ScJXkvAEMMQa6t1Q7i7rXRZxDW7uxlV692Y9cJGf/F4y6LfH6s
 rIXJxmhzKiNe7OJiqh/WXvwKFP6F5F320zJ0HxIGFQiDqO3ZjfePsDMO5bSBQoexA+dA
 87SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750424998; x=1751029798;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=70ctTpSJsq+bQHgnXDWzVP4qaU3/3WUnYFhQbeURUT8=;
 b=CsmqO6LbOBwUOTz8HLN/T/kH+pfYC6r+jPASIqhCCbKQ1PH8K8KR9Eou+FThzKxtJF
 s7TGvfj9Fza5odVPvQ6k06bEbv02WSfTodmCE5F+LTZjmShsrT3ZxTx8Vrd1FqvEGq3T
 dyYaD7+Ht201JoJGTn3F1dYgLSjFgUTPTLKrOOqAn1kOtgsQu5cSFm94VsuV9RGUFpuI
 yCk0plNBcXkTTB+xBWGXK+PMbE0oVxOk4w1KDpQYF9tBGxi1eFoZOxWCqWe+l/0jRHro
 iOXb5S+TRvqZCqZoHymkZdre6UqXB6k0asiKoSj+4/Yrd2UeAuyGw55ojzp9fxSuJpow
 OLiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHK7XjMjTRvuoC9X7MXAQ6OIR+j7PHclXrvG9B3nS8uXhZghUp49stcVuSMJKpd0mCdNZTEreW7rA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV+wlEmI4XVtXNqzJuCAIx8LyunRQos3hWXf4Ku3Y1lyjMWgg9
 8howi+ik8mCU+ZVNjh/MOLxiLL/2rOCBlnLsVnh69hSM0vufzUysSSbz3nAy7SbJ44o=
X-Gm-Gg: ASbGnctO1fV8Z68AO8uJEGaY+loxIQscwygroh2GJdZhK2vHyGGqgs7bDPmGEYLPOG+
 hLQiVl0Wa0SSAsj5DRp4gKbL2swFnJNrxXH8tG0mqBkRrlxSg9kWPDIoxymPVEOZpnnOCevvVnS
 UxZW6igJMdZSE+ecvQNvBDk/pRRSSVbWFC835K0e/ZehCOEjiDao7IpKwOUiWTVwntzaQuzT1tz
 RpV21FTzdHWDNzF2nusjo+hHLFcgala2VEN4X9CmfMBH0sQ50Cv5cb3GJZCvUQlTlT1cFrG6XEq
 QMRCZj1e4YLV1J4CRZ6q1s1ZqrFbuNviZcIo0gmwZNdYCVmyRnqR25gv8z0GgbUBDowyz1DmGxr
 JDpGqdFAcrzRAOd5RMxAR39lxk/F/qUk=
X-Google-Smtp-Source: AGHT+IHvlXLALS4AHiE4SoJGkmgQzjz8Tofgh17vREN5VuVWgpnSvyEfhznZhRgrJb/j59g9wyMOzg==
X-Received: by 2002:a17:907:6e9f:b0:ada:99ed:67a3 with SMTP id
 a640c23a62f3a-ae057ac2433mr265724666b.27.1750424998367; 
 Fri, 20 Jun 2025 06:09:58 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053e809f6sm159702466b.1.2025.06.20.06.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 06:09:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 15:09:57 +0200
Message-Id: <DARDVIP633UV.36218UJFJZJIY@fairphone.com>
Subject: Re: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Hans de Goede"
 <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>, "Helge Deller" <deller@gmx.de>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
 <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
 <cf29862b-496b-4825-aa0f-493eb44838a5@suse.de>
 <DARBA03BEQA1.3KLHCBFNTVXKJ@fairphone.com>
 <4475251a-ede7-42d1-a95e-497e09beba0d@suse.de>
 <DARCJEWMK6C2.21Y93IPCZO7NM@fairphone.com>
 <8874b905-dd1a-4bcc-9572-edcf5451f400@suse.de>
In-Reply-To: <8874b905-dd1a-4bcc-9572-edcf5451f400@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri Jun 20, 2025 at 2:36 PM CEST, Thomas Zimmermann wrote:
> Hi
>
> Am 20.06.25 um 14:07 schrieb Luca Weiss:
>> On Fri Jun 20, 2025 at 1:28 PM CEST, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 20.06.25 um 13:07 schrieb Luca Weiss:
>>>> Hi Thomas,
>>>>
>>>> On Fri Jun 20, 2025 at 1:02 PM CEST, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 20.06.25 um 12:31 schrieb Luca Weiss:
>>>>>> Some devices might require keeping an interconnect path alive so tha=
t
>>>>>> the framebuffer continues working. Add support for that by setting t=
he
>>>>>> bandwidth requirements appropriately for all provided interconnect
>>>>>> paths.
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>>     drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++=
++++++++++++++
>>>>>>     1 file changed, 83 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/si=
mplefb.c
>>>>>> index be95fcddce4c8ca794826b805cd7dad2985bd637..ca73e079fd13550ddc77=
9e84db80f7f9b743d074 100644
>>>>>> --- a/drivers/video/fbdev/simplefb.c
>>>>>> +++ b/drivers/video/fbdev/simplefb.c
>>>>>> @@ -27,6 +27,7 @@
>>>>>>     #include <linux/parser.h>
>>>>>>     #include <linux/pm_domain.h>
>>>>>>     #include <linux/regulator/consumer.h>
>>>>>> +#include <linux/interconnect.h>
>>>>> With alphabetical sorting:
>>>>>
>>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Thanks for the reviews!
>>>>
>>>> For both simpledrm.c and simplefb.c, the includes are not strictly
>>>> alphabetically sorted (1 mis-sort in simpledrm, 3 in simplefb), shall =
I
>>>> just try and slot it into the best fitting place, or make them sorted =
in
>>>> my patch? Or I can add a separate commit for each driver before to sor=
t
>>>> them.
>>>>
>>>> Let me know!
>>> Best is to try to fit it into the <linux/*> block. In simpledrm, it's
>>> probably my mistake. Don't bother with sending an extra cleanup if you
>>> don't want to.
>> I was mostly asking whether this diff is okay as part of my patch (for
>> just adding <linux/interconnect.h>)
>>
>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simple=
fb.c
>> index be95fcddce4c..f2efa4b51401 100644
>> --- a/drivers/video/fbdev/simplefb.c
>> +++ b/drivers/video/fbdev/simplefb.c
>> @@ -13,18 +13,19 @@
>>    */
>>  =20
>>   #include <linux/aperture.h>
>> +#include <linux/clk.h>
>>   #include <linux/errno.h>
>>   #include <linux/fb.h>
>> +#include <linux/interconnect.h>
>>   #include <linux/io.h>
>>   #include <linux/module.h>
>> -#include <linux/platform_data/simplefb.h>
>> -#include <linux/platform_device.h>
>> -#include <linux/clk.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>>   #include <linux/of_clk.h>
>>   #include <linux/of_platform.h>
>>   #include <linux/parser.h>
>> +#include <linux/platform_data/simplefb.h>
>> +#include <linux/platform_device.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/regulator/consumer.h>
>>  =20
>>
>> Or if you want this churn to be a separate commit. Either way is fine
>> with me, just trying to figure out the preferences of this subsystem :)
>
> If you want to resort the entries, please do so in a separate patch.

Ack, will do in v2!

Regards
Luca

>
> Best regards
> Thomas
>
>>
>> Regards
>> Luca
>>

