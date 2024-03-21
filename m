Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802388609A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 19:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEB310FA95;
	Thu, 21 Mar 2024 18:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ZIP0Ochl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFF110FA95
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1711046133; x=1711650933; i=deller@gmx.de;
 bh=30LpEQJ+VIFqSdZMHIY/Gx7JYx/unJeC3TIGgooiYC0=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=ZIP0Ochl4YZjNMzHPV5CB+LYuidjUizwEbz1Iv4cGU2dtBJ71BomSw/u+EztmqU6
 /HV5rvmiaIyMskAG9gyhIlmku1kvUQDNlf5JgXRUlctBLo/aBBUy5K+B1jCqHcSs9
 nRuCn9qczRetLWgJ6HJN1H7rV7AMgXIN19OXf/phogDFCyeRHMQ6qhkCsSSnEsC/y
 93IJCu/kfEi9OvonDqm/4041ofzhxCPByQS6Aep68mQS4GII8ynz4GbLJgVutn1EH
 aiKfs25q8s7/Pdvp5sGOjqsvF5Dph3JNvLxSi5CXkpFcRfEpeA9HR5mG9oogu2OjB
 5ulCkhhhlsM5a2gv+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([89.244.183.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1r2idP0g4E-00m2ti; Thu, 21
 Mar 2024 19:35:33 +0100
Message-ID: <3b762aaa-67e2-4652-9a29-a374578c04f6@gmx.de>
Date: Thu, 21 Mar 2024 19:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] fbdev fixes and cleanups for v6.9-rc1
Content-Language: en-US
To: Helge Deller <deller@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <Zfx8hg0RRDmKbJ0O@carbonx1>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <Zfx8hg0RRDmKbJ0O@carbonx1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ds4Du7d79Plr3I2idFGYpEoRbkKMcR+DRkiAlotvraw1LpPBZGR
 GwQAWG8zXry1cxjUIQPm++I40waZf68frdLyDBhjO1mM3iBLFpKdF9qSXVPVsv67IEaRHmF
 uINCZUw9+Z/jQTyoiW2OLG6ma8WIfZW7WesEnC+1PPbSN9hoxm+Ldv/+iS63K5jEysXRVTt
 Pz9w+Dgdg1YcoQrdiG8Vw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9+y+nC4wWn4=;w8r+QDJE5HBZV9HKJ3LkpE87zNt
 wCBdFQD1OXzpzLBXFgaRm5qWERB/jSuvPUolk6x8ve3G6tBTx7Qq+vHszFwdULpp2mt0BFws7
 H+ilL/S1Aoy62SUcUqKWhwTq9CJzAOVUKfvFlsOFPlQxmfxcwm7qKvpyXWeMotMR9r1VN7l5O
 R0mEQsfDKnKoYvbkUWFY1TbcW0RfcUT1aQOLwXNIPUadPcY2GXfxezx2g0ZZRYWFDqGOEbgqA
 bhb1JqM7SxwBjDc/rkKX9P1hH0LnYIyr9MeGWOy/Z3b6h2pK2Fu9gD0e9d7hJxtmUU/RWbgmo
 Us5Gi0yvmFOQ+1Or7GsN+KdL7iRcXVg658Ivq9A7cg+3pA6tSOeHXx4kgqvOOIFwJxHvZLvhR
 nyM3nBK/mJM4MZ/RNNGOeInQvQn2JvU+c9JnpAJzmiACl7TU3TUk9lTVU5b70xhODk6kYmXzn
 08DMrUowLBOjv7n9pQYtxM6Gb4gVKkVBX3Lf1EdZQe6lnbB2f/VH5RpQXWZIDtsaK6LtVVT5l
 cYD6UpuPT/1eBzvq7bdtiHSXaI51NBGwXEABzf31U4K3lq6F8TRnsNFgahN+3PUmTB462ACYD
 btgtwS26jKqF0JhHqFPphMxuh+03FIuHlffJk8MN6Ba4zApT7WkrZIvo8WXK7cEgnHwiI4zxL
 GT3C0Qlh9qiobgwlQABg7dDKZE/51HnJMjVtV07cKKLJblAQlpcp9nzGecd5uufPL45rWswBz
 De7QVcIP3DXB28o2W8l87r4GG9TThpq0Gl1gokfV8wcatAyEZDQzJElmXpYeBiBDe1sdkbX6J
 mNEjfXUH7qKWTchm8z6ZjBNS4Gf6nrq4jRq3QvJ+d/SDk=
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

On 3/21/24 19:29, Helge Deller wrote:
> Hi Linus,
>
> please pull fixes and cleanups for the fbdev subsystem for kernel 6.9-rc=
1.


Linus, please wait....
There is one new "unused variable warning" introduced with those patches.

I'll fix it up and send a new pull request tomorrow...

Helge



> Beside the typical bunch of smaller fixes, the Linux console now allows =
fonts
> up to a size of 64 x 128 pixels.
>
> Thanks!
> Helge
>
> ----------------------------------------------------------------
> The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1=
dd3:
>
>    Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)
>
> are available in the Git repository at:
>
>    http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git=
 tags/fbdev-for-6.9-rc1
