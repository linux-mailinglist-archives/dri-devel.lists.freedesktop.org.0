Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3748560164E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 20:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68D310EDF7;
	Mon, 17 Oct 2022 18:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97DC10E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 18:30:26 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id l22so17294523edj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ygTaFM2xbm4f+3CnWyuW6YhAYiSOprMyGPvCYkz/T4=;
 b=bcwiVIzGS1AnE11FxBrC4EJI4yYIXpkDDvkXNjOzLBOrdPpftEdG/bk1MmdY7yaumu
 bWJxNRX1dAceXkrG0vUNchvTHH0sYHv7SEZ2IxlUVbAYeo2h4h+5N80qnvb5Q52i+R7y
 NAdH8FgsQ1Diyv2AYEdi5cu0+xioeo6M/nsUCPx6UqIh0aoWwb5UVQBv57KG+7zZUQe+
 wOSPUzlKQAcKw9VLG+DoxnJI3Z53He7V8zzEOJw+IHiTaDBp5yY6XmCAGHN6T6XyjSyz
 TDWPqnb03lh1ftWgeXwnMWw4NdDLDvfNABAVUJgtmgKFy5UbeiZHUpqrtmvikAe4o3Yt
 EQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ygTaFM2xbm4f+3CnWyuW6YhAYiSOprMyGPvCYkz/T4=;
 b=Mgn5GsQ9pdEGnkEQpsiQmvQ9+alUvNjalJlq6vTl+oFFmLRZ0a0zfF34mM5NTUMjdB
 FAAxEKWEmspNapDT/W0zCILRxWUVAlDBCTMMrYchXR/BdZ+K+UDVf1otC89wffrflMCv
 //+VRaBT1QkIfn0fSNBkjq+cMyYDrb2GW5/bcBfwJxQKhwaSN1OdUt9M0TbLV+K7H8Df
 XDHTaCRq8Z9NDRYkaWg0bVNcVGo/JHbYeWzdraXZC+jcyKw1MU+bMx2FhCdjUqeo4yKN
 X4nYog8J27z/+W+Yp4b2pE8kuwaEeYcxY6+bUSIO760d/dnK//WCGCO2dlTz4TcXIf3V
 MDUQ==
X-Gm-Message-State: ACrzQf0NMtPfOPhdQOmnU/PsosgFjdVIhTcwfhBv/vheEKtdIrlNrkhH
 IZ0GXr/bwHzfCJmKlFLIrFY=
X-Google-Smtp-Source: AMsMyM5sbV5SFly/AwumCvNfkgH6wggl0rXYmoTZ/ws/1/9UFfhTbgh5LuL4LohxUTpqs4A7xUl2Hw==
X-Received: by 2002:aa7:cd4f:0:b0:458:6077:c3ac with SMTP id
 v15-20020aa7cd4f000000b004586077c3acmr11616385edw.32.1666031424966; 
 Mon, 17 Oct 2022 11:30:24 -0700 (PDT)
Received: from [192.168.2.4] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a170906d11600b0078d2d5b90f4sm6481422ejz.32.2022.10.17.11.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 11:30:24 -0700 (PDT)
Message-ID: <c4bf7723-b3b8-0955-5ba3-e4d05bdc835a@gmail.com>
Date: Mon, 17 Oct 2022 20:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [BUG] [PATCH] drm/rockchip: use generic fbdev setup
To: Heiko Stuebner <heiko@sntech.de>, John Keeping <john@metanate.com>
References: <20211029115014.264084-1-john@metanate.com>
 <d814394b-86c3-beb1-ddd4-04c65004f138@gmail.com> <Y00o3M7SKAB/w9sW@donbot>
 <2220890.jZfb76A358@phil>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <2220890.jZfb76A358@phil>
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/17/22 13:29, Heiko Stuebner wrote:
> Am Montag, 17. Oktober 2022, 12:05:16 CEST schrieb John Keeping:
>> Hi Johan,
>>
>> On Mon, Oct 17, 2022 at 10:11:32AM +0200, Johan Jonker wrote:
>>> Your patch contribution causes a kernel panic on MK808 with Rockchip rk3066a SoC.
>>> Would you like to contribute to fix this issue?
>>> The assumtion that drm_fbdev_generic_setup() does what rockchip_drm_fbdev_init did is not true!
>>> A revert makes it work again.
>>

>> It looks like there are 3 different ways to end up with -ENOMEM here,
>> can you track down whether you're hitting one of the cases in
>> rockchip_gem_prime_vmap() or if it's the iosys_map_is_null case in
>> drm_gem_vmap()?

It looks like it comes from rockchip_gem_prime_vmap() second return (2).

====



