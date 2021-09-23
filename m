Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CD4159DE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 10:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D41D6ECF6;
	Thu, 23 Sep 2021 08:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CE26ED02
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 08:14:33 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210923081431euoutp01d3fd0934e07158cc509e4641c6bb16e1~nZWRibLLU0128901289euoutp01A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 08:14:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210923081431euoutp01d3fd0934e07158cc509e4641c6bb16e1~nZWRibLLU0128901289euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632384871;
 bh=yNljC3lhlzvkgfEvJYswOqoHieAqwy4m//l5R64LCFw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FZPZ2aVG4rIIYLxscSuq8HH+SQOiapZP9X6qNC+PoH9df8Z74yTAmmpzaVYJWkIpz
 Id4SiX44otxjoRK7TIZ1g9VWp660gRVsB4HMOBcpns94jzIw+cAm1Iaz8J4N7k6J85
 DILnCQ0y769NXGo6w+zE8y4CY4nAluCUp3Nnw+2Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210923081430eucas1p179b042d2570012764588bac8b2d5d26c~nZWQw9onn0857408574eucas1p1h;
 Thu, 23 Sep 2021 08:14:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 27.F3.45756.6673C416; Thu, 23
 Sep 2021 09:14:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210923081430eucas1p12d75e91b0dd5563ace62b9aff303eb5c~nZWQCpt4K0328203282eucas1p1B;
 Thu, 23 Sep 2021 08:14:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210923081430eusmtrp1527e16d88a5802f8424922dc13ee89c9~nZWQBCJRI2584725847eusmtrp11;
 Thu, 23 Sep 2021 08:14:30 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-97-614c3766e789
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F8.24.20981.5673C416; Thu, 23
 Sep 2021 09:14:29 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210923081428eusmtip2872dfc213f889ff46f91b55ffa143f8f~nZWOgaVhD0303903039eusmtip2Y;
 Thu, 23 Sep 2021 08:14:28 +0000 (GMT)
Subject: Re: [PATCH v4 24/24] drm/exynos: dsi: Adjust probe order
To: Maxime Ripard <maxime@cerno.tech>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Thierry Reding
 <thierry.reding@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, Robert Foss
 <robert.foss@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sean
 Paul <sean@poorly.run>, freedreno@lists.freedesktop.org, Kyungmin Park
 <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, Xinliang Liu
 <xinliang.liu@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao
 <tiantao6@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Clark
 <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, John Stultz
 <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Joonyoung Shim <jy0922.shim@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <de030bcc-bd8a-c43b-7466-c260dbdd2ff3@samsung.com>
