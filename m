Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC177F05E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 08:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAA510E3F9;
	Thu, 17 Aug 2023 06:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF6110E3F9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 06:07:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230817060701euoutp026b0a5e6b360a2ffc9f547f157229c5a4~8FpxycKjV1089010890euoutp02f
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 06:07:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230817060701euoutp026b0a5e6b360a2ffc9f547f157229c5a4~8FpxycKjV1089010890euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1692252421;
 bh=FYvoe5it86uV+Aecr0w83b8o0onjpsE5/1nBVAIfEmU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=DwjHHbEGpJagb0ujnjRPVwaYDjLFgM08pQovTSuZO6xNvesC68ioTgSUQNxS7k0Ug
 PIhumaZdQxYZ7KBZHRr2uK0wAHVVGawf/+jiZf2zjdKMUUtEwzbfxjrjvicOjR+O2u
 QwjkIEnvt5elo8zXsF9MeIi5rYUEaKpP3xrtmAHA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230817060700eucas1p1fb19c8d1af8cbb4939114407effbe2ee~8Fpxhbi2y3211532115eucas1p1a;
 Thu, 17 Aug 2023 06:07:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B0.8B.42423.409BDD46; Thu, 17
 Aug 2023 07:07:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230817060700eucas1p129cbe0d5e3d54aa00a81bfda8e97f9f5~8FpxOTDm90120801208eucas1p1T;
 Thu, 17 Aug 2023 06:07:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230817060700eusmtrp1a65b88f5f9e1784eda7e43f7969fc723~8FpxNhGL21655516555eusmtrp1h;
 Thu, 17 Aug 2023 06:07:00 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-a8-64ddb9048831
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 94.19.14344.409BDD46; Thu, 17
 Aug 2023 07:07:00 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230817060659eusmtip157a6ca7d0bdd6f342d9039e51d7a14fd~8FpwgomP_1612416124eusmtip11;
 Thu, 17 Aug 2023 06:06:59 +0000 (GMT)
