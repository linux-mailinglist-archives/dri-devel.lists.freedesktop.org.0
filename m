Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDF4416E99
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 11:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE0A6E19A;
	Fri, 24 Sep 2021 09:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2576E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 09:10:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210924091011euoutp017d64020bbd298fcd3207857f5a7e067a~ntwKmwOUW2400624006euoutp01c;
 Fri, 24 Sep 2021 09:10:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210924091011euoutp017d64020bbd298fcd3207857f5a7e067a~ntwKmwOUW2400624006euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632474612;
 bh=GDIYSu/OY2EFkD7/7XvXSG2UL3GneP5U91ko+jcNozQ=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=BhmXmEphHN2PW7grFTMUq3yHrG4IR8JYqqER6Q5rzMRtj1voVonQM6cZF3RIqYKgL
 TDXg+Vc4g1sbgGrq/WnIok6KbJUWT1Yb/yqLwNxaC487iJk0lnO2MeybrKl1zvRMkS
 x8zN3vue9oM6LlCukdYsVzHMom+JVMdeBiX1SD8c=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210924091011eucas1p1b2d6107118f1e24a80b7c9be02e7fce7~ntwJ_5oNC0534605346eucas1p1M;
 Fri, 24 Sep 2021 09:10:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3F.53.45756.3F59D416; Fri, 24
 Sep 2021 10:10:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210924091010eucas1p21a6b28ce9866385d25ade5b854d9c110~ntwJOuvk21198011980eucas1p20;
 Fri, 24 Sep 2021 09:10:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210924091010eusmtrp158c1fd12553683e07b5cb268591a7897~ntwJK-xUr3000630006eusmtrp1Y;
 Fri, 24 Sep 2021 09:10:10 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-0f-614d95f32ade
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9A.E8.20981.2F59D416; Fri, 24
 Sep 2021 10:10:10 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210924091008eusmtip1d03be791cbb29065d8b3415cff78ff10~ntwHanPJO3170131701eusmtip1V;
 Fri, 24 Sep 2021 09:10:08 +0000 (GMT)
Message-ID: <68c3f798-a18d-fe8d-2925-2686716a985b@samsung.com>
Date: Fri, 24 Sep 2021 11:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0)
 Gecko/20100101 Thunderbird/93.0
From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Jani Nikula <jani.nikula@linux.intel.com>, Doug Anderson
 <dianders@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, MSM
 <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard
 <mripard@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Emil Velikov
 <emil.velikov@collabora.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Jagan Teki <jagan@amarulasolutions.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Russell King <linux@armlinux.org.uk>, Will
 Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Linux-OMAP
 <linux-omap@vger.kernel.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, linux-samsung-soc
 <linux-samsung-soc@vger.kernel.org>, linux-sunxi@lists.linux.dev,
 linux-tegra <linux-tegra@vger.kernel.org>, Stanislav Lisovskiy
 <stanislav.lisovskiy@intel.com>
