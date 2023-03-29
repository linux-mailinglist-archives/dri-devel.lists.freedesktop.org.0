Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75FE6CD1C2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 07:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8BF10E4CA;
	Wed, 29 Mar 2023 05:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060C810E4B6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 05:39:39 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230329053937epoutp042c0627d5a825d482e0c2b86c0779e441~QzUnPBsRk2937029370epoutp04S
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 05:39:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230329053937epoutp042c0627d5a825d482e0c2b86c0779e441~QzUnPBsRk2937029370epoutp04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1680068377;
 bh=oE4g+3Hy46ETjl5Yiehz0ZZvxcbWBMulRabc3FFCJD8=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=NS0xd8ofqmvfxiL+nVfy0UGhKpZIZSCD97v1b+Q6eNdFKl3Nd8I9AodkKA8htATVn
 J9NHAzdVjv9yosWqOpcZ74bpuKSBLXBU7SBWTwxDbtC5aBRua3oGUc+Z9991ze41pv
 1qeTV28ugUUiMKDE05iE/xFgReMn2KwDA9wAmnTU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20230329053937epcas1p3ff3a8effdfbfb3fe003794384c9bde7d~QzUm_3U1c1038110381epcas1p3h;
 Wed, 29 Mar 2023 05:39:37 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.144]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Pmb3D2MHvz4x9Pr; Wed, 29 Mar
 2023 05:39:36 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 05.97.55531.81FC3246; Wed, 29 Mar 2023 14:39:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20230329053936epcas1p42038dbe05fd88400da08ec3ca52c4aed~QzUle5x3B1407714077epcas1p4I;
 Wed, 29 Mar 2023 05:39:36 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230329053936epsmtrp2ee97a31091d7f7f21d9835ee31cddf7d~QzUleKLtU0235802358epsmtrp2p;
 Wed, 29 Mar 2023 05:39:36 +0000 (GMT)
X-AuditID: b6c32a35-5aac1a800000d8eb-d2-6423cf184de6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D6.76.31821.71FC3246; Wed, 29 Mar 2023 14:39:35 +0900 (KST)
Received: from inkidae002 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230329053935epsmtip1c3e48e8e204ddd8e84b342ca5ab7d718~QzUlTe4Yj0362703627epsmtip1S;
 Wed, 29 Mar 2023 05:39:35 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHi?= <inki.dae@samsung.com>
