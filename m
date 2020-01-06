Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A713100F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750DE6E21B;
	Mon,  6 Jan 2020 10:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482D76E20A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 10:08:46 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ioPJS-0001hz-R9; Mon, 06 Jan 2020 11:08:42 +0100
Message-ID: <15ed7b85a13e220a533a800b9c04f13b1c747c1c.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] drm/etnaviv: show identity information in debugfs
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2020 11:08:42 +0100
In-Reply-To: <20200102100230.420009-4-christian.gmeiner@gmail.com>
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
 <20200102100230.420009-4-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Do, 2020-01-02 at 11:02 +0100, Christian Gmeiner wrote:
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 253301be9e95..cecef5034db1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -868,6 +868,18 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu,
> struct seq_file *m)
>  
>  	verify_dma(gpu, &debug);
>  
> +	seq_puts(m, "\tidentity\n");
> +	seq_printf(m, "\t model: 0x%x\n",
> +		   gpu->identity.model);
> +	seq_printf(m, "\t revision: 0x%x\n",
> +		   gpu->identity.revision);
> +	seq_printf(m, "\t product_id: 0x%x\n",
> +		   gpu->identity.product_id);
> +	seq_printf(m, "\t customer_id: 0x%x\n",
> +		   gpu->identity.customer_id);
> +	seq_printf(m, "\t eco_id: 0x%x\n",
> +		   gpu->identity.eco_id);

I like having this info in debugfs. Most of those seq_printf don't need
a line break though, as they fit well within the 80 char limit.

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
