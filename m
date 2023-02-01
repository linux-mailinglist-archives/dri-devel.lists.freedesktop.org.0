Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DAC6870C8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 23:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D462010E091;
	Wed,  1 Feb 2023 22:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6AD10E091
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 22:01:10 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2FFEA85E33;
 Wed,  1 Feb 2023 23:00:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1675288863;
 bh=6GRRYt5aNMZNRsKyHoSmp4/NA2MSLR8z21thUyNxF1o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=icLiCMCaFPfnCGXlot0hfgoXpeWQFDjCihSFyAxIBm7/YABoRyyMJc5GyjfyHyX6U
 CkHVLhAQrBSSbEl1lhQMVjm7eFmrQxh9ofDHD7WOyD2qWD0s9eAS0uagJNQt8I2AGH
 NvZC53e+0VJkdQlpDJc9Ht6E9hrWN39wtm4mnUyAd8+9/gGEsvn6eo57Ts2hp0UyOj
 S7JrrpQX+bQbXQfCAc3CRIvY9vGyePNVwlQ9W2RVvz80rOlqtIHzlh59Ml0gesyBBG
 q1nDTSIdSPFmjacwDU7HSRCROLLxFVbHOihDdv7lrFVxpj2H8MjN70vcFT6FdvbxeK
 W32yJYqhuMlEg==
Message-ID: <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
Date: Wed, 1 Feb 2023 23:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, frieder.schrempf@kontron.de,
 kyungmin.park@samsung.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/30/23 13:45, Rasmus Villemoes wrote:
> On 27/01/2023 12.30, Marek Vasut wrote:
>> On 1/27/23 12:04, Jagan Teki wrote:
> 
>>>> Thanks, but that's exactly what I'm doing, and I don't see any
>>>> modification of imx8mp.dtsi in that branch. I'm basically looking for
>>>> help to do the equivalent of
>>>>
>>>>     88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
>>>>     f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
>>>>
>>>> for imx8mp in order to test those patches on our boards (we have two
>>>> variants).
>>>
>>> Marek, any help here, thanks.
>>
>> Try attached patch.
> 
> Thanks. I removed the lcdif2 and ldb nodes I had added from Alexander's
> patch (94e6197dadc9 in linux-next) in order to apply it. I get a couple
> of errors during boot:
> 
>    clk: /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to reparent
> media_apb to sys_pll1_266m: -22
> 
> and enabling a pr_debug in clk_core_set_parent_nolock() shows that this
> is because
> 
>    clk_core_set_parent_nolock: clk sys_pll1_266m can not be parent of clk
> media_apb
> 
> Further, the mipi_dsi fails to probe due to
> 
>    /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to get
> 'samsung,burst-clock-frequency' property
> 
> All other .dtsi files seem to have those samsung,burst-clock-frequency
> and samsung,esc-clock-frequency properties, so I suppose those should
> also go into the imx8mp.dtsi and are not something that the board .dts
> file should supply(?).

No, that samsung,esc-clock-frequency (should be some 10-20 MHz, based on 
your panel/bridge) and samsung,burst-clock-frequency (that's the HS 
clock) should go into board DT, as those are property of the attached 
panel/bridge.

> [There's also some differences between your patch and Alexander's
> regarding the lcdif2 and ldb nodes, so while my lvds display still sorta
> works, I get
> 
>    fsl-ldb 32ec0000.blk-ctrl:lvds-ldb: Configured LDB clock (297000000
> Hz) does not match requested LVDS clock: 346500000 Hz
> 
> and the image is oddly distorted/shifted. But I suppose that's
> orthogonal to getting the lcdif1 -> mipi-dsi -> ... pipeline working.]

Alexander is right in the reply below, you have to configure the LVDS 
serializer clock in DT and they must match LCDIF2 pixel clock which are 
also configured in DT then, else you won't get the correct LVDS clock.
