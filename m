Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A416BD0F9B3
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 19:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0931010E117;
	Sun, 11 Jan 2026 18:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="tJ7FnHsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6F810E117
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1768157567; x=1768762367; i=deller@gmx.de;
 bh=GBHb74sT6wMOr9J9+NredjJJ4qv6kdo2yoWJPEC//qo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tJ7FnHsYnyacSkOfq0j/W8SZlYKe2pxSa0v1U+wWiejXGKTKHMOcbqjKwY/PTh+l
 a0oDvVVve6p2TIuAl2IrH/O/RDSVP6HamXEL/8kQ/r6v4bTJ6k3o6zZPxPzUajPpL
 ADraxZBk9Pk0VyW+yS38d24JgpaonRjfhcun78RyazjvsO363IW47U8gwFF07WOkG
 coaVIkDIBs4KoEs+HY/TaYlIy2tjDqz2w7NHE7+Kc/tNNl9Imj2SDIyd1m1qp8GBE
 nlkH8Q9XOmCAktoAYb/ZCI9f/sJ51pOSjLdu+QZ2Y/5BQeV8z2yEr17Yxm+ipcX2O
 KIIyuJ4y81pOdJZRyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.120]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1vILBk3jSE-00Tb9y; Sun, 11
 Jan 2026 19:52:46 +0100
Message-ID: <3bb1ed8b-4aa9-4cdb-b70a-a0dd3f9b2ff9@gmx.de>
Date: Sun, 11 Jan 2026 19:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, gregkh@linuxfoundation.org
References: <20260107044258.528624-1-chintanlike@gmail.com>
 <20260107044258.528624-4-chintanlike@gmail.com>
 <aa922030-b0a1-4503-a3c0-7ce4c36c236e@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <aa922030-b0a1-4503-a3c0-7ce4c36c236e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rETCjRfTBIPIlMFcEpUehrrH6egdLqXI0k6hkhL3sHDDJ08rdY+
 2tZlKQQE4pxv35V4k/n7mJGoSO8pOgbyMlP2Xsc2OobhJ9we4wLsSl/Fv1Vu8E21Pk6+m1s
 8tF6T3qlQTbYQOFyB2YFPr7oiNybGUnr2G3h9/M+TDeRZ6EmTdX05YDk5rL9r5I5CJZWIzx
 p1wl4KEP6Ta2gy4I6Vjrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZpZJP4vTkM8=;6k4WXkGJH9r091zvCTB95udC0Tb
 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
 vVMITZeA=
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

On 1/7/26 08:33, Thomas Zimmermann wrote:
>=20
>=20
> Am 07.01.26 um 05:42 schrieb Chintan Patel:
>> omapfb provides several sysfs interfaces for framebuffer configuration
>> and debugging, but these are not required for the core driver.
>>
>> Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
>> optional by using dev_of_fbinfo() to obtain the backing device at runti=
me.
>> When FB_DEVICE is disabled, sysfs operations are skipped while the code
>> still builds and is type-checked.
>>
>> Suggested-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

applied to fbdev.

Thanks!
Helge

 =20
>> ---
>> =C2=A0 drivers/video/fbdev/omap2/omapfb/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 3 ++-
>> =C2=A0 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c=C2=A0=C2=A0=C2=A0 | =
18 ++++++++++++++----
>> =C2=A0 2 files changed, 16 insertions(+), 5 deletions(-)


