Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F0E79DE85
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 05:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0FC10E0DA;
	Wed, 13 Sep 2023 03:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D6D10E0D9;
 Wed, 13 Sep 2023 03:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=hMw+EHIIuZCaUHXysWAaBm/VYKzBkzXqLptqFJBEf84=; b=3d7WTKkW2p+sWEJhOfhuEstZ6O
 Qgkfw0sboYBpbY8FnunXsjNam0yOOG9z/HlNwkgfwwt6amKIjudHQqzNOt+t4e1Pqvw0s+W5COobG
 rFCkjGREbYa19iGuESOVqHkr8mVvMp/eSYXFFkXeeycxVAFkFo4yBsiLRdcGb8GASq+DwL8u6Nl2r
 uXcD6Px15tGtm212nDoQ0G3uAVtr1rnAlbOYqM6I7q4JopqukDMUeQ2tuSnkh3dIrmQryVAdMtjvI
 Gex3Ohon6Ni7BWsLh2U+QtOFIW+dDcvY4xPIi/plSFajcjnpaNfnUHg2FS6Dtp21ICH36fKdJDBGE
 aTJugQ4g==;
Received: from [2601:1c2:980:9ec0::9fed]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qgGKG-004U8Q-1B; Wed, 13 Sep 2023 03:14:00 +0000
Message-ID: <bd285959-1f45-45c3-9d47-2b96f85601a3@infradead.org>
Date: Tue, 12 Sep 2023 20:13:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 11
 (drivers/gpu/drm/i915/display/intel_backlight.o)
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230911121131.006d3fec@canb.auug.org.au>
 <eac933bb-eb6d-8b21-422a-b8c6255facc3@infradead.org>
 <87a5tresu8.fsf@intel.com>
 <4364d453-3560-c3c2-15b1-146f9578755b@infradead.org>
In-Reply-To: <4364d453-3560-c3c2-15b1-146f9578755b@infradead.org>
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
Cc: intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On 9/12/23 07:52, Randy Dunlap wrote:
> 
> 
> On 9/12/23 00:47, Jani Nikula wrote:
>> On Mon, 11 Sep 2023, Randy Dunlap <rdunlap@infradead.org> wrote:
>>> On 9/10/23 19:11, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Please do *not* include material destined for v6.7 in your linux-next
>>>> included branches until *after* v6.6-rc1 has been released.  Also,
>>>> do *not* rebase your linu-next included branches onto v6.5.
>>>>
>>>> Changes since 20230908:
>>>>
>>>> Non-merge commits (relative to Linus' tree): 643
>>>>  614 files changed, 227990 insertions(+), 9502 deletions(-)
>>>>
>>>> ----------------------------------------------------------------------------
>>>
>>> on x86_64:
>>>
>>> # CONFIG_ACPI is not set
>>> CONFIG_DRM_I915=y
>>> CONFIG_BACKLIGHT_CLASS_DEVICE=m
>>>
>>> I915 selects BACKLIGHT_CLASS_DEVICE if ACPI is set.
>>>
>>> ld: drivers/gpu/drm/i915/display/intel_backlight.o: in function `intel_backlight_device_register':
>>> intel_backlight.c:(.text+0x4988): undefined reference to `backlight_device_get_by_name'
>>> ld: intel_backlight.c:(.text+0x4a1b): undefined reference to `backlight_device_register'
>>> ld: drivers/gpu/drm/i915/display/intel_backlight.o: in function `intel_backlight_device_unregister':
>>> intel_backlight.c:(.text+0x4b56): undefined reference to `backlight_device_unregister'
>>
>> This comes up periodically. The fix is for i915 to depend on backlight,
>> but it's not possible to fix just i915, as it'll lead to circular deps
>> unless *all* select backlight is switched to depend on backlight.
>>
>> I've gone through it once [1], and not keen on doing it again unless
>> there's buy-in.
>>
>> IS_REACHABLE() is often suggested as a workaround, but I think it's just
>> plain wrong. i915=y backlight=m is not a configuration that makes
>> sense. Kernel configuration is hard enough, there's no point in allowing
>> dumb configs that just silently don't work.
>>
> 
> Yes, IS_REACHABLE() is just fugly nonsense.
> 
> Thanks for the reminder of your attempt(s).
> 
>>
>> BR,
>> Jani.
>>
>>
>> [1] https://lore.kernel.org/r/1413580403-16225-1-git-send-email-jani.nikula@intel.com

I did a partial patch series (eliminated the I915 problems with 9 patches,
without build testing -- only kconfig testing -- so more changes may be
needed), then I looked at your patch [1] above.

I like it but even if Tomi and Daniel didn't have problems with it,
I am concerned that it would cause problems with existing working .config files.

Still, something should be done about the mixed usage of select and depends on
for BACKLIGHT_CLASS_DEVICE (et al).

thanks.
-- 
~Randy