Message-ID: <daa749eb-fd67-b4b6-ffde-ab779547259b@samsung.com>
Date: Thu, 17 Aug 2023 08:06:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
Content-Language: en-US
To: Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <169175865996.293502.7367123633298049810.b4-ty@kernel.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djP87osO++mGGyeZWRxf/FnFosrX9+z
 WXzZNIHN4vn8dYwWJ99cZbHonLiE3eJNWyOjxfudtxgtJs27yWrxufUfmwOXx9qP91k9Zjdc
 ZPGYN+sEi8fOWXfZPWZ3zGT1WLznJZPHplWdbB4nJlxi8rhzbQ+bx/3u40wBXFFcNimpOZll
 qUX6dglcGW+mLmEr2M5ecfvgKpYGxn62LkZ2DgkBE4lHel2MXBxCAisYJc6tfcHSxcgJ5Hxh
 lFjbXAKR+Mwo0XPiBVMXIwdYfefEGIj4ckaJGeeWMEE4HxklOmfNYgfp5hWwk/i4dgHYJBYB
 VYlXsxYwQsQFJU7OfAIWFxVIlXh2aw5YvbBAjsSSGY/BapgFxCVuPZkPtkxEwFli/TlbkPnM
 AieZJNbsvAJWzyZgKNH1tosNxOYUcJfYtmc+C0SvvMT2t3OYQRokBGZzSlw81AFWJCHgIjG9
 oZ8JwhaWeHV8CzuELSNxenIPC0RDO6PEgt/3mSCcCYwSDc9vMUJUWUvcOfeLDeQkZgFNifW7
 9CHCjhKPNv9ghwQLn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0mMev4Ori1By9cYp7AqDQLKVhm
 IXl/FpJ3ZiHsXcDIsopRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwoZ3+d/zTDsa5rz7q
 HWJk4mA8xCjBwawkwtvDeytFiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+27clkIYH0xJLU7NTU
 gtQimCwTB6dUA9OMk0uPcNnd17l97qloQMYyaUaufDfpxMn5M6YtP2Kw+u2rI8/mPn7ccmTb
 nBKGI9vSWJ4wLlHde1+BIyompybMJt2r7LOBWGDxt+yjjzkiD4QtlKi+8K7mqIH+7oNZxSvO
 c7Zl7andms6YLr/t20tNpQm+5aGbXpV7SX/bdHjmjNnirydXbV72uPFP1LbpnA+rZ607uOHr
 hqAA4VtT36fu185WZ98TOuXCXpsfimuulIbF/rjDx7VNMGJRcdPxbINr5izaX5oWTFbLLJcs
 2/d2ZY2r6SlpZ2fr8m8X9+n1RZs/yTjzxoVHWmZVmOetJ587b+xWtr+vupX5dPqhxMrbRlqJ
 57Znmti8UE5o3JipxFKckWioxVxUnAgAJZ1outcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xu7osO++mGHS8krO4v/gzi8WVr+/Z
 LL5smsBm8Xz+OkaLk2+uslh0TlzCbvGmrZHR4v3OW4wWk+bdZLX43PqPzYHLY+3H+6wesxsu
 snjMm3WCxWPnrLvsHrM7ZrJ6LN7zkslj06pONo8TEy4xedy5tofN4373caYArig9m6L80pJU
 hYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jDdTl7AVbGevuH1w
 FUsDYz9bFyMHh4SAiUTnxJguRi4OIYGljBIXz29j7WLkBIrLSJyc1gBlC0v8udbFBlH0nlHi
 3LLXYAleATuJj2sXsIDYLAKqEq9mLWCEiAtKnJz5BCwuKpAq8f3WPjYQW1ggR2LJjMdgNcwC
 4hK3nsxnAjlCRMBZYv05W5D5zAKnmSSW7JjBCrHsAqPEw0uTwJrZBAwlut52gdmcAu4S2/bM
 Z4EYZCbRtbULaqi8xPa3c5gnMArNQnLHLCT7ZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLS
 vHS95PzcTYzAON527OeWHYwrX33UO8TIxMF4iFGCg1lJhLeH91aKEG9KYmVValF+fFFpTmrx
 IUZTYGBMZJYSTc4HJpK8knhDMwNTQxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5O
 qQamaSJfOWIbz59XefXoj/+HFVUub54YyVYEFn3fKBb66H35woueJ/35vVs/r1kmdutvp4u2
 1OW89fEyV85d+OIZzCm65Nf8mx8/9Gxivtv2MLEykk/RM1/jf31nomLE52L2CI5PPkUCxvv1
 BS7//GriU3z9RmLts9c3xJvzPxarC3f2GZ9wWa2R/9DAtSbGjvXXgsm+03b5BNpmbVhZc6T8
 l5r+t2sR2jKzU17dSrq8Y9e30325htkuxdMLZG42PHHZFbRry/JnO68lfbvdYn3+7L9Wlqi3
 kuXXJNaW7v79Mefu9vJ6qX2lJ4OTzfwMOO2PJKW2P3vCkTl98iYPv5J1HQ0tF+bk3nX6Xnpn
 4oIUJZbijERDLeai4kQA7KMcvGwDAAA=
X-CMS-MailID: 20230817060700eucas1p129cbe0d5e3d54aa00a81bfda8e97f9f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2
References: <CGME20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2@eucas1p1.samsung.com>
 <20230809145641.3213210-1-m.szyprowski@samsung.com>
 <169175865996.293502.7367123633298049810.b4-ty@kernel.org>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.08.2023 14:59, Robert Foss wrote:
> On Wed, 9 Aug 2023 16:56:41 +0200, Marek Szyprowski wrote:
>> Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
>> doesn't report empty level of packer header FIFO. In case of those SoCs,
>> use the old way of waiting for empty command tranfsfer FIFO, removed
>> recently by commit 14806c641582 ("Drain command transfer FIFO before
>> transfer").
>>
>>
>> [...]
> Fixed formatting warning related to commit message syntax.
>
> Applied, thanks!

Thanks for applying it, but yesterday I've noticed that this patch has 
been dropped from linux-next for some unknown reasons. I also cannot 
find it in today's linux-next (next-20230817):

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/drivers/gpu/drm/bridge/samsung-dsim.c?h=next-20230817

Any idea what has happened?


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

