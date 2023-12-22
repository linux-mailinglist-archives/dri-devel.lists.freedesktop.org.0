Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD73481C9F6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 13:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A715F10E791;
	Fri, 22 Dec 2023 12:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA67D10E133;
 Fri, 22 Dec 2023 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703248160; x=1734784160;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=Bjcr2BpdVoicVzwyRniF395QLVOaKLzfFmT+l2BvJwI=;
 b=mvZNhPaEX+Axyc0TuXUallu0y9FUAZGyRjigVK6q4k23Gat/VQmx0hNe
 RWm0Yy0f+LVhvfnLN8tWKbwgeLpI0n4EMAUNIyQrfVgr/15AareXLk+c2
 FDBNz8BRMxew7/nTmpTkp/LkMY5fc/AuGb4W9bdQFJEOcRxWurr5f3Abf
 g165TeAKyA5+MxwB9J8O5+iox56b50yxF+g39vRfYt+t7MHJPzl1ZU+Tu
 1vVDb/kDBhcrXuRNU6/yHRVFNaEcwidVW74Hh8uppUk8i0hQ6y3+63HAM
 lNJ0f+Js6Kf+9mOTMOQqxYOA7ylNWPzMxW01rOLeLkDDONmCzczyyvY4+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3195363"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="3195363"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 04:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="805932787"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="805932787"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO [10.249.254.207])
 ([10.249.254.207])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 04:29:17 -0800
Message-ID: <d2cbe861-2969-399f-a9cd-fc79060e7f70@linux.intel.com>
Date: Fri, 22 Dec 2023 13:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
 <87h6kasaxx.fsf@intel.com>
 <ec58bfd4-2bd8-6a5b-dd01-74815a058c39@linux.intel.com>
In-Reply-To: <ec58bfd4-2bd8-6a5b-dd01-74815a058c39@linux.intel.com>
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
Cc: dim-tools@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/22/23 13:25, Thomas Hellström wrote:
> Hi,
>
> On 12/22/23 13:01, Jani Nikula wrote:
>> On Fri, 22 Dec 2023, Thomas Hellström 
>> <thomas.hellstrom@linux.intel.com> wrote:
>>> Add the xe repo to drm-tip and the dim tools.
>>> For now use the sha1 of the first drm-xe-next pull request for drm-tip,
>>> since that branch tip is currently adapted for our CI testing.
>> I guess we'll need xe CI to switch to drm-tip based testing, and then
>> force push drm-xe-next to drop that core-for-CI thing. But I think it's
>> fine.
>
> Yes, that's in the plan.
>
>>
>> However, please first push v6.7-rc6 to drm-xe-fixes and current drm-next
>> to drm-xe-next-fixes as a starting point. AFAICT the branches don't
>> exist yet.
>
> Yes, I have that queued-up. Still waiting for the right people to wake 
> up, though, since I'm ATM lacking the right to create those branches 
> in the xe repo. I did a dry-run building drm-tip with these patches
s/patches/branches/ ...
> present in a clone of the xe repo for testing purposes...
>
>>
>> Other than that, LGTM.
>
> Thanks,
>
> Thomas
>
>
>>
>> BR,
>> Jani.
>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>> Cc: daniel.vetter@ffwll.ch
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: dim-tools@lists.freedesktop.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: intel-gfx@lists.freedesktop.org
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   nightly.conf | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/nightly.conf b/nightly.conf
>>> index 24126b61b797..accd3ff2cc39 100644
>>> --- a/nightly.conf
>>> +++ b/nightly.conf
>>> @@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
>>>   https://anongit.freedesktop.org/git/drm/drm-tip
>>>   https://anongit.freedesktop.org/git/drm/drm-tip.git
>>>   "
>>> +drm_tip_repos[drm-xe]="
>>> +ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
>>> +https://gitlab.freedesktop.org/drm/xe/kernel.git
>>> +"
>>>   drm_tip_repos[drm-intel]="
>>>   ssh://git.freedesktop.org/git/drm/drm-intel
>>>   ssh://git.freedesktop.org/git/drm-intel
>>> @@ -65,14 +69,17 @@ drm_tip_config=(
>>>       "drm            drm-fixes"
>>>       "drm-misc        drm-misc-fixes"
>>>       "drm-intel        drm-intel-fixes"
>>> +    "drm-xe            drm-xe-fixes"
>>>         "drm            drm-next"
>>>       "drm-misc        drm-misc-next-fixes"
>>>       "drm-intel        drm-intel-next-fixes"
>>> +    "drm-xe            drm-xe-next-fixes"
>>>         "drm-misc        drm-misc-next"
>>>       "drm-intel        drm-intel-next"
>>>       "drm-intel        drm-intel-gt-next"
>>> +    "drm-xe            drm-xe-next b6e1b7081768"
>>>         "drm-intel        topic/core-for-CI"
>>>       "drm-misc        topic/i915-ttm"
