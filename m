Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9AB88668A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 07:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3554A10EA6D;
	Fri, 22 Mar 2024 06:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j9h44js3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235E010EA6D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 06:01:49 +0000 (UTC)
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi
 [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00ED2BEB;
 Fri, 22 Mar 2024 07:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1711087279;
 bh=oiexX4l+9bPLzhTtjB1M8IXJxZY34RYqmLKUedmwsok=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j9h44js3DvAA7bAlcOob5gI7S/mzuV9kBsdvUyDg4ATubJvz6tfWZxvBkTSVhrJg6
 Kucj7ZHTZkvewuY79MvkZ/KqcGf7bkQbsOlZfqga0mhFXwysrgG0iRaa2n4Nne6n+s
 MtY+N1J4iDFDhTEHGCKzMhDPr7GOkH/W2VXI6MsI=
Message-ID: <222c0245-b8bc-48d8-b4e1-a9fb276774ae@ideasonboard.com>
Date: Fri, 22 Mar 2024 08:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: zynqmp_dpsub: Always register bridge
Content-Language: en-US
To: Sean Anderson <sean.anderson@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, Michal Simek
 <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240308204741.3631919-1-sean.anderson@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240308204741.3631919-1-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 08/03/2024 22:47, Sean Anderson wrote:
> We must always register the DRM bridge, since zynqmp_dp_hpd_work_func
> calls drm_bridge_hpd_notify, which in turn expects hpd_mutex to be
> initialized. We do this before zynqmp_dpsub_drm_init since that calls
> drm_bridge_attach. This fixes the following lockdep warning:
> 
> [   19.217084] ------------[ cut here ]------------
> [   19.227530] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> [   19.227768] WARNING: CPU: 0 PID: 140 at kernel/locking/mutex.c:582 __mutex_lock+0x4bc/0x550
> [   19.241696] Modules linked in:
> [   19.244937] CPU: 0 PID: 140 Comm: kworker/0:4 Not tainted 6.6.20+ #96
> [   19.252046] Hardware name: xlnx,zynqmp (DT)
> [   19.256421] Workqueue: events zynqmp_dp_hpd_work_func
> [   19.261795] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   19.269104] pc : __mutex_lock+0x4bc/0x550
> [   19.273364] lr : __mutex_lock+0x4bc/0x550
> [   19.277592] sp : ffffffc085c5bbe0
> [   19.281066] x29: ffffffc085c5bbe0 x28: 0000000000000000 x27: ffffff88009417f8
> [   19.288624] x26: ffffff8800941788 x25: ffffff8800020008 x24: ffffffc082aa3000
> [   19.296227] x23: ffffffc080d90e3c x22: 0000000000000002 x21: 0000000000000000
> [   19.303744] x20: 0000000000000000 x19: ffffff88002f5210 x18: 0000000000000000
> [   19.311295] x17: 6c707369642e3030 x16: 3030613464662072 x15: 0720072007200720
> [   19.318922] x14: 0000000000000000 x13: 284e4f5f4e524157 x12: 0000000000000001
> [   19.326442] x11: 0001ffc085c5b940 x10: 0001ff88003f388b x9 : 0001ff88003f3888
> [   19.334003] x8 : 0001ff88003f3888 x7 : 0000000000000000 x6 : 0000000000000000
> [   19.341537] x5 : 0000000000000000 x4 : 0000000000001668 x3 : 0000000000000000
> [   19.349054] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff88003f3880
> [   19.356581] Call trace:
> [   19.359160]  __mutex_lock+0x4bc/0x550
> [   19.363032]  mutex_lock_nested+0x24/0x30
> [   19.367187]  drm_bridge_hpd_notify+0x2c/0x6c
> [   19.371698]  zynqmp_dp_hpd_work_func+0x44/0x54
> [   19.376364]  process_one_work+0x3ac/0x988
> [   19.380660]  worker_thread+0x398/0x694
> [   19.384736]  kthread+0x1bc/0x1c0
> [   19.388241]  ret_from_fork+0x10/0x20
> [   19.392031] irq event stamp: 183
> [   19.395450] hardirqs last  enabled at (183): [<ffffffc0800b9278>] finish_task_switch.isra.0+0xa8/0x2d4
> [   19.405140] hardirqs last disabled at (182): [<ffffffc081ad3754>] __schedule+0x714/0xd04
> [   19.413612] softirqs last  enabled at (114): [<ffffffc080133de8>] srcu_invoke_callbacks+0x158/0x23c
> [   19.423128] softirqs last disabled at (110): [<ffffffc080133de8>] srcu_invoke_callbacks+0x158/0x23c
> [   19.432614] ---[ end trace 0000000000000000 ]---
> 
> Fixes: eb2d64bfcc17 ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
>   drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 88eb33acd5f0..639fff2c693f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -256,12 +256,11 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_dp;
>   
> +	drm_bridge_add(dpsub->bridge);
>   	if (dpsub->dma_enabled) {
>   		ret = zynqmp_dpsub_drm_init(dpsub);
>   		if (ret)
>   			goto err_disp;
> -	} else {
> -		drm_bridge_add(dpsub->bridge);
>   	}
>   
>   	dev_info(&pdev->dev, "ZynqMP DisplayPort Subsystem driver probed");
> @@ -288,9 +287,8 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
>   
>   	if (dpsub->drm)
>   		zynqmp_dpsub_drm_cleanup(dpsub);
> -	else
> -		drm_bridge_remove(dpsub->bridge);
>   
> +	drm_bridge_remove(dpsub->bridge);
>   	zynqmp_disp_remove(dpsub);
>   	zynqmp_dp_remove(dpsub);
>   

I sent a similar patch:

https://lore.kernel.org/all/20240312-xilinx-dp-lock-fix-v1-1-1698f9f03bac@ideasonboard.com/

I have the drm_bridge_add() call in zynqmp_dp_probe(), as that's where 
the bridge is set up, so it felt like a logical place. You add it later, 
just before the bridge is used the first time.

I like mine a bit more as it has all the bridge code in the same place, 
but I also wonder if there might be some risks in adding the bridge 
early (before zynqmp_disp_probe()), although I can't see any issue right 
away...

In any case, as this works for me too:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

