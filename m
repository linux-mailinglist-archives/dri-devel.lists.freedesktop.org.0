Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0FA3FF6EC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 00:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B226E822;
	Thu,  2 Sep 2021 22:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C4B6E822
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 22:10:18 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210902221017euoutp02bfd174f4a0a5bd42a5a2d879a5387074~hIM-VkBY41794317943euoutp02a
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 22:10:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210902221017euoutp02bfd174f4a0a5bd42a5a2d879a5387074~hIM-VkBY41794317943euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1630620617;
 bh=+cFvhzqtn0hctNTDhhm/VOiBMV5RGPNkUgUXiD3jIK0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=o0FxlQXixmRpphhR0faJ2ZK1gFlt9GZeVw2Cwl4YIgEIoQVYTu7AZXUoPY/zZSv0+
 iMvCNNln7a8US9tSzPZqXDDJ5e2sVmLNj/8dDMavfwK1ketN0814IQImT/dd+hirPQ
 WtfOtayOfBkHTTFrqNoYg1NYlJH5B0FzvZfScaX8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210902221016eucas1p146dd1b1577cef73d9ba4381e4bd14fa4~hIM_wvUet2964729647eucas1p1p;
 Thu,  2 Sep 2021 22:10:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8B.EE.45756.8CB41316; Thu,  2
 Sep 2021 23:10:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210902221015eucas1p26fae8f6ba4c70087dc7b007a271dce4b~hIM9ditUN1154911549eucas1p26;
 Thu,  2 Sep 2021 22:10:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210902221015eusmtrp20ae878e47dc423f33a52ecc70a1327aa~hIM9cpaEB1635516355eusmtrp2S;
 Thu,  2 Sep 2021 22:10:15 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-8a-61314bc8b16f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EA.C7.20981.6CB41316; Thu,  2
 Sep 2021 23:10:14 +0100 (BST)
Received: from [192.168.0.14] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210902221014eusmtip29eaf4ecb5d0517c13a0294299bd3d215~hIM8hETkp1495614956eusmtip2V;
 Thu,  2 Sep 2021 22:10:14 +0000 (GMT)
Subject: Re: [PATCH v3 00/16] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Douglas Anderson <dianders@chromium.org>, Thierry Reding
 <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sam Ravnborg
 <sam@ravnborg.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Ripard
 <mripard@kernel.org>, dri-devel@lists.freedesktop.org, NXP Linux Team
 <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, =?UTF-8?Q?=c5=81ukasz_Stelmach?=
 <l.stelmach@samsung.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <b1b67791-69b7-a5c0-9e98-73bb82afaeaa@samsung.com>
Date: Fri, 3 Sep 2021 00:10:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7djPc7onvA0TDbrmiFrMP3KO1eLssoNs
 Fle+vmezuHloBaPFpsfXWC0m7j/LbtH1ayWzxeVdc9gsOjdtZbSYvaSfxWLry3dMFjPO72Oy
 mLJvF1Diyyw2i7bOZawWrXuPsFus+AlU93PXPBYHIY/ZDRdZPHbOusvusWlVJ5vH/e7jTB6b
 l9R7vNg8k9Fj47sdTB5Lpl1l8+jbsorR4/MmuQCuKC6blNSczLLUIn27BK6Ml5PusBY8FanY
 NFusgfG8QBcjB4eEgInEyb3BXYxcHEICKxglbtxbzgzhfGGUWHvtMiOE85lRYk/jf7YuRk6w
 jqMdi1ghEssZJY7PfAPV8pZRoufWMiaQKmGBRInZiyezgtgiAvMYJe48UAApYhZ4zSyx58sa
 sASbgKbE3803wcbyCthJ/Hi3hRHkKBYBFYmjC6VBwqICkRJ/T+5ihSgRlDg58wkLiM0pYCtx
 /tlisF3MAuISt57Mh7LlJba/nQN2kITAJU6JbR2tjBBnu0jsvbKSGcIWlnh1fAs7hC0j8X8n
 RLOEQL3E/RUtUM0djBJbN+yEarCWuHPuFxvIccxAR6/fpQ8RdpT4cmkvKyQg+SRuvBWEuIFP
 YtK26cwQYV6JjjYhiGpFiftnt0INFJdYeuEr2wRGpVlIPpuF5JtZSL6ZhbB3ASPLKkbx1NLi
 3PTUYsO81HK94sTc4tK8dL3k/NxNjMD0ePrf8U87GOe++qh3iJGJg/EQowQHs5II7043g0Qh
 3pTEyqrUovz4otKc1OJDjNIcLErivKtmr4kXEkhPLEnNTk0tSC2CyTJxcEo1MMknlZRt8Tu6
 PtPnzeroLbr+7/ev2PJS3dnoxrL1Du/Pbd8YPPMmd+DSAOmPL0wdbs6wKzp4Tlb27829ace3
 JmYVOFrwt11+du2bY8KxSTsOTwm/s/CDVtzl/xoiD1kWTd3sEr9GbH65lsNstr+yvy0nbrMp
 Wusd8SP2mQETT+efGWaVk172OpU43+tcLstaY6+19ABfefM7zy+LFx7+YM/MLXNT9eKEX2KN
 5mHL1V04fNatYo/O+GPT9or3U51nUuuqa6yvw3ImT9f40u6a9qrrGqdC2gsjd2FXi2Nupob+
 Gl4Slbcmh188Lvp+nmHPRWmrU5W1bH9MHtRZJTTV1WdPsd6dLqqwgtFqI8uto0osxRmJhlrM
 RcWJAOa1PYP+AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsVy+t/xe7rHvA0TDR7cs7GYf+Qcq8XZZQfZ
 LK58fc9mcfPQCkaLTY+vsVpM3H+W3aLr10pmi8u75rBZdG7aymgxe0k/i8XWl++YLGac38dk
 MWXfLqDEl1lsFm2dy1gtWvceYbdY8ROo7ueueSwOQh6zGy6yeOycdZfdY9OqTjaP+93HmTw2
 L6n3eLF5JqPHxnc7mDyWTLvK5tG3ZRWjx+dNcgFcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6
 RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZLyfdYS14KlKxabZYA+N5gS5GTg4JAROJox2L
 WLsYuTiEBJYySrSd6WCHSIhL7J7/lhnCFpb4c62LDaLoNaPEu8O9rCAJYYFEidmLJ4PZIgLz
 GCVOrHQHKWIWeM0ssezZLKBuDqAOG4kbW/VBatgENCX+br7JBmLzCthJ/Hi3hRGkhEVAReLo
 QmmQsKhApETTia1QJYISJ2c+YQGxOQVsJc4/W8wEYjMLmEnM2/yQGcIWl7j1ZD5UXF5i+9s5
 zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECEwH24793LKD
 ceWrj3qHGJk4GA8xSnAwK4nw7nQzSBTiTUmsrEotyo8vKs1JLT7EaAr0zkRmKdHkfGBCyiuJ
 NzQzMDU0MbM0MLU0M1YS5zU5siZeSCA9sSQ1OzW1ILUIpo+Jg1OqgUljjRjr7+UX+yw2LSxJ
 3JMUtIItWOkDV26vliLf5ZXeKqEZM4U9nzHcC1cvFjpfscAmym5C9Z5JN6+eWOg1mePuVFtl
 /ou/HzTPzY2vbS5hTelmOOp/VPOtx7bWeT/91P9t/6ByqIprwrGrPbpKlmpHjvx69TFpndfk
 1I0fH99si3g2cUHS5lYhxojJ9Q8Ed+tIHXiltkAp3Dzfx+6vlqSrdotvyvLZ/YJp6WKXnp7Y
 zbZerPLMCVvVj00tLPGJNrJCG9V26N6xyvj0O2Km/T/ric+bZrLdz1uvM43rsIlHF9uKjvKv
 hTvnhLn98X5qwa8vfJ7J+1nL29ueG25cnR0wK7rgj2Pz3i7O6YaTniqxFGckGmoxFxUnAgCo
 in5UkAMAAA==
