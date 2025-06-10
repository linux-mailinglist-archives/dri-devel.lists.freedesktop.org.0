Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF41AD41E8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 20:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8359810E5C9;
	Tue, 10 Jun 2025 18:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="AOq8jjPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5481D10E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 18:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749580036; x=1750184836; i=deller@gmx.de;
 bh=6XSTLqc3ZsRMnva5gOH/8VG8WBRUP22hmEzImMMdsus=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AOq8jjPlWcwRD0gIjV7PkhtvDh1FxXeXDQSnRhrkbifguhYTPCntBnpFjZMeAERH
 tc1OIlGMARsO+5WaRb7jWDN7voYWodVpyFT+kYiR8vKtwOYIwCJlRKzms4RHn8XKp
 whsqq2AO13uHfxoRQgrNtH32DhGWKwLdFbuDTri8vaKm2inhjkhuJk2xVc1f9V24N
 vtKVUFKO2yd0jm5T1vJeOTy/t1u+w2DakpumP+kaTsEzfEKxoGnQ/nZS59pf24N0V
 5g07cJ5cjqJLFAeEaUWmcWKguvRN0pye/s12ZuO4gqM4t+tzW0ZWuKTE5IKg+iFkF
 9CaRVS0W61eOndSqtA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJlW-1v8GPY0gvk-00mLxp; Tue, 10
 Jun 2025 20:27:16 +0200
Message-ID: <28be5aaa-a1da-4ad7-aab0-45d51a297e97@gmx.de>
Date: Tue, 10 Jun 2025 22:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] fbdev/matroxfb: Include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-7-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7tL+d+YCXffxyvw2eM+kVpWAJ7b9zgy90/9mE9HenMfcroBZr03
 fJSLLdYRi1wbSzJlCwtKIicztKwc04pbAqRuuXq0BLg3lgRFVdZPcjBo7ZIJWaqrZDUNq6y
 Sud8uYgT3SZYEOoUYeASxs+6eLbAzHKYAXbH6FMls4yan33tVKO98myHjSIoRayIBeFJJGE
 y5ggZCTpPezQZC3Fm1Ilg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YWln3riS1o8=;YMlR74X2VIqxpp5rbak8bsWzY48
 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
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
> Fix the compile-time warnings
>=20
>    drivers/video/fbdev/matrox/g450_pll.c: warning: EXPORT_SYMBOL() is us=
ed, but #include <linux/export.h> is missing
>    drivers/video/fbdev/matrox/matroxfb_DAC1064.c: warning: EXPORT_SYMBOL=
() is used, but #include <linux/export.h> is missing
>    drivers/video/fbdev/matrox/matroxfb_Ti3026.c: warning: EXPORT_SYMBOL(=
) is used, but #include <linux/export.h> is missing
>    drivers/video/fbdev/matrox/matroxfb_accel.c: warning: EXPORT_SYMBOL()=
 is used, but #include <linux/export.h> is missing
>    drivers/video/fbdev/matrox/matroxfb_base.c: warning: EXPORT_SYMBOL() =
is used, but #include <linux/export.h> is missing
>    drivers/video/fbdev/matrox/matroxfb_g450.c: warning: EXPORT_SYMBOL() =
is used, but #include <linux/export.h> is missing
>    drivers/video/fbdev/matrox/matroxfb_misc.c: warning: EXPORT_SYMBOL() =
is used, but #include <linux/export.h> is missing
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/matrox/g450_pll.c         | 2 ++
>   drivers/video/fbdev/matrox/matroxfb_DAC1064.c | 1 +
>   drivers/video/fbdev/matrox/matroxfb_Ti3026.c  | 1 +
>   drivers/video/fbdev/matrox/matroxfb_accel.c   | 2 ++
>   drivers/video/fbdev/matrox/matroxfb_base.c    | 1 +
>   drivers/video/fbdev/matrox/matroxfb_g450.c    | 2 ++
>   drivers/video/fbdev/matrox/matroxfb_misc.c    | 1 +
>   7 files changed, 10 insertions(+)


Reviewed-by: Helge Deller <deller@gmx.de>
