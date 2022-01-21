Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35A495E75
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 12:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D135610EA06;
	Fri, 21 Jan 2022 11:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61E510EA06
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 11:36:49 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220121113648euoutp028d9c3c6524b300bc266644351ecb6811~MRhI7_guh1010510105euoutp02x
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 11:36:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220121113648euoutp028d9c3c6524b300bc266644351ecb6811~MRhI7_guh1010510105euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1642765008;
 bh=taR1DmvbSDR0p70/Kn688mywopIx7fIf4Iwk53wSB1o=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=QXCoIe2yP6K5gzRQyGlabPexqeZ2h/d94Cw3JiWTNt9r/v7usf8BAwYPL8Od5msy0
 8meqA4jpw9XVJMBT5p/N8RhVgc9o1RCuqhR7pr2i6n4GI68J2KiVZKro1tYo9mx9Nv
 VZ6r+slPlzn1PJV/gNIKBtkWq+IQxC+REeiXkKbw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220121113647eucas1p269818caa5f76b23348cd3ab42db16702~MRhIoF-wX2564125641eucas1p2n;
 Fri, 21 Jan 2022 11:36:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 8F.EE.10260.FCA9AE16; Fri, 21
 Jan 2022 11:36:47 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220121113647eucas1p167fdee1f5ea63f6468a12291455a5add~MRhIRNfrd1120911209eucas1p13;
 Fri, 21 Jan 2022 11:36:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220121113647eusmtrp2c327bcb56f7f63455267b7a743dcd4ca~MRhIQb0Qf0066000660eusmtrp2F;
 Fri, 21 Jan 2022 11:36:47 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-8d-61ea9acffc8c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 02.0E.09404.FCA9AE16; Fri, 21
 Jan 2022 11:36:47 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220121113646eusmtip266a91f77f807f2939e0723b728371fa8~MRhHtC2H51221512215eusmtip2O;
 Fri, 21 Jan 2022 11:36:46 +0000 (GMT)
Message-ID: <ea77747c-3310-5460-316c-a88042083e98@samsung.com>
Date: Fri, 21 Jan 2022 12:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/5] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220117084225.125868-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BMcRTH/e693b0ta66V2SNG7Hg202ukuaNEk7iew4wxeQyu25VGbdlV
 XsMkojbTbqVo1TBTpiyhLdWaGC3TTszYQokikUfRY3sMNQrb9ei/z+97zvmex/woXG52cqUi
 VAcEtYqLVJJSoqx60OZhM3Rw3r1v5zEteX0E83ygm2TSW/QE02/Sk0xyWr6EKdDfI5lHJxIJ
 xpK6jek1tOJM4eBttEzKFtlbnNjuxkQJezEp24nNq2zH2OaGSpJtSbFibH5WPcmmlhrRBmqr
 NCBMiIyIE9Regbuke8szs/CYzgmHKsq7JPFoWKpFFAW0L2T2xWqRMyWnCxE0XqW0SPqb+xF8
 MjUg8dGHoNZmIf4WJHeFinoBgsFqIyFW2xF8i5/tYBkdCDevxCMHE/QcuPbahIn6JKjJbhv1
 mULvhrOngh3yZHoZtOkej9rgtAJetV3CHP4u9DsMPvz46SQGVsKHr2W4g0naB7SdWtLBznQQ
 3E14hYk5blDemYM7ioHWOcOPms+jrkAvh9q0i394MnRYSyUiT4efZrEb0CcRtD4pkoiPswie
 JVxAYpY/ND8ZIh1j4/QCuHnHS5SD4EXpdYl4lYnQ2DlJHGIipJedx0VZBkmn5WL2XDBYb/xr
 W1X7FNcjpWHMWQxj9jeMWcfwv+9lRBiRQojVRIULmoUq4aCnhovSxKrCPfnoKBP6/bsej1gH
 KlBhh93TgjAKWRBQuNJFFhPdwcllYdzhI4I6eqc6NlLQWNA0ilAqZHzELU5Oh3MHhH2CECOo
 /0Yxytk1HgtSLHSbyvdINiobiJEzOTOmZfodyw8JPtifMl6HdNGnt1fxDTXr/YpeFo0E7PBu
 yixZpJ8e8oB3d9v5fkreRtxo3zKkHmlrWtWzemn4vZKkZ/582KxZ9Uen1svT5R4eqGTzmrr7
 tqsVdUu2fPwUuvuhe5Nfl+/wmTffvDKwYzZW1/ze1F68NnhTXY7ii9m1yqes6vK5mSnXW6n6
 CaGHixPvHg98kSEB6mnGuPmPirPSNLDOxf1UML/HnDs/fVgXp8oOzb1kbPc/JLV3h7xlzg/4
 zqweGuxPHTd7BW9KCOrpZa3Jld7lrLVr5fPPgf77zxVUB4QlLv5u9i3I5VfElTZnKAnNXs7H
 HVdruF9uUs1zzAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xe7rnZ71KNLh9ms/i/uLPLBZXvr5n
 s5h0fwKLxZdNE9gsOicuYbdYPmEfm8WpxlYWi0N90RafZj1ktljxcyujA5fH2o/3WT3e32hl
 95jdMZPVY/Gel0wed67tYfO4332cyWPJtKtsHn1bVjEGcETp2RTll5akKmTkF5fYKkUbWhjp
 GVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZWyfOo254C1PxY7t79gbGP9ydTFycEgI
 mEh0vovoYuTiEBJYyigxs+s7YxcjJ1BcRuLktAZWCFtY4s+1LjaIoveMErN3bmIDSfAK2Ems
 X9oA1sAioCqx+u4mJoi4oMTJmU9YQGxRgSSJhmPdYPXCAg4ST/pPg8WZBcQlbj2ZzwQyVETg
 GZPE0U1rWSES7hJP32xjBrGFBKYwSnR/sQWx2QQMJbredoEN4hRwlNjbdIsJot5MomtrFyOE
 LS+x/e0c5gmMQrOQ3DELyb5ZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzBi
 tx37uWUH48pXH/UOMTJxMB5ilOBgVhLhLch/lSjEm5JYWZValB9fVJqTWnyI0RQYGBOZpUST
 84EpI68k3tDMwNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgUl93t0mhs+y
 cQctFW/8OpN01siFZ4ZBZInd5bS7739aXLdnSpM9cHbZZSX3bP49MaEvpoXpZE86NKvs8D3N
 tk26Gc8vvnH4yXXk/rId5YfMvuTWXdlm+WvnluxV+479C8kOcTwUu4clQk/1i/yv6Pfv1wc2
 rVZauvJ3DHO6mv9e8xVK679O1+yY6Jq03fTvvECX0Df5gTON4vkS467OZL9tlp4bZf/7hOq3
 +leBO9POm926/eZ/+dy3HPyPzmb+Tao3mLd+/svEdR5RoRJxpb5LQ9ddKo3ROOOdIH3GL5d1
 2dqE6ILzdUoFwfuZ6q+ePNEdk1uyge0u5+YO6dlH5l84nmG/RaAhN8/31amwY25KLMUZiYZa
 zEXFiQCP2HHDYQMAAA==
