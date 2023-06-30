Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D3743A48
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 13:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475DB10E44D;
	Fri, 30 Jun 2023 11:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFEE10E44D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688123097; x=1688727897; i=deller@gmx.de;
 bh=JTAkm9zWSXYW3bYkAJ2/xf1xYzWy+u1+1FqR3OLzr7g=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GwI0k2Pmsws8bHhe8mwbBWIwpmvxSlY1zbJ0KjOoey92YhBTQK898xzm5poYGwLIgENVqGW
 o5Rqe5qCHDjxGknkQRtk4ZryM2iM4+FDLXVIdkDadBl8jAhrSrsI639Je/QbDWcFhaJ4gA0l6
 vkuw0jhbFV8SVNESpahtXih+nci6Qi+oIZObE/4GEaw2QqNXqS3tEinSeds784oRHOdINgLOu
 3OSFqnpnN4MX5sw+w7VVnqNpTcAAvpfZ5dTREpvLKryOLh0B1cmj9ZcxxHuEMFkzq6bxBhcRZ
 VEEe9ihNudEu8l+1TYXXkNwUHTJavgLRnc4Gjw6OUKRUWvAgkmWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.148.7]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfYm-1qLlVw3s9w-00B21a; Fri, 30
 Jun 2023 13:04:57 +0200
Message-ID: <46428dfc-af3f-7adf-54d7-44ece1589400@gmx.de>
Date: Fri, 30 Jun 2023 13:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] arch/sparc: Add module license and description for fbdev
 helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, davem@davemloft.net,
 arnd@arndb.de, linux@roeck-us.net, sam@ravnborg.org
References: <20230627145843.31794-1-tzimmermann@suse.de>
 <a290cf05-8f6b-3b88-32fc-66f6a173d5c4@gmx.de>
 <4673a16d-0ca1-5c3e-b3f3-f8da34482f65@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <4673a16d-0ca1-5c3e-b3f3-f8da34482f65@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GpDf/glZ/op2vHNLSVe2IzWbunuky48dacBsU/sgzs7NNgSSXiE
 zj0HWz1Fk86VPeOC9YD+geLBsP8MCo91cdLQpguYIJNmMxFkijexZV2ItSsQtmTrNWw+jaU
 x/vnxsOlM+MlHlgZkr7IG1ZQMSpXXSIuxHLE/A8Npsmnie5aNWajnIE7Y3GCrNA1iFaxeqn
 G9ZLq0fKeHFAO5R7GUv9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Hy9U4Px+sQk=;ne892Uf0ugpNRmk7bdCLgiWfJP2
 mGHenELoP4pa4wKxSsZFFbKWPUCgrfaY82PB/WMASZ9YwnGlGtPHnLktj+PSG/un0nkF9R6VM
 SNxMlzsJtnmtIth5fBm7VnX6ugxb5ipP293koxakiAAMjvBX6snWyAgouJXw1Tt96Jnbasxqz
 ttKnVvMZsExweqRPtqLLgXbwAMp0N4/EcIxxun8o0M9HMhjdH0nWn7mW/vrEXbzWlHtkCz5er
 HoBTH8eC6676hqRKVbByCLz6xHFJvJ8TvsMdEpCYyiDVz3zduc0r/Rydreb6FYqitJzls4p5m
 o174kjeiPbFM6AQFI8ai5L0djg5aIMsLf2ZujejdAMmYDyCusyI9uizviD0m1gfY0GXX6ZRO4
 iah5N5Zf/+t3xveVwCv+BhpWltu0Sq4FHHNPUrg6dmrTX1Mou/VKZuwbGU4m+SYoGOkN/r8mW
 2v7ijIfR2WURetB4FdSuiWmoMQXt6GZGBO7QtOxgXs/a90FGJxO9uy+7XEyBZ6JX30ihhGVvd
 N2imHY4DE4F5EnWmDnG2iLmnXLWlZ0cCJqRUfDQ1RPAjlQ8Wt/PCYIjWT2aQENV3wEpwIMc+z
 ljjC7OVMQEvY4P+Ok1Pf96bmsGWIhmKj0/Ur06bR2Y9wxb8Kal7dtcf8bjYNEdHCd2EQMki6N
 x7/eJcf/YC4KNpRD6sVhMC/xjguVXCwWpWzsf1SH9EjBmoqaoPwc4F8VBgf05ZBcdCGPepMhb
 ZODTuHHCn+kkEprNkaSEeIEbiismSRhNJJsPhXnJjmIETGuR0tjtBi78O/bJJraCSgZVYitoS
 FWh+yHXV4lva7Jr7hN7mlPVQ22fFbNwyxgI1MFZeU9qIKwKLAMqUZlgeYN//QCcYmwUKwvlhG
 RdrOMicij2zxupigQzcKsVgwGmFvF6ovEqWzLGrPH9rIRYhspQI2jLDP3ydDz1Lxkt15oCgsd
 xGynig==
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
Cc: sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/23 12:58, Thomas Zimmermann wrote:
> Hi Helge
>
> Am 30.06.23 um 11:43 schrieb Helge Deller:
>> On 6/27/23 16:58, Thomas Zimmermann wrote:
>>> Add MODULE_LICENSE() and MODULE_DESCRIPTION() for fbdev helpers
>>> on sparc. Fixes the following error:
>>>
>>> ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o
>>>
>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>> Closes: https://lore.kernel.org/dri-devel/c525adc9-6623-4660-8718-e0c9=
311563b8@roeck-us.net/
>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>> Fixes: 4eec0b3048fc ("arch/sparc: Implement fb_is_primary_device() in =
source file")
>>> Cc: "David S. Miller" <davem@davemloft.net>
>>> Cc: Helge Deller <deller@gmx.de>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: sparclinux@vger.kernel.org
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>> =C2=A0 arch/sparc/video/fbdev.c | 3 +++
>>> =C2=A0 1 file changed, 3 insertions(+)
>>
>> I've queued it up in the fbdev git tree but will drop it anytime
>> if someone prefers to take this patch through another tree....
>
> It's in drm-misc-next-fixes already.

Ok, I'll drop it.
Thanks!
Helge

> Best regards
> Thomas
>
>>
>> Thanks!
>> Helge
>>
>>
>>>
>>> diff --git a/arch/sparc/video/fbdev.c b/arch/sparc/video/fbdev.c
>>> index 25837f128132d..bff66dd1909a4 100644
>>> --- a/arch/sparc/video/fbdev.c
>>> +++ b/arch/sparc/video/fbdev.c
>>> @@ -21,3 +21,6 @@ int fb_is_primary_device(struct fb_info *info)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> =C2=A0 EXPORT_SYMBOL(fb_is_primary_device);
>>> +
>>> +MODULE_DESCRIPTION("Sparc fbdev helpers");
>>> +MODULE_LICENSE("GPL");
>>
>

