Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE18B7E41
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 19:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B02B112D53;
	Tue, 30 Apr 2024 17:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="w21hh/p+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07F9112D53
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 17:13:54 +0000 (UTC)
Message-ID: <a88a4b3a-a1c2-40a3-a393-cf91155d7f20@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714497233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gUhs30l2OBlQwExDZS/5EdgveO3O4boTdpbSw9Od6Is=;
 b=w21hh/p+scEshFkQfWJzAgyyv0UQWr9OLYMqd8dRqVfbcrK90o9Jt3FVcaA6OJn6enwp+v
 ZFICrxrniubIjQR2eKjezqE9NseCDQTvyxXe/yxtsyEfSYBRjeXXP0ocqdLYlBUpd66qEH
 1WDjMBmV+TcMirhc9YIRCSYe3UWgNho=
Date: Wed, 1 May 2024 01:13:46 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm: drm_of.c: Using EXPORT_SYMBOL_GPL instead of
 EXPORT_SYMBOL
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240429173521.709719-1-sui.jingfeng@linux.dev>
 <20240430-monumental-amazing-auk-c2c1a5@houat>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240430-monumental-amazing-auk-c2c1a5@houat>
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


On 2024/4/30 17:26, Maxime Ripard wrote:
> Hi,
>
> On Tue, Apr 30, 2024 at 01:35:21AM +0800, Sui Jingfeng wrote:
>> Linux kernel puts strict limits on which functions and data structures
>> are available to loadable kernel modules; only those that have been
>> explicitly exported with EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL() are
>> accessible. In the case of EXPORT_SYMBOL_GPL(), only modules that declare
>> a GPL-compatible license will be able to see the symbol.
>>
>> Since the whole drm_of.c file is declared with GPL-2.0-only license, so
>> let us keep functions in that source file consistently.
> You're conflating two things: the license of the code itself (GPL2
> here), and the license of the users of the symbols exported in that
> file (anything).
>
> There's no relationship between the two, and you have to make an
> argument for changing the latter other than just because the license is
> GPL because, again, those are two different things.

Yeah, I think you might be correct.

It seems that it is valid to have EXPORT_SYMBOL() in GPL-2.0-only licensed file.


> Maxime

-- 
Best regards,
Sui