int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
{
	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);

	if (rk_obj->pages) {
		void *vaddr = vmap(rk_obj->pages, rk_obj->num_pages, VM_MAP,
				  pgprot_writecombine(PAGE_KERNEL));
		if (!vaddr) {
			printk("FBDEV rockchip_gem_prime_vmap 1");
			return -ENOMEM;
		}
		iosys_map_set_vaddr(map, vaddr);
		return 0;
	}

	if (rk_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING) {

////////////////

		printk("FBDEV rockchip_gem_prime_vmap 2");

////////////////
		return -ENOMEM;
	}
	iosys_map_set_vaddr(map, rk_obj->kvaddr);

	return 0;
}

====

[    7.678392] [drm:drm_client_modeset_probe] connector 39 enabled? yes
[    7.678435] [drm:drm_client_modeset_probe] Not using firmware configuration
[    7.678465] [drm:drm_client_modeset_probe] looking for cmdline mode on connector 39
[    7.678494] [drm:drm_client_modeset_probe] looking for preferred mode on connector 39 0
[    7.678521] [drm:drm_client_modeset_probe] found mode 1920x1080
[    7.678545] [drm:drm_client_modeset_probe] picking CRTCs for 1920x1080 config
[    7.678585] [drm:drm_client_modeset_probe] desired mode 1920x1080 set on crtc 35 (0,0)
[    7.801673] Console: switching to colour frame buffer device 240x67


[    7.811047] FBDEV rockchip_gem_prime_vmap 2


[    7.811071] ------------[ cut here ]------------
[    7.811084] WARNING: CPU: 0 PID: 35 at drivers/gpu/drm/drm_fb_helper.c:471 drm_fb_helper_damage_work+0x138/0x3b4
[    7.811198] rockchip-drm display-subsystem: Damage blitter failed: ret=-12
[    7.811219] Modules linked in:
[    7.811244] CPU: 0 PID: 35 Comm: kworker/0:4 Not tainted 6.0.0-next-20221013+ #46
[    7.811281] Hardware name: Rockchip (Device Tree)
[    7.811300] Workqueue: events drm_fb_helper_damage_work
[    7.811352] Backtrace: 
[    7.811370]  dump_backtrace from show_stack+0x20/0x24
[    7.811431]  r7:000001d7 r6:00000009 r5:c0b2bc60 r4:60000013
[    7.811444]  show_stack from dump_stack_lvl+0x48/0x54
[    7.811512]  dump_stack_lvl from dump_stack+0x18/0x1c
[    7.811580]  r5:c0586064 r4:c0b6374c
[    7.811590]  dump_stack from __warn+0xdc/0x154
[    7.811677]  __warn from warn_slowpath_fmt+0xa4/0xd8
[    7.811740]  r7:000001d7 r6:c0b6374c r5:c1004ec8 r4:c0b639e8
[    7.811750]  warn_slowpath_fmt from drm_fb_helper_damage_work+0x138/0x3b4
[    7.811821]  r9:ef7cf105 r8:c15dfc00 r7:fffffff4 r6:c200b490 r5:c1004ec8 r4:c200b494
[    7.811833]  drm_fb_helper_damage_work from process_one_work+0x230/0x518
[    7.811912]  r10:c110d140 r9:ef7cf105 r8:00000000 r7:ef7cf100 r6:ef7cbf00 r5:c200e300
[    7.811927]  r4:c200b494
[    7.811936]  process_one_work from worker_thread+0x54/0x554
[    7.811991]  r10:ef7cbf00 r9:00000008 r8:c1003d40 r7:ef7cbf1c r6:c200e318 r5:ef7cbf00
[    7.812006]  r4:c200e300
[    7.812015]  worker_thread from kthread+0xe8/0x104
[    7.812100]  r10:f0929e84 r9:c200da00 r8:c169aa80 r7:c200e300 r6:c01419e4 r5:00000000
[    7.812114]  r4:c200d780
[    7.812124]  kthread from ret_from_fork+0x14/0x2c
[    7.812178] Exception stack(0xf092dfb0 to 0xf092dff8)
[    7.812205] dfa0:                                     00000000 00000000 00000000 00000000
[    7.812232] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.812255] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    7.812282]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c01491a8
[    7.812299]  r4:c200d780 r3:00000001
[    7.812309] ---[ end trace 0000000000000000 ]---
[    7.812336] FBDEV rockchip_gem_prime_vmap 2
[    7.889795] FBDEV rockchip_gem_prime_vmap 2
[    7.890418] FBDEV rockchip_gem_prime_vmap 2
[    7.899447] FBDEV rockchip_gem_prime_vmap 2
[    7.905252] FBDEV rockchip_gem_prime_vmap 2

>>
>> I guess the memory usage increases slightly using the generic code and
>> RK3066 has less memory available.
> 
> also rk3066 and rk3188 do not have an iommu, so rely
> on cma allocations.
> 
> 
> Heiko
> 
> 
