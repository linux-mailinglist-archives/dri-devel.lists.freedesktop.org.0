Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC58669301
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 10:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667A610E9D3;
	Fri, 13 Jan 2023 09:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ADD10E9D3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673602373; x=1705138373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ELtkvQrk3GGqwDyBVnvUGWyu2qZpQz0v1Xx7KlzHHAk=;
 b=fjBHYipgKAwpNCdsPXksAGLExgwQ1cUw1GbSkPAHqrBp0GgM5M04ToOt
 +zf48ONSlOxyOMBv3Ly/EfmjGjYSB0rWezMVyEmrUN5w3QDs9vPahHiAF
 EqbKqWmsU9JZfY6CDxf56MmREMCyj191PPSSiYgDg3GI0oZUoetFwqybo
 eZyz9A4JcawGXWvIN25j3QwORNwk8sRmSlzPw+eZBOahtOl3MuL1F88RH
 EM4b+iadll8QL2U5jaU6l59mSR0++qPt7jqT98efbG9neDk2TsQQpFvXU
 QuDfuKvoaZ6jEyFuJS2GEfrUdBdkoRQnzBhIKCZkfbEM+iiLDH999jnRy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="351190515"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="351190515"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:32:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="651467286"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="651467286"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.132.57])
 ([10.249.132.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:32:49 -0800
Message-ID: <e3a63388-eb58-46a8-72b0-d7af6b387275@linux.intel.com>
Date: Fri, 13 Jan 2023 10:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 0/7] New DRM accel driver for Intel VPU
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 oded.gabbay@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <17ea1dc9-dc47-fcd4-ee77-668128937d72@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <17ea1dc9-dc47-fcd4-ee77-668128937d72@quicinc.com>
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12.01.2023 18:10, Jeffrey Hugo wrote:
> On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> This patchset contains a new Linux* Kernel Driver for Intel® VPUs.
>>
>> VPU stands for Versatile Processing Unit and it is an AI inference accelerator
>> integrated with Intel non-server CPUs starting from 14th generation.
>> VPU enables efficient execution of Deep Learning applications
>> like object detection, classification etc.
>>
>> The whole driver is licensed under GPL-2.0-only except for two headers imported
>> from the firmware that are MIT licensed.
>>
>> User mode driver was open sourced in December 2022 and it is available at:
>> https://github.com/intel/linux-vpu-driver
> 
> I feel like I forgot to mention this earlier because I can't find a reference to it in my mails.  I would like to see something in Documentation for this driver/device.  Would be nice to get an overview of how it works (system block diagram?), how it is intended to be used, etc.  Include relevant references.  This would be a great place to document the UMD and the compiler (I am positive you have mentioned the compiler before, but I am currently failing to find a reference to it).
> 
> I feel that traditional DRM gets away from not needing this since their stuff is pretty well established.  Everyone uses Mesa/igt and so how things are structured/used is fairly well implied.  Accel is brand new and doesn't have that yet so I suspect we'll be well situated if we take the extra effort to spell out these things which might be just assumed elsewhere.  Hopefully, over time, such documentation helps in identifying useful areas to build up the common code of the subsystem.
> 
> I can't justify holding up this series for this though.  Please put it on some todo list  :)

OK, I've added the documentation to TODO.
For now I will add info about the compiler to v6 cover letter.
It is available at https://github.com/openvinotoolkit/vpux-plugin.

Regards,
Jacek
