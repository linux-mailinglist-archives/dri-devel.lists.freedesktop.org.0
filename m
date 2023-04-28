Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED66F17FF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF3310E3D7;
	Fri, 28 Apr 2023 12:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6619F10E3D7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:31:10 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230428123105euoutp02688987c21d9912deceb80bef67d64eb8~aGSbCg6n73044830448euoutp02C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:31:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230428123105euoutp02688987c21d9912deceb80bef67d64eb8~aGSbCg6n73044830448euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682685065;
 bh=yqYyAvCs6yol+s6Px9lxqXZtuSgpKT9Q+OXm0BG6I5M=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=WpdSrlZHdsdUx+l89Nvu05TYy9fy4fDD8CZHRpUTD7Fq/k/ULqdUBuU4ZKVXcq4zE
 vaL3BnnlorSfMdkNc7/T1Lz2CknRb9My2Gnic3oVCu/s/pwrwjcperZ+vM3dKzLLRK
 7pVvblxvT27oVfHLXjox25PhgFLquJZjLH18ra4w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230428123104eucas1p18974da9aa87fe921ff332dea80b695f2~aGSaq1Z8V0089700897eucas1p1z;
 Fri, 28 Apr 2023 12:31:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C2.58.42423.88CBB446; Fri, 28
 Apr 2023 13:31:04 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230428123104eucas1p2c527f8a941ec65f4eda788c512258a31~aGSaR47SF1685316853eucas1p2D;
 Fri, 28 Apr 2023 12:31:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230428123104eusmtrp18474688674b8ba5591b2fb054a3986b0~aGSaRFzTt1366113661eusmtrp1S;
 Fri, 28 Apr 2023 12:31:04 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-44-644bbc88942b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8F.95.10549.88CBB446; Fri, 28
 Apr 2023 13:31:04 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230428123103eusmtip10a97e1b6b5885c77f9d0ff62fc815992~aGSZWZ_pG0131101311eusmtip1C;
 Fri, 28 Apr 2023 12:31:03 +0000 (GMT)
Message-ID: <343f8d25-566f-9d14-64db-4e796cc9e406@samsung.com>
Date: Fri, 28 Apr 2023 14:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH V2 5/6] drm: bridge: samsung-dsim: Support non-burst mode
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAHCN7x+vd-bP8NgS-cRrnm8ojq0kwUg6aXokJv6xSU7BrT04Vw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUwTZxzHfe6u12tju2th4RlzShp1AbNqM5fcIjPzJdllZEE3NdElzJNe
 Kspb7uhcTbZVm1QEx1pIunBFRcDpqmDWFYaARIlS3oYELBulrviSEbDCeOvEt45ydeO/7+/7
 fL75/p4nD4GqrXgikZVbwHK5TLYGl2MN7fO97xS2pOk3BCOrqMBwN0o1+4qlVMfvVQgVrJ7B
 qEiDHaXsjU6cujM3iVPfne+VUKVBG0bNum04NXq2DlCdIR9GjZweQqiT9hopNdBUgVMh6zFA
 TV71A6r0zJDkQzVdOxWU0GMXzCh9RujA6GvhSoy+KtyV0s7Ccgld3TKG0G7XSZy+6auW0B22
 foQODLbgdLDYi9Dfv9hAl3hcgJ5xr9zx2j55qp7NzvqS5dZv3i8/OPxIlz+s+urW4C3cDGqU
 RUBGQHIjLKu1giIgJ9TkRQBbn03HhlkAPfX3EHGYAdByswt5Fbn3cyRGXQDQ7quPUVMLVJ8D
 i1IKcjOsGXqwmMDINVDomUNFXwU7yx8uMq+TLDzuDEmjOo5Mh4P9rkWNkgnQ//DsYjae1MC7
 PS+A6NdIYPmvfFTjpA4WPS7Co1pG7oSuqmZMZFZBS70TjS4EybAMPnoyjYlrb4f2G11SUcfB
 ca8nplfA7rJTmBg4AWDlsyAiDjYAzaN+IFKbYKD36UIdsVCRDK80rRftLbDnfBkatSGphH88
 VolLKGFpww8xWwELrWqRXgsFb91/tTf6+lEb0AhLnkVYcn1hyXWE/3srAeYCCayRzzGwvC6X
 PaLlmRzemGvQZubluMHCV+1+6Z1uBKfHp7RtACFAG4AEqolXKEwf6dUKPWM6ynJ5X3DGbJZv
 A28SmCZBse6Dzkw1aWAK2MMsm89yr04RQpZoRuij6d+qCLtkp7RvzaWJ9w89rzg1f5v5LeAL
 uzB8LvLnZ0l7/5YGLSaDVZuVMTSGWkFJyR3PFr64e/zTCXN18t6KeZtj6/LlI29/7Pjnfvvz
 azOrr59QFkhakLTRdFPcYChlZXuPzVhfrjqQ8Qm37kFGxo91+bcLC2a1l7y7yNWdfOtAe6Bs
 l8C/cehyWuOK1uuRZaMRmKnfvxGP/6thq2WHeyD53cbwS2LbpsNKvyPJX5w68VYqqtvtHGF+
 0TmqOJaTPQ3t3m5pNjKJe/gsed2R4WUXw8c/N0wB9RXZk20HPN+8x+hNvshPeZNdrrX3U+KP
 gT1NSXT+16D2nPucBuMPMroUlOOZfwGChoAIGQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsVy+t/xu7ode7xTDB61sVncuX2a2WL31W52
 ixPXFzFZ3F/8mcXi/7aJzBYTd8xms7jy9T2bRe/Sc6wWk+5PYLH4smkCm8Xz+esYLU6+ucpi
 8WDuTSaLzolL2C0u75rDZvGmrZHR4v3OW4wWk+bdZHUQ8lj78T6rx8vlDcwe82adYPHY+20B
 i8fOWXfZPWZ3zGT1WLznJZPHplWdbB5Hri5m9Tgx4RKTx51re9g87ncfZ/Lo/2vg0bdlFaPH
 501yAfxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJ
 ehm3XxsW3BasOHrtKFsD4xK+LkZODgkBE4mHG/8zdjFycQgJLGWUeNj8jhEiISNxcloDK4Qt
 LPHnWhcbRNF7Ronv3xcxgSR4Bewkltx8DGazCKhKzDrzlRkiLihxcuYTFhBbVCBV4saeP2wg
 trCAr8S5OQ1gC5gFxCVuPZkP1isioCRx98xfsCuYBZawSiw6toUdYttOJomjh96BTWUTMJTo
 etsFNolTIFBi1aLdLBCTzCS6tnZBTZWXaN46m3kCo9AsJIfMQrJwFpKWWUhaFjCyrGIUSS0t
 zk3PLTbUK07MLS7NS9dLzs/dxAhMI9uO/dy8g3Heq496hxiZOBgPMUpwMCuJ8PJWuqcI8aYk
 VlalFuXHF5XmpBYfYjQFhsZEZinR5HxgIssriTc0MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJ
 zU5NLUgtgulj4uCUamCaJrzbvendbZY7m81jpzxun9KxyTtKUyi5ZEbLHc/rFt7Xp+0pYnmo
 9SeyLymxYfNBgb+Kr870+T7fXpKryCGjK6e8tYlvsbvyxMCpvI1TD6rufr/1lqQN48fg64f+
 FbB/9BILf5x4dqrRjPBN3Y8DD7m3C3DPN1jgMWHOooedIcJFKTo3E15928ybsiVo4/lTEYUL
 +vnWSCjIrFfgmVl09+c7w8dzlywLkzxwg3X7yimF62+rH5kWfYvleddDjUke/dzKl/+u2XbE
 XTbNYD9zulehb86G2L9Sl8qmbBFl52r4UHj5Fd8mrwcxfuKS8vLhsd6X+IOr3p1b/3rOoeJX
 8fkBVl8vb5gbemvqHFULJZbijERDLeai4kQAVUmNSawDAAA=
