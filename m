Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0CB4BF479
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 10:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FFE10E61E;
	Tue, 22 Feb 2022 09:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DD110E61E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 09:16:07 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220222091605epoutp02f76f8764ae1ac4d41380487b06a643f4~WEPajfCAd2378423784epoutp02Q
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 09:16:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220222091605epoutp02f76f8764ae1ac4d41380487b06a643f4~WEPajfCAd2378423784epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1645521365;
 bh=gCmLWa0b42xIbgG0H/u//pj4j9A++d5AwUSicUPhxGE=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=axm0NZuDwjJZl9PDFifcFmi4xUaxWh5z/xMDKoNpxvYtyd1qdMtrmzg114Cif8Yd9
 JqTa+nVz7DVCi1EXrK9c3OVA5MmOEMv22wbd4l+3L1lhwZ1LD5v+PCIbRLijTbZpGg
 Amh3tWtqxygZiMODgyAYEgErn6vvsT5tuqmyGcJA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220222091604epcas1p1343d5f95fe16ce2c61d7de2ff2646315~WEPZ8BTmR1094010940epcas1p1D;
 Tue, 22 Feb 2022 09:16:04 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.36.133]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4K2tnW6YPDz4x9Q7; Tue, 22 Feb
 2022 09:15:59 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 29.6A.09592.5C9A4126; Tue, 22 Feb 2022 18:15:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20220222091549epcas1p41021c7acc126124c38e19be233013e57~WEPMDkgoa1784417844epcas1p4F;
 Tue, 22 Feb 2022 09:15:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220222091549epsmtrp1ae305e8d43556e9772645e7329b9e8b8~WEPMC5zbM0176001760epsmtrp1W;
 Tue, 22 Feb 2022 09:15:49 +0000 (GMT)
X-AuditID: b6c32a37-28fff70000002578-d2-6214a9c5cbc8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AA.B3.29871.5C9A4126; Tue, 22 Feb 2022 18:15:49 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220222091549epsmtip18a69b97825814e4357c3eabde6fcc485~WEPLtrTfz1017710177epsmtip1X;
 Tue, 22 Feb 2022 09:15:49 +0000 (GMT)
Message-ID: <64038de4-c7a4-cc4d-fe92-75f6ecf9202e@samsung.com>
Date: Tue, 22 Feb 2022 18:27:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] exynos-drm-fixes
Content-Language: en-US
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel.vetter@ffwll.ch
In-Reply-To: <20220210110722.63523-1-inki.dae@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdlhTT/fYSpEkg20NjBa9504yWSx8eJfZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj+Ya5jAWtQhWL9r5kb2A8xdfF
 yMkhIWAicXfGbRYQW0hgB6PEyhZ3CPsTo8SkqcZdjFxA9jdGiU13u1hgGhZenscEUbSXUeLM
 /2KIoveMEm/2TAAr4hWwk/i/ajobiM0ioCpxf1YjI0RcUOLkzCdgNaICERIvj/wFGyQsoCEx
 88k1VhCbWUBc4taT+WBxNqDeiSvuA83h4BAR0JF4caYAosRN4s/Ss2BjOAWsJP6ebmGEiMtL
 NG+dzQxyj4TAR3aJU1Ma2SGOdpE4dOoWE4QtLPHq+BaouJTEy/42doiGyYwSd66vYIFwZjBK
 HP55nRGiylhi/9LJTCBXMAtoSqzfpQ8RVpTY+Xsu1GY+iXdfe1hBSiQEeCU62oQgSpQkjl28
 ATVFQuLCkolsELaHxLU9bUwTGBVnIQXLLCTvz0LyzyyExQsYWVYxiqUWFOempxYbFhjD4zo5
 P3cTIzgxapnvYJz29oPeIUYmDsZDjBIczEoivHfYhZOEeFMSK6tSi/Lji0pzUosPMZoCI2ci
 s5Rocj4wNeeVxBuaWBqYmBkZm1gYmhkqifOumnY6UUggPbEkNTs1tSC1CKaPiYNTqoFJe5sr
 S+/RNbbSXv+S5r46knvtW/ZM95Wn1HdsP17gZm/HMnX5orjeA4uSvp2/srh7diTLV/bMiY5X
 Du5abfYhPHquxwxd44fCs5yfz25cafn04b3Zzy4veNd88+HEjb0M3K4S/NMNsvgfi8bddnmS
 +vzZkm0HxHskPybtV5i/8MzGnG054jru5eq8LqXlIWLnY+snVi+3vN9QcSZes7yLU6vzSpWs
 nGr2fw4PXrU4ySvJGlaK9zi1FrHrZp57/LlqzcxAeQ1/ra/bFLmelsT+m/s/d8v+/d5ZcxkO
 eHflXTtz10iioKUrKUXhrsJxu21daY8UkiRPXtgj4urmbv9L6Msj95nWVeVKZ3P7WmyUWIoz
 Eg21mIuKEwG3vCgbFQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWy7bCSnO7RlSJJBhd/q1v0njvJZLHw4V1m
 iytf37NZzDi/j8mBxWPvtwUsHtu/PWD1uN99nMnj8ya5AJYoLpuU1JzMstQifbsErozlG+Yy
 FrQKVSza+5K9gfEUXxcjJ4eEgInEwsvzmLoYuTiEBHYzSrS9mcTaxcgBlJCQ2LKVA8IUljh8
 uBii5C2jxO2Zj5lBenkF7CT+r5rOBmKzCKhK3J/VyAgRF5Q4OfMJC4gtKhAh0bZsCli9sICG
 xMwn11hBbGYBcYlbT+YzgdhsQL0TV9xnA9klIqAj8eJMAUSJm8SfpWfBxggJ9DJKzP5bCWJz
 ClhJ/D3dwghSziygLrF+nhBEubxE89bZzBMYhWYhOWIWkmWzEDpmIelYwMiyilEytaA4Nz23
 2LDAMC+1XK84Mbe4NC9dLzk/dxMjOAq0NHcwbl/1Qe8QIxMH4yFGCQ5mJRHeO+zCSUK8KYmV
 ValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwde0+Nzkz/y7jRYlH
 b2NFw4J8+xSUGOf5i1/6xi6ztPifqvfzuNl/Nx6pXNk4Y53c8q+vlh3c3+HeLrnlQY3ioWun
 pHYkd9vOXcatub8/MW2/96P7HRrxBxu6ffwF7M6s0maybFy3kDliSpXsv6fPGpLtvjhtqn2f
 NVkqalmxUdQGT4HZy1e6mCyb+tqL4fVa/7vRB3b6XGeXvxlyr2ibsden21vkdmkzTz1+1Pz4
 zyQ5daHiHac466XidM+u/mlx18Dv4wquE4IvP/4+HXfD9smstG+dH1VVt088fSfNQ9qeS0/j
 ku+8BdfjZ4mqLP8ZY83opsjBaf6Db44Qg8fM8Gi7pmJzS/Xu/b5eWUs1lFiKMxINtZiLihMB
 4qAK4vECAAA=
