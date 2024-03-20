Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086D88183D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7AB10FC9F;
	Wed, 20 Mar 2024 20:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="NNHL7Wcz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC5010FC87
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:05:04 +0000 (UTC)
Message-ID: <8e211b09-4413-484e-9ed0-c7979752dc13@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710965102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WGZfZ07ZdrWY+Iyb6sD3ShcgbjXBKo7wQ5DVDDaz/zQ=;
 b=NNHL7Wcz83bfy+LxO4YtVffNcS+SMLtp85eu5ClzHktPXyJSqxAYUJbiSR0YzdHJ1p8no8
 2QWxMlYLbzyY+2z2jNDG9L3nCkw5o0akhlF4uIfBpL8SL+rwxQZcgi4lBtIfaOVMwqPmlg
 TmaqglMlouPcVeTu3pcRf+Pzf3Ykm6Q=
Date: Thu, 21 Mar 2024 04:04:56 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Print error message when DT
 parsing fails
Content-Language: en-US
To: neil.armstrong@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
 <78739dfe-c6ee-44bd-a2e6-2ced24ff15c1@linux.dev>
 <20240318180420.GP13682@pendragon.ideasonboard.com>
 <9d894bd2-c92e-4d08-8643-be88a203879c@linux.dev>
 <31b609ff-5d54-4950-bd8a-db2b61b228b8@linaro.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <31b609ff-5d54-4950-bd8a-db2b61b228b8@linaro.org>
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


On 2024/3/19 23:49, Neil Armstrong wrote:
> On 18/03/2024 20:23, Sui Jingfeng wrote:
>> Hi,
>>
>>
>> On 2024/3/19 02:04, Laurent Pinchart wrote:
>>> Improving core helpers is certainly a good idea, and if we do so, we 
>>> can
>>> simplify drivers. What I'm concerned is that commit 00084f0c01bf 
>>> creates
>>> a silent probe failure path,
>>
>>
>> No, I can't agree here. It doesn't creates a silent probe failure path.
>
> It doesn't _in debug mode_, I agree with Laurent, having a verbose 
> probe error should be kept.
>
OK, I agree with you two then.

I means that we could replace the pr_debug() with the pr_err() in the
of_graph_get_remote_node() function, then all drivers will be benefit.
Is this idea too hard to be acceptable?


> Neil 

