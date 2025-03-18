Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438FBA671EA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 11:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397C910E34B;
	Tue, 18 Mar 2025 10:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ABNMuS0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 554 seconds by postgrey-1.36 at gabe;
 Tue, 18 Mar 2025 10:59:13 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EDD10E34B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 10:59:13 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250318104953epoutp03165a5eccc6b803a54ce0ec5787f25a07~t4BDVhsb41818618186epoutp03n
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 10:49:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250318104953epoutp03165a5eccc6b803a54ce0ec5787f25a07~t4BDVhsb41818618186epoutp03n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1742294993;
 bh=ym3JInl4vR0nG186B998FYal7OWkBgTZa/2aQcc7KTU=;
 h=From:To:In-Reply-To:Subject:Date:References:From;
 b=ABNMuS0w1oN5eCXY88m8C/24HFNrziboGlTK2I34+eG6wPxem2LIXCiChBQilMLGJ
 f6Ivcg6ydXkEjYyi/eCGXvUs234X3QMRt1aZLfxIc+NqwElTGG9JUVF22iHGg0lgtE
 BoxE97ZAYzY8JmavTeEpbmwwL7VKMp4c3tQtKLLI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20250318104952epcas5p1bab98c72fe30d154e48be3ccc50988bc~t4BCd4Bn31421314213epcas5p1q;
 Tue, 18 Mar 2025 10:49:52 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4ZH7rv40Dtz4x9Pw; Tue, 18 Mar
 2025 10:49:51 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 60.14.19956.FCF49D76; Tue, 18 Mar 2025 19:49:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250318104951epcas5p1bbd5161355a2945697a30731f5c5693e~t4BA2pTUw1189511895epcas5p14;
 Tue, 18 Mar 2025 10:49:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250318104951epsmtrp121ba47b1053e067737a67ac4abd40616~t4BA1X0cE1339813398epsmtrp1S;
 Tue, 18 Mar 2025 10:49:51 +0000 (GMT)
X-AuditID: b6c32a4b-fe9f470000004df4-25-67d94fcf9868
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7C.42.18729.ECF49D76; Tue, 18 Mar 2025 19:49:50 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20250318104949epsmtip2af533e8fe37fcd9e8210461e70ef00d2~t4A-Rg1DL1762917629epsmtip2u;
 Tue, 18 Mar 2025 10:49:49 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Inki Dae'"
 <inki.dae@samsung.com>, "'Seung-Woo Kim'" <sw0312.kim@samsung.com>,
 "'Kyungmin Park'" <kyungmin.park@samsung.com>, "'David Airlie'"
 <airlied@gmail.com>, "'Simona Vetter'" <simona@ffwll.ch>, "'Krzysztof
 Kozlowski'" <krzk@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20250318080738.29292-1-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH] drm/exynos: exynos7_drm_decon: Consstify struct decon_data
