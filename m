Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612093C1605
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F386E8DD;
	Thu,  8 Jul 2021 15:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE5A6E8DD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625758260;
 bh=nG0rFzyWwxI3NQHIWUD7r321QKdUVY+N3Y6jzsdRrnA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=S5SAzrqyQJbsGmcURycPWr0syeS93jfLxJc3Tin/BtqK1DmT+5jFUv2whdu34S5B3
 3AZbIbQIxfBrasNI+NoZZfYi8Xv4hpB5qNT+8v7DSI0nieqBr2fav6G6aZ5VYuA1yd
 AgbWjeo+wPkfHw9SCLkfkTOWd+zrAEZcVM7NFL+0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.159] ([217.61.147.159]) by web-mail.gmx.net
 (3c-app-gmx-bap19.server.lan [172.19.172.89]) (via HTTP); Thu, 8 Jul 2021
 17:31:00 +0200
MIME-Version: 1.0
Message-ID: <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 8 Jul 2021 17:31:00 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:wiHKJ4pZw+i4+wRHC9BOA/fmvr0HJrbs+S04dC9RHlZ/rQdWr6dVlmhEeNLG1lN7/H4GT
 mPhnuqZc9y1dxElbjPUNI7dfnsS4rf87tw1G1CpmS7ZdbSFmK57SjekTbtefPEVY9cxHBTvGLRbk
 3fB/KFrCxX+Ug0D0oJ06IN0ZT9I2yfEgtsiX6JVX5xiWIfVDi5eWxL9hYbCmnDgyJSCSw2BPVjFc
 GhITtzk/1X9uIssmMVja+Va0pQp6+ijeW/X3xULfbXJyklzULp+60CGtC4REKiUA/ZLuC4V86qhO
 qU=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vw9zW2hsmd4=:hnMCvQBqmELYzsYTSfnv6K
 esoWwP7uwrtKpHZ4GnnPSZGmZ2VmGCNBtQqc0QXaw7hkF6kFXrlBkgihXyqebUs38Wr4tpGFZ
 tmv30lpPfUeC7wlNV7EGAmY4vFbWBKE8LU+3IIA6JZSriijkOZLGl6614zXxskbazuK8NbnPK
 rIZ83b6dg3R57xDsGgAwRQWIzFxNj2usIgvTnEahaML8sbQ1v2oQZSbdd2B2LTY1ms3CloHzK
 HrmSrujpl43ivTNrxyhmnNvNLF4XxawW2N+nuV6YHOdb3oddICQZqS4cUSm6zfHi7QqAzgEBz
 MJ3jE+kRRbGsxLXG18l5x5hYk/ea+aYWdz8z7TOoqWOFisdNZUb3xxQOtQ+opUsboD0F/6NXq
 XQYQXGHWLSEWTn8WBRHwHUElW83dsbN1yrRtkd4uEiWj28icIBf+72jiZYG7fBZCnwZHCfC4P
 ruBhz5YE22r0UP9Ic8bv0L/1h89y3D2f9Yr5Ht59binUNP3aC4RzXIzuHEMfV2flOE2ODwFlb
 0Ho4A9fsy/9cw+rnLI6fl+H1fT4bDx8PON7aVW+mRrToQmpKbtZV04l3QFn548VEnkWEXiEyc
 mQK9oKa+D2lHd2WmPsa0JTVG49DbFezYOSyCmbGBFS4HlPAL9J1CaLPAHV0LacGLx4GspP3Hi
 LKLsbV026QLgOc2QzbYOe1ABqwBtsNo8O24PF1WUBguC3WZMWWN+ovDCRIj2RX+Inwy5bBKn7
 Qs+Ou7O3XfNRlGd2AHh+NznUlVlLgCa0trrWzQa5Nv5h1uTTzFfSEiNYufIHTurDSN5Aw2xb4
 rJt55pnWq52brszm5L3osPN9GOnQY3hG9Ez7Ekoq+hTc0fC13Y=
Content-Transfer-Encoding: quoted-printable
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Gesendet: Donnerstag, 08. Juli 2021 um 11:35 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> i guess not, but is watchdog somehow involved? i ask because i see this =
on reboot/poweroff:
>
> "watchdog: watchdog0: watchdog did not stop!"
>
> i see this with my 5.13, 5.12-drm (5.12.0+mtk/core drm-patches) and 5.12=
.14 too (hdmi is working there), but not 5.12.0!
> that means something in drm-patches (mtk/core) breaks watchdog. maybe th=
e recursion mentioned above?

have to correct me: 5.12.0 shows this error too, so error not caused by dr=
m-patches, but i guess unrelated to the possible irq issue causing hdmi no=
t working on 5.13 (wait-for-vblank/page_flip tracebacks)

i'm not aware who is also involved in the problem, so i want to avoid send=
 people to the wrong way :)

regards Frank
