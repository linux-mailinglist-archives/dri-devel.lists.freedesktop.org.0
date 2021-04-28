Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AE536D96D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 16:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00C36EB4D;
	Wed, 28 Apr 2021 14:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6486EB4D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 14:18:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3F81B82CAE;
 Wed, 28 Apr 2021 16:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1619619531;
 bh=O/bGhJtvPfnZ16k+I5YGxy78FYHe9Z8gEGv1ABkgxi4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PYrSzcI21whfPfGqHZW+UDdok0u9AhV/+G0psBePo4AFETQ4OsIYIt7grS521ie1U
 aFf7H+RefifuYZpwaqpneQLjzZwKNBAlQHia4Kv1enoHPLGTZH9oYv3IC9JImcdazS
 AUCgMPcZb3bAjCYi/NzLh2aEetyTOaD92vP+hAvVAn46trJElpySIiGXmNCnXCXvs4
 umiQ9aPEYv2mWnd1XZM24yjiDuk7gx/vONOENfM09WE+qf830aZOJbYZeuTGxDe2hH
 Z3/u7A7N8sKuVZQBKFlNF6v5nCV3Uxd52O3mDPSwUkZSjIEy6oDLCctLtBnW3Ip2aR
 fKf5mKv4uMhFQ==
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Loic Poulain <loic.poulain@linaro.org>
References: <20210421223122.112736-1-marex@denx.de>
 <20210421223122.112736-2-marex@denx.de>
 <f3b55e0b-20d2-0add-e097-e03a675a1169@kontron.de>
 <66386909-5b89-78ab-6fcc-5bef95a66035@kontron.de>
 <CAMZdPi8kuru4+tQ3Oz-rv+D5F--8LHWa+ppJ_ywH7MWz+auKYA@mail.gmail.com>
 <f4ad222e-3468-3bfd-8a37-45cef5ee5b47@baylibre.com>
 <CAMty3ZApt3y_mqjL-zNcTWEz=QXxBKM9vXM2YTvQa5Dt552TZQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <3080c269-1f7e-dcee-efdd-d240063b6f2b@denx.de>
Date: Wed, 28 Apr 2021 16:18:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZApt3y_mqjL-zNcTWEz=QXxBKM9vXM2YTvQa5Dt552TZQ@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
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
Cc: Claudius Heine <ch@denx.de>, Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/21 11:49 AM, Jagan Teki wrote:
[...]

>>>> I just saw the note in the header of the driver that says that single
>>>> link mode is unsupported for the DSI84.
>>>>
>>>> I have hardware with a single link display and if I set
>>>> ctx->lvds_dual_link = false it works just fine.
>>>>
>>>> How is this supposed to be selected? Does it need an extra devicetree
>>>> property? And would you mind adding single-link support in the next
>>>> version or do you prefer adding it in a follow-up patch?
>>>
>>> If this has to be supported I think the proper way would be to support
>>> two output ports in the dts (e.g. lvds0_out, lvds1_out), in the same
>>> way as supported by the 'advantech,idk-2121wr' panel.
>>
>> Yes, this is why I asked to have the dual-link lvds in the bindings.
> 
> Agreed with Neil, this is what we discussed on my v3. Each of these 3
> chips has its own compatible and supporting dual-link lvds and
> dual-link dsi as to be done by 84/85 and 85 respectively.

I have a counter-proposal to this single/dual link LVDS panel handling, 
maybe this should really be done using DRM_BUS_FLAG added to the panel, 
to indicate whether it is single or dual link. Then the bridge can 
figure that out, without any extra DT props.

> Maybe I can push my configuration changes in gist if required?

Please summarize the v3 discussion, yes.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
