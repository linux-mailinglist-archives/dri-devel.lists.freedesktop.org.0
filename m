Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4473192EC3E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 18:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFE910EACB;
	Thu, 11 Jul 2024 16:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="hA/SF4YN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 449 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jul 2024 16:04:44 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103B910EAC9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 16:04:43 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240711155713euoutp011cbfff86f0e4124b0927edd0a3a4051a~hM8BOeD3t1298612986euoutp01Z
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 15:57:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240711155713euoutp011cbfff86f0e4124b0927edd0a3a4051a~hM8BOeD3t1298612986euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1720713433;
 bh=IQNR4NiRww+C3gtuRdRRDXkVFz57aElZ32912QtY1TI=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=hA/SF4YNoGm7ukjNd3w5beP3VOfSUuPAZrXfD+qqHu7LglCEdy6a/ExdVYvx3FVfK
 jLlfyBdC48PTzmrPXQMVULkfi5RB7JB58XJ6lBdvKZFqp1zKNQYmblI7CeMEmSStgg
 jwzWQAlIvnmIXsRp4Ro1HZ3LuCMmnyjtihUk/b4Y=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240711155713eucas1p267689aa3c9c632c132bf2240445fbb1a~hM8AzVISx1460614606eucas1p2y;
 Thu, 11 Jul 2024 15:57:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 97.6B.09624.9D000966; Thu, 11
 Jul 2024 16:57:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240711155712eucas1p15dde44bcfc74825341e88a251ffca587~hM8Aam0lV2003220032eucas1p1j;
 Thu, 11 Jul 2024 15:57:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240711155712eusmtrp10d095fb453960ff8cf6a2afcdbc1f570~hM8AZ2g2v0315103151eusmtrp1q;
 Thu, 11 Jul 2024 15:57:12 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-e6-669000d9f139
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F6.B4.08810.8D000966; Thu, 11
 Jul 2024 16:57:12 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240711155711eusmtip199a5de6c54892acf1b9703050d60c854~hM7_-PB3d2284222842eusmtip1T;
 Thu, 11 Jul 2024 15:57:11 +0000 (GMT)
