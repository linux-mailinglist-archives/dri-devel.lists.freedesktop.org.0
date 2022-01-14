Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8A948E94D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 12:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F0C10E13C;
	Fri, 14 Jan 2022 11:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F6A10E13C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 11:36:21 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220114113619epoutp026b5f6f9180995c9000fe0562b02d5578~KH-upwPTQ3154531545epoutp02T
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 11:36:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220114113619epoutp026b5f6f9180995c9000fe0562b02d5578~KH-upwPTQ3154531545epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1642160179;
 bh=ldgDTIYJIP1P8SsZdmNML1GNaShxKbRNmOuT6WfsyN4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YKKomgPG4UyO65wdjkn+P1m1xe+ijpWEA3dJUzgvyFE3PmaZsFFf/icv90V/YWO5B
 9L9j6GNLuL4ZtNoa03uNHR165TM2h5nL3MUi/JqUdEg5iX614yu+wWFeLX6Izwnk4g
 hYL8K9pYfZjksKa0SaOEeL3qaEvGXvKokiEOeMQc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220114113619epcas1p474f7fe7f5d8387bdb51c0f3038232fd3~KH-t-w6J31357213572epcas1p42;
 Fri, 14 Jan 2022 11:36:19 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.233]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4JZzlL4Fckz4x9Pw; Fri, 14 Jan
 2022 11:36:14 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 D7.0F.28648.E2061E16; Fri, 14 Jan 2022 20:36:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220114113613epcas1p142ecd07beda2e089ef396337bef33430~KH-pFrFO20920009200epcas1p1J;
 Fri, 14 Jan 2022 11:36:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220114113613epsmtrp20e515ca91ebf90c07c355577956604ba~KH-pEzF461051610516epsmtrp2j;
 Fri, 14 Jan 2022 11:36:13 +0000 (GMT)
X-AuditID: b6c32a39-003ff70000006fe8-78-61e1602e1a32
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 55.4B.08738.D2061E16; Fri, 14 Jan 2022 20:36:13 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220114113613epsmtip287078b9706440aaa79f3d601cb9987d3~KH-om5nca0503005030epsmtip2G;
 Fri, 14 Jan 2022 11:36:13 +0000 (GMT)