To: "'Daniel Vetter'" <daniel@ffwll.ch>
In-Reply-To: <ZCMkXPW5vdps3xQE@phenom.ffwll.local>
Subject: RE: [GIT PULL] exynos-drm-next
Date: Wed, 29 Mar 2023 14:39:35 +0900
Message-ID: <011101d96200$d8aa45e0$89fed1a0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQH8Q53jgxHvrxeytSPntBZKm+H3eQKbPiHOAcRuIe+uqHzOMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdlhTX1fivHKKwZz1gha9504yWfzfNpHZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtjza5ZbAVbtSr2L+tkbGA8qNDF
 yMkhIWAice34ehYQW0hgB6PE+pVJXYxcQPYnRolln4+yQDifGSXuN/UzwnQc3P2YFSKxi1Fi
 68wlzBDOS0aJqbO2soFUsQlYSRz+c50JxBYRUJc4+v8wmM0skCDxe9IRsBpOASOJe3tfgcWF
 gWpO7FjPCmKzCKhKrJ58GayGV8BSYteTmcwQtqDEyZlPWCDmGEksWT0faqa8xPa3c5ghrlOQ
 +Pl0GStEXERidmcbM8QNThLvZsxkBzlUQuAnu8S15t0sEA0uEuf+nGGDsIUlXh3fwg5hS0l8
 freXDaJhMqPEnesrWCCcGYwSh39ehwaGscT+pZOZIGxFiZ2/5zJCrOaTePe1B+gMDqA4r0RH
 mxBEiZLEsYs3oFolJC4smcg2gVFpFpLnZiF5bhaS52YheWgBI8sqRrHUguLc9NRiwwJDeIQn
 5+duYgSnSC3THYwT337QO8TIxMF4iFGCg1lJhPf3NaUUId6UxMqq1KL8+KLSnNTiQ4ymwPCe
 yCwlmpwPTNJ5JfGGJpYGJmZGxiYWhmaGSuK84rYnk4UE0hNLUrNTUwtSi2D6mDg4pRqYPCeJ
 f7He9b68eJOPjMaKJZs7HvEe2tog+XXRXl0unqbY+auCjDY27w7YvcWs47GueNbeA8oGRW75
 2cuCJtdvMDXZ9CPpgwp3yn2/B609Gm2MOTYiR4/evrCAL/uQ2HQj5X1X2RzZLF+yPRbxMw55
 5quf96Qn2NG6NdpK6uJPj03PRXuuiuxqXL/1NcdWW8e9izNl/+iFmFvPCLW2vqKQdJbJn93Z
 YOP8Go9GD3Obzo2R546EX93wudLizMSSD/1V3u6eLKpqjjI5Qj5LtA82zAm4cb7QyibRpHXS
 j7iLx7ZwzuS3ZXyzbcYhp/cCpY+uLBX1W30z6vqE/6w3lv1RX1CZuDtjbc9V4YXlWyYpsRRn
 JBpqMRcVJwIAZdiU3xoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSnK74eeUUgyUPLSx6z51ksvi/bSKz
 xZWv79ksZpzfx+TA4rH32wIWj+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV8aaXbPY
 CrZqVexf1snYwHhQoYuRk0NCwETi4O7HrF2MXBxCAjsYJdb/2snWxcgBlJCQ2LKVA8IUljh8
 uBikXEjgOaPE3qlgNpuAlcThP9eZQGwRAXWJo/8Pg9nMAkkSt28dZYcYuZFRYtOHRewgCU4B
 I4l7e1+BFQkDNZzYsZ4VxGYRUJVYPfkyG4jNK2ApsevJTGYIW1Di5MwnLBBDTSQaD3dD2fIS
 29/OYYa4X0Hi59NlrBBxEYnZnW3MEAc5SbybMZN9AqPwLCSjZiEZNQvJqFlI2hcwsqxilEwt
 KM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAiOES2tHYx7Vn3QO8TIxMF4iFGCg1lJhPf3NaUU
 Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGpjWaDemaE3r
 7Jm89Xvaou151yx/WHexn1X/7v608aJNimrbyaUlW4VY7bs78oXKrHliJK24l6uzXMplvXxj
 j59V/tqLWgdu8Kqutro0J39Zr1tN4anMJw/4oh2bWlQTa0LNytbVlyXzKfebSE9m/iO3fYuF
 ZnGh/ZOMW4+531xaEpfltuzb0/Izc5N87X5/TA3yupdz6G6+mrigwo91E/53PvOyZc0uscv3
 /Pw2MMLqtftHtzc/pz2OV16guyXDq/wmy7OXE5r2rX3he4yt7su9mWlHX/W/XTqdX/9zzKGr
 phe3WB69y5OcGSmw59S3oOTbb25NWaLw4tT8Pct4WtaEBm4/7rOmO+rZggI+3jAlluKMREMt
 5qLiRABjj9SoAAMAAA==
X-CMS-MailID: 20230329053936epcas1p42038dbe05fd88400da08ec3ca52c4aed
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230328040524epcas1p270b050efedfe53d8e59c7e9103d5b84c
References: <CGME20230328040524epcas1p270b050efedfe53d8e59c7e9103d5b84c@epcas1p2.samsung.com>
 <20230328040524.49278-1-inki.dae@samsung.com>
 <ZCMkXPW5vdps3xQE@phenom.ffwll.local>
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
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Wednesday, March 29, 2023 2:31 AM
> To: Inki Dae <inki.dae@samsung.com>
> Cc: airlied@linux.ie; daniel@ffwll.ch; dri-devel@lists.freedesktop.org;
> linux-samsung-soc@vger.kernel.org
> Subject: Re: [GIT PULL] exynos-drm-next
> 
> On Tue, Mar 28, 2023 at 01:05:24PM +0900, Inki Dae wrote:
> > Hi Dave and Daniel,
> >
> >    Just one patch series that moves the existing Exynos DSI driver
> >    to drm/bridge directory to support both SoCs family - Exynos
> >    and I.MX - because same Exynos MIPI DSI ip can be used by the two
> >    different SoC family.
> >
> >    Of course, there are some concerns about this patch series because
> Exynos
> >    and I.MX SoCs have different HW characteristic but use the same HW
> driver.
> >    However, I believe that there should be no problem as Exynos and I.MX
> >    developers have conducted tests and reviews enough for about a year
> >    since last April.
> >
> >    This would be the first case that we allow different vendor SoCs to use
> >    same device driver at least in DRM world so we anticipate experiencing
> >    and resolving new issues through ongoing maintenance, and ultimately,
> >    the experiences gained here will undoubtedly be able to contribute
> >    the development of the community as well.
> >
> >    Please kindly let me know if there is any problem.
> >
> > Thanks,
> > Inki Dae
> >
> > The following changes since commit
> 46f28427f6f824b6cff06fa025a55350b7de454a:
> >
> >   Merge tag 'drm-rcar-next-20230325' of
> git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into drm-next
> (2023-03-27 18:20:20 +0200)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos
> tags/exynos-drm-next-for-v6.4
> 
> Merged, but usually all drm bridge stuff goes through drm-misc, least so
> that there's some amount of collaboration and not so much inter-tree
> syncing.
> 
> Please apply for drm-misc commit rights (at least a quick check shows no
> one from samsung) and land future bridge patches through that tree.
> 
> Cheers, Daniel