Date: Tue, 18 Mar 2025 16:19:48 +0530
Message-ID: <000c01db97f3$7976af70$6c640e50$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMPSnGnw8L0peP48BxqkWeMoAcDzwE4FBB6sQeQ6cA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmuu55/5vpBkd/SFqcuL6IyeLK1/ds
 FpPuT2CxOH9+A7vF3tdb2S3ONr1ht9j0+BqrxeVdc9gsZpzfx2Qx+91+dosZk1+yOXB77P22
 gMVj56y77B6bVnWyedy5tofN4373cSaPzUvqPfq2rGL0+LxJLoAjKtsmIzUxJbVIITUvOT8l
 My/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hQJYWyxJxSoFBAYnGxkr6dTVF+
 aUmqQkZ+cYmtUmpBSk6BSYFecWJucWleul5eaomVoYGBkSlQYUJ2xoQHX1kLNrBX3P5ymq2B
 cQNbFyMnh4SAicTPtSfYQWwhgd2MEtPn60PYnxgletvzuhi5gOxvjBLdu06wwDT86mljg0js
 ZZT4/OcwI4TzklFizaPnTCBVbAK6EjsWQ1SJCJxjlnjXsgUswSngIvF0/UtGEFtYIFDixucv
 YLtZBFQlZsybzAxi8wpYSvz/v48NwhaUODnzCdhqZgF5ie1v5zBDnKEg8fPpMtYuRg6gBVYS
 d2/VQJSIS7w8eoQdZK+EwB4Oiel717BD1LtI7F/yDeoFYYlXx7dAxaUkXva3QdnxEvverGCC
 sAsk1lz7B1VvL7F6wRmwXcwCmhLrd+lD7OKT6P39hAkkLCHAK9HRJgRRrSrR/O4qVKe0xMTu
 blYI20Pi855OJkhYTWeUOPL7MPMERoVZSL6cheTLWUjemYWweQEjyypGydSC4tz01GLTAuO8
 1HJ4fCfn525iBCdjLe8djI8efNA7xMjEwXiIUYKDWUmE1/3J9XQh3pTEyqrUovz4otKc1OJD
 jKbAoJ/ILCWanA/MB3kl8YYmlgYmZmZmJpbGZoZK4rzNO1vShQTSE0tSs1NTC1KLYPqYODil
 Gpj6Jj/cziM4403KrDRr+9zfaXYTQyLET0dGzrX+mvjkv9XDwo6E3M+PPjTM4pv1WeZZ8lOL
 sMjuG66Wjb6n2OUi739ZumQyy3Qf14OZHe9NfszpEXxgkx7LXMLlEvep5r1vn+zzad5evf48
 mtLdf0vDHhuxrepq9BVIu3V+hx3f5p5Vp7ojV1qzyboJqbTrhAo1S6jtlfrr1HHwhumjVbr2
 MizLDqjO5Pz2uzD6Yvlrl5Jas++iEdW21x62Ce20MG258ezdpHuZO5c5yb4MKGe7wD/TZca+
 4+f2NS0LkC80maW+/Gj3OtaT9Q1qpxjM/JYdZGaPuqC87+027v0Ggct3cZeYruHZfZIreofv
 diWW4oxEQy3mouJEANqX1itPBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvO45/5vpBr8e21icuL6IyeLK1/ds
 FpPuT2CxOH9+A7vF3tdb2S3ONr1ht9j0+BqrxeVdc9gsZpzfx2Qx+91+dosZk1+yOXB77P22
 gMVj56y77B6bVnWyedy5tofN4373cSaPzUvqPfq2rGL0+LxJLoAjissmJTUnsyy1SN8ugStj
 woOvrAUb2CtufznN1sC4ga2LkZNDQsBE4ldPG5DNxSEksJtRor/jPQtEQlri+sYJ7BC2sMTK
 f8/BbCGB54wSrZfrQWw2AV2JHYshmkUErjFLbP3azg4xaSqjxM4d28E6OAVcJJ6uf8kIYgsL
 +Euc6FgGFmcRUJWYMW8yM4jNK2Ap8f//PjYIW1Di5MwnQFdwcDAL6Em0bQRrZRaQl9j+dg4z
 xEEKEj+fLmMFKRERsJK4e6sGokRc4uXRI+wTGIVmIRk0C2HQLCSDZiHpWMDIsopRMrWgODc9
 t9iwwDAvtVyvODG3uDQvXS85P3cTIzjutDR3MG5f9UHvECMTB+MhRgkOZiURXvcn19OFeFMS
 K6tSi/Lji0pzUosPMUpzsCiJ84q/6E0REkhPLEnNTk0tSC2CyTJxcEo1MJVMe7TJ66y/4bVl
 nUdY12topEhzPrp5110g/8Ud/QI+lZuT9ZqrzBIfcCptCNXI4s7rZJCr3sZ6h2uKG1umksvr
 6Kb+wOiL/ous8q2Y/zfelJLstTSbVB8R5Bmx7tWZVtc7l4rNPV9NaNvsEb120g/eYrecVOMp
 ERF3ZHtDs6eV+0yZENNrqiwZs0KysE8l5tAZB4W1DYlfly5dxPTp//lH9gFT6yfGbT9a+2vy
 1RJb9+9X/lnnqt1M5toq23P0XN1r9fonOpujq9WWsFTX/Z5imD4p3FiJUf3Bn0zzS6wKL67K
 LbFh4Sh+cVh0UflE+8MGEb4a3LLxl+vvSi7nsY+fXtY0M0lvh2jEHnMlluKMREMt5qLiRACB
 4ZkMKgMAAA==
X-CMS-MailID: 20250318104951epcas5p1bbd5161355a2945697a30731f5c5693e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318080746epcas5p476317bb7bae69a8a85b5ad870bb3d0a5
References: <CGME20250318080746epcas5p476317bb7bae69a8a85b5ad870bb3d0a5@epcas5p4.samsung.com>
 <20250318080738.29292-1-krzysztof.kozlowski@linaro.org>
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

Hello Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Tuesday, March 18, 2025 1:38 PM
> To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> <sw0312.kim@samsung.com>; Kyungmin Park
> <kyungmin.park@samsung.com>; David Airlie <airlied@gmail.com>; Simona
> Vetter <simona@ffwll.ch>; Krzysztof Kozlowski <krzk@kernel.org>; Alim
> Akhtar <alim.akhtar@samsung.com>; dri-devel@lists.freedesktop.org; linux-
> arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: [PATCH] drm/exynos: exynos7_drm_decon: Consstify struct
> decon_data
> 
> static 'struct decon_data' is only read, so it can be const for code
safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



