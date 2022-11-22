Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F2633754
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 09:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A114910E39E;
	Tue, 22 Nov 2022 08:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F3F10E39E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 08:42:26 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00F68A16;
 Tue, 22 Nov 2022 09:42:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669106544;
 bh=nDX429cvmSfpNqL7ldm3Nf0LSI65LZrA71ihpOhaQUM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MfhFVla0VBq06phjBEMN7R4Xvyh+DmA10/WZOEd3BBUmDpYq1CPQ/D25BZ1+qUWAO
 zXvrYdPYrmojO0rSjiyhGL4EFd3eRpqVaqZjuNU6rGrWKHBtJ86YQliqDN8WH6kKVu
 UjlCfNTuFKBOiieC7nrygKddbxLoKPI0K+OYsX8Q=
Message-ID: <cd2b6725-ab9f-45f6-b660-b43d6da0c562@ideasonboard.com>
Date: Tue, 22 Nov 2022 10:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 6/8] drm: rcar-du: Add r8a779g0 support
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-7-tomi.valkeinen@ideasonboard.com>
 <166869771876.50677.1905794243575000038@Monstersaurus>
 <Y3w8cBh0uVaSPonO@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y3w8cBh0uVaSPonO@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/11/2022 05:05, Laurent Pinchart wrote:
> On Thu, Nov 17, 2022 at 03:08:38PM +0000, Kieran Bingham wrote:
>> Quoting Tomi Valkeinen (2022-11-17 12:25:45)
>>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>
>>> Add support for DU on r8a779g0, which is identical to DU on r8a779a0.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>> ---
>>>   drivers/gpu/drm/rcar-du/rcar_du_drv.c | 22 ++++++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>>> index d003e8d9e7a2..b1761d4ec4e5 100644
>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>>> @@ -524,6 +524,27 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
>>>          .dsi_clk_mask =  BIT(1) | BIT(0),
>>>   };
>>>   
>>> +static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
>>> +       .gen = 3,
>>
>> Given that this is the V4H ... I wonder if this should be bumped
>> already. I guess that has knock on effects through the driver though...
> 
> rcar_du_group_setup_didsr() would need to be fixed to test gen >= 3
> instead of gen == 3. That seems to be the only problematic location. It
> could thus fairly easily be done in v2, but we can also delay it.

Ok, I can fix that here.

  Tomi

