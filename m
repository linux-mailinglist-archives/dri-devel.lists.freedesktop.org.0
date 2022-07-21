Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4944757C9A6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 13:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B0B8EFFA;
	Thu, 21 Jul 2022 11:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 505 seconds by postgrey-1.36 at gabe;
 Thu, 21 Jul 2022 11:17:36 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEC48F002
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 11:17:36 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220721110909euoutp025ac4d05f4c0e42a47241222466432e8d~D05q8RO-A2736027360euoutp02P
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 11:09:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220721110909euoutp025ac4d05f4c0e42a47241222466432e8d~D05q8RO-A2736027360euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1658401749;
 bh=7pOn9np6llVa3IZhHrwwXPP31b6z7IHaZ8XQBWYI8V8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=bJq3RvutwfgDQDikXJcVoraJami3fTOGK+yqQyeZUe+GNFQJhy86ZcqSpxv6SjGvm
 ZrILB0ALPdyOcOuH6xY9znQeJ8VB3r5CTFxB8s6H00rkCcEp19JaKQ236pGvIjtZIB
 GWenP7iMuxKE7aWjqbk3zCzK/kI60dNrhMscw6j8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220721110908eucas1p2e15e0d766c4c57d37a9e731c41743247~D05qn4A890191601916eucas1p2x;
 Thu, 21 Jul 2022 11:09:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 7E.CE.09580.4D339D26; Thu, 21
 Jul 2022 12:09:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220721110908eucas1p2244b61e0d5fd4612af900bfdad3ff2de~D05p8JV6w0195301953eucas1p2u;
 Thu, 21 Jul 2022 11:09:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220721110908eusmtrp175890586794e6f4e0edf1748ed377ebe~D05p6nJZh0767307673eusmtrp16;
 Thu, 21 Jul 2022 11:09:08 +0000 (GMT)
X-AuditID: cbfec7f5-1bfc7a800000256c-06-62d933d4d57c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A2.E0.09095.4D339D26; Thu, 21
 Jul 2022 12:09:08 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220721110907eusmtip1b37088eb34c14bb2bc79248c9dd5c7bf~D05ozRGT60337503375eusmtip1V;
 Thu, 21 Jul 2022 11:09:06 +0000 (GMT)
