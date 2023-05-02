Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E166F3F2B
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 10:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6614910E4CD;
	Tue,  2 May 2023 08:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A404410E4CD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 08:35:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230502083534euoutp01e7749932d0da09c00c9bc5eb708ab462~bRp8J0ibd1391313913euoutp01R
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 08:35:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230502083534euoutp01e7749932d0da09c00c9bc5eb708ab462~bRp8J0ibd1391313913euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683016534;
 bh=UypFwzmuQcx4hhNNhnyx0XJbjaAixLnh/EMVbuhN5X0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=u2vE7wbZz52yRRvoEz/nbZDnTIDnhFurJS3ARex08lG1bflW22+YTHlykua2vlqZs
 YB3T+74BBrABRXgTy3I1Uhy/HaEax57rdSGF+Ur6tLaRv7r6ORf2upj1yMdrR1mYCY
 Dw1ZjMqmZj44VCWgp1PHbxFU7W5dBCo7DN3X9LB8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230502083534eucas1p2391a68c5a44cc0ec3a483adf701baa3b~bRp75c3J10052100521eucas1p2M;
 Tue,  2 May 2023 08:35:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 71.15.42423.65BC0546; Tue,  2
 May 2023 09:35:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230502083533eucas1p1871845bf64ab28e2035c62e1a6db4399~bRp7QzwfX1553815538eucas1p1H;
 Tue,  2 May 2023 08:35:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230502083533eusmtrp2f17d965bc436245e28ee2948e9833cef~bRp7P-cC21238012380eusmtrp2W;
 Tue,  2 May 2023 08:35:33 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-09-6450cb56da3a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 92.FC.10549.55BC0546; Tue,  2
 May 2023 09:35:33 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230502083532eusmtip2d1912bb17129c07cee4a2f0b14010cf4~bRp6SXubF2296222962eusmtip2E;
 Tue,  2 May 2023 08:35:32 +0000 (GMT)
Message-ID: <05fb14ea-1083-8efd-dad0-a0e707af8131@samsung.com>
Date: Tue, 2 May 2023 10:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH V3 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230502010759.17282-1-aford173@gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUwTdxjOr3e9XskKx+nsL4ouaabTmfFhmnCRQVymy2V/MDY3s81seoPj
 Q0vFXoFh1FTcnNTNHY2kegKisuAYoCIWK2VBNLalZvKxomVsJaYgH618tLLoMtiOw43/nvd5
 nvf3Pu+bH46QE/KVeJ7eyBr0jE6DRaG2u8/uv7HDk5GV2FBDUoO/eRCqzXtCQbkeXJBR/oth
 lJq3lSPUr08nMcri51Eq0sxj1ONzTYByB70oVVZeq6D6blZiVPDYEUBN2gcAZan2ybfE0I3T
 fjk9VmdC6GrBhdLtszUobRd+V9Bnj5+R0xcdYzK6ub4Mo118r4we7HdgtP+EU0afbKkHdLh5
 TYbq06g3s1hdXhFrSEjbHZUb7G9ECtrUX06UrjCB8VgzUOKQ0MIeZy1qBlE4SVwC0NczAkSB
 JCIAdoQOS0IYwO/G+uQvOoYjo5gk1AF4u826WEwDWHGqFRVdKiINXr/qR8wAx1HiVVjX9b5E
 x0L3mcCC5WWChaVngwrRsoz4AN5pf0mklxNvQ/ffszIRI4QPgT9c3iRhNRwInFvgMSIJmkNm
 TMRKgoJNNotC8rwCW0OViBgHEgNKOD9uXQy9FbquDC3iZXDc2aKQcByct4uPig3fAFjzl3+x
 4AE0PR4AkisFDv7yHBOTIsQGePlmgkS/Bb81CQs0JKLhw1CsFCIaWmxWRKJV8PgxUnKvg4Kz
 6b+xt7p7ER5ohCVXEZasKSxZR/h/bg1A64GaLeTyc1guSc8Wx3NMPleoz4nP3JffDP79j545
 58wNUDU+Hd8JZDjoBBBHNMtVU/vTs0hVFlNygDXs22Uo1LFcJ1iFoxq1amOqO5Mkchgju5dl
 C1jDC1WGK1eaZNXJ5W7L5LOikq/kKcWP3ttV7JqK9h2w9vEb/qBbTh956r3mGL6fxus2p6fE
 eDMuORu0kU8qDm8r/ZErLLeme57oPho7lF0x/Nlc/sz8NZ3tfIqGaRzpc3YdTDRlc6ew8/Wp
 29vpe+Ftp/kna4mqwOTRD4l7iD076DpqzEwbrZqN9KiMeR0P2PXdvvXZppN1j3YGYobsZb0d
 fMmF7V84N/dbQjdGi2J09kr9BKMPD3nJTc/VH2cqR+PXtQSYPQlrtJ1C3J8/3ynoGUnuX914
 d6ojzhDypK79vlr72s4ue+Snoh3G3NbE2hn+89VzBx2Cceu7W7R7k9+5mkx2Nzi+ntWgXC6T
 9Dpi4Jh/ALyuKer+AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsVy+t/xe7qhpwNSDB4vV7S4c/s0s8Xuq93s
 FieuL2KyuL/4M4vF/20TmS2ufH3PZjHp/gQWiy+bJrBZPJ+/jtHi5JurLBadE5ewW1zeNYfN
 4k1bI6PF+523GC0mzbvJ6sDvsfbjfVaPl8sbmD3mzTrB4rH32wIWj52z7rJ7zO6YyeqxeM9L
 Jo9NqzrZPE5MuMTkcefaHjaP+93HmTz6tqxi9Pi8SS6AN0rPpii/tCRVISO/uMRWKdrQwkjP
 0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4821tcwFu8UrXjeJNTC+Euxi5OSQEDCR
 ePrlBVsXIxeHkMBSRonHy1rYIRIyEienNbBC2MISf651QRW9Z5Q4sPUXC0iCV8BOYuvG+8xd
 jBwcLAIqEstPBUKEBSVOznwCViIqkCpxY88fNpASYYEgiSN7eUDCIgLOEif/fmMCGckscJtZ
 4s6mmywQ87sZJaYf2Qy2mFlAXOLWk/lMIDabgKFE11uQIzg5OAUsJNZtm8QOUWMm0bW1ixHC
 lpfY/nYO8wRGoVlI7piFZNQsJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJEZgS
 th37uXkH47xXH/UOMTJxMB5ilOBgVhLh/VDolyLEm5JYWZValB9fVJqTWnyI0RQYFhOZpUST
 84FJKa8k3tDMwNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgUn0Zs3Hv7Hc
 0hXhaTJN7/YleEhrpi/4/ajVu9Zf3PhHZvk5myLH1btmmrp3cn92r3rbvH1HQubTmwWKH4/H
 uZY5buvaE9fId+y4x0VGt38am1cfuDVr733zE5Hh5UJ560OaFq/77/V+tfLChS8XG3wMremM
 ddwrPJ3df+HSFVKh3bUxyqUmrD+e/Th7I//e/VXsTzN3rqi9s9d++fW74pMXNJ/Q8PY27VzL
 syh5umDp8bVz+bfvi/LXKm9foHmqxnKTreEau7pEoyMbws0+/nsWospfF1Obtq26/Hxt5Nyp
 d79r8B59Z5I2X/rxpA0cWo9OZp51nGrgsa1ISE/ahKVyR7ScdPw+wYcTox4VnVRiKc5INNRi
 LipOBAC5hnm9kgMAAA==
