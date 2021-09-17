Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3B40F828
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EBA6EC6E;
	Fri, 17 Sep 2021 12:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 499 seconds by postgrey-1.36 at gabe;
 Fri, 17 Sep 2021 12:43:30 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C553589E5B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:43:30 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210917123509euoutp01d514830b4e41c9732b2b0c0985ccbe7e~lnCHdJTK31899818998euoutp01c
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:35:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210917123509euoutp01d514830b4e41c9732b2b0c0985ccbe7e~lnCHdJTK31899818998euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631882109;
 bh=m1Y6LWA4PXoajOSun3pzOfX28Emf6U0QDQDDXYjTyUo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=N525ixmYaI2hd+M1rwOKqQVzKJ4Ph/PvZVgw5t2si/8X/FBgRxoFO7pfAgozcgP4m
 7ceKEKFFI5QyBzGnx/Ptl1NE5F2AGuMVW33EPSSxHSJszv0+3fI8/0ofAYSfaZUJfS
 oaaeMWeY1pTPoUuad1YLZqA3nCFg9yzbLN3K1Qyg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210917123508eucas1p1ca60528d596ee60f53e6b3499307e58d~lnCG4xCFU2999629996eucas1p13;
 Fri, 17 Sep 2021 12:35:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E3.73.45756.C7B84416; Fri, 17
 Sep 2021 13:35:08 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210917123508eucas1p2a73b5bf1cab9fac80de826cacfd817b8~lnCGVm2Fj2071520715eucas1p2a;
 Fri, 17 Sep 2021 12:35:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210917123508eusmtrp268e219a81f573fd96d703a8a52ea4af2~lnCGUPcK31459814598eusmtrp2E;
 Fri, 17 Sep 2021 12:35:08 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-0d-61448b7c201e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 37.FD.20981.B7B84416; Fri, 17
 Sep 2021 13:35:07 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210917123505eusmtip1840ad4dd0237808a52a6821790b51fda~lnCEVoqUS1263012630eusmtip1b;
 Fri, 17 Sep 2021 12:35:05 +0000 (GMT)
Subject: Re: [PATCH v4 24/24] drm/exynos: dsi: Adjust probe order
To: Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Thierry Reding
 <thierry.reding@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, Robert Foss
 <robert.foss@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org, Kyungmin
 Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, Xinliang Liu
 <xinliang.liu@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao
 <tiantao6@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Clark
 <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, John Stultz
 <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Joonyoung Shim <jy0922.shim@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <fc1fbd42-6ed4-9d67-2903-8f9cc2aaad43@samsung.com>
