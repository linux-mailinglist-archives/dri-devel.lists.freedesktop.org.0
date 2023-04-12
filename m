Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9406DF4C1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BD410E307;
	Wed, 12 Apr 2023 12:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866A610E2A0;
 Wed, 12 Apr 2023 12:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681301495; x=1712837495;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ewT/IrLeXzhwmk8e73q3/ULj13sZtuYMfUJ09TlK3Rs=;
 b=mP7D6/EWOW7Nj1eRrJ251nO0kIpSGJlAVBjYkd9cAOC3vkz/5jRWa6Mq
 KuTL0W1P/EI2qvVt1OzdWGALYqSSDIZIIPbbkW17rVE5pgnEy7T/SzDDl
 o8sqAENnxzlPKJ/kcLfdAEIdkKr6JsCmO3aiKk88lNq80w9LYYnKCmNIx
 DGXvLhgGvlAzilsfSHp9XnHN0vThviQdLhjsrd19/XvxZ/BaKVMhC3nri
 H2BNdlSw/mWO7O9ip+rwAJrv7GqnV118y/Vj9+8ElHw5i7Uyf5uTCfNtT
 N5E1UjpAKUYKbykgKg0ylPY4th5C4Hr8+jDQdvWVPkdlvRgbxaoyWPQjy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346550591"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="346550591"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 05:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="688934157"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688934157"
Received: from amurkovx-mobl.ger.corp.intel.com (HELO [10.213.229.123])
 ([10.213.229.123])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 05:11:28 -0700
Message-ID: <98bb3388-d671-dcf3-0247-649a702b5e11@linux.intel.com>
Date: Wed, 12 Apr 2023 13:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/7] drm: fdinfo memory stats
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <bbbbbf34-2ea5-5344-30db-f976c5198d75@amd.com>
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <bbbbbf34-2ea5-5344-30db-f976c5198d75@amd.com>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Evan Quan <evan.quan@amd.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/04/2023 10:34, Christian König wrote:
> Am 12.04.23 um 00:56 schrieb Rob Clark:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Similar motivation to other similar recent attempt[1].  But with an
>> attempt to have some shared code for this.  As well as documentation.
>>
>> It is probably a bit UMA-centric, I guess devices with VRAM might want
>> some placement stats as well.  But this seems like a reasonable start.
>>
>> Basic gputop support: https://patchwork.freedesktop.org/series/116236/
>> And already nvtop support: https://github.com/Syllo/nvtop/pull/204
>>
>> [1] https://patchwork.freedesktop.org/series/112397/
> 
> I think the extra client id looks a bit superfluous since the ino of the 
> file should already be unique and IIRC we have been already using that one.

Do you mean file_inode(struct drm_file->filp)->i_ino ? That one would be 
the same number for all clients which open the same device node so 
wouldn't work.

I also don't think the atomic_add_return for client id works either, 
since it can alias on overflow.

In i915 I use an xarray and __xa_alloc_cyclic.

Regards,

Tvrtko
