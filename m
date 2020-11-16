Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42A52B3F5D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 10:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76F089D7C;
	Mon, 16 Nov 2020 09:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861B789D7C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:06:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201116090609euoutp022e770402887c58d2144e4845b8dd9377~H8bkQb4ET0731907319euoutp02X
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:06:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201116090609euoutp022e770402887c58d2144e4845b8dd9377~H8bkQb4ET0731907319euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1605517569;
 bh=UJ5+ucExGHEL7Eck6ThvJqZvxkpgQU+DcZkkm7L48A8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ZQffVDg2IUjid5HTDFixFwUCeGJFooFXMpu9HKsJtBZTZUjvlP1jdZMrdmSO0VOyR
 HeNrT+44bQ5M73lw4K78Q8/EdH3Rtdj9IfP4YgCwhHsIr7BbxgnZ2GUGbAewFAQTDy
 9mT5IE5hUA/YFC0AwxrUvWMUlutkZrAAhX2hJyFw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201116090609eucas1p2b7507984fec0c0198a19588c3ea4a34e~H8bkBNGHH2921929219eucas1p2g;
 Mon, 16 Nov 2020 09:06:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id B3.1A.44805.00142BF5; Mon, 16
 Nov 2020 09:06:08 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201116090608eucas1p128a4fa2e03380fe0cffea2f9bc2af816~H8bjbh1P_0460004600eucas1p1A;
 Mon, 16 Nov 2020 09:06:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201116090608eusmtrp242fb37f4f7bf9ac977c8cdb282438f6f~H8bja1tjb2650926509eusmtrp2u;
 Mon, 16 Nov 2020 09:06:08 +0000 (GMT)
X-AuditID: cbfec7f4-b4fff7000000af05-fd-5fb24100f2c4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D6.4E.21957.00142BF5; Mon, 16
 Nov 2020 09:06:08 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201116090607eusmtip1ab9dd866c3bee348f1aceb579ae3a178~H8bi95g1i2854328543eusmtip1M;
 Mon, 16 Nov 2020 09:06:07 +0000 (GMT)
Subject: Re: [v2,1/2] drm: convert drm_atomic_uapi.c to new debug helpers
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, 'Linux Samsung SOC'
 <linux-samsung-soc@vger.kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <87bba2ec-b044-66c8-1fd7-4c01a9e5b791@samsung.com>
