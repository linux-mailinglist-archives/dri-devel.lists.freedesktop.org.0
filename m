Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE26AA46F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 23:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A5D10E786;
	Fri,  3 Mar 2023 22:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 370 seconds by postgrey-1.36 at gabe;
 Fri, 03 Mar 2023 22:32:38 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190B110E785
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 22:32:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230303222625euoutp029f1844024808c6d1f9eb67cea9ba51c1~JCSPmBHDm0279902799euoutp02h
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 22:26:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230303222625euoutp029f1844024808c6d1f9eb67cea9ba51c1~JCSPmBHDm0279902799euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1677882386;
 bh=wfte9J2xDnb+IyfItXvdl62jXu8V9R7xisFX/wjJ4Z0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=kbN6AY1NsV0ayE4On+yjLDhv/y3ndTv+Alrcevt7UVN611aMc4KjmDCtUiNkEgNsR
 vS247LbTrUkNJhwYMXqE5DYla6wD1kz5qLjWxnT+nCu+bko86X2Gs5WEeldf05ffq4
 yKK2tL30r0pLNTVP5CZYKeh0VQvW3AGdcVVLMAYA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230303222625eucas1p201816846e0425c6ad7a15875dbd21b92~JCSPDrlBS3034230342eucas1p2M;
 Fri,  3 Mar 2023 22:26:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 47.28.01471.11472046; Fri,  3
 Mar 2023 22:26:25 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230303222624eucas1p288512012acd13920e36633fca50e890d~JCSN3S23r2266222662eucas1p2f;
 Fri,  3 Mar 2023 22:26:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230303222624eusmtrp19c6b5a97e4add7e65a8e9f361a82d9c8~JCSN1wur10413104131eusmtrp1B;
 Fri,  3 Mar 2023 22:26:24 +0000 (GMT)
X-AuditID: cbfec7f2-29bff700000105bf-c3-640274111b47
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 26.A5.02722.F0472046; Fri,  3
 Mar 2023 22:26:23 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230303222623eusmtip2dbd8fee59937632467fde8e5fe82c857~JCSNFmMJ11338513385eusmtip2Z;
 Fri,  3 Mar 2023 22:26:23 +0000 (GMT)
