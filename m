Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6380EF0B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F0B10E603;
	Tue, 12 Dec 2023 14:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606A110E603
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1702392121; x=1702996921; i=deller@gmx.de;
 bh=sFhE8r8kxU+YoTxoZQ2Gpgt4+bcv7P1+q2xFMz3991U=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=mZbeVXRrqT5m4GDpYNXXfYarrAcwoyEFkqZkrppKg7ttp7hfB//xqOCAGyU9TU+e
 X93Lzt6hUmM9OiEJW6efOEOS3PWb5me3WWSPlzYFUoHwr7W99O8KW4hfF/LAD3Ghh
 HzJ0FXtUEGE8p0hEc80TBn/ZhD2MCsydN9mnDPPrOlbDP3XP/5NLwsidYL5bUZTIM
 Uv3x8MRV6jb0U22FkWCKFNmBv18ERiN/Oufg42h7E/HxuOZFiJfDvhTe+vxxc/zCP
 USOpxx29r0RsV0J9axSZxrIxVOGKyBqBhfQyo2gQkesVVaKEjG8t1oFohmt0ZCcfr
 ESY2RohJbkpgMCBcHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsUp-1qzYDW03HL-00HL4e; Tue, 12
 Dec 2023 15:42:01 +0100
Message-ID: <80373538-0360-42b9-bf0e-e475ebfd1214@gmx.de>
Date: Tue, 12 Dec 2023 15:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/clcd: Delete the old CLCD driver
To: Linus Walleij <linus.walleij@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Lingkai Dong <lingkai.dong@arm.com>
References: <20231212-delete-pl111-fbdev-v1-1-3e63f3abae6e@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231212-delete-pl111-fbdev-v1-1-3e63f3abae6e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:osJ/HR7FJhv7jspPD4KdPm6rIAsiATEV8WH/twiz9nL7b3E/giU
 ISnAmjLqaBY+/CxL9ZMwesr5nNVje1HnD7e01b//tro16Ejh4NpG/qqPKitE9dWDC0iz3j7
 cHVHKjJ8QsP37aVfbh5AAR4qOSf67xC/RE1cUOBcBYw2nwh2Z9/25mEiIQ2go13mzJigv/M
 S63HGX1kTLYlrh3k3zunw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:scGYFBDeSjc=;Ju9GKCX8wpOjn0y0mjXH3cDqT9H
 l7fpbqSKMTG5sMHndpGhfx9xTYGS23EvMxow+B1X1bgh1MzK2JbMx8npO44VVSrvlQ9ao6UXH
 MxaNWbklXVqF3U1ZM87lPjKSqrh9e6hV7MHw4INIH2Q9eEMDRIxV65Dg3tW9II4gd9IlzVrEg
 YLyTA6HaHTJdnlPHck+Ef9W8PCTnDPCJ21T+uwfbsTOjOQRlpRv0A4RwpP/GPCYuUqwuaHTP1
 btu7TQvTLJAwOKdrC47nQWEtoHjTQQZlX8XM9/oCJmfLq6NgE4GfEB50ELpq8+S4RFqY2yVjm
 EcYN9P46tjRI+ivBzQ4YU898b0t78XROXPr7/4PCQrMR40qMbPVqR1weUYQ8/6+q95jePo7ee
 9JiZYh70lGukHZbUNL7oe9uBWHy3ex/aYxeLq4CyWa87vwsV0uVec441V9OEpTjjcj6PEzNSN
 Lbnkf5q7Z56FLy143kJJ/RZ1cRT65DW9Mt11uH0d4mEkqqjO4sJdvPNWsbRXnBVbhb7U5RX19
 XjIRFjznBWjTdiRW6RQDK5nTFwIl+sLMbiuFW/s1XfQK6mfsjRhO6nXUQ9ILoogZtO2TpiFSd
 oh2ubUr9eZzJxIPDNy7kcIFxcm+85FFqwfoHAf3huQ62b7e93jWWKlS0Q0kuXxrM5N6Bbmjky
 uPL0ZpTh87kN+4WabmN6fCz4VicDFvycGUuRUa6AsHQm/0CFA5tcXuS4k8j5KRUqQ9u/hlG75
 n3av/WrsfsmaZwcGE3+xzPh1Ht0EiAZkBfEdm12oo/aSaU8UYOKo0hd3rnR28HzZTSGOTZbq2
 U6jPivR3VFgKhdE42NAXtF8zQ3Uw1KJapNlknIEEn9e9aqEQFsp4S9PDtKN2y38zdf1AJiu62
 u+AYmINee5l2zLA3etNAxGRDWhsM1hpQJhbidIFBQGbj1hl2jxpix1UlFrlQJFCnRCuNKxqDn
 nkV2qA==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/12/23 15:18, Linus Walleij wrote:
> We have managed to ascertain that all users of the old FBDEV
> code that are out of tree are now gone.
>
> The new DRM driver can be found in drivers/gpu/drm/pl111/.
>
> The remaining out of tree user was the ARM FVP emulation
> platform, running Android. Thanks to changes in Android
> versions 13 and 14, Android can now use the DRM driver when
> being emulated under FVP. Some final patches are being put
> in place to make it fully featured.
>
> This is essentially a revert of the partial revert in
> commit 112c35237c72 ("Partially revert "video: fbdev: amba-clcd: Retire =
elder CLCD driver"")
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

applied.

Thanks!
Helge


> ---
>   MAINTAINERS                     |   5 -
>   drivers/video/fbdev/Kconfig     |  18 -
>   drivers/video/fbdev/Makefile    |   1 -
>   drivers/video/fbdev/amba-clcd.c | 984 --------------------------------=
--------
>   include/linux/amba/clcd-regs.h  |  87 ----
>   include/linux/amba/clcd.h       | 290 ------------
>   6 files changed, 1385 deletions(-)

