Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E9493BD1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 15:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54DA10EA19;
	Wed, 19 Jan 2022 14:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05F710E9F1;
 Wed, 19 Jan 2022 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642601803; x=1674137803;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=d7hVq3oxHgek+LZjbNjbhxHHdzW6IMVr8vZX6/zGsrc=;
 b=aNnY8icCbsWxwY7sIbaOgmz7QJ1+jLHuqMQg7Ek6103MFuPfuCG7gwXC
 i19mJ0w36G1t4FE0MKaHAVbuIX5SSlResG6HkTVqqcKxBQoIyML0o0SF/
 0GSZYC8wW2YJwYQPUUq9mJZMmr7PfdZaAqhNYf/ky3fntuNqZEkmVQGp/
 9ITB8iexKA9vZjkzb4hO63uf1ypCq2XQJM4U+FnEypSj1RCCX5T2e6sQD
 jY3DT85Fj+YMH7+x9linwpT1V7iq1dOWukxTAOMgnD1B496rWQhdlFy57
 f8268Nkp8ZorVG4dPasBUuz4Vb3VVE+bJYw1RjyubIoiZKB9fw86e5KlI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245271579"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="245271579"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 06:16:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="477387201"
Received: from elenadel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 06:16:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 0/3] lib/string_helpers: Add a few string helpers
In-Reply-To: <YegPiR7LU8aVisMf@alley>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <YegPiR7LU8aVisMf@alley>
Date: Wed, 19 Jan 2022 16:16:12 +0200
Message-ID: <87tudzbykz.fsf@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Mikita Lipski <mikita.lipski@amd.com>,
 amd-gfx@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Raju Rangoju <rajur@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Eryk Brol <eryk.brol@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, "David S
 . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jan 2022, Petr Mladek <pmladek@suse.com> wrote:
> On Tue 2022-01-18 23:24:47, Lucas De Marchi wrote:
>> Add some helpers under lib/string_helpers.h so they can be used
>> throughout the kernel. When I started doing this there were 2 other
>> previous attempts I know of, not counting the iterations each of them
>> had:
>>=20
>> 1) https://lore.kernel.org/all/20191023131308.9420-1-jani.nikula@intel.c=
om/
>> 2) https://lore.kernel.org/all/20210215142137.64476-1-andriy.shevchenko@=
linux.intel.com/#t
>>=20
>> Going through the comments I tried to find some common ground and
>> justification for what is in here, addressing some of the concerns
>> raised.
>>=20
>> d. This doesn't bring onoff() helper as there are some places in the
>>    kernel with onoff as variable - another name is probably needed for
>>    this function in order not to shadow the variable, or those variables
>>    could be renamed.  Or if people wanting  <someprefix>
>>    try to find a short one
>
> I would call it str_on_off().
>
> And I would actually suggest to use the same style also for
> the other helpers.
>
> The "str_" prefix would make it clear that it is something with
> string. There are other <prefix>_on_off() that affect some
> functionality, e.g. mute_led_on_off(), e1000_vlan_filter_on_off().
>
> The dash '_' would significantly help to parse the name. yesno() and
> onoff() are nicely short and kind of acceptable. But "enabledisable()"
> is a puzzle.
>
> IMHO, str_yes_no(), str_on_off(), str_enable_disable() are a good
> compromise.
>
> The main motivation should be code readability. You write the
> code once. But many people will read it many times. Open coding
> is sometimes better than misleading macro names.
>
> That said, I do not want to block this patchset. If others like
> it... ;-)

I don't mind the names either way. Adding the prefix and dashes is
helpful in that it's possible to add the functions first and convert
users at leisure, though with a bunch of churn, while using names that
collide with existing ones requires the changes to happen in one go.

What I do mind is grinding this series to a halt once again. I sent a
handful of versions of this three years ago, with inconclusive
bikeshedding back and forth, eventually threw my hands up in disgust,
and walked away.

>
>
>> e. One alternative to all of this suggested by Christian K=C3=B6nig
>>    (43456ba7-c372-84cc-4949-dcb817188e21@amd.com) would be to add a
>>    printk format. But besides the comment, he also seemed to like
>>    the common function. This brought the argument from others that the
>>    simple yesno()/enabledisable() already used in the code is easier to
>>    remember and use than e.g. %py[DOY]
>
> Thanks for not going this way :-)
>
>> Last patch also has some additional conversion of open coded cases. I
>> preferred starting with drm/ since this is "closer to home".
>>=20
>> I hope this is a good summary of the previous attempts and a way we can
>> move forward.
>>=20
>> Andrew Morton, Petr Mladek, Andy Shevchenko: if this is accepted, my
>> proposal is to take first 2 patches either through mm tree or maybe
>> vsprintf. Last patch can be taken later through drm.
>
> I agree with Andy that it should go via drm tree. It would make it
> easier to handle potential conflicts.
>
> Just in case, you decide to go with str_yes_no() or something similar.
> Mass changes are typically done at the end on the merge window.
> The best solution is when it can be done by a script.
>
> Best Regards,
> Petr

--=20
Jani Nikula, Intel Open Source Graphics Center