X-CMS-MailID: 20210902221015eucas1p26fae8f6ba4c70087dc7b007a271dce4b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210902221015eucas1p26fae8f6ba4c70087dc7b007a271dce4b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210902221015eucas1p26fae8f6ba4c70087dc7b007a271dce4b
References: <20210901201934.1084250-1-dianders@chromium.org>
 <CGME20210902221015eucas1p26fae8f6ba4c70087dc7b007a271dce4b@eucas1p2.samsung.com>
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


Removed most CC: SMTP server protested.

On 01.09.2021 22:19, Douglas Anderson wrote:
> The goal of this patch series is to move away from hardcoding exact
> eDP panels in device tree files. As discussed in the various patches
> in this series (I'm not repeating everything here), most eDP panels
> are 99% probable and we can get that last 1% by allowing two "power
> up" delays to be specified in the device tree file and then using the
> panel ID (found in the EDID) to look up additional power sequencing
> delays for the panel.
> 
> This patch series is the logical contiunation of a previous patch
> series where I proposed solving this problem by adding a
> board-specific compatible string [1]. In the discussion that followed
> it sounded like people were open to something like the solution
> proposed in this new series.
> 
> In version 2 I got rid of the idea that we could have a "fallback"
> compatible string that we'd use if we didn't recognize the ID in the
> EDID. This simplifies the bindings a lot and the implementation
> somewhat. As a result of not having a "fallback", though, I'm not
> confident in transitioning any existing boards over to this since
> we'll have to fallback to very conservative timings if we don't
> recognize the ID from the EDID and I can't guarantee that I've seen
> every panel that might have shipped on an existing product. The plan
> is to use "edp-panel" only on new boards or new revisions of old
> boards where we can guarantee that every EDID that ships out of the
> factory has an ID in the table.
> 
> Version 3 of this series now splits out all eDP panels to their own
> driver and adds the generic eDP panel support to this new driver. I
> believe this is what Sam was looking for [2].
> 
> [1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/
> [2] https://lore.kernel.org/r/YRTsFNTn%2FT8fLxyB@ravnborg.org/
> 
I like the idea - if something can be configured dynamically lets do it.
But I have few questions:
1. Have you read different real panels id's? In many cases (MIPI DSI, 
LVDS with EDID) manufacturers often forgot to set proper id fields. I do 
not know how EDID's ids are reliable in case of edp panels.
2. You are working with edp panels - beside EDID they have DPCD which 
contains things like IEEE_OUI and "Device Identification String", I 
guess they could be also used for detecting panels, have you considered 
it? I think DPCD Id should be assigned to EDP-Sink interface, and EDID 
Id to the actual panel behind it. With this assumption one could 
consider which timings should be property of which entity.


Regards
Andrzej