Message-ID: <de9b3aa2-c1d4-6ee5-5061-27cec4bab679@samsung.com>
Date: Thu, 21 Jul 2022 13:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 08/13] drm: bridge: samsung-dsim: Add module init, exit
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>, Marek Vasut <marex@denx.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220720155210.365977-9-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRzved93716ms5cN4wmLrnl0Vx4oDfO59Ay86F66uuSy/qBfDPYG
 5IC5QSFRiQdjLpCBhPKSojEEdsIUaS7iPFvYJoslHiLyw52CydA5cRKIZTHeLP77fD/fz+f5
 PJ/nHgqX1JIRVFZOHqvJUahkpIiw/nLfHT0gv5y27vDwBjQ64sKRpzFAoJsjLSQamPGTqKLJ
 LUDVHiOB7nUYSTR5pZ9AfbtvCdGeKpMQNRtPk6hjfFCADPOtODrw22kM3dIVA+S6ZsFRb3Ep
 gex730N3uasLy31eEvU77+Jo9kEfHv8E0zbtETD+oVIhc4hzEkyNs0fAuMvHSOYHbkzI1Ovr
 BExjtxdjei42CpjRwW6S8XztwJiTpq+YE7dtGLO30wyYQEfk1sdTRJuUrCrrU1azdnOqKNPs
 PUioOarAaKogdwEXaQAhFKTj4HhrF24AIkpCtwBo85cI+OEegNbvODyoktABAHtb33/keGj3
 YDzfDOCxQ5/zhmkA9ZN6IrgQ05th8REzCGKCjoK1TZdIng+F5+omFjUr6XR4ar5MEMRSeiv8
 +2zXYhhOh8PhiQYseGgYbRFA30QNCA54MKF87uqiiqRjocFnWDw1hE6A/Vfq/3U/A0/5vl0s
 BOlvRHB/belCBLUwvAqHK6P5ClI45egU8vgp6NpXTvCSXPjXATlPF8DBm8dwHm+Eo+55MijB
 6eehpWstTyfAOyUWIe9cAYd8ofwFVsBq636cp8VQr5Pw6ucg52j/L/On8xdwI5BxSx6FW1Ke
 W1KF+z/3MCDMIJzN12ZnsFp5DvtZjFaRrc3PyYhJz83uAAtf1/XQMWMDLVPTMXaAUcAOIIXL
 wsTXd1xKk4iVip2FrCb3I02+itXawSqKkIWL07OOKyR0hiKP3c6yalbzaItRIRG7sKTqvOu6
 T0aKqnRSdfTrL6lftt13lEPnZNEF02NRb8zcSE2c7Xnxw7qN0qLz1JR44Pd3kq25mxSqvu62
 M/Ha7pS5REussnGseXn8u+dEa76gzrxmPeqTvJVSeeQPUeDsz2PmCHXUZPJtZovumq9MvKp9
 nf7XqYscdtTbW7mMXO8Mbde8/aN/robgOhue7NiTvG3nZHNK+ZsaVur4WPdle6Sy3i9KfFBY
 o8xIPWFcFnPQtvz7/qmkhMzL4x9UlJY0GatC25RxkdZC9+60uIKTZUkNI15DoNd8Z1vPmhvi
 V6q3x1StXlk2G71+y5+rmTDzhmGT6rjHv4N9+ll5b+RQpTweE8oIbaYi9gVco1X8Aw7i240p
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsVy+t/xu7pXjG8mGbzfwW5x5/ZpZov7iz+z
 WLy+vYLN4srX92wWvUvPsVpMuj+BxeLLpglsFi/uXWSxONv0ht2ic+ISdovlE/axWWx6fI3V
 ouvXSmaLGef3MVm8aWtktDj9aD2zxanGVhaLQ33RFp9mPQRKTn7JZnHxxCdmi++/zzI7iHms
 /Xif1eP9jVZ2j3mzTrB4TDlxhNXjXM9dNo+ds+6ye8zumMnqsXjPSyaPI1cXs3rcubaHzeN+
 93Emj81L6j02vtvB5NG3ZRWjx+dNcgH8UXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG
 5rFWRqZK+nY2Kak5mWWpRfp2CXoZq17OZSmYxVExYUkvWwPjabYuRk4OCQETiX+H7jN1MXJx
 CAksZZTYNu05O0RCRuLktAZWCFtY4s+1LjaIoveMEmuWfQBL8ArYSTQuXMUIYrMIqEpMW3qd
 DSIuKHFy5hMWEFtUIFmi5X8fWFxYwE/izaYGsHpmAXGJW0/mg20WEdjKKvFq2zqwDcwCHxkl
 Lk3ewg6x7jSjxKcV55hAWtgEDCW63naBjeIUcJS4eG82M8QoM4murV1QY+Ultr+dwzyBUWgW
 kktmIdk4C0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgQmnG3Hfm7ewTjv1Ue9
 Q4xMHIyHGCU4mJVEeJ8WXk8S4k1JrKxKLcqPLyrNSS0+xGgKDI6JzFKiyfnAlJdXEm9oZmBq
 aGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBaBNPHxMEp1cC0ZHn06xcf/7Q1uFQlebwXffuk
 fWKf9/VzCx6caLBU26sztVX34aWl8ezZmxZZNV7NCjv00FvrzNftV+1/W82zi44/EJn9aqsO
 b9IcPs/zEyImyeupXDvGnLGS54ftopc89VwluyJeZt7jTgv6omC6vKz0gvaV+xsLX5a23X//
 e9HK1DXSOoe8Tj998s5PoXRP5fIngXdWcrrzNVkf+P3vyRJRqbBsbuPg6VVZK9+lqv054DXh
 3RXHlqt6E9KO13g4f2pm2xIhcn5N4lmrpXE7nj7ZHOprIOVfc7LQ/9PiT24hAiWZ7fYq8y6d
 0XRnOTKxVfhi3oGjPLzBUtlnzVTZPdbeu7vh5Kw96mlCJsuPKLEUZyQaajEXFScCAJgrYtLB
 AwAA
X-CMS-MailID: 20220721110908eucas1p2244b61e0d5fd4612af900bfdad3ff2de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220720155329eucas1p1643af66a6bc9eb3cf478fc8b064a620f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220720155329eucas1p1643af66a6bc9eb3cf478fc8b064a620f
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155329eucas1p1643af66a6bc9eb3cf478fc8b064a620f@eucas1p1.samsung.com>
 <20220720155210.365977-9-jagan@amarulasolutions.com>
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
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 20.07.2022 17:52, Jagan Teki wrote:
> Add module init and exit functions for the bridge to register
> and unregister dsi_driver.
>
> Exynos drm driver stack will register the platform_driver separately
> in the common of it's exynos_drm_drv.c including dsi_driver.
>
> Register again would return -EBUSY, so return 0 for such cases as
> dsi_driver is already registered.

I've already pointed that this is a bad style solution. It will also not 
work in the following cases:

1. exynos drm and samsung-dsim compiled as modules - samsung-dsim 
module, once loaded, will register the driver and exynos_drm won't be 
able to register the exynos_dsi.

2. multi-arch case - if one compiles a kernel (disto-style) with drivers 
for both supported architectures (exynos and imx) - in such case it will 
not work on imx, because exynos_drm driver will always register 
exynos_dsi driver first (even if the kernel is booted on non-exynos board).

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

