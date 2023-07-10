Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3574CDD8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C1810E1B1;
	Mon, 10 Jul 2023 07:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 801B210E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:02:12 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxLOvxrKtk3fsCAA--.3442S3;
 Mon, 10 Jul 2023 15:02:09 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxzM7trKtk+uAmAA--.45449S3; 
 Mon, 10 Jul 2023 15:02:07 +0800 (CST)
Message-ID: <cfaa947b-0388-2464-6379-8b7ac2c57757@loongson.cn>
Date: Mon, 10 Jul 2023 15:02:05 +0800
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
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxzM7trKtk+uAmAA--.45449S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuFykJFWxCFWfXw1DCw1fXwc_yoW7Ar48pF
 4Ut34rAr12g3WkGrW0yr4akry5uw1rt3WUCw1qvr17KFyDta4aqrsrW39I9r43ArWUCwsI
 kF48Xrn8Kr4xKwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
 14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
 AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
 0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8PC
 zJUUUUU==
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


Thanks for testing,

What do you means about tell me this?

I means that would you like to help fixing this warning?

Or otherwise, I will fix this someday.


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

