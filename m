Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9213193B7DA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 22:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C719F10E055;
	Wed, 24 Jul 2024 20:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="igwkOP0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FB610E055
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 20:13:54 +0000 (UTC)
Message-ID: <3013c48e-1757-4e43-a0c0-d2b3af9f3100@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721852032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QgmohGYP6ZaHb17OqQ/1ToU1Ygt9h2KB+Wu/4W1ssrY=;
 b=igwkOP0w7qQD6Ai1mGCUD+HziQo0zI+i+pQiA5JG+SgP70wlG4TlKJcgy4OpIN1kMkFIQk
 oT2gVq/C30npsHgIyBjf8MWDuS4sih7OIONEIahq958wsIgBcMMtDhigJc228GNlIV1qn8
 urx91weVuN5E76W7ZlzMjP4DtQBUvRo=
Date: Thu, 25 Jul 2024 04:13:44 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4] drm/loongson: Introduce component framework support
To: Markus Elfring <Markus.Elfring@web.de>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240723183436.216670-1-sui.jingfeng@linux.dev>
 <20240723183436.216670-2-sui.jingfeng@linux.dev>
 <b3f75c6c-6c3e-41ee-92b9-ac5d9cca53f8@web.de>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <b3f75c6c-6c3e-41ee-92b9-ac5d9cca53f8@web.de>
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


On 7/24/24 15:30, Markus Elfring wrote:
>> In some display subsystems, the functionality of a PCIe device may too
> 
>                                                                   might be?
> 
> 
> …
>> of the dirver is loaded, …
> 
>           driver?
> 
> 
> …
>> its dependencies ready before it can register the service to userspace.
> 
>                                                                 user space?
> 
> 
> …
>> submodule by creating platform devices manually during driverload time.
> 
>                                                           driver load?
> 
> 
> …
>> device as a DRM proxy, which will attach the common drm routines to our
> 
>                                                        DRM?
> 
> 
> …
>> While at it, also do some cleanups.
> 
> I find such information suspicious.
> Is there any need to offer adjustments as separate update steps?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10#n81

Thanks a lot for review, I will try to fix those problems in the future.

> Regards,
> Markus
