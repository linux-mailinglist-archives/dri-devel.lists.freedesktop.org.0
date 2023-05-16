Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E565705ADE
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 00:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E40410E06E;
	Tue, 16 May 2023 22:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE3E10E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 22:57:59 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230516225754euoutp012ff6ead4f4321e5c39a1fda290a489a6~fwc2To0kd1533915339euoutp01J
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 22:57:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230516225754euoutp012ff6ead4f4321e5c39a1fda290a489a6~fwc2To0kd1533915339euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1684277874;
 bh=YRGn0992OBXzBmJ9QR3PWg3QqGzX3F6VVoT11Q3yzGQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=kagLuYrVNhLXLWEsR7HbUCbcjHZE0Z/sg94Xr54nv8tHqf8eWE/xBdJ2YGH9NKmxZ
 oCn3uizOBuwJV5mAHvRinQQq4BqmGO/ofR2K5JA4c/W+TuyOA2n4Hog8Ba/CkXpy25
 nKoXCkvJC2YQh3NWHW9leDSibemTh9YCC+oQNurk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230516225753eucas1p217e16ffb9b04840c813a8433f246f4f3~fwc137RSo0386703867eucas1p2B;
 Tue, 16 May 2023 22:57:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DB.02.35386.17A04646; Tue, 16
 May 2023 23:57:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230516225753eucas1p2939f9bd8615f613ef5dc1c16ea22da9d~fwc1RngX32241322413eucas1p2V;
 Tue, 16 May 2023 22:57:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230516225753eusmtrp17059f5d9c9efe1666bdcce49c2e5661c~fwc1RAz9l0287302873eusmtrp11;
 Tue, 16 May 2023 22:57:53 +0000 (GMT)
X-AuditID: cbfec7f4-cdfff70000028a3a-4e-64640a71cb74
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E9.50.14344.17A04646; Tue, 16
 May 2023 23:57:53 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230516225752eusmtip2f93b0df32b5674eb55ec27196e93b10c~fwc0j_zpl2599625996eusmtip2M;
 Tue, 16 May 2023 22:57:52 +0000 (GMT)
Message-ID: <9ea571ea-2252-d550-830c-861bbb94a4ba@samsung.com>
Date: Wed, 17 May 2023 00:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH V6 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230515235713.232939-1-aford173@gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPKsWRmVeSWpSXmKPExsWy7djP87qFXCkpBi8n61vcuX2a2WL31W52
 ixPXFzFZ3F/8mcXi/7aJzBZXvr5ns+hdeo7VYtL9CSwWXzZNYLN4Pn8do8XJN1dZLDonLmG3
 uLxrDpvF+523GC0mzbvJ6sDvsfbjfVaPl8sbmD32flvA4rFz1l12j9kdM1k9Fu95yeSxaVUn
 m8eRq4tZPU5MuMTkcefaHjaP+93HmTz6tqxi9Pi8SS6AN4rLJiU1J7MstUjfLoErY8H9fvaC
 y3IVK36nNDDOFe9i5OSQEDCRWHShl7GLkYtDSGAFo8Szzi0sEM4XRokHH18wQzifGSWeHu1k
 hGk5NruLFSKxnFGiY9lKNgjnI6PEulnHmUGqeAXsJCZO/QbWwSKgKnF03Tc2iLigxMmZT1hA
 bFGBVIlVmy+C1QsLBEncalzKDmIzC4hL3HoynwnEFhFwljj59xsTyAJmgV/MEic6roMNZRMw
 lOh62wU2lFPAUmLRr09QzfIS29/OAbtbQuASp8Tt7W0sEHe7SNx5954ZwhaWeHV8CzuELSNx
 enIPC0RDO6PEgt/3mSCcCYwSDc9vQX1tLXHn3C+gdRxAKzQl1u/Shwg7Spz5sZoRJCwhwCdx
 460gxBF8EpO2TWeGCPNKdLQJQVSrScw6vg5u7cELl5gnMCrNQgqXWUj+n4XknVkIexcwsqxi
 FE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQITJOn/x3/soNx+auPeocYmTgYDzFKcDArifAG
 9iWnCPGmJFZWpRblxxeV5qQWH2KU5mBREufVtj2ZLCSQnliSmp2aWpBaBJNl4uCUamDatE1w
 6XWdaM8lu3a6T7rZWuvBoGu49ddEvZbTFw5lN773WL5wx8p2W0WZ5was9XbPJ8+wnSGjWfhs
 +122zqjw9VGT7V4/n5zltOtq7M15f4xOME7JPvv5wf2Ph6xOMd3a5HujzWja4keiwtVaduIm
 ElxupsGrbnAFr1/e32+v1jrxWqGxaznvuhnuXQkJhx7dOztrpd7+oH8HkzV631sdfquy28Rw
 Fs+WqXtnxEptvrZXp3yjRMyvqm1Wsw3CdzGVCT01S/iVF/rnkYRDePl0jQdV7w19Pb2vvPz0
 Q6JcZbadzeRTz8WLmbt7rx+tsy/YzLBIrGPPNq9Fxnv2ldr4te65MGuaPsOB9vTHO21tlFiK
 MxINtZiLihMBmg9ZxAIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42I5/e/4Pd1CrpQUg4VPOCzu3D7NbLH7aje7
 xYnri5gs7i/+zGLxf9tEZosrX9+zWfQuPcdqMen+BBaLL5smsFk8n7+O0eLkm6ssFp0Tl7Bb
 XN41h83i/c5bjBaT5t1kdeD3WPvxPqvHy+UNzB57vy1g8dg56y67x+yOmawei/e8ZPLYtKqT
 zePI1cWsHicmXGLyuHNtD5vH/e7jTB59W1YxenzeJBfAG6VnU5RfWpKqkJFfXGKrFG1oYaRn
 aGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXseB+P3vBZbmKFb9TGhjnincxcnJICJhI
 HJvdxdrFyMUhJLCUUWLq2eeMEAkZiZPTGlghbGGJP9e62CCK3jNK7FlwByzBK2AnMXHqN7AG
 FgFViaPrvrFBxAUlTs58wgJiiwqkSpxcegPMFhYIkrjVuJQdxGYWEJe49WQ+E4gtIuAscfLv
 NyaQBcwCv5gljux8xw6xrYdR4vv8+2BVbAKGEl1vu8A2cApYSiz69QlqkplE19YuRghbXmL7
 2znMExiFZiE5ZBaShbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYFrYduzn
 lh2MK1991DvEyMTBeIhRgoNZSYQ3sC85RYg3JbGyKrUoP76oNCe1+BCjKTA0JjJLiSbnAxNT
 Xkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QDk5zZfKFSsUQ9vq0y
 XK8KfrA+n/MngV9VKd2Q8e2Fs0obnioKv80wYP5+Q+24Dq/Zdef5x2L1OkoTOE2jvSOC7Ka8
 P719ZQ+P9aHnlxwSlxZvNv3xbNnB11OPbhdZkFz/mqur6AvLmmL5m65v/TZd/vB07g5X6/dT
 D33Vzl9iZ1K++xtfoUpKobuWwvRDN43PBatpZ4Zc5Dz83vv7lzm8TzT05y1cy8kW1ZJqeGPa
 c+vUdpZQc/E5j43SP/xR0Zx+Zne5xOsFahysa6LiapK4Excs6b548ul6+0C+8E3RXB48vNMY
 KyeuXs7VW8/4aeo06bOcxXlqD148fLZpUkbn3/mm+b/3nEu/Wp4Tr7bBX4mlOCPRUIu5qDgR
 AKMespOUAwAA