Date: Mon, 16 Nov 2020 10:06:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <FpVdsmqIh7IkH7YIwBjmp5ict1qi4NZlwHrIps@cp4-web-034.plabs.ch>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87oMjpviDaZNsLH4eKDY4srX92wW
 589vYLeYcX4fk8WKn1sZLba8mcjqwOaxYONXJo9NqzrZPO53H2fyWDLtKpvH5tPVHp83yQWw
 RXHZpKTmZJalFunbJXBlzLz7n73gTnbF1fZO1gbGe2FdjJwcEgImEsuXr2cFsYUEVjBK9K4y
 7WLkArK/MEq0vn3KCOF8ZpTo+dXIDNNx4c9XJojEckaJo2+bmSDa3zNKXH/D2cXIwSEs4Cmx
 +poxSI0IyNSz246xg9QwC/hI/GjtYgGx2QQMJbredrGB2LwCdhLnHswHq2ERUJXYcf0+2Emi
 AkkS27dsZ4WoEZQ4OfMJWC+ngJfEz7tvmSFmyktsfzsHyhaXuPVkPthxEgJ3OCQ2rH/HBHG1
 i8S0TRegbGGJV8e3sEPYMhL/d8I0NDNKPDy3lh3C6WGUuNw0gxGiylrizrlfbCCvMQtoSqzf
 pQ8RdpSY/v41WFhCgE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSaheS1
 WUjemYXknVkIexcwsqxiFE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQITD+n/x3/soNx+auP
 eocYmTgYDzFKcDArifC6mGyMF+JNSaysSi3Kjy8qzUktPsQozcGiJM6btGVNvJBAemJJanZq
 akFqEUyWiYNTqoFpVrfIQVmb5A9GRj1vprJ/bJww/cz/jC5LLu8EgXfvHqh+/WreX6M0++3i
 kwoJc5P/lx1SuDV5R8mXFdd+RC/o/nP7tYdG576n+17e7IwTYnmR3P+Ba7uS1UTda4cNdl7v
 bfP5Lfd0tRB3ib7Npwn6m0Nzrngr+IRoT1r1xs0xSlDcvMHha0NPq33TlsqecwbhjJumJvft
 3x0Zr6DyX/5nYOZiVc9PG3NFs8TsrG5s3bZ9Tpr/z633HvV5xR28IcZy8cD2drUT07UWGfxa
 uMqq3MTh1+PHSbzPG7hkXGfEWO4za3mi7fZkO6ffwnu7Z4X3Mx+/Hte3Ib33nbuzwdL9M/zW
 9LzYe7RHdGm+0A5NJZbijERDLeai4kQAt+Xd+K4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7oMjpviDS5eFbX4eKDY4srX92wW
 589vYLeYcX4fk8WKn1sZLba8mcjqwOaxYONXJo9NqzrZPO53H2fyWDLtKpvH5tPVHp83yQWw
 RenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlzLz7
 n73gTnbF1fZO1gbGe2FdjJwcEgImEhf+fGXqYuTiEBJYyijx8/g9RoiEjMTJaQ2sELawxJ9r
 XWwQRW8ZJW7emM3cxcjBISzgKbH6mjFIXERgBaPEpFWXwRqYBXwkfrR2sYDYQkA1u99sBIuz
 CRhKdL0FGcTJwStgJ3HuwXx2EJtFQFVix/X7YDWiAkkSM4+fZYeoEZQ4OfMJ2BxOAS+Jn3ff
 MkPMN5OYt/khlC0vsf3tHChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy02
 1CtOzC0uzUvXS87P3cQIjLhtx35u3sE479VHvUOMTByMhxglOJiVRHhdTDbGC/GmJFZWpRbl
 xxeV5qQWH2I0BfpnIrOUaHI+MObzSuINzQxMDU3MLA1MLc2MlcR5t85dEy8kkJ5YkpqdmlqQ
 WgTTx8TBKdXA5JfgdGKb3psZc5dHpu3oK+w7WDTn6roKl6uNWpvypyUJTVgUdabGf0a/ye60
 zx6ORl+rl/u53udfv0N23aILR07wL9p1YWMf11ObS9+dZnTk7Q1S/a+5UOOHbcjtvZcEZp7X
 vnZq233HFw/EnXKyti9sFF4V1eT8QGT5lr0zr+SJazcknN6/+fi3S1KP81YzzJn947dsuGfd
 ZZvk08bpz67t2ioi5h3e+/zE7N+X2V+dNrq78ERukdeXNV/5d3gqS2apiF3UsXlx85pSyGXO
 lUbmfzX2idk9nfVo2tFWg9D4HU7zLU98tA8JLha7zePQxz6tXjlkyslz7AtYZqTP7P9kmPBa
 8HzC+jWOh6vjEhYrsRRnJBpqMRcVJwIAQK5XXEEDAAA=
X-CMS-MailID: 20201116090608eucas1p128a4fa2e03380fe0cffea2f9bc2af816
X-Msg-Generator: CA
X-RootMTR: 20201116090608eucas1p128a4fa2e03380fe0cffea2f9bc2af816
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201116090608eucas1p128a4fa2e03380fe0cffea2f9bc2af816
References: <FpVdsmqIh7IkH7YIwBjmp5ict1qi4NZlwHrIps@cp4-web-034.plabs.ch>
 <CGME20201116090608eucas1p128a4fa2e03380fe0cffea2f9bc2af816@eucas1p1.samsung.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On 11.11.2020 10:07, Simon Ser wrote:
> Migrate from DRM_DEBUG_ATOMIC to drm_dbg_atomic.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

This patch landed in today's linux-next as commit e3aae683e861 ("drm: 
convert drm_atomic_uapi.c to new debug helpers"). Sadly it breaks 
booting all Exynos based boards. Here is example of the panic log:

