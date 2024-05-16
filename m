Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69C8C7048
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 04:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E7910E17F;
	Thu, 16 May 2024 02:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="W6AFsVHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9F010E4B8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 02:29:36 +0000 (UTC)
Message-ID: <f90a46dc-8842-47a2-a269-826367f991fb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715826574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POjo41Qty2BYUDgH9m3H+3cml12oIPmG9DVVmyYHKx8=;
 b=W6AFsVHdGQnW0sZExoT5TvfA/u6N2+D9Hv5YDhe5+QkE3S/K1Ccn3GZOlNW5uQkXqSlLIu
 q/Vw4SGlKr+0G0E8IaCsMQDj9w9/wVkI1/jlza8rB2HAsAGDI+8owaDIceKTvGYBUtPlow
 PGfiHkX9qfYZUe83PEw9XBDQcsQI4nc=
Date: Thu, 16 May 2024 10:29:26 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/loongson: Add helpers for creating subdevice
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
References: <20240513001243.1739336-2-sui.jingfeng@linux.dev>
 <fe55ddf4-b86f-4d9f-aac4-373c5f2a46ac@web.de>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <fe55ddf4-b86f-4d9f-aac4-373c5f2a46ac@web.de>
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

On 5/16/24 04:30, Markus Elfring wrote:
>> In some display subsystems, the functionality of a PCI(e) device may too
> …
>> of the functionality into child devices can helps to achieve better
>> modularity, eaiser for understand and maintain.
>>
>> Add the loongson_create_platform_device() function to pove the way …
> 
> Please avoid typos in such a change description.


I was too hurry, sorry, my bad.
Will be fixed at the next version.


> Regards,
> Markus

-- 
Best regards
Sui