X-CMS-MailID: 20230502083533eucas1p1871845bf64ab28e2035c62e1a6db4399
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230502010811eucas1p1df7fcdcb3e3d363d39eb711f19618628
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230502010811eucas1p1df7fcdcb3e3d363d39eb711f19618628
References: <CGME20230502010811eucas1p1df7fcdcb3e3d363d39eb711f19618628@eucas1p1.samsung.com>
 <20230502010759.17282-1-aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.05.2023 03:07, Adam Ford wrote:
> This series fixes the blanking pack size and the PMS calculation.  It then
> adds support to allows the DSIM to dynamically DPHY clocks, and support
> non-burst mode while allowing the removal of the hard-coded clock values
> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> burst-clock device tree entry when burst-mode isn't supported by connected
> devices like an HDMI brige.  In that event, the HS clock is set to the value
> requested by the bridge chip.
>
> This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should work
> on i.MX8M Mini as well.
>
> Adam Ford (6):
>    drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
>    drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
>    drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
>    drm: bridge: samsung-dsim: Dynamically configure DPHY timing
>    drm: bridge: samsung-dsim: Support non-burst mode
>    drm: bridge: samsung-dsim: Let blanking calcuation work in non-burst
>      mode
>
> Lucas Stach (1):
>    drm: bridge: samsung-dsim: fix blanking packet size calculation
>
>   drivers/gpu/drm/bridge/Kconfig        |   1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c | 150 ++++++++++++++++++++++----
>   include/drm/bridge/samsung-dsim.h     |   5 +
>   3 files changed, 136 insertions(+), 20 deletions(-)

Works fine (= doesn't break) on Exynos.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


>
> ---
> V3:  When checking if the bust-clock is present, only check for it
>       in the device tree, and don't check the presence of the
>       MIPI_DSI_MODE_VIDEO_BURST flag as it breaks an existing Exynos
>       board.
>       
>       Add a new patch to the series to select GENERIC_PHY_MIPI_DPHY in
>       Kconfig otherwise the build breaks on the 32-bit Exynos.
>       
>       Change vco_min variable name to min_freq
>
>       Added tested-by from Chen-Yu Tsai
>
> V2:  Instead of using my packet blanking calculation, this integrates
>       on from Lucas Stach which gets modified later in the series to
>       cache the value of the HS-clock instead of having to do the
>       calucations again.
>
>       Instead of completely eliminating the PLL clock frequency from
>       the device tree, this makes it optional to avoid breaking some
>       Samsung devices.  When the samsung,pll-clock-frequency is not
>       found, it reads the value of the clock named "sclk_mipi"
>       This also maintains backwords compatibility with older device
>       trees.
>
>       This also changes the DPHY calcuation from a Look-up table,
>       a reverse engineered algorithm which uses
>       phy_mipi_dphy_get_default_config to determine the standard
>       nominal values and calculates the cycles necessary to update
>       the DPHY timings accordingly.
>       

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

