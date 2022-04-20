Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB750880F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868C210E845;
	Wed, 20 Apr 2022 12:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFCB10E127
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 12:24:27 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220420122424euoutp012c13531fe2948ca260164394a39f9413~nmlHfPlyM3248332483euoutp01B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 12:24:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220420122424euoutp012c13531fe2948ca260164394a39f9413~nmlHfPlyM3248332483euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1650457464;
 bh=a7mDYN8T8kYVIenowmvqJuXqtFIk16SWMAV9QKDArdQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=SZnRxLJ2PqeTLccvxJOLXfOiUTOkbObPs2FwZugbjP888ZgoN1Zasx5CW5iV0C7cY
 jpZH7whYFmukX0A57zLmBZjlambRGzC5+ysJesapC/YW6P0jwiwOHl2BXXNDgSSzvY
 ZjJEElLVhNZV6v7/riVrTFaJCybXzQEfEYFsl5fw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220420122424eucas1p17493a0ec12b3bcad113815f99aebd218~nmlHO5lep2507725077eucas1p1S;
 Wed, 20 Apr 2022 12:24:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 68.77.10260.87BFF526; Wed, 20
 Apr 2022 13:24:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220420122424eucas1p2c64c3f397e5f590b6c4fb83e18cd1dd8~nmlGyCro13227032270eucas1p2j;
 Wed, 20 Apr 2022 12:24:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220420122424eusmtrp1b2d5b36842f2568c24a3cbcb95ee7db7~nmlGxH7hQ0115601156eusmtrp1v;
 Wed, 20 Apr 2022 12:24:24 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-62-625ffb78abd5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1F.9C.09404.77BFF526; Wed, 20
 Apr 2022 13:24:24 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220420122423eusmtip26846f8aa890a82a09c9a1d883489e0ad~nmlGMPfDj2219222192eusmtip2X;
 Wed, 20 Apr 2022 12:24:23 +0000 (GMT)
