Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA4A500D6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1FF10E2A8;
	Wed,  5 Mar 2025 13:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="LDmPYd2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B28910E2A8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:43:44 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741182217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vo2hm+yMszxw3H9IReAl6SWR01jDv9fDEr6AUb0zh0U=;
 b=LDmPYd2osyiwOtg15j1DhkvRsDox4S/7CWQcaQHJwA3oEc6JJUovfPV/14oJeBHS+QyeZX
 f38N7q/ngNHs7ROVDw/Y01T9VIX69i2GXD0+VJ+U9AUTCXQjc2NVr6CzioyKDytl2cWST6
 eCbK/4AOWjNPMl4osjXe1Y3cO/67NGudq5CTPMkggcoVgFAv/r4iNAdtuYUFGq8NZ6tdzn
 W4dqHDr6TdOJPzAUAkvEFxKLz5VW9Kw4v864lc1ZWVDx31e/73SnimmCSxfs/yaxHPbJ+i
 Gl5R/rx//ZM8CD5USk4LLF8+8GQhZTESdJRqKfit6nGzoU+dGqNKsgfLqRl00w==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: j@jannau.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20250305020546.96564-1-jiapeng.chong@linux.alibaba.com>
References: <20250305020546.96564-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH -next] drm: adp: Remove unnecessary print function
 dev_err()
Message-Id: <174118221552.156796.17819891844477649355.b4-ty@rosenzweig.io>
Date: Wed, 05 Mar 2025 08:43:35 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Wed, 05 Mar 2025 10:05:46 +0800, Jiapeng Chong wrote:
> The print function dev_err() is redundant because platform_get_irq_byname()
> already prints an error.
> 
> ./drivers/gpu/drm/adp/adp_drv.c:470:2-9: line 470 is redundant because platform_get_irq() already prints an error.
> ./drivers/gpu/drm/adp/adp_drv.c:476:2-9: line 476 is redundant because platform_get_irq() already prints an error.
> 
> 
> [...]

Applied, thanks!

[1/1] drm: adp: Remove unnecessary print function dev_err()
      commit: e4c0fd3f965533cd2b38200ca73625afd602d39b

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

