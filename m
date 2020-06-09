Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE711F3A34
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 13:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6916589D56;
	Tue,  9 Jun 2020 11:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D2989D40
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 11:58:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200609115803euoutp01f04798c61a5daf7e878f4f0b2199d732~W3j_xVBgo0679406794euoutp01a
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 11:58:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200609115803euoutp01f04798c61a5daf7e878f4f0b2199d732~W3j_xVBgo0679406794euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591703883;
 bh=4Wofif9zSokbfRmKIjr8aBJP/sgtQ8VuZXJjfhQb4Og=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=rSHz2+QcNANnx8wXGAsLJymXkLuqm0lOTMo9270CdrR8FnYIzDqCqbaT5C42NF1bX
 lOA/r+vyYLkME/XGD3Mt94wD1XB604JtbEy9lSl/KzYHY+bmly2zIqhLAGo1KgxoXx
 GdurDI9YUbPwWo9yCXqTp3zNeYw8zZB6LgquBU38=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200609115803eucas1p1818e18274b01bbaa018075a7747d5f69~W3j_f4wER1159311593eucas1p1V;
 Tue,  9 Jun 2020 11:58:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1C.A5.61286.B497FDE5; Tue,  9
 Jun 2020 12:58:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200609115802eucas1p199c95a05e169ea47a90937025bc5ef66~W3j_MyXhA1846218462eucas1p1u;
 Tue,  9 Jun 2020 11:58:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200609115802eusmtrp2c91cad34b367371cf1b89d5ee0608d9b~W3j_L0DBq0991909919eusmtrp2I;
 Tue,  9 Jun 2020 11:58:02 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-de-5edf794b4efb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 97.A8.08375.A497FDE5; Tue,  9
 Jun 2020 12:58:02 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200609115802eusmtip1a2b403ccdcbabc34ec9360ef7427d58f~W3j9vmcyV2235122351eusmtip1r;
 Tue,  9 Jun 2020 11:58:02 +0000 (GMT)
Subject: Re: [Bug Report] drivers/video/fbdev/da8xx-fb.c: undefined behavior
 when left shifting
To: Changming Liu <liu.changm@northeastern.edu>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <7f7946f8-eb27-0745-6298-bd8099e43969@samsung.com>
Date: Tue, 9 Jun 2020 13:58:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BL0PR06MB45486287654FC3C2045A5655E5B40@BL0PR06MB4548.namprd06.prod.outlook.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRmVeSWpSXmKPExsWy7djPc7relffjDJrusFt8mXuKxeLK1/ds
 FnvmSlmc6PvAanHw2Q02i/29G5gsLm9bxOzA7vH+Riu7x85Zd9k97ncfZ/Jo2HaB3eP4je1M
 Hp83yQWwRXHZpKTmZJalFunbJXBlzP3wgK1gqXhF65OzzA2MO4S6GDk5JARMJN6e/MwMYgsJ
 rGCUuHo0uYuRC8j+wiix88gCNgjnM6PEuqWbWLsYOcA6Ns5OgYgvZ5SY236fFcJ5yyjRdOUu
 E8goYYFEiZaXCxlBbBEBfYmn86ewgxQxCyxjkrg4ESLBJmAlMbF9FZjNK2An0XThDdgdLAIq
 EtcX7mUHsUUFIiQ+PTjMClEjKHFy5hMWEJtTIFbi9K3LYL3MAuISt57MZ4Kw5SW2v53DDLJM
 QmAfu8S7i8fZIB51kWg4foQVwhaWeHV8CzuELSPxfydIM0jDOkaJvx0voLq3M0osn/wPqtta
 4s65X2ygAGAW0JRYv0sfIuwoMW/tJGZIuPBJ3HgrCHEEn8SkbdOhwrwSHW3QsFaT2LBsAxvM
 2q6dK5knMCrNQvLaLCTvzELyziyEvQsYWVYxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIE
 JqPT/45/2sH49VLSIUYBDkYlHt6IzPtxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8v
 Ks1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qB0cnQ8OgHyxULGdb+mTz51JJQ
 JrNJzz5X1qt+P9YuceX0ctb39xb6NQp73T7toFy8emelnmf3nQDRhaEVk6T3bbp59Sln+VKu
 CeWLz54z4haWN+IPuphf08y+9fX/Wz8TuCqC7lz8aHfm7PHjQb4PJ7ML6cgsup90zEFtRV2p
 lPtH316WsA7BSiWW4oxEQy3mouJEACAe981CAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xu7pelffjDK4uNbD4MvcUi8WVr+/Z
 LPbMlbI40feB1eLgsxtsFvt7NzBZXN62iNmB3eP9jVZ2j52z7rJ73O8+zuTRsO0Cu8fxG9uZ
 PD5vkgtgi9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3
 S9DLmPvhAVvBUvGK1idnmRsYdwh1MXJwSAiYSGycndLFyMUhJLCUUaJ/wWZmiLiMxPH1ZV2M
 nECmsMSfa11sEDWvGSWe7u1mBkkICyRKtLxcyAhiiwjoSzydP4UdpIhZYBmTxNI3k1lBEkIC
 Gxgl3v9LBLHZBKwkJravAmvgFbCTaLrwBmwQi4CKxPWFe9lBbFGBCInDO2ZB1QhKnJz5hAXE
 5hSIlTh96zJYnFlAXeLPvEvMELa4xK0n85kgbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiy
 ilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzD2th37uXkH46WNwYcYBTgYlXh4IzLvxwmxJpYV
 V+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OBaSGvJN7Q1NDcwtLQ
 3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAOj7eP1a/SCPzAHVkqG3HMK+r39SjRn
 bI2J758Iy0fVl66ufH2pbHZK1O5JnSn3OSzmzewpkNw4JcDaMq52Lv+f6tg7GfYmr/Y+75/n
 1ffQyvr9kYN7tnqv37DpoZ584KaJWxVurT5remj1Sf1Up8cn/lfc+6D3zSXfaBO7+caMyZeO
 vZ7Ftr9NSomlOCPRUIu5qDgRAA3QYl3TAgAA
