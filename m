Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33F53C2209
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 12:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4486E9FE;
	Fri,  9 Jul 2021 10:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00E46E9FE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625824929;
 bh=XFj6g3GV+RpeHb2OO2l5lG3AsAUjp5do6o9LF+YSJck=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GC0FDUcYNGJwlr6QcOQJU73N1T6ojetjTuhIyeaPB0nJ419Nt+4Lk4b/IZq4eo6zG
 a0sRcIjvuVPQE0k+udQcYWRwOoCDFx78g+ICWOZLdLE8eh7LbNfR85LQVdv+v9unaF
 4+XKKuCZycAijDJ38RFR0sFpuA2rQQTnW7J5TRFo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.72.148] ([80.245.72.148]) by web-mail.gmx.net
 (3c-app-gmx-bap43.server.lan [172.19.172.113]) (via HTTP); Fri, 9 Jul 2021
 12:02:09 +0200
MIME-Version: 1.0
Message-ID: <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>, CK Hu <ck.hu@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Aw: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 9 Jul 2021 12:02:09 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:xfGWEfj3g2j1ZQn2NIauZvVMn1yO+K6vlibdeSVOTRhT2GVkS1R6Wb4ajLYwj6+RE4MRo
 qg1BazB20yE/8qutYi/n/Kz0lJNPQm8PPZrsgHowL6LPhJyZKlNagxEy1ApWTrGbZH8fiUodnTAq
 aRIbXJw5b1lut73GYFIgrYXRghtB83zEz3vw/EeKXYBkXmB+kr72JQyeF6Nv7xRBi1HXnxFP2Uyp
 0sr38CC/D+eQFc3pvuVgMjXyNmqTZrtnRvgAQFL9n20dMjL9F7lv3M6VfLMJZL9l5kadgrT0T1G2
 rY=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oTgX9metJl0=:fP1Z66hDxQ+R06m+siar7S
 Gxi4wGlQm9OgVAcj4hfLiS8+B8lW1bjE3NY7oVppsaNGSAaxh3mdERIV4rA9GLaN+O3ebBbKR
 XKaQ+cjD4sm42CImorom7urZ6inzad7xq2qqi9mjQxGWunQir9tkNUbN0gd1kjF9SQf3Q7Yfo
 t7QXqR7zDDdtmnCTTMvBqv6heNTu9W02gZNOKIa2CefT8qc/HxP+4von4gRLYb2bILGV7I7Fu
 xR/vVP5EpylPhWCrq6PrBkRpYHuMFWCVnfA9+/qi6CShbXhJGUM8YVUHYeI+Mwml4GthsSlCY
 YdGudpSDlLXmjuUGkB+/490PYK9zz0RfQfn2W7USJ2s+FRFUZZhYoC0a4vn3Ok7xH8osvUoCN
 tQ3m63EmKgaFJJNCPvrKXYZtEpGXG0KhWHBQunngBYPWwBBNmr7FBE4MgGfUqcDELinV8CyLb
 fBUrx5ZP+wA1PXKz/5MVdsw4nVoE4kZORe+3Ea2N4WyJ7g9nqlUfiYsU93Ru22KhHVd1eROK/
 BJKB47Ae99bAdq/xNJC26RkEVZFV8IFcUqcYVGmqp2CwNlGKe7GUnQY1I4C7Mf/k+baXpFgSr
 tjzu55ZNPnGcV6ok/iNdvGmkEy9G3d1509X+9HSRhCxhvTcqtKA74SuMWO8SfB5NsFI5rtRMG
 l6BxXKrqMo9FnKU5Tyq08zy1lRsK+7mxiBXy8+AWvnGEbal+mVL1/ev5WlE6avbk+yvo0yD4O
 A/UpNzAFPGbhdTWRVQDNjKP+BFSfKqvRykFHUrS98aOAfzych5UfyudEfphP9OXhXhvroYp+Q
 y+VQ2aeY0iaEHtOVZHDmn0j2JnnjDFtc7WSyTkVBXW++OpYlZ0=
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
Cc: chunkuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

i've found it :)

hdmi-problem is caused by

commit 440147639ac79f699a4eb9811d0bc39d3cc815f4
Author: CK Hu <ck.hu@mediatek.com>
Date:   Wed Mar 17 19:17:10 2021 +0100

    soc: mediatek: mmsys: Use an array for setting the routing registers

but i cannot revert it alone, but after reverting all mmsys-patches hdmi w=
orks (ovl irq-handler called)

$ git logone v5.12..v5.13-rc1 -- drivers/ | grep 'mtk\|mediatek' | grep mm=
sys
060f7875bd23 2021-04-05 soc: mediatek: mmsys: Add support for MT8167 SoC
1ff1270fca33 2021-03-30 soc: mediatek: mmsys: Add mt8183 mmsys routing tab=
le
440147639ac7 2021-03-17 soc: mediatek: mmsys: Use an array for setting the=
 routing registers
ce15e7faa2fc 2021-03-17 soc: mediatek: mmsys: Create struct mtk_mmsys to s=
tore context data

git revert 060f7875bd23 1ff1270fca33 440147639ac7 ce15e7faa2fc

and after reapplying them one-by-one it stops working on commit above (440=
147639ac7)

@Dafna can you confirm it solves your issue too?

btw. watchdog issue is caused by

commit bbece05c0d3a96817483e0b249ad1e302ba95117
watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system =
freeze and it doesn't reboot by watchdog problem

have already contacted author

regards Frank
