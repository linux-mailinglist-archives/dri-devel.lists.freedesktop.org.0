Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF95484D4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2903810E2A9;
	Mon, 13 Jun 2022 11:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8975A10E48C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:32:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220613113214euoutp02b5a503c5b5d485d58f9adf3fb0982231~4Ks_3J6tw2705027050euoutp02h
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:32:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220613113214euoutp02b5a503c5b5d485d58f9adf3fb0982231~4Ks_3J6tw2705027050euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1655119934;
 bh=F5jBUvtl3CxTm1UPj5cWd9sRDQMPJ296wnn2EC83cxE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=iF6Zislin36tLFopjTin7RuUFz+GpDrDhaD1fYEVSAERqb+t6XwaImpId+UUt+Ifw
 7qYMWgSLi3J952BoxjZV2uUEH1roVrWwR/myOYc04l9Hl/sItdYxeAO4QIH1CdwEfy
 SITIAOto4dGN7zihOP9RR+t91CPcpLpy08/Mnnu0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220613113214eucas1p12e92435cc0509577dc436bac9415bb19~4Ks_WMW9E1737517375eucas1p1K;
 Mon, 13 Jun 2022 11:32:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A3.7D.10067.D3027A26; Mon, 13
 Jun 2022 12:32:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220613113213eucas1p12e42117505931c416771ae10346d1b58~4Ks92fYjs2250222502eucas1p1Q;
 Mon, 13 Jun 2022 11:32:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220613113213eusmtrp14416e390ede435abde4d163a7eadfa7f~4Ks91Vi-12006220062eusmtrp1U;
 Mon, 13 Jun 2022 11:32:13 +0000 (GMT)
X-AuditID: cbfec7f4-dd7ff70000002753-34-62a7203d19a6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 45.B3.09095.D3027A26; Mon, 13
 Jun 2022 12:32:13 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220613113212eusmtip2c92cca070719582ae2a11968de3d3f1b~4Ks8peGQ50221102211eusmtip2G;
 Mon, 13 Jun 2022 11:32:12 +0000 (GMT)
Message-ID: <8a0727e2-134f-c34e-aa32-cf828255ce8c@samsung.com>
Date: Mon, 13 Jun 2022 13:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZBYkQ8GJL+9r+zXhjrFjb+XCLgBh8pY=f+FVM_DHm-SPQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZduznOV07heVJBlN/MVncuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBanH61ntjjV2Mpicagv2uLTrIdA8ckv2SwunvjEbPH991lmB1GPtR/vs3q8
 v9HK7jHlxBFWj3M9d9k8ds66y+4xu2Mmq8fiPS+ZPI5cXczqcefaHjaP+93HmTw2L6n32Phu
 B5NH35ZVjB6fN8kF8EVx2aSk5mSWpRbp2yVwZRxcsZip4LJgxdNVB5kaGP/ydjFycEgImEgs
 OeDbxcjJISSwglFi10zzLkYuIPsLo8S3cydYIZzPjBIrn0xlBqkCaWhZ9ZQRomM5o8T1HdUQ
 RR8ZJdZe3cgCkuAVsJP4tbOFDcRmEVCVeHPqEyNEXFDi5MwnYDWiAkkS87e1soLYwgKeEu+O
 HWAHsZkFxCVuPZnPBHKdiECYxPYD4SDzmQXWskncfHQQbCabgKFE19suNpAaToFAiSXXcyFa
 5SW2v50DdWcTl8TflXoQT7pIPD5YBhEWlnh1fAs7hC0jcXpyDwtESb7E3xnGEOEKiWuv10BN
 sZa4c+4X2CJmAU2J9bv0IcKOEuefboPq5JO48VYQYj+fxKRt05khwrwSHW1CENVqErOOr4Pb
 efDCJeYJjEqzkAJkFpLHZyH5ZBbC3gWMLKsYxVNLi3PTU4uN8lLL9YoTc4tL89L1kvNzNzEC
 0+rpf8e/7GBc/uqj3iFGJg7GQ4wSHMxKIryTLy5LEuJNSaysSi3Kjy8qzUktPsQozcGiJM6b
 nLkhUUggPbEkNTs1tSC1CCbLxMEp1cCU76D7+KSbz+tkp40x6+/77HqzLsDFY1a7b6W5YIpj
 w3GVFYI2Meyq2roLXtnezjKbH5UXzl2UOVnoc0ZxfNMZJjHlwxsCOOYdb3f96HpGdlaTjuLz
 sJS2M7vqN8+5ciVfoCAh/Un6piC2pqxfJSuiJI+srmRZziKouFq3r3bi0m+ZEx/e4XLfIKoR
 yBfXk9v5b4vZ4j/VMVe0Y4uilhWYh91d9+dHpv3TXf8Sp55i8hf6W7K2hW2Td+yiCze+rzj1
 8ktijHZj0toZVxT2Mojdr5yc47FCc+Z/y3wurtmfpXbHV0bGLA87f5TVekHLw5myK9pr/bbt
 9fR+Lf5Vvrh403cuga0X1IL3vd+TGqzEUpyRaKjFXFScCACId+c5GgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xe7q2CsuTDC63yVncuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBanH61ntjjV2Mpicagv2uLTrIdA8ckv2SwunvjEbPH991lmB1GPtR/vs3q8
 v9HK7jHlxBFWj3M9d9k8ds66y+4xu2Mmq8fiPS+ZPI5cXczqcefaHjaP+93HmTw2L6n32Phu
 B5NH35ZVjB6fN8kF8EXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk
 5mSWpRbp2yXoZRxcsZip4LJgxdNVB5kaGP/ydjFyckgImEi0rHrK2MXIxSEksJRRYuq8KYwQ
 CRmJk9MaWCFsYYk/17rYIIreM0q8PLueDSTBK2An8WtnC5jNIqAq8ebUJ0aIuKDEyZlPWEBs
 UYEkiXl7V4PFhQU8Jd4dO8AOYjMLiEvcejKfCcQWEQiT6F3xhB1kAbPARjaJHTcmQJ10mEni
 xKOrYB1sAoYSXW9BzuDg4BQIlFhyPRdikJlE19YuRghbXmL72znMExiFZiG5YxaSfbOQtMxC
 0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYGLZduzn5h2M81591DvEyMTBeIhRgoNZ
 SYR38sVlSUK8KYmVValF+fFFpTmpxYcYTYGBMZFZSjQ5H5ja8kriDc0MTA1NzCwNTC3NjJXE
 eT0LOhKFBNITS1KzU1MLUotg+pg4OKUamDjSxb3V5Lptgve+1L16vuVOt7TCi/JAp4JXmzna
 ltx+JdSvaR+3+JrL0pbWmIvpl7fVi1dIfdtTL8PdPcP+Tuj93I/KL1fdSP9d9fb1nkn/Rbon
 NRlcmCX0cfexPk2uiezR4md0fn91MI3KuXYw7fRbnzfu+/LUziv4pv2cEBKiHbRlp9xmUf4N
 kyb87K//8rwidsEphZKlJ57Ner9E7Fn1BmOjZPnWlKPSIZynWu3+zmUPniDX2xft1fdToj0g
 M//OAv8j5cnn5ZSnffI1ev387/ak9HOiJUIz9kjr116cbyD8ZvXJzpQw/riJq0+czFhde7c+
 Uqoh8BzzHZlvz2K3F5gv9nw4yetwj2NkqxJLcUaioRZzUXEiAKrQANy1AwAA
