Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C566F1C1F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 18:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C69110E17E;
	Fri, 28 Apr 2023 16:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC04910E17E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 16:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id D90553F46E;
 Fri, 28 Apr 2023 18:00:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -4.155
X-Spam-Level: 
X-Spam-Status: No, score=-4.155 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.047, T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa3.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5r43vDgbINYw; Fri, 28 Apr 2023 18:00:37 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 79B803FB3A;
 Fri, 28 Apr 2023 18:00:36 +0200 (CEST)
Received: from [192.168.0.209] (unknown [134.191.232.81])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 008C3363210;
 Fri, 28 Apr 2023 18:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1682697635; bh=cpyZh8T+h8QBiANpBWAGmIkCnLsyPurWUI4Sx9sCIMI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hvr05EsqsDTen33Es0bwKwBXsQEwP2g1u3RPnesJ20M3Ix7DzLb/x8u534YMCaDYK
 mMij3SsdlZKy1QIdKS0CJ4oEgaSNS0ZH71hJk5rQNFZZ/j1SLm5sb7mTP54pwPwEbk
 SnslQPnWC5Qtec808OJH/R9lJD9pRY9Hzr9hnijk=
Content-Type: multipart/alternative;
 boundary="------------TBjWPXGSST10I4z0rAAYmFJq"
Message-ID: <73356be7-f57e-154a-e587-2785d62e61cd@shipmail.org>
Date: Fri, 28 Apr 2023 18:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/5] drm/i915: Allow user to set cache at BO creation
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230428054737.1765778-1-fei.yang@intel.com>
 <e1c73441-df6f-799c-eda0-8639067a0fea@shipmail.org>
 <BYAPR11MB25676E1468DEEB827E889DA39A6B9@BYAPR11MB2567.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <BYAPR11MB25676E1468DEEB827E889DA39A6B9@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------TBjWPXGSST10I4z0rAAYmFJq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/28/23 17:19, Yang, Fei wrote:
> > On 4/28/23 07:47, fei.yang@intel.com wrote:
> >> From: Fei Yang <fei.yang@intel.com>
> >>
> >> The first three patches in this series are taken from
> >> https://patchwork.freedesktop.org/series/116868/
> >> These patches are included here because the last patch
> >> has dependency on the pat_index refactor.
> >>
> >> This series is focusing on uAPI changes,
> >> 1. end support for set caching ioctl [PATCH 4/5]
> >> 2. add set_pat extension for gem_create [PATCH 5/5]
> >>
> >> v2: drop one patch that was merged separately
> >>      341ad0e8e254 drm/i915/mtl: Add PTE encode function
> >> v3: rebase on https://patchwork.freedesktop.org/series/117082/
> >
> > Hi, Fei.
> >
> > Does this uAPI update also affect any discrete GPUs supported by i915,
>
> It does.
>
> > And in that case, does it allow setting non-snooping PAT indices on
> > those devices?
>
> It allows setting PAT indices specified in
> KMD does a sanity check so that it won't go over the max recommended
> by bspec.
>
> > If so, since the uAPI for discrete GPU devices doesn't allow incoherency
> > between GPU and CPU (apart from write-combining buffering), the correct
> > CPU caching mode matching the PAT index needs to be selected for the
> > buffer object in i915_ttm_select_tt_caching().
>
> The patch doesn't affect the CPU caching mode setting logic though.
> And the caching settings for objects created by kernel should remain
> the same for both CPU and GPU, objects created by userspace are
> managed completely by userspace.
>
> One question though, what do you mean by non-snooping PAT indices?
> The PAT index registers don't really control coherency mode in the past,
> I believe MTL is the first one that has COH_MODE in the PAT registers.
> Aren't discrete GPUs snooping CPU cache automatically?

Yes, that was actually the bottom question: What do these PAT settings 
allow you to do WRT the snooping on supported discrete devices (DG2) on 
i915?

If they indeed don't allow disabling snooping, then that's not a 
problem. If they do, the ttm code there needs some modification.


Thanks,

Thomas



