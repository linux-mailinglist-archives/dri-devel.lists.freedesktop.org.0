Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8462487F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 18:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE55010E75E;
	Thu, 10 Nov 2022 17:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E08010E72D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 17:41:09 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4EBB384FF4;
 Thu, 10 Nov 2022 18:41:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1668102067;
 bh=O/bE/gPH1Kz14StTNiHgYOrH3ijcLqNN7IH+SzC9QBw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e5SW64nV0/UcdsC9PVMLLYsr/OpQ3io5jD7o4WK3VZ1xEe8xf4NBN9acjBmL6XqEw
 Tb/CcZieCmnTslF5TSZQh71vjWxKv3UadQ2nmvChcRpJRERd0XKNNnfrBtsG6rvHCM
 9IozbWkZqiyFSfBnPUkhGcB7bI02L0TzpZpXodykzeTCP/PP9kPg+JpDxQKebul7+R
 VPvRXhkeNB92tuZFtROqyRMq0XfdBnkdFVBEDY3RgpCP/F/m2yS1RnHTEasrOomKAu
 GajM877dbVmJrG3/0zvuFldrRphG/8yaD4EYQ3pES9PQuBcImvYNRgH8OZK1qBvK++
 3M27vnJuJbtMg==
Message-ID: <5d9b7d61-5a0f-d086-61ee-5c7621b79ba1@denx.de>
Date: Thu, 10 Nov 2022 18:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
 <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
 <CAMty3ZA9sPf97C0xonHwBR8SWDrRyA7DKVCmWOyoxijQwXUSZQ@mail.gmail.com>
 <291cd9ec-582a-49e7-adf5-9955539897ea@denx.de>
 <CAMty3ZCLZKDnmG3XdxidKPNYLieoxUqW0or3RTWO3EW0NAiTSA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZCLZKDnmG3XdxidKPNYLieoxUqW0or3RTWO3EW0NAiTSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/22 18:37, Jagan Teki wrote:
> On Thu, Nov 10, 2022 at 10:29 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 11/10/22 17:03, Jagan Teki wrote:
>>> On Thu, Nov 10, 2022 at 9:24 PM Fabio Estevam <festevam@gmail.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On Mon, Nov 7, 2022 at 1:34 PM Frieder Schrempf
>>>> <frieder.schrempf@kontron.de> wrote:
>>>>
>>>>> I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
>>>>> and a Jenson 7" LVDS Display.
>>>>>
>>>>> Thanks for your work, Jagan!
>>>>>
>>>>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
>>>>> i.MX8MM
>>>>
>>>> As this series has been successfully tested on multiple devices, is it possible
>>>> to apply it so people can make further adjustments?
>>>
>>> I think the next version patchset on this would be clean and properly
>>> address a few comments from Marek Vasut. However, I'm still waiting
>>> for Marek's response to my comment on the input bus formats - if it is
>>> Okay I will send the v8.
>>> https://lore.kernel.org/all/CAMty3ZAM+fetmBQWaSbfjME7-Up4h+Ln3BRHaPgg5tuSsObPdw@mail.gmail.com/
>>
>> Just send a V8 and let's see how that looks, no need to wait for me.
> 
> Planning to include your 8M Plus patch as part of the v8, hope it's fine?

Fine
