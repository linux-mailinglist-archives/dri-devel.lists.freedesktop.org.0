Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952CF36907C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 12:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0276EB6A;
	Fri, 23 Apr 2021 10:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B056E0CC;
 Fri, 23 Apr 2021 10:42:50 +0000 (UTC)
IronPort-SDR: hqcd4gHEEbZEatnYyv+qKFTqjgIPk8ZZZG8/fFt64+7E/iref96YZZhGOm+y2eUaEdlJNZKVV/
 JcoCgNkyMhfw==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="183530130"
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="183530130"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 03:42:49 -0700
IronPort-SDR: OFvfsEuRHTPydfmUcqvE5J8CtjeZ5m+DI0+d83IXL+oSepixEHVJfrp2r+/n7kbANnF2OPj4r5
 WUydTKqGd6Dw==
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="421721849"
Received: from gbocanex-mobl.ger.corp.intel.com (HELO [10.252.49.5])
 ([10.252.49.5])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 03:42:47 -0700
Subject: Re: [PATCH] drm/i915: Fix docbook descriptions for i915_cmd_parser
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210421120353.544518-1-maarten.lankhorst@linux.intel.com>
 <CAKMK7uFpoY7YMEMbftjq+P5XHR6L+F0KwFtbK7CtuUFy7HsLkQ@mail.gmail.com>
 <9ae96fa1-6c91-4ec1-422d-8e0a95251bb7@linux.intel.com>
 <YIExRAHQvZmgL5S+@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20c93c9a-9aca-0057-23bf-463e7946e1c8@linux.intel.com>
Date: Fri, 23 Apr 2021 12:42:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YIExRAHQvZmgL5S+@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 22-04-2021 om 10:18 schreef Daniel Vetter:
> On Wed, Apr 21, 2021 at 04:39:10PM +0200, Maarten Lankhorst wrote:
>> Op 21-04-2021 om 16:32 schreef Daniel Vetter:
>>> On Wed, Apr 21, 2021 at 2:03 PM Maarten Lankhorst
>>> <maarten.lankhorst@linux.intel.com> wrote:
>>>> Fixes the following htmldocs warnings:
>>>> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function parameter 'trampoline' description in 'intel_engine_cmd_parser'
>>>> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or member 'jump_whitelist' not described in 'intel_engine_cmd_parser'
>>>> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or member 'shadow_map' not described in 'intel_engine_cmd_parser'
>>>> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or member 'batch_map' not described in 'intel_engine_cmd_parser'
>>>> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function parameter 'trampoline' description in 'intel_engine_cmd_parser'
>>>>
>>>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> ---
>>>>  drivers/gpu/drm/i915/i915_cmd_parser.c | 16 +++++++++++++++-
>>>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
>>>> index e6f1e93abbbb..afb9b7516999 100644
>>>> --- a/drivers/gpu/drm/i915/i915_cmd_parser.c
>>>> +++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
>>>> @@ -1369,6 +1369,18 @@ static int check_bbstart(u32 *cmd, u32 offset, u32 length,
>>>>         return 0;
>>>>  }
>>>>
>>>> +/**
>>>> + * intel_engine_cmd_parser_alloc_jump_whitelist() - preallocate jump whitelist for intel_engine_cmd_parser()
>>>> + * @batch_length: length of the commands in batch_obj
>>>> + * @trampoline: Whether jump trampolines are used.
>>>> + *
>>>> + * Preallocates a jump whitelist for parsing the cmd buffer in intel_engine_cmd_parser().
>>>> + * This has to be preallocated, because the command parser runs in signaling context,
>>>> + * and may not allocate any memory.
>>>> + *
>>>> + * Return: NULL or pointer to a jump whitelist, or ERR_PTR() on failure. Use
>>>> + * IS_ERR() to check for errors. Must bre freed() with kfree().
>>> IS_ERR_OR_NULL or needs an actual bugfix in the code since we're not
>>> consistent. Also s/bre/be/
>> We're sort of consistent, NULL is a valid return code. IS_ERR is only on faliure. :)
> Maybe explain that and then Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Cheers, Daniel
>
>>> -Daniel
>>>
>>>> + */
>>>>  unsigned long *intel_engine_cmd_parser_alloc_jump_whitelist(u32 batch_length,
>>>>                                                             bool trampoline)
>>>>  {
>>>> @@ -1401,7 +1413,9 @@ unsigned long *intel_engine_cmd_parser_alloc_jump_whitelist(u32 batch_length,
>>>>   * @batch_offset: byte offset in the batch at which execution starts
>>>>   * @batch_length: length of the commands in batch_obj
>>>>   * @shadow: validated copy of the batch buffer in question
>>>> - * @trampoline: whether to emit a conditional trampoline at the end of the batch
>>>> + * @jump_whitelist: buffer preallocated with intel_engine_cmd_parser_alloc_jump_whitelist()
>>>> + * @shadow_map: mapping to @shadow vma
>>>> + * @batch_map: mapping to @batch vma
>>>>   *
>>>>   * Parses the specified batch buffer looking for privilege violations as
>>>>   * described in the overview.
>>>> --
>>>> 2.31.0
>>>>
Updated and pushed both, thanks. :)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
