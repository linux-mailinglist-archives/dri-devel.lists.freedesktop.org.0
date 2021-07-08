Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49843BF6A9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 10:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FCD6E880;
	Thu,  8 Jul 2021 08:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348546E880
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 08:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625731244;
 bh=wA9AHeLKWQAifBhqJObrOYwNMWaU97DuzYK45G3UaqQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DknnnvKv5exA5u8/k8OoK3JdgfZQWpBWxm7uXEV+6fnx9mROFib0fMC6TgGl7vZ+a
 U8MJ40rzDJu6kKAaNx3y+/R/n8PMTvH3UZHf9IesNzDYeARAFqNn2fdPKw1YPYg4kk
 O8t5cq+SJIzl4OTZkI7uVHxarJgftBQUr6Nww8lU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.159] ([217.61.147.159]) by web-mail.gmx.net
 (3c-app-gmx-bap19.server.lan [172.19.172.89]) (via HTTP); Thu, 8 Jul 2021
 10:00:43 +0200
MIME-Version: 1.0
Message-ID: <trinity-08e89dce-23c4-42e8-8a66-ddf13921994c-1625731243898@3c-app-gmx-bap19>
From: Frank Wunderlich <frank-w@public-files.de>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 8 Jul 2021 10:00:43 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:nHzkuOoJrMHqh2Je6202/sBwJf5zSVTWs7E5v12F+xMyvzw3i4BUnkK3I3U/MXqTZNNoj
 zFQ5iBqX7t3w2ceLqdmd/BmixdXFdfwC/ihhJvNvYRWJ1uSjSKw+qRgxwHLPAe8AACOFOz4DagUU
 thXAGPauMG4wXnCn2tmRURrdHiiGNs65eFEftSUn6S8qL4n+xviT2+L/mIpdSz19xKVw4Q3Q0Qg+
 XpnquKPs8FROWy96M+JiAaBq4W8aX5VMmjbJjRE5qUr6x8H/AoyoToiwtXtRxhtzvvOGGRPEy3eH
 rM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5nSblhn4RPY=:aIB/8XjVNnqEHS5OsgNem6
 SFMEIO8pXoqqzF5sdiF4eSPztLE/P2loJC6Fev1sy1LcTq9ZGOkQ6dzonjft8gT7qrhPS5SZP
 WJ4hOLO0eGsbKpLnBMExEJvFjoAss2fLWrTPFHDg5DXGDaHW8tlHrcHsYZ2EA4KF59JM11Dya
 Sx+Fw/whu3ttSYwxByb95d9i8qNaCs9pWQN+1u92uSujV1kRDgOT3FsDNoRKoVVhKolqKZDk+
 79RPXG8S536zSY/4cTbzbaSY6156R7ysEfO6+CeYuxukn3zzKwcbqED51Or1dmfz2/VqJZewM
 JAPw4ExE3jFb23k77M1wVZBIO+xL2nFE9FUvmGXODfjxFEHS7ZZgmdBL25MZFMATpXTguSElD
 KJx4dk0M6WuEm0Ona+lpztZAx8isqq2jWnN45OpsfVKy1gWj/HVKfqdoPXCNnx2i4NChJwCmm
 0IvDOa68O8a5k6yEQlmVptmnFWLot+jcahzigF2TXeOKS+p3pOaZ+qgOlL/rT2aJr3Ur0N5JD
 bAXqUSvb2H78hFgQrmOpe80P0kxLan2Jc6MHKChQNkD584Cf9X69FRZrvAj4Ul5ggO5EfDu3S
 ipMfBKCu3c8ISYgZ1L6DgjUsfIbsIyVp52+Won0fbC91vcFpJOVG+/Wp6Gn4OFGTijn5JquiN
 fenLnHl2ucUN1fCa1TjGzYtgyn8f2UlyIMFaHZNMmmconZ1HAx2tDguxTDwAk6gNxIkFgo0dE
 BDipom+LSe9YaG09trlnFF4cGxO68AZeztI3E4Dh83+5wHAeZdFj+dxyakjPy/PRVMKlHAKyp
 ChF6nPvX/9aTWLMy6OmS2CXikfAloLSmZTqeLPHHlnIN7KmtcY=
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Gesendet: Donnerstag, 08. Juli 2021 um 09:22 Uhr
> Von: "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>
> We also encountered that warning on mt8173 device - Acer Chromebook R13.=
 It happen after resuming from suspend to ram.
