Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D5C925EFD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 13:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CA310E7B8;
	Wed,  3 Jul 2024 11:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+DFD4NI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EA910E7B8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720007191; x=1751543191;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ccSSB5ntIgvLAQBJKwo1I+LWZkPdt11bRXA2in5N+ak=;
 b=m+DFD4NIfTIgHK4nnF6s9z2b2GVPz+6mKi1CNMQMgaD6Z4D6hAaKTl60
 24IqFDpLSVQioAdFg2wTtvNajS8g8f2MrftAr4yy9LGDyzuU3AjuCLWz8
 /ahsb8g1Tnddng5tioSQshI9xqUIhXzh2xNs9qxaVyHw4PF+gJN3g5d7k
 H7kFJwTNV8ASSdglrWonxOygvzPl+rrv/lYftXVBspY4XPyjRirwtltUy
 gwEwtZbR00XBwmMxTI0Lb0yJaNbOPt5QGKpqCNXv8ZH3KDE+Jx3sv9ThW
 ZnpVOI4m3NsW57+o+OW7j0yxO4Vy2v+NJAoY7IptC3aUAh+pLbDi1CS91 g==;
X-CSE-ConnectionGUID: HKjB2gzCRx2XNDnxfCamAA==
X-CSE-MsgGUID: H/ehwZnhSTeUnQe6ZsmZcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34679640"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="34679640"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 04:46:31 -0700
X-CSE-ConnectionGUID: 1DbAtIMHT7i9igPX/tAdng==
X-CSE-MsgGUID: EIT9haWkTTKqfKMieYH4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="76963793"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 03 Jul 2024 04:46:28 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id F409A284FE;
 Wed,  3 Jul 2024 12:46:24 +0100 (IST)
Message-ID: <10c3d9b8-bf5b-42c1-9c87-36828f5c995c@intel.com>
Date: Wed, 3 Jul 2024 13:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie
 <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mark Brown <broonie@kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 buildfailureaftermergeofthedrmtree@sirena.org.uk,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <Zn7s611xnutUFxR0@sirena.org.uk>
 <20240703123643.5b4dc83f@canb.auug.org.au>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240703123643.5b4dc83f@canb.auug.org.au>
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

+ Rodrigo for help

On 03.07.2024 04:36, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 28 Jun 2024 18:03:39 +0100 Mark Brown <broonie@kernel.org> wrote:
>>
>> After merging the drm tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function 'pf_get_threshold':
>> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1788:27: error: unused variable 'xe' [-Werror=unused-variable]
>>  1788 |         struct xe_device *xe = gt_to_xe(gt);
>>       |                           ^~
>> cc1: all warnings being treated as errors
>>
>> Caused by commit
>>
>>   629df234bfe73d ("drm/xe/pf: Introduce functions to configure VF thresholds")
>>
>> I have used the tree from 20240627 instead.
> 
> I am still seeing that build failure.
> 

as explained before, this additional var is not present in
drm-xe/drm-xe-next

AFAICS this additional var comes from the drm/drm-next and is applied to
drm-tip as something like:


commit fa60cd98341b3a176de428a182e13ebd7a5ea4b7 (from
fb625bf6187d97c3cd28d680b14bf80f84207e5a)
Merge: f733fce76fff fb625bf6187d
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Jul 3 10:12:05 2024 +0200

    Merge remote-tracking branch 'drm/drm-next' into drm-tip

    # Conflicts:
    #       drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
    #       drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c
    #       drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
    #       drivers/gpu/drm/xe/xe_gt_idle.c
    #       drivers/gpu/drm/xe/xe_guc_pc.c

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 694671497f6e..a5c9dfa1077c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1785,6 +1785,7 @@ static int pf_get_threshold(struct xe_gt *gt,
unsigned int vfid,
                            enum xe_guc_klv_threshold_index index)
 {
        struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+       struct xe_device *xe = gt_to_xe(gt);

        return config->thresholds[index];
 }


and later drm-tip removes that by merging fixup from the topic branch:

commit 1179bb6a96b57c1584497920768ac9c40c7874e4 (from
29a62552d265091cd444bf819f4e4fd3fa7f471c)
Merge: 29a62552d265 428c3ef38ef5
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Jul 3 10:12:10 2024 +0200

    Merge remote-tracking branch 'drm-xe/topic/xe-for-CI' into drm-tip

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c8936aae7f43..db6c213da847 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1785,7 +1785,6 @@ static int pf_get_threshold(struct xe_gt *gt,
unsigned int vfid,
                            enum xe_guc_klv_threshold_index index)
 {
        struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-       struct xe_device *xe = gt_to_xe(gt);

        return config->thresholds[index];
 }