Date: Thu, 23 Sep 2021 10:14:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922085308.udvhfbzpn3vpbksr@gilmour>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se1BUZRyd775ZW+a6SHxDprkzillANIx8aa2akXcabHw0aeBkm17BEdDZ
 heRhM7COBgjEsoJweYWiECQE8hAGIVhpXYGFQJIhXuYGQhjDosS7drlY/He+3znnd85v5mNw
 WT3lzJwMDuFVwcpAOSUhKn+eaXM94eWjfCtT7456ik0kSjAZMZTfUoyjB8/HKZQ53ApQ8kAS
 gYZzigFqmXNFxrEuAj3p/4VA0wt1JGrVjNEoVptHI219K406azIplNZWh6HciQoCpU0vAtSY
 6IcGUgXrjtxpHFmERzgqmKkAqE93F6A03QiFZmqyCVT0Zx2Nyse0JGqqLyR3vsqNd1+guV5T
 G8VVC3009zirlOYyYtJJ7lrtCMbdS+rAuN5faymuamqQ5LKN+7mBSwaMM9T00FxeahfFJZYX
 Au5WcyQ3WbZuH+srefc4H3jyK17lrvhCEhBdEXCm6KUwnbkFjwIXJHHAjoGsJ+zSllBxQMLI
 2AIAo4smCRshY58BqLm0XiQmAcy9XE2+cMy1fE+LRD6AFX/PLdsnAEwcurtkd2B3wSRL/xJe
 w26EDxLu4DYRzpoYOHW/mLIRFOsB457GLWEpq4Apt3IxGyashvT834ANO7LHYOqCBhc1q6Ex
 3by01I7dCtsnCpfmOLsenq/IWMZOsMecg9nCINskgYuPE5Z7fwAfXhzERewARw3ltIjXwmZd
 PCEazgP4yHSTFh/xAHZq0oCo2g57TbPWqow14nVYUuMujnfBmDJbI8aK7WH309ViCXuYXHkF
 F8dSGHNRJqo3QcFQ/F9sQ3sHngTkworThBXnCCvOEf7P/Q4QhcCJD1UH+fNqj2D+rJtaGaQO
 DfZ3O3Y6qAxY/3jzosFyG2SNTrg1AowBjQAyuHyNdLL7I6VMelwZHsGrTh9VhQby6kbwCkPI
 naSFGT8clbH+yhD+FM+f4VUvWIyxc47CQun6/oNHgv2q781+3DO1mfzpdx/Hhy7J0k9He3L2
 btnJbsgy9zWEvXFI/3WY4zfpXjdmSxWda+9XnXLaG5rhJ3GYwYa1mvmhkvdKb8Sn3bEMjoe/
 GRHvHV9bTkrJ7FWv5bHGZ2Fy5fsL8/+0u+PO+65O+5o2Vb1Dbgv5rFXY+uHG62+bU3fM+UVc
 ryx42d/TpVq/+2YB8SRTuc6iB4ovD1g6Kh29W/aQXmT7J+dchQYFP1g/ktKUsu2sd8F++2jf
 zbF2SS4x270cD3fouD+iPt9wQnNE9zxSv8eJ0vjML+h337686uDh8B2KcyFXf0zp/faK+S9f
 YaRuZChS6gnqsucOxYbLCXWA0mMLrlIr/wWaiEQcUgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxiH/c45PadlYznWIl8IbrNxJsNY2trWDyyEXZwnbkxHtj+UTNbB
 4TKBQlsMc8nCFDLoJhYLCAWLBBW5DDehbDaIrkOwobTjGsIEJBCBUUKKYdKBZoW6hP+e5P09
 7yV5uTh/gBPCTcvUsZpMVbqQDCB6X/RM7GcPfqQSuy5GorEWJwddcNoxVO9owdHQyhKJqmf7
 ALo0aSDQbE0LQI61/cjuHibQ3EQ/gVafd3JQ3zk3hYpKrlGo5F4fhQat1SSqcHViqNZjIVDF
 6guAbMXxaLLc5OtRu4qjZdMUjm56LQCNG7sAqjDOk8hrNROoaaGTQm3uEg56cK+RE7OLWRot
 oJhHThfJ3DGNU8z0lV8opqqwksPUdcxjzEPDAMY8GukgmV//ecxhzPZPmMkfejCmxzpGMdfK
 h0mmuK0RMK293zBPb79+nD4pUmrUOTr2zVS1VhcljJcgqUgSgURSWYRIcuDg55FSuTA8WpnE
 pqedYTXh0V+IUr+zpGY1vZprnHHgeaAgQA94XEjL4JqjgdKDAC6fvg6gYfE57i+EQnt5HsfP
 O+D6iJ70h5YANF/xbhZ20O9Aw/IEscEC+i04dOEuvhHC6SEu7M8f4/iNAQzarPWbBklLoH5x
 oxWPG0hHw7LWWmyDCZ9dWf8X2OAgOhEuLjzD/Jnt0F45szmBRyvgn57GzfVwH5tbp17yG/C8
 peolB8OxmRrMAPimLbppi2Laopi2KFcB0QgEbI42IyVDKxVpVRnanMwUUaI64zbwPVd7t7ft
 N9Dwt0dkAxgX2ADk4kJB4NPRoyp+YJLq67OsRp2gyUlntTYg991TgocEJap935mpS5AoxHKJ
 TBEhlkcoDgiDA2VdzQl8OkWlY0+zbBar+d/DuLyQPOx6cr/llC00ZidhGn/XjOV6cOWna9Iv
 rVFketnopa68wsEqwc8jx5Rni8PKukGwONZ9dNtX90dJKld80ShLI27VlsoX9rClBXd2w71P
 lsAzYV32TnXprb3v3TgSF7ote/u3zer1edm+16ada9P68nXqe1fMenLN8eCfBILY5TSj5NyJ
 9xWVvIf5UXMe1aFDYc3rTYLxBu/bv9/IOrKYLWi3z352QrI7yXU6nnzl7p4VQ/fJj+fyWx7/
 qHamNPNQsSxcWeOYGp65HwvnDn+wEll4vjpuISQS/MtEWS1B/R2hZ7yD+y5/6O6tC0v+w81f
 iYMPQkaK2tsvP9l1U1BUeOqwkNCmqiRhuEar+g8p4MSc5QMAAA==
X-CMS-MailID: 20210923081430eucas1p12d75e91b0dd5563ace62b9aff303eb5c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210910101445eucas1p172f99ff7fe853052fc457861c3174f9e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210910101445eucas1p172f99ff7fe853052fc457861c3174f9e
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CGME20210910101445eucas1p172f99ff7fe853052fc457861c3174f9e@eucas1p1.samsung.com>
 <20210910101218.1632297-25-maxime@cerno.tech>
 <29a2111d-024b-4d9e-27ef-e3399509ff32@samsung.com>
 <fc1fbd42-6ed4-9d67-2903-8f9cc2aaad43@samsung.com>
 <20210922085308.udvhfbzpn3vpbksr@gilmour>
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

Hi Maxime,

On 22.09.2021 10:53, Maxime Ripard wrote:
> On Fri, Sep 17, 2021 at 02:35:05PM +0200, Marek Szyprowski wrote:
>> On 13.09.2021 12:30, Andrzej Hajda wrote:
>>> W dniu 10.09.2021 o 12:12, Maxime Ripard pisze:
>>>> Without proper care and an agreement between how DSI hosts and devices
>>>> drivers register their MIPI-DSI entities and potential components, we can
>>>> end up in a situation where the drivers can never probe.
>>>>
>>>> Most drivers were taking evasive maneuvers to try to workaround this,
>>>> but not all of them were following the same conventions, resulting in
>>>> various incompatibilities between DSI hosts and devices.
>>>>
>>>> Now that we have a sequence agreed upon and documented, let's convert
>>>> exynos to it.
>>>>
>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>> This patch should be dropped, as it will probably break the driver.
>>>
>>> Exynos is already compatible with the pattern
>>> register-bus-then-get-sink, but it adds/removes panel/bridge
>>> dynamically, so it creates drm_device without waiting for downstream sink.
>> Right, this patch breaks Exynos DSI driver operation. Without it, the
>> whole series works fine on all Exynos based test boards.
> Thanks for testing. Did you have any board using one of those bridges in
> your test sample?

Nope, the only bridges I've tested are tc358764 and exynos-mic. However, 
both are used in a bit special way. The rest of my test boards just have 
a dsi panel.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

