Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A9B4DACD2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 09:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC50810E54E;
	Wed, 16 Mar 2022 08:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7838A10E54E;
 Wed, 16 Mar 2022 08:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 120A440483;
 Wed, 16 Mar 2022 09:48:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5aE44g7miLuw; Wed, 16 Mar 2022 09:48:37 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0A1E640562;
 Wed, 16 Mar 2022 09:48:35 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="V2n1xXGD";
 dkim-atps=neutral
Received: from [192.168.0.209] (unknown [192.198.151.54])
 by mail1.shipmail.org (Postfix) with ESMTPSA id EE9F23602B5;
 Wed, 16 Mar 2022 09:48:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1647420515; bh=w5XsVXMynxQn5jUZ2UcMkp4Loz51WEge2Pck3icha8g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V2n1xXGDHSRJRXVhLN1uFmYza0n1Ju6xAmdgjnwzmTcZ/FovuySyFFlYHg7xIEtUd
 dMrOMEj5S28qKen9Py0RdGoi5YsN7RCrREcWfYiC1jCRKv+R58AZGkev/Bvjze29OZ
 luZVds2PnJ5WEh0GEoELx/P/pHeeiJee/Ki6vVzI=
Message-ID: <ac2fe3b5-915b-1e16-58f8-702c8fb3d1e4@shipmail.org>
Date: Wed, 16 Mar 2022 09:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/gem: Remove logic for
 wbinvd_on_all_cpus
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@gmail.com>
References: <20220222172649.331661-1-michael.cheng@intel.com>
 <20220222172649.331661-3-michael.cheng@intel.com>
 <40f820e6-6b28-fd8a-b058-13f0bbbf71fc@shipmail.org>
 <20220308175803.pszuli2ms3e7tah3@ldmartin-desk2>
 <109ec27b-3957-f13f-aec7-18fda2819ee0@intel.com>
 <d2efdd6a-3cf1-be31-2e47-55a2bdac2b3d@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <d2efdd6a-3cf1-be31-2e47-55a2bdac2b3d@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Michael, others.

This is the response from Linus last time we copied that already 
pre-existing wbinvd_on_all_cpus() macro to another place in the driver:

https://lists.freedesktop.org/archives/dri-devel/2021-November/330928.html

My first interpretation of this is that even if there currently are 
similar patterns in drm_cache.c, we shouldn't introduce more, 
encouraging other drivers to use incoherent IO.

Other than that I think we should move whatever wbinvds we can over to 
the ranged versions, unless that is proven to be a performance drop.

Finally for any wbinvds left in our driver, ensure that they are never 
executed for any gpu where we provide full coherency. That is all 
discrete gpus (and to be discussed integrated gpus moving forward).

Might be that drm maintainers want to chime in here with other views.

Thanks,

Thomas



On 3/15/22 17:59, Michael Cheng wrote:
> +Daniel for additional feedback!
>
> On 2022-03-14 4:06 p.m., Michael Cheng wrote:
>
>> On 2022-03-08 10:58 a.m., Lucas De Marchi wrote:
>>
>>> On Tue, Feb 22, 2022 at 08:24:31PM +0100, Thomas Hellström (Intel) 
>>> wrote:
>>>> Hi, Michael,
>>>>
>>>> On 2/22/22 18:26, Michael Cheng wrote:
>>>>> This patch removes logic for wbinvd_on_all_cpus and brings in
>>>>> drm_cache.h. This header has the logic that outputs a warning
>>>>> when wbinvd_on_all_cpus when its being used on a non-x86 platform.
>>>>>
>>>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>>>
>>>> Linus has been pretty clear that he won't accept patches that add 
>>>> macros that works on one arch and warns on others anymore in i915 
>>>> and I figure even less so in drm code.
>>>>
>>>> So we shouldn't try to move this out to drm. Instead we should 
>>>> restrict the wbinvd() inside our driver to integrated and X86 only. 
>>>> For discrete on all architectures we should be coherent and hence 
>>>> not be needing wbinvd().
>>>
>>> the warn is there to guarantee we don't forget a code path. However
>>> simply adding the warning is the real issue: we should rather guarantee
>>> we can't take that code path. I.e., as you said refactor the code to
>>> guarantee it works on discrete without that logic.
>>>
>>>     $ git grep wbinvd_on_all_cpus -- drivers/gpu/drm/
>>>     drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
>>>     drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
>>>     drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
>>>
>>>     drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:      * Currently we 
>>> just do a heavy handed wbinvd_on_all_cpus() here since
>>>     drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c: wbinvd_on_all_cpus();
>>>
>>> It looks like we actually go through this on other discrete 
>>> graphics. Is
>>> this missing an update like s/IS_DG1/IS_DGFX/? Or should we be doing
>>> something else?
>>>
>>>     drivers/gpu/drm/i915/gem/i915_gem_pm.c:#define 
>>> wbinvd_on_all_cpus() \
>>>     drivers/gpu/drm/i915/gem/i915_gem_pm.c: wbinvd_on_all_cpus();
>>>
>>> Those are for suspend. Revert ac05a22cd07a ("drm/i915/gem: 
>>> Almagamate clflushes on suspend")
>>> or extract that part to a helper function and implement it differently
>>> for arches != x86?
>>>
>>>     drivers/gpu/drm/i915/gem/i915_gem_pm.c: wbinvd_on_all_cpus();
>>>
>>> Probably take a similar approach to the suspend case?
>>>
>>>     drivers/gpu/drm/i915/gt/intel_ggtt.c: wbinvd_on_all_cpus();
>>
>> For a helper function, I have a #define for all non x86 architecture 
>> that gives a warn on [1] within drm_cache.h Or would it be better to 
>> implement a helper function instead?
>>
>> [1]. https://patchwork.freedesktop.org/patch/475750/?series=99991&rev=5
>>
>>>
>>> This one comes from 64b95df91f44 ("drm/i915: Assume exclusive access 
>>> to objects inside resume")
>>> Shouldn't that be doing the invalidate if the write domain is 
>>> I915_GEM_DOMAIN_CPU
>>>
>>> In the end I think the warning would be ok if it was the cherry on top,
>>> to guarantee we don't take those paths. We should probably have a
>>> warn_once() to avoid spamming the console. But we  also have to rework
>>> the code to guarantee we are the only ones who may eventually get that
>>> warning, and not the end user.
>> Could we first add the helper function/#define for now, and rework 
>> the code in a different patch series?
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>> Thanks,
>>>>
>>>> /Thomas
>>>>
>>>>
