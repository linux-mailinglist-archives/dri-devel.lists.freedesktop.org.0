Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29AA899AD0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 12:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F33C10E3A0;
	Fri,  5 Apr 2024 10:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0EFC113AF1;
 Fri,  5 Apr 2024 10:28:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F38BDFEC;
 Fri,  5 Apr 2024 03:28:36 -0700 (PDT)
Received: from [10.57.17.51] (unknown [10.57.17.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF4B33F64C;
 Fri,  5 Apr 2024 03:28:05 -0700 (PDT)
Message-ID: <157e69d4-850f-40d2-84ff-d25dd2c122b4@arm.com>
Date: Fri, 5 Apr 2024 11:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm: enable W=1 warnings by default across the
 subsystem
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
References: <cover.1704908087.git.jani.nikula@intel.com>
 <2ac758ce-a196-4e89-a397-488ba31014c4@arm.com> <871q7kcete.fsf@intel.com>
Content-Language: en-US
From: Aishwarya TCV <aishwarya.tcv@arm.com>
In-Reply-To: <871q7kcete.fsf@intel.com>
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



On 05/04/2024 10:57, Jani Nikula wrote:
> On Thu, 04 Apr 2024, Aishwarya TCV <aishwarya.tcv@arm.com> wrote:
>> Observed warning "include/drm/drm_print.h:536:35: warning: '%4.4s'
>> directive argument is null [-Wformat-overflow=]" when building the
>> modules with "defconfig+kselftest-ftrace"(
>> https://github.com/torvalds/linux/blob/master/tools/testing/selftests/ftrace/config
>> ) against next-master(next-20240404) kernel with Arm64 in our CI.
>>
>> A bisect identified a61ddb4393ad1be61d2ffd92576d42707b05be17 as the
>> first bad commit. Bisected it on the tag "next-20240326" at repo
>> "https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git".
>>
>> I understand that you are turning on the warning here, thought worth
>> mentioning about the observation.
> 
> Thanks for the report. I can't reproduce this myself, but please see if
> [1] fixes the issue.
> 
> 
> BR,
> Jani.
> 
> [1] https://lore.kernel.org/dri-devel/20240405092907.2334007-1-jani.nikula@intel.com
> 
> 

Thanks, as expected this fixes the issue. Tested the attached patch by
building the modules with "defconfig+kselftest-ftrace" against
next-20240405 kernel with Arm64.
	
Tested-by: Aishwarya TCV <aishwarya.tcv@arm.com>