Date: Fri, 17 Sep 2021 14:35:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <29a2111d-024b-4d9e-27ef-e3399509ff32@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGc+69vf0wbS5Vw4kfGEvmGBsUlmWcRYMDcd6RmTln4qJx2OkN
 KFC0FV0dbEgFoThSJIHSgrQrG4xhmQhakUBW3WopbfkYhBEUURJoRU1hOJDBRrm68d/vfc/z
 fjxvDg8Xd5DreMfkpxiFXJYmIQXE9d/mPBFZRQmyKG33ZjRkcXPQt24Hhmq7LDj6feYZiSrH
 XQBdGtESaLzaAlDXfARyTPYTaOJ+D4FmF9o5yJU7yUWFJTVcVNLh4qK+1koS6TztGDL5Wwik
 m10EyFZ8EI2U6Zd6mGZxNKUfxVHdXAtA90rvAKQr9ZJorvUygX563M5FzZMlHPRrRz3n/Y30
 s8E8Lj3s9pD0Tf09Lv2o6iqXNhRUcGhzmxej72p7MXp4oI2kbzx/wKEvOz6hR4rsGG1vHeLS
 NWX9JF3cXA/oa86v6OmmkD3UAcG2o0zasdOMQhp7WJCSWxl1Qs3/suZ2HicHNHA1gM+D1DvQ
 3VSyxAKemKoDsLZqEGeDPwGcmvVibDANoGbGSGgAb7nE35DJ5msBdD18gQVaiSk/gN9XxAd4
 NRUHtVP3iYBoDWUkoPNcwXJbnOohYMtDDR5QkVQ01DzRkAEWUrHQa3VyAkxQr8E6TzcR4LXU
 EVi2kIuzmiDoqBhbzvOp7fAHTw4IME5tguoWA85yMBwaq15eG1IOARwuHCJZpwmwfuApzvJq
 6LM3v7zABvjPzVcFagBH3Ve4bHARwL5cHWBVW+Gw+wUZOABOvQEbW6VsOg4WNI29vIsIDj4J
 YpcQwUvXy3E2LYQF+WJWvQXq7Zb/xv7S3YtrgUS/wpp+hR39Cjv6/+caAVEPgplMZXoyo4yW
 M2cilbJ0ZaY8OfJIRnoTWPrjzkX7lBVU+fyRNoDxgA1AHi5ZI+zOipOJhUdlqrOMIiNJkZnG
 KG1gPY+QBAvrDQ1JYipZdopJZZgTjOLVK8bjr8vBslYpBvC9Bf7v3rq9vXr3mzv3t99S7TV/
 bI1PC9tc26n+MSb1bKjq9ZSr+8L4137+sPOQL0F6oHGfZqavKFQv9sPH3sNRD1yfDqqsu6cf
 LYS91xV6Pnwx8bNNGye/SY0n5nuOq2LIERDXGVEVkmhW3KgrX/X1RLYxxegM55dKHV+MihpF
 Mfl5A1vzrYIMM189YfLtCXvb6go136E+Lx9XnfyoJSR7x8VCX7W2aZvwD2gQ37qr3bnwgfp5
 rGsX/XRLZOnY/JW/gpst+42JjuNr10sPJpX1v9twWndoPt/9t0nSaZNvMJptsTsMJ3vCu9D5
 3rYz2aLGICd5jnOhON40dWGXhFCmyKLDcYVS9i/CyZHTUgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxTA+e69fZGR3VWMH8ShaUKcCoWW0n11QpEo3MUssWQucW5Ah1dg
 Qqu97RzDQSMhjhJZWRdSSuWRIUNWMLw2rAihoqXjUafSLB0PjW4MxJGCUwg+1oJL+O93Hr9z
 cpLDxfm3WeHcXJWW1qiUeQJ2MDH80jkZXVi+Xxl72RKHvG1jLHR+zIWhH0facHT33wU2ss6M
 AvTdtJFAM3VtAI2sRiPX/DiB/p76jUDLL/pYaPTsPAeVVTZyUGX/KAfdsVvZyOzuw1CDr5tA
 5uWXADkqjqLpKot/RsMyjhYt93HUvNIN0KRpECCzaZaNVuy1BPrpUR8Hdc1XstCN/hZW0tvU
 wu+lHGpizM2mrlgmOdSDC+0cquabahb1Q+8sRg0Zb2PUhKeXTf3y9B6LqnUpqOlyJ0Y57V4O
 1Vg1zqYquloA1TlcSC11RBwiPxbu1ah1Wnp7jprRJgiOipBYKJIhoVgiE4ri3v10jzheEJO4
 9xidl/sFrYlJzBTmnLXGnizhfdl4vZSlBzaOAXC5kJRAn01nAMFcPnkRQM/QAGYAPH9+K3RV
 6VnrvAk+9xjY600LAM6ZX7ADhU3kPmhcnCIChVCykYDXKz0gEODkOAH1NyyvFR+Ar5x2PKCw
 SRE0PDas6SFkIpztGV7bQZCRsNl9iwjwZjILPn70DFvveQu6qh+u5XmkHDa59SDAOCmFtZ33
 8XXeBku6a17zFuh9WIcZAd+yQbdsUCwbFMsGpR4QLSCU1jH52fmMWMgo8xmdKluYpc7vAP7n
 +vnmSlcPuDTnEzoAxgUOALm4IDTk1pl9Sn7IMWXBV7RGnaHR5dGMA8T776nEwzdnqf3fqdJm
 iKSx8SKJVBYbL5PGCbaESAZtGXwyW6mlT9D0SVrzv4dxeeF67GB/Hx120aA15/2Tzjl1qT5d
 Qcl9xtgPmtMOh32bcqWhY7L+QtTVw0+O/yVXFFuDIkxvtva2f//1gMS9MzX7+JGEJ5kfJVcf
 XLrWMVKzar/a2U75fi3fzdOBofKJoraZge1l3qAKU7qymSna0bR0zjEoP7F44LStPpp72WtL
 +TOhRz2VZHzGnGlNTcWKyZ3x3HvC0t3FN1tlb7SW3FldcWhMakXyq0Ll+a3byqK0BdLuqORP
 Hnz4nEqKoMGhXU0azFxbepc5cDo18jP5U/G5z4n9R3gxxQXWNKHqHXlmzbW0IDedop6IC0ss
 eN+5Izfjj/66U8GR73kgUYHPKfbMFgkIJkcp2oVrGOV/GhjNROUDAAA=
X-CMS-MailID: 20210917123508eucas1p2a73b5bf1cab9fac80de826cacfd817b8
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

Hi,

On 13.09.2021 12:30, Andrzej Hajda wrote:
> W dniu 10.09.2021 o 12:12, Maxime Ripard pisze:
>> Without proper care and an agreement between how DSI hosts and devices
>> drivers register their MIPI-DSI entities and potential components, we can
>> end up in a situation where the drivers can never probe.
>>
>> Most drivers were taking evasive maneuvers to try to workaround this,
>> but not all of them were following the same conventions, resulting in
>> various incompatibilities between DSI hosts and devices.
>>
>> Now that we have a sequence agreed upon and documented, let's convert
>> exynos to it.
>>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> This patch should be dropped, as it will probably break the driver.
>
> Exynos is already compatible with the pattern
> register-bus-then-get-sink, but it adds/removes panel/bridge
> dynamically, so it creates drm_device without waiting for downstream sink.

Right, this patch breaks Exynos DSI driver operation. Without it, the 
whole series works fine on all Exynos based test boards.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

