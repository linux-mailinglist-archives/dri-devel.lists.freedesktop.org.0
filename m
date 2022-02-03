Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E14A8035
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2526910E716;
	Thu,  3 Feb 2022 08:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B76B10E716
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643876317;
 bh=8QRoItm8omsMVdEaP3c/pODPywpQ2eOKleZqsOez2Vo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=cu/v/Ma7spwnj+wH7C8sz1lPDUjR2lipbEswfkuDZG2vMF5IuDBl2NgtBkAY994OD
 /UKBtAj4hP+cx84vSgQ/9U7LVuWXl4dp67bf99/C/zAswSz4SVDZFOqKftmik/tNyk
 z9KaBrzmBTZQ1uoosyMr4pQ2mt/Sz1WHQbAsw8ew=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.128.137]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1mdRLj32N8-00c80p; Thu, 03
 Feb 2022 09:18:37 +0100
Message-ID: <d323261d-b123-27e5-b629-559ca892163d@gmx.de>
Date: Thu, 3 Feb 2022 09:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6] fbdev: fbmem: Fix the implicit type casting
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Yizhuo Zhai <yzhai003@ucr.edu>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <f3b28143-5f59-ad77-f2b8-6274a6edbfdc@roeck-us.net>
 <20220202235811.1621017-1-yzhai003@ucr.edu> <Yft4qf3Hw7ntxc98@ravnborg.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <Yft4qf3Hw7ntxc98@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bvXI+KtYNuoWC5NwXxyZCtdEipYA2eZZ70kwjxYtUwIXa6YSPlw
 jmqCPkmKkKIf9wCJyPONgzy8nMk6WWQYsEJ0L/ruLrlYf+K6P/4/htUX7Yv8SgyY56MXJHP
 9RpY+ds4r6TIZPijag+ROIb7FR/y++csUlbSRkgK5lPX5AFGFxQk+75i5EKHUvFryIIUVIu
 xq7rcePYya+YVR9D+5iJQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y9NmY3jX87o=:i9tMbCsrG4C0ba3HptrnWR
 UpS3Hq9caJN1q7XfZfgNikjP0I7UY43QXbb1a3eE42QehKYHyKrAqzNFqPiI7IR63ln+dhZ/r
 NLk5ndR4XKc5vSYt/am66WP9VgWQBV5wySdH8j0wc5m9z2H6V6kEEey7vAJijkYtZ2mM9Fq4B
 tk74k/flB6dqQu75VVCzhONiX5/sJOZFPz0qsCCD9p/KN2YtTRstRW3J0Ne70s0MNwxPs1QAB
 EXL8gvfeRrgbhPg1/q63jUr8OQr791rF07tZfGn9ySZKaW2/jtWOCmNTpaZeIjPm0R4WB3DMV
 H2l9Asg9aOtsxGDsjtGYY5/chH4LGkFx9wyfgdpovOj1Yd/rkdGiXZ/hhvaiLKz5LFtOOmmmG
 u0Z70BaOYD/0nWWcSS7PVobPslR5QJNPClQVGmznrO2fakW612jr2b4k2yGPvP2xhz7UHLTiJ
 pqkuxfm/XiYpWL4UDZgk3RT3bLRyv5gOboe2m10oYBlhk3FmhoCmVZ+ENrmBWY1Sdc/q5Prmy
 c1eyO0xhNBdCavhy7D7s9F3/jOLdKJt0KEVM7u3hutlxV65agB6aPgLt+l7MoPvrTFcREGZUq
 4vF/8GOuBu1ujuxk2Lo14C1z/F8DvqgaeViQiqI3w30PbUpTqfFhM48K7YqJ4PeOpOeR1DUNa
 0KCmtKcuYrqo1U7kW2kWtP9uAtZo7CjzYLzVjQwxSzzpO93UhZCIMM3YHwTt4oeM88tQxz/AS
 uhYm9tTZsw8rc21enWQ0FvEZ8Uv1NvoBnd8IHZps7NIB2wWsD3vtRQ3OJnBNYjrwD797dDA41
 wQKuOJNp4M7pQUhw6r3DcQlpKI4VGv+bORVpqHmhkLKp+rAeNk/i1zYP8jTItfNyZfCBIeBcR
 Dr+Ta8UMYL2bhhfvjWOqPW8Pil3nWoLymaE/mYbhcNzJqyKTj5SwSRKRklIILfTOX7t9Kw4RZ
 IW+BfdCQLssDlcSOhsQVnVGqH3hXBehs9ZfnbeNlUt0IQmZ0kvAVH9W/Ayi5IpgRU57COw7Jf
 5thPrXV2rG7crDFuaVBLIBaz5Cu4xmCgB8OcWMH3bz7yLn+Rndw6zAwln///+iZy1Lc35RHSk
 g8hfb7mHD8crdQ=
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Zheyu Ma <zheyuma97@gmail.com>, linux-fbdev@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/3/22 07:39, Sam Ravnborg wrote:
> Hi Daniel,
>
> I assume you will take this.
>
> Patch is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


Acked-by: Helge Deller <deller@gmx.de>

Helge

>
> 	Sam
>
> On Wed, Feb 02, 2022 at 03:58:08PM -0800, Yizhuo Zhai wrote:
>> In function do_fb_ioctl(), the "arg" is the type of unsigned long,
>> and in "case FBIOBLANK:" this argument is casted into an int before
>> passig to fb_blank(). In fb_blank(), the comparision
>> if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
>> "arg" is a large number, which is possible because it comes from
>> the user input. Fix this by adding the check before the function
>> call.
>>
>> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
>> ---
>>  drivers/video/fbdev/core/fbmem.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/cor=
e/fbmem.c
>> index 0fa7ede94fa6..13083ad8d751 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1160,6 +1160,8 @@ static long do_fb_ioctl(struct fb_info *info, uns=
igned int cmd,
>>  		ret =3D fbcon_set_con2fb_map_ioctl(argp);
>>  		break;
>>  	case FBIOBLANK:
>> +		if (arg > FB_BLANK_POWERDOWN)
>> +			return -EINVAL;
>>  		console_lock();
>>  		lock_fb_info(info);
>>  		ret =3D fb_blank(info, arg);
>> --
>> 2.25.1

