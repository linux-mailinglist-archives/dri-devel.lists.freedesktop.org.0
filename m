Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04A8994AD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 07:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF33910E5CF;
	Fri,  5 Apr 2024 05:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="q1Riz1Ni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 464 seconds by postgrey-1.36 at gabe;
 Fri, 05 Apr 2024 05:19:13 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2298210E5CF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 05:19:12 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240405051125epoutp0375510dcd7ad3f2bd0056350f82d96871~DSjdgsZjI1847918479epoutp03k
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 05:11:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240405051125epoutp0375510dcd7ad3f2bd0056350f82d96871~DSjdgsZjI1847918479epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1712293885;
 bh=Sg1g9N/G1pvV115mMMnWln56UDO17G4Nqgp6n10MxAU=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=q1Riz1NiMrxFpa5owQaFIPQy4RYpkYGS7y4BcUrboRyVDZDE9xfJm4tlYXtGL80Dr
 srvgoOZCiM4r29xhsh+Zy7Sbg0pEFakhlksBBQ/I6RSGSuKGjz9k49FrX/mnmcv4Ok
 AjJkx7nIYfGkIGb8ltZjiKoaBR92lDh5lT03h7vs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240405051124epcas1p2bf5cf35b3047c5698f9ca4a9e69e58d6~DSjdKC-ai0826508265epcas1p2U;
 Fri,  5 Apr 2024 05:11:24 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.231]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4V9mmX0sYHz4x9Q7; Fri,  5 Apr
 2024 05:11:24 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 4C.1E.09663.BF78F066; Fri,  5 Apr 2024 14:11:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240405051123epcas1p271e78f5d3b844af6511d7e591df887d7~DSjcOEsKQ0445304453epcas1p2o;
 Fri,  5 Apr 2024 05:11:23 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240405051123epsmtrp2f2a5f9764c39b1081fecfee10c7a5cff~DSjcNSsTB0503805038epsmtrp2Z;
 Fri,  5 Apr 2024 05:11:23 +0000 (GMT)
X-AuditID: b6c32a37-2f9ff700000025bf-03-660f87fbcbc0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 29.C0.07541.BF78F066; Fri,  5 Apr 2024 14:11:23 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20240405051123epsmtip15d4fe3d57130e9c0c35db04f6492aa13~DSjb_hNYb2139921399epsmtip1G;
 Fri,  5 Apr 2024 05:11:23 +0000 (GMT)
From: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Seung-Woo
 Kim'" <sw0312.kim@samsung.com>, "'Kyungmin Park'"
 <kyungmin.park@samsung.com>, "'David Airlie'" <airlied@gmail.com>, "'Daniel
 Vetter'" <daniel@ffwll.ch>, "'Alim Akhtar'" <alim.akhtar@samsung.com>
