Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81607B52C34
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2497E10E0A3;
	Thu, 11 Sep 2025 08:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YCjnomzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD9F10E0A3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 08:51:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8C4F91A0DB4;
 Thu, 11 Sep 2025 08:51:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 54A16606BB;
 Thu, 11 Sep 2025 08:51:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3F47102F23C4; 
 Thu, 11 Sep 2025 10:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757580688; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HkTdsZbLO97tK8E1nYuzjnMh7ih75HUJcnF1foWniqU=;
 b=YCjnomzEqyHWq2NwMhl7WJxduiIP2EXo9CVThuad5rrNX5p69ncUDQUsF+D2fpN4Pi2iyL
 ZSXK3Z9DaNN4kNEDuhiAjylWpxWkG1KgF4GL8WMftZsQ8jR7pybXCwe3prTZwFlExnla90
 6mItP+Zukyc4qgVnW3kZ9Y+fGZJFtEm1JxnELk+uiPhK4Lu3g7FLBYNGsCTgUP+8mJ4ps+
 acioccsXtJcYSb4FWkxyExAoj3dCMtGDM5q3MnfLMPgjo2hDhIixKbS1ok8D4xl6af9VZM
 hjNz+2YecHMUB7OOl4aOtF8XP8QSHYSfploiJjQ9LayF7LUIfV1kIquFETku4g==
Message-ID: <6164422a-6265-4726-8da5-68bb8eafb9e6@bootlin.com>
Date: Thu, 11 Sep 2025 10:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com,
 kory.maincent@bootlin.com, romain.gantois@bootlin.com, praneeth@ti.com,
 Aradhya Bhatia <a-bhatia1@ti.com>
References: <20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com>
 <do5zciwcanpiciy52zj3nn6igmwlgmbcfdwbibv2ijxm2fif5s@ib6jhzi5h2jo>
Content-Language: en-US
From: Miguel Gazquez <miguel.gazquez@bootlin.com>
In-Reply-To: <do5zciwcanpiciy52zj3nn6igmwlgmbcfdwbibv2ijxm2fif5s@ib6jhzi5h2jo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 10/09/2025 à 04:28, Dmitry Baryshkov a écrit :
> On Tue, Sep 09, 2025 at 06:16:43PM +0200, Miguel Gazquez wrote:
>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>
>> Add support for DRM connector and make the driver support the older
>> format of attaching connectors onto the encoder->bridge->connector
>> chain.
>> This makes the driver compatible with display controller that only
>> supports the old format.
>>
>> [Miguel Gazquez: Rebased + made driver work with or without
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR]
> 
> What is the use case for not using DRM_BRIDGE_ATTACH_NO_CONNECTOR?

Some display controller drivers (like the tilcdc) call drm_bridge_attach 
without DRM_BRIDGE_ATTACH_NO_CONNECTOR, so the bridge must support both 
with and without DRM_BRIDGE_ATTACH_NO_CONNECTOR to be compatible with 
all display controllers.

> 
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
>> ---
>>   drivers/gpu/drm/bridge/ite-it66121.c | 121 ++++++++++++++++++++++++++++++++---
>>   1 file changed, 112 insertions(+), 9 deletions(-)
> 

-- 
Miguel Gazquez, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

