Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A49A49EB0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9AE10ECF7;
	Fri, 28 Feb 2025 16:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="edC3LwA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC8810ECF3;
 Fri, 28 Feb 2025 16:24:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B54A43209;
 Fri, 28 Feb 2025 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740759861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Z1IKkm6+PnFpEAaGDs3hByJh2w/s4OJvKkdhV8BI7pE=;
 b=edC3LwA3ZOzxlMbNW5jOkj/xKOgxgvLzgon2Z/ebWjzgQUi58Dkjm/75rkhuUGW7SpC0tk
 AHwhVudHAxwtfIIwdBRbKUYUr3evh2KHEQGqlBhZHvVKDTcQP31xiSRZ7lY0wJrEXFxfCv
 lJt0YEvz3TtNcLkjPIdQbbfiBPBo5WWqoj+msms2+B1B2ptPR0zLFhDPAXhWeB96HSNtGF
 LTlEob23gTpAc+ul+1YioTJA4xPVxWSq94OfJ1AjOX2OSoOW0uMbOqqdADilVSfoCI+MrK
 Yk9Erg0FLMROh/6gTe0YXmDEwLNQCctTGAA2eX2VW3FNkLxysdHQhi1Z26eOlA==
Message-ID: <caba927a-b71b-40bf-96b6-d15418ed705a@bootlin.com>
Date: Fri, 28 Feb 2025 17:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/63] Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
To: Greg KH <gregkh@linuxfoundation.org>, Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, jbaron@akamai.com, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <2025022012-viscous-cringing-bf88@gregkh>
 <Z7b50rGRA4RuybgC@phenom.ffwll.local>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <Z7b50rGRA4RuybgC@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetueetjedtudegtdeftdevtedtgeehhefftdejheduvdfhlefhveekheethfffueenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghhrvghgkhhhsehlihhnu
 higfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopehukhgrshiisgestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhfgidqthhrhigsohhtsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 20/02/2025 à 10:45, Simona Vetter a écrit :
> On Thu, Feb 20, 2025 at 09:31:41AM +0100, Greg KH wrote:
>> On Fri, Jan 24, 2025 at 11:45:14PM -0700, Jim Cromie wrote:
>>> This series fixes dynamic-debug's support for DRM debug-categories.
>>> Classmaps-v1 evaded full review, and got committed in 2 chunks:
>>>
>>>    b7b4eebdba7b..6ea3bf466ac6	# core dyndbg changes
>>>    0406faf25fb1..ee7d633f2dfb	# drm adoption
>>>
>>> DRM-CI found a regression during init with drm.debug=<initval>; the
>>> static-keys under the drm-dbgs in drm.ko got enabled, but those in
>>> drivers & helpers did not.
>>>
>>> Root Problem:
>>>
>>> DECLARE_DYNDBG_CLASSMAP violated a K&R rule "define once, refer
>>> afterwards".  Replace it with DYNDBG_CLASSMAP_DEFINE (invoked once in
>>> drm-core) and DYNDBG_CLASSMAP_USE (invoked repeatedly, in drivers &
>>> helpers).
>>>
>>> _DEFINE exports the classmap it creates (in drm.ko), other modules
>>> _USE the classmap.  The _USE adds a record ref'g the _DEFINEd (&
>>> exported) classmap, in a 2nd __dyndbg_class_users section.
>>>
>>> So now at modprobe, dyndbg scans the new section after the 1st
>>> __dyndbg_class_maps section, follows the linkage to the _DEFINEr
>>> module, finds the (optional) kernel-param controlling the classmap,
>>> examines its drm.debug=<initval>, and applies it to the module being
>>> initialized.
>>>
>>> To recapitulate the multi-module problem wo DRM involvement, Add:
>>>
>>> A. tools/testing/selftests/dynamic_debug/*
>>>
>>> This alters pr_debugs in the test-modules, counts the results and
>>> checks them against expectations.  It uses this formula to test most
>>> of the control grammar, including the new class keyword.
>>>
>>> B. test_dynamic_debug_submod.ko
>>>
>>> This alters the test-module to build both parent & _submod ko's, with
>>> _DEFINE and _USE inside #if/#else blocks.  This recap's DRM's 2 module
>>> failure scenario, allowing A to exersize several cases.
>>>
>>> The #if/#else puts the 2 macro uses together for clarity, and gives
>>> the 2 modules identical sets of debugs.
>>>
>>> Recent DRM-CI tests are here:
>>>    https://patchwork.freedesktop.org/series/139147/
>>>
>>> Previous rev:
>>>    https://lore.kernel.org/lkml/20240716185806.1572048-1-jim.cromie@gmail.com/
>>>
>>> Noteworthy Additions:
>>>
>>> 1- drop class "protection" special case, per JBaron's preference.
>>>     only current use is marked BROKEN so nobody to affect.
>>>     now framed as policy-choice:
>>>     #define ddebug_client_module_protects_classes() false
>>>     subsystems wanting protection can change this.
>>>
>>> 2- compile-time arg-tests in DYNDBG_CLASSMAP_DEFINE
>>>     implement several required constraints, and fail obviously.
>>>
>>> 3- modprobe time check of conflicting class-id reservations
>>>     only affects 2+classmaps users.
>>>     compile-time solution not apparent.
>>>
>>> 4- dyndbg can now cause modprobe to fail.
>>>     needed to catch 3.
>>>     maybe some loose ends here on failure.
>>>
>>> 5- refactor & rename ddebug_attach_*module_classes
>>>     reduce repetetive boilerplate on 2 types: maps, users.
>>>     rework mostly brought forward in patchset to reduce churn
>>>     TBD: maybe squash more.
>>>
>>> Several recent trybot submissions (against drm-tip) have been passing
>>> CI.BAT, and failing one or few CI.IGT tests randomly; re-tests do not
>>> reliably repeat the failures.
>>>
>>> its also at github.com:jimc/linux.git
>>>    dd-fix-9[st]-ontip  &  dd-fix-9-13
>>>
>>> Ive been running it on my desktop w/o issues.
>>>
>>> The drivers/gpu/drm patches are RFC, I think there might be a single
>>> place to call DRM_CLASSMAP_USE(drm_dedbug_classes) to replace the
>>> sprinkling of _USEs in drivers and helpers.  IIRC, I tried adding a
>>> _DEFINE into drm_drv.c, that didn't do it, so I punted for now.
>>>
>>> I think the dyndbg core additions are ready for review and merging
>>> into a (next-next) test/integration tree.
>>
>> So whose tree should this go through?
> 
> I'm trying to get some drm folks to review/test this, but thus far not
> much success :-/ I think it's good stuff, but I'm somewhat hesitant if no

I tested the VKMS driver with this, and it works!

Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>

> one else agrees that it's useful for CI or in-field crash-recording or
> whatever ...
> 
> I guess worst case we can land it and hope it attracts more folks?
> 
> Wrt tree I don't care, but I guess we should then also land the drm side
> too.
> -Sima
> 
>> And I think the last patch in this series isn't correct, it looks like a
>> 000 email somehow.
>>
>> thanks,
>>
>> greg k-h
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

