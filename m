Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FFF562328
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B6512ABAA;
	Thu, 30 Jun 2022 19:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F4B12ABAA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656617483;
 bh=3J3pMvDiRCvoUHpCkNPUVw/EyJTk2nvsd2BG3CcYZvY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Vq6qb8CnWt8VO2cwYAuQ+zacVDV2/C1150hBnjCeyRNY01Ov7l9ar/TAyBy1uvALZ
 MgVi0WP4J1LZyrlH+LoXaVCyK+D7DuVG7KBeZ4dqgvy4A8A/zOb6emKhhCGdXL+AnV
 0Pa03ZB4hxIjA939n+9Z/9gS4mmAI9E/SInGDhNA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.11]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hvR-1nfXNk0eYB-011f5D; Thu, 30
 Jun 2022 21:31:23 +0200
Message-ID: <0c418b7d-474a-3f93-a1fb-2f13c4d19941@gmx.de>
Date: Thu, 30 Jun 2022 21:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] fbcon: Fix up user-provided virtual screen size
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-3-deller@gmx.de>
 <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lf9T43hveJdcWUAtiDLiLac5gUJDJ/thzeYBogIHuoAitrB+13t
 Cczll/dW6AqfEyawv+U3OTaIluZi1k4gPTGeP69PpBgxeniAq6tYCZZseQ7+C4UqsgVk7NG
 0htXk92lB57H3goEYC1InCLMiv1AMGmk+gUaT8eKXlUIQjNZDxY6TIGmrz3A7WgZ5FKwNVj
 dSpLHNuhjbnLLQ2yDvfhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ec1sf0qRz48=:VvABMHMOcH+46NMTsrcAgE
 eznZx3F5/fnlwIJo0kAsfeVhUxosfJJz+cRKgpfYnOcW62mnkNdnGVoIB9DEymwK2Jlcy0jtK
 NHI2QCEZ0iSsPar/ZYAf5+K5epUN+O4UAWaEInnopAIIDEArdbJtClrHfICAKq+Sb8oJDj8/n
 BI4dDUTnVFGvs0zVnLFFj9HQ3cLqliAkqdIZkyULBT+kmGxwXUWVlNYtA5+FU4pFFmASdxK/u
 IYilH0OlfqoUWEDGIBg42OWXi489ZfUwImfRGu1Tq8UnXTnePVFNoX89zzwj6rcWpwFhixq57
 PwjfqOHU+0fLltfauJ3U2+C8bLzmovkYNlC+X1b4fsG7SJSshDVa5pLzw76dX1MJaAmJzfwIf
 /jwM2clqxf1rinNP9a1v+WwwAa/RG13yEL0PCwzvTbb/yAH5qzNHrXveTWwxkulCuNgQ/8r6G
 G43dli3UdIp1FMvQ5lThS/VWOD6JsPqiS3J1kE49LnsiJ+7ztvGDVc5sbYKLh+SP/RqI6SKK+
 KJj9cSNXy3TjM9m/MHoFPCjjYfmbjMH1n52YAbsSf0nSiwQLUQ4Z5k21Liw0o+61amloDsu2T
 yIbJDY/x5nkMaq4xBclLMhNduNpdc5l0OEUS1dUdJ99amg1y9XIZBffA7DNqUbcQf+4exzkJC
 KDFgI671jJKfbLuJJvl0+EOYwPM6OF3pqUUHNchT4kIV0iX5Nh0PtahTAGhnlErOn5ng2ZwPe
 rPGgH15TAjqE/5sW5fXogX8FgdAT/PGgOg+eOE5rTp6LjFTRS1IY1sDl3Hc4FKdhAt3K1JEjQ
 lbAi3QIgZRJ/j5XXGHBI8Lhet1BTGhdoEGGj9uGBKz1YGKMpJEDg4azuXno7vVvxmOee+ZUDM
 4L4NYEFqBODAEtBbY4Fv1ZTykVGqbivd7SIcg7VqKiBYWaGBW7eRwntP194VLK/OQ4AI4OnV+
 oBnxWPMfmJYiuOuDO4LCgFjCVJSoM0w+jhvyrDP/R/uHhn7ftdYCEjE2HqQKywDqHtIS2O7ld
 f8HZhTxMFFVn/CCDl6hVAU3nUhTaTx/dMxcN5yOu8eREj8GCIVxSx154Ui4Fw6eFb0Y+xED+n
 d+RtJo5rr41pmt2QbbF1VGImWAiZmcyjsaSCO8tCrYdWNX4T5VtoadDqQ==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 21:00, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
>> The virtual screen size can't be smaller than the physical screen size.
>> Based on the general rule that we round up user-provided input if
>> neccessary, adjust the virtual screen size as well if needed.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.4+
>
> Thanks for your patch!
>
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *info, un=
signed int cmd,
>>                         return -EFAULT;
>>                 console_lock();
>>                 lock_fb_info(info);
>> +               /* adjust virtual screen size if user missed it */
>> +               if (var.xres_virtual < var.xres)
>> +                       var.xres_virtual =3D var.xres;
>> +               if (var.yres_virtual < var.yres)
>> +                       var.yres_virtual =3D var.yres;
>>                 ret =3D fb_set_var(info, &var);
>>                 if (!ret)
>>                         fbcon_update_vcs(info, var.activate & FB_ACTIVA=
TE_ALL);
>
> Given "[PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
> fb_set_var", I don't think we need this patch.

We do.

> Moreover, this
> patch will prevent triggering the WARN_ON()s in [PATCH 4/5]

Right.

> in the most common buggy case of drivers plainly ignoring var.[xy]res_vi=
rtual.

In summary:
This patch #2 is fixing up user-space invalid input and is not
allowed to trigger any WARN_ON().

We could drop patch #4, but then we wouldn't catch bad drivers.

Helge