Cc: <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
Subject: RE: [PATCH 00/11] drm/exynos: drop driver owner initialization
Date: Fri, 5 Apr 2024 14:11:23 +0900
Message-ID: <017601da8717$b3ebbee0$1bc33ca0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQEofrVXOxMdMsLkDHpOmMtI8zwlmAIjrw+ysqwUVQA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmge6fdv40gydXmC1OXF/EZPFg3jY2
 i//bJjJbXPn6ns1i7+ut7BZnm96wW2x6fI3V4vKuOWwWM87vY7KYMfklmwOXx95vC1g8ds66
 y+5x59oeNo/73ceZPDYvqffo27KK0ePzJrkA9qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hT
 MwNDXUNLC3MlhbzE3FRbJRefAF23zByg85QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqp
 BSk5BaYFesWJucWleel6eaklVoYGBkamQIUJ2RkdT/YyFpwQqrgw6xJbA2MffxcjB4eEgInE
 xadqXYxcHEICOxglOvbMY4JwPjFKXDvTzALhfGOUaP/xl62LkROsY/+J56wQib2MEo93fmSD
 cF4ySryfuoIFpIpNIF3ibncD2CwRgclMEqtOfGcGcZgFpjFKHJrbyQRSxSngL7HvVxMziC0s
 4C5xZOpUMJtFQEXi3YyXTCAX8gpYSjTNkwIJ8woISpyc+QRsAbOAvMT2t3OYIU5SkPj5dBkr
 RFxEYnZnG1hcRMBK4tCmJnaQvRICBzgk9jT+ZYFocJFYM3khI4QtLPHq+BZ2CFtK4vO7vWwQ
 DZMZJe5cX8EC4cxglDj88zpUh7HE/qWTwa5jFtCUWL9LH2Izn8S7rz2skGDllehoE4KoVpI4
 dvEGVKeExIUlE6Hh6CFx9fB9xgmMirOQ/DYLyW+zkPwzC2HZAkaWVYxiqQXFuempxYYFxvD4
 Ts7P3cQITrxa5jsYp739oHeIkYmD8RCjBAezkghvtwNvmhBvSmJlVWpRfnxRaU5q8SFGU2Bg
 T2SWEk3OB6b+vJJ4QxNLAxMzI2MTC0MzQyVx3jNXylKFBNITS1KzU1MLUotg+pg4OKUamA6W
 rJ8vaPnxpWui3O6prjVptps75desf9Gc8ObYtW0LQubwWFdu8+RZXdSiy/LraO5refGli2ws
 FvHYPHxaeX6mQtW8g2xf5wqUF5pont2juTA5l19KZ0P/ksN88+wf3On0XLFro6ehLGOPs7B1
 kq2oUHSpwgafhy07v7y06W45991MSuT0ai3bet72ylW1K1ms+lhqam9eEt+hkTUjzlPhw59r
 b+86z5LnvSywSn7dxa9VJrOetigFHeMx0Qp/qdq5yKj0/k1FYc4vrYuc1u+93L55/5OSv2VT
 /7vXM0/54L7oTK7t2+h/cT4Nbz8xqycKcB553ufuumCL2UO+3nqBEga5Y3luZw/mfrJfpcRS
 nJFoqMVcVJwIACrsKa9FBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsWy7bCSnO7vdv40g7+nFS1OXF/EZPFg3jY2
 i//bJjJbXPn6ns1i7+ut7BZnm96wW2x6fI3V4vKuOWwWM87vY7KYMfklmwOXx95vC1g8ds66
 y+5x59oeNo/73ceZPDYvqffo27KK0ePzJrkA9igum5TUnMyy1CJ9uwSujI4nexkLTghVXJh1
 ia2BsY+/i5GTQ0LARGL/ieesXYxcHEICuxkl9k5YwtjFyAGUkJDYspUDwhSWOHy4GKLkOaNE
 y/upzCC9bAKpEjc+fWQHSYgITGeSWNR7BGwQs8AMRom12y4xQbQsYJQ4dvQ5C0gLp4C/xL5f
 TWDtwgLuEkemQoxiEVCReDfjJRPIOl4BS4mmeVIgYV4BQYmTM5+AtTILaEv0PmxlhLDlJba/
 ncMM8YGCxM+ny1gh4iISszvbwOIiAlYShzY1sU9gFJ6FZNQsJKNmIRk1C0n7AkaWVYySqQXF
 uem5yYYFhnmp5XrFibnFpXnpesn5uZsYwfGnpbGD8d78f3qHGJk4GA8xSnAwK4nwdjvwpgnx
 piRWVqUW5ccXleakFh9ilOZgURLnNZwxO0VIID2xJDU7NbUgtQgmy8TBKdXAVLjF5JPe02fi
 T04HNBhF9uQvfVxed0Hp5qFnL2SVt6jMnL77tozuypsWmW8+v3/xc/GmK4/PbpUOcN070Ua9
 Kijl6zXdxmhzi6sbDvPuNoh+et57a1XKiTi5zwzKWdf+1JQWZJpcz15+osNQMnxFdF/tce8H
 C4+Z5kVduXCzqnjxslUW1yKA6YH18H/FBZrHJapqd1WsrvqaMePKbWZHB2vx6nKt3CNCfDdk
 V5o9PnmUL30vm2jahPXNN+rczYuVLCWXVkftfHThxrWQ/wvubZzEYKvYxz51hqXGrMjVM7ir
 Mh33HPki+NfK5JTG5Bdyrx4U3fBee6yJJaVXZFt6LbspV9iaxodx6lb+DZ9rlViKMxINtZiL
 ihMBXtExwy4DAAA=
X-CMS-MailID: 20240405051123epcas1p271e78f5d3b844af6511d7e591df887d7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240330203328epcas1p3132c85946c00e6a2432d3e23db6213e8
References: <CGME20240330203328epcas1p3132c85946c00e6a2432d3e23db6213e8@epcas1p3.samsung.com>
 <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Sunday, March 31, 2024 5:33 AM
> To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> <sw0312.kim@samsung.com>; Kyungmin Park <kyungmin.park@samsung.com>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Krzysztof
> Kozlowski <krzysztof.kozlowski@linaro.org>; Alim Akhtar
> <alim.akhtar@samsung.com>
> Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH 00/11] drm/exynos: drop driver owner initialization
> 
> Simplify the code by dropping unnecessary .owner initialization in the
> driver.

Applied.

Thanks. :)
Inki Dae

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (11):
>       drm/exynos: fimc: drop driver owner initialization
>       drm/exynos: fimd: drop driver owner initialization
>       drm/exynos: dsi: drop driver owner initialization
>       drm/exynos: g2d: drop driver owner initialization
>       drm/exynos: gsc: drop driver owner initialization
>       drm/exynos: mic: drop driver owner initialization
>       drm/exynos: rotator: drop driver owner initialization
>       drm/exynos: scaler: drop driver owner initialization
>       drm/exynos: vidi: drop driver owner initialization
>       drm/exynos: hdmi: drop driver owner initialization
>       drm/exynos: mixer: drop driver owner initialization
> 
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c    | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c     | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c     | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_mic.c     | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c  | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    | 1 -
>  drivers/gpu/drm/exynos/exynos_hdmi.c        | 1 -
>  drivers/gpu/drm/exynos/exynos_mixer.c       | 1 -
>  11 files changed, 11 deletions(-)
> ---
> base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
> change-id: 20240330-b4-module-owner-drm-exynos-d2f1b2d48af3
> 
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 


