Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6057BBC8D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 18:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338AB10E530;
	Fri,  6 Oct 2023 16:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC1F10E530
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 16:16:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20231006161654euoutp0277c28c228f3908af179682c5b20809df~LkOjSxP4S2822928229euoutp021
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 16:16:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20231006161654euoutp0277c28c228f3908af179682c5b20809df~LkOjSxP4S2822928229euoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1696609014;
 bh=qAAAzXrrsj5Rb1r1+7kJS+1Fb64LpnKfMoYosLgQlgc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=nY9DkCv5KmhvIUcAO5ETa0J4lPItie7OI2Fria6jW2ORw8rZqj5pNBaAOEnz4JHKe
 afYZIDgY/GmSjc50WJ19Xjso3R4rzKkvp1+yUeMzh4TYannscNH2GAtbM38NrbiRih
 q96zgYnSNy/vysqXdGLfx+8fGZ+jTmqi3Raw+vYA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231006161653eucas1p2691995adc126c0a6477e2e5a1ac6a441~LkOi8XNyY1416314163eucas1p2J;
 Fri,  6 Oct 2023 16:16:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7C.1B.11320.5F230256; Fri,  6
 Oct 2023 17:16:53 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20231006161653eucas1p22a6382869a0995a5b799a899873cd9e4~LkOieu5y21327713277eucas1p2Q;
 Fri,  6 Oct 2023 16:16:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231006161653eusmtrp26b12b6c8261351bdca248990dde0fb26~LkOidxRSZ1620416204eusmtrp2h;
 Fri,  6 Oct 2023 16:16:53 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-f5-652032f5b09f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A4.19.10549.5F230256; Fri,  6
 Oct 2023 17:16:53 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20231006161652eusmtip2219645029196c668d21b790716473311~LkOhcvvLh0766707667eusmtip2N;
 Fri,  6 Oct 2023 16:16:52 +0000 (GMT)
Message-ID: <1a25e5b9-43f6-47a4-877a-a0744dc6f56c@samsung.com>
Date: Fri, 6 Oct 2023 18:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm/bridge: samsung-dsim: fix various modes with
 ADV7535 bridge
