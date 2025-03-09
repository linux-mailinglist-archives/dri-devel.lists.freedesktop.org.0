Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E8A58047
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 03:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE8D10E2E0;
	Sun,  9 Mar 2025 02:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="tgsqWNBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C7210E2E0
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 02:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741485638; x=1742090438; i=deller@gmx.de;
 bh=Nv7q73JewaaMP/j8eSwUqHgxHRPYRCgSF5TBSrI+cXI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tgsqWNBvR8iNMbjK9gIf1isiv+mJxQJs5c1XHjdWQglQMIXiqsmax/ljie12AiN+
 rtXXZMbtrKCRCdm+nd736M0UzCYbYTpCAXXOn3yXGgcR6uNSkE92fiEwuM6mzuoW8
 YLrHfDk5LYr0p1uRE3jhCWDdQJlWBlHI3u03gFdZ/I/w3lFl06nLEU2j5oFzU1vjG
 O+f0i1RCUAIbn4ayytQCFRdkfhuK1WkBVluMeKCiivifTiKqSCNb2IZ3YYFvh0Mhr
 9y7Y5gmIYB4GPNnR493ri9vAgIYrDvmo5R5Fxx5/IsgAIU/OY4NHheyrCZDujrZM+
 MXjXZRGB8nTXekFaNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7K3Y-1tsBMv3jpc-00CI6G; Sun, 09
 Mar 2025 03:00:38 +0100
Message-ID: <e88f483c-1439-40f2-8945-dfa4de373153@gmx.de>
Date: Sun, 9 Mar 2025 03:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: lcdcfb: Register sysfs groups through driver core
To: oushixiong1025@163.com
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250219084427.244985-1-oushixiong1025@163.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250219084427.244985-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2g9LTpSp5bLNqSSewIt9NQ7qAMuxvFHZweNuCCcp31D1/7qhW4N
 xRNKvDYSy4XhDGwy3F2o4JdEBD5yjuTUV+nr3Kms4VMU/nW5j1NnN16jg3WeXh0/j8etTgv
 P9cVPR8AbI+qpxr8+3Jk4ckbvic3+4TXLUz+PN5AypoJHpTABlCpDIxdnlz/7qOboLSJj8H
 L0P4c1pi9s9dCB/tmqqAA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aBWmrqUcUKc=;KbW3XNSUl3sl4yfSDDLejpzHFBZ
 PYGrQQSrAuUJWsj/r4EnKhx56Vi7HRxnZcFijJNdpSdMeUxvsOVN3cJNieod8Mo4zB4xOsZKk
 uuvLDH99mQbuC8XJ28v6KBDvGxmZET8vWhLLBevZU7Kbs5RT22ZOlOYcIs+cBYM4HPIeW7gI9
 13guhXFbnejOoOPiCIfo7FO0mRHbZs6u8nOGnnCtXoh1j0SCd6eXhkvIRLszBKBYoJR3cqDsy
 7cEVXdYw4B+eSSEhAr0C7Y4d86K1xn9v6T7AtP9YxMTjP2mVli7CvDtUYMnrpCRAA0FSPu2r5
 HEAsUV8cROsRyvrSAhsOxlAVbqUDvBxTjuruBwlKxQruU0bKbXXjnLNzmSqZjSX3Vkk4XKlzd
 OOayXAOGK59xL9vjYsfUJHYqIkeEY5UKpygR7TlA1JYQH5nvWRUtRGKbB6fBhsOa5IRay5gjn
 ogXgDMViFcgAXM5NfaGntbGL6tWPhTGmqA5Gc/NJ53AOCgS2ONZJ5vN4sO5oya5Q7ToU+/Ew6
 FcGbBBdpw//b8XxS983D4mvYwX2OhqLn3iGSCaEFctuTvesX0c/cQ6p4WQQ3vB5xu+KxlbTrN
 uPZOrqsCyWlfOFjt/VQPf62lwne5wFycDJS9I/XpMGDk9lSEjOEWmD4Dr6gLWTsGcq0MteB1o
 DLzlatY1lqRz1LF/4hCcMNI8bAHUFStYDbbwFjdt5vi8a4tK46bgqEtgLaQa/TZhOrv9b+kKS
 h+DQJjqJLuqz3Dc16r9ZX0jc4TlNkj0v0PFKQ104dAcsMAvCU2TRBQoXTuQfXNvvypd9VvVpf
 J+GjD9Y3UXXLO6UBlD0i7nbSHUOu9r58Zu2MVa+vHwcYN8Q5pSl2OnQyr1aO73OjVgETIWl9Y
 3UH0aW1sRwHAzdnIX0b4xuEFmDRDcurolJEQ6fuZLIHsjw+23E8pez7+XcaTyGN8TUYcfA/5H
 4u6esnL0ciV39Ptkg6rlvuE9XWZuVRsJuy6ZcltFDXjsrk8p9afNopdL8EDzop68yVpM1K97J
 AI/OTM1yc9C0r4JcgtGO6hg99jPL2ItxauDUP1NpEfaauXGQUaytE7k6FmCJxID9IuAentaZC
 PaGqApv6HLQlHMwxNxKurntN3KYk3fY+WPvfpKj1SVU80FS9hX2zW9mu2JvGMX+Bs35XBG9Iq
 GjSR4Cg2HLgsM9lnvnMG9p+aDdyJaXFdr9iV8bfU5vBpicqIB1WkavrqR9PeDsUX4AfxTG9Nv
 taHhdkuoWJw/lkRCqD9mPwxbs8T+S4w7pHHLnYBDKa7wIf26y14mDcQU80UNMzfdSlB8V2Vcs
 UmP1oG7ta0Dc7eeAH5Bno49hJq/ogHnXGciP1lO1zKSQBgfvGZtz2r8/JAw8GYHiwPko19Heo
 FZCax0uC81ilHFRk93jJgg7JlUJ2VhQNmQR03zfzKLwYOvPZETMS5lDMpD
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

On 2/19/25 09:44, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> [WHY]
>     1. The driver forgot to call device_remove_file()
>     in sh_mobile_lcdc_overlay_fb_unregister(), and there was
>     no error handling when calling device_create_file() failed.
>
>     2. This should probably use device_add_group() instead of
>     individual files to simplify both creation and removal. [Arnd]
>
>     3. The driver core can register and cleanup sysfs groups already.
>     as commit 95cdd538e0e5 ("fbdev: efifb: Register sysfs groups
>     through driver core").
>
> [HOW]
>     Register sysfs groups through driver core.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>   drivers/video/fbdev/sh_mobile_lcdcfb.c | 29 ++++++++++++--------------
>   1 file changed, 13 insertions(+), 16 deletions(-)

applied.

Thanks!
Helge