X-CMS-MailID: 20220121113647eucas1p167fdee1f5ea63f6468a12291455a5add
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220117084237eucas1p10169f6fd49d0784db0cba4606fd5c6bb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220117084237eucas1p10169f6fd49d0784db0cba4606fd5c6bb
References: <CGME20220117084237eucas1p10169f6fd49d0784db0cba4606fd5c6bb@eucas1p1.samsung.com>
 <20220117084225.125868-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17.01.2022 09:42, Jagan Teki wrote:
> Updated series about drm bridge conversion of exynos dsi.
>
> Previous version can be accessible, here [1].
>
> Patch 1: connector reset
>
> Patch 2: panel_bridge API
>
> Patch 3: bridge conversion
>
> Patch 4: atomic functions
>
> Patch 5: DSI init in pre_enable
>
> Apply below patches to test on Exynos DSI:
> - https://protect2.fireeye.com/v1/url?k=53bdf119-0c26c815-53bc7a56-000babff3563-792dc1a6b54db43e&q=1&e=9a4ea3ad-9e7d-443d-ad21-ce694a7cd352&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
> - https://protect2.fireeye.com/v1/url?k=cb269ea3-94bda7af-cb2715ec-000babff3563-e6f545b4a32558ba&q=1&e=9a4ea3ad-9e7d-443d-ad21-ce694a7cd352&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1838%2F
>
> [1] https://protect2.fireeye.com/v1/url?k=ee1dae12-b186971e-ee1c255d-000babff3563-83eaf8e86e67e0d9&q=1&e=9a4ea3ad-9e7d-443d-ad21-ce694a7cd352&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fcover%2F1826%2F
>
> Any inputs?

I've tried a few times, but I am unable to find what is the base for 
this patchset. I always get a conflict around exynos_dsi_mode_set() 
function. I've tried current linux-next, drm-next, v5.16-rc1 and v5.16. 
It looks that I must have missed applying some patch before playing with 
this.

I've also tried to apply only the last patch, as if I got it right, it 
is the only difference between v4 and v5 and updated 'drm: of: Lookup if 
child node has panel or bridge'. In such case the board freezes during 
the drm initialization.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

