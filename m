Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C28AD41BC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 20:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A9989CB3;
	Tue, 10 Jun 2025 18:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="KuM6ZXAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C246A89CB3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 18:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749579101; x=1750183901; i=deller@gmx.de;
 bh=NrbuGbuk1bvVttInDhsypDkFYpeVPe6bF8+n+kLlTWw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KuM6ZXAvhD9vdJPm7yZ6oC1QETia0hLh/IopAJGzm05dI8qxZnXoXu+DT6ERmgA8
 DNKLKt24+porgocZo0fcT9LfkM0I/Z17IWobz1DTrZFDh88Znq/y9krn0R2UndhTM
 Ov5vQ9DYqxGpCUKyUswLW3Rj24N4V7cRwEGA0CLxBhSfa4jGe5CxeAplL0d6v5HXj
 0ncLOV7M4A6Q8JFWTNUsFk0jHW/C7tMYgvcuvUQYUGZJ8cY7iVfBiIGEb8CscnHNe
 b9kDjddo0fp3hc2jxyMje31vVXMbYMpGEaJZS1t+RzfO1i1oNYwZRhN3DtgRcUHm/
 dXC/9xA3aKEz9K2qpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTN9-1uD8f32ypR-00PtJV; Tue, 10
 Jun 2025 20:11:40 +0200
Message-ID: <a262f5a0-ba63-4692-a84b-216c4bfe5b4d@gmx.de>
Date: Tue, 10 Jun 2025 21:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] fbdev: Include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, soci@c64.rulez.org,
 simona@ffwll.ch
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-3-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KI6UUjLyDXNYqqxBmeP0NmRcY3m0w5rb+nnnPhsKCrySPrbqU0u
 ypbmBWNT/rQqBfMvxb5I3e3K0RI4Tnr/EEr3M4CY1abi0nwT8F7JM7qQ9IS1ttYpDqb5ER7
 FkMnRtlbSbul1+Eyg4HvijQY9qc8gsxdu0coDDmRKdGniLwRsTBG2OItXR1dvRZOvYXmd1w
 efg14dEplUyF66FRvmpKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XXO2wUvUsuI=;/NIrO7nrOq0FfExK93tQUiQpShC
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
>    drivers/video/fbdev/core/cfbcopyarea.c: warning: EXPORT_SYMBOL() is u=
sed, but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/cfbfillrect.c: warning: EXPORT_SYMBOL() is u=
sed, but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/cfbimgblt.c: warning: EXPORT_SYMBOL() is use=
d, but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/fb_ddc.c: warning: EXPORT_SYMBOL() is used, =
but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/fb_defio.c: warning: EXPORT_SYMBOL() is used=
, but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/fb_io_fops.c: warning: EXPORT_SYMBOL() is us=
ed, but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/fb_sys_fops.c: warning: EXPORT_SYMBOL() is u=
sed, but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/fbcmap.c: warning: EXPORT_SYMBOL() is used, =
but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/fbcon.c: warning: EXPORT_SYMBOL() is used, b=
ut #include <linux/export.h> is missing
>    drivers/video/fbdev/core/fbmon.c: warning: EXPORT_SYMBOL() is used, b=
ut #include <linux/export.h> is missing
>    drivers/video/fbdev/core/modedb.c: warning: EXPORT_SYMBOL() is used, =
but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/svgalib.c: warning: EXPORT_SYMBOL() is used,=
 but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/syscopyarea.c: warning: EXPORT_SYMBOL() is u=
sed, but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/sysfillrect.c: warning: EXPORT_SYMBOL() is u=
sed, but #include <linux/export.h> is missing
>    drivers/video/fbdev/core/sysimgblt.c: warning: EXPORT_SYMBOL() is use=
d, but #include <linux/export.h> is missing
>    drivers/video/fbdev/macmodes.c: warning: EXPORT_SYMBOL() is used, but=
 #include <linux/export.h> is missing
>    drivers/video/fbdev/sbuslib.c: warning: EXPORT_SYMBOL() is used, but =
#include <linux/export.h> is missing
>    drivers/video/fbdev/wmt_ge_rops.c: warning: EXPORT_SYMBOL() is used, =
but #include <linux/export.h> is missing
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/core/cfbcopyarea.c | 2 ++
>   drivers/video/fbdev/core/cfbfillrect.c | 2 ++
>   drivers/video/fbdev/core/cfbimgblt.c   | 2 ++
>   drivers/video/fbdev/core/fb_ddc.c      | 1 +
>   drivers/video/fbdev/core/fb_defio.c    | 1 +
>   drivers/video/fbdev/core/fb_io_fops.c  | 1 +
>   drivers/video/fbdev/core/fb_sys_fops.c | 2 ++
>   drivers/video/fbdev/core/fbcmap.c      | 1 +
>   drivers/video/fbdev/core/fbcon.c       | 1 +
>   drivers/video/fbdev/core/fbmon.c       | 2 ++
>   drivers/video/fbdev/core/modedb.c      | 1 +
>   drivers/video/fbdev/core/svgalib.c     | 1 +
>   drivers/video/fbdev/core/syscopyarea.c | 2 ++
>   drivers/video/fbdev/core/sysfillrect.c | 2 ++
>   drivers/video/fbdev/core/sysimgblt.c   | 2 ++
>   drivers/video/fbdev/macmodes.c         | 1 +
>   drivers/video/fbdev/sbuslib.c          | 1 +
>   drivers/video/fbdev/wmt_ge_rops.c      | 1 +
>   18 files changed, 26 insertions(+)

Reviewed-by: Helge Deller <deller@gmx.de>

I wonder why this shows up for you but not for me...

Helge
