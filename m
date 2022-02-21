Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B314BDB18
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 18:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B104410E6A1;
	Mon, 21 Feb 2022 17:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228DF10E6A1;
 Mon, 21 Feb 2022 17:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645463548; x=1676999548;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nxwG4SOMfItx/Ds+PRWnbsOOm6Ikh9rqlB7RDu7lVsM=;
 b=nu0OQqY3wz6yQtmMNCAF1fKKLcVFx0TOum/cproFKFNtKJPTH714inYE
 Tn1PMtgxo9K9+EmzF840qqzOTfA/bt7OzuS1KQleBpoIOXsmWr3UaqLAJ
 k/K1gmkPzmkw5n6b7WEIMk0GNLgtTXuNs98IM0Utf8rLcD4cbku/acsrW
 8qIG0xBveZyaRQY/MFNKiO4ze4h4m5yyBpGERmvMZC3NY4KAv5mb3GNaP
 didsdo8CEaVhrJxhBJyeDpCxG/2hWjOq0elV+9NdFXUJx4TG3UOPdvLuC
 RGQtF1sus8FFTygVZCpN7A9qlpKRVdhnhej/sNDNJybR1JZ1zLtbCsE+e g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249124727"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="249124727"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 09:12:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="531921169"
Received: from mkilleen-mobl1.ger.corp.intel.com (HELO [10.213.218.216])
 ([10.213.218.216])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 09:12:25 -0800
Message-ID: <02fe43a4-0cb5-54e3-cd2f-b4bc128e7161@linux.intel.com>
Date: Mon, 21 Feb 2022 17:12:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6 sysfs
 interface
Content-Language: en-US
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-6-andi.shyti@linux.intel.com>
 <12c2fcf8-ef3b-e59c-fe1e-23bc8f12cfe5@linux.intel.com>
 <Yg5vlgoTEfJRWP9U@intel.intel>
 <164518120389.6218.14670990912373168491@jlahtine-mobl.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <164518120389.6218.14670990912373168491@jlahtine-mobl.ger.corp.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/02/2022 10:46, Joonas Lahtinen wrote:
> Quoting Andi Shyti (2022-02-17 17:53:58)
>> Hi Tvrtko,
>>
>>>> Now tiles have their own sysfs interfaces under the gt/
>>>> directory. Because RC6 is a property that can be configured on a
>>>> tile basis, then each tile should have its own interface
>>>>
>>>> The new sysfs structure will have a similar layout for the 4 tile
>>>> case:
>>>>
>>>> /sys/.../card0
>>>>            \u251c\u2500\u2500 gt
>>>>            \u2502   \u251c\u2500\u2500 gt0
>>>>            \u2502   \u2502   \u251c\u2500\u2500 id
>>>>            \u2502   \u2502   \u251c\u2500\u2500 rc6_enable
>>>>            \u2502   \u2502   \u251c\u2500\u2500 rc6_residency_ms
>>>>            .   .   .
>>>>            .   .   .
>>>>            .   .
>>>>            \u2502   \u2514\u2500\u2500 gtN
>>>>            \u2502       \u251c\u2500\u2500 id
>>>>            \u2502       \u251c\u2500\u2500 rc6_enable
>>>>            \u2502       \u251c\u2500\u2500 rc6_residency_ms
>>>>            \u2502       .
>>>>            \u2502       .
>>>>            \u2502
>>>>            \u2514\u2500\u2500 power/                -+
>>>>                 \u251c\u2500\u2500 rc6_enable        |    Original interface
>>>>                 \u251c\u2500\u2500 rc6_residency_ms  +->  kept as existing ABI;
>>>>                 .                     |    it multiplexes over
>>>>                 .                     |    the GTs
>>>>                                      -+
>>>>
>>>> The existing interfaces have been kept in their original location
>>>> to preserve the existing ABI. They act on all the GTs: when
>>>> reading they provide the average value from all the GTs.
>>>
>>> Average feels very odd to me. I'd ask if we can get away providing an errno
>>> instead? Or tile zero data?
> 
> Tile zero data is always wrong, in my opinion. If we have round-robin
> scaling workloads like some media cases, part of the system load might
> just disappear when it goes to tile 1.

I was thinking that in conjunction with deprecated log message it 
wouldn't be wrong - I mean if the route take was to eventually retire 
the legacy files altogether.

>> Real multiplexing would be providing something when reading and
>> when writing. The idea of average came while revieweing with
>> Chris the write multiplexing. Indeed it makes sense to provide
>> some common value, but I don't know how useful it can be to the
>> user (still if the user needs any average).
> 
> I think all read/write controls like min/max/boost_freq should return
> an error from the global interface if all the tiles don't return same
> value. Write will always overwrite per-tile values.

That would work I think, if the option chosen was not to retire the 
legacy files.

> When we have frequency readbacks without control, returning MAX() across
> tiles would be the logical thing. The fact that parts of the hardware can
> be clocked lower when one part is fully utilized is the "new feature".
> 
> After that we're only really left with the rc6_residency_ms. And that is
> the tough one. I'm inclined that MIN() across tiles would be the right
> answer. If you are fully utilizing a single tile, you should be able to
> see it.
  So we have MIN, AVG or SUM, or errno, or remove the file (which is 
just a different kind of errno?) to choose from. :)

Regards,

Tvrtko

> This all would be what feels natural for an user who has their setup
> tuned for single-tile device. And would allow simple round-robing
> balancing across the tiles in somewhat coherent manner.
