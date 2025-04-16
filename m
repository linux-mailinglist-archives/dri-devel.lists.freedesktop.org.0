Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B7A8B5B4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B0410E8B8;
	Wed, 16 Apr 2025 09:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUvnNETE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8859E10E8B7;
 Wed, 16 Apr 2025 09:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744796412; x=1776332412;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to;
 bh=UTG7o7XbcrWkR4laC3vTAIXBBTqvIzi71RoNslXX7m0=;
 b=BUvnNETEkyOX6t0pw/PASI4n8JTXhPUFmN+NcYQxULiceB+1NL6EnvEQ
 A2NB95BofRs8+gTSnS/vI7C++9+bxE8fQ6sAysE7PAGOSh9tU7qlbGGXi
 kgY5EgQS+49y8xtJaoESyaTGBaHFMJn7Eb+CKYrWdFfbUki+620ldvASm
 jxyXIc71SnhhSVjOWrwUA7nRPVd74YtM9gC/ftdSeG0dHwGrXZNEs31/O
 E5EtDdfUwO68n1fY2gsrdp/P3QEJrt3ssBOUvEqdzzrqGHZsaMXLuRUyo
 HSj8QwkXdYPwGHDiAHQQmRCgetrhgj0bH8T+VAlYHoRzRxRBmCZ5NcNOo g==;
X-CSE-ConnectionGUID: rdBnNvhCSY6a8y99bObKeA==
X-CSE-MsgGUID: oLviDUrNRJOg5EioRTSDvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45471242"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208,217";a="45471242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:40:12 -0700
X-CSE-ConnectionGUID: +OSeK5O+SZKFJ5pjtXcd1A==
X-CSE-MsgGUID: p7AijJM3RDmtFOJWcR6Y7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
 d="scan'208,217";a="130425674"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.248.61])
 ([10.247.248.61])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:40:09 -0700
Content-Type: multipart/alternative;
 boundary="------------Fq13QhNeE32Y050I4OwnKCcB"
Message-ID: <36339411-c879-41ab-b0c2-6a029dd1a9f3@linux.intel.com>
Date: Wed, 16 Apr 2025 15:10:06 +0530
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
 <96dbd126-32d5-49a9-9b05-9b81d02fc5a6@linux.intel.com>
Content-Language: en-US
In-Reply-To: <96dbd126-32d5-49a9-9b05-9b81d02fc5a6@linux.intel.com>
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

This is a multi-part message in MIME format.
--------------Fq13QhNeE32Y050I4OwnKCcB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I would appreciate it if you could kindly let me know your thoughts.

Thanks,
Aravind.
On 28-03-2025 17:42, Aravind Iddamsetty wrote:
> ++ dri-devel
>
> On 28-03-2025 15:57, Aravind Iddamsetty wrote:
>> Hi,
>>
>> Based on the discussions around using Netlink for RAS purposes, as
>> summarized in this blog post [1] by Dave Airlie. I had proposed a series
>> regarding RAS infrastructure in DRM [2].
>>
>> I came across your work, which appears to address related areas and I'm
>> particularly interested in understanding how it aligns with or could be
>> adapted to the ongoing discussions around leveraging Netlink for RAS.
>>
>> Could you share your perspective on the potential integration of your
>> efforts with Netlink? Do you foresee any challenges or opportunities in
>> aligning with the approach discussed in the above-mentioned blog post
>> and series?
>>
>> Looking forward to your insights and any additional thoughts you may
>> have on this topic.
>>
>>
>> [1]
>> https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
>>
>> [2]
>> https://lore.kernel.org/all/20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com/
>>
>>
>> Thanks,
>> Aravind.
>> On 14-02-2025 13:37, Xiang Liu wrote:
>>> This patch series generate RAS CPER records for UE/DE/CE/BP threshold exceed
>>> event. SMU_TYPE_CE banks are combined into 1 CPER entry, they could be CEs or
>>> DEs or both. UEs and BPs are encoded into separate CPER entries.
>>>
>>> RAS CPER records for CEs will be generated only after CEs count been queried.
>>>
>>> All records are committed to a pure software ring with a limit size, new records
>>> will flush older records when overflow happened. User can access the records by
>>> reading debugfs node, which is read-only.
>>>
>>> Hawking Zhang (5):
>>>   drm/amd/include: Add amd cper header
>>>   drm/amdgpu: Introduce funcs for populating CPER
>>>   drm/amdgpu: Include ACA error type in aca bank
>>>   drm/amdgpu: Introduce funcs for generating cper record
>>>   drm/amdgpu: Generate cper records
>>>
>>> Tao Zhou (4):
>>>   drm/amdgpu: add RAS CPER ring buffer
>>>   drm/amdgpu: read CPER ring via debugfs
>>>   drm/amdgpu: add data write function for CPER ring
>>>   drm/amdgpu: add mutex lock for cper ring
>>>
>>> Xiang Liu (3):
>>>   drm/amdgpu: Get timestamp from system time
>>>   drm/amdgpu: Commit CPER entry
>>>   drm/amdgpu: Generate bad page threshold cper records
>>>
>>>  drivers/gpu/drm/amd/amdgpu/Makefile        |   2 +-
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   4 +
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c    |  46 +-
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h    |  16 +-
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c   | 559 +++++++++++++++++++++
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h   | 104 ++++
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   4 +
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c   |  91 +++-
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   1 +
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |   2 +
>>>  drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c |   3 +-
>>>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c    |   2 +
>>>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c   |   2 +
>>>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c    |   2 +
>>>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c   |   2 +
>>>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.c     |   1 +
>>>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c    |   2 +
>>>  drivers/gpu/drm/amd/include/amd_cper.h     | 269 ++++++++++
>>>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c        |   3 +
>>>  19 files changed, 1075 insertions(+), 40 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
>>>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h
>>>  create mode 100644 drivers/gpu/drm/amd/include/amd_cper.h
>>>
--------------Fq13QhNeE32Y050I4OwnKCcB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p><span
style="color: oklch(0.304 0.04 213.681); font-family: fkGroteskNeue, &quot;fkGroteskNeue Fallback&quot;, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: oklch(0.99 0.004 106.471); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">I
        would appreciate it if you could kindly let me know your
        thoughts.</span></p>
    Thanks,<br>
    Aravind.
    <div class="moz-cite-prefix">On 28-03-2025 17:42, Aravind Iddamsetty
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:96dbd126-32d5-49a9-9b05-9b81d02fc5a6@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">++ dri-devel

