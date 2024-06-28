Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7142E91BB76
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149BE10E1DE;
	Fri, 28 Jun 2024 09:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWWjv671";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9528610E0FE;
 Fri, 28 Jun 2024 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719566950; x=1751102950;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=irwuLjcl11TTrmhJdTsbL+8hBZnUDoiZRTqW8w8y6GE=;
 b=GWWjv671muojDD61ofpKcsym/obDRMaRxBw4Kr7vdGB0TuYEsAm6bzd+
 FKdvrtUJgWklWHgelMDkGM06CHZ5mi3dEGqVLecVEq7n247kR7zUtj71i
 Mn6q1xpFNtmtUzkYIz7aPhvCzmlzzEEVtGOLUOc7bdeyrBm4ju5/N7QHR
 t51onh2KTJr5le9xEvpJGMKuN3axWIy5Kx/iCWFnXfn3dNrNZVud+5hn2
 omGWoOdiCvRE+MslIo8bv1mp3JtPp2GNatbeu2SnkWO0lbSoJxNbommVA
 HMD5d4Pghatjs2PQYw9Ezspm897KGVy2nx2an37Ful9AJI+FE0Cz7XTwA g==;
X-CSE-ConnectionGUID: +ggXH+vvRfq2eG657bfO+w==
X-CSE-MsgGUID: M+i+lq+BSXCdYFEOhICsGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16699019"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="16699019"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:29:10 -0700
X-CSE-ConnectionGUID: gKH/6+VzShqievIk8WOGZw==
X-CSE-MsgGUID: a2fev86RSlCE3mFciaK4BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="49640468"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:29:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
In-Reply-To: <CAPM=9tyNGA2wEgnsKdSyjHRGVikywZLdueZj=syTMFYEUNzxhw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240612141239.141ce8cc@canb.auug.org.au>
 <ZnCMUEd9dQ6bLNet@intel.com>
 <CAPM=9tyNGA2wEgnsKdSyjHRGVikywZLdueZj=syTMFYEUNzxhw@mail.gmail.com>
Date: Fri, 28 Jun 2024 12:29:01 +0300
Message-ID: <87ed8hbele.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 28 Jun 2024, Dave Airlie <airlied@gmail.com> wrote:
> On Tue, 18 Jun 2024 at 05:26, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>
>> On Wed, Jun 12, 2024 at 02:12:39PM +1000, Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > After merging the drm-intel tree, today's linux-next build (i386
>> > defconfig) failed like this:
>> >
>> > x86_64-linux-gnu-ld: drivers/gpu/drm/i915/display/intel_vrr.o: in func=
tion `intel_vrr_compute_config':
>> > intel_vrr.c:(.text+0x4e4): undefined reference to `__udivdi3'
>> >
>> > Caused by commit
>> >
>> >   1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
>> >
>> > I have reverted that commit for today.
>>
>> the fixes for that is available in drm-intel-next now. you should probab=
ly
>> remove the revert.
>>
>> Thanks for the heads up on that.
>
> In file included from
> /home/airlied/devel/kernel/dim/src/arch/arm/include/asm/div64.h:107,
>                  from /home/airlied/devel/kernel/dim/src/include/linux/ma=
th.h:6,
>                  from
> /home/airlied/devel/kernel/dim/src/include/linux/kernel.h:27,
>                  from
> /home/airlied/devel/kernel/dim/src/include/linux/cpumask.h:11,
>                  from /home/airlied/devel/kernel/dim/src/include/linux/sm=
p.h:13,
>                  from
> /home/airlied/devel/kernel/dim/src/include/linux/lockdep.h:14,
>                  from
> /home/airlied/devel/kernel/dim/src/include/linux/spinlock.h:63,
>                  from
> /home/airlied/devel/kernel/dim/src/include/linux/kref.h:16,
>                  from
> /home/airlied/devel/kernel/dim/src/include/drm/drm_device.h:5,
>                  from
> /home/airlied/devel/kernel/dim/src/include/drm/drm_drv.h:35,
>                  from
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/xe/compat-i915-headers=
/i915_drv.h:13,
>                  from
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/display/intel_vrr=
.c:7:
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/display/intel_vrr=
.c:
> In function =E2=80=98cmrr_get_vtotal=E2=80=99:
> /home/airlied/devel/kernel/dim/src/include/asm-generic/div64.h:222:35:
> warning: comparison of distinct pointer types lacks a cast
>   222 |         (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0));  \
>       |                                   ^~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/display/intel_vrr=
.c:155:35:
> note: in expansion of macro =E2=80=98do_div=E2=80=99
>   155 |         crtc_state->cmrr.cmrr_m =3D do_div(adjusted_pixel_rate,
> crtc_state->cmrr.cmrr_n);
>       |                                   ^~~~~~
>
> The fixes might need some more fixing, 32-bit arm build.

Hmm. Works for me with commit 213cc30331e9 ("drm/i915/display: Consider
adjusted_pixel_rate to be u64"). Are you hitting this with drm/next
which doesn't have that yet?

BR,
Jani.


>
> Dave.
>
>>
>> >
>> > --
>> > Cheers,
>> > Stephen Rothwell
>>
>>

--=20
Jani Nikula, Intel