Message-ID: <79c2e5cc-a488-09ae-dc68-18dbc47d963a@samsung.com>
Date: Fri, 3 Mar 2023 23:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>, Maxime Ripard
 <mripard@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7djPc7qCJUwpBsuvCFncuX2a2eL+4s8s
 Fle+vmez6F16jtVi0v0JLBZfNk1gszjb9IbdYvmEfWwWM87vY7J409bIaHH60Xpmi7bOZawW
 73feYrSYMfklm8XFE5+YHfg91n68z+oxb9YJFo8pJ46wepzrucvmsXPWXXaPxXteMnlsWtXJ
 5nHk6mJWjzvX9rB53O8+zuTRt2UVo8fnTXIBPFFcNimpOZllqUX6dglcGZ9bTrIV3LGqaLzN
 2cD4Wa+LkZNDQsBEYuekySxdjFwcQgIrGCWuXPvFBuF8YZSY293MCuF8ZpR4tOU/K0zLmZdr
 2EFsIYHljBKzXpZAFH1klOia844NJMErYCexuGMpWAOLgIrEh9597BBxQYmTM5+wgNiiAikS
 O87vBosLCzhInF9xlBHEZhYQl7j1ZD4TyFARgReMEqf+LAI7g1ngE5PEum2TwTrYBAwlut52
 gW3jBOq+0XSJBaJbXqJ562xmkAYJgXOcEq2PbjBC3O0icantLhuELSzx6vgWdghbRuL05B4W
 iIZ2RokFv+8zQTgTGCUant+C6raWuHMOFDYcQCs0Jdbv0ocIO0pcuLGSHSQsIcAnceOtIMQR
 fBKTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzUIKmFlIATALyTuzEPYuYGRZxSieWlqc
 m55abJiXWq5XnJhbXJqXrpecn7uJEZgcT/87/mkH49xXH/UOMTJxMB5ilOBgVhLhrW5gSBHi
 TUmsrEotyo8vKs1JLT7EKM3BoiTOq217MllIID2xJDU7NbUgtQgmy8TBKdXA5HpVMnBm6KcQ
 hYDfm8s7r9XtWL5fqP2l2as59UdUt07h3mA/Oaq9oKp8s37BOlOnkyUJzx+yKGcffcDIu5rr
 5LrpQVrNDO7Xni5Z9CWLMcf9zaU3d9d2vy96fCi3yk0naOof7lTZ3GU26kc3XU+7K+fuZ3Bl
 Pt8RlsU+d23LZHlVdVjuqG+o6HH6Ul7g+js5NGtNh+iPT0Y6uu33P0oeV7MSaIyUPsDCmp3G
 uLxBu/ie9LfDL7WV82sOTVGa7vNz29IbM2dJS/i3b13bYzjvjkjQ7Km35vAv924+LXFucdjR
 RSyr6hdmPwiQmZcyN2Qah1CX+ofDelu4Fy2zK0rXybx26cXpYv2dQof8V00/pMRSnJFoqMVc
 VJwIAJs3s779AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRmVeSWpSXmKPExsVy+t/xe7r8JUwpBlt/W1rcuX2a2eL+4s8s
 Fle+vmez6F16jtVi0v0JLBZfNk1gszjb9IbdYvmEfWwWM87vY7J409bIaHH60Xpmi7bOZawW
 73feYrSYMfklm8XFE5+YHfg91n68z+oxb9YJFo8pJ46wepzrucvmsXPWXXaPxXteMnlsWtXJ
 5nHk6mJWjzvX9rB53O8+zuTRt2UVo8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYm
 lnqGxuaxVkamSvp2NimpOZllqUX6dgl6GZ9bTrIV3LGqaLzN2cD4Wa+LkZNDQsBE4szLNewg
 tpDAUkaJb9OtIOIyEienNbBC2MISf651sXUxcgHVvGeUuDHhBDNIglfATmJxx1KwIhYBFYkP
 vfvYIeKCEidnPmHpYuTgEBVIkZjdpQMSFhZwkDi/4igjiM0sIC5x68l8JpCZIgIvGCV235oA
 5jALfGGSONcyFWrbZEaJZRu+grWwCRhKdL0FOYOTgxNo1I2mSywQo8wkurZ2QY2Vl2jeOpt5
 AqPQLCSHzEKycRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQITAXbjv3cvINx
 3quPeocYmTgYDzFKcDArifBWNzCkCPGmJFZWpRblxxeV5qQWH2I0BYbGRGYp0eR8YDLKK4k3
 NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgKjz/IHH9/63xxaLHeFMF
 graz6HxoyW8oUtat3NT+aqkcb97VK8udVV/OjPHsLV2+6r4U427+VUuTJ7syCR/bUS+49Zv4
 SqvrM2wuiWTfvdLN/1el8Och9s4XC03LPBJ0GN7aGlQ8+GIjstNv+23RttXVVZU88k2cHmv4
 JVtcpjCkTdohNl9ScKlB/4fJMglc0b8MNH3qCh1W6yxwEDzbfmBB7Pv7RodYa2KY7wdK/70T
 9nz3ofOdSy/99GPgS5BefvhL1n6Drt8Gcy+IzxUykCnKTppe++/HvKy/TSZpQd/frP8463RF
 h/6Wgu9zc/ltFh6wklqqefyXdeHMCTbZkcXr3jOum7lbOafLYCmvEktxRqKhFnNRcSIAGl/G
 TY4DAAA=
X-CMS-MailID: 20230303222624eucas1p288512012acd13920e36633fca50e890d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230303145219eucas1p218c2e302e41464432627c8ac074302f8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230303145219eucas1p218c2e302e41464432627c8ac074302f8
References: <CGME20230303145219eucas1p218c2e302e41464432627c8ac074302f8@eucas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 03.03.2023 15:51, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>
> Inki Dae: please note that this series added on top of exynos-drm-next
> since few exynos dsi changes are not been part of drm-misc-next.
> Request you to pick these via exynos-drm-next, or let me know if you
> have any comments?

I gave it a try on Exynos TM2e and unfortunately it nukes again:

