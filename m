Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624CB8D342F
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 12:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7656610E449;
	Wed, 29 May 2024 10:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="dAJb4wkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84B010E449
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:12:50 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240529101247euoutp02c75dfffa1e2d5e4d90337270fa157634~T7gAulMJ-2477224772euoutp02U
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:12:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240529101247euoutp02c75dfffa1e2d5e4d90337270fa157634~T7gAulMJ-2477224772euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1716977567;
 bh=HO+7UjuoRlc/thxjUXP4kSGkQyoPYs9fPA2mfjX8yE0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=dAJb4wkwQqAV9GACs90ykfTM8ECXAE1mYODFWOMH4zBqh3zlW43KZpjUCV5jiWRFv
 Q+cWZs8Jhvsk+3xkvawgpITG3680TtO7XPIFabNMsGfXAdf/7dR6t1RnCrclc51xea
 0o3RWvpvuow8QjRUklQ82rQT6IeeW0ljsFgZHQtE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240529101246eucas1p24567ec7825b549dabbbaad3476478acc~T7f-5Ms130983809838eucas1p2F;
 Wed, 29 May 2024 10:12:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id D6.85.09875.E9FF6566; Wed, 29
 May 2024 11:12:46 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240529101246eucas1p1266853c07f5178c7e3e4b8a264eb436e~T7f-ewj_Q0581405814eucas1p1S;
 Wed, 29 May 2024 10:12:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240529101246eusmtrp20f71868899ba885bcd2c7cb539f29ce2~T7f-eLpAK0458604586eusmtrp2f;
 Wed, 29 May 2024 10:12:46 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-74-6656ff9e9de0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 70.55.09010.D9FF6566; Wed, 29
 May 2024 11:12:46 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240529101245eusmtip1ff2b0736c6db55ceb4b5b216276c55b6~T7f_5cD8j0638506385eusmtip1f;
 Wed, 29 May 2024 10:12:45 +0000 (GMT)
