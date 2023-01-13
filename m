Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EBB6690AB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C841810E238;
	Fri, 13 Jan 2023 08:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A510D10E238
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673598216; x=1705134216;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lOlQW00JFUm3vGYgSvntzTwh9oj6owWcgfZMfApmYZ8=;
 b=ENeUr+pv/vEtzQaxe4cdKYNZdiaYjYj39jxOSnGcqCSflzTtMjpef67o
 WyrDYmMcJPIPiMcv1ZiYZ9WI79iXQ5E7li0maf3VkDOgRdkGV+nmww/si
 iEKVoP3zCJ0pLQaGfhGr7nCRn/HTbwsbIfC83uEjoDvnpmbtYXlHi3o4K
 8HYGyVIraUbXMzd5JomGgDqItPA5lS5i6HwTqbpxWkKsNR3O53UndVvKW
 dpr3HtkXHrH7UHH7gKW2kYdehbEhHZ7ca3OLLQjUUwrLDsX1iGMBVinYi
 bRuiKp6Jf1YqvS8bhAntMJQz8l11yuT+EfYx/Tl2IOHAyh+R3r1DIXV/0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="303642096"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="303642096"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 00:23:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="800528703"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="800528703"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.132.57])
 ([10.249.132.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 00:23:33 -0800
Message-ID: <acbba7d4-1c38-a3b2-9d51-1a8cd51f15ab@linux.intel.com>
Date: Fri, 13 Jan 2023 09:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 oded.gabbay@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-2-jacek.lawrynowicz@linux.intel.com>
 <2c8f58f3-1294-1c36-72c1-55349ff28309@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2c8f58f3-1294-1c36-72c1-55349ff28309@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: andrzej.kacprowski@linux.intel.com,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12.01.2023 18:34, Jeffrey Hugo wrote:
> On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
>> VPU stands for Versatile Processing Unit and it's a CPU-integrated
>> inference accelerator for Computer Vision and Deep Learning
>> applications.
>>
>> The VPU device consist of following components:
>>    - Buttress - provides CPU to VPU integration, interrupt, frequency and
>>      power management.
>>    - Memory Management Unit (based on ARM MMU-600) - translates VPU to
>>      host DMA addresses, isolates user workloads.
>>    - RISC based microcontroller - executes firmware that provides job
>>      execution API for the kernel-mode driver
>>    - Neural Compute Subsystem (NCS) - does the actual work, provides
>>      Compute and Copy engines.
>>    - Network on Chip (NoC) - network fabric connecting all the components
>>
>> This driver supports VPU IP v2.7 integrated into Intel Meteor Lake
>> client CPUs (14th generation).
>>
>> Module sources are at drivers/accel/ivpu and module name is
>> "intel_vpu.ko".
>>
>> This patch includes only very besic functionality:
>>    - module, PCI device and IRQ initialization
>>    - register definitions and low level register manipulation functions
>>    - SET/GET_PARAM ioctls
>>    - power up without firmware
>>
>> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo2quicinc.com>
> 
>> +static const struct file_operations ivpu_fops = {
>> +    .owner        = THIS_MODULE,
>> +    .open        = accel_open,
>> +    .release    = drm_release,
>> +    .unlocked_ioctl    = drm_ioctl,
>> +    .compat_ioctl    = drm_compat_ioctl,
>> +    .poll        = drm_poll,
>> +    .read        = drm_read,
>> +    .llseek        = noop_llseek,
>> +    .mmap           = drm_gem_mmap
>> +};
> 
> Hmm DEFINE_DRM_ACCEL_FOPS is not usable here because it doesn't define .mmap
> Feels like we should fix that and then simplify this.  Seems like a good todo item.

I think this should rather be on accel/drm TODO and not ivpu TODO list.
For the moment I can simplify the code to this:
static const struct file_operations ivpu_fops = {
	.owner		= THIS_MODULE,
	.mmap           = drm_gem_mmap,
	DRM_ACCEL_FOPS,
};

Still not perfect but nicer.

Regards,
Jacek

