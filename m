Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CCD98568D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 11:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448B410E2E3;
	Wed, 25 Sep 2024 09:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+V5zu1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBC510E2DA;
 Wed, 25 Sep 2024 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727257308; x=1758793308;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Uf9i5FynzbB69Ks69/tJdrSZYfpuXS7XSLtnILe2hpo=;
 b=C+V5zu1Utokf6mAhnfzyXqmAUhzsMABulYgQ/73c4fCCfVDe3osS4zVn
 rkmRiGQ7PmpCtTd34lTTxTzxANEajDTgWwW1ZHZ6FjAAXW38AGMEJ2l8L
 GuLyIT2fuIhb3S9qosRZlvlofqEEUNnFKT43einQDjCaibz9fUENetX0p
 /SQhzkJ5tZjDwXIX0YlAUNm4J4JkuoiMyYm1LAR3JpiGCpxYzxKwA8wdP
 15ecWfdWVBe1Pzgyu/APPTEzCewtpMW4fLJ+xPgY7J0UM2G0cOaIuvBlU
 j/9Z9UMiCPFnL+CReMWVk08YfTcX/CwLa3QiR5341HeCY5PtYbiN5y7xX Q==;
X-CSE-ConnectionGUID: r8p+GoO8SbWo3AAV/nErMw==
X-CSE-MsgGUID: i2EIxCV6TKKXEu7zul7E2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36874350"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="36874350"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:41:47 -0700
X-CSE-ConnectionGUID: wTj9C/1YSbaFyAWS44Qtdw==
X-CSE-MsgGUID: YmAfpBmaQaOacxB2eT40VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="72539017"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:41:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Simona Vetter
 <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Carlos Eduardo Gallo Filho
 <gcarlos@disroot.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
In-Reply-To: <20240924-impressive-coua-from-hyperborea-bfff8b@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
 <20240924-handsome-labrador-of-shopping-b1dce5@houat>
 <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
 <87ed593v11.fsf@intel.com>
 <20240924-impressive-coua-from-hyperborea-bfff8b@houat>
Date: Wed, 25 Sep 2024 12:41:40 +0300
Message-ID: <87o74c2hpn.fsf@intel.com>
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

On Tue, 24 Sep 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Sep 24, 2024 at 06:56:26PM GMT, Jani Nikula wrote:
>> On Tue, 24 Sep 2024, Guenter Roeck <linux@roeck-us.net> wrote:
>> >>>> On Tue, Sep 24, 2024 at 12:06:28PM GMT, Simona Vetter wrote:
>> >>>>> Yeah I think long-term we might want a kunit framework so that we can
>> >>>>> catch dmesg warnings we expect and test for those, without those warnings
>> >>>>> actually going to dmesg. Similar to how the lockdep tests also reroute
>> >>>>> locking validation, so that the expected positive tests don't wreak
>> >>>>> lockdep for real.
>> >>>>>
>> >>>>> But until that exists, we can't have tests that splat in dmesg when they
>> >>>>> work as intended.
>> >
>> > FWIW, that is arguable. More and more tests are added which do add such splats,
>> > and I don't see any hesitance by developers to adding more. So far I counted
>> > two alone in this commit window, and that does not include new splats from
>> > tests which I had already disabled. I simply disable those tests or don't
>> > enable them in the first place if they are new. I did the same with the drm
>> > unit tests due to the splats generated by the scaling unit tests, so any
>> > additional drm unit test splats don't make a difference for me since the
>> > tests are already disabled.
>> 
>> What's the point of having unit tests that CI systems routinely have to
>> filter out of test runs? Or filter warnings generated by the tests,
>> potentially missing new warnings. Who is going to run the tests if the
>> existing CI systems choose to ignore them?
>
> If we turn this argument around, that means we can't write unit test for
> code that will create a warning.

The question really is, which warnings we get because of the
functionality being tested, and which warnings are due to an unexpected
and unrelated bug? Is it a pass or fail if the test triggers an
unrelated warning?

If the developer runs the tests, are they expected to look at dmesg and
inspect every warning to decide?

> IMO, this creates a bad incentive, and saying that any capable CI system
> should reject them is certainly opiniated.

All I'm saying it generates an extra burden for current real world CI
systems that run tests on a massive scale and even have paid
maintainers. It's not trivial to sort out expected and unexpected
warnings, and keep the filters updated every time the warnings
change. It's not without a cost. And the end result might just be that
the unit tests won't get run at all. Or warnings just get completely
ignored for kunit tests.

I don't completely disagree with you either. It's just that we don't
have that automation on the kernel side, and in the mean time, perhaps
we should be really conservative about the warnings we create in tests?

If we can't filter out the warnings kernel side, perhaps we could figure
out a way to annotate the kunit tests that generate warnings on passing
runs?


BR,
Jani.


-- 
Jani Nikula, Intel
