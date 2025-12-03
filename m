Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C81C9E11A
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 08:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254CD10E0EB;
	Wed,  3 Dec 2025 07:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YC8ahw3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A7010E078;
 Wed,  3 Dec 2025 07:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764747669; x=1796283669;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MUotNHdZvHfpLJp7wYS966EzQOmH3nsQfIzCutAez2E=;
 b=YC8ahw3O0A5N2c1TA5Ux1OIAIl1Cwc6DGGs3GmvZXIHtfbfErAjP/jOz
 OIeDSbRFR5TBU3pa/DsAAZuzg+yWgAcW2MuAd9CkYWkNe1eSU/IIXjWU7
 oFD/HRJtwXXvMQ1M3LxzkEoGnp1smIi4L2agl/tZqWa2zZBz88et0Uxab
 IUUTfVpi9GMeLU3PfQFlZnuW6S/yifxoPkbMU5YpPjkmYr1BSItQBI/I1
 KeHwlnUh97F9qeD+4CGnU4NbvQjkVNqy+BTqFOKeVE8omQPxWCBGr9qsM
 LhEf3/V8lJ/vSvD8YpZxh7jzrazp9Avmf9bMoM0eUTM94+kKU6bFKT03e g==;
X-CSE-ConnectionGUID: jqIyK7YpQb6ON81VnJBaiw==
X-CSE-MsgGUID: GOJaSljaRmC2f3EoQp/Cfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66692590"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66692590"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 23:41:08 -0800
X-CSE-ConnectionGUID: HHV6KETJT6+EV5w0j5UZpA==
X-CSE-MsgGUID: w/IK4FJjTC+v44lCVSxgpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="231945676"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 23:41:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kernel.h: drop STACK_MAGIC macro
In-Reply-To: <aS9XpaiGXn2upVKB@yury>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-2-yury.norov@gmail.com>
 <d854dadd78a43f589399e967def37a0eda3655c2@intel.com>
 <3m64k5fagw7hp2duo43t5fldyn6argdjripx3nn6onxbr6xu6w@iwiepyn5krf6>
 <aS9XpaiGXn2upVKB@yury>
Date: Wed, 03 Dec 2025 09:40:58 +0200
Message-ID: <e049b13451395843971de33b2fbd9058eb351850@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 02 Dec 2025, Yury Norov <yury.norov@gmail.com> wrote:
> On Tue, Dec 02, 2025 at 09:58:19PM +0100, Andi Shyti wrote:
>> Hi Jani,
>> 
>> On Mon, Dec 01, 2025 at 09:46:47AM +0200, Jani Nikula wrote:
>> > On Sat, 29 Nov 2025, "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
>> > > The macro is only used by i915. Move it to a local header and drop from
>> > > the kernel.h.
>> > >
>> > > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
>> > > ---
>> > >  drivers/gpu/drm/i915/i915_utils.h | 2 ++
>> > >  include/linux/kernel.h            | 2 --
>> > >  2 files changed, 2 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
>> > > index a0c892e4c40d..6c197e968305 100644
>> > > --- a/drivers/gpu/drm/i915/i915_utils.h
>> > > +++ b/drivers/gpu/drm/i915/i915_utils.h
>> > 
>> > i915_utils.h is on a diet itself. STACK_MAGIC is only used in selftests,
>> > please put this in i915_selftest.h.
>> > 
>> > I guess also need to include that from gt/selftest_ring_submission.c,
>> > the only one that uses STACK_MAGIC but doesn't include i915_selftest.h.
>> 
>> Doing this cleanups is a bit out of the scope of this patch.
>> Given that the patch itself has quite a good consensus, let move
>> it forward and I can take care of the i915 cleanup once it gets
>> merged.
>
> I'm already testing it in my tree:
>
> https://github.com/norov/linux/tree/sm1
>
> If everything is fine, I'll submit v2 with this change, otherwise will
> schedule it for future improvements.

I had a look,

Acked-by: Jani Nikula <jani.nikula@intel.com>



-- 
Jani Nikula, Intel
