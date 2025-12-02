Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EAFC9B5E4
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01AF10E632;
	Tue,  2 Dec 2025 11:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pew/nz/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DF910E632
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 11:52:06 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 442AE16A;
 Tue,  2 Dec 2025 12:49:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764676190;
 bh=vcpCTg0wpMBBIdr8xrC7o97iEYNz6S+U+iHa72fxOsQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pew/nz/9erz0jniUczc0Vo5JzbSbEzuA456Dp6BUQ4YldSqYW75EjlBKtmyrE+seB
 Rv+h8iinBEAyGcBtcmnBhhTA8ie6TTkE1OSIN+GkNywoKvhsB/l4RhHyNX/1yDunZu
 97b6Zjp3h4YGPLRBEb11/oei56Uy2Z7Ija+hsV5Y=
Message-ID: <1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com>
Date: Tue, 2 Dec 2025 13:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead of
 ti,tilcdc,panel driver
To: Kory Maincent <kory.maincent@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miguel Gazquez <miguel.gazquez@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
 <96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
 <3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
 <20251202104244.59a9e83d@kmaincent-XPS-13-7390>
 <d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
 <20251202114416.09624a4b@kmaincent-XPS-13-7390>
 <94e254fa-289d-41ed-909f-1742cfbb2690@kernel.org>
 <20251202121856.0da62885@kmaincent-XPS-13-7390>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251202121856.0da62885@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Kory,

On 02/12/2025 13:18, Kory Maincent wrote:
> On Tue, 2 Dec 2025 11:47:40 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 02/12/2025 11:44, Kory Maincent wrote:
>>> On Tue, 2 Dec 2025 11:28:55 +0100
>>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>   
>>>> On 02/12/2025 10:42, Kory Maincent wrote:  
>>>>>      
>>>>>> Stuffing DTS change in the middle of the driver change tries to hide
>>>>>> impact, which is not nice on its own.    
>>>>>
>>>>> As it needs driver change before the removal for not breaking things it
>>>>> can't be done at the beginning of the series.    
>>>>
>>>> And that is the problem which should stop you there and rethink how to
>>>> organize it without impacting users. DTS cannot go via DRM. If that was
>>>> your intention, that's my:
>>>>
>>>> NAK  
>>>
>>> My intention was to raise discussion over the ugly and legacy tilcdc-panel
>>> binding and what to do with it. But it seems you don't want to, that's a
>>> shame.  
>>
>> I don't see how you get to these conclusions. I comment that putting
>> here DTS in the middle without any explanation of the impact is not
>> correct and this one alone I disagree with.
> 
> Because you didn't replied to the first line of my answer:
> "Yes, I know this but I still wanted to try and begin a discussion on this, as I
> really thought it is not a good idea to add and maintain an new non-standard
> panel driver solely for this tilcdc panel binding."
> 
> But indeed you are right, I should have put more explanation on why there is DTS
> and binding change in the middle of the series. Sorry for that.
>  
>> From that you claim I don't want to fix things...
>>
>> DTS cannot go to drm, which means you either need to separate the change
>> and make entire work bisectable and backwards compatible for some time
>> OR at least document clearly the impact as we always ask.
> 
> The thing is, if I split it, it has to be in 3. One for the of DRM bus flags
> support, a second for the the devicetree and binding change and a third for the
> whole tilcdc and tda998x cleaning stuff. I think I will go for one series, with
> better documentation.
> 
> Now, what is your point of view on my question. Will you nak any binding
> removal even if the binding is ugly and legacy and imply maintaining an
> non-standard tilcdc panel driver? I know it breaks DTB compatibility but there
> is several argument to not keep it. See patch 6.
The binding being ugly and having to maintain non-standard tilcdc panel
driver may be nice things for us, the users don't care. The users care
if their board no longer works.

And how does this sync with u-boot? It also has code for at least for a
few of these boards.

Are there even users for these boards? If not, maybe they can be just
removed? I'm personally not familiar with these boards, so I have no
idea of their age or distribution.

One trick that can be done is to modify the loaded DTB at boot time,
detecting the old format, converting it to the new one, so that when the
drivers are probed they only see the new DTB.

 Tomi