Content-Language: pl
In-Reply-To: <874kaabdt5.fsf@intel.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxzO6b29ve2sXh6TMyB7MA2TKeiEeOYq6rKR65JNiWMPyYJFbhBH
 gbTiNrZFCIz3xBZQaQXRsZZHRdNZoAhsa7p2iMBKJ48IY9MtjPIaUNhgtI5ya8Z/3/ed7/u9
 kkNi3qOEP5mUcpqRpoiTgwgB3mRe6t0xX/6meOeUgUBf9nRyUN60moecCjMPzaiLAXrUJMfQ
 FVMPF3WrvyfQzwszBPqjcIpA2vtGgCpVCoAcuvME0thuADR2pRGgu0US1Nt7k4fKVjQcpHvY
 z0Xyb7t5yNZ6mUCqmhIc6cenOehSbwcHlXW0EqjAoSSQsbwdoOumER66OqvHUW6Bmou+aDfx
 UO2SHqC8QhFaaq3C0a1JORf1Oi1clDMccWALfX12lEtrq7SAtvVbMfrfZQWgq7Sf0qpMK063
 jNQAun2xGqfl3Ttog3KER3/VNs6hdfUFBD3c30bQzYu/cumqzmh6tMjCOeJ3TCBKYJKTzjDS
 sMjjgpPZBjytjvo467cL3ExgFRYCkoRUOMzJEhcCAelN1QLocFZyWeIA8O873wGWzAPY32DG
 HieG76ezugbAc3NZHtMMgE366dU4nxRSkfBSvZVwY5zaCvNdeRire8HOit9xN36SOg4nftGt
 eQhqG3R+M0S4G/hQYtieS7hr+lKZAJZ0lWBuglF9T0CnyrAWwChfOPggB7gxnwqGFYt2wOrP
 wGy9ai0AKYcA3u0cX+sMqddgX/ayB/tAu+UWj8WBsKu0GGfxWTham+MJ5wOov2nwBF6Bwz3L
 a+Nhq6PeaA1j5YNwYNCEs2fZCAenvNgZNkJF00XPtYQwP9ebdT8HR7v1noJ+8OufFojzIEi5
 7izKdZsp122j/L9vNcDrgR+TLpMkMrJdKcxHoTKxRJaekhh6IlWiA6t/oMtlmWsBlfbZUCPg
 kMAIIIkF+QrnB98QewsTxJ9kMNLUOGl6MiMzggASD/IT1qu0cd5Uovg08yHDpDHSx68cku+f
 yXm2bkIX/eehTntSze59FS1Pk0VR5oM/FGlcDxUbTn22cFvKtZ8Z78NctpdXdAOwp6u9o9h+
 4LAxWhIVv+ns9nKfmlArCL/3zu2rph/zE0TVAWRkbfFmL1fAwJgg1Gn7q2/Iq+B5dMyyP2Iv
 uCh769S190pjXLIM0+EPds/RpG1zwyag3PBCmlJU5vuq4fMQs9Oxde+hqH1b1KK3G+UZZdEN
 s6UXdu45ERccFfFUYOCkzT8Gb9sefadf/3rf/lgm/sjEnlTJ5aOTlpJETVhwo+rdugePcvj3
 VsKaV/5RhMWGv8iPFyXGvj9lGR48WlesHsNGQvTN14YCfGLwAZ6imr/tpSBcdlK8KwSTysT/
 AZvrFYdyBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0yTZxjN2+/SwmzyUWB9BzPbCmaZCYUihReC7JLGfdG5bH+2OEaggw+K
 vbm2dF4SB8pgVNgoImI7Ck4EwTK0UNByMasNyAbWjq2iQBgqM7CBoyoLCDKgW8K/k3Oec86T
 Jw8H4/mIME6uSsdoVFKFgAzEf37ePx7lO7VXGrO8ilDZzQEWKp5rYKOVij42etRQCtBqhxFD
 ta6bBBpq+JFEvz59RKIpwyyJrKNOgGrMFQA9sZWTqHG4FaCHtT8ANHhCidzuS2xUudzIQrb7
 XgIZrw2x0bDjOxKZ67/FkX16joWq3b0sVNnrIFHJExOJnKd6AGpxjbPR2Xk7jopKGgj0VY+L
 jS4s2gEqNiSjRYcFR+1/GQnkXuknUOGY+K1IumV+gqCtFiugh70ejH62VAFoi/UIbc734PSV
 8XpA9yzU4bRxKIq+ahpn0+e6p1m0rbmEpMe83STdufA7QVsGPqQnTvSzPuB/IkzWqPN0zKsy
 tVa3U5AqQrFCUSISxsYlCkU7EtKSYsWC6JTkLEaRq2c00SkZQtnxq/iBJupgwWQVkQ88XAPg
 cCAVB8dG8wwgkMOjzgNoablNGEDAGs+HXbWzmB8Hw2WvgfQPzQI4U2kH6wKXSoHVzR5yHePU
 Nvj182LMzwfBgTMP8HUcSmXAk3csG6Ek9QZcabtDrhcHU1LYU7SRGUIdA/CftqqNGYwaeQF2
 zYT7y7pY8MbYfcwvhMCRe4UbxQHU6/DMwgzw8/HQYDf8h1+Bx+1mrBzwTJv2MG2ymzZZTJss
 dQBvBiFMnlaZo9TGCrVSpTZPlSPMVCttYO35OvoW26+Appl5oROwOMAJIAcThHAfj+yW8rhZ
 0kOHGY06XZOnYLROIF47hhELC81Ur32vSpcuio8Ri+LiE2PEifE7BHxunMuazqNypDpGzjAH
 GM3/PhYnICyfldV0sWxLaue2BJ3+8UsJ2d9Eqo9mfTn39o0m7qFgH86vz12VLdEF1wW70qvD
 dzpqCH3l3mtpW3kdu80PJv/MTmp9/+xS4e3kW6vnHMqncHtUfFzrw46Rzjf3l1+Qy1Xez0ym
 j/Y825OUkDU5uSz5rUrPj/BIsk2OX4olitLejhej77UbJ0QHy/QRW3UnJUHqjLRZj0L16Wsv
 V/P5g/KAoLsjdWyVIrLEvSX0ls3dN5g2+u47so9lRdlTR8rEvZenHZ/v0vwh79p3ubS0MIKc
 dl3K/KLm7t/HrO99n6ossOWev94d7TrsW6TDwvcXmn+anG8M3Hd67KKmwX20TRI5NVzhcwpw
 rUwq2o5ptNJ/AZQIyjoFBAAA
