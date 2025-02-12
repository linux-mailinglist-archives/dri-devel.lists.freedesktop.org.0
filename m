Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE5A326F4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 14:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA7110E894;
	Wed, 12 Feb 2025 13:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StHu5oJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC1910E894
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739366834; x=1770902834;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OAi4RwNqYyev5qIhSwLtR6EaMjJCbdN5mnJd+kQaDdA=;
 b=StHu5oJ4y1na7YQsUc1/zRCwrg3EMbGt2NNfLtJoDw9JcYRxylLqzR60
 SUq5NvDS/pzL8URe9bmtZ8usDNvwTThVyeG33wtJM2/ctNX4LaZKbiqIM
 wNLtci1hMSMDauEXh74OZ0RMA0k3W5bzrjKHA3hDJtlJPz6SbN3zhC2I9
 OVpQwYD+sarA1ETftVf6yoJDIrLmouxVVZWhYxaAH+UEJoF5LyAUW9fwa
 ggit9swH56BhywHA425wlMOw2JrwbfVCuR1HaJin9IIQcz7nBJ2y4QyUZ
 Hlkunts0SAuNDQHrTIHx0TWnaGsgOSchBFTnL1CXcSRu/uUbPBtRyAXOX w==;
X-CSE-ConnectionGUID: 8OA4qUQhT3GWaWiX3H/GKQ==
X-CSE-MsgGUID: tf8rd8unQJqxxm2N6AtKew==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27617301"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="27617301"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:27:14 -0800
X-CSE-ConnectionGUID: aQCKmCkIQ+mkIflux8eL+A==
X-CSE-MsgGUID: rUQOCzzQRY2BQ1xpQuHUCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113327576"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:27:10 -0800
Message-ID: <ef58703e-75c8-4b35-8acc-4bd79abbb150@linux.intel.com>
Date: Wed, 12 Feb 2025 14:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] accel/ivpu: Changes for 6.15 2025-02-04
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <c6537153-d03b-4b9b-8fdf-ff437512404e@suse.de>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c6537153-d03b-4b9b-8fdf-ff437512404e@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for your detailed feedback and constructive suggestions. I appreciate this as it is not easy to learn all process details otherwise.

On 2/12/2025 11:20 AM, Thomas Zimmermann wrote:
> Hi,
> 
> here's a complaint about the lack of process and documentation in accel/, and ivpu specifically. I came across this series while preparing the weekly PR for drm-misc-next and found myself unable to extract much useful information to report. This is a problem for a development process that relies on transparency, accountability and collaboration. Other problematic examples are at [1] and [2]. IIRC I had similar issues in previous development cycles.
> 
> I cannot assess the quality of the code itself, but the process and documentation involved does not meet the requirements.
> 
> - 'Changes for <version>' is not an meaningful description for a patch series. It's not the submitter (or anyone else) deciding that this series gets merged into version so-and-so. The series gets merged when it is ready to be merged.
> 
> - Apparently this series contains 3 different things (buffer imports, locking, debugging); so it should be 3 series with each addressing one of these topics.
> 
> - The series' description just restates the patch descriptions briefly. It should rather give some indication of the problem being solved by the contained patches, and context on why this is worth solving. (I know that this is often complicated to state clearly to outsiders.)

We were sometimes using patchsets to bundle patches that were tested together. We apologize for any confusion this may have caused, as we were not aware that this approach was not preferred. Moving forward, we will ensure that patches are split into separate series, each addressing a specific topic. I hope this will help improve clarity and make it easier to understand and assess the changes.

> - Review should be public. I understand that it's often only one dev team working on a specific driver, discussing issues internally. Still it makes sense to do the code reviews in public, so that others can follow what is going on in the driver. Public code reviews are also necessary to establish consent and institutional knowledge within the wider developer community. You miss that with internal reviews.
> 
> - These patches come with R-b tags pre-applied. Even for trivial changes, R-b tags should given in public. If the R-bs have been given elsewhere, please include a reference to that location. The tags (R-b, A-b, T-b, etc) are not just for verifying the code itself. They also establish trust in the development process involving each patch; and in the developers involved in that process. This needs to happen in public to be effective.

We value all public comments and typically wait a week for public reviews before submitting patches, regardless of whether an R-b tag is pre-applied. I was not aware that pre-applying R-b tags was an issue. We we will ensure that all R-b tags are added publicly from now on.

> - The kernel's (or any FOSS') development is organized around individuals, not organizations. Having each developer send their changes individually would likely resolve most of the current problems.
OK, I'll talk to the team about this.

> I understand that accel is not graphics and can feel somewhat detached from the rest of DRM. Yet it is part of the DRM subsystem. This development cycles' ivpu series' made me go to IRC and ask for accel/ to be removed from the drm-misc tree. Luckily the other maintainer were more charitable. So I make these remarks in good faith and hope that we can improve the processes within accel/.

I appreciate your feedback and would welcome more remarks. Please keep in mind that all accel drivers are new, and it takes time to learn all the upstream rules.
The kernel/DRM development process is quite unique, and not everything is fully documented. I find emails like this to be incredibly valuable and I am eager to comply with the guidelines.
I just need some patience and guidance as I navigate through this. Thank you for your understanding and support.

Regards,
Jacek

> Best regards
> Thomas
> 
> [1] https://patchwork.freedesktop.org/series/143182/
> [2] https://patchwork.freedesktop.org/series/144101/
> 
> 
> Am 04.02.25 um 09:46 schrieb Jacek Lawrynowicz:
>> Add possibility to import single buffer into multiple contexts,
>> fix locking when aborting contexts and add some debug features.
>>
>> Andrzej Kacprowski (2):
>>    accel/ivpu: Add missing locks around mmu queues
>>    accel/ivpu: Prevent runtime suspend during context abort work
>>
>> Karol Wachowski (3):
>>    ccel/ivpu: Add debugfs interface for setting HWS priority bands
>>    accel/ivpu: Add test modes to toggle clock relinquish disable
>>    accel/ivpu: Implement D0i2 disable test modea
>>
>> Tomasz Rusinowicz (1):
>>    accel/ivpu: Allow to import single buffer into multiple contexts
>>
>>   drivers/accel/ivpu/ivpu_debugfs.c | 84 +++++++++++++++++++++++++++++++
>>   drivers/accel/ivpu/ivpu_drv.c     |  2 +-
>>   drivers/accel/ivpu/ivpu_drv.h     |  4 ++
>>   drivers/accel/ivpu/ivpu_fw.c      |  4 ++
>>   drivers/accel/ivpu/ivpu_gem.c     | 43 ++++++++++++++++
>>   drivers/accel/ivpu/ivpu_gem.h     |  1 +
>>   drivers/accel/ivpu/ivpu_hw.c      | 31 ++++++++++++
>>   drivers/accel/ivpu/ivpu_hw.h      |  5 ++
>>   drivers/accel/ivpu/ivpu_job.c     | 10 +++-
>>   drivers/accel/ivpu/ivpu_jsm_msg.c | 29 ++++-------
>>   drivers/accel/ivpu/ivpu_mmu.c     |  9 ++++
>>   11 files changed, 202 insertions(+), 20 deletions(-)
>>
>> -- 
>> 2.45.1
> 