exynos4-fb 11c00000.fimd: Adding to iommu group 0
OF: graph: no port node found in /soc/fimd@11c00000
OF: graph: no port node found in /soc/dsi@11c80000
[drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
exynos-drm exynos-drm: bound 11c80000.dsi (ops exynos_dsi_component_ops)
exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
[drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
panel-samsung-s6e8aa0 11c80000.dsi.0: ID: 0x12, 0x8e, 0x9f
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = (ptrval)
[00000000] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.0-rc3-00986-ge3aae683e861 
#2003
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at drm_atomic_set_crtc_for_connector+0xe4/0x124
LR is at drm_mode_object_put+0x30/0x80
...
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xc1cf7940 to 0xc1cf8000)
...
[<c065b164>] (drm_atomic_set_crtc_for_connector) from [<c0642728>] 
(__drm_atomic_helper_set_config+0x1c4/0x368)
[<c0642728>] (__drm_atomic_helper_set_config) from [<c0658e28>] 
(drm_client_modeset_commit_atomic+0x180/0x284)
[<c0658e28>] (drm_client_modeset_commit_atomic) from [<c065900c>] 
(drm_client_modeset_commit_locked+0x64/0x1cc)
[<c065900c>] (drm_client_modeset_commit_locked) from [<c062a780>] 
(drm_fb_helper_pan_display+0x9c/0x1d0)
[<c062a780>] (drm_fb_helper_pan_display) from [<c0590be0>] 
(fb_pan_display+0xbc/0x148)
[<c0590be0>] (fb_pan_display) from [<c059ca30>] (bit_update_start+0x14/0x30)
[<c059ca30>] (bit_update_start) from [<c0598904>] (fbcon_switch+0x484/0x4e0)
[<c0598904>] (fbcon_switch) from [<c05e8828>] (redraw_screen+0x178/0x210)
[<c05e8828>] (redraw_screen) from [<c059ac6c>] 
(fbcon_prepare_logo+0x40c/0x47c)
[<c059ac6c>] (fbcon_prepare_logo) from [<c059b53c>] (fbcon_init+0x468/0x608)
[<c059b53c>] (fbcon_init) from [<c05e6ac0>] (visual_init+0xc0/0x108)
[<c05e6ac0>] (visual_init) from [<c05e91d8>] 
(do_bind_con_driver+0x180/0x39c)
[<c05e91d8>] (do_bind_con_driver) from [<c05e9778>] 
(do_take_over_console+0x140/0x1cc)
[<c05e9778>] (do_take_over_console) from [<c059944c>] 
(do_fbcon_takeover+0x84/0xe0)
[<c059944c>] (do_fbcon_takeover) from [<c0591a58>] 
(register_framebuffer+0x1cc/0x2dc)
[<c0591a58>] (register_framebuffer) from [<c062af78>] 
(__drm_fb_helper_initial_config_and_unlock+0x3f0/0x5e8)
[<c062af78>] (__drm_fb_helper_initial_config_and_unlock) from 
[<c06187c0>] (drm_kms_helper_hotplug_event+0x24/0x30)
[<c06187c0>] (drm_kms_helper_hotplug_event) from [<c0669c84>] 
(exynos_dsi_host_attach+0x184/0x2c8)
[<c0669c84>] (exynos_dsi_host_attach) from [<c067203c>] 
(s6e8aa0_probe+0x1b0/0x218)
[<c067203c>] (s6e8aa0_probe) from [<c068dc58>] (really_probe+0x200/0x4fc)
[<c068dc58>] (really_probe) from [<c068e11c>] 
(driver_probe_device+0x78/0x1fc)
[<c068e11c>] (driver_probe_device) from [<c068e504>] 
(device_driver_attach+0x58/0x60)
[<c068e504>] (device_driver_attach) from [<c068e5e8>] 
(__driver_attach+0xdc/0x174)
[<c068e5e8>] (__driver_attach) from [<c068b9e0>] 
(bus_for_each_dev+0x68/0xb4)
[<c068b9e0>] (bus_for_each_dev) from [<c068cd14>] 
(bus_add_driver+0x158/0x214)
[<c068cd14>] (bus_add_driver) from [<c068f45c>] (driver_register+0x78/0x110)
[<c068f45c>] (driver_register) from [<c0102484>] 
(do_one_initcall+0x8c/0x42c)
[<c0102484>] (do_one_initcall) from [<c11011c0>] 
(kernel_init_freeable+0x190/0x1dc)
[<c11011c0>] (kernel_init_freeable) from [<c0b232dc>] 
(kernel_init+0x8/0x118)
[<c0b232dc>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
Exception stack(0xc1cf7fb0 to 0xc1cf7ff8)
...
---[ end trace 8ff0b5f6297ccc4f ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

Reverting it on top of linux-next fixes the issue.

> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 113 +++++++++++++++++-------------
>   1 file changed, 66 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ef82009035e6..efab3d518891 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -85,13 +85,15 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
>   
>   		drm_mode_copy(&state->mode, mode);
>   		state->enable = true;
> -		DRM_DEBUG_ATOMIC("Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
> -				 mode->name, crtc->base.id, crtc->name, state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
> +			       mode->name, crtc->base.id, crtc->name, state);
>   	} else {
>   		memset(&state->mode, 0, sizeof(state->mode));
>   		state->enable = false;
> -		DRM_DEBUG_ATOMIC("Set [NOMODE] for [CRTC:%d:%s] state %p\n",
> -				 crtc->base.id, crtc->name, state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
> +			       crtc->base.id, crtc->name, state);
>   	}
>   
>   	return 0;
> @@ -128,31 +130,35 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
>   		int ret;
>   
>   		if (blob->length != sizeof(struct drm_mode_modeinfo)) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] bad mode blob length: %zu\n",
> -					 crtc->base.id, crtc->name,
> -					 blob->length);
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] bad mode blob length: %zu\n",
> +				       crtc->base.id, crtc->name,
> +				       blob->length);
>   			return -EINVAL;
>   		}
>   
>   		ret = drm_mode_convert_umode(crtc->dev,
>   					     &state->mode, blob->data);
>   		if (ret) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
> -					 crtc->base.id, crtc->name,
> -					 ret, drm_get_mode_status_name(state->mode.status));
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
> +				       crtc->base.id, crtc->name,
> +				       ret, drm_get_mode_status_name(state->mode.status));
>   			drm_mode_debug_printmodeline(&state->mode);
>   			return -EINVAL;
>   		}
>   
>   		state->mode_blob = drm_property_blob_get(blob);
>   		state->enable = true;
> -		DRM_DEBUG_ATOMIC("Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
> -				 state->mode.name, crtc->base.id, crtc->name,
> -				 state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
> +			       state->mode.name, crtc->base.id, crtc->name,
> +			       state);
>   	} else {
>   		state->enable = false;
> -		DRM_DEBUG_ATOMIC("Set [NOMODE] for [CRTC:%d:%s] state %p\n",
> -				 crtc->base.id, crtc->name, state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
> +			       crtc->base.id, crtc->name, state);
>   	}
>   
>   	return 0;
> @@ -202,12 +208,14 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
>   	}
>   
>   	if (crtc)
> -		DRM_DEBUG_ATOMIC("Link [PLANE:%d:%s] state %p to [CRTC:%d:%s]\n",
> -				 plane->base.id, plane->name, plane_state,
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(plane->dev,
> +			       "Link [PLANE:%d:%s] state %p to [CRTC:%d:%s]\n",
> +			       plane->base.id, plane->name, plane_state,
> +			       crtc->base.id, crtc->name);
>   	else
> -		DRM_DEBUG_ATOMIC("Link [PLANE:%d:%s] state %p to [NOCRTC]\n",
> -				 plane->base.id, plane->name, plane_state);
> +		drm_dbg_atomic(plane->dev,
> +			       "Link [PLANE:%d:%s] state %p to [NOCRTC]\n",
> +			       plane->base.id, plane->name, plane_state);
>   
>   	return 0;
>   }
> @@ -230,12 +238,14 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>   	struct drm_plane *plane = plane_state->plane;
>   
>   	if (fb)
> -		DRM_DEBUG_ATOMIC("Set [FB:%d] for [PLANE:%d:%s] state %p\n",
> -				 fb->base.id, plane->base.id, plane->name,
> -				 plane_state);
> +		drm_dbg_atomic(plane->dev,
> +			       "Set [FB:%d] for [PLANE:%d:%s] state %p\n",
> +			       fb->base.id, plane->base.id, plane->name,
> +			       plane_state);
>   	else
> -		DRM_DEBUG_ATOMIC("Set [NOFB] for [PLANE:%d:%s] state %p\n",
> -				 plane->base.id, plane->name, plane_state);
> +		drm_dbg_atomic(plane->dev,
> +			       "Set [NOFB] for [PLANE:%d:%s] state %p\n",
> +			       plane->base.id, plane->name, plane_state);
>   
>   	drm_framebuffer_assign(&plane_state->fb, fb);
>   }
> @@ -324,13 +334,15 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>   		drm_connector_get(conn_state->connector);
>   		conn_state->crtc = crtc;
>   
> -		DRM_DEBUG_ATOMIC("Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
> -				 connector->base.id, connector->name,
> -				 conn_state, crtc->base.id, crtc->name);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
> +			       connector->base.id, connector->name,
> +			       conn_state, crtc->base.id, crtc->name);
>   	} else {
> -		DRM_DEBUG_ATOMIC("Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
> -				 connector->base.id, connector->name,
> -				 conn_state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
> +			       connector->base.id, connector->name,
> +			       conn_state);
>   	}
>   
>   	return 0;
> @@ -474,9 +486,10 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   	} else if (crtc->funcs->atomic_set_property) {
>   		return crtc->funcs->atomic_set_property(crtc, state, property, val);
>   	} else {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
> -				 crtc->base.id, crtc->name,
> -				 property->base.id, property->name);
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
> +			       crtc->base.id, crtc->name,
> +			       property->base.id, property->name);
>   		return -EINVAL;
>   	}
>   
> @@ -570,8 +583,9 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>   		state->pixel_blend_mode = val;
>   	} else if (property == plane->rotation_property) {
>   		if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK)) {
> -			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] bad rotation bitmask: 0x%llx\n",
> -					 plane->base.id, plane->name, val);
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] bad rotation bitmask: 0x%llx\n",
> +				       plane->base.id, plane->name, val);
>   			return -EINVAL;
>   		}
>   		state->rotation = val;
> @@ -595,9 +609,10 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>   		return plane->funcs->atomic_set_property(plane, state,
>   				property, val);
>   	} else {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> -				 plane->base.id, plane->name,
> -				 property->base.id, property->name);
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> +			       plane->base.id, plane->name,
> +			       property->base.id, property->name);
>   		return -EINVAL;
>   	}
>   
> @@ -665,17 +680,20 @@ static int drm_atomic_set_writeback_fb_for_connector(
>   		struct drm_framebuffer *fb)
>   {
>   	int ret;
> +	struct drm_connector *conn = conn_state->connector;
>   
>   	ret = drm_writeback_set_fb(conn_state, fb);
>   	if (ret < 0)
>   		return ret;
>   
>   	if (fb)
> -		DRM_DEBUG_ATOMIC("Set [FB:%d] for connector state %p\n",
> -				 fb->base.id, conn_state);
> +		drm_dbg_atomic(conn->dev,
> +			       "Set [FB:%d] for connector state %p\n",
> +			       fb->base.id, conn_state);
>   	else
> -		DRM_DEBUG_ATOMIC("Set [NOFB] for connector state %p\n",
> -				 conn_state);
> +		drm_dbg_atomic(conn->dev,
> +			       "Set [NOFB] for connector state %p\n",
> +			       conn_state);
>   
>   	return 0;
>   }
> @@ -782,9 +800,10 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>   		return connector->funcs->atomic_set_property(connector,
>   				state, property, val);
>   	} else {
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]]\n",
> -				 connector->base.id, connector->name,
> -				 property->base.id, property->name);
> +		drm_dbg_atomic(connector->dev,
> +			       "[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]]\n",
> +			       connector->base.id, connector->name,
> +			       property->base.id, property->name);
>   		return -EINVAL;
>   	}
>   
> @@ -1282,7 +1301,7 @@ static void complete_signaling(struct drm_device *dev,
>   		/* If this fails log error to the user */
>   		if (fence_state[i].out_fence_ptr &&
>   		    put_user(-1, fence_state[i].out_fence_ptr))
> -			DRM_DEBUG_ATOMIC("Couldn't clear out_fence_ptr\n");
> +			drm_dbg_atomic(dev, "Couldn't clear out_fence_ptr\n");
>   	}
>   
>   	kfree(fence_state);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