X-CMS-MailID: 20220613113213eucas1p12e42117505931c416771ae10346d1b58
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220613111735eucas1p1f80de0b3b377c12f183721371cf8d6fc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220613111735eucas1p1f80de0b3b377c12f183721371cf8d6fc
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <20220504114021.33265-9-jagan@amarulasolutions.com>
 <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
 <CGME20220613111735eucas1p1f80de0b3b377c12f183721371cf8d6fc@eucas1p1.samsung.com>
 <CAMty3ZBYkQ8GJL+9r+zXhjrFjb+XCLgBh8pY=f+FVM_DHm-SPQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.06.2022 13:17, Jagan Teki wrote:
> On Wed, May 11, 2022 at 4:01 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>> On 04.05.2022 13:40, Jagan Teki wrote:
>>> Fixing up the mode flags is required in order to correlate the
>>> correct sync flags of the surrounding components in the chain
>>> to make sure the whole pipeline can work properly.
>>>
>>> So, handle the mode flags via bridge, atomic_check.
>>>
>>> v2:
>>> * none
>>>
>>> v1:
>>> * fix mode flags in atomic_check instead of mode_fixup
>>>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> index b618e52d0ee3..bd78cef890e4 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>        pm_runtime_put_sync(dsi->dev);
>>>    }
>>>
>>> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
>>> +                                  struct drm_bridge_state *bridge_state,
>>> +                                  struct drm_crtc_state *crtc_state,
>>> +                                  struct drm_connector_state *conn_state)
>>> +{
>>> +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>>> +
>>> +     adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
>>> +     adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>>
>> 1. Shouldn't this be in mode_fixup callback?
> Possible to do it on mode_fixup, yes. if we want to do the same stuff
> on atomic API then atomic_check is the proper helper.
>
>> 2. Where this requirement comes from? As Marek says it breaks Samsung
>> platforms and is against DSIM specification[1]:
> At least the bridge chain starting from LCDIF+DSIM requires active high sync.

Then please make this specific to the imx variant. The current version 
breaks DSI operation on all Exynos based boards.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