X-CMS-MailID: 20220222091549epcas1p41021c7acc126124c38e19be233013e57
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220210105530epcas1p2a8812b767cecfc06c068bf8aba8b9cb5
References: <CGME20220210105530epcas1p2a8812b767cecfc06c068bf8aba8b9cb5@epcas1p2.samsung.com>
 <20220210110722.63523-1-inki.dae@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Seems you missed. Is there any issue?

Thanks,
Inki Dae

22. 2. 10. 20:07에 Inki Dae 이(가) 쓴 글:
> Hi Dave and Daniel,
> 
>    Just two fixup series - one is to fix irq chaining issue and other is
>    regressions to TE-gpio handling.
> 
> Please let me know if there is any problem.
> 
> Thanks,
> Inki Dae
> 
> The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566:
> 
>   Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)
> 
> are available in the Git repository at:
> 
>   gitolite.kernel.org:/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.17-rc4
> 
> for you to fetch changes up to 38103fa72e0b70e3067fed489f8316dc5998f26c:
> 
>   drm/exynos: Search for TE-gpio in DSI panel's node (2022-02-10 19:17:22 +0900)
> 
> ----------------------------------------------------------------
> Fixups
> - Make display controller drivers for Exynos series to use platform_get_irq
>   and platform_get_irq_byname functions to get the interrupt, which prevents
>   irq chaining from messed up when using hierarchical interrupt domains
>   which use "interrupts" property in the node.
> - Fix two regressions to TE-gpio handling.
> 
> ----------------------------------------------------------------
> Lad Prabhakar (5):
>       drm/exynos/exynos7_drm_decon: Use platform_get_irq_byname() to get the interrupt
>       drm/exynos: mixer: Use platform_get_irq() to get the interrupt
>       drm/exynos/exynos_drm_fimd: Use platform_get_irq_byname() to get the interrupt
>       drm/exynos/fimc: Use platform_get_irq() to get the interrupt
>       drm/exynos: gsc: Use platform_get_irq() to get the interrupt
> 
> Marek Szyprowski (2):
>       drm/exynos: Don't fail if no TE-gpio is defined for DSI driver
>       drm/exynos: Search for TE-gpio in DSI panel's node
> 
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 12 +++---------
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c    |  6 ++++--
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 13 +++++--------
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 13 ++++---------
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 10 +++-------
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 14 ++++++--------
>  6 files changed, 25 insertions(+), 43 deletions(-)
> 