>
> for you to fetch changes up to 0688d3b1d882dd1dcf73305306e71ebf1653f595:
>
>    fbdev: panel-tpo-td043mtea1: Convert sprintf() to sysfs_emit() (2024-=
03-20 09:02:32 +0100)
>
> ----------------------------------------------------------------
> fbdev fixes and cleanups for 6.9-rc1:
>
> - Allow console fonts up to 64x128 pixels (Samuel Thibault)
> - Prevent division-by-zero in fb monitor code (Roman Smirnov)
> - Drop Renesas ARM platforms from Mobile LCDC framebuffer driver
>    (Geert Uytterhoeven)
> - Various code cleanups in viafb, uveafb and mb862xxfb drivers by
>    Aleksandr Burakov, Li Zhijian and Michael Ellerman
>
> ----------------------------------------------------------------
> Aleksandr Burakov (1):
>        fbdev: viafb: fix typo in hw_bitblt_1 and hw_bitblt_2
>
> Geert Uytterhoeven (1):
>        fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH
>
> Li Zhijian (2):
>        fbdev: uvesafb: Convert sprintf/snprintf to sysfs_emit
>        fbdev: panel-tpo-td043mtea1: Convert sprintf() to sysfs_emit()
>
> Michael Ellerman (1):
>        fbdev: mb862xxfb: Fix defined but not used error
>
> Roman Smirnov (1):
>        fbmon: prevent division by zero in fb_videomode_from_videomode()
>
> Samuel Thibault (1):
>        fbcon: Increase maximum font width x height to 64 x 128
>
>   drivers/firmware/efi/earlycon.c                        |  2 +-
>   drivers/video/fbdev/Kconfig                            |  2 +-
>   drivers/video/fbdev/arkfb.c                            | 15 ++++++++++=
+----
>   drivers/video/fbdev/core/fbcon.c                       | 16 +++++++++-=
------
>   drivers/video/fbdev/core/fbmem.c                       | 12 ++++++----=
--
>   drivers/video/fbdev/core/fbmon.c                       |  7 ++++---
>   drivers/video/fbdev/core/svgalib.c                     | 15 ++++++++++=
+----
>   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c             | 18 +++++++++-=
--------
>   .../fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c | 12 ++++------=
--
>   drivers/video/fbdev/s3fb.c                             | 15 ++++++++++=
+----
>   drivers/video/fbdev/uvesafb.c                          |  2 +-
>   drivers/video/fbdev/vga16fb.c                          |  6 +++++-
>   drivers/video/fbdev/via/accel.c                        |  4 ++--
>   drivers/video/fbdev/vt8623fb.c                         | 15 ++++++++++=
+----
>   drivers/video/sticore.c                                |  2 +-
>   include/linux/fb.h                                     | 18 ++++++++++=
++------
>   include/linux/font.h                                   |  3 ++-
>   lib/fonts/fonts.c                                      | 15 +++++++++-=
-----
>   18 files changed, 110 insertions(+), 69 deletions(-)

