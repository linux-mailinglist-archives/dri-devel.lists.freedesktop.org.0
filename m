Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85737290463
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 13:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39636EDBD;
	Fri, 16 Oct 2020 11:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151666EDC7;
 Fri, 16 Oct 2020 11:52:15 +0000 (UTC)
IronPort-SDR: nL6lR6HCdXv0+LgtI5uvDY5P27szAbKPc9QxS6bx0bJOqbeX41vSC8uGD4wriHCYxILW7YARcO
 bAm8kQ1spSFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="145900064"
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="145900064"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 04:50:14 -0700
IronPort-SDR: f7P6B8kRTnFwCXOWEJ0Kbk/Ycio+n3tjPCIPIlYwpEnWeAm1YEQQznLTMJRy3xPy7PpH1ivf1s
 QzvI6NAMknRA==
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="464657357"
Received: from efealy-mobl.ger.corp.intel.com (HELO localhost) ([10.251.84.43])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 04:50:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v6 44/80] docs: gpu: i915.rst: Fix several C duplication
 warnings
In-Reply-To: <8dce8bc0-c83b-c256-aa35-229d4d583f74@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
 <52a0dd42d3730d35b3ecd00d20a0601793e443e6.1602589096.git.mchehab+huawei@kernel.org>
 <160284606673.11659.11178759979047002902@jlahtine-mobl.ger.corp.intel.com>
 <20201016133724.1d578006@coco.lan>
 <8dce8bc0-c83b-c256-aa35-229d4d583f74@intel.com>
Date: Fri, 16 Oct 2020 14:50:06 +0300
Message-ID: <87v9fa9yq9.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Oct 2020, Lionel Landwerlin <lionel.g.landwerlin@intel.com> wrote:
> On 16/10/2020 14:37, Mauro Carvalho Chehab wrote:
>> Em Fri, 16 Oct 2020 14:01:07 +0300
>> Joonas Lahtinen <joonas.lahtinen@linux.intel.com> escreveu:
>>
>>> + Lionel
>>>
>>> Can you please take a look at best resolving the below problem.
>>>
>>> Maybe we should eliminate the duplicate declarations? Updating such
>>> a list manually seems error prone to me.
>> For Kernel 5.10, IMO the best is to apply this patch as-is, as any
>> other thing would need to be postponed, and we want 5.10 free of
>> doc warnings.
>
>
> That's odd... Most of the functions are documented. Is it that we're 
> missing the "()" after the function name maybe?

The problem is we first include named functions, and then go on to
include everything again, duplicating the documentation for the named
functions.

BR,
Jani.


>
>
> -Lionel
>
>
>>
>> Yet, when I wrote this one, I almost took a different approach:
>> to implement something like @*group (or \*group) directives that
>> exists on doxygen:
>>
>> 	https://www.doxygen.nl/manual/grouping.html
>>
>> If something like that gets added to kernel-doc syntax, then
>> one could do something like:
>>
>> 	/**
>> 	 * DOC: some foo description
>> 	 * @group foo
>> 	 */
>>   
>> 	/**
>> 	 * foo1 - do some foo things
>> 	 * @group foo
>> 	...
>> 	 */
>>
>> 	/**
>> 	 * foo2 - do some other foo things
>> 	 * @group foo
>> 	...
>> 	 */
>>
>> 	/**
>> 	 * bar - do bar things
>> 	 * @group bar
>> 	...
>> 	 */
>>
>>
>> And then, at kernel-doc markup:
>>
>> 	FOO
>> 	===
>>
>> 	.. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
>> 		:group: foo
>>
>>
>> 	BAR
>> 	===
>> 	.. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
>> 		:group: bar
>>
>>
>> I suspect that something like that would be a lot easier to maintain.
>>
>> Once having someone like that implemented, it should be easy to also
>> have something like this:
>>
>> 	OTHERS
>> 	======
>> 	.. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
>> 		:export:
>> 		:not-grouped:
>>
>> in order to pick other functions that aren't grouped.
>>
>> I suspect that implementing something like that at kernel-doc.pl
>> won't be hard.
>>
>> Regards,
>> Mauro
>>
>>> Regards, Joonas
>>>
>>> Quoting Mauro Carvalho Chehab (2020-10-13 14:53:59)
>>>> As reported by Sphinx:
>>>>
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1147: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_oa_wait_unlocked'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1169: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_oa_poll_wait'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1189: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_oa_read'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2669: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_oa_stream_enable'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2734: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_oa_stream_disable'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2820: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_oa_stream_init'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3010: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_read'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3098: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_poll_locked'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3129: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_poll'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3152: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_enable_locked'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3181: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_disable_locked'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3273: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_ioctl'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3296: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_destroy_locked'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3321: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_release'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3379: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_open_ioctl_locked'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3534: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'read_properties_unlocked'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3717: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_open_ioctl'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3760: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_register'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3789: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_unregister'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4009: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_add_config_ioctl'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4162: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_remove_config_ioctl'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4260: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_init'.
>>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4423: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>>          Declaration is 'i915_perf_fini'.
>>>>
>>>> With Sphinx 3, C declarations can't be duplicated anymore,
>>>> so let's exclude those from the other internals found on
>>>> i915_perf.c file.
>>>>
>>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>> ---
>>>>   Documentation/gpu/i915.rst | 29 +++++++++++++++++++++++++----
>>>>   1 file changed, 25 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>>>> index 33cc6ddf8f64..cff1f154b473 100644
>>>> --- a/Documentation/gpu/i915.rst
>>>> +++ b/Documentation/gpu/i915.rst
>>>> @@ -636,15 +636,36 @@ i915 Perf Observation Architecture Stream
>>>>   .. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
>>>>      :functions: i915_oa_poll_wait
>>>>   
>>>> -All i915 Perf Internals
>>>> ------------------------
>>>> +Other i915 Perf Internals
>>>> +-------------------------
>>>>   
>>>> -This section simply includes all currently documented i915 perf internals, in
>>>> -no particular order, but may include some more minor utilities or platform
>>>> +This section simply includes all other currently documented i915 perf internals,
>>>> +in no particular order, but may include some more minor utilities or platform
>>>>   specific details than found in the more high-level sections.
>>>>   
>>>>   .. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
>>>>      :internal:
>>>> +   :no-identifiers:
>>>> +       i915_perf_init
>>>> +       i915_perf_fini
>>>> +       i915_perf_register
>>>> +       i915_perf_unregister
>>>> +       i915_perf_open_ioctl
>>>> +       i915_perf_release
>>>> +       i915_perf_add_config_ioctl
>>>> +       i915_perf_remove_config_ioctl
>>>> +       read_properties_unlocked
>>>> +       i915_perf_open_ioctl_locked
>>>> +       i915_perf_destroy_locked
>>>> +       i915_perf_read i915_perf_ioctl
>>>> +       i915_perf_enable_locked
>>>> +       i915_perf_disable_locked
>>>> +       i915_perf_poll i915_perf_poll_locked
>>>> +       i915_oa_stream_init i915_oa_read
>>>> +       i915_oa_stream_enable
>>>> +       i915_oa_stream_disable
>>>> +       i915_oa_wait_unlocked
>>>> +       i915_oa_poll_wait
>>>>   
>>>>   Style
>>>>   =====
>>>> -- 
>>>> 2.26.2
>>>>    
>>
>>
>> Thanks,
>> Mauro
>
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