X-CMS-MailID: 20200609115802eucas1p199c95a05e169ea47a90937025bc5ef66
X-Msg-Generator: CA
X-RootMTR: 20200522030138eucas1p2555438440fee702f55c52980aa6111f3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200522030138eucas1p2555438440fee702f55c52980aa6111f3
References: <CGME20200522030138eucas1p2555438440fee702f55c52980aa6111f3@eucas1p2.samsung.com>
 <BL0PR06MB45486287654FC3C2045A5655E5B40@BL0PR06MB4548.namprd06.prod.outlook.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Sekhar Nori <nsekhar@ti.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "yaohway@gmail.com" <yaohway@gmail.com>, "Lu, Long" <l.lu@northeastern.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ added TI DaVinci platform Maintainers to Cc: ]

Hi,

On 5/22/20 5:01 AM, Changming Liu wrote:
> Hi Bartlomiej,
> Greetings, it's me again, I sent you a bug report yesterday, I hope that find you well.
> 
> This time I found that in /drivers/video/fbdev/da8xx-fb.c
> function lcd_cfg_vertical_sync, there might be an undefined result by left shifting.
> 
> More specifically, in function lcd_cfg_vertical_sync, line 437. back_porch is a signed integer 
> which might come from user space. And it's logic AND with string literal 0xff. The result is then left shifted by 24 bits.
> 
> The problem is, since the logic AND produce a signed integer and the result of left shifting this signed integer
> (whose lowest 8 bits not cleared) by 24 bits is undefined when its 8th bit is 1. Similar patterns can be found in line 410 as well.
> 
> I wonder if this bug is worth fixing? This can help me understand linux and UB a lot.
> 
> Looking forward to you valuable response.

I assume that lcd_cfg_{horizontal,vertical}_sync() take parameters as
signed integers (and not unsigned ones) in order to special case "0"
value (I suppose that hardware expects all bits sets to represent
the "0" value). Sekhar/Bartosz: could you verify this?

If the above is true to get rid of undefined behaviors in the code
(BTW gcc seems to produce correct results currently, I don't know
about clang) we should add type casts in proper places, i.e:

static void lcd_cfg_horizontal_sync(int back_porch, int pulse_width,
		int front_porch)
{
	u32 reg;

	reg = lcdc_read(LCD_RASTER_TIMING_0_REG) & 0x3ff;
	reg |= (((u32)(back_porch - 1) & 0xff) << 24)
	    | (((u32)(front_porch - 1) & 0xff) << 16)
	    | (((u32)(pulse_width - 1) & 0x3f) << 10);
	lcdc_write(reg, LCD_RASTER_TIMING_0_REG);

	/*
	 * LCDC Version 2 adds some extra bits that increase the allowable
	 * size of the horizontal timing registers.
	 * remember that the registers use 0 to represent 1 so all values
	 * that get set into register need to be decremented by 1
	 */
	if (lcd_revision == LCD_VERSION_2) {
		/* Mask off the bits we want to change */
		reg = lcdc_read(LCD_RASTER_TIMING_2_REG) & ~0x780000ff;
		reg |= ((u32)(front_porch - 1) & 0x300) >> 8;
		reg |= ((u32)(back_porch - 1) & 0x300) >> 4;
		reg |= ((u32)(pulse_width - 1) & 0x3c0) << 21;
		lcdc_write(reg, LCD_RASTER_TIMING_2_REG);
	}
}

static void lcd_cfg_vertical_sync(int back_porch, int pulse_width,
		int front_porch)
{
	u32 reg;

	reg = lcdc_read(LCD_RASTER_TIMING_1_REG) & 0x3ff;
	reg |= (((u32)back_porch & 0xff) << 24)
	    | (((u32)front_porch & 0xff) << 16)
	    | (((u32)(pulse_width - 1) & 0x3f) << 10);
	lcdc_write(reg, LCD_RASTER_TIMING_1_REG);
}

Also it would be helpful to disallow negative values being passed
from user-space in fb_ioctl().

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Best regards,
> Changming Liu
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
