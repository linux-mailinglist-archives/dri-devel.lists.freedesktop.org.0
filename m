Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81C3537E66
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 16:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402F810ECF0;
	Mon, 30 May 2022 14:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A00110ECF0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653919700; x=1685455700;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4UKqK9LTE8r/QhEwT/GHcr6rLTi06cgfbkbko9SrhVU=;
 b=a02bX00PkLEw1zZo8rJ44HnsmPMSlgxEqFZA66rNstSySsZ3NMDdy2EE
 uKf2xGofMe8KL1+QYa0lJLkFcIJXKXdEoFmIDVL7R6K6zUjnjjXaHCxYN
 qRTHy9n464cRhnnJX4iUw6kk5myDzQ44rmOtyMcfIVYIjuyn4VWD8qq/2
 Nv41L25/Msqf9hL9+Xj8e6MCCdW/D8qD3dBrsVDBkJoi/Zx/Ez9nSMzku
 0bcMY7/XghUU2YFByYBELGJOztDj5Ta9w7o6RgHwKn0ROp2KSzmTzNEQm
 5bUEA23Sj45qXQnufsmPBY9yuxwhDP6xjnBu9XqgWdlJoHSVMVvLf5PZD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="257072119"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="257072119"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 07:08:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="605206585"
Received: from jkuna-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.150.228])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 07:08:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
In-Reply-To: <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
 <87a6aztli2.fsf@intel.com> <877d63tleq.fsf@intel.com>
 <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
 <87czfvrwsv.fsf@intel.com>
 <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
Date: Mon, 30 May 2022 17:08:11 +0300
Message-ID: <874k17ru44.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <vireshk@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 May 2022, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, May 30, 2022 at 3:10 PM Jani Nikula <jani.nikula@intel.com> wrote:
>> >
>> > I think in general, most __packed annotations we have in the kernel are
>> > completely pointless because they do not change the structure layout on
>> > any architecture but instead just make member access slower on
>>
>> Please explain.
>>
>> They are used quite a bit for parsing blob data, or
>> serialization/deserialization, like in the EDID case at hand. Try
>> removing __attribute__((packed)) from include/drm/drm_edid.h and see the
>> sizeof(struct edid) on any architecture.
>
> The annotations for edid are completely correct and necessary. However
> other driver authors just slap __packed annotations on any structure
> even if the layout is not fixed at all like:

Right. Thanks for the examples.

> struct my_driver_priv {
>        struct device dev;
>        u8 causes_misalignment;
>        spinlock_t lock;
>        atomic_t counter;
> } __packed; /* this annotation is harmful because it breaks the atomics */

I wonder if this is something that could be caught with coccinelle. Or
sparse. Are there any cases where this combo is necessary? (I can't
think of any, but it's a low bar. ;)

Cc: Julia.

> or if the annotation does not change the layout like
>
> struct my_dma_descriptor {
>      __le64 address;
>      __le64 length;
> } __packed; /* does not change layout but makes access slow on some
> architectures */

Why is this the case, though? I'd imagine the compiler could figure this
out.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