Message-ID: <8d95757c-fd05-4a48-ae9d-24d78d04d663@samsung.com>
Date: Wed, 29 May 2024 12:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] of: property: Remove calls to of_node_put
To: Shresth Prasad <shresthprasad7@gmail.com>, robh@kernel.org,
 saravanak@google.com, DRI mailing list <dri-devel@lists.freedesktop.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 julia.lawall@inria.fr
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240515202915.16214-3-shresthprasad7@gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRmVeSWpSXmKPExsWy7djP87rz/oelGdy4L2cx/8g5VosrX9+z
 Wczae5jRomlVP7PF5V1z2Cz+79nBbtF16C+bxcLXDYwWe6cvY3Xg9Ng56y67x4JNpR6TXhxi
 8di0qpPNY//cNewe97uPM3l83iQXwB7FZZOSmpNZllqkb5fAlXHpxhLGglN2FVc+/2FqYHxo
 0sXIwSEhYCLx7LxnFyMXh5DACkaJWR1nmSGcL4wSM19OYIFwPjNKfH19j6mLkROsY9/pflaI
 xHJGiVtrFzODJIQEPjJKdG3zAxnLK2AnsfJBOUiYRUBVYurHE4wgNq+AoMTJmU9YQGxRAXmJ
 +7dmsIPYwgIuEicvrWcDsUUEuhgl+qcbg8xnFpjEKPGnsQusiFlAXOLWk/lgR7AJGEp0ve0C
 a+AE2tV59jJUjbxE89bZzBCHNnNKnJ0gAmG7SBxvbYeKC0u8Or6FHcKWkfi/E2QmF5Ddziix
 4Pd9KGcCo0TD81uMEFXWEnfO/WID+YxZQFNi/S59iLCjxPo1e9gh4cgnceOtIMQNfBKTtk1n
 hgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzUIKlllIvpyF5JtZCHsXMLKsYhRPLS3OTU8tNspL
 LdcrTswtLs1L10vOz93ECExTp/8d/7KDcfmrj3qHGJk4GA8xSnAwK4nwnpkUmibEm5JYWZVa
 lB9fVJqTWnyIUZqDRUmcVzVFPlVIID2xJDU7NbUgtQgmy8TBKdXAxFfvL2Rzxvcp29S2mBNs
 7T4Xni180h5jL/hna7GzxdOHUiWz/zx6bh6u3LL/t/7B1Xs/3ZotvuX14kSzcpOPBYZV/Df9
 DzZ1bFmbnW5mv3dRSMlq4R9xMloP2lV4pLeJCq/Vv+YaNLUh6ytD3p9v9xdq9F9e7iG33EjE
 euP93Sn7n/inXrObVP+FwSf7bd+TSXbhocsTisueq80IM70mtO2p/cfr7/yb1tW7za6yEn1l
 886De+HHe3ztW15+sI8+MP2GzVRWhbpCX4MtRy0vG/lIsc89wvwx/GKuTG1i1Zx38jE1H08x
 rFh2wezikXsRmifV9/K+vyti+JivOMFx25MJFbvNtbkTpuleOvF8kxJLcUaioRZzUXEiAK2k
 xTXCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xu7rz/oelGWwIs5h/5ByrxZWv79ks
 Zu09zGjRtKqf2eLyrjlsFv/37GC36Dr0l81i4esGRou905exOnB67Jx1l91jwaZSj0kvDrF4
 bFrVyeaxf+4ado/73ceZPD5vkgtgj9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1
 MjJV0rezSUnNySxLLdK3S9DLuHRjCWPBKbuKK5//MDUwPjTpYuTkkBAwkdh3up8VxBYSWMoo
 ceCTLERcRuLktAZWCFtY4s+1LrYuRi6gmveMEqtuLmbvYuTg4BWwk1j5oBykhkVAVWLqxxOM
 IDavgKDEyZlPWEBsUQF5ifu3ZrCD2MICLhInL60HmyMi0MUo8fDNeiYQh1lgEqPE9OkXmEGG
 CgnYSvx+agfSwCwgLnHryXwmEJtNwFCi6y3IEZwcnEB7O89eZoeoMZPo2trFCGHLSzRvnc08
 gVFoFpI7ZiEZNQtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIExuW2Yz+37GBc
 +eqj3iFGJg7GQ4wSHMxKIrxnJoWmCfGmJFZWpRblxxeV5qQWH2I0BQbGRGYp0eR8YGLIK4k3
 NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgqlx7ne/l9FMWlg8y1Bdf
 XLXYvV1AKOy2s9NV3/u+vIy53kuOMps4+B7YuLZ+8f2lyy5d+qEeym+ary66/qh+T/hB9Zcb
 quUafnUtuyC+wKZ8enpTGt8f3oc2UT3XLjitWLpE/IP7/OhngZ+6V747GjtJYueMhUKZaZf8
 Xqj845jwiPH580ea0fraRyWe+sUvkD/Jel91/7wm87l/vZ+f573bvWVbwKRjbtc+GzM2PODs
 6IrxrIxVnH/UJCkiZTazfzVnHKOzZo7yhqTCG20c5810zNXPcofyf9rH3FaT8+2Uf90Ua9EE
 fptau73reXb+fKJ/qPMHh+Cpdf8evXd4mdgu5bf+zzbJy73PSsx4lViKMxINtZiLihMBwTAl
 tVQDAAA=
X-CMS-MailID: 20240529101246eucas1p1266853c07f5178c7e3e4b8a264eb436e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240529101246eucas1p1266853c07f5178c7e3e4b8a264eb436e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240529101246eucas1p1266853c07f5178c7e3e4b8a264eb436e
References: <20240515202915.16214-3-shresthprasad7@gmail.com>
 <CGME20240529101246eucas1p1266853c07f5178c7e3e4b8a264eb436e@eucas1p1.samsung.com>
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

On 15.05.2024 22:29, Shresth Prasad wrote:
> Add __free cleanup handler to some variable initialisations, which
> ensures that the resource is freed as soon as the variable goes out of
> scope. Thus removing the need to manually free up the resource using
> of_node_put.
>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
> ---

This patch landed in today's linux-next as commit b94d24c08ee1 ("of: 
property: Remove calls to of_node_put"). I found that it triggers the 
following warning while booting of the Samsung Exynos5800 based Pi 
Chromebook (arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts):