I will apply for drm-misc commit rights. :)

Thanks,
Inki Dae

> 
> >
> > for you to fetch changes up to b2cfec52feb3bb737c4b65018ef4bfe9789e4be8:
> >
> >   drm: bridge: samsung-dsim: Add i.MX8M Plus support (2023-03-28 09:05:41
> +0900)
> >
> > ----------------------------------------------------------------
> > A patch series for moving MIPI-DSI driver for Exynos DRM to drm/bridge
> > directory so that I.MX SoC family can also share the same device driver.
> > Samsung MIPI DSIM device is a common IP that can be used by Exynos and
> I.MX8M
> > Mini/Nano/Plus SoC. Regarding this, this patch series has added several
> > things below to existing MIPI DSI driver,
> > 	- Add exynos_dsi_type enum type to provide controller data from
> different
> > 	  platforms.
> > 	- Add two pipeline detection ways support - existing Exynos DSI child
> node
> > 	  and I.MX family of-graph port or ports.
> > 	- Consider component and bridged based DRM drivers.
> > 	- Add device tree binding support of I.MX family.
> >
> > ----------------------------------------------------------------
> > Jagan Teki (14):
> >       drm: exynos: dsi: Drop explicit call to bridge detach
> >       drm: exynos: dsi: Lookup OF-graph or Child node devices
> >       drm: exynos: dsi: Mark PHY as optional
> >       drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
> >       drm: exynos: dsi: Introduce hw_type platform data
> >       drm: exynos: dsi: Add atomic check
> >       drm: exynos: dsi: Add input_bus_flags
> >       drm: exynos: dsi: Add atomic_get_input_bus_fmts
> >       drm: exynos: dsi: Consolidate component and bridge
> >       drm: exynos: dsi: Add host helper for te_irq_handler
> >       drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
> >       dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
> >       drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
> >       dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
> >
> > Marek Szyprowski (1):
> >       drm: exynos: dsi: Handle proper host initialization
> >
> > Marek Vasut (1):
> >       drm: bridge: samsung-dsim: Add i.MX8M Plus support
> >
> >  .../bindings/display/exynos/exynos_dsim.txt        |    2 +
> >  MAINTAINERS                                        |    9 +
> >  drivers/gpu/drm/bridge/Kconfig                     |   12 +
> >  drivers/gpu/drm/bridge/Makefile                    |    1 +
> >  drivers/gpu/drm/bridge/samsung-dsim.c              | 1967
> ++++++++++++++++++++
> >  drivers/gpu/drm/exynos/Kconfig                     |    1 +
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 1813 +----------------
-
> >  include/drm/bridge/samsung-dsim.h                  |  115 ++
> >  8 files changed, 2191 insertions(+), 1729 deletions(-)
> >  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
> >  create mode 100644 include/drm/bridge/samsung-dsim.h
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://protect2.fireeye.com/v1/url?k=7fdd2b55-1e563e63-7fdca01a-
> 74fe485cbff1-6c2178cc05019313&q=1&e=e4f34328-cc9e-48f9-80e0-
> ec8c0c4246f2&u=http%3A%2F%2Fblog.ffwll.ch%2F

