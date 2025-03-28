Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD29EA7499E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 13:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5B410E9FD;
	Fri, 28 Mar 2025 12:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwUA48Te";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592E410E9F3;
 Fri, 28 Mar 2025 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743163933; x=1774699933;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=aI17PhfzxUFtXMMSpU7j51nO5Jv6yf8FWETH7YRK484=;
 b=QwUA48Tel/K/akjgUJEACZAT2a7oE3binvCpPrvRcKkuWq2fa9Nb5ZY1
 nc/AILE55CA5JqjTsylA6a0ovahcNbtgTOhVntTxE6TfyFpvo6sQFxLzF
 a7lJLgdS/RPeJQUQLZVWx6GURhDQNSr4vxYnHrIBh0Hf8meIEL7Alord/
 IvldlCs8jq1X8Xs+EoQiTiqtRv4Toj8SAL5dsPz3kh7vBowFP8EyHDPxS
 +CJVut+Fwte6/LPje8UhSwxa4vOdmk4NtWnckEpfGLWcbJPJlhHSshkqz
 R0xReIoitGmygfKwJFlKPdt9I2vDUY7s8b2bNMm1us2QrosJN2rvCdYiX A==;
X-CSE-ConnectionGUID: J8Gdw+rETGmTPU4pLCzpOw==
X-CSE-MsgGUID: V5eMKHPKQza/qDB187vV0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48305202"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="48305202"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:12:12 -0700
X-CSE-ConnectionGUID: W7U6HxUpSIiv7walFczvRw==
X-CSE-MsgGUID: 1uSLAHMYTOiHDRQP0NnMOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="162668478"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.186.10])
 ([10.247.186.10])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:12:10 -0700
Message-ID: <96dbd126-32d5-49a9-9b05-9b81d02fc5a6@linux.intel.com>
Date: Fri, 28 Mar 2025 17:42:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Generate CPER records for RAS and commit to CPER
 ring
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: Hawking.Zhang@amd.com, tao.zhou1@amd.com, Xiang Liu <xiang.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, "airlied@gmail.com" <airlied@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 ckoenig.leichtzumerken@gmail.com,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 simona@ffwll.ch,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <cover.1739519672.git.xiang.liu@amd.com>
 <fd1e4ddf-f123-4e72-beb8-1308bf7c32ab@linux.intel.com>
Content-Language: en-US
In-Reply-To: <fd1e4ddf-f123-4e72-beb8-1308bf7c32ab@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

++ dri-devel

On 28-03-2025 15:57, Aravind Iddamsetty wrote:
> Hi,
>
> Based on the discussions around using Netlink for RAS purposes, as
> summarized in this blog post [1] by Dave Airlie. I had proposed a series
> regarding RAS infrastructure in DRM [2].
>
> I came across your work, which appears to address related areas and I'm
> particularly interested in understanding how it aligns with or could be
> adapted to the ongoing discussions around leveraging Netlink for RAS.
>
> Could you share your perspective on the potential integration of your
> efforts with Netlink? Do you foresee any challenges or opportunities in
> aligning with the approach discussed in the above-mentioned blog post
> and series?
>
> Looking forward to your insights and any additional thoughts you may
> have on this topic.
>
>
> [1]
> https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
>
> [2]
> https://lore.kernel.org/all/20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com/
>
>
> Thanks,
> Aravind.
> On 14-02-2025 13:37, Xiang Liu wrote:
>> This patch series generate RAS CPER records for UE/DE/CE/BP threshold exceed
>> event. SMU_TYPE_CE banks are combined into 1 CPER entry, they could be CEs or
>> DEs or both. UEs and BPs are encoded into separate CPER entries.
>>
>> RAS CPER records for CEs will be generated only after CEs count been queried.
>>
>> All records are committed to a pure software ring with a limit size, new records
>> will flush older records when overflow happened. User can access the records by
>> reading debugfs node, which is read-only.
>>
>> Hawking Zhang (5):
>>   drm/amd/include: Add amd cper header
>>   drm/amdgpu: Introduce funcs for populating CPER
>>   drm/amdgpu: Include ACA error type in aca bank
>>   drm/amdgpu: Introduce funcs for generating cper record
>>   drm/amdgpu: Generate cper records
>>
>> Tao Zhou (4):
>>   drm/amdgpu: add RAS CPER ring buffer
>>   drm/amdgpu: read CPER ring via debugfs
>>   drm/amdgpu: add data write function for CPER ring
>>   drm/amdgpu: add mutex lock for cper ring
>>
>> Xiang Liu (3):
>>   drm/amdgpu: Get timestamp from system time
>>   drm/amdgpu: Commit CPER entry
>>   drm/amdgpu: Generate bad page threshold cper records
>>
>>  drivers/gpu/drm/amd/amdgpu/Makefile        |   2 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   4 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c    |  46 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h    |  16 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c   | 559 +++++++++++++++++++++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h   | 104 ++++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   4 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c   |  91 +++-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   1 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |   2 +
>>  drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c |   3 +-
>>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c    |   2 +
>>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c   |   2 +
>>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c    |   2 +
>>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c   |   2 +
>>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.c     |   1 +
>>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c    |   2 +
>>  drivers/gpu/drm/amd/include/amd_cper.h     | 269 ++++++++++
>>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c        |   3 +
>>  19 files changed, 1075 insertions(+), 40 deletions(-)
>>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
>>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h
>>  create mode 100644 drivers/gpu/drm/amd/include/amd_cper.h
>>
