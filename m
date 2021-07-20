Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E593CFD8A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F15389836;
	Tue, 20 Jul 2021 15:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F34989836;
 Tue, 20 Jul 2021 15:30:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="190844568"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="190844568"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 08:30:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="657577088"
Received: from ekearns1-mobl.amr.corp.intel.com (HELO [10.213.195.253])
 ([10.213.195.253])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 08:30:10 -0700
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: Always call i915_globals_exit()
 from i915_exit()
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210719183047.2624569-1-jason@jlekstrand.net>
 <20210719183047.2624569-4-jason@jlekstrand.net>
 <6ecf6891-67c2-94ac-32ce-28c1a1a7db0b@linux.intel.com>
 <CAOFGe96CemtS4hBoOR8g+V-6synP_WNdHj3ed0MgRaNasV24Xw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <bb07da62-2c6b-e7a3-3563-72ca24ebee9f@linux.intel.com>
Date: Tue, 20 Jul 2021 16:30:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOFGe96CemtS4hBoOR8g+V-6synP_WNdHj3ed0MgRaNasV24Xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Now you confused me with two replies I forgot to reply to all... :))

On 20/07/2021 15:53, Jason Ekstrand wrote:
> On Tue, Jul 20, 2021 at 3:25 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:

[snip]

>>> +
>>>    static int __init i915_init(void)
>>>    {
>>>        bool use_kms = true;
>>>        int err;
>>>
>>> +     i915_fully_loaded = false;
>>
>> Ditto.
> 
> So, this is something I'm unclear on.  I know that static memory gets
> auto-initialized to zero but what happens if you unload and reload a
> module?  Is it re-initialized to zero?  If it is then we can drop
> this.

Well it's not in memory after it is unloaded so clearly it has to get 
initialised by the module loader every time it loads it.

Regards,

Tvrtko
