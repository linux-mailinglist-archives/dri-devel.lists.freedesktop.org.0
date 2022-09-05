Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8BF5AD21D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 14:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C0B10E33F;
	Mon,  5 Sep 2022 12:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C965810E31A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 12:10:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CACCB5C0116;
 Mon,  5 Sep 2022 08:10:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 05 Sep 2022 08:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1662379804; x=
 1662466204; bh=AZ4dQBzImW2tHrdACV6XOzXH3AtSXVLO9nUPVtHh6G4=; b=P
 XNUMtZP/LQxf/pkq9rs5FPGGK6CaoE+XmwQMkCOmtnI7vHTzSaoVHgPDhY9QIuGo
 DLF7S2VD9BaKiitRAhPOk4AyuU5dIomPsvJ8TrxVZcEy4dEArf1SOogUgiGdFS4V
 KIz2o7Vfqv8PGEDOMEZHvDFOSraStSZFSI2hs8qjTLYhOUt48FVrGWL0Vt6Ck/OR
 VoKRkTnCSDwVhrxuqi4rOXpU+vOczeXoLscdC8k07ndxg9CrsvAMVWm0cYo7LVOV
 L6QfNhbcwndE3i9/SMnmkjvYlssTmhbqeL+s1NvwuxFnM7T3tlB2+QLaV/iDw8eZ
 0gVR6jfJ8XSOy2GYobYJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662379804; x=
 1662466204; bh=AZ4dQBzImW2tHrdACV6XOzXH3AtSXVLO9nUPVtHh6G4=; b=4
 Xps4K7rSCVxlGOkgti8NiEDry/OecDw1B5af385Kn6/A7XVx4uaszCKZJTxlG+vM
 N2X4b5Pq8SW0jWnOrrJRwDQzpIt938ta8Ojc+J+XWs0pUtdYzirowZJ8UKy3332r
 ShJnb3OlJPZZrwOjPnCYvAeIv2YjM1AbuF2wyfeDR8tPtQxBHLyCJlJ0dV5yY0zz
 XQsx6EROgNvfx8P4ysZNQZT4w/Aw0+PiPwlAmEKYJgv95y9XQUplxIzQU1XrEY1X
 uCubWFSX/cODkbs3ltcbdhSXeMHSq0ZR4n2mYXmTyWAaO0v7dg6rL+SSjry9hdpB
 Ur8Ezkurw2DdTYZrlc+kg==
X-ME-Sender: <xms:G-cVY_dUypXZVeIhRkPpR0StdmG5mQwaLYn7oxHHw6wp6DnVAao4tQ>
 <xme:G-cVY1MzJl2ZcW9itcF9tk5605ABHqc4MhOCqEyFLzRp58lOMfje0erZtzTCeYOyA
 siZmj4ER898Zv2cWSc>
X-ME-Received: <xmr:G-cVY4jERD0hsnOs8cT_Ah0pYvBaf2jwbmXka4Er9kMz6cIRoRoiA24GIYk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudeikefffeegvddvfeetfeekkedvteffffehtddttdfgfeehlefgleev
 udeviedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:G-cVYw9KHUGIl3jCDIX0_emDrvZSH3vbI48zm5QIvu5g91lNCy4Glg>
 <xmx:G-cVY7vGGY6EaRGHU9YQDggeo0KX8DlCHirg6Yj5Ltw4pnT8VYb1_A>
 <xmx:G-cVY_E70Iiv_mmFRufCu-fM_HKsCpHy94zXyLGAMO7bs6bf2GlsGg>
 <xmx:HOcVY2n_nAXQhqR2XTSLnVF6xHM5PW1_spth7epSxXZoTHVAdC8DjA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 08:10:03 -0400 (EDT)
Date: Mon, 5 Sep 2022 14:10:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
Message-ID: <20220905121000.m2xppgjlfjlmppfr@houat>
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
 <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
 <87h71qfbi9.fsf@intel.com> <20220902123400.5ljgc7z6zw34d64m@houat>
 <87mtbidj3b.fsf@intel.com>
 <20220902133828.ufwp6bgzd37yu6bv@nostramo.hardline.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220902133828.ufwp6bgzd37yu6bv@nostramo.hardline.pl>
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
Cc: David Gow <davidgow@google.com>, siqueirajordao@riseup.net,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 tales.aparecida@gmail.com, Arthur Grillo <arthur.grillo@usp.br>,
 brendanhiggins@google.com, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, mwen@igalia.com,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 02, 2022 at 03:38:28PM +0200, Micha=C5=82 Winiarski wrote:
> On Fri, Sep 02, 2022 at 04:03:20PM +0300, Jani Nikula wrote:
> > On Fri, 02 Sep 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Fri, Sep 02, 2022 at 11:04:14AM +0300, Jani Nikula wrote:
> > >> On Thu, 01 Sep 2022, Ma=C3=ADra Canal <mairacanal@riseup.net> wrote:
> > >> > Hi Maxime,
> > >> >
> > >> > On 9/1/22 09:55, Maxime Ripard wrote:
> > >> >> Hi,
> > >> >>=20
> > >> >> On Thu, Sep 01, 2022 at 09:42:10AM -0300, Ma=C3=ADra Canal wrote:
> > >> >>> With the introduction of KUnit, IGT is no longer the only option=
 to run
> > >> >>> the DRM unit tests, as the tests can be run through kunit-tool o=
r on
> > >> >>> real hardware with CONFIG_KUNIT.
> > >> >>>
> > >> >>> Therefore, remove the "igt_" prefix from the tests and replace i=
t with
> > >> >>> the "test_drm_" prefix, making the tests' names independent from=
 the tool
