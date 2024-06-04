Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD28FBA52
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A4810E58C;
	Tue,  4 Jun 2024 17:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Qcincx+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB0B10E30F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 17:27:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2F1F9884B2;
 Tue,  4 Jun 2024 19:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717522023;
 bh=vBEFxqspEIdj+gnB5gQ6oV9Wkiml+H3wODzsL+9N2Lc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qcincx+LYLP3M/XFHHeYWVOOZKBlCjZpEoYuEJ77AYEywI01H2WrxNdydbMrnKEcv
 HuPokjQf4FRvOX6UFOOqT566Nj51FIlwsF37zRJ4OpIzqP4VXR8YrCoQH9zilshia6
 5yYY89GcP72kMACa5OWNi02jIfTNFPdLmfqWq/CxzXXs+M9YUfmPRYpPyW58s6Drsc
 w2zwkBJG0tvo+cm1hJmiMIWf4ioLAYUYhtWq0QY3R+M9NNDZ0E7f15+I+W600vJM9+
 ItzRZ9vNEuK21Yz3SeHyGASJIMr/wzG3+x456yCnBBwVC9GKGkM6khRPZuFsSTpJZs
 WFA6oo3i87NGA==
Message-ID: <decf2f18-1244-4937-a7b9-194ab70acefb@denx.de>
Date: Tue, 4 Jun 2024 18:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/bridge: tc358767: Drop line_pixel_subtract
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
References: <20240531204130.277800-1-marex@denx.de>
 <6053649.lOV4Wx5bFT@steina-w> <e713607f-4927-435f-bac0-be3344e45ef4@denx.de>
 <7673814.EvYhyI6sBW@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <7673814.EvYhyI6sBW@steina-w>
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

On 6/4/24 1:12 PM, Alexander Stein wrote:
> Hi Marek,

Hi,

> Am Montag, 3. Juni 2024, 23:25:43 CEST schrieb Marek Vasut:
>> On 6/3/24 2:18 PM, Alexander Stein wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> Am Freitag, 31. Mai 2024, 22:39:49 CEST schrieb Marek Vasut:
>>>> This line_pixel_subtract is no longer needed now that the bridge can
>>>> request and obtain specific pixel clock on input to the bridge, with
>>>> clock frequency that matches the Pixel PLL frequency.
>>>>
>>>> The line_pixel_subtract is now always 0, so drop it entirely.
>>>>
>>>> The line_pixel_subtract was not reliable as it never worked when the
>>>> Pixel PLL and input clock were off just so that the required amount
>>>> of pixels to subtract would not be whole integer.
>>>
>>> I think this is based on [1], no?
>>
>> It is.
> 
> Thanks for confirmation.
> 
>>> I was wondering because it was not stated.
>>
>> I thought [1] was already applied, but it seems it was only RBd.
>>
>> I can either apply [1] and then add this on top, so the two commits can
>> be reverted separately if this one breaks something, or squash [1] into
>> this patch and send V2. Which one do you prefer ?
>>
>> The [1] fixes a real nasty issue with DPI output which causes visible
>> image corruption, so I would like to have [1] in, but it is obviously
>> not perfect.
> 
> I can't use DPI anyway, but if [1] actually fixes something for DPI
> I'm okay with having [1] in, which gets mostly reverted in this series.
> But that's up to the maintainers.

It is the FRMSYNC enablement (as suggested by the TC9595 datasheet) 
which fixes the issue. This just makes FRMSYNC work well with other modes.
