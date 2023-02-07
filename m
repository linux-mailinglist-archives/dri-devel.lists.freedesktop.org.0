Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E79A68D2A7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 10:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E90610E18E;
	Tue,  7 Feb 2023 09:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B2F10E18E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 09:23:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1F02C85883;
 Tue,  7 Feb 2023 10:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1675761800;
 bh=5HBYFCs4vI1aDS7UhRkhM+9AOnEsulPKysY/3RB7eUE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n3Y/p828aH+xgLeDVd+4UQ8KlOvqCvJ8UXumhwzut06Eh7bNjWdEKPUibXx6iWwaA
 TwECPxPBzHFNOWUoJmEFIV2lr9bffcQzJdTCED8BbEfgC/MH8XTTkEsx/EemnKUaHa
 sd+hFwXErxaF6vXQMaYP815t+ieodJZFjM8QJ5hqOo8aXIs5WZD2RPl1JODAvAgbmD
 WjCqEUX2LaZ8HNwVup3TG8jBPTY+UD146PZmfX5SlY+s+FGy7DRgMqvHdtkyyoxsFK
 3nlvOlGRZSwfQtoXzJZ4niZ4KHXalCpW9SnxWtbcgaLnsX4KrQiVH209Bro/nxZehs
 P5CULrPZ+iZ8A==
Message-ID: <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de>
Date: Tue, 7 Feb 2023 10:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/7/23 10:09, Rasmus Villemoes wrote:

[...]

> Now hotplug-detect doesn't work with the current sn65dsi86 driver, but
> that's a separate issue; when I boot with a monitor attached, its edid
> is correctly read out. But I still don't get any output, and the monitor
> says "no signal" - my naive attempt (which has worked fine in other
> cases) was to just dd /dev/urandom to /dev/fb0, so I'm clearly missing
> some important step.

You could try and tweak the DSI mode flags in 
drivers/gpu/drm/bridge/ti-sn65dsi86.c to operate in DSI burst mode 
MIPI_DSI_MODE_VIDEO_BURST instead of MIPI_DSI_MODE_VIDEO . Then you 
could configure the DSIM PLL to 891 MHz , but you also have to make sure 
the DSI86 would expect the 891 MHz (please check the datasheet).

Try and look up patches below for related approach:
drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
drm: bridge: samsung-dsim: Select DSI HS clock rate from downstream 
bridge limits