Content-Language: en-US
To: Michael Tretter <m.tretter@pengutronix.de>, Inki Dae
 <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230818-samsung-dsim-v2-0-846603df0e0a@pengutronix.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7djP87pfjRRSDXq26VncuX2a2eLE9UVM
 FvcXf2ax+L9tIrPFla/v2Sx6l55jtZh0fwKLxZdNE9gsns9fx2hx8s1VFotVU3eyWHROXMJu
 cXnXHDaLD7uuMltsWwFU/H7nLUaLSfNusjoIeqz9eJ/VY++3BSweO2fdZfeY3TGT1WPxnpdM
 HptWdbJ5HLm6mNXjxIRLTB53ru1h87jffZzJo/+vgUffllWMHp83yQXwRnHZpKTmZJalFunb
 JXBl3JqyhK3gp1xF3+ZZzA2MO8W6GDk5JARMJO5N+8rexcjFISSwglHixP77UM4XRom5yzez
 QjifGSXOP21lhGl5d2o9mC0ksByoahsbRNFHRokfn08ygyR4Bewkjt66CVbEIqAise/eVnaI
 uKDEyZlPWEBsUQF5ifu3ZoDFhQViJX4vWQgWZxYQl7j1ZD4TyFARgX3MEs9/rGQEcZgFrjBK
 7PyzEqyDTcBQouttFxuIzSngKnHs/Q9GiG55ie1v5zCDNEgIPOOU2LOujxXibheJld0tLBC2
 sMSr41vYIWwZif87IdZJCLQzSiz4fR/KmcAo0fD8FtTX1hJ3zv0CWscBtEJTYv0ufYiwo8Sj
 /2cYQcISAnwSN94KQhzBJzFp23RmiDCvREebEES1msSs4+vg1h68cIl5AqPSLKSAmYUUALOQ
 vDMLYe8CRpZVjOKppcW56anFRnmp5XrFibnFpXnpesn5uZsYganz9L/jX3YwLn/1Ue8QIxMH
 4yFGCQ5mJRHe9AaZVCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8qinyqUIC6YklqdmpqQWpRTBZ
 Jg5OqQamYk+1sjadz+v01uSc8SzdzhXPdD/nyVOugDNfr+z4OmeH39Z5rDdevPOz19Tb573p
 e81OsY2P1ouF5PgYWXN7R51Iv37xwiyz8zeUz81oj7uyan7z0sl7oo9XN543uMPqeWGXceje
 G+eX1dXe3S0ulcjiuz8tYp3Nq7BHhpEv5a7aNQhLMbxesfqUhNDpfAfuv/IVB0uZojRnBYt8
 8WtWcVzn+4Fl2Yc3FV2Ga1ezPtsf5vPi6Fu+XbvYN01vUeH55TQvovlooMjE0kdaD/39W263
 dJ3V49iQu+a53J20Bg7JvGdf/544z9IQLbLefanOyTqjnQ/23J5iIc/Xc2PihpLuyMPsJYXS
 oXVcCTX7lFiKMxINtZiLihMBLWmdMwwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42I5/e/4Pd2vRgqpBvvu8VvcuX2a2eLE9UVM
 FvcXf2ax+L9tIrPFla/v2Sx6l55jtZh0fwKLxZdNE9gsns9fx2hx8s1VFotVU3eyWHROXMJu
 cXnXHDaLD7uuMltsWwFU/H7nLUaLSfNusjoIeqz9eJ/VY++3BSweO2fdZfeY3TGT1WPxnpdM
 HptWdbJ5HLm6mNXjxIRLTB53ru1h87jffZzJo/+vgUffllWMHp83yQXwRunZFOWXlqQqZOQX
 l9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehl3JqyhK3gp1xF3+ZZzA2M
 O8W6GDk5JARMJN6dWs/YxcjFISSwlFGi8/UlZoiEjMTJaQ2sELawxJ9rXWwQRe8ZJfZ2TWQD
 SfAK2EkcvXWTEcRmEVCR2HdvKztEXFDi5MwnLCC2qIC8xP1bM8DiwgKxEr+XLASLMwuIS9x6
 Mp8JZKiIwD5miSc3lrGDOMwC1xgl5jXeYYJYN4NR4vDh7WA3sQkYSnS97QJbzSngKnHs/Q9G
 iFFmEl1bu6BseYntb+cwT2AUmoXkkllINs5C0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnp
 esn5uZsYgcli27Gfm3cwznv1Ue8QIxMH4yFGCQ5mJRHe9AaZVCHelMTKqtSi/Pii0pzU4kOM
 psDgmMgsJZqcD0xXeSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJJanZqakFqUUwfUwcnFIN
 TCyp7EcmXJnOJSMva61cs64zUcxMv1r1sFPX1J//jthpFuQnVldkmvh7l1dNmRNVZ/453fyP
 1hODkpScTp5s3nnT9TsLZpZ9KYnu+PVU7gFDxU0NLYH1ohl7EhcX3vxzd92ne/xirJPktLbz
 XD74avH3pcX3G89WPHiUz/fwl/c7mej4I253D5pOVmb5atG0g+Plkrkzs4vCb62cvj/45Qs9
 ZV9xge5rF0JXnXnB3je1dn0tw8LOhU9MbO8suPl00vI3i4oOnV1a5fxm775mb9kTs31TEvNP
 yd16ybjZ/qeIb8Hmqw88a07yeui3lupMen7tQNPs3x/mrGWI6VjWdqb9v3JCxCTlyS9Dos8c
 VFJiKc5INNRiLipOBACLp48nnwMAAA==
