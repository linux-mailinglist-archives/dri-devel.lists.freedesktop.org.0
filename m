Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 378DD63EAA7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 08:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD63C10E549;
	Thu,  1 Dec 2022 07:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C766210E549
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 07:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1669881451; bh=5lj8vIDyBwi7A84crvGtUsrnfkuqUwlP8Sc8sKuHUnA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=oeDYOI4NcYQuPxomBZOpIos8ctSu/YlWeW/cPAoaZYlQi1wW+G4FcXX8MWr6eNE0C
 XdIsa1pZWpoAmGd8gJYeTuO6OQ6HABPtAy3AjTbERmqAn5xe19SJyoE926DLyRcCet
 RtPNK2elZ+WqrYpFGdUbvga7xS3XfYMqoOic5wBQT5X00g/FTKgwRWaaWMufdPNAGM
 HS16n5FcutBPImHh9dg8ZsXw/hKAz2whGS1LwOBbXITmYTP00wOxIWBePq1h8DuSPl
 EValiiX3b5wrpZfIFu+p64bhpqtSPS6Pm7hisAmM+LnLSOwGMrw3DkZk4zW0pTsdv6
 58Ns04jX5e1ZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.178.52]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95iR-1oyG0y1t0Z-0166gC; Thu, 01
 Dec 2022 08:57:31 +0100
Message-ID: <ee9cb30e-6a38-ee27-c6e6-bcc21f470c8e@gmx.de>
Date: Thu, 1 Dec 2022 08:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] fbdev: uvesafb: don't build on UML
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221130215559.28969-1-rdunlap@infradead.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221130215559.28969-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZksNENsIBlY8zmacmvPxeuE6AT4K0leodsrZiYiq7mTIKVSfSVH
 0jp0Au8+7ohKaM6vvryTb+zUZEjOaqB86Du98BstOzTIE5YUH6acAbVxW33uK0sb3MwnJew
 9E8gyJfUgueWkREmRnf5+rEGAEAEtxW3qsPdG70qdfo8XJXamtuPcd0tfYsE8UxaJYmm1BZ
 rhacJlkm6FIx64Y6ixXnA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wz3wAo12j3U=;l30nBJ9gyV0KH2nJFRy6ACIHqrr
 595JwtYcyKQn569+9vllPc2oaWd1WTR5bKeonkgZIWrh/LAVdloPZlwvdqDA/8WgR+bgJox9b
 mfTHuWIkqelJqGIZNzQUCURIjpRunCMx6xWoA1bQF9S3rhXRQGr1MLcJBRzB8WKgW5pKgPX+V
 LvZrVJovSRZf/dUyJvRqv2XGEqAiPLdSH9YQB3Gupx9bshsQVpRs+LCogeiLp+LsZnTyXhvhO
 pDdvQsSap4VU2CnD0bSZI9urromBMxg12aGLu02xHR6xSzDV6ZmyViIFozDrCq38mTINVCWaC
 4mR41JzjHAAOopBTFejP6FUw7eMOPiRNWdXyLEQWW1pv+Ba4HRyWWvurdvcVJe5yZ86295a2q
 NnaeaSCohCG6aSW+iLO6gIn2igbrtZNdlxHoxdsPl7S+DfC5Z/oSOcZAnMEBz0DintchB/HKx
 Gwy7EvawoPvNu3NC8sJavjDU8oL2PjPppDzDfdJmfoxdxNQXIjbe2winZmbjZpB+1dYaryDhz
 LS5PLPZHh0ztnI3CwDj0BdH3LvvnND3OH8bVuBYIEFvDuXDs8z7KsHkuGZ7JRS0FWjbm56wuV
 ZkPioMdYauyBQdQP1mGPVuGwR8fcXN/hop0ZMi3jiKL8/v4gos6BNKs5NyZbcw2uM0TvgsTU2
 8otH/0UTj6mgP42vzlWTi4oSmw/bn0v3fmNO+Zh3DTKByAjV9yzASsP8yFG4IKRITresl1XnV
 Xfu7FkHqjOyI0eX8w5VkWm1RfATHEndcL6dUv6Rbo2OOJ36PaBia/DRb4kjW6sc/UvfFRBlSF
 kF2cTwZsgljvi5tUEnvOC3N3zA6KV7NF8NVRdrGSUlniqwMc7azWC7RX96eWImnDweMjxwUyA
 0fzBSMC86P/FtuYOlLplK5Dr75iyylEHEdNX1mHXALr4p0w3Bw8VvF56ivZe8KTjdvm+hp5pv
 Pvnxj27jekGKs6yrw+kDfuxjRJg=
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
Cc: linux-fbdev@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-um@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Michal Januszewski <spock@gentoo.org>,
 Johannes Berg <johannes@sipsolutions.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/30/22 22:55, Randy Dunlap wrote:
> The uvesafb fbdev driver uses memory management information that is not
> available on ARCH=3Dum, so don't allow this driver to be built on UML.
>
> Prevents these build errors:
>
> ../drivers/video/fbdev/uvesafb.c: In function =E2=80=98uvesafb_vbe_init=
=E2=80=99:
> ../drivers/video/fbdev/uvesafb.c:807:21: error: =E2=80=98__supported_pte=
_mask=E2=80=99 undeclared (first use in this function)
>    807 |                 if (__supported_pte_mask & _PAGE_NX) {
> ../drivers/video/fbdev/uvesafb.c:807:44: error: =E2=80=98_PAGE_NX=E2=80=
=99 undeclared (first use in this function)
>    807 |                 if (__supported_pte_mask & _PAGE_NX) {
>
> Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: linux-um@lists.infradead.org
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Michal Januszewski <spock@gentoo.org>


applied.
Thanks!

Helge

> ---
>   drivers/video/fbdev/Kconfig |    1 +
>   1 file changed, 1 insertion(+)
>
> diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -609,6 +609,7 @@ config FB_TGA
>   config FB_UVESA
>   	tristate "Userspace VESA VGA graphics support"
>   	depends on FB && CONNECTOR
> +	depends on !UML
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT

