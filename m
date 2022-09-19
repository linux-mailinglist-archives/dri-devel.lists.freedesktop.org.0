Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C345BCC6E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8767110E03A;
	Mon, 19 Sep 2022 13:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8CB10E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:03:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b5so47373926wrr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=2TqZiXHIRG5wKmX8Lz3OojC6YabD5tycoEKUA4ROup0=;
 b=Ja+mf/SC/p0ElH3qQeYIhlVhfH0wSzZawjWZe5rD+eRpvAzXM5LxCS2mSmWpulqk9I
 qAYz4LRSrharF0OVPZurgQI9m39yl7ADxxH66JvlsQNBb2hfDUBKnQX3X6Hf6aDIOXJ2
 W+4aQC4dJgXgwHAjm20UwlK5GO7rmLu+CoZnrTrZ3UxbxqOv8y1LY8fH3MdSxME0ZzoY
 1zqKlJ2OZ/J5POe0MdHMGOXYOqpuUT8Ke1TaOfBacsnioxdRjlh6yi3Irkh7CTIWc8L+
 zNvJReAImgU7wk/++DARsaVZMHhK5KL+ASeO58dw2DNmqRLf003aNf9N5fB6a6WxnNub
 7FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2TqZiXHIRG5wKmX8Lz3OojC6YabD5tycoEKUA4ROup0=;
 b=iY4qyiaZXLK3RzEiRR1xJCFNdVK5S4hxTrDqqPEMcmR5//C2d+WGNWcGMw6Aw4TTAJ
 dRekJi9+qUe3N2Pq/VDxJdFqyiPP8zSiF4sDVe9ydpPxMA7ZFoxksTrWDbLB7yDNN4l4
 U0bHfUz0d3lyv2FJ2p27z/phL9njHiHXFelrRGF/BmKCSwLpCphp9KDtYEnNW8IyVskN
 qi/qH5FbuTdoucCJVPisEbfFfsPF4A0cIRPa0GgxsWcjxHV6K5tS7cNJPrkzcwzyyQJQ
 s8gduEqbFd/Aq1oCWa3m/qYo76lckaVa78SPcLUVjHe2C5l/oiU45CMKyFKjOS3ht4ya
 iUSA==
X-Gm-Message-State: ACrzQf0+Zjd5tH+qeRBVmzM1fzghDLLh0IDPiKXZJmgMlQRAh04bnSeI
 lbMmDfm64JkMc+KsxrPGNMbG/v9gRSJCOdz+ZYI=
X-Google-Smtp-Source: AMsMyM5oEa+XLoD7t2G1ukMfY1pqMziKJu677QInJpbmMtT2P6kZpFzJ9FbGOGoLtFVRlcOJzE7EDg==
X-Received: by 2002:a05:6000:886:b0:225:24f5:deac with SMTP id
 ca6-20020a056000088600b0022524f5deacmr10727755wrb.104.1663592596112; 
 Mon, 19 Sep 2022 06:03:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:caa5:56f7:a8d:69b8?
 ([2a01:e0a:982:cbb0:caa5:56f7:a8d:69b8])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a1c2701000000b003b3307fb98fsm14154790wmn.24.2022.09.19.06.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 06:03:15 -0700 (PDT)
Message-ID: <7d545acf-eeba-b81a-0935-f0b71e98a82a@linaro.org>
Date: Mon, 19 Sep 2022 15:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] drm/meson: remove drm bridges at aggregate driver
 unbind time
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20220919010940.419893-1-adrian.larumbe@collabora.com>
 <20220919010940.419893-4-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220919010940.419893-4-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 19/09/2022 03:09, Adrián Larumbe wrote:
> drm bridges added by meson_encoder_hdmi_init and meson_encoder_cvbs_init
> were not manually removed at module unload time, which caused dangling
> references to freed memory to remain linked in the global bridge_list.
> 
> When loading the driver modules back in, the same functions would again
> call drm_bridge_add, and when traversing the global bridge_list, would
> end up peeking into freed memory.
> 
> Once again KASAN revealed the problem:
> 
> [  +0.000095] =============================================================
> [  +0.000008] BUG: KASAN: use-after-free in __list_add_valid+0x9c/0x120
> [  +0.000018] Read of size 8 at addr ffff00003da291f0 by task modprobe/2483
> 
> [  +0.000018] CPU: 3 PID: 2483 Comm: modprobe Tainted: G         C O      5.19.0-rc6-lrmbkasan+ #1
> [  +0.000011] Hardware name: Hardkernel ODROID-N2Plus (DT)
> [  +0.000008] Call trace:
> [  +0.000006]  dump_backtrace+0x1ec/0x280
> [  +0.000012]  show_stack+0x24/0x80
> [  +0.000008]  dump_stack_lvl+0x98/0xd4
> [  +0.000011]  print_address_description.constprop.0+0x80/0x520
> [  +0.000011]  print_report+0x128/0x260
> [  +0.000008]  kasan_report+0xb8/0xfc
> [  +0.000008]  __asan_report_load8_noabort+0x3c/0x50
> [  +0.000009]  __list_add_valid+0x9c/0x120
> [  +0.000009]  drm_bridge_add+0x6c/0x104 [drm]
> [  +0.000165]  dw_hdmi_probe+0x1900/0x2360 [dw_hdmi]
> [  +0.000022]  meson_dw_hdmi_bind+0x520/0x814 [meson_dw_hdmi]
> [  +0.000014]  component_bind+0x174/0x520
> [  +0.000012]  component_bind_all+0x1a8/0x38c
> [  +0.000010]  meson_drv_bind_master+0x5e8/0xb74 [meson_drm]
> [  +0.000032]  meson_drv_bind+0x20/0x2c [meson_drm]
> [  +0.000027]  try_to_bring_up_aggregate_device+0x19c/0x390
> [  +0.000010]  component_master_add_with_match+0x1c8/0x284
> [  +0.000009]  meson_drv_probe+0x274/0x280 [meson_drm]
> [  +0.000026]  platform_probe+0xd0/0x220
> [  +0.000009]  really_probe+0x3ac/0xa80
> [  +0.000009]  __driver_probe_device+0x1f8/0x400
> [  +0.000009]  driver_probe_device+0x68/0x1b0
> [  +0.000009]  __driver_attach+0x20c/0x480
> [  +0.000008]  bus_for_each_dev+0x114/0x1b0
> [  +0.000009]  driver_attach+0x48/0x64
> [  +0.000008]  bus_add_driver+0x390/0x564
> [  +0.000009]  driver_register+0x1a8/0x3e4
> [  +0.000009]  __platform_driver_register+0x6c/0x94
> [  +0.000008]  meson_drm_platform_driver_init+0x3c/0x1000 [meson_drm]
> [  +0.000027]  do_one_initcall+0xc4/0x2b0
> [  +0.000011]  do_init_module+0x154/0x570
> [  +0.000011]  load_module+0x1a78/0x1ea4
> [  +0.000008]  __do_sys_init_module+0x184/0x1cc
> [  +0.000009]  __arm64_sys_init_module+0x78/0xb0
> [  +0.000009]  invoke_syscall+0x74/0x260
> [  +0.000009]  el0_svc_common.constprop.0+0xcc/0x260
> [  +0.000008]  do_el0_svc+0x50/0x70
> [  +0.000007]  el0_svc+0x68/0x1a0
> [  +0.000012]  el0t_64_sync_handler+0x11c/0x150
> [  +0.000008]  el0t_64_sync+0x18c/0x190
> 
> [  +0.000016] Allocated by task 879:
> [  +0.000008]  kasan_save_stack+0x2c/0x5c
> [  +0.000011]  __kasan_kmalloc+0x90/0xd0
> [  +0.000007]  __kmalloc+0x278/0x4a0
> [  +0.000011]  mpi_resize+0x13c/0x1d0
> [  +0.000011]  mpi_powm+0xd24/0x1570
> [  +0.000009]  rsa_enc+0x1a4/0x30c
> [  +0.000009]  pkcs1pad_verify+0x3f0/0x580
> [  +0.000009]  public_key_verify_signature+0x7a8/0xba4
> [  +0.000010]  public_key_verify_signature_2+0x40/0x60
> [  +0.000008]  verify_signature+0xb4/0x114
> [  +0.000008]  pkcs7_validate_trust_one.constprop.0+0x3b8/0x574
> [  +0.000009]  pkcs7_validate_trust+0xb8/0x15c
> [  +0.000008]  verify_pkcs7_message_sig+0xec/0x1b0
> [  +0.000012]  verify_pkcs7_signature+0x78/0xac
> [  +0.000007]  mod_verify_sig+0x110/0x190
> [  +0.000009]  module_sig_check+0x114/0x1e0
> [  +0.000009]  load_module+0xa0/0x1ea4
> [  +0.000008]  __do_sys_init_module+0x184/0x1cc
> [  +0.000008]  __arm64_sys_init_module+0x78/0xb0
> [  +0.000008]  invoke_syscall+0x74/0x260
> [  +0.000009]  el0_svc_common.constprop.0+0x1a8/0x260
> [  +0.000008]  do_el0_svc+0x50/0x70
> [  +0.000007]  el0_svc+0x68/0x1a0
> [  +0.000009]  el0t_64_sync_handler+0x11c/0x150
> [  +0.000009]  el0t_64_sync+0x18c/0x190
> 
> [  +0.000013] Freed by task 2422:
> [  +0.000008]  kasan_save_stack+0x2c/0x5c
> [  +0.000009]  kasan_set_track+0x2c/0x40
> [  +0.000007]  kasan_set_free_info+0x28/0x50
> [  +0.000009]  ____kasan_slab_free+0x128/0x1d4
> [  +0.000008]  __kasan_slab_free+0x18/0x24
> [  +0.000007]  slab_free_freelist_hook+0x108/0x230
> [  +0.000010]  kfree+0x110/0x35c
> [  +0.000008]  release_nodes+0xf0/0x16c
> [  +0.000009]  devres_release_group+0x180/0x270
> [  +0.000008]  take_down_aggregate_device+0xcc/0x160
> [  +0.000010]  component_del+0x18c/0x360
> [  +0.000009]  meson_dw_hdmi_remove+0x28/0x40 [meson_dw_hdmi]
> [  +0.000013]  platform_remove+0x64/0xb0
> [  +0.000008]  device_remove+0xb8/0x154
> [  +0.000009]  device_release_driver_internal+0x398/0x5b0
> [  +0.000009]  driver_detach+0xac/0x1b0
> [  +0.000009]  bus_remove_driver+0x158/0x29c
> [  +0.000008]  driver_unregister+0x70/0xb0
> [  +0.000009]  platform_driver_unregister+0x20/0x2c
> [  +0.000007]  meson_dw_hdmi_platform_driver_exit+0x1c/0x30 [meson_dw_hdmi]
> [  +0.000012]  __do_sys_delete_module+0x288/0x400
> [  +0.000009]  __arm64_sys_delete_module+0x5c/0x80
> [  +0.000009]  invoke_syscall+0x74/0x260
> [  +0.000008]  el0_svc_common.constprop.0+0xcc/0x260
> [  +0.000008]  do_el0_svc+0x50/0x70
> [  +0.000007]  el0_svc+0x68/0x1a0
> [  +0.000008]  el0t_64_sync_handler+0x11c/0x150
> [  +0.000009]  el0t_64_sync+0x18c/0x190
> 
> [  +0.000013] The buggy address belongs to the object at ffff00003da29000
>                 which belongs to the cache kmalloc-1k of size 1024
> [  +0.000008] The buggy address is located 496 bytes inside of
>                 1024-byte region [ffff00003da29000, ffff00003da29400)
> 
> [  +0.000015] The buggy address belongs to the physical page:
> [  +0.000009] page:fffffc0000f68a00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3da28
> [  +0.000012] head:fffffc0000f68a00 order:3 compound_mapcount:0 compound_pincount:0
> [  +0.000009] flags: 0xffff00000010200(slab|head|node=0|zone=0|lastcpupid=0xffff)
> [  +0.000019] raw: 0ffff00000010200 fffffc0000eb5c08 fffffc0000d96608 ffff000000002a80
> [  +0.000008] raw: 0000000000000000 00000000000a000a 00000001ffffffff 0000000000000000
> [  +0.000008] page dumped because: kasan: bad access detected
> 
> [  +0.000011] Memory state around the buggy address:
> [  +0.000009]  ffff00003da29080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [  +0.000007]  ffff00003da29100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [  +0.000007] >ffff00003da29180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [  +0.000007]                                                              ^
> [  +0.000008]  ffff00003da29200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [  +0.000006]  ffff00003da29280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [  +0.000007] ==================================================================
> 
> Fix by keeping track of which encoders were initialised in the meson_drm
> structure and manually removing their bridges at aggregate driver's unbind
> time.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/meson/meson_drv.c          |  4 ++++
>   drivers/gpu/drm/meson/meson_drv.h          |  7 +++++++
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c |  7 +++++++
>   drivers/gpu/drm/meson/meson_encoder_cvbs.h |  1 +
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c |  7 +++++++
>   drivers/gpu/drm/meson/meson_encoder_hdmi.h |  1 +
>   drivers/gpu/drm/meson/meson_venc.h         | 15 +++++++++++++++
>   7 files changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index f3da1c214a7c..2b47154b73c2 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -387,6 +387,10 @@ static void meson_drv_unbind(struct device *dev)
>   	drm_atomic_helper_shutdown(drm);
>   	free_irq(priv->vsync_irq, drm);
>   	drm_dev_put(drm);
> +
> +	meson_encoder_hdmi_remove(priv);
> +	meson_encoder_cvbs_remove(priv);
> +
>   	component_unbind_all(dev, drm);
>   
>   	if (priv->afbcd.ops)
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> index 177dac3ca3be..2cf279fb4f82 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -25,6 +25,12 @@ enum vpu_compatible {
>   	VPU_COMPATIBLE_G12A = 3,
>   };
>   
> +enum {
> +	MESON_ENC_CVBS = 0,
> +	MESON_ENC_HDMI,
> +	MESON_ENC_LAST,
> +};
> +
>   struct meson_drm_match_data {
>   	enum vpu_compatible compat;
>   	struct meson_afbcd_ops *afbcd_ops;
> @@ -51,6 +57,7 @@ struct meson_drm {
>   	struct drm_crtc *crtc;
>   	struct drm_plane *primary_plane;
>   	struct drm_plane *overlay_plane;
> +	struct drm_encoder *encoders[MESON_ENC_LAST];
>   
>   	const struct meson_drm_soc_limits *limits;
>   
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index 8110a6e39320..00c958b08065 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -281,5 +281,12 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
>   	}
>   	drm_connector_attach_encoder(connector, &meson_encoder_cvbs->encoder);
>   
> +	priv->encoders[MESON_ENC_CVBS] = &meson_encoder_cvbs->encoder;
> +
>   	return 0;
>   }
> +
> +void meson_encoder_cvbs_remove(struct meson_drm *priv)
> +{
> +	REMOVE_ENCODER_BRIDGES(cvbs, MESON_ENC_CVBS);
> +}
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.h b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> index 61d9d183ce7f..09710fec3c66 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> @@ -25,5 +25,6 @@ struct meson_cvbs_mode {
>   extern struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT];
>   
>   int meson_encoder_cvbs_init(struct meson_drm *priv);
> +void meson_encoder_cvbs_remove(struct meson_drm *priv);
>   
>   #endif /* __MESON_VENC_CVBS_H */
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 2f616c55c271..da6f2882cd97 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -452,6 +452,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   		meson_encoder_hdmi->cec_notifier = notifier;
>   	}
>   
> +	priv->encoders[MESON_ENC_HDMI] = &meson_encoder_hdmi->encoder;
> +
>   	dev_dbg(priv->dev, "HDMI encoder initialized\n");
>   
>   	return 0;
> @@ -460,3 +462,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   	of_node_put(remote);
>   	return ret;
>   }
> +
> +void meson_encoder_hdmi_remove(struct meson_drm *priv)
> +{
> +	REMOVE_ENCODER_BRIDGES(hdmi, MESON_ENC_HDMI);
> +}
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.h b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> index ed19494f0956..a6cd38eb5f71 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> @@ -8,5 +8,6 @@
>   #define __MESON_ENCODER_HDMI_H
>   
>   int meson_encoder_hdmi_init(struct meson_drm *priv);
> +void meson_encoder_hdmi_remove(struct meson_drm *priv);
>   
>   #endif /* __MESON_ENCODER_HDMI_H */
> diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
> index 9138255ffc9e..9fc572860f8c 100644
> --- a/drivers/gpu/drm/meson/meson_venc.h
> +++ b/drivers/gpu/drm/meson/meson_venc.h
> @@ -47,6 +47,21 @@ struct meson_cvbs_enci_mode {
>   	unsigned int analog_sync_adj;
>   };
>   
> +#define REMOVE_ENCODER_BRIDGES(type, order)				\
> +{									\
> +	struct meson_encoder_##type *meson_encoder_##type;		\
> +	struct drm_encoder *encoder;					\
> +	if (priv->encoders[order]) {					\
> +		encoder = priv->encoders[order];			\
> +		meson_encoder_##type =					\
> +			container_of(encoder,				\
> +				     struct meson_encoder_##type,	\
> +				     encoder);				\
> +		drm_bridge_remove(&(meson_encoder_##type)->bridge);	\
> +		drm_bridge_remove((meson_encoder_##type)->next_bridge); \
> +	}								\
> +}


This looks over-complicated, why not store the "struct meson_encoder_cvbs/_hdmi" raw pointer in the struct meson_drm encoders table instead ?

With this no need to use container_of and directly call drm_bridge_remove() on bridge & next_bridge.

									\
> +
>   /* HDMI Clock parameters */
>   enum drm_mode_status
>   meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode);

Thanks,
Neil