Message-ID: <7efa1605-bdec-42b1-8a9f-363a70b78017@samsung.com>
Date: Thu, 11 Jul 2024 17:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
To: Marek Vasut <marex@denx.de>, Michael Walle <mwalle@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <1867bfd6-ad00-46a7-8bad-4a4441d9854c@denx.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzdfV99ECuPIuGOubF0gUwcVBY2r2AaiCR7IzEy5x/I/nDdeALh
 o6YV0CUuzACFFqRFjdIO6CziUoU5VgvdSjax0GInm06cfJbMAhNKpINNO5gO+uLGf+d3zrn3
 nN/NpXGRgYqmC0qOcooSWZGYCiWsA4GhhJEXtId3mJ8I0PiYG0euXy9gaP5MB4Y8piUCPbPq
 cHT3z0cUqr84RKJGj5ZAy11aCs22dgI06Bsm0JLjPoWmmkcwVKtrE6Av/NcI5Kv+DKDq2nYS
 rQSacfTINgpQY8sIiSw+HZkWyXb4PSTboncR7KTTjrO/a59ibO9fRoK16ScErKGmiWRN9ocY
 22WupVjHsIlkXdo7GDt+z06xLYPvsR6NE2Mb/tnBnrKYQVZ4TujuXK6ooIxTSKQfhuYvqrOO
 NNDHlty38QpgodQghIZMMuwfXgVqEEqLmC8BPK/SYOuCiFkG8PQVAS8sAVi78iP+/ER9928Y
 L1wCcKJyAOcHP4AXbINg3SVkpNDXbiTXMcHEwunaeoLnw+FgkzeII5kY6Bk9L1jHEcwBWLVs
 Dd66hdED6P1uLFgKZzpIaG0cCJbCmSg46m0NYopJguoFdXCLECYVGhbnCd4TA7sXPg9WgkxT
 KPxed53gi2fAGtUDkscRcM5pEfB4K3SfriP4AyoAjSsejB+0AFbMjgLelQrHh/5ei6PXIrbB
 r76V8HQ6XLVMCdZpyGyG9xfC+RKbYaP1HM7TQlhTLeLdcVDv7Pwv9vrPd3AtEOs3PIx+w5r6
 Devo/881AsIMorhSZXEep0wq4coTlbJiZWlJXuLH8uIusPZ/3U+df/SA5jl/Yh/AaNAHII2L
 twjfvdVwWCTMlR3/hFPIDylKizhlH3iJJsRRwtjcGE7E5MmOcoUcd4RTPFcxOiS6Aqv/6eDN
 k3MlOYUS0dD0L9uPT98jm5JHvx5JfTNTI9+l6967p+5sVbi3tbtJ1fmNpl2fs2dYve2Gp66t
 oyJjsjzx8jPb3ZXtBXEp/pT51asJN07E7wqrcb5eWXepPMxvf3kkYb9DGbdJM5u9O/Ox72Rl
 xKth1ARt6nUErmKSDGnVPntamW7nzrelAVePJNtx8P1b2TPRgnfyDX3u6Zj8N4w5SipyzPOE
 2JSpiv/oXM/W5N6b7aLlqbnb83vbUs7Ge40YJ7eWSR/vf/GHDrkvcMqWpX/tYqt8xmAo/DTt
 YdqM6ZVjGc1vPSiPc/X3T+L7rg2cORAWdSI91W6eWEz/QHyIiRUTynxZUjyuUMr+BY4AsBou
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsVy+t/xu7o3GCakGWy5p2lx5/ZpZosT1xcx
 WbyespbJ4v7izywW/7dNZLa48vU9m0Xv0nOsFpPuT2Cx+LJpApvF8/nrGC1OvrnKYvH5yA02
 iwdzbzJZdE5cwm6x8ONWFos3bY2MFm2dy1gtfv+cy2zxfuctRotJ826yWmx5M5HVQdRj7cf7
 rB7zZp1g8bh3fA+zx4sJ/5g89n5bwOKxc9Zddo/ZHTNZPRbvecnksWlVJ5vHkauLWT1OTLjE
 5HHn2h42j3knAz3udx9n8uj/a+DRt2UVY4BglJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYml
 nqGxeayVkamSvp1NSmpOZllqkb5dgl7Gh66Agn6Ois+nLzI3MG5h62Lk5JAQMJHo3f6ICcQW
 EljKKHFnswREXEbi5LQGVghbWOLPtS6gei6gmveMEg1vN4I18wrYSbxZtgCsiEVAVeJpZy8L
 RFxQ4uTMJ2C2qIC8xP1bM9hBbGGBEInWL9uYQAaJCMxilLiyYB8ziMMssJ5VomvWLBaIFRuZ
 JNqnnAAbyywgLnHryXyw+9gEDCW63naBreYUsJaY/eE1C0SNmUTX1i5GCFteYvvbOcwTGIVm
 IblkFpJRs5C0zELSsoCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgutl27OfmHYzzXn3U
 O8TIxMF4iFGCg1lJhNfzbH+aEG9KYmVValF+fFFpTmrxIUZTYHBMZJYSTc4HJry8knhDMwNT
 QxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQYmr0OHPv49Mpnzs8qqD7dbJjdN
 +tXBxCW2+tlHp3Xz1vIL+TSvrz7/OyqvQ0zQNduQhW1PpXsFT18MG68UE1PoEYfK8+6/S097
 ynIaGkxmYyxXn1DhrDVlXcSeuHfHDr3+PHHXsUuL83SehVuVTr12KXDtiforJqzrzk1a/eHB
 qYdX1t1du+hB0TrbsP3mM0+/OvTUUNI2lulV/B5R6dcq6+Y9CPFNsVeyt5j2+ah9/L2ACUeL
 ooQOrMvbtnD64qdxbPPfyIaw3mA9/8Tx3fba4I8/Hsgdz+f1K1bLNJm6yqCAL+HD8YUSqw8k
 /LN9uJd3ilXR37kPki6HHDZdZjI3+OBvDxOHwgAz6Sv7Lnvv9FdiKc5INNRiLipOBADbq87Q
 wAMAAA==
X-CMS-MailID: 20240711155712eucas1p15dde44bcfc74825341e88a251ffca587
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240711153825eucas1p2f3be863ea60d080e1c15d1b3d6570069
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240711153825eucas1p2f3be863ea60d080e1c15d1b3d6570069
References: <20240625122824.148163-1-marex@denx.de>
 <4603431.cEBGB3zze1@steina-w> <f90aa303-f18b-4cca-bb7a-f94f74dfee36@denx.de>
 <D29SIGP58O7E.3AJ5VRGQ4I1VN@kernel.org>
 <CGME20240711153825eucas1p2f3be863ea60d080e1c15d1b3d6570069@eucas1p2.samsung.com>
 <1867bfd6-ad00-46a7-8bad-4a4441d9854c@denx.de>
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

On 11.07.2024 17:38, Marek Vasut wrote:
> On 6/26/24 10:02 AM, Michael Walle wrote:
>> On Wed Jun 26, 2024 at 5:21 AM CEST, Marek Vasut wrote:
>>> Thank you for testing and keeping up with this. I will wait for more
>>> feedback if there is any (Frieder? Lucas? Michael?). If there are no
>>> objections, then I can merge it in a week or two ?
>>
>> I'll try to use your approach on the tc358775. Hopefully, I'll find
>> some time this week.
>
> So ... I wonder ... shall I apply these patches or not ?
>
> I'll wait about a week or two before applying them, to get some input.
>
I've pointed that they break current users of Samsung DSIM: Exynos-DSI 
and Samsung s6e3ha2/s6e3hf2 panels, but unfortunately I'm not able to 
provide datasheet nor any other documentation. Due to other tasks and 
holidays I'm not able to debug it further too, at least till the end of 
August. Maybe we could keep old behavior for "exynos-dsi" compatible device?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

