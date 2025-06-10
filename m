Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C7AD41A0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 20:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6223210E121;
	Tue, 10 Jun 2025 18:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="XEbUGbTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19A610E121
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 18:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749578784; x=1750183584; i=deller@gmx.de;
 bh=K8TZOu36Zu0X+TwQ4J9L8v1/Sz5M4UbPXvWPJWawvAw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=XEbUGbTHaZWYuFJ8LK+oI7rbE7X4lNnizqUZqOpEr8UAbWe2G1Xtfd0VCLVoMEF4
 iqGCJtdPHGWKq2yikoeWeDu4rcHa0jC7zkny5kynL8e0pDcpGrGmZOs30Xwvr7prD
 8QOUnJET0k5C/C4EoFCC66Re7/Ss3nQPETfwcYtezx+QJCqxUIHBHiuH+Kw8ngV4S
 L6TXeqqQtZLhtlgGOqM18VmcOppt7ckq4d1mJx8FtFJm9rlGOUdl2H4BFO012+BP1
 8WR3uPx9tPQK+OTR3dWmrjZj/FG6d7xoOTqv3r3DkEze/LRZxjB6YvDME4oN1aQQp
 46Vr1gkTJyz5yWE2Tg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiPv-1uFL2O2Yf7-00SIpm; Tue, 10
 Jun 2025 20:00:29 +0200
Message-ID: <e34abf13-b745-4683-8c8a-52a11e2be2e5@gmx.de>
Date: Tue, 10 Jun 2025 21:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] fbdev/pxafb: Unexport symbol
To: Thomas Zimmermann <tzimmermann@suse.de>, soci@c64.rulez.org,
 simona@ffwll.ch, linux@armlinux.org.uk, FlorianSchandinat@gmx.de,
 alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-12-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F4KyiKjsH3HRtj+5T+o+ZK4dWqglv7z0g4aHCoZsPmSd/+R1Bb/
 XfchOBgsD5qjauAeZ9O/ouwWWYwA4hM9o5iRLhiNBihmI0teahx3uZSvpUDmhzm9XKHSrA7
 LoCzKN8gbhjLP6lJP0tlYGQugX/5auvAfCyfUO6j+My0wfRvcrrCm58e/rRdsaUX9+7xghm
 C/J3WJGLeot4EYuJSLnpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:58kfBBx+dDI=;UEHfL7hOni9M9fj8kQvmaZfi4eh
 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
 34/RLk+jUHA5m1P+V51bL7yrI
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

On 6/10/25 12:56, Thomas Zimmermann wrote:
> Fix the compile-time warning
>=20
>    drivers/video/fbdev/pxafb.c: warning: EXPORT_SYMBOL() is used, but #i=
nclude <linux/export.h> is missing
>=20
> The affected symbol is not used outside of its module.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/pxafb.c | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index ee6da5084242..f15310bf94cf 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -1058,7 +1058,6 @@ unsigned long pxafb_get_hsync_time(struct device *=
dev)
>  =20
>   	return fbi->hsync_time;
>   }
> -EXPORT_SYMBOL(pxafb_get_hsync_time);

True, the function does not seem to be used anywhere (at least not any lon=
ger).
A comment in the file says:
  * Some touchscreens need hsync information from the video driver to
  * function correctly.
Not sure if such touchscreen drivers still exist, but they don't seem
to be in-kernel.

So, if we clean up here, maybe you should then simply remove the whole
function and the reference to it in the header file too?

Helge
