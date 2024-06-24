Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB1A914F24
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 15:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FE310E443;
	Mon, 24 Jun 2024 13:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="uSLcQbhg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089C110E443
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 13:51:48 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1C793883D2;
 Mon, 24 Jun 2024 15:51:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719237106;
 bh=xctichpT3BbEddPHLgGHJ69PMDpBRQXJxSXAMvOK+Kk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uSLcQbhglGxmgcGy1wE3qfQXoVnXRnu7tTTSIrsNom+h/X4ni4tMrTR8eMJUPt+fK
 owSFBeyO1WaanHDfN4LCJSVO4Gsrrk09o1IdwTQvd0Ol+YkE5IljlYiWhneJeeDgY0
 cm6gTyfsl64x18OSh+EFUAFTf4d+v2TmR1nals9itRAQBnD/nMXk5Mkyloxm6YVR/1
 ekAp8mrfIguQ5z2HXKmAR521JlJqw898PD8plPIJenAS8pR5lGTz+XBaBcplHH3aHK
 q12hVfEumxCKiV/kufybdtjC1We+uIuhICx6JFmqZ0Me9ByW5Zda/s7D3VvPUd9RoW
 uF18VZg3IvdnQ==
Message-ID: <67555abc-e85e-4561-b9c7-bdfec889e9ec@denx.de>
Date: Mon, 24 Jun 2024 14:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/bridge: tc358767: Disable
 MIPI_DSI_CLOCK_NON_CONTINUOUS
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240623143846.12603-1-marex@denx.de>
 <20240623143846.12603-4-marex@denx.de> <5794906.DvuYhMxLoT@steina-w>
 <9299383.CDJkKcVGEf@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <9299383.CDJkKcVGEf@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/24 11:06 AM, Alexander Stein wrote:
> Am Montag, 24. Juni 2024, 09:45:13 CEST schrieb Alexander Stein:
>> Hi,
>>
>> Am Sonntag, 23. Juni 2024, 16:38:36 CEST schrieb Marek Vasut:
>>> The MIPI_DSI_CLOCK_NON_CONTINUOUS causes visible artifacts in high
>>> resolution modes, disable it. Namely, in DSI->DP mode 1920x1200 24
>>> bpp 59.95 Hz, with DSI bus at maximum 1 Gbps per lane setting, the
>>> image contains jittering empty lines.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>
>> I can't see these artifacts in 1920x1200 24bpp, but still looks good to me
>> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> I have to retract that. After checking for those mentioned artifacts
> I noticed that the DP output was running without any issues.
> There is something more going on here. Reverting this patch there wasn't
> a single output problem.
> This changes actually breaks my DSI connection randomly.
> Sometimes it works, sometimes not. I also noticed that there wasn't even
> a single DP link training failure, so I assume the DSI clock somehow
> affected the internal state machine which even affected DP link training.
> Until we know what's going on, NAK form me.

I can temporarily drop this patch and keep the remaining five if that's 
OK with you ?