Message-ID: <eb60d82e-f948-d33b-2ab8-b0b29266c82a@samsung.com>
Date: Wed, 20 Apr 2022 14:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH] drm: bridge: panel: Register connector if DRM device is
 already registered
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Robert Foss
 <robert.foss@linaro.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <Yl7zcdYfkQlv/bsj@pendragon.ideasonboard.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djP87oVv+OTDDbtULToPXeSyeL+4s8s
 Fv+3TWS2uPL1PZvFl00T2Cyez1/HaHHyzVUWi86JS9gtDvVFW3ya9ZDZgctj7cf7rB7vb7Sy
 e+z9toDFY+esu+wesztmsnos3vOSyePEhEtMHneu7WHz2P7tAavH/e7jTAFcUVw2Kak5mWWp
 Rfp2CVwZCyYWFmzRqrh3bR5LA+M85S5GTg4JAROJ29u3sHYxcnEICaxglGjpO8UM4XxhlPh0
 5DAjhPOZUWLjk79MMC0rf81kg0gsZ5TYPXEtE4TzkVFi2aq77CBVvAJ2ElMa/jGD2CwCqhLX
 599lg4gLSpyc+YQFxBYVSJKYu+8eWI2wQKLEzG03WUFsZgFxiVtP5oNtExFIkPi/7CrYGcwC
 W5kkFjw6xwiSYBMwlOh62wU2lFPASuLC1QnsEM3yEs1bZ4M9ISEwnVPiRetzdoi7XSTmnl7F
 BmELS7w6vgUqLiNxenIP0EUcQHa+xN8ZxhDhColrr9cwQ9jWEnfO/WIDKWEW0JRYv0sfIuwo
 cWfNS1aITj6JG28FIS7gk5i0bTozRJhXoqNNCKJaTWLW8XVwOw9euMQ8gVFpFlKgzELy/Cwk
 v8xC2LuAkWUVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZGYEI7/e/41x2MK1591DvEyMTB
 eIhRgoNZSYQ3dGZ8khBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHe5MwNiUIC6YklqdmpqQWpRTBZ
 Jg5OqQamKp4p+9jshTp2d4jx9ZTe544XEttt01Khd1rux3uJ/nvrA5n3nzYIm1tRtMLttsbL
 4wtUnVc0LrKSmbTX6sqqu0G1/lUP+vJmZy1bw+e8a/ZPFl2ficHTJs5tl2gu2M1x21kyOfaA
 61bDx3su7t8wcSP7n0PCp+dfmrzokPXXxM0Nnx8ud584fb90ZYTjl3YNr3qFB+3z9ddl2hsZ
 HwsVYZtZvlRA+2nzj2cbTl6ScOeJUfk83UN9g6LHwVgVxef9b/fO3WAapWflqLFg1ZHeK8Hm
 56a8ynyhNV2WOXu51dELHGHzm9hlEwWMasUX/lZV2i6QEtRtd3JCypsnGz4cOXS7fJ7Rq7eq
 /6xl5HbsV2Ipzkg01GIuKk4EAO4fXgvXAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xe7oVv+OTDJ4uZ7boPXeSyeL+4s8s
 Fv+3TWS2uPL1PZvFl00T2Cyez1/HaHHyzVUWi86JS9gtDvVFW3ya9ZDZgctj7cf7rB7vb7Sy
 e+z9toDFY+esu+wesztmsnos3vOSyePEhEtMHneu7WHz2P7tAavH/e7jTAFcUXo2RfmlJakK
 GfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZCyYWFmzRqrh3bR5L
 A+M85S5GTg4JAROJlb9msnUxcnEICSxllGg6M40ZIiEjcXJaAyuELSzx51oXVNF7RokHc+6D
 FfEK2ElMafgHZrMIqEpcn3+XDSIuKHFy5hMWEFtUIEnixbbnjCC2sECixMxtN8GGMguIS9x6
 Mp8JxBYRSJB4/Xkh2AJmga1MEi/e3WKH2HaOSeLGyglg3WwChhJdb7vANnAKWElcuDqBHWKS
 mUTX1i5GCFteonnrbOYJjEKzkBwyC8nCWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10v
 OT93EyMwjrcd+7llB+PKVx/1DjEycTAeYpTgYFYS4Q2dGZ8kxJuSWFmVWpQfX1Sak1p8iNEU
 GBoTmaVEk/OBiSSvJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoEp
 RI1170GO7khn3YX/2v1aJas4Zq7s/rrG5C0D5+znVzKm7+RYlJwc5HzozaRXjy4c6S45Vu5R
 99SlL/rmtrSZKz8e5GhZtNqf0WvOvkqx/B9dqY4TWf7LOBqmz+R69/jNH4VdKxcVnmJn2lPB
 6/xn8r0rvz6q3/L2vlXFVO0n/7zmqGLkpL4P24VezVSdltEYL9NQ0cwvo8qwLTUg7dWXT1MO
 lX8IYOEJLL5t5q3wZ/dfW9HczDStoP8rSr7VvI+Wf6A+o/Dya+WqCRGpCyacmWCV5H3pwaqb
 Rla6kaJzt2nfPTmR9fjEGY9nsGfFfPymVrdqpfnSaf8NV2380f9s+rLFdYum8jFfT378dpdl
 gRJLcUaioRZzUXEiAPIyWwJsAwAA
X-CMS-MailID: 20220420122424eucas1p2c64c3f397e5f590b6c4fb83e18cd1dd8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c
References: <CGME20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c@eucas1p2.samsung.com>
 <20220419091422.4255-1-m.szyprowski@samsung.com>
 <CAMty3ZB31chzCfFkogx7otqH8rOZ0wEGDBuxLcG-PKQ-HBHy4w@mail.gmail.com>
 <CAG3jFyuwH2Hj7EtzuXZ1GmCcSoaVpaN1Rr7A+W+m2a2qr0o-NA@mail.gmail.com>
 <Yl7zcdYfkQlv/bsj@pendragon.ideasonboard.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 19.04.2022 19:37, Laurent Pinchart wrote:
> On Tue, Apr 19, 2022 at 06:16:07PM +0200, Robert Foss wrote:
>> On Tue, 19 Apr 2022 at 11:41, Jagan Teki <jagan@amarulasolutions.com> wrote:
>>> On Tue, Apr 19, 2022 at 2:44 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> If panel_bridge_attach() happens after DRM device registration, the
>>>> created connector will not be registered by the DRM core anymore. Fix
>>>> this by registering it explicitely in such case.
>>>>
>>>> This fixes the following issue observed on Samsung Exynos4210-based Trats
>>>> board with a DSI panel (the panel driver is registed after the Exynos DRM
>>>> component device is bound):
>>>>
>>>> $ ./modetest -c -Mexynos
>>>> could not get connector 56: No such file or directory
>>>> Segmentation fault
>>>>
>>>> While touching this, move the connector reset() call also under the DRM
>>>> device registered check, because otherwise it is not really needed.
>>>>
>>>> Fixes: 934aef885f9d ("drm: bridge: panel: Reset the connector state pointer")
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> ---
>>>> Here is a bit more backgroud on this issue is available in this thread:
>>>> https://lore.kernel.org/all/f0474a95-4ba3-a74f-d7de-ef7aab12bc86@samsung.com/
>>>> ---
>>>>   drivers/gpu/drm/bridge/panel.c | 7 +++++--
>>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
>>>> index ff1c37b2e6e5..0ee563eb2b6f 100644
>>>> --- a/drivers/gpu/drm/bridge/panel.c
>>>> +++ b/drivers/gpu/drm/bridge/panel.c
>>>> @@ -83,8 +83,11 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>>>>          drm_connector_attach_encoder(&panel_bridge->connector,
>>>>                                            bridge->encoder);
>>>>
>>>> -       if (connector->funcs->reset)
>>>> -               connector->funcs->reset(connector);
>>>> +       if (bridge->dev->registered) {
>>>> +               if (connector->funcs->reset)
>>>> +                       connector->funcs->reset(connector);
>>>> +               drm_connector_register(connector);
>>>> +       }
>>> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
>> Fixed typos in commit message.
>>
>> Reviewed-by: Robert Foss <robert.foss@linaro.org>
>>
>> Applied to drm-misc-next
> Doesn't this open the door to various race conditions ?

This only patch restores the old behavior of the Exynos DSI driver. IIRC 
Andrzej already checked the possible races and said that the late 
connector registration is fine.

> Also, what happens if the panel bridge is detached and reattached ? If I
> recall correctly, registering new connectors at runtime is at least
> partly supported for DP MST, but I'm not sure about unregistration.

Well, indeed the panel unregistration is broken now:

# rmmod panel_samsung_s6e8aa0
------------[ cut here ]------------
WARNING: CPU: 1 PID: 1336 at drivers/gpu/drm/drm_connector.c:462 
drm_connector_cleanup+0x26c/0x288
Modules linked in: cmac bnep hci_uart btbcm btintel bluetooth s5p_csis 
s5p_fimc exynos4_is_common ecdh_generic ecc v4l2_fwnode v4l2_async 
s5p_mfc brcmfmac cfg80211 brcmutil panel_samsung_s6e8aa0(-) s5p_jpeg 
videobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_v4l2 
videobuf2_common videodev mc
CPU: 1 PID: 1336 Comm: rmmod Not tainted 
5.18.0-rc3-next-20220420-00033-g871e1a91a67f #4866
Hardware name: Samsung Exynos (Flattened Device Tree)
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __warn+0xc8/0x218
  __warn from warn_slowpath_fmt+0x5c/0xb4
  warn_slowpath_fmt from drm_connector_cleanup+0x26c/0x288
  drm_connector_cleanup from exynos_dsi_host_detach+0x24/0x74
  exynos_dsi_host_detach from s6e8aa0_remove+0xc/0x1c 
[panel_samsung_s6e8aa0]
  s6e8aa0_remove [panel_samsung_s6e8aa0] from 
device_release_driver_internal+0x1a4/0x20c
  device_release_driver_internal from driver_detach+0x44/0x80
  driver_detach from bus_remove_driver+0x60/0xd8
  bus_remove_driver from sys_delete_module+0x138/0x22c
  sys_delete_module from ret_fast_syscall+0x0/0x1c
Exception stack(0xf0c01fa8 to 0xf0c01ff0)
1fa0:                   005224d8 00000002 00522514 00000800 e2a92e00 
e2a92e00
1fc0: 005224d8 00000002 005224d8 00000081 be9daf02 be9dac1c be9dae08 
00000001
1fe0: 00520f70 be9dabb4 00503ac4 b6e2a0fc
irq event stamp: 3465
hardirqs last  enabled at (3481): [<c015a448>] 
finish_task_switch+0x110/0x368
hardirqs last disabled at (3490): [<c019d210>] __up_console_sem+0x3c/0x60
softirqs last  enabled at (3460): [<c0101680>] __do_softirq+0x348/0x610
softirqs last disabled at (3423): [<c012ed64>] __irq_exit_rcu+0x144/0x1ec
---[ end trace 0000000000000000 ]---
8<--- cut here ---

This is however just yet another issue caused by the recent Exynos DSI 
driver conversion to DRM bridge. In v5.17 it worked fine. I will try to 
look into that issue later, this is not related to the $subject.

Subsequent panel registration (after it has been first unregistered) 
seems to be broken for ages. It worked fine in v4.19, but then it got 
broken somewhere before v4.20. I've added this to my todo list (with low 
priority though).

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

