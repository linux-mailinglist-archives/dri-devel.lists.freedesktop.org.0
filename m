Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E305D9D7690
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 18:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBB010E598;
	Sun, 24 Nov 2024 17:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="e5gRR55a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8317310E598
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 17:20:23 +0000 (UTC)
Message-ID: <7d74caae-6a4c-43e6-ae5e-d2955a9a9fcf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1732468821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eB/DaOTNV+23hCf9768jgIKuISC0rsE5LCF1LNpxYYc=;
 b=e5gRR55aJN4T5yDft72qC0iZ0glYBjzo7FdPXuOpqRm+xfJ8qVzvGbF88tDZX4S0MdXYaX
 BC81uiBuzuGOluq4uJ/1rnue8Ldbsg/9JMwpbbzk1eFSAEez/tZbWP59C6qWf6ysHusFpe
 qUoxhEzLAuAe/5germ6xgp0o2824smg=
Date: Sun, 24 Nov 2024 22:50:07 +0530
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] drm/tidss: Remove extra K2G check
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Cormier <jcormier@criticallink.com>
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
 <20241021-tidss-irq-fix-v1-3-82ddaec94e4a@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20241021-tidss-irq-fix-v1-3-82ddaec94e4a@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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



On 10/21/24 19:37, Tomi Valkeinen wrote:
> We check if the platform is K2G in dispc_k3_clear_irqstatus(), and
> return early if so. This cannot happen, as the _k3_ functions are never
> called on K2G in the first place. So remove the check.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Regards
Aradhya

[...]