X-CMS-MailID: 20210924091010eucas1p21a6b28ce9866385d25ade5b854d9c110
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210924080417eucas1p209819b105dc64faf1f2a7140c5c1389b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210924080417eucas1p209819b105dc64faf1f2a7140c5c1389b
References: <20210914202202.1702601-1-dianders@chromium.org>
 <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
 <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
 <CGME20210924080417eucas1p209819b105dc64faf1f2a7140c5c1389b@eucas1p2.samsung.com>
 <874kaabdt5.fsf@intel.com>
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

Hi

removed most cc, due to server limitation


W dniu 24.09.2021 o 10:03, Jani Nikula pisze:
> On Mon, 20 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
>> Pushed all 15 to drm-misc-next.
> ...
>> e8de4d55c259 drm/edid: Use new encoded panel id style for quirks matching
>> d9f91a10c3e8 drm/edid: Allow querying/working with the panel ID from 
>> the EDID
> Hi Doug, Stan's reporting "initializer element is not constant" issues
> here that were discussed before [1]. I wonder what gives, you said you'd
> hit them on a draft version, but not with what was merged, and I can't
> reproduce this either. Curious.


Apparently this is grey area of unclear specification.

gcc version below 8 reports error, above 8.1+ should work [1]. I am not 
sure if there is nice workaround for older gcc.


[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18


Regards

Andrzej


> BR,
> Jani.
>
>
> In file included from drivers/gpu/drm/drm_edid.c:42:0:
> ./include/drm/drm_edid.h:525:2: error: initializer element is not constant
> ((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
> ^
> drivers/gpu/drm/drm_edid.c:111:14: note: in expansion of macro 
> ‘drm_edid_encode_panel_id’
> .panel_id = drm_edid_encode_panel_id(vend, product_id), \
> ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_edid.c:120:2: note: in expansion of macro ‘EDID_QUIRK’
> EDID_QUIRK("ACR", 44358, EDID_QUIRK_PREFER_LARGE_60),
> ^~~~~~~~~~
> ./include/drm/drm_edid.h:525:2: note: (near initialization for 
> ‘edid_quirk_list[0].panel_id’)
> ((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
> ^
> drivers/gpu/drm/drm_edid.c:111:14: note: in expansion of macro 
> ‘drm_edid_encode_panel_id’
> .panel_id = drm_edid_encode_panel_id(vend, product_id), \
> ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_edid.c:120:2: note: in expansion of macro ‘EDID_QUIRK’
> EDID_QUIRK("ACR", 44358, EDID_QUIRK_PREFER_LARGE_60),
> ^~~~~~~~~~
>
>
> [1] 
> https://lore.kernel.org/all/CAD=FV=XHvFq5+Rtax7WNq2-BieQr-BM4UnmOcma_eTzkX2ZtNA@mail.gmail.com/
>
>