X-CMS-MailID: 20231006161653eucas1p22a6382869a0995a5b799a899873cd9e4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231006150716eucas1p2a4d91a9fb322ddaccf2e9a0b7d517a51
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231006150716eucas1p2a4d91a9fb322ddaccf2e9a0b7d517a51
References: <CGME20231006150716eucas1p2a4d91a9fb322ddaccf2e9a0b7d517a51@eucas1p2.samsung.com>
 <20230818-samsung-dsim-v2-0-846603df0e0a@pengutronix.de>
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
Cc: linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.10.2023 17:07, Michael Tretter wrote:
> I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
> which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
> modes were working, but in many modes my monitor stayed dark.
>
> This series fixes the Samsung DSIM bridge driver to bring up a few more
> modes:
>
> The driver read the rate of the PLL ref clock only during probe.
> However, if the clock is re-parented to the VIDEO_PLL, changes to the
> pixel clock have an effect on the PLL ref clock. Therefore, the driver
> must read and potentially update the PLL ref clock on every modeset.
>
> I also found that the rounding mode of the porches and active area has
> an effect on the working modes. If the driver rounds up instead of
> rounding down and be calculates them in Hz instead of kHz, more modes
> start to work.
>
> The following table shows the modes that were working in my test without
> this patch set and the modes that are working now:
>
> |            Mode | Before | Now |
> | 1920x1080-60.00 | X      | X   |
> | 1920x1080-59.94 |        | X   |
> | 1920x1080-50.00 |        | X   |
> | 1920x1080-30.00 |        | X   |
> | 1920x1080-29.97 |        | X   |
> | 1920x1080-25.00 |        | X   |
> | 1920x1080-24.00 |        |     |
> | 1920x1080-23.98 |        |     |
> | 1680x1050-59.88 |        | X   |
> | 1280x1024-75.03 | X      | X   |
> | 1280x1024-60.02 | X      | X   |
> |  1200x960-59.99 |        | X   |
> |  1152x864-75.00 | X      | X   |
> |  1280x720-60.00 |        |     |
> |  1280x720-59.94 |        |     |
> |  1280x720-50.00 |        | X   |
> |  1024x768-75.03 |        | X   |
> |  1024x768-60.00 |        | X   |
> |   800x600-75.00 | X      | X   |
> |   800x600-60.32 | X      | X   |
> |   720x576-50.00 | X      | X   |
> |   720x480-60.00 |        |     |
> |   720x480-59.94 | X      |     |
> |   640x480-75.00 | X      | X   |
> |   640x480-60.00 |        | X   |
> |   640x480-59.94 |        | X   |
> |   720x400-70.08 |        |     |
>
> Interestingly, the 720x480-59.94 mode stopped working. However, I am
> able to bring up the 720x480 modes by manually hacking the active area
> (hsa) to 40 and carefully adjusting the clocks, but something still
> seems to be off.
>
> Unfortunately, a few more modes are still not working at all. The NXP
> downstream kernel has some quirks to handle some of the modes especially
> wrt. to the porches, but I cannot figure out, what the driver should
> actually do in these cases. Maybe there is still an error in the
> calculation of the porches and someone at NXP can chime in.
>
> Michael
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

All my Exynos-based test boards with DSI display panels still work fine 
with this patchset.

Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
> Changes in v2:
> - Specify limits for the PLL input clock in samsung_dsim_driver_data
> - Rephrase/clarify commit messages
> - Link to v1: https://lore.kernel.org/r/20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de
>
> ---
> Marco Felsch (1):
>        drm/bridge: samsung-dsim: add more mipi-dsi device debug information
>
> Michael Tretter (4):
>        drm/bridge: samsung-dsim: reread ref clock before configuring PLL
>        drm/bridge: samsung-dsim: update PLL reference clock
>        drm/bridge: samsung-dsim: adjust porches by rounding up
>        drm/bridge: samsung-dsim: calculate porches in Hz
>
>   drivers/gpu/drm/bridge/samsung-dsim.c | 54 +++++++++++++++++++++++++++--------
>   include/drm/bridge/samsung-dsim.h     |  3 ++
>   2 files changed, 45 insertions(+), 12 deletions(-)
> ---
> base-commit: b78b18fb8ee19f7a05f20c3abc865b3bfe182884
> change-id: 20230818-samsung-dsim-42346444bce5
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