X-CMS-MailID: 20230428123104eucas1p2c527f8a941ec65f4eda788c512258a31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230423121305eucas1p287a952d41b1884b117fa15a748b9e1a2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230423121305eucas1p287a952d41b1884b117fa15a748b9e1a2
References: <20230423121232.1345909-1-aford173@gmail.com>
 <CGME20230423121305eucas1p287a952d41b1884b117fa15a748b9e1a2@eucas1p2.samsung.com>
 <20230423121232.1345909-6-aford173@gmail.com>
 <b6b53da5-6986-a958-ef84-650b3a57ad9c@samsung.com>
 <CAHCN7x+vd-bP8NgS-cRrnm8ojq0kwUg6aXokJv6xSU7BrT04Vw@mail.gmail.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.04.2023 12:00, Adam Ford wrote:
> On Mon, Apr 24, 2023 at 3:25 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 23.04.2023 14:12, Adam Ford wrote:
>>> The high-speed clock is hard-coded to the burst-clock
>>> frequency specified in the device tree.  However, when
>>> using devices like certain bridge chips without burst mode
>>> and varying resolutions and refresh rates, it may be
>>> necessary to set the high-speed clock dynamically based
>>> on the desired pixel clock for the connected device.
>>>
>>> This also removes the need to set a clock speed from
>>> the device tree for non-burst mode operation, since the
>>> pixel clock rate is the rate requested from the attached
>>> device like an HDMI bridge chip.  This should have no
>>> impact for people using burst-mode and setting the burst
>>> clock rate is still required for those users.
>>>
>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>> This one breaks Exynos-5433 based TM2e board with a DSI panel.
> Marek S,
>
> Thank you for testing!  I knoiw there are several of us who appreciate
> your testing this since it's hard to know if something broke without
> hardware.  Is there any way you can tell me if the flag is set to
> enable MIPI_DSI_MODE_VIDEO_BURST?

TM2e board uses the DSI panel operated in command mode and handled by 
panel-samsung-s6e3ha2.c driver. The MIPI_DSI_MODE_VIDEO_BURST flag is 
not set by the driver. However, the MIPI_DSI_CLOCK_NON_CONTINUOUS flags 
is set there. I really have no idea if setting VIDEO_BURST would make 
sense together with CLOCK_NON_CONTINUOUS or not. Maybe the driver lacks 
setting it?


> I was trying to be diligent about not breaking your boards, but
> without your boards, it's difficult.  The theory was that if
> MIPI_DSI_MODE_VIDEO_BURST is set and there is a burst clock set in the
> device tree, it would use the burst clock.
>
> As a fall-back I could just simply check for the presence of the
> burst_clock_rate instead of both MIPI_DSI_MODE_VIDEO_BURST and
> burst_clock_rate.

Maybe you should extend your check also for the 
MIPI_DSI_CLOCK_NON_CONTINUOUS flag? Does it make sense?

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

