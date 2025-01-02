Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA2CA00185
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 00:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EEF10E0DC;
	Thu,  2 Jan 2025 23:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Kqbeg/Xq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CA410E0DC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 23:24:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 629A4104811D0; Fri,  3 Jan 2025 00:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1735860227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbVTKj22DdIODp/G/2Y0eA7B9M37L5pcHT1rwZZk/Z8=;
 b=Kqbeg/XqeuBhAlmLvyOM2Sizn2nbZv+MyR/M+3ljCa1k8+hadZA1KHSq1QhDmXt4aA/XEV
 wISkaeVHQP820WAs87CtyBZsX6bNVLr5xZcFi3TQJ1EojlrmXjEoJlPoo92MNK7QJWHzV1
 hlb6abGRd6cNSlTk3tDgNBJnqvklvZYl4+qYmqkPhMusO6Mnq2e6lR2GIUaMwdjoV8S1ul
 6m2/xwTy1pxswXg+5Fw5GhllyWtTUd5cT8GwIfkw0tW43b3G0El3x6egyGbEtMFxDZrjwL
 +AGD2jHyzmBhFaRMTATqc326P525I7PngwACEuFXwGHI4RB38xVWkoxcee6h2A==
Message-ID: <2f2bdcb1-6d83-4939-9dd0-3fb206202273@denx.de>
Date: Fri, 3 Jan 2025 00:20:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-3-marex@denx.de>
 <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
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

On 1/2/25 6:58 PM, Dmitry Baryshkov wrote:

[...]

>> @@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>>   			return ret;
>>   		}
>>   
>> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>> +		ret = drm_bridge_attach(encoder, bridge, NULL,
>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>   		if (ret) {
>>   			of_node_put(ep);
>>   			return dev_err_probe(dev, ret,
>>   					     "Failed to attach bridge for endpoint%u\n",
>>   					     of_ep.id);
>>   		}
>> +
>> +		nextbridge = drm_bridge_get_next_bridge(bridge);
>> +		nextbridge = drm_bridge_get_next_bridge(nextbridge);
>> +		/* Test if connector node in DT, if not, it was created already */
> 
> By whom? And why?

By the HDMI bridge driver, see 1/4.

> There is no display-connector bridge, but there is a
> normal bridge chain, you have passed DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
> now it's a proper time to create drm_bridge_connector. You have added
> the next_bridge_optional flag, but it should just prevent the dw driver
> from returning the error if there is no next_bridge.
So what exactly should I do here ?

If dw_hdmi_parse_dt() only exits with 0 if there is no connector node in 
DT, I don't get any output on the HDMI. I have to create a connector in 
the HDMI bridge driver instead and not here, right ?
