Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8B1767CA3
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 08:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD2310E0BA;
	Sat, 29 Jul 2023 06:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F6D10E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 06:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690613477; x=1691218277; i=deller@gmx.de;
 bh=vGuAkdYCsbJWoTKH20FssiEcqVAS81m1HqBiVTZfsDQ=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=T/4T0165j/rUzJOyu/CVaICXWkvphQzSV9N2zWzVcY0mXEq8Ogb4aITruzyLw4F7Qo5pPy0
 ybW+RHv54yJwJ0otkPfnue5akbET2vrpBrCOxuNSK3gfpvcsvCOCRBi6dNtSqEn5qAZFcR8yo
 FX5/jz5R0ZBQ0nOrGR95Ao3Fl+DWc/kjnSR5d7S4WwAE0YlE+eCBIAL/MrKsIByU+OkPerGH4
 xy9pSXXcEsVPmjXuwBPTEH+mvAR4kitPhTaX9NwGJydoTEc3j2KOOc+9DXNNtxo/TOhTcvaYo
 oR007SD0p4aH7vP8RicIWbTuKUkOga3vxp7wG9YXbaVf2BSOu7NA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.147.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Gj-1qUqb00Iz5-005LED; Sat, 29
 Jul 2023 08:51:17 +0200
Message-ID: <78da21f8-7d00-797e-363a-736ee53b2eb6@gmx.de>
Date: Sat, 29 Jul 2023 08:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <c1a4b7c9-50f2-c43f-277d-c2af9ccc0b50@gmx.de>
 <20230728210127.GA1156027@ravnborg.org>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