OF: ERROR: of_node_release() detected bad of_node_put() on /panel
CPU: 2 PID: 68 Comm: kworker/u36:1 Not tainted 
6.10.0-rc1-00001-gb94d24c08ee1 #8619
Hardware name: Samsung Exynos (Flattened Device Tree)
Workqueue: events_unbound deferred_probe_work_func
tps65090 20-0048: No cache defaults, reading back from HW
Call trace:
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x50/0x64
  dump_stack_lvl from of_node_release+0x110/0x138
  of_node_release from kobject_put+0x98/0x108
  kobject_put from drm_of_find_panel_or_bridge+0x94/0xd8
  drm_of_find_panel_or_bridge from exynos_dp_probe+0xf0/0x158 [exynosdrm]
  exynos_dp_probe [exynosdrm] from platform_probe+0x80/0xc0
  platform_probe from really_probe+0xc8/0x288
  really_probe from __driver_probe_device+0x8c/0x190
  __driver_probe_device from driver_probe_device+0x30/0xd0
  driver_probe_device from __device_attach_driver+0x8c/0xbc
  __device_attach_driver from bus_for_each_drv+0x74/0xc0
  bus_for_each_drv from __device_attach+0xe8/0x184
  __device_attach from bus_probe_device+0x88/0x8c
  bus_probe_device from deferred_probe_work_func+0x7c/0xa8
  deferred_probe_work_func from process_scheduled_works+0xe8/0x41c
  process_scheduled_works from worker_thread+0x14c/0x35c
  worker_thread from kthread+0xd0/0x104
  kthread from ret_from_fork+0x14/0x28
Exception stack(0xf0a81fb0 to 0xf0a81ff8)

OF: ERROR: next of_node_put() on this node will result in a kobject 
warning 'refcount_t: underflow; use-after-free.'
------------[ cut here ]------------
WARNING: CPU: 3 PID: 68 at lib/refcount.c:25 kobject_get+0xa0/0xa4
refcount_t: addition on 0; use-after-free.
Modules linked in: i2c_cros_ec_tunnel(+) cros_ec_keyb cros_ec_dev 
cros_ec_spi cros_ec snd_soc_i2s snd_soc_idma snd_soc_max98090 
snd_soc_snow snd_soc_s3c_dma snd_soc_core tpm_i2c_infineon ac97_bus 
snd_pcm_dmaengine tpm exynosdrm libsha256 libaescfb snd_pcm analogix_dp 
ecdh_generic samsung_dsim ecc snd_timer atmel_mxt_ts snd libaes 
soundcore exynos_gsc s5p_jpeg s5p_mfc v4l2_mem2mem spi_s3c64xx 
videobuf2_dma_contig exynos_adc pwm_samsung videobuf2_memops 
videobuf2_v4l2 videodev phy_exynos_usb2 videobuf2_common ohci_exynos 
ehci_exynos mc exynos_ppmu rtc_s3c exynos_rng s3c2410_wdt s5p_sss 
phy_exynos_mipi_video phy_exynos_dp_video
CPU: 3 PID: 68 Comm: kworker/u36:1 Not tainted 
6.10.0-rc1-00001-gb94d24c08ee1 #8619
Hardware name: Samsung Exynos (Flattened Device Tree)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x50/0x64
  dump_stack_lvl from __warn+0x108/0x12c
  __warn from warn_slowpath_fmt+0x118/0x17c
  warn_slowpath_fmt from kobject_get+0xa0/0xa4
  kobject_get from of_node_get+0x14/0x1c
  of_node_get from of_get_next_parent+0x24/0x50
  of_get_next_parent from of_graph_get_port_parent.part.1+0x58/0xa4
  of_graph_get_port_parent.part.1 from 
of_graph_get_remote_port_parent+0x1c/0x38
  of_graph_get_remote_port_parent from of_graph_get_remote_node+0x10/0x6c
  of_graph_get_remote_node from drm_of_find_panel_or_bridge+0x50/0xd8
  drm_of_find_panel_or_bridge from exynos_dp_probe+0xf0/0x158 [exynosdrm]
  exynos_dp_probe [exynosdrm] from platform_probe+0x80/0xc0
  platform_probe from really_probe+0xc8/0x288
  really_probe from __driver_probe_device+0x8c/0x190
  __driver_probe_device from driver_probe_device+0x30/0xd0
  driver_probe_device from __device_attach_driver+0x8c/0xbc
  __device_attach_driver from bus_for_each_drv+0x74/0xc0
  bus_for_each_drv from __device_attach+0xe8/0x184
  __device_attach from bus_probe_device+0x88/0x8c
  bus_probe_device from deferred_probe_work_func+0x7c/0xa8
  deferred_probe_work_func from process_scheduled_works+0xe8/0x41c
  process_scheduled_works from worker_thread+0x14c/0x35c
  worker_thread from kthread+0xd0/0x104
  kthread from ret_from_fork+0x14/0x28