> We could not find a version that works and we were not able to find the =
fix of the bug.
> It seems like the irq isr is not called after resuming from suspend.
> Please share if you have new findings regarding that bug.

Hi,

i have not yet found a way to make the commit-history flat for running bis=
ect without the issue of disappearing childcommits when mergecommit is out=
 of bisect scope. so i tried to start at working 5.12.0 with mtk-drm-patch=
es and commits from drm core (i hope i have catched them all) by cherry-pi=
cking the single commits.

c24e104c26aa 2021-06-09 drm: Lock pointer access in drm_master_release()  =
(HEAD -> 5.12-drm)
2aa9212803a4 2021-06-08 drm: Fix use-after-free read in drm_getunique()
23b8d6c3be47 2021-04-08 treewide: Change list_sort to use const pointers
c1e987f51f06 2021-03-26 drm/dp_mst: Drop DRM_ERROR() on kzalloc() fail in =
drm_dp_mst_handle_up_req()
2176a9e962be 2021-04-01 drm/drm_internal.h: Remove repeated struct declara=
tion
fc5d92c1485d 2021-04-08 drm/syncobj: use newly allocated stub fences
23a03d271e87 2021-03-29 drm/displayid: rename displayid_hdr to displayid_h=
eader
44ef605cb08f 2021-03-29 drm/displayid: allow data blocks with 0 payload le=
ngth
bbdc0aefd1b5 2021-03-29 drm/edid: use the new displayid iterator for tile =
info
1ee4a22d671e 2021-03-29 drm/edid: use the new displayid iterator for findi=
ng CEA extension
d9b8c26b8ddf 2021-03-29 drm/edid: use the new displayid iterator for detai=
led modes
d9e95df8adc8 2021-03-29 drm/displayid: add new displayid section/block ite=
rators
2dd279949358 2021-03-29 drm/displayid: add separate drm_displayid.c
bb1a3611abc1 2021-03-29 drm/edid: make a number of functions, parameters a=
nd variables const
0b18f5b98c71 2021-03-23 drm/dp_helper: Define options for FRL training for=
 HDMI2.1 PCON
16fbc25ab84b 2021-03-25 drm/mst: Enhance MST topology logging
bb93ad6ab4e4 2021-03-26 drm: Fix 3 typos in the inline doc
27d30189b178 2021-03-22 drm/sysfs: Convert sysfs sprintf/snprintf family t=
o sysfs_emit
04ad4ed36cf2 2021-03-18 drm: Few typo fixes
b8821cac052f 2021-03-13 drm: Add GUD USB Display driver
d3df1b84b9ff 2021-03-13 drm/probe-helper: Check epoch counter in output_po=
ll_execute()
298372a0cda4 2021-03-13 drm/uapi: Add USB connector type
040c9022809d 2021-03-30 drm/mediatek: Don't support hdmi connector creatio=
n
7c6582b23551 2021-03-30 drm/mediatek: Switch the hdmi bridge ops to the at=
omic versions
b1b43d5948b2 2021-02-03 drm/mediatek: Add missing MODULE_DEVICE_TABLE()
fe5a0ff82cfb 2021-03-13 drm/mediatek: crtc: Make config-updating atomic

result: it is still working. so at least they do not break ;)

have you found any irq-related message in dmesg (i have not found any irq-=
error/warning-message)?
how have you traced that?

can somebody point us to the interrupts used for pageflip/vblank "requests=
"? in the wait-chain i do not see them,
it seems it is called asynchronous and wait only looks at a state in the c=
ompletion-struct

i have the issue on bootup, i see only a purple screen instead of fbcon/xs=
erver and the tracebacks
on serial are very annoying  as they repeating every x seconds (maybe chan=
ge to WARN_ONCE?).
But after a while it seems to stop.

imho we need a way to make the history (temporary) flat (remove parent-inf=
ormation from commits to merge) so that bisect have only a list and not a =
"tree"

regards Frank