On 28-03-2025 15:57, Aravind Iddamsetty wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi,

Based on the discussions around using Netlink for RAS purposes, as
summarized in this blog post [1] by Dave Airlie. I had proposed a series
regarding RAS infrastructure in DRM [2].

I came across your work, which appears to address related areas and I'm
particularly interested in understanding how it aligns with or could be
adapted to the ongoing discussions around leveraging Netlink for RAS.

Could you share your perspective on the potential integration of your
efforts with Netlink? Do you foresee any challenges or opportunities in
aligning with the approach discussed in the above-mentioned blog post
and series?

Looking forward to your insights and any additional thoughts you may
have on this topic.


[1]
<a class="moz-txt-link-freetext" href="https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html">https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html</a>

[2]
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com/">https://lore.kernel.org/all/20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com/</a>


Thanks,
Aravind.
On 14-02-2025 13:37, Xiang Liu wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">This patch series generate RAS CPER records for UE/DE/CE/BP threshold exceed
event. SMU_TYPE_CE banks are combined into 1 CPER entry, they could be CEs or
DEs or both. UEs and BPs are encoded into separate CPER entries.

RAS CPER records for CEs will be generated only after CEs count been queried.

All records are committed to a pure software ring with a limit size, new records
will flush older records when overflow happened. User can access the records by
reading debugfs node, which is read-only.

Hawking Zhang (5):
  drm/amd/include: Add amd cper header
  drm/amdgpu: Introduce funcs for populating CPER
  drm/amdgpu: Include ACA error type in aca bank
  drm/amdgpu: Introduce funcs for generating cper record
  drm/amdgpu: Generate cper records

Tao Zhou (4):
  drm/amdgpu: add RAS CPER ring buffer
  drm/amdgpu: read CPER ring via debugfs
  drm/amdgpu: add data write function for CPER ring
  drm/amdgpu: add mutex lock for cper ring

Xiang Liu (3):
  drm/amdgpu: Get timestamp from system time
  drm/amdgpu: Commit CPER entry
  drm/amdgpu: Generate bad page threshold cper records

 drivers/gpu/drm/amd/amdgpu/Makefile        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c    |  46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h    |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c   | 559 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h   | 104 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c   |  91 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |   2 +
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c    |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c   |   2 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c    |   2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c   |   2 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c     |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c    |   2 +
 drivers/gpu/drm/amd/include/amd_cper.h     | 269 ++++++++++
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c        |   3 +
 19 files changed, 1075 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h
 create mode 100644 drivers/gpu/drm/amd/include/amd_cper.h

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Fq13QhNeE32Y050I4OwnKCcB--
