Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117C8B2A89
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 23:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ED410E638;
	Thu, 25 Apr 2024 21:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="kEEX3I+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5703310E638
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 21:14:02 +0000 (UTC)
Message-ID: <b5ffd984-4031-4a8a-adbc-75a1e1dfe765@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714079639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J76MnMVIJlI0gv+q1JeGEsHaLLINN3L3MN1gfgnkVec=;
 b=kEEX3I+MfQAQorpZQKFqFgOoyVx5v5JiEspZso99d7xz1SnkdI7qoymNr1/OVt5hZKi6bI
 w+sRc96P7rI1XkTvAy/AGrQGtyl/mZb4CN64O6JnK+wX34E12JhxF0lbfkt3iXMFErca2/
 qyTbpUP7TjNEdfwA5l1aXqEkapKlPAU=
Date: Fri, 26 Apr 2024 05:13:43 +0800
MIME-Version: 1.0
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
 <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ce6a480d-80b3-46b0-a32d-26bc6480d02f@linux.dev>
 <ZiqrLfezhns4UycR@smile.fi.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ZiqrLfezhns4UycR@smile.fi.intel.com>
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


On 2024/4/26 03:12, Andy Shevchenko wrote:
> On Fri, Apr 26, 2024 at 02:53:22AM +0800, Sui Jingfeng wrote:
>> On 2024/4/26 02:08, Sui Jingfeng wrote:
> Are you speaking to yourself? I'm totally lost.
>
> Please, if you want to give a constructive feedback, try to understand
> the topic from different aspects and then clearly express it.
>

OK,

The previous email analysis the non-DT cases exhaustively, this email intend to
demonstrate the more frequently use case.

That is, in the *DT('OF')* based systems,
device_get_match_data() is completely equivalent to 
of_device_get_match_data().
So the net results of applying this patch are "no gains and no lost".

Things will become clear if we divide the whole problem into two cases(DT and non-DT)
to discuss, that's it. That's all I can tell.

Sorry about my broken written and sorry for the noise. Thanks for your education in
the past.

-- 
Best regards,
Sui

