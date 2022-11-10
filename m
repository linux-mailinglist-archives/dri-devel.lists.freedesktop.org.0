Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE16247BE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C7910E6CE;
	Thu, 10 Nov 2022 16:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4328210E6CE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 16:59:26 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D533584D17;
 Thu, 10 Nov 2022 17:59:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1668099563;
 bh=wqRbI3/U80qgngzNAH74ntF8Owlq1j4hStCDINhdFHw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wJlds3nkqISrPYMnZX9iGaGqmv22qbVzZ3fVp7t2cTPjpcJOufA19dQRMb5F6Iae5
 WbB2UuGEwj/3CIZIoTAA52WITsUFYas+RhpPDn1BctYJnOaXKWhUtte8+LDPGVN24Q
 /9+efMNFsf4td2x7GvHPJNFRZ7hi9uVRzIyhnWm8m9/2JTPl1DBonBH6to5ux7VBLn
 1Cwkl6ZLhBDV5C9JEmgyLYZ1DylBtiDuWfo41Cm2Bs9GpayuaKH5AQGLOLQyBpMNkw
 Gvor6JCwh70GPfQkbDH5z1qNh1MMwudET/FuP/sDMTVeCaqVQEb3e37R6rDt7T4tbk
 1dX5Tjf5JhHDw==
Message-ID: <291cd9ec-582a-49e7-adf5-9955539897ea@denx.de>
Date: Thu, 10 Nov 2022 17:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To: Jagan Teki <jagan@amarulasolutions.com>, Fabio Estevam <festevam@gmail.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
 <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
 <CAMty3ZA9sPf97C0xonHwBR8SWDrRyA7DKVCmWOyoxijQwXUSZQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZA9sPf97C0xonHwBR8SWDrRyA7DKVCmWOyoxijQwXUSZQ@mail.gmail.com>
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

On 11/10/22 17:03, Jagan Teki wrote:
> On Thu, Nov 10, 2022 at 9:24 PM Fabio Estevam <festevam@gmail.com> wrote:
>>
>> Hi,
>>
>> On Mon, Nov 7, 2022 at 1:34 PM Frieder Schrempf
>> <frieder.schrempf@kontron.de> wrote:
>>
>>> I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
>>> and a Jenson 7" LVDS Display.
>>>
>>> Thanks for your work, Jagan!
>>>
>>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
>>> i.MX8MM
>>
>> As this series has been successfully tested on multiple devices, is it possible
>> to apply it so people can make further adjustments?
> 
> I think the next version patchset on this would be clean and properly
> address a few comments from Marek Vasut. However, I'm still waiting
> for Marek's response to my comment on the input bus formats - if it is
> Okay I will send the v8.
> https://lore.kernel.org/all/CAMty3ZAM+fetmBQWaSbfjME7-Up4h+Ln3BRHaPgg5tuSsObPdw@mail.gmail.com/

Just send a V8 and let's see how that looks, no need to wait for me.
