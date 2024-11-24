Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AC19D76AC
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 18:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F152E10E5AC;
	Sun, 24 Nov 2024 17:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="phE1bnRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D59710E5AB
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 17:28:39 +0000 (UTC)
Message-ID: <91dcbf49-fcef-44e9-aa78-415fd70cba9d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1732469317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMREzF/1nhtk4WfzOZ1mGniS/0dmFZlSzW3aXWHoBpI=;
 b=phE1bnRulaAKiria+VyImMr1gIR7wOSPIJlNXqT2zOSwZojGAOhTdXZZM5jFgPpE++Dwwl
 S6ESS442uh9mlyppRXM0AjhI/YkwhyAibW4HY4Pcvot5Pvt/QiUZ135jDNwB1YsBAVgM1N
 9aEUmRndK19xV562KCHKql0ik9vsYws=
Date: Sun, 24 Nov 2024 22:58:10 +0530
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] drm/tidss: Clear the interrupt status for interrupts
 being disabled
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Cormier <jcormier@criticallink.com>, stable@vger.kernel.org
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
 <20241021-tidss-irq-fix-v1-5-82ddaec94e4a@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20241021-tidss-irq-fix-v1-5-82ddaec94e4a@ideasonboard.com>
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
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> The driver does not touch the irqstatus register when it is disabling
> interrupts.  This might cause an interrupt to trigger for an interrupt
> that was just disabled.
> 
> To fix the issue, clear the irqstatus registers right after disabling
> the interrupts.
> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> Cc: stable@vger.kernel.org
> Reported-by: Jonathan Cormier <jcormier@criticallink.com>
> Closes: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1394222/am625-issue-about-tidss-rcu_preempt-self-detected-stall-on-cpu/5424479#5424479
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> [Tomi: mostly rewrote the patch]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Regards
Aradhya

[...]