>
> -Fei
>
> > Thanks,
> > Thomas
> >
> >>
> >> Fei Yang (5):
> >>    drm/i915: preparation for using PAT index
> >>    drm/i915: use pat_index instead of cache_level
> >>    drm/i915: make sure correct pte encode is used
> >>    drm/i915/mtl: end support for set caching ioctl
> >>    drm/i915: Allow user to set cache at BO creation
> >>
> >> drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--
> >> drivers/gpu/drm/i915/gem/i915_gem_create.c    | 36 +++++++++
> >> drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 46 ++++++-----
> >> .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-
> >> drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
> >> drivers/gpu/drm/i915/gem/i915_gem_object.c    | 67 +++++++++++++++-
> >> drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
> >> .../gpu/drm/i915/gem/i915_gem_object_types.h  | 26 +++++-
> >> drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  9 ++-
> >> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
> >> drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
> >> drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 16 ++--
> >> .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
> >> .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
> >> .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
> >> drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
> >> drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 73 +++++++++--------
> >> drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-
> >> drivers/gpu/drm/i915/gt/intel_ggtt.c          | 76 +++++++++---------
> >> drivers/gpu/drm/i915/gt/intel_gtt.h           | 20 +++--
> >>   drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
> >> drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
> >> drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +-
> >> drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 +++++------
> >> drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
> >> drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
> >> drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
> >> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
> >> drivers/gpu/drm/i915/i915_debugfs.c           | 55 ++++++++++---
> >> drivers/gpu/drm/i915/i915_gem.c               | 16 +++-
> >> drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-
> >> drivers/gpu/drm/i915/i915_pci.c               | 79 ++++++++++++++++---
> >> drivers/gpu/drm/i915/i915_vma.c               | 16 ++--
> >> drivers/gpu/drm/i915/i915_vma.h               |  2 +-
> >> drivers/gpu/drm/i915/i915_vma_types.h         |  2 -
> >> drivers/gpu/drm/i915/intel_device_info.h      |  5 ++
> >> drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +-
> >> .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +-
> >> drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 15 ++--
> >> .../drm/i915/selftests/intel_memory_region.c  |  4 +-
> >> .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 +++
> >> drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-
> >> include/uapi/drm/i915_drm.h                   | 36 +++++++++
> >> tools/include/uapi/drm/i915_drm.h             | 36 +++++++++
> >>   44 files changed, 621 insertions(+), 243 deletions(-)
> >>
>
--------------TBjWPXGSST10I4z0rAAYmFJq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/28/23 17:19, Yang, Fei wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BYAPR11MB25676E1468DEEB827E889DA39A6B9@BYAPR11MB2567.namprd11.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof
        ContentPasted0 ContentPasted2">
        &gt; On 4/28/23 07:47, <a class="moz-txt-link-abbreviated" href="mailto:fei.yang@intel.com">fei.yang@intel.com</a> wrote:
        <div class="ContentPasted0">&gt;&gt; From: Fei Yang
          <a class="moz-txt-link-rfc2396E" href="mailto:fei.yang@intel.com">&lt;fei.yang@intel.com&gt;</a></div>
        <div class="ContentPasted0">&gt;&gt;</div>
        <div class="ContentPasted0">&gt;&gt; The first three patches in
          this series are taken from</div>
        <div class="ContentPasted0">&gt;&gt;
          <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/116868/">https://patchwork.freedesktop.org/series/116868/</a></div>
        <div class="ContentPasted0">&gt;&gt; These patches are included
          here because the last patch</div>
        <div class="ContentPasted0">&gt;&gt; has dependency on the
          pat_index refactor.</div>
        <div class="ContentPasted0">&gt;&gt;</div>
        <div class="ContentPasted0">&gt;&gt; This series is focusing on
          uAPI changes,</div>
        <div class="ContentPasted0">&gt;&gt; 1. end support for set
          caching ioctl [PATCH 4/5]</div>
        <div class="ContentPasted0">&gt;&gt; 2. add set_pat extension
          for gem_create [PATCH 5/5]</div>
        <div class="ContentPasted0">&gt;&gt;</div>
        <div class="ContentPasted0">&gt;&gt; v2: drop one patch that was
          merged separately</div>
        <div class="ContentPasted0">&gt;&gt;      341ad0e8e254
          drm/i915/mtl: Add PTE encode function</div>
        <div class="ContentPasted0">&gt;&gt; v3: rebase on
          <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/117082/">https://patchwork.freedesktop.org/series/117082/</a></div>
        <div class="ContentPasted0">&gt;</div>
        <div class="ContentPasted0">&gt; Hi, Fei.</div>
        <div class="ContentPasted0">&gt;</div>
        <div class="ContentPasted0">&gt; Does this uAPI update also
          affect any discrete GPUs supported by i915,</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">It does.</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">&gt; And in that case, does it allow
          setting non-snooping PAT indices on</div>
        <div class="ContentPasted0">&gt; those devices?</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">It allows setting PAT indices
          specified in <br>
        </div>
        <div class="ContentPasted0">KMD does a sanity check so that it
          won't go over the max recommended</div>
        <div class="ContentPasted0">by bspec.</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">&gt; If so, since the uAPI for
          discrete GPU devices doesn't allow incoherency</div>
        <div class="ContentPasted0">&gt; between GPU and CPU (apart from
          write-combining buffering), the correct</div>
        <div class="ContentPasted0">&gt; CPU caching mode matching the
          PAT index needs to be selected for the</div>
        <div class="ContentPasted0">&gt; buffer object in
          i915_ttm_select_tt_caching().</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">The patch doesn't affect the CPU
          caching mode setting logic though.</div>
        <div class="ContentPasted0">And the caching settings for objects
          created by kernel should remain</div>
        <div class="ContentPasted0">the same for both CPU and GPU,
          objects created by userspace are</div>
        <div class="ContentPasted0">managed completely by userspace.</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">One question though, what do you
          mean by non-snooping PAT indices?</div>
        <div class="ContentPasted0">The PAT index registers don't really
          control coherency mode in the past,</div>
        <div class="ContentPasted0">I believe MTL is the first one that
          has COH_MODE in the PAT registers.</div>
        <div class="ContentPasted0">Aren't discrete GPUs snooping CPU
          cache automatically?</div>
      </div>
    </blockquote>
    <p>Yes, that was actually the bottom question: What do these PAT
      settings allow you to do WRT the snooping on supported discrete
      devices (DG2) on i915?</p>
    <p>If they indeed don't allow disabling snooping, then that's not a
      problem. If they do, the ttm code there needs some modification.<br>
    </p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Thomas</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:BYAPR11MB25676E1468DEEB827E889DA39A6B9@BYAPR11MB2567.namprd11.prod.outlook.com">
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof
        ContentPasted0 ContentPasted2">
        <div class="ContentPasted1"><br>
        </div>
        <div class="ContentPasted1">-Fei</div>
        <div class="ContentPasted1"><br>
        </div>
        <div class="ContentPasted1">&gt; Thanks,</div>
        <div class="ContentPasted1">&gt; Thomas</div>
        <div class="ContentPasted1">&gt;</div>
        <div class="ContentPasted1">&gt;&gt;</div>
        <div class="ContentPasted1">&gt;&gt; Fei Yang (5):</div>
        <div class="ContentPasted1">&gt;&gt;    drm/i915: preparation
          for using PAT index</div>
        <div class="ContentPasted1">&gt;&gt;    drm/i915: use pat_index
          instead of cache_level</div>
        <div class="ContentPasted1">&gt;&gt;    drm/i915: make sure
          correct pte encode is used</div>
        <div class="ContentPasted1">&gt;&gt;    drm/i915/mtl: end
          support for set caching ioctl</div>
        <div class="ContentPasted1">&gt;&gt;    drm/i915: Allow user to
          set cache at BO creation</div>
        <div class="ContentPasted1">&gt;&gt;</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gem/i915_gem_create.c    | 36 +++++++++</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 46 ++++++-----</div>
        <div class="ContentPasted1">&gt;&gt;  
          .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gem/i915_gem_object.c    | 67
          +++++++++++++++-</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++</div>
        <div class="ContentPasted1">&gt;&gt;  
          .../gpu/drm/i915/gem/i915_gem_object_types.h  | 26 +++++-</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  9 ++-</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 16 ++--</div>
        <div class="ContentPasted1">&gt;&gt;  
          .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-</div>
        <div class="ContentPasted1">&gt;&gt;  
          .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-</div>
        <div class="ContentPasted1">&gt;&gt;  
          .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 73
          +++++++++--------</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gt/intel_ggtt.c          | 76
          +++++++++---------</div>
        <div class="ContentPasted1">&gt;&gt;  
          drivers/gpu/drm/i915/gt/intel_gtt.h           | 20 +++--</div>
        &gt;&gt;   drivers/gpu/drm/i915/gt/intel_migrate.c       | 47
        ++++++-----
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 +++++------</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/i915_debugfs.c           | 55
          ++++++++++---</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/i915_gem.c               | 16 +++-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/i915_pci.c               | 79
          ++++++++++++++++---</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/i915_vma.c               | 16 ++--</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/i915_vma.h               |  2 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/i915_vma_types.h         |  2 -</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/intel_device_info.h      |  5 ++</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 15 ++--</div>
        <div class="ContentPasted2">&gt;&gt;  
          .../drm/i915/selftests/intel_memory_region.c  |  4 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 +++</div>
        <div class="ContentPasted2">&gt;&gt;  
          drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-</div>
        <div class="ContentPasted2">&gt;&gt;  
          include/uapi/drm/i915_drm.h                   | 36 +++++++++</div>
        <div class="ContentPasted2">&gt;&gt;  
          tools/include/uapi/drm/i915_drm.h             | 36 +++++++++</div>
        <div class="ContentPasted2">&gt;&gt;   44 files changed, 621
          insertions(+), 243 deletions(-)</div>
        <div class="ContentPasted2">&gt;&gt;</div>
        <br>
      </div>
    </blockquote>
  </body>
</html>

--------------TBjWPXGSST10I4z0rAAYmFJq--