X-CMS-MailID: 20230516225753eucas1p2939f9bd8615f613ef5dc1c16ea22da9d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230515235729eucas1p2c5a85ead90e0fc033e41dc81b67d6922
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230515235729eucas1p2c5a85ead90e0fc033e41dc81b67d6922
References: <CGME20230515235729eucas1p2c5a85ead90e0fc033e41dc81b67d6922@eucas1p2.samsung.com>
 <20230515235713.232939-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.05.2023 01:57, Adam Ford wrote:
> This series fixes the blanking pack size and the PMS calculation.  It then
> adds support to allows the DSIM to dynamically DPHY clocks, and support
> non-burst mode while allowing the removal of the hard-coded clock values
> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> burst-clock device tree entry when burst-mode isn't supported by connected
> devices like an HDMI brige.  In that event, the HS clock is set to the
> value requested by the bridge chip.
>
> This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should
> work on i.MX8M Mini as well. Marek Szyprowski has tested it on various
> Exynos boards.
>
> Adam Ford (5):
>    drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
>    drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
>    drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
>    drm: bridge: samsung-dsim: Dynamically configure DPHY timing
>    drm: bridge: samsung-dsim: Support non-burst mode
>
> Lucas Stach (1):
>    drm: bridge: samsung-dsim: fix blanking packet size calculation
>
>   drivers/gpu/drm/bridge/Kconfig        |   1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c | 143 +++++++++++++++++++++-----
>   include/drm/bridge/samsung-dsim.h     |   4 +
>   3 files changed, 125 insertions(+), 23 deletions(-)

Feel free to add to all patches:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> V6:  Squash-in an additional error fix from Lucas Stach regarding the
>       DPHY calcuations.  Remove the dynamic_dphy variable and let
>       everyone use the new calculations.  Move the hs_clock caching
>       from patch 6 to patch 5 to go along with the DPHY calcuations
>       since they are now based on the recorded hs_clock rate.
>       
> V5:  Update error message to dev_info and change them to indicate
>       what is happening without sounding like an error when optional
>       device tree entries are missing.
>
> V4:  Undo some accidental whitespace changes, rename PS_TO_CYCLE
>       variables to ps and hz from PS and MHz. Remove if check
>       before the samsung_dsim_set_phy_ctrl call since it's
>       unnecessary.
>       Added additional tested-by and reviewed-by comments.
>       Squash patches 6 and 7 together since the supporting
>       non-burst (patch 6) mode doesn't really work until
>       patch 7 was applied.
>
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
>       This also maintains backwards compatibility with older device
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

