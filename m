Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65207DFFC8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 09:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E029B10E041;
	Fri,  3 Nov 2023 08:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1BF10E041
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699000673; x=1730536673;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aAzBh4CeCcklXF5VYFa8rTeB+WSAkHmrUR5ABl1Mhcs=;
 b=VBwgPtwWsyrZ/PHYQComeuq8wd7ouFIBfFwHMl198QWn08Eim5IxSfoj
 HhFNbyHvhkh0/zZsqtD4wzKjWqOZBqAi2XOoEXsF+igrSDSbWZR++hChX
 uXJ62Pk8TI2zfJMtyxub2hPPGdWdbKampHqMEXwOYgWMia2R8CYfAKwmJ
 R1AAd8TM11GT7RaPj6NkR6uinX4oCbGpwv44oB8IFdK9ZvKbNZ+6VxO9e
 uIMrX/XgPNch7N8S+dJdZqKXMZ45GAYGdt8eTmqwCp/SoCQ4ryxvD4nHa
 C10ulRcAc9YorFYdDk8bc1UCfit0YWv1u/fJz+1cJh6lH4Tf4lYBKDKnk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379305138"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="379305138"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 01:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="2832362"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.131.217])
 ([10.249.131.217])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 01:37:51 -0700
Message-ID: <27c09ddf-e2a3-49db-a119-f7ce350d3f97@linux.intel.com>
Date: Fri, 3 Nov 2023 09:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5Baccel/ivpu=5D_Help_--_Which_Intel_CPU_processor_?=
 =?UTF-8?Q?can_be_used_for_iVPU_driver=EF=BC=9F?=
To: Trigger Huang <trigger.huang@gmail.com>
References: <CANH0Q9mzBVr7KTJQmvLsqndpTZ8JU0rDfDQhu10kFsRgfybA4A@mail.gmail.com>
 <ccf8e1ae-efa5-4d09-bc43-4ed18536c910@linux.intel.com>
 <CANH0Q9=bF-j3=sS+Hw8FmD4dm9cnGNt5f6XAdRpo6KaHdGb0nw@mail.gmail.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CANH0Q9=bF-j3=sS+Hw8FmD4dm9cnGNt5f6XAdRpo6KaHdGb0nw@mail.gmail.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes, NPU should be available on future desktop chips.

On 02.11.2023 12:09, Trigger Huang wrote:
> Hi Jacek,
> 
> Thanks for the quick response.
> 
> Seems I need to wait for a while if I want to buy a  Meteor Lake based
> platform because I got the following message from wiki(
> *https://en.wikipedia.org/wiki/Meteor_Lake
> <https://en.wikipedia.org/wiki/Meteor_Lake>)*
> 
>            *Meteor Lake is Intel's codename for the first-generation of
> Intel Core Ultra mobile processors, to be released to the market on
> December 14, 2023*
> 
> BTW, is it possible that NPU (formerly known as VPU) will be available on
> some desktop CPUs in the future?
> 
> Thanks,
> Trigger
> 
> On Thu, Nov 2, 2023 at 5:24 PM Jacek Lawrynowicz <
> jacek.lawrynowicz@linux.intel.com> wrote:
> 
>> Hi,
>>
>> You need a Meteor Lake based platform.
>> Intel 14th gen desktop CPUs were supposed to be Meteor Lake but they ended
>> up as Raptor Lake.
>> NPU (formerly known as VPU) will be available in 14th gen mobile chips.
>> I will update the Kconfig description.
>>
>> Regards,
>> Jacek
>>
>> On 02.11.2023 07:59, Trigger Huang wrote:
>>> Hello,
>>>
>>> I want to have a try for the iVPU driver but don't know which CPU
>> platform
>>> is suitable. Would you help?
>>>
>>> According to the description in linux/drivers/accel/ivpu/Kconfig, it says
>>> that Choose this option if you have a system that has an *14*th
>> generation
>>> Intel CPU
>>> But according to the Intel  I7 *14*700k spec (
>>>
>> https://www.intel.com/content/www/us/en/products/sku/236783/intel-core-i7-processor-14700k-33m-cache-up-to-5-60-ghz/specifications.html
>> ),
>>> there is
>>> no description about Versatile Processing Unit.
>>>
>>> So which CPU should I choose?
>>>
>>> Thanks,
>>> Trigger
>>>
>>
> 
