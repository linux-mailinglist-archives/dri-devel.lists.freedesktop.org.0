Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC98C3B8C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 08:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D65F10E226;
	Mon, 13 May 2024 06:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="B+7jWjRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7811A10E226
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 06:43:17 +0000 (UTC)
Message-ID: <faf43075-a738-41b6-975c-f8c007929050@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715582592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9wX8NMO96pXgObmwZJgkX492lcaLyuWMCeWzF3eqfpI=;
 b=B+7jWjRB1V3KA/PHj0c1iZZGcssVmdjbTmTzUuAyDwRW4hCQxRQTAxyy1sEKKQypjg4iL0
 ear4ggZR7foRmFNSok6/FxvgKKgkGnrYMNSo6h3jBzymrExxEVt7qbiBqvofMqnZ7Dltok
 nqvqIOT+HkAEOGtGOgv1dVdShOy4Bbg=
Date: Mon, 13 May 2024 14:43:01 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: imx: Remove redundant checks on existence of
 bridge->encoder
To: Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240511150816.326846-1-sui.jingfeng@linux.dev>
 <c1a69a18-4db2-4625-80c2-a7536347e15f@nxp.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <c1a69a18-4db2-4625-80c2-a7536347e15f@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 5/13/24 13:56, Liu Ying wrote:
> On 5/11/24 23:08, Sui Jingfeng wrote:
>> The check on the existence of bridge->encoder on the implementation layer
>> of drm bridge driver is not necessary, as it has already been done in the
>> drm_bridge_attach() function. It is guaranteed that the .encoder member
>> of the drm_bridge instance is not NULL when various imx_xxx_bridge_attach()
>> function gets called.
> 
> Nit:
> ldb_bridge_attach_helper() doesn't follow the fashion of
> imx_xxx_bridge_attach(), not even the other bridge attach
> functions touched by this patch do. 


Right, my bad.

But personally, I think rename it as ldb_bridge_attach() should
enough to express the meaning. :-)


  Maybe, reword as
> "when various i.MX specific bridge attach functions are
> called."
> 

OK, fine.

I will correct the commit message at the next version,
so happy being reviewed. Thanks.


> Regards,
> Liu Ying
>
