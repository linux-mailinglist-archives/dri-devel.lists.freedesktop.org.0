Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89F674CE1E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C883810E1B8;
	Mon, 10 Jul 2023 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F3EC10E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:22:25 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Axjuuvsatkqf4CAA--.5933S3;
 Mon, 10 Jul 2023 15:22:23 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxJ82qsatkneYmAA--.43529S3; 
 Mon, 10 Jul 2023 15:22:21 +0800 (CST)
Message-ID: <e998547c-40ee-5a4f-d44e-dd039412af35@loongson.cn>
Date: Mon, 10 Jul 2023 15:22:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [drm-misc:drm-misc-next 2/3]
 drivers/gpu/drm/loongson/lsdc_plane.c:199
 lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced before
 check 'state' (see line 180)
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
References: <ff8f09e7-d8c3-4b02-ae76-47dbac830cdb@kadam.mountain>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <ff8f09e7-d8c3-4b02-ae76-47dbac830cdb@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxJ82qsatkneYmAA--.43529S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuFykJFWxCFWfXw1DCw1fXwc_yoW7ArW3pF
 4Ut34rAr17K3WkGrW0yr4akry5uw1rt3WUCw1qvr17KFyUta4aqrsrW39I9r43ArWUCwsI
 kF48Xrn8Kr4xKwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r10
 6r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07joMKZUUU
 UU=
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
Cc: lkp@intel.com, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/10 14:29, Dan Carpenter wrote:
> tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> head:   8d1077cf2e43b15fefd76ebec2b71541eb27ef2c
> commit: f39db26c54281da6a785259498ca74b5e470476f [2/3] drm: Add kms driver for loongson display controller
> config: i386-randconfig-m021-20230710 (https://download.01.org/0day-ci/archive/20230710/202307100423.rV7D05Uq-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230710/202307100423.rV7D05Uq-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202307100423.rV7D05Uq-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/loongson/lsdc_plane.c:199 lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced before check 'state' (see line 180)
>
> vim +/state +199 drivers/gpu/drm/loongson/lsdc_plane.c
>
> f39db26c54281d Sui Jingfeng 2023-06-15  174  static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
> f39db26c54281d Sui Jingfeng 2023-06-15  175  						struct drm_atomic_state *state)
> f39db26c54281d Sui Jingfeng 2023-06-15  176  {
> f39db26c54281d Sui Jingfeng 2023-06-15  177  	struct drm_plane_state *new_state;
> f39db26c54281d Sui Jingfeng 2023-06-15  178  	struct drm_crtc_state *crtc_state;
> f39db26c54281d Sui Jingfeng 2023-06-15  179
> f39db26c54281d Sui Jingfeng 2023-06-15 @180  	new_state = drm_atomic_get_new_plane_state(state, plane);
>                                                                                             ^^^^^
> state is dereferenced inside this function
>
> f39db26c54281d Sui Jingfeng 2023-06-15  181
> f39db26c54281d Sui Jingfeng 2023-06-15  182  	if (!plane->state || !plane->state->fb) {
> f39db26c54281d Sui Jingfeng 2023-06-15  183  		drm_dbg(plane->dev, "%s: state is NULL\n", plane->name);
> f39db26c54281d Sui Jingfeng 2023-06-15  184  		return -EINVAL;
> f39db26c54281d Sui Jingfeng 2023-06-15  185  	}
> f39db26c54281d Sui Jingfeng 2023-06-15  186
> f39db26c54281d Sui Jingfeng 2023-06-15  187  	if (new_state->crtc_w != new_state->crtc_h) {
> f39db26c54281d Sui Jingfeng 2023-06-15  188  		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
> f39db26c54281d Sui Jingfeng 2023-06-15  189  			new_state->crtc_w, new_state->crtc_h);
> f39db26c54281d Sui Jingfeng 2023-06-15  190  		return -EINVAL;
> f39db26c54281d Sui Jingfeng 2023-06-15  191  	}
> f39db26c54281d Sui Jingfeng 2023-06-15  192
> f39db26c54281d Sui Jingfeng 2023-06-15  193  	if (new_state->crtc_w != 64 && new_state->crtc_w != 32) {
> f39db26c54281d Sui Jingfeng 2023-06-15  194  		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
> f39db26c54281d Sui Jingfeng 2023-06-15  195  			new_state->crtc_w, new_state->crtc_h);
> f39db26c54281d Sui Jingfeng 2023-06-15  196  		return -EINVAL;
> f39db26c54281d Sui Jingfeng 2023-06-15  197  	}
> f39db26c54281d Sui Jingfeng 2023-06-15  198
> f39db26c54281d Sui Jingfeng 2023-06-15 @199  	if (state) {
>                                                      ^^^^^
> Checked too late


Yes, there no need to check here, simply writing the code as following 
is OK.


```
         crtc_state = drm_atomic_get_existing_crtc_state(state, 
new_state->crtc);
```

>
> f39db26c54281d Sui Jingfeng 2023-06-15  200  		crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
> f39db26c54281d Sui Jingfeng 2023-06-15  201  	} else {
> f39db26c54281d Sui Jingfeng 2023-06-15  202  		crtc_state = plane->crtc->state;
> f39db26c54281d Sui Jingfeng 2023-06-15  203  		drm_dbg(plane->dev, "%s: atomic state is NULL\n", plane->name);
> f39db26c54281d Sui Jingfeng 2023-06-15  204  	}
> f39db26c54281d Sui Jingfeng 2023-06-15  205
> f39db26c54281d Sui Jingfeng 2023-06-15  206  	if (!crtc_state->active)
> f39db26c54281d Sui Jingfeng 2023-06-15  207  		return -EINVAL;
> f39db26c54281d Sui Jingfeng 2023-06-15  208
> f39db26c54281d Sui Jingfeng 2023-06-15  209  	if (plane->state->crtc != new_state->crtc ||
> f39db26c54281d Sui Jingfeng 2023-06-15  210  	    plane->state->src_w != new_state->src_w ||
> f39db26c54281d Sui Jingfeng 2023-06-15  211  	    plane->state->src_h != new_state->src_h ||
> f39db26c54281d Sui Jingfeng 2023-06-15  212  	    plane->state->crtc_w != new_state->crtc_w ||
> f39db26c54281d Sui Jingfeng 2023-06-15  213  	    plane->state->crtc_h != new_state->crtc_h)
> f39db26c54281d Sui Jingfeng 2023-06-15  214  		return -EINVAL;
> f39db26c54281d Sui Jingfeng 2023-06-15  215
> f39db26c54281d Sui Jingfeng 2023-06-15  216  	if (new_state->visible != plane->state->visible)
> f39db26c54281d Sui Jingfeng 2023-06-15  217  		return -EINVAL;
> f39db26c54281d Sui Jingfeng 2023-06-15  218
> f39db26c54281d Sui Jingfeng 2023-06-15  219  	return drm_atomic_helper_check_plane_state(plane->state,
> f39db26c54281d Sui Jingfeng 2023-06-15  220  						   crtc_state,
> f39db26c54281d Sui Jingfeng 2023-06-15  221  						   DRM_PLANE_NO_SCALING,
> f39db26c54281d Sui Jingfeng 2023-06-15  222  						   DRM_PLANE_NO_SCALING,
> f39db26c54281d Sui Jingfeng 2023-06-15  223  						   true, true);
> f39db26c54281d Sui Jingfeng 2023-06-15  224  }
>

