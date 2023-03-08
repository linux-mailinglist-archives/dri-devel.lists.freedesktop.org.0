Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E936B076A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 13:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D13D10E675;
	Wed,  8 Mar 2023 12:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64D710E675;
 Wed,  8 Mar 2023 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678279650; x=1709815650;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U3P1nY7bvd8EKHMnEs/zpMQih9FlKYMCHu/GGGoAKeY=;
 b=VzSxRc6EH3crcGKrplnq+gdTkAnPPeljkc2+sars5A6dUxo6DOmdWSIW
 2md11WeDhKMqv4+EG8ZnMsH4YR1ujzEPPrBk+mdyWQQKWvEvIFvOR0pnT
 nJk1JgbOdQ3gkxiv45kOaJBf9tWPqU3EPiOzVG0Y91v7xrRlRnngbBOV2
 hr7GqPQb5T+a7+3bwYXtB0rPhG/nJ95Bh2GaXqKJFzckf3Iy20IpURo8T
 IrBJRjx8DHJKuEq47BYPr8Oo1rEK9WA9tvUpfj+jS2TCZ0aSzfuhYjNnd
 e5MOBAnVgIf/9o5fbS5l+gPjn4n0b6gruTbz+6JkaBW32iGb9M1bRCCgg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398721789"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="398721789"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 04:47:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676961756"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="676961756"
Received: from lcojocar-mobl.ger.corp.intel.com (HELO [10.251.219.243])
 ([10.251.219.243])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 04:47:14 -0800
Message-ID: <fc1c5bf4-8174-50e4-5109-cbf73aafe771@linux.intel.com>
Date: Wed, 8 Mar 2023 13:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [Intel-xe] [PATCH] drm/xe/display: Do not use i915
 frontbuffer tracking implementation
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230306141638.196359-1-maarten.lankhorst@linux.intel.com>
 <edae44735190c4d5fbbe8959f999ad7ca65f3677.camel@intel.com>
 <073f5ef3-523a-2997-c7e9-771cce8f4c24@linux.intel.com>
 <ZAZT6jJlsiTF1A5a@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZAZT6jJlsiTF1A5a@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-03-06 21:58, Ville Syrjälä wrote:
> On Mon, Mar 06, 2023 at 09:23:50PM +0100, Maarten Lankhorst wrote:
>> Hey,
>>
>> On 2023-03-06 16:23, Souza, Jose wrote:
>>> On Mon, 2023-03-06 at 15:16 +0100, Maarten Lankhorst wrote:
>>>> As a fallback if we decide not to merge the frontbuffer tracking, allow
>>>> i915 to keep its own implementation, and do the right thing in Xe.
>>>>
>>>> The frontbuffer tracking for Xe is still done per-fb, while i915 can
>>>> keep doing the weird intel_frontbuffer + i915_active thing without
>>>> blocking Xe.
>>> Please also disable PSR and FBC with this or at least add a way for users to disable those features.
>>> Without frontbuffer tracker those two features will break in some cases.
>> FBC and PSR work completely as expected. I don't remove frontbuffer
>> tracking; I only remove the GEM parts.
>>
>> Explicit invalidation using pageflip or CPU rendering + DirtyFB continue
>> to work, as I validated on my laptop with FBC.
> Neither of which are relevant to the removal of the gem hooks.
>
> Like I already said ~10 times in the last meeting, we need a proper
> testcase. Here's a rough idea what it should do:
>
> prepare a batch with
> 1. spinner
> 2. something that clobbers the fb
>
> Then
> 1. grab reference crc
> 2. execbuffer
> 3. dirtyfb
> 4. wait long enough for fbc to recompress
> 5. terminate spinner
> 6. gem_sync
> 7. grab crc and compare with reference
>
> No idea what the current status of PSR+CRC is, so not sure
> whether we can actually test PSR or not.

This test doesn't make sense. DirtyFB should simply not return before 
execbuffer finishes.

~Maarten

