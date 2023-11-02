Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2204E7DEEC6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 10:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4303F10E144;
	Thu,  2 Nov 2023 09:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C6B10E144
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698917092; x=1730453092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=goz1MDZeYttmZTizQc2k0/k0PvBtwJ1aMlNPSqULG1w=;
 b=QxDhVZho9Qyp4JAWmdy0O6VBk8ogje5ac3K2/3tG8Tr20ZbZVP9SLzDf
 /7H+kowDQ3aO2AB2D4k7FUUP5BLWwJmZa6cK5VmV5/reJFcsHO7UBA4Xp
 p0NpBFIqTOdX7KzFUPl0H/CYbcPvhbH5Bcwgb1ufux5AEmih16tBJjN/y
 vHv64uck0YTyGfswJ5t1nv6iR1GhA8STwXqpN3kjw/QeTZRcXyHJJpUyX
 TsvwCRfcI78NPky78h2smDoWCLzwVxChO0NcyqGlxNMG3upl3rOCsCfCX
 j/WHSlTyqnkwaHcImaX0POyB4wiF4tv19bWOVlFFTFMGOcvjTk2Tp8dXN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="368016386"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="368016386"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764855969"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="764855969"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.132.23])
 ([10.249.132.23])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:24:44 -0700
Message-ID: <ccf8e1ae-efa5-4d09-bc43-4ed18536c910@linux.intel.com>
Date: Thu, 2 Nov 2023 10:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5Baccel/ivpu=5D_Help_--_Which_Intel_CPU_processor_?=
 =?UTF-8?Q?can_be_used_for_iVPU_driver=EF=BC=9F?=
To: Trigger Huang <trigger.huang@gmail.com>, dri-devel@lists.freedesktop.org
References: <CANH0Q9mzBVr7KTJQmvLsqndpTZ8JU0rDfDQhu10kFsRgfybA4A@mail.gmail.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CANH0Q9mzBVr7KTJQmvLsqndpTZ8JU0rDfDQhu10kFsRgfybA4A@mail.gmail.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

You need a Meteor Lake based platform.
Intel 14th gen desktop CPUs were supposed to be Meteor Lake but they ended up as Raptor Lake.
NPU (formerly known as VPU) will be available in 14th gen mobile chips.
I will update the Kconfig description.

Regards,
Jacek

On 02.11.2023 07:59, Trigger Huang wrote:
> Hello,
> 
> I want to have a try for the iVPU driver but don't know which CPU platform
> is suitable. Would you help?
> 
> According to the description in linux/drivers/accel/ivpu/Kconfig, it says
> that Choose this option if you have a system that has an *14*th generation
> Intel CPU
> But according to the Intel  I7 *14*700k spec (
> https://www.intel.com/content/www/us/en/products/sku/236783/intel-core-i7-processor-14700k-33m-cache-up-to-5-60-ghz/specifications.html),
> there is
> no description about Versatile Processing Unit.
> 
> So which CPU should I choose?
> 
> Thanks,
> Trigger
> 