> > >> >>> used.
> > >> >>>
> > >> >>> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> > >> >>>
> > >> >>> ---
> > >> >>> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.19173=
4-1-mairacanal@riseup.net/
> > >> >>> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit co=
nfusing (Jani Nikula).
> > >> >>=20
> > >> >> I appreciate it's a bit of a bikeshed but I disagree with this. T=
he
> > >> >> majority of the kunit tests already out there start with the fram=
ework
> > >> >> name, including *all* the examples in the kunit doc. Plus, it's f=
airly
> > >> >> obvious that it's a test, kunit is only about running tests in th=
e first
> > >> >> place.
> > >> >
> > >> > Would it be better to keep it as "drm_"?
> > >>=20
> > >> That's not "keeping". That's renaming igt to drm.
> > >
> > > Well, there's like half the tests that are prefixed with drm, the oth=
er
> > > with igt, so it's both really
> > >
> > >> > Currently, I don't think it is appropriate to hold the "igt_" pref=
ix, as
> > >> > the tests are not IGT exclusive, but I don't have a strong opinion=
 on
> > >> > using the "drm_" or the "test_drm" prefixes.
> > >>=20
> > >> I repeat my stance that "drm_" alone is confusing.
> > >
> > > What are you confusing it with?
> > >
> > >> For the reason alone that it pollutes the code tagging tools, mixing
> > >> actual drm_ types and functions with unit test functions.
> > >
> > > I don't get it, I'm sorry. All these functions are static and not part
> > > of any API, so I can't see how it would pollute a code tagging tool. =
Or
> > > at least, not more than any driver does.
> > >
> > > And we're part of a larger project here, it's about consistency with =
the
> > > rest of the ecosystem.
> >=20
> > Okay, so I'm just going to explain what I mean, but say "whatever" right
> > after and move on.
> >=20
> > For example, drm_buddy_test.c includes drm_buddy.h so with the igt_ ->
> > drm_ rename none of the test functions may clash with the drm_buddy_
> > prefixed existing functions. Ditto for all tests similarly.
> >=20
> > For example drm_buddy_alloc_range() as a name sounds like something that
> > allocs a range, not something that tests range allocation. On the other
> > hand, you have drm_buddy_alloc_blocks() which is actually a real
> > drm_buddy function, not a test. What would you call a test that tests
> > that? Here, we end up with names that are all prefixed drm_buddy and you
> > won't know what's the actual function and what's the test unless you
> > look it up.
> >=20
> > I use code tagging that I can use for finding and completing
> > e.g. functions. Currently I have the following completions, for
> > igt_buddy_ and drm_buddy_, respectively:
> >=20
> > Possible completions are:
> > igt_buddy_alloc_limit 	igt_buddy_alloc_optimistic 	igt_buddy_alloc_path=
ological
> > igt_buddy_alloc_pessimistic 	igt_buddy_alloc_range 	igt_buddy_alloc_smo=
ke
> >=20
> > Possible completions are:
> > drm_buddy_alloc_blocks 	drm_buddy_block 	drm_buddy_block_is_allocated 	=
drm_buddy_block_is_free
> > drm_buddy_block_is_split 	drm_buddy_block_offset 	drm_buddy_block_order=
 	drm_buddy_block_print
> > drm_buddy_block_size 	drm_buddy_block_state 	drm_buddy_block_trim 	drm_=
buddy_fini
> > drm_buddy_free_block 	drm_buddy_free_list 	drm_buddy_init 	drm_buddy_in=
it_test
> > drm_buddy_module_exit 	drm_buddy_module_init 	drm_buddy_print
> >=20
> > With the patch at hand, they'll all be lumped under drm_buddy_
> > completions, and some of them will be actual drm buddy functions and
> > some not.
> >=20
> > I just find it a very odd convention to name the tests in a way that's
> > indistinguishable from the real things. Even *within* drm_buddy_test.c
> > where you read the test code. Because currently you do have calls to
> > igt_buddy_ prefixed functions from other igt_buddy_ prefixed functions,
> > along with the drm_buddy_ prefixed calls. I think it's just going to be
> > a mess.
> >=20
> > /rant
> >=20
> > Whatever. Moving on.
>=20
> KUnit docs [1] state:
> https://docs.kernel.org/dev-tools/kunit/style.html#test-cases
> "As tests are themselves functions, their names cannot conflict with other
> C identifiers in the kernel. This may require some creative naming."
> And give examples of names. But this should be local to individual test s=
uite -
> as long as the test is readable, and the name describes what it is testin=
g, we
> should be fine. We don't even need to pass drm_* prefix, as this conventi=
on is
> expected for test suites, not test cases [2].
>=20
> Having said that - I do believe that igt_* prefix don't belong here (whic=
h is
> why I'm progressively trying to get rid of in the patches that refactor s=
ome of
> the tests).
> I agree with Jani - can we take it on a case-by-case basis?
> If the test name is too similar to the function that it is testing, we co=
uld go
> with one of the following (taking igt_buddy_alloc_limit as example):
> drm_buddy_test_alloc_limit
> test_drm_buddy_alloc_limit
> buddy_test_alloc_limit
> test_buddy_alloc_limit

We also have drm_test_buddy_alloc_limit, or drm_buddy_test_alloc_limit

Both would be fine for me, with a small preference for the former, which
should also address Jani's concerns?

> And either of those is fine in my opinion (I'd personally go with
> test_buddy_alloc_limit in this case).
> We don't really need a DRM-wide (or worse, kernel wide) convention for te=
st case
> names (it's only really needed for test suites).

Sure we do. kunit.py can take some filters too. Being able to only run
DRM tests with a single filter is super convenient, and if we fail to
provide a consistent naming we're pretty much sure people running the
tests are going to miss some.

Maxime
