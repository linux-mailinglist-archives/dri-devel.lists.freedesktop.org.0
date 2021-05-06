Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F525375601
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 16:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060296E56A;
	Thu,  6 May 2021 14:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10ADD6E56A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 14:57:39 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C3BB182CFE;
 Thu,  6 May 2021 16:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1620313057;
 bh=V1HnPe5tSPVjSF5+6Dhfear7QHYZ+oXzn8ksS4spkqI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Zh4NJdId9gcQ2GX2l+LlsWn44i1sH9opCAkVc9/WNpkgopdpsi/bWbvcf3/nRUEfM
 /RwGe27IT9EaD5k3eHYw/tdgzdml3vzHUjusvi4C1LzZgk1cpJtju23DdmiAXzEopV
 WfO3gbaVrbXJSAL8CUnFbYv1i8zB8AW1CEp5nX2fOQCFWWx8l3Iu6WsGKyjLhf+a2Y
 +xzx7B2xgdttQ0Sj0f2GcuN4ata96tpFxe/XuMX6J2tiER6LkSHoQPsrmhgFvKHX6i
 +Ef2CsRlGFRwNUAw2BUMCkMgeh13yey6PgE3lwqXDlMTyKchZaVHdYNGcMRys5RlcH
 jl0sfUqnPsb8g==
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <CAPY8ntD8T8B6y4S70vya=PBP9hJs=w2kcovYEMG8n4mFpd0APA@mail.gmail.com>
 <b806a975-352b-6755-d5b0-232d1d8ccda0@denx.de>
 <YJPpKbvlBQlnF5Iz@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a06b794d-9a36-5695-577e-20ebc6824341@denx.de>
Date: Thu, 6 May 2021 16:57:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJPpKbvlBQlnF5Iz@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/6/21 3:03 PM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> On Thu, May 06, 2021 at 02:48:11PM +0200, Marek Vasut wrote:
>> On 5/6/21 11:45 AM, Dave Stevenson wrote:
>>> Hi Marek
>>
>> Hi,
>>
>>> I'm taking an interest as there are a number of Raspberry Pi users
>>> trying to get this chip up and running (not there quite yet).
>>> A couple of fairly minor comments
>>
>> Is there any readily available display unit / expansion board with this
>> chip ?
> 
> For what it's worth, I have a board with a Raspberry Pi CM4 and a
> SN65DSI83. It's a customer design, not an off-the-shelf part I'm afraid,
> but I plan to eventually test your driver on it.

Perfect
