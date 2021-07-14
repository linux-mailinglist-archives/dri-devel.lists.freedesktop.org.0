Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3943C80DE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B166E1D5;
	Wed, 14 Jul 2021 08:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDB36E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626253159;
 bh=2PfUJGsN5axf79lyK53KIfWRTeJoSiAoNWHeXAJAm5k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ABY8yG3fDvHwhdrriVKsu1KyjPfUEH6xW/YvrAHOvujzOyzGRKiy2dBPle0lASCBo
 FTWMIPLDMSj9FHlaeVcQrgMGGrer/+CivY/XZabcjrajrSEg47XuH1fqxYNRg+JEt2
 SiesIqzE1N5MQ+lQmUEQdMz5rxcbFOtjxgepeOng=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.136] ([217.61.152.136]) by web-mail.gmx.net
 (3c-app-gmx-bs01.server.lan [172.19.170.50]) (via HTTP); Wed, 14 Jul 2021
 10:59:18 +0200
MIME-Version: 1.0
Message-ID: <trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01>
From: Frank Wunderlich <frank-w@public-files.de>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Aw: [PATCH v6 00/11] Clean up "mediatek,larb"
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jul 2021 10:59:18 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210714025626.5528-1-yong.wu@mediatek.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:41hJo/XYrZUHIeMDY07beGhJR05vkLxAQITh9O1JknXiCDIPb9AnREzqsqzHICRgoA4aX
 +VAlF3wwHQHbYa/GGCgJhTDtD0i0iZcray5tchmyODDSQBszTPJ8Cg9gg9LgxbFhLS4m04MCLN53
 ePdYFNXzAkr1Xvyf64zJFgpHrtCx3fhmT3LqyYxoT0nRDwTxV6UVaYlwijr3k0aNzY44Q9GNsnWw
 Rl3go4EBz7ULxN81eHdqgXx4wZX5M3IQyIamHA+xF+0G23a388+8tJIl3y+MV5whXMki3Iq+biLW
 UE=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xahsKhf98lg=:Wfje5JxpoANcTNbcmTtKVK
 VQ+rHW0jjkDG7cM+BrzCqPqYP/W7Q1dk67RH/jENaakUoczFwa3fW3FrkGIkE8iEXSDP0y+iX
 Ldkppn4aANbjhSEDBEcwvT/JR4ia055MyjoHgIDw88+R+pZWLJS5VDabeYDqYbhwvTccliZyp
 5ZOuEK9y2I+3WEqlIALyq4H90JQRlgfv2JMXK56pxhm/7USMsR20jYWECfsusG0aKbfWKSz5l
 DweHDC9nwaC6TLxhY+erDIbE15qyYxQDlB3mCOEle1bWCQqyOpBxKxvqHPkumeUOCKawIEp+N
 wdipQ94TPhtjo1lRZS5NeaSPWtZb4TzF0NFu+y+MjaSaC9mfYnPsZ7fBDfdYIbpWV6mWQhsxD
 wLwxpA6JR7FJa8k18pWGpAdTza2yTr7xbLHQmSVtTQ6xb7z3THroUiIXpu9eKVDCgfVnNXN4k
 gXyfw7FdiODoTHjK2YhrS2kkJnqop7Ax4FkHKh6zy+U2b0n26wbcmU0Wfk40t5km0pwxw3f0q
 V4jMISUBOvceIBWVNxuZMPZoeeNJ/1lseOLpWgHlbK/WW6jpCTsRrH0JNTzxgM6S+e3jHL6IV
 qyt6ZSNcW2Itd4NQsDmMhdkCuz50nuyBKhtqniFkzqPf0W0aXDbpGcdmCtEm9oLaJ+QVfj2T0
 KXiq7AM4wtYtVBe7EGPLR23WdO5yz7fSX4QQl0Q5E8wUUwWSGuVT84nIwpQjI8mhzfj1ilUg9
 NEVw5SgEn/3reKMV4uhqInc6YYW6Lg5WwQCEP7w6nuVvmv4BZPcvE0PY02uVNxvYpTMQ79gVP
 w5SwTV/kfrKGrTloRp4qsuf31tzQ2KQVg0453IpWqKtLrpRlpM=
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
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, yong.wu@mediatek.com,
 anan.sun@mediatek.com, acourbot@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