In-Reply-To: <20230728210127.GA1156027@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fmw9QQ8ArfBeIYoF6/TpEVzoma+xkmASjOG3etSNNCR/kTSWB+0
 2Zz+L9Wa5ta7+gBOa0bDm2jIKKaVHbZo2AxaLYka6SvR07z2r8u6+mFa7MJT59VNr5yTP1d
 xENDgoFt9JFvIKQxGeQXUg2RG7pjngjmKgcv59hphwEZxuI16IJ6CUl/LKFkOwzrqBqwHm4
 DqiLJt2XiS5CFZURp3C+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DSWmJYReKQ4=;E9WydwnCCcxSFwZk/v9aromemUb
 RvY6yitIf02ATUsA1bfGcfdMVuzH2Tp7RFEKYnutOh4/yL4JKjBRLis/sdtW+heuRf27eScUc
 D1z/Z1kBcEQrtNFgs0PY7ZdxYpaAvIm8AiizRrTiLXdt+m8is3kPR1c5fXNcfA3OfhUwSqrPa
 0xwPuvTaaTaaIOXgvSWieUqQDTz56AcBNxj/kyx3jefCfvNVOaccjvtXsrjHWy+YWGth8Zgv3
 smaRGrjjG2YDpl1miZ52SQZmJbu9l5XCZkL/+B33jNmHqb5U8ty2pwFRMH++0JG53QKrssrsI
 keyiu/rtSgKnn1nFYAIjCDaKMa4sL8a5RmSekhMC2KzSJULiOFWrVCpMbrk9Brp2nceIYvttb
 kMA8D9NDGAAS/ELQ4gF7FzK5+t9AivKeOwXeSpnVpKH0YSQAs0mHOgcy/IUagz5XPhikWFXwq
 RIZR5Mk6K47k0WoodUmt9IzARMotCjEoHmvfgJZthcipi/9Ig/2Gq1liKLOiK3degTUnUGk7U
 uny4U94W6MbZcof0LNOrfdi8ehFaHDxg/qP+bLKtU+gkUa/8hR5A2TV+HRFZLEntrWjwK+ID1
 FroIp8ycYlkaGPbwl6IAZMh5/25xXX+/M0eEnrxtonmvBateM247bedDKbGnmwU3GBH0ntJHL
 uTnUnF+SJgehtMpl+vV7EYwlHiQENXiDq/unELJncLMIp3Aseuc6d/LHi2OIKHFAq1YbCpqCe
 h9nqGhvbY6noGtufJRMcLMHbr4yFA6XHMyxR9IJFXzyPv1HSyH2iF9jxi51GqNyDbzR+4antw
 AujLtxyRVYCf3U0XfTZLc5bl3UOWa3/xNVdeqBG1HsLjH2B1q9oJ8cTRAVZh2Ai+u8ZGTNAu6
 C5gNp23jG3HnB3FTxRPdrq0b+7yvEYMpOYRInngdsb+/DViKpVDVxQMJll6KxEbAHU2N+VHoG
 z7oFbNm/CnGAlumaFR2tPl10gSw=
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/28/23 23:01, Sam Ravnborg wrote:
> Hi Helge,
>
> On Fri, Jul 28, 2023 at 08:46:59PM +0200, Helge Deller wrote:
>> On 7/28/23 18:39, Thomas Zimmermann wrote:
>>> Most fbdev drivers operate on I/O memory.
>>
>> Just nitpicking here:
>> What is I/O memory?
>> Isn't it either memory, or I/O ?
>> I mean, I would never think of the cfb* draw functions under I/O.
>>
>>> And most of those use the
>>> default implementations for file I/O and console drawing. Convert all
>>> these low-hanging fruits to the fb_ops initializer macro and Kconfig
>>> token for fbdev I/O helpers.
>>
>> I do see the motivation for your patch, but I think the
>> macro names are very misleading.
>>
>> You have:
>> #define __FB_DEFAULT_IO_OPS_RDWR \
>>          .fb_read        =3D fb_io_read, \
>>          .fb_write       =3D fb_io_write
>>
>> #define __FB_DEFAULT_IO_OPS_DRAW \
>>          .fb_fillrect    =3D cfb_fillrect, \
>>          .fb_copyarea    =3D cfb_copyarea, \
>>          .fb_imageblit   =3D cfb_imageblit
>>
>> #define __FB_DEFAULT_IO_OPS_MMAP \
>>          .fb_mmap        =3D NULL /* default implementation */
>>
>> #define FB_DEFAULT_IO_OPS \
>>          __FB_DEFAULT_IO_OPS_RDWR, \
>>          __FB_DEFAULT_IO_OPS_DRAW, \
>>          __FB_DEFAULT_IO_OPS_MMAP
>>
>> I think FB_DEFAULT_IO_OPS is OK for read/write/mmap.
>> But I would suggest to split out __FB_DEFAULT_IO_OPS_DRAW.
>> Something like:
>> #define FB_DEFAULT_IO_OPS \
>>          __FB_DEFAULT_IO_OPS_RDWR, \
>>          __FB_DEFAULT_IO_OPS_MMAP
>
>
>> #define FB_DEFAULT_CFB_OPS \
>>          .fb_fillrect    =3D cfb_fillrect, \
>>          .fb_copyarea    =3D cfb_copyarea, \
>>          .fb_imageblit   =3D cfb_imageblit
>
> The prefix cfb, I have recently learned, equals color frame buffer.

correct.

> They are named such for purely historical reasons.

well, they operate on MEMORY which represents a (color) frame buffer,
either in host memory or memory on some card on some bus.
So, the naming cfb is not historical, but even today correct.

> What is important is where the data are copied as we have two
> implementations of for example copyarea - one using system memory, the
> other using IO memory.

sys_copyarea() and cfb_copyarea().

> The naming FB_DEFAULT_IO_OPS says this is the defaults to IO memory
> operations, which tell what they do

This is exactly what I find misleading. IO_OPS sounds that it operates
on file I/O (like file read/write), but not on iomem.

> and avoid the strange cfb acronym.

> Reserve cfb for color frame buffers only - and maybe in the end rename
> the three cfbcopyarea, cfbfillrect, cfbimgblt to use the io prefix.

Again, the io prefix is what I think is misleading.
Why not name it what it really is and what is used in the kernel already, =
e.g.
iomem_copyarea() and sysmem_copyarea().
which would lead to
FB_DEFAULT_IOMEM_OPS and FB_DEFAULT_SYSMEM_OPS.

> Which is much simpler to do after this series - and nice extra benefit.
>
> I hope this properly explains why I like the current naming and
> acked it when the macros were introduced.

IMHO the naming isn't perfect, but that's just nitpicking.
Besides that, Thomas' patches are a nice cleanup.
So, if you want add a
Acked-by: Helge Deller <deller@gmx.de>
to the series.

Helge