Exception stack(0xf0a81fb0 to 0xf0a81ff8)

---[ end trace 0000000000000000 ]---
------------[ cut here ]------------

If I got this right, this points to the drm_of_find_panel_or_bridge() 
function. I briefly scanned it, but I don't see any obvious 
of_node_put() related issue there.


> I had submitted a similar patch a couple weeks ago addressing the same
> issue, but as it turns out I wasn't thorough enough and had left a couple
> instances.
>
> I hope this isn't too big an issue.
> ---
>   drivers/of/property.c | 27 +++++++++++----------------
>   1 file changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 17b294e16c56..96a74f6a8d64 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -773,15 +773,14 @@ EXPORT_SYMBOL(of_graph_get_port_parent);
>   struct device_node *of_graph_get_remote_port_parent(
>   			       const struct device_node *node)
>   {
> -	struct device_node *np, *pp;
> +	struct device_node *pp;
>   
>   	/* Get remote endpoint node. */
> -	np = of_graph_get_remote_endpoint(node);
> +	struct device_node *np __free(device_node) =
> +			    of_graph_get_remote_endpoint(node);
>   
>   	pp = of_graph_get_port_parent(np);
>   
> -	of_node_put(np);
> -
>   	return pp;
>   }
>   EXPORT_SYMBOL(of_graph_get_remote_port_parent);
> @@ -835,17 +834,18 @@ EXPORT_SYMBOL(of_graph_get_endpoint_count);
>   struct device_node *of_graph_get_remote_node(const struct device_node *node,
>   					     u32 port, u32 endpoint)
>   {
> -	struct device_node *endpoint_node, *remote;
> +	struct device_node *endpoint_node __free(device_node) =
> +			    of_graph_get_endpoint_by_regs(node, port, endpoint);
> +
> +	struct device_node *remote __free(device_node) =
> +			    of_graph_get_remote_port_parent(endpoint_node);
>   
> -	endpoint_node = of_graph_get_endpoint_by_regs(node, port, endpoint);
>   	if (!endpoint_node) {
>   		pr_debug("no valid endpoint (%d, %d) for node %pOF\n",
>   			 port, endpoint, node);
>   		return NULL;
>   	}
>   
> -	remote = of_graph_get_remote_port_parent(endpoint_node);
> -	of_node_put(endpoint_node);
>   	if (!remote) {
>   		pr_debug("no valid remote node\n");
>   		return NULL;
> @@ -853,7 +853,6 @@ struct device_node *of_graph_get_remote_node(const struct device_node *node,
>   
>   	if (!of_device_is_available(remote)) {
>   		pr_debug("not available for remote node\n");
> -		of_node_put(remote);
>   		return NULL;
>   	}
>   
> @@ -1064,19 +1063,15 @@ static void of_link_to_phandle(struct device_node *con_np,
>   			      struct device_node *sup_np,
>   			      u8 flags)
>   {
> -	struct device_node *tmp_np = of_node_get(sup_np);
> +	struct device_node *tmp_np __free(device_node) = of_node_get(sup_np);
>   
>   	/* Check that sup_np and its ancestors are available. */
>   	while (tmp_np) {
> -		if (of_fwnode_handle(tmp_np)->dev) {
> -			of_node_put(tmp_np);
> +		if (of_fwnode_handle(tmp_np)->dev)
>   			break;
> -		}
>   
> -		if (!of_device_is_available(tmp_np)) {
> -			of_node_put(tmp_np);
> +		if (!of_device_is_available(tmp_np))
>   			return;
> -		}
>   
>   		tmp_np = of_get_next_parent(tmp_np);
>   	}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

