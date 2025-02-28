Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF9A4A17D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E42410E2B1;
	Fri, 28 Feb 2025 18:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="RKRgORqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE9B10E2B1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 18:27:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C285C102901D4; Fri, 28 Feb 2025 19:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740767241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EyEPM5mrGTn5rrR73FFHMdEx08PtiRTDMuqHCB2nPVc=;
 b=RKRgORqcnqV3NSzwt7DVV5LwK/q/7kkOp1UUtaXPcHOdglNIfxmpVp6+KDJ9EXQXEJ90rK
 2/OKj5kWm9R/F9XHGSmr+3wQtufmCv+k3CUVsYS4wAStAfurjNvneFGI21v/YwF4cbWeKM
 sGRecKE06EFQFROt+lYKNJHUcX3T46u+cakOr8Ucnx6FS9pR4JmSENfjYMZT64aeW4P+r4
 iDNBSiG5iD0B9Ryvc0HxqaG8/VsmzHlP83i8dM8sbL+dFCWLhQSxHs7G0PfBV0Wj6bYb+x
 jo43dHzCVZR5WzZODLERiZTF5s7FIt3uIo+LdSmF8Dev8qMCLy/sDboa4dmkjg==
Message-ID: <aa571158-a7ab-4bee-a7a7-e7a729301d7d@denx.de>
Date: Fri, 28 Feb 2025 18:21:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de> <4658624.cEBGB3zze1@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4658624.cEBGB3zze1@steina-w>
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

On 2/28/25 11:21 AM, Alexander Stein wrote:

Hi,

>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index 0f07ef7d9aea7..2371ab8e50627 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -67,6 +67,7 @@ struct panthor_model {
>>   }
>>   
>>   static const struct panthor_model gpu_models[] = {
>> +	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */
> 
> Are you sure about 0, 0?

I am not.

> With this I get
>> [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 status 0x1
> 
> Using GPU_MODEL(g310, 10, 4) I get:
>> [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 status 0x1
> 
> Note the output is GPU_VER_MAJOR() but this table is for GPU_ARCH_MAJOR()
> (and the corresponding minor).
The major 0x0 minor 0x0 is where I took the 0,0 from. Lemme update this.
