Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373EB5AB11A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 15:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7674D10E831;
	Fri,  2 Sep 2022 13:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA8910E82F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662123826; x=1693659826;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Dmk810uUIC5pea3YjGIuO/qqCH1zu8nwNivf+g80rEo=;
 b=hKgyHVC9kh2pLmoUyid4U4d6o9Zgo2qA03ruALFYeFQWiYOWiCDsTyed
 AXO74R6ZD2y5OcvAezE/SaQicjHDLZ6xlgW7pB3x5G1WEeBSDpgn1/VtK
 Ozjj6e2kXp/5mQJCmSnjMAH43yXcbq4wgu1GLAQWzRLJaBeTvV2vRiLjA
 JGOb9QwaP/fGPD2r2WQj16T2WglZYyBLfj7NqhE8B5bUCEv40kX/sZmf6
 SNgYRMVJAiTYKQZL8ssFw7Npyw1sVPLZ4YFyLZ3AcKsLRnj3HnpHpalXh
 x+5Ju/KHvBTK+YoW1qihTd3HbdS1YJMlgu2ZywW2P/2m8+7k3LLR5bCpL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="382272956"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="382272956"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:03:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674347042"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:03:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
In-Reply-To: <20220902123400.5ljgc7z6zw34d64m@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
 <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
 <87h71qfbi9.fsf@intel.com> <20220902123400.5ljgc7z6zw34d64m@houat>
Date: Fri, 02 Sep 2022 16:03:20 +0300
Message-ID: <87mtbidj3b.fsf@intel.com>
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
Cc: michal.winiarski@intel.com, David Gow <davidgow@google.com>,
 siqueirajordao@riseup.net, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 Arthur Grillo <arthur.grillo@usp.br>, brendanhiggins@google.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mwen@igalia.com,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 kunit-dev@googlegroups.com,
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 02 Sep 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Sep 02, 2022 at 11:04:14AM +0300, Jani Nikula wrote:
>> On Thu, 01 Sep 2022, Ma=C3=ADra Canal <mairacanal@riseup.net> wrote:
>> > Hi Maxime,
>> >
>> > On 9/1/22 09:55, Maxime Ripard wrote:
>> >> Hi,
>> >>=20
>> >> On Thu, Sep 01, 2022 at 09:42:10AM -0300, Ma=C3=ADra Canal wrote:
>> >>> With the introduction of KUnit, IGT is no longer the only option to =
run
>> >>> the DRM unit tests, as the tests can be run through kunit-tool or on
>> >>> real hardware with CONFIG_KUNIT.
>> >>>
>> >>> Therefore, remove the "igt_" prefix from the tests and replace it wi=
th
>> >>> the "test_drm_" prefix, making the tests' names independent from the=
 tool
>> >>> used.
>> >>>
>> >>> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
>> >>>
>> >>> ---
>> >>> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-=
mairacanal@riseup.net/
>> >>> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit confus=
ing (Jani Nikula).
>> >>=20
>> >> I appreciate it's a bit of a bikeshed but I disagree with this. The
>> >> majority of the kunit tests already out there start with the framework
>> >> name, including *all* the examples in the kunit doc. Plus, it's fairly
>> >> obvious that it's a test, kunit is only about running tests in the fi=
rst
>> >> place.
>> >
>> > Would it be better to keep it as "drm_"?
>>=20
>> That's not "keeping". That's renaming igt to drm.
>
> Well, there's like half the tests that are prefixed with drm, the other
> with igt, so it's both really
>
>> > Currently, I don't think it is appropriate to hold the "igt_" prefix, =
as
>> > the tests are not IGT exclusive, but I don't have a strong opinion on
>> > using the "drm_" or the "test_drm" prefixes.
>>=20
>> I repeat my stance that "drm_" alone is confusing.
>
> What are you confusing it with?
>
>> For the reason alone that it pollutes the code tagging tools, mixing
>> actual drm_ types and functions with unit test functions.
>
> I don't get it, I'm sorry. All these functions are static and not part
> of any API, so I can't see how it would pollute a code tagging tool. Or
> at least, not more than any driver does.
>
> And we're part of a larger project here, it's about consistency with the
> rest of the ecosystem.

Okay, so I'm just going to explain what I mean, but say "whatever" right
after and move on.

For example, drm_buddy_test.c includes drm_buddy.h so with the igt_ ->
drm_ rename none of the test functions may clash with the drm_buddy_
prefixed existing functions. Ditto for all tests similarly.

For example drm_buddy_alloc_range() as a name sounds like something that
allocs a range, not something that tests range allocation. On the other
hand, you have drm_buddy_alloc_blocks() which is actually a real
drm_buddy function, not a test. What would you call a test that tests
that? Here, we end up with names that are all prefixed drm_buddy and you
won't know what's the actual function and what's the test unless you
look it up.

I use code tagging that I can use for finding and completing
e.g. functions. Currently I have the following completions, for
igt_buddy_ and drm_buddy_, respectively:

Possible completions are:
igt_buddy_alloc_limit 	igt_buddy_alloc_optimistic 	igt_buddy_alloc_patholog=
ical
igt_buddy_alloc_pessimistic 	igt_buddy_alloc_range 	igt_buddy_alloc_smoke

Possible completions are:
drm_buddy_alloc_blocks 	drm_buddy_block 	drm_buddy_block_is_allocated 	drm_=
buddy_block_is_free
drm_buddy_block_is_split 	drm_buddy_block_offset 	drm_buddy_block_order 	dr=
m_buddy_block_print
drm_buddy_block_size 	drm_buddy_block_state 	drm_buddy_block_trim 	drm_budd=
y_fini
drm_buddy_free_block 	drm_buddy_free_list 	drm_buddy_init 	drm_buddy_init_t=
est
drm_buddy_module_exit 	drm_buddy_module_init 	drm_buddy_print

With the patch at hand, they'll all be lumped under drm_buddy_
completions, and some of them will be actual drm buddy functions and
some not.

I just find it a very odd convention to name the tests in a way that's
indistinguishable from the real things. Even *within* drm_buddy_test.c
where you read the test code. Because currently you do have calls to
igt_buddy_ prefixed functions from other igt_buddy_ prefixed functions,
along with the drm_buddy_ prefixed calls. I think it's just going to be
a mess.

/rant

Whatever. Moving on.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