exynos-drm exynos-drm: bound 13970000.hdmi (ops hdmi_component_ops)
Unable to handle kernel paging request at virtual address 003d454d414e5675
...
[003d454d414e5675] address between user and kernel address ranges
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 4 PID: 9 Comm: kworker/u16:0 Not tainted 6.2.0-next-20230303+ #13341
Hardware name: Samsung TM2E board (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : drm_connector_list_iter_next+0x58/0x100
lr : drm_connector_list_iter_next+0x2c/0x100
sp : ffff80000bbab910
...
Call trace:
  drm_connector_list_iter_next+0x58/0x100
  drm_mode_config_reset+0xfc/0x144
  exynos_drm_bind+0x160/0x1b8
  try_to_bring_up_aggregate_device+0x168/0x1d4
  __component_add+0xa8/0x170
  component_add+0x14/0x20
  hdmi_probe+0x3fc/0x6d4
  platform_probe+0x68/0xd8
  really_probe+0x148/0x2b4
  __driver_probe_device+0x78/0xe0
  driver_probe_device+0xd8/0x160
  __device_attach_driver+0xb8/0x138
  bus_for_each_drv+0x84/0xe0
  __device_attach+0xa8/0x1b0
  device_initial_probe+0x14/0x20
  bus_probe_device+0xb0/0xb4
  deferred_probe_work_func+0x8c/0xc8
  process_one_work+0x288/0x6c8
  worker_thread+0x24c/0x450
  kthread+0x118/0x11c
  ret_from_fork+0x10/0x20
Code: 54000580 d1008061 f90006c1 9100c064 (b9403061)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops: Fatal exception
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x460002,0e3c0400,0000421b
Memory Limit: none
---[ end Kernel panic - not syncing: Oops: Fatal exception ]---


The debugging saga strikes again. I will try to analyze this on Monday...


> Patch 0001 - 0002: find child DSI bridge and panel
>
> Patch 0003 - 0004: optional PHY, PMS_P offset
>
> Patch 0005       : introduce hw_type
>
> Patch 0006	 : fixing host init
>
> Patch 0007	 : atomic_check
>
> Patch 0008	 : input_bus_flags
>
> Patch 0009	 : atomic_get_input_bus_fmts
>
> Patch 0010 - 0011: component vs bridge
>
> Patch 0012	 : DSIM bridge
>
> Patch 0013 - 0014: i.MX8M Mini/Nano
>
> Patch 0015 - 0016: i.MX8M Plus
>
> Changes for v15:
> - drop drm_of helpers
> - re-added find DSI bridge/Panel helper in dsim
> - collect RB from Marek V
> - fixed leading underscore in function names
> - commit messages updated
> - rebased on exynos-drm-next
>
> Changes for v13:
> - remove devm call for DSI panel or bridge finding
> - rebased on drm-misc-next
>
> Changes for v12:
> - collect RB from Marek V
> - add te_irq_handler hook
> - fix comments from Marek V
> - update atomic_get_input_bus_fmts logic
>
> Changes for v11:
> - collect RB from Frieder Schrempf
> - collect ACK from Rob
> - collect ACK from Robert
> - fix BIT macro replacements
> - fix checkpatch --strict warnings
> - fix unneeded commit text
> - drop extra lines
>
> Changes for v10:
> - rebase on drm-misc-next
> - add drm_of_dsi_find_panel_or_bridge
> - add devm_drm_of_dsi_get_bridge
> - fix host initialization (Thanks to Marek Szyprowski)
> - rearrange the tiny patches for easy to review
> - update simple names for enum hw_type
> - add is_hw_exynos macro
> - rework on commit messages
>
> Changes for v9:
> - rebase on drm-misc-next
> - drop drm bridge attach fix for Exynos
> - added prepare_prev_first flag
> - added pre_enable_prev_first flag
> - fix bridge chain order for exynos
> - added fix for Exynos host init for first DSI transfer
> - added MEDIA_BUS_FMT_FIXED
> - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
>    list is unsupported.
> - added MEDIA_BUS_FMT_YUYV10_1X20
> - added MEDIA_BUS_FMT_YUYV12_1X24
>
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support
>
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
>
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge
>
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
>
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
>
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
>
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
>
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Repo:
> https://protect2.fireeye.com/v1/url?k=43fc0c46-2281e43e-43fd8709-74fe485fffb1-f84e6959aef8bb31&q=1&e=008cbb56-9344-43e4-903f-5547c72a3ade&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v15
>
> v13:
> https://lore.kernel.org/all/20230227113925.875425-1-jagan@amarulasolutions.com/
>
> Any inputs?
> Jagan.
>
> Jagan Teki (14):
>    drm: exynos: dsi: Drop explicit call to bridge detach
>    drm: exynos: dsi: Lookup OF-graph or Child node devices
>    drm: exynos: dsi: Mark PHY as optional
>    drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
>    drm: exynos: dsi: Introduce hw_type platform data
>    drm: exynos: dsi: Add atomic check
>    drm: exynos: dsi: Add input_bus_flags
>    drm: exynos: dsi: Add atomic_get_input_bus_fmts
>    drm: exynos: dsi: Consolidate component and bridge
>    drm: exynos: dsi: Add host helper for te_irq_handler
>    drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
>    dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
>    drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
>    dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
>
> Marek Szyprowski (1):
>    drm: exynos: dsi: Handle proper host initialization
>
> Marek Vasut (1):
>    drm: bridge: samsung-dsim: Add i.MX8M Plus support
>
>   .../bindings/display/exynos/exynos_dsim.txt   |    2 +
>   MAINTAINERS                                   |    9 +
>   drivers/gpu/drm/bridge/Kconfig                |   12 +
>   drivers/gpu/drm/bridge/Makefile               |    1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c         | 1965 +++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig                |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1817 +--------------
>   include/drm/bridge/samsung-dsim.h             |  115 +
>   8 files changed, 2190 insertions(+), 1732 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>   create mode 100644 include/drm/bridge/samsung-dsim.h
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

