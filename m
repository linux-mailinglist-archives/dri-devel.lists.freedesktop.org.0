Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C84649585
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 19:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BBA10E14C;
	Sun, 11 Dec 2022 18:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6B910E14C
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 18:06:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0EA8C8537C;
 Sun, 11 Dec 2022 19:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670781970;
 bh=Nxixld48CREQJ6BpwcmoKastD0tTJWM81ebYUdiisiQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Wiq+PfQMBMm4iEA5SOJixW6SiEXpQgEsqBMTosH229JoDiSPWfLEAtbFmqI/uQ1UC
 e7l/pp8HFMeV0JUiIUoxpJt9D61uIoUPPqcQfEBL7ppXaI70HCNfqWMJ5V+9DY9CLz
 TaoWWf1I3we90UPSfSvP9JVwYWIV+fgqDA+ejGJzC0CDmkbBrvCCXzbLpv/dDNdONJ
 bhO59qeswK+cuP39z8KQMHN95VJ5jsNiHwUQzqVnBq8ckcXFWim0nK5kO4SpZ2OpcQ
 XRktlKiUg54XGMPuvVdDfsKwDZFeEuwZEAmn5W+pdViGuTa2Jbm19hsBGRKx3ymCAk
 vioxImkwNYyzQ==
Message-ID: <deb78a20-11f7-8618-4064-76f0397a2657@denx.de>
Date: Sun, 11 Dec 2022 19:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 07/18] drm: bridge: samsung-dsim: Lookup OF-graph or
 Child node devices
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <20221209152343.180139-8-jagan@amarulasolutions.com>
 <4396da63-d9c0-a9b4-3953-67e6bcfb1bf1@denx.de>
 <CAMty3ZBOR_Bif9PUdiFgVzFLANhFn57pQTrn5=aFXgHEnA1=rA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBOR_Bif9PUdiFgVzFLANhFn57pQTrn5=aFXgHEnA1=rA@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/11/22 06:42, Jagan Teki wrote:
> On Sun, Dec 11, 2022 at 7:58 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 12/9/22 16:23, Jagan Teki wrote:
>>> The child devices in MIPI DSI can be binding with OF-graph
>>> and also via child nodes.
>>>
>>> The OF-graph interface represents the child devices via
>>> remote and associated endpoint numbers like
>>>
>>> dsi {
>>>      compatible = "fsl,imx8mm-mipi-dsim";
>>>
>>>      ports {
>>>        port@0 {
>>>             reg = <0>;
>>>
>>>             dsi_in_lcdif: endpoint@0 {
>>>                  reg = <0>;
>>>                  remote-endpoint = <&lcdif_out_dsi>;
>>>             };
>>>        };
>>>
>>>        port@1 {
>>>             reg = <1>;
>>>
>>>             dsi_out_bridge: endpoint {
>>>                  remote-endpoint = <&bridge_in_dsi>;
>>>             };
>>>        };
>>> };
>>>
>>> The child node interface represents the child devices via
>>> conventional child nodes on given DSI parent like
>>>
>>> dsi {
>>>      compatible = "samsung,exynos5433-mipi-dsi";
>>>
>>>      ports {
>>>           port@0 {
>>>                reg = <0>;
>>>
>>>                dsi_to_mic: endpoint {
>>>                     remote-endpoint = <&mic_to_dsi>;
>>>                };
>>>           };
>>>      };
>>>
>>>      panel@0 {
>>>           reg = <0>;
>>>      };
>>> };
>>>
>>> As Samsung DSIM bridge is common DSI IP across all Exynos DSI
>>> and NXP i.MX8M host controllers, this patch adds support to
>>> lookup the child devices whether its bindings on the associated
>>> host represent OF-graph or child node interfaces.
>>>
>>> v9, v8, v7, v6, v5, v4, v3:
>>> * none
>>>
>>> v2:
>>> * new patch
>>
>> This looks like a good candidate for common/helper code which can be
>> reused by other similar drivers.
> 
> Yes, I have responded to the same comment of yours in v7 [1]. It is
> hard to make this code work in a generic way.

It seems the patch adds a for_each...() loop and a function call. Should 
be easy enough to turn that into a helper. What am I missing ?
