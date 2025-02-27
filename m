Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA36A48A02
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 21:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB01810EB8C;
	Thu, 27 Feb 2025 20:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="YF9CFEjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D536910EB89
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:40:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13D7910382F1A; Thu, 27 Feb 2025 21:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740688827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4C6upIGFa4XgnfpHiJyhy0wCYQaINcoL0tKBcZ5m38U=;
 b=YF9CFEjfZ0GpxPpqRJ6j5xaHMHPMjF1sd+yJPbXRk7QwKCt+htPCR9INIggWUbetdqYnxI
 jp9IfS3azj0kSTKEpSFBq39BOKenqAD/VeYiNpXA3lUVAfYNBRI+B1tJh6vlTyaf05fYIP
 1ethbF4yEYSJiOKCxtqxowbWBGzWmw8WAGF43opmSFFDdBonAt6r4wQ1tAJgcS79mi3Ij0
 TBCFHsUDYqUCAUxzmocgWHUo6ykI/0sQUmcVVWRYvU/7tgRzV/usYKXrcr+bn81RN79PuU
 N7KGp7fiQgL9tPyv3sPJwGioCj5O0Ff9LDsh2Hr/JFThXGHr6UbpkPm8jv0bbQ==
Message-ID: <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
Date: Thu, 27 Feb 2025 21:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Sebastian Reichel <sre@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Steven Price <steven.price@arm.com>, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
 <20250227201709.2diz57xv2tntw36q@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227201709.2diz57xv2tntw36q@pengutronix.de>
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

On 2/27/25 9:17 PM, Marco Felsch wrote:

[...]

>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 06fe46e320738..2504a456d45c4 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>>   ATTRIBUTE_GROUPS(panthor);
>>   
>>   static const struct of_device_id dt_match[] = {
>> +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
> 			  ^
> 			 nxp?
> 
> Can we switch to nxp instead?
We can ... is that the current recommendation ?

Why not stick with fsl , is that deprecated now ?
