Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716DF290436
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 13:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D087389AC2;
	Fri, 16 Oct 2020 11:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA12898E1;
 Fri, 16 Oct 2020 11:39:23 +0000 (UTC)
IronPort-SDR: CDJbjdoIUjrC3jVNtxVZXJXdXnUjUvjuComzyINLlA+hb+ysUFkV0LFsuqmMxjwHLXUPoMH33y
 xL7JSGNZYWMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="166693849"
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="166693849"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 04:39:22 -0700
IronPort-SDR: qc70nCaL8I4qSUNatahe7hnuf8AczGCnYsG2EVrtahjhOHQ0xDZviYlCFrzVgpVg7eSoau95Bd
 NFtzAG89LsxA==
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="531684889"
Received: from wpross-mobl1.ger.corp.intel.com (HELO [10.249.36.186])
 ([10.249.36.186])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 04:39:18 -0700
Subject: Re: [PATCH v6 44/80] docs: gpu: i915.rst: Fix several C duplication
 warnings
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
 <52a0dd42d3730d35b3ecd00d20a0601793e443e6.1602589096.git.mchehab+huawei@kernel.org>
 <160284606673.11659.11178759979047002902@jlahtine-mobl.ger.corp.intel.com>
 <20201016133724.1d578006@coco.lan>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <8dce8bc0-c83b-c256-aa35-229d4d583f74@intel.com>
Date: Fri, 16 Oct 2020 14:39:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201016133724.1d578006@coco.lan>
Content-Language: en-US
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/10/2020 14:37, Mauro Carvalho Chehab wrote:
> Em Fri, 16 Oct 2020 14:01:07 +0300
> Joonas Lahtinen <joonas.lahtinen@linux.intel.com> escreveu:
>
>> + Lionel
>>
>> Can you please take a look at best resolving the below problem.
>>
>> Maybe we should eliminate the duplicate declarations? Updating such
>> a list manually seems error prone to me.
> For Kernel 5.10, IMO the best is to apply this patch as-is, as any
> other thing would need to be postponed, and we want 5.10 free of
> doc warnings.


That's odd... Most of the functions are documented. Is it that we're 
missing the "()" after the function name maybe?


-Lionel


>
> Yet, when I wrote this one, I almost took a different approach:
> to implement something like @*group (or \*group) directives that
> exists on doxygen:
>
> 	https://www.doxygen.nl/manual/grouping.html
>
> If something like that gets added to kernel-doc syntax, then
> one could do something like:
>
> 	/**
> 	 * DOC: some foo description
> 	 * @group foo
> 	 */
>   
> 	/**
> 	 * foo1 - do some foo things
> 	 * @group foo
> 	...
> 	 */
>
> 	/**
> 	 * foo2 - do some other foo things
> 	 * @group foo
> 	...
> 	 */
>
> 	/**
> 	 * bar - do bar things
> 	 * @group bar
> 	...
> 	 */
>
>
> And then, at kernel-doc markup:
>
> 	FOO
> 	===
>
> 	.. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
> 		:group: foo
>
>
> 	BAR
> 	===
> 	.. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
> 		:group: bar
>
>
> I suspect that something like that would be a lot easier to maintain.
>
> Once having someone like that implemented, it should be easy to also
> have something like this:
>
> 	OTHERS
> 	======
> 	.. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
> 		:export:
> 		:not-grouped:
>
> in order to pick other functions that aren't grouped.
>
> I suspect that implementing something like that at kernel-doc.pl
> won't be hard.
>
> Regards,
> Mauro
>
>> Regards, Joonas
>>
>> Quoting Mauro Carvalho Chehab (2020-10-13 14:53:59)
>>> As reported by Sphinx:
>>>
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1147: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_oa_wait_unlocked'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1169: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_oa_poll_wait'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1189: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_oa_read'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2669: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_oa_stream_enable'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2734: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_oa_stream_disable'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2820: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_oa_stream_init'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3010: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_read'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3098: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_poll_locked'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3129: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_poll'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3152: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_enable_locked'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3181: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_disable_locked'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3273: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_ioctl'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3296: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_destroy_locked'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3321: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_release'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3379: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_open_ioctl_locked'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3534: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'read_properties_unlocked'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3717: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_open_ioctl'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3760: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_register'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3789: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_unregister'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4009: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_add_config_ioctl'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4162: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_remove_config_ioctl'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4260: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_init'.
>>>          ./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4423: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
>>>          Declaration is 'i915_perf_fini'.
>>>
>>> With Sphinx 3, C declarations can't be duplicated anymore,
>>> so let's exclude those from the other internals found on
>>> i915_perf.c file.
>>>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> ---
>>>   Documentation/gpu/i915.rst | 29 +++++++++++++++++++++++++----
>>>   1 file changed, 25 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>>> index 33cc6ddf8f64..cff1f154b473 100644
>>> --- a/Documentation/gpu/i915.rst
>>> +++ b/Documentation/gpu/i915.rst
>>> @@ -636,15 +636,36 @@ i915 Perf Observation Architecture Stream
>>>   .. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
>>>      :functions: i915_oa_poll_wait
>>>   
>>> -All i915 Perf Internals
>>> ------------------------
>>> +Other i915 Perf Internals
>>> +-------------------------
>>>   
>>> -This section simply includes all currently documented i915 perf internals, in
>>> -no particular order, but may include some more minor utilities or platform
>>> +This section simply includes all other currently documented i915 perf internals,
>>> +in no particular order, but may include some more minor utilities or platform
>>>   specific details than found in the more high-level sections.
>>>   
>>>   .. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
>>>      :internal:
>>> +   :no-identifiers:
>>> +       i915_perf_init
>>> +       i915_perf_fini
>>> +       i915_perf_register
>>> +       i915_perf_unregister
>>> +       i915_perf_open_ioctl
>>> +       i915_perf_release
>>> +       i915_perf_add_config_ioctl
>>> +       i915_perf_remove_config_ioctl
>>> +       read_properties_unlocked
>>> +       i915_perf_open_ioctl_locked
>>> +       i915_perf_destroy_locked
>>> +       i915_perf_read i915_perf_ioctl
>>> +       i915_perf_enable_locked
>>> +       i915_perf_disable_locked
>>> +       i915_perf_poll i915_perf_poll_locked
>>> +       i915_oa_stream_init i915_oa_read
>>> +       i915_oa_stream_enable
>>> +       i915_oa_stream_disable
>>> +       i915_oa_wait_unlocked
>>> +       i915_oa_poll_wait
>>>   
>>>   Style
>>>   =====
>>> -- 
>>> 2.26.2
>>>    
>
>
> Thanks,
> Mauro


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
