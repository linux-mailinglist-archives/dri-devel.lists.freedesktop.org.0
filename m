Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE73A02AF2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 16:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D32410E6B3;
	Mon,  6 Jan 2025 15:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="J5Bc69JM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FAF10E6B3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 15:39:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9378A104839FD; Mon,  6 Jan 2025 16:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1736177942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tl7b9/uRfU9PjT0DsfX4Aw1ecJNaqnOdlVBiZttQ580=;
 b=J5Bc69JMzDz1JGBjuEG8POURFwwohBsDV7iwgOJ1wM64dUyGP6zajsQ6sN7IaumEBx7r0F
 nEJl0cgtzI1qwksNgBWfJvNPAvXxpK194rKZVz/hdnC4WxFnFvuPFAE+z3xhFug+QpQM/Z
 Q/PLZVVd5CP42opCzvcJIfGc+9+QMnLMehgMxhuAa9PS7XHP3EOYv9/rwbFwJPPqV9fgc8
 1HZuAoufbXSdN5mmeS2727iCE0O8p+K6TaeNgWvGOM7GKRVJQY2/cEbe3cDQGVoc0TYW/I
 +Gcf7cb6MwcgzFx3dXF92m2G9EQYJl65yJ28iIxwPBV11o2+4bwRePnTdHNWmg==
Message-ID: <add68d4c-51d8-4c1a-9560-7c95213dd524@denx.de>
Date: Mon, 6 Jan 2025 16:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250105190659.99941-1-marex@denx.de>
 <20250105232219.GC21164@pendragon.ideasonboard.com>
 <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
 <20250106070514.GA5568@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250106070514.GA5568@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 1/6/25 8:05 AM, Laurent Pinchart wrote:
> On Mon, Jan 06, 2025 at 03:48:52AM +0100, Marek Vasut wrote:
>> On 1/6/25 12:22 AM, Laurent Pinchart wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> Thank you for the patch.
>>>
>>> On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
>>>> Add a flag meant purely to work around broken i.MX8MP DTs which enable
>>>> HDMI but do not contain the HDMI connector node. This flag allows such
>>>> DTs to work by creating the connector in the HDMI bridge driver. Do not
>>>> use this flag, do not proliferate this flag, please fix your DTs and add
>>>> the connector node this way:
>>>>
>>>> ```
>>>> / {
>>>>       hdmi-connector {
>>>>           compatible = "hdmi-connector";
>>>>           label = "FIXME-Board-Specific-Connector-Label"; // Modify this
>>>>           type = "a";
>>>>
>>>>           port {
>>>>               hdmi_connector_in: endpoint {
>>>>                   remote-endpoint = <&hdmi_tx_out>;
>>>>               };
>>>>           };
>>>>       };
>>>> };
>>>>
>>>> &hdmi_tx {
>>>>       ...
>>>>
>>>>       ports {
>>>>           port@1 {
>>>>               hdmi_tx_out: endpoint {
>>>>                   remote-endpoint = <&hdmi_connector_in>;
>>>>               };
>>>>           };
>>>>       };
>>>> };
>>>> ```
>>>
>>> Are there any in-tree DT sources that use the old bindings ?
>>
>> See
>> https://lore.kernel.org/dri-devel/AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com/
> 
> Maybe I'm missing something obvious, but where is the patch series that
> moves the DT sources mentioned in that mail thread to the new bindings ?
Since this optional flag is added, that DT update series can be done 
separately.
