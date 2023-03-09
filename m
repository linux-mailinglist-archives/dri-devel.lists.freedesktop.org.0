Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE566B2255
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D44E10E15C;
	Thu,  9 Mar 2023 11:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615F610E12C;
 Thu,  9 Mar 2023 11:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678360219; x=1709896219;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KZRWT/su22axle+F8TXraSsZA1SYiINjM4DpYxGglTQ=;
 b=FBhPwxzAnzBZ3eL76mSr5tOSRo0Pz3Y/jA+nmbrBykJhUfViRmHQ2nCm
 +Kal07mC7bGQwTVcfJJkd3bhoKIJ+yOj6+Xp0gIEfQGsgUAB/nB73sEIC
 SSmEkK5c3qfbroZkziHzp8+3ZcJY4deqThrVwnS+kvWxWs1o3gH+Az5RT
 1CV8jUndbGs77USkeDKVZVXcS6zhbMZ+im/jFqlRpBRb9ONRMxaXFya1r
 aqxSVLFmTkRATZVngyuoAYe4Ldev90nzdS63NINGRQJE8jb17AKCNvhor
 Tg95b34AgTq1glXVFROywh2wrYAfle0Y4mii+UXnwtRgZmNt5hgl0GNA0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398995687"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="398995687"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 03:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851476833"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="851476833"
Received: from lathoumy-mobl1.ger.corp.intel.com (HELO [10.249.44.17])
 ([10.249.44.17])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 03:09:57 -0800
Message-ID: <34de1995-7c27-c548-fbd0-00de11b5b346@linux.intel.com>
Date: Thu, 9 Mar 2023 12:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [Intel-xe] [PATCH] drm/xe/display: Do not use i915
 frontbuffer tracking implementation
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
References: <20230306141638.196359-1-maarten.lankhorst@linux.intel.com>
 <edae44735190c4d5fbbe8959f999ad7ca65f3677.camel@intel.com>
 <073f5ef3-523a-2997-c7e9-771cce8f4c24@linux.intel.com>
 <ZAZT6jJlsiTF1A5a@intel.com>
 <3dc66e2540e3dcf8c626d8fe79c6334b1f1066e9.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <3dc66e2540e3dcf8c626d8fe79c6334b1f1066e9.camel@intel.com>
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
Cc: "Souza, Jose" <jose.souza@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-03-09 12:04, Hogander, Jouni wrote:
> On Mon, 2023-03-06 at 22:58 +0200, Ville Syrjälä wrote:
>> On Mon, Mar 06, 2023 at 09:23:50PM +0100, Maarten Lankhorst wrote:
>>> Hey,
>>>
>>> On 2023-03-06 16:23, Souza, Jose wrote:
>>>> On Mon, 2023-03-06 at 15:16 +0100, Maarten Lankhorst wrote:
>>>>> As a fallback if we decide not to merge the frontbuffer
>>>>> tracking, allow
>>>>> i915 to keep its own implementation, and do the right thing in
>>>>> Xe.
>>>>>
>>>>> The frontbuffer tracking for Xe is still done per-fb, while
>>>>> i915 can
>>>>> keep doing the weird intel_frontbuffer + i915_active thing
>>>>> without
>>>>> blocking Xe.
>>>> Please also disable PSR and FBC with this or at least add a way
>>>> for users to disable those features.
>>>> Without frontbuffer tracker those two features will break in some
>>>> cases.
>>> FBC and PSR work completely as expected. I don't remove frontbuffer
>>> tracking; I only remove the GEM parts.
>>>
>>> Explicit invalidation using pageflip or CPU rendering + DirtyFB
>>> continue
>>> to work, as I validated on my laptop with FBC.
>> Neither of which are relevant to the removal of the gem hooks.
>>
>> Like I already said ~10 times in the last meeting, we need a proper
>> testcase. Here's a rough idea what it should do:
>>
>> prepare a batch with
>> 1. spinner
>> 2. something that clobbers the fb
>>
>> Then
>> 1. grab reference crc
>> 2. execbuffer
>> 3. dirtyfb
>> 4. wait long enough for fbc to recompress
>> 5. terminate spinner
>> 6. gem_sync
>> 7. grab crc and compare with reference
>>
>> No idea what the current status of PSR+CRC is, so not sure
>> whether we can actually test PSR or not.
>>
> CRC calculation doesn't work with PSR currently. PSR is disabled if CRC
> capture is requested.
>
> Are we supposed to support frontbuffer rendering using GPU?

No other driver does that. It's fine if DirtyFB hangs instead until the 
job it waits on completes.

~Maarten