sorry this (or the 2 depency-series) cause a NULL Pointer deref in iommu_g=
roup_remove_device on mt7623/bpi-r2

i wonder why on bootup a cleanup is run, but have no hint about this.

since "dts: mtk-mdp: remove mediatek, vpu property from primary MDP device=
" all is good, i guess problem comes up while removing larb with DT

this is backtrace

[    6.274465] PC is at iommu_group_remove_device+0x28/0x148
[    6.279877] LR is at iommu_release_device+0x4c/0x70

[    6.674347] Backtrace:
[    6.676797] [<c0c9c37c>] (iommu_group_remove_device) from [<c06bf028>] =
(iomm)
[    6.686221]  r7:00000000 r6:c06bf04c r5:c0d7a1ac r4:c21fc010
[    6.691883] [<c06befdc>] (iommu_release_device) from [<c06bf064>] (remo=
ve_io)
[    6.700689]  r5:00000000 r4:00000000
[    6.704265] [<c06bf04c>] (remove_iommu_group) from [<c0733434>] (bus_fo=
r_eac)
[    6.712725] [<c07333ac>] (bus_for_each_dev) from [<c06bf658>] (bus_set_=
iommu)
[    6.720753]  r6:c331f440 r5:c1406f58 r4:ffffffea
[    6.725370] [<c06bf5a0>] (bus_set_iommu) from [<c06c1e88>] (mtk_iommu_p=
robe+)
[    6.733484]  r7:c32db0b8 r6:c21f9c00 r5:c331f1c0 r4:00000000
[    6.739145] [<c06c1bfc>] (mtk_iommu_probe) from [<c0738c14>] (platform_=
probe)
[    6.747176]  r10:c21f9c10 r9:c2496f54 r8:c14623b8 r7:c14623b8 r6:c1405b=
90 r50
[    6.755012]  r4:00000000
[    6.757544] [<c0738ba8>] (platform_probe) from [<c0735968>] (really_pro=
be.pa)
[    6.766006]  r7:c14623b8 r6:c1405b90 r5:00000000 r4:c21f9c10
[    6.771667] [<c07358a0>] (really_probe.part.0) from [<c0735cec>] (reall=
y_pro)
[    6.779866]  r7:c21f9c10 r6:c2549e74 r5:c1405b90 r4:c21f9c10
[    6.785527] [<c0735ca4>] (really_probe) from [<c0735de0>] (__driver_pro=
be_de)
[    6.793984]  r5:c1405b90 r4:c21f9c10
[    6.797560] [<c0735d30>] (__driver_probe_device) from [<c0735fa0>] (dri=
ver_p)
[    6.806543]  r9:c2496f54 r8:00000008 r7:c21f9c10 r6:c2549e74 r5:c14c6ec=
8 r4:4
[    6.814291] [<c0735f5c>] (driver_probe_device) from [<c0736410>] (__dev=
ice_a)
[    6.823448]  r9:c2496f54 r8:00000000 r7:c21f9c10 r6:c2549e74 r5:c1405b9=
0 r4:1
[    6.831196] [<c073635c>] (__device_attach_driver) from [<c0733540>] (bu=
s_for)
[    6.840007]  r7:c14623b8 r6:c073635c r5:c2549e74 r4:00000000
[    6.845669] [<c07334ac>] (bus_for_each_drv) from [<c07357e8>] (__device=
_atta)
[    6.854044]  r6:00000001 r5:c21f9c54 r4:c21f9c10
[    6.858662] [<c07356e4>] (__device_attach) from [<c073662c>] (device_in=
itial)
[    6.867207]  r6:c21f9c10 r5:c1406f58 r4:c1406ca0
[    6.871825] [<c0736610>] (device_initial_probe) from [<c07346dc>] (bus_=
probe)
[    6.880454] [<c0734648>] (bus_probe_device) from [<c0734cc8>] (deferred=
_prob)


bisect shows this commit as breaking:

Author: Yong Wu <yong.wu@mediatek.com>
Date:   Wed Jul 14 10:56:17 2021 +0800

    iommu/mediatek: Add probe_defer for smi-larb

    Prepare for adding device_link.

regards Frank
