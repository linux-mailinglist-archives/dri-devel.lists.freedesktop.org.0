Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDCA941EF1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 19:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C7610E477;
	Tue, 30 Jul 2024 17:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="RMXU3LSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A649910E477
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 17:39:45 +0000 (UTC)
Message-ID: <11ba9284-db77-405d-80ad-7fbe5cb5c338@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1722361183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgfltJTn3UKSXJ9jbEJ+7l1SNMwFGrtqOjoLkm7DHjQ=;
 b=RMXU3LSlXhCVuLBpMs/lJsAWVQo3FQ89M1U7GCiKezlbra9znEG4ZagBzgCjiICgAtoRgi
 ZDdlNUZJvKZiFkC0V0OkLgKJTPlNv8Kughh2pxFq2jZwnCu6nO1mlwKtEGqutDUrDcNqAt
 nofWBIZlahP4VdNEoc6X2wtFuh5doII=
Date: Wed, 31 Jul 2024 01:39:34 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/2] drm/loongson: Introduce component framework support
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240728152858.346211-1-sui.jingfeng@linux.dev>
 <20240728152858.346211-2-sui.jingfeng@linux.dev>
 <ce9b1d27-75a6-4505-b17c-773b51c173d0@web.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ce9b1d27-75a6-4505-b17c-773b51c173d0@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/7/29 15:37, Markus Elfring wrote:
> …
>> +++ b/drivers/gpu/drm/loongson/loongson_drv.c
>> @@ -0,0 +1,298 @@
> …
>> +static int loongson_drm_driver_probe(struct platform_device *pdev)
>> +{
> …
>> +	dev_info(&pdev->dev, "probed\n");
> …
>> +}
> …
>
> Do you find such information really relevant?


This helps to see the probe order of all drivers,

this also help us to know the name of the fake master device.


> Regards,
> Markus

-- 
Best regards,
Sui

