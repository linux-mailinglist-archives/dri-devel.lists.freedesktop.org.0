Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B608F7E6730
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4D010E883;
	Thu,  9 Nov 2023 09:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BFB10E8B1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699523743; x=1700128543; i=deller@gmx.de;
 bh=vUqnvmBLbmPO07rKTSSDzYUB9oaQg16NwADPKRRp82I=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=iTtYqGXSeWefw4Tc//Ae1B2jS1wBKaxI7JeH8aJRpER4ek/STsB3A0U06bZhbWXe
 tKI3prmmZaV5tn9b1S1Qdj9gPUKn2eXrKjieN1/O+xXgQ05562Mx1wJpxKPiRowPr
 1kPEcqnjhBN38jiaW/qZgOVe6DsU3NZFb3Ux8A4MmnSkh/t8bRELbcqJajY4nC77Q
 YAzU+ABqgJY6Ma05wmNEfSp2Wsjby3W50guOYwqfDIZqwF5ZmVwKUPHkxcypfxFGr
 FDg2WkbbE/MbGfO/yF1wQ7gUDeDOTB5nFtwvXgKxc/TPsEnncbX+7KfJTIj4fH5zA
 TeuH9Klkt+a+q0Ui9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUnK-1rJ6qL1FVC-00rZp2; Thu, 09
 Nov 2023 10:55:43 +0100
Message-ID: <57de52b3-201b-4599-83ba-b0a7cc8db350@gmx.de>
Date: Thu, 9 Nov 2023 10:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
 <20231108184805.GA1579138@dev-arch.thelio-3990X>
 <20231108210018.ayo5b3afggmt6wfc@pengutronix.de>
 <24c4cc36-d14b-40cc-ad8d-dea029cf1845@gmx.de>
 <20231108215220.3iw5sydxad32gufj@pengutronix.de>
 <656080fb-7d10-47ec-bdeb-a099ceee99bf@gmx.de>
 <20231109062459.5hk7vb54t4iy5kp6@pengutronix.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231109062459.5hk7vb54t4iy5kp6@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:12SYzm+nIGZqkibPWpIpz0W5J4JgE7co5KbkrIj35bgP0zHuD+J
 xqG2u2m5tQFuqeFy20iqdwak9IwOBzKsdE6645x4w0GBgTO7ptKYd7JN7xHVny2KbpbreTG
 xoMeUgg9BTGK5+9HO5O+v/DxHsRNPzHocnpFKPH2PKK0owPQoAh8wxNAvGLRsYHpBJCNTNP
 kMWp8FXFgDxTR7XNsGTbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ssORnVKhfz0=;x38W/iw9Ld58J/d4xwnQEnKBt+c
 dVyFSDNg6UCEKlow8lvToyhvGzEEC8fWSReXhqvFB6+LoAeLxaSu2i6BxpryEd4biroCraZ1M
 9ymKBGKbzrv6XXcHdp732L9zemcU1neVXuHHUQR5m6lN1qBN7XHL1wBvpb4HISiaiX4UB7w5Y
 +O+Qv+fv0XY4Y6wk+kqSM6KFUfPmBA7oB2bs29kaPJOv41bv3+WBIe9BVvJYoo2nBZrQb3Sy7
 xLAJzc/EThYZBlQQWauS77gZnI6xW5we5C5zBBwlw8DyVnqdzcO3Zmmx2eT7Wt7VyfXYYvido
 4iDkhxO0S5zM+zKvsrhyA3Dlu5HhcB1o/o25IuCFpO6Amg+BH+JRFyzeK1WieXevioVSucR9y
 p3BTlMIWi6r1lwS2YUF0nC36vUjRrD+kJY7vpnfFs+Et9JV9pFUQFJdrm/6+TDXoYXeuwK2t0
 XTAb7hkEANcvJLZeFXQks1QfD3pkoKd7Qr+CqZRS3PZm1wgXUvETPL1ajllB9d7IxEFqTdRdi
 W7LxGd0dhPZBcioKg/4//YA+F0x1JeZNSYLXscTO46em13IOJEiQQ8Aycpjf6tD5M+IDtNMKc
 DocbCmJRnZ2TLyxNcMnmVrpfHKHOsfmIJHN9mpM8SRNy4OQwQR/2LfLQVoCzuYzEMY7p8KMnh
 GbLF06j0mbdUnTHK/voEX7kIZ5vjem8O8XH3fgxjQqAxo6NcCHrBPVvw+qGlQEOBNzT3n5oMZ
 y96Gw3DOpdln+IO8tE34UebU5h1I2AuUQjFrAPO4wY6EJb05WrxHBl/quYSu5+qblMsR6Bc49
 sMe/Nk0jy8wOClcgRK6IhhfoX7FoE7/D9nzgNfRdUTFLonxYuT0e3RvPJbPFgt3IBkjSo+lly
 eEEjaPcwCdBIvgLqnR01BPGwPT5dU7emyKTiibL8IOO0/ydieIjwMXkZ6H0NC6cFcR6hqkOLD
 P+PJ3k21MyT+KKHz7KHa/9oAlr0=
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nathan Chancellor <nathan@kernel.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/23 07:24, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Wed, Nov 08, 2023 at 10:57:00PM +0100, Helge Deller wrote:
>> On 11/8/23 22:52, Uwe Kleine-K=C3=B6nig wrote:
>>> But info and so info->fix live longer than the probe function, don't
>>> they?
>>
>> Yes, they do.
>> But AFAICS info->fix contains a *copy* of the initial atmel_lcdfb_fix s=
truct
>> (and not a pointer to it). So that should be ok.
>
> If you say so that's good. I grepped a bit around and didn't find a
> place where a copy is made. But that's probably me and I'll consider the
> case closed.

It's not directly obvious, but the copy happens in the line you pointed
out previously.

In include/linux/fb.h:

struct fb_info {
...
         struct fb_var_screeninfo var;   /* Current var */
         struct fb_fix_screeninfo fix;   /* Current fix */

so, "fb_info.fix" is a struct, and not a pointer.

In drivers/video/fbdev/atmel_lcdfb.c:
static int atmel_lcdfb_probe(struct platform_device *pdev)
{
...
         info->fix =3D atmel_lcdfb_fix;  //  (line 1065)

this becomes effectively a:
	memcpy(&info->fix, &atmel_lcdfb_fix, sizeof(struct fb_fix_screeninfo));

so, the compiler copies the "__initconst" data over to the info->fix struc=
t.

Helge