Subject: Re: [PATCH 0/5] drm/exynos: Use platform_get_irq*() variants to
 fetch IRQ's
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <6f044839-e1d8-b9a8-90c3-7e929d498838@samsung.com>
Date: Fri, 14 Jan 2022 20:47:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRmVeSWpSXmKPExsWy7bCmnq5ewsNEg3trZC16z51ksvi/bSKz
 xZWv79ksXty7yGKx8e0PJouzTW/YLTY9vsZqcXnXHDaLGef3MVm8vL+C2aLvzTpmi9a9R9gt
 Zkx+yebA67HyxWx2j1kNvWwee78tYPHYOesuu8emVZ1sHtu/PWD1uN99nMlj85J6j74tqxg9
 Pm+SC+CKyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvM
 ATpeSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgWqBXnJhbXJqXrpeXWmJlaGBg
 ZApUmJCd8WDaROaCvVwVqz8cYWxgPMHRxcjBISFgItEx17CLkYtDSGAHo8TRlU9Yuhg5gZxP
 jBLt9xwhEp8ZJf6tP8MMkgBpOHWkhQ0isYtR4vSRrywQzntGicOT/jGCVAkLhEm0PbzHDJIQ
 EVjOLPGw6QTYXGaBHIkpPcvARrEJqEpMXHGfDcTmFbCTWHLiKjuIzQIU/9C/nRXEFhWIlLj/
 Yzk7RI2gxMmZIPdxcHAK+ErMW+QDMVJc4taT+UwQtrxE89bZYHslBG5wSPxoncUGcbaLxMHd
 h9ghbGGJV8e3QNlSEp/f7WWDaNjHKLF810l2COcwo0TzzmYmiCpjif1LJzOBbGYW0JRYv0sf
 IqwosfP3XEaIzXwS7772sEIClVeio00IokRJ4tjFG4wQtoTEhSUToe7xkJj8YiX7BEbFWUhe
 m4Xkn1lI/pmFsHgBI8sqRrHUguLc9NRiwwJTeGwn5+duYgQnbC3LHYzT337QO8TIxMF4iFGC
 g1lJhLe/6H6iEG9KYmVValF+fFFpTmrxIUZTYGBPZJYSTc4H5oy8knhDE0sDEzMjYxMLQzND
 JXHeVdNOJwoJpCeWpGanphakFsH0MXFwSjUwFXzRLV/3vntaVmVlOLsUm/SCe/XPFe+/8Y8r
 v+FYz37I0y9L6/ppA3uVD3sPnOv1Zyn7svKDY3R8hfLiOxmsag+/qm3X27frdkhsdUSgZG/U
 x0/HylQ3K67N9qjb/smAfcrViFrJu+IHJxfvbF1zYjlLA9P5xoM2YYar7pz9YPZ5pnFb8MQ/
 62cr7a0O/TyvRdKjbOmjK27GTDKKv8w3+qasbRb6smj/+V1LtNweb9umXV3BZiUk/HXzbFVX
 08cnxfcqCm6Rl0o717LzR/m3vSE8n728or5M3KL540UTlyD7fWPn2O8ZT03P1087JH/4j0/a
 U99Tu15d58xj3CGnJONrWvrmlIboo1u9v8/nKLEUZyQaajEXFScCAAVyIPthBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsWy7bCSvK5uwsNEg4VnDSx6z51ksvi/bSKz
 xZWv79ksXty7yGKx8e0PJouzTW/YLTY9vsZqcXnXHDaLGef3MVm8vL+C2aLvzTpmi9a9R9gt
 Zkx+yebA67HyxWx2j1kNvWwee78tYPHYOesuu8emVZ1sHtu/PWD1uN99nMlj85J6j74tqxg9
 Pm+SC+CK4rJJSc3JLEst0rdL4Mp4MG0ic8FerorVH44wNjCe4Ohi5OSQEDCROHWkha2LkYtD
 SGAHo8SP002MXYwcQAkJiS1bOSBMYYnDh4shSt4ySrx4e4UFJC4sECbx5YEvSFxEYDWzxPnT
 f1hBZjIL5Eg0zVzFBNGwgFHi06wt7CAJNgFViYkr7rOB2LwCdhJLTlwFi7MAxT/0bwdrFhWI
 lFh3fBk7RI2gxMmZT8CWcQr4Ssxb5AMxX13iz7xLzBC2uMStJ/OZIGx5ieats5knMArNQtI9
 C0nLLCQts5C0LGBkWcUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERyfWlo7GPes+qB3
 iJGJg/EQowQHs5IIb3/R/UQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YW
 pBbBZJk4OKUamNa/fFFxbiun/NQIPd6ge3xJEkzNEl9PLuMITS6Pam7+M9ua8+X+V3MaVpT5
 rMqNNrDK28sxxSvtvnC0OP8SO801S978jhCvP764/7prVfSBL6sOtuWFbN1UXLbfy/Cva6uo
 qvjDXfNU2iWCHFj2p64UXXP7WL3hiqLEs2Etn7bZWyYo1rZsqz6lYZ/GJnOIbbLB3AeXZOPD
 3zzVtz66jVX8k2KaQOXEpS8aeT/EJ9zri/2WxMCg6/Pug/Z9jn3bUyKsSrtXG2ge3Ja5YmOk
 vu2l2RN33Mvbn1RZvnY3i0/GJPcDdbqP125KDj2U+k6r0CGk7uG/vwcZ7FiO7rs55YiY6xch
 2UfVL9ma2OqClViKMxINtZiLihMBRM9FvD4DAAA=
X-CMS-MailID: 20220114113613epcas1p142ecd07beda2e089ef396337bef33430
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211222190157epcas1p1d556269940101a49ab245a4f1d7d45c0
References: <CGME20211222190157epcas1p1d556269940101a49ab245a4f1d7d45c0@epcas1p1.samsung.com>
 <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

21. 12. 23. 오전 4:01에 Lad Prabhakar 이(가) 쓴 글:
> Hi All,
> 
> This patch series aims to drop using platform_get_resource() for IRQ types
> in preparation for removal of static setup of IRQ resource from DT core
> code.
> 
> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>

Applied.

Thanks,
Inki Dae

 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (5):
>   drm/exynos/exynos7_drm_decon: Use platform_get_irq_byname() to get the
>     interrupt
>   drm/exynos: mixer: Use platform_get_irq() to get the interrupt
>   drm/exynos/exynos_drm_fimd: Use platform_get_irq_byname() to get the
>     interrupt
>   drm/exynos/fimc: Use platform_get_irq() to get the interrupt
>   drm/exynos: gsc: Use platform_get_irq() to get the interrupt
> 
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 12 +++---------
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 13 +++++--------
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 13 ++++---------
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 10 +++-------
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 14 ++++++--------
>  5 files changed, 21 insertions(+), 41 deletions(-)
> 
