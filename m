Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A0714687
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 10:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B265010E238;
	Mon, 29 May 2023 08:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44A2410E252;
 Mon, 29 May 2023 08:47:26 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:48646.781382708
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 12A1C1029CA;
 Mon, 29 May 2023 16:47:20 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xwndj with ESMTP id
 5eb6a03bf806461c96e85b2ce55adcc0 for jani.nikula@linux.intel.com; 
 Mon, 29 May 2023 16:47:22 CST
X-Transaction-ID: 5eb6a03bf806461c96e85b2ce55adcc0
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <970d2cff-f181-d933-8ce3-b1dbe7f90fd8@189.cn>
Date: Mon, 29 May 2023 16:47:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915_drm.h: fix a typo
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230529074912.2070902-1-suijingfeng@loongson.cn>
 <874jnvimtf.fsf@intel.com>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <874jnvimtf.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/5/29 16:06, Jani Nikula wrote:
> On Mon, 29 May 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>   'rbiter' -> 'arbite'
> Should be arbiter.

Yeah, should be arbiter.

arbiter is a noun. Here, this arbiter may referrer to the 
drivers/pci/vgaarb.c.

Can you help correct then apply it ? thanks.

>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   include/drm/i915_drm.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/drm/i915_drm.h b/include/drm/i915_drm.h
>> index 7adce327c1c2..3dcb1db519ae 100644
>> --- a/include/drm/i915_drm.h
>> +++ b/include/drm/i915_drm.h
>> @@ -42,7 +42,7 @@ extern struct resource intel_graphics_stolen_res;
>>    * The Bridge device's PCI config space has information about the
>>    * fb aperture size and the amount of pre-reserved memory.
>>    * This is all handled in the intel-gtt.ko module. i915.ko only
>> - * cares about the vga bit for the vga rbiter.
>> + * cares about the vga bit for the vga arbite.
>>    */
>>   #define INTEL_GMCH_CTRL		0x52
>>   #define INTEL_GMCH_VGA_DISABLE  (1 << 1)
