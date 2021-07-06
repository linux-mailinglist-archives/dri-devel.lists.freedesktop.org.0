Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6D93BD72A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 14:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934B16E497;
	Tue,  6 Jul 2021 12:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99F689DD5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625565617;
 bh=HfI1fnAl8yXB7R6zw/6uGgLzJrfs1z8CTgu8YasTu8A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=BkOnxp9T9Wh0P6eG47ytj74qUAyy4+KKSnP2TxWwxNaND0RUQ0ZWih0ETAusZdgev
 Jt/PZWBNVZKLipwhG/yc7RsasJqNyItH2xIo5V3GPhxyE+qRw92dmWAXefI471/f/L
 60fj5CUVRxtN5n7ALEbX0qN7DOcYHU1Btc9/uzcs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.79.159] ([80.245.79.159]) by web-mail.gmx.net
 (3c-app-gmx-bs60.server.lan [172.19.170.144]) (via HTTP); Tue, 6 Jul 2021
 11:54:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
From: Frank Wunderlich <frank-w@public-files.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 6 Jul 2021 11:54:39 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:OoEQiM/tnR+cNPyCdrhP49bAjgvwQ+lcL2OS2XXYultpQRZ3iKmx2n0JXV3n3Fd/VHVP9
 URFMBbMlD29B8YWbPuG94J3F5zWccIqeUBT1b3/QLw7EcLA1JrI3PjO+FQx3imeyC8zgfU+KOerU
 SBvcaufgt9H7rbyrAH7vebZLBS9lGqXs77pGRfMkntQEsAfeL8lO7PqFYuVKbfqsm2saOSxPGiZz
 1ywjhxyBlAPnO/j9ixwng5+18VP/dFCoD3JyS/5IHrvnwd1vKJnHRUax54UOu+AonufbuKYhQFcx
 Nc=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F4fG2MG21Jo=:J0alOiYmF7ITdOOv8po0LL
 ZrKSa9p8mWuv6+DjbsPXm/yvezinz6Ap0EBQ6z16UJf9QdulLQ39rEm27vMbYMIudy0WRH5Eq
 2EZ2JfRlcCYs9eEno7UN3FFSI04mT+cf916KEZxavx/U4etfjnV058NYEAh/c5LTria1Lqxow
 FxWCalDuMjuWl+/hmztyDzt34jTquW26FOxgLU1/ji7ciNI0B5KmjrZzgUw0Qpdo/XDUeatsa
 mIXwmZg+UUufIVx9y1ReynZ5XAgnamwgI30KO3YRaDaSMxImt9dF6qGo4VhhglA2d2WCbEwHb
 APJ4bxC0IaOq9+Ba/16hYAQDtQ727d2QPZDCHNweFh9FxXjIkC9Np9G1CtbdGnfbBNfq+WsTk
 Vww5nA08mhN80Wc/8Qw9/nEEOY43BuRbQsZJmx7pA0zaFO2EuVPCs84zgKK+4HzlJIWB9f2rH
 GSkFjsL7vHGLfe5AUgYEmSrp9AUKxYtIdY8rP71lno8LM0VU7atiJ7Q7Pb4KGLNwKjD5IATUI
 UA3xw+IvqdPIUNRKkwJiofyJqVxHRJga7AiBj3qf8WL0d4Nzh4o6wWYqNkxWrUqjH4C5XbZSK
 6pJLZzC7PxU3HhtQmkmox2MiZ1XxAomKko48VEaDr9rk6ZCXR1QyoqyCRHPz+hlDArObxwBKh
 f4j54y3svSGVTBVatFxJyKz8vJoBI0TL79whA1vYKjoSEW6WJKNuXcPMmL9eJK7zq/l4C98he
 sjih16hzLhOO8eiU3aCrChmfiSBmlzXMZpKleQfTOEd+aAn3nNyXpgTEgXgvEJvkoPIt5cJYj
 h20cUnyq1xOBhBQO12bx/cUJKvcagXizxHKfRcYhju0k98fkZ0=
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 06 Jul 2021 12:50:24 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623)=
 on 5.13.

after some research i noticed that it is working till

commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Date:   Tue Mar 30 13:09:02 2021 +0200

    drm/mediatek: Don't support hdmi connector creation


which is the last of mtk-drm-next-5.13 [1] so i guess a problem with core-=
patches

dmesg shows the following:

[    7.071342] mediatek-drm mediatek-drm.1.auto: bound 14007000.ovl (ops m=
tk_dis
p_ovl_component_ops)
[    7.080330] mediatek-drm mediatek-drm.1.auto: bound 14008000.rdma (ops =
mtk_di
sp_rdma_component_ops)
[    7.089429] mediatek-drm mediatek-drm.1.auto: bound 1400b000.color (ops=
 mtk_d
isp_color_component_ops)
[    7.098689] mediatek-drm mediatek-drm.1.auto: bound 14012000.rdma (ops =
mtk_di
sp_rdma_component_ops)
[    7.107814] mediatek-drm mediatek-drm.1.auto: bound 14014000.dpi (ops m=
tk_dpi
_component_ops)
[    7.116338] mediatek-drm mediatek-drm.1.auto: Not creating crtc 1 becau=
se com
ponent 9 is disabled or missing
....
[   38.403957] Console: switching to colour frame buffer device 160x64
[   48.516398] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[   48.516422] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC=
:41:cr
tc-0] commit wait timed out
[   58.756384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[   58.756399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONN=
ECTOR:
32:HDMI-A-1] commit wait timed out
[   68.996384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[   68.996399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLAN=
E:33:p
lane-0] commit wait timed out
[   68.996423] [drm:mtk_drm_crtc_atomic_begin] *ERROR* new event while the=
re is
still a pending event
[   69.106385] ------------[ cut here ]------------
[   69.106392] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_atomic_helper=
.c:151
1 drm_atomic_helper_wait_for_vblanks.part.0+0x2a0/0x2a8
[   69.106414] [CRTC:41:crtc-0] vblank wait timed out

so i guess the breaking commit may be this:

$ git logone -S"drm_crtc_commit_wait" -- drivers/gpu/drm/
b99c2c95412c 2021-01-11 drm: Introduce a drm_crtc_commit_wait helper

in drivers/gpu/drm/drm_atomic{,_helper}.c

but i cannot confirm it because my git bisect does strange things (after d=
efining 5.13 as bad and the 2e4773915223 as good, second step is before th=
e good commit till the end, last steps are 5.11...). sorry, i'm still new =
to bisect.

the fix is targeting to 5.12-rc2, is guess because CK Hu's tree is based o=
n this...but the fix was not included in 5.12-rc2 (only after 5.12.0...got=
 it by merging 5.12.14)

maybe you can help me?

regards Frank

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git=
/log/?h=3Dmediatek-drm-next-5.13
