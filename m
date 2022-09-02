Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E95AA960
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 10:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCE810E7A2;
	Fri,  2 Sep 2022 08:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D5810E7A2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662105871; x=1693641871;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ryxTvjqPtRJ1iLn6tKKvj0lZz/JErC3NEAnjqxZHNG4=;
 b=Ebc4UhyRWo650w8CHCJJ8Lb8RaKNFYSDwUtvdcDrK5zQJELDmdtXjSmj
 Jg3uMqpbV9ArQRECMJokfAzTQQw+kAaDAotN7WVlWociSPb3cDPThvaQv
 vHZQYCf2ZhqwQBeDPrRt/YFpWnfdYlPkpqynC5DVTAKycQg4QsdrQwBQW
 00Ty5sqHDYzTFD1zT1gJwhlJa8xh6qs2jDElWBqtcEjHn9xeUWcaXCqvr
 BO2jVM3s0GE4/QMv7kbeJuDQIpwj5jE96qRsbzPMHban6w4XMujEjyxpH
 4UEHOB6Yy49h6hRkFYpO66cN4UAZklj9L0NKc4tpT3oohfJLvd4AuREb5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282915056"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="282915056"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 01:04:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674255907"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 01:04:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>, Maxime Ripard
 <maxime@cerno.tech>
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
In-Reply-To: <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
 <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
Date: Fri, 02 Sep 2022 11:04:14 +0300
Message-ID: <87h71qfbi9.fsf@intel.com>
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
 linux-kernel@vger.kernel.org, mwen@igalia.com, kunit-dev@googlegroups.com,
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Sep 2022, Ma=C3=ADra Canal <mairacanal@riseup.net> wrote:
> Hi Maxime,
>
> On 9/1/22 09:55, Maxime Ripard wrote:
>> Hi,
>>=20
>> On Thu, Sep 01, 2022 at 09:42:10AM -0300, Ma=C3=ADra Canal wrote:
>>> With the introduction of KUnit, IGT is no longer the only option to run
>>> the DRM unit tests, as the tests can be run through kunit-tool or on
>>> real hardware with CONFIG_KUNIT.
>>>
>>> Therefore, remove the "igt_" prefix from the tests and replace it with
>>> the "test_drm_" prefix, making the tests' names independent from the to=
ol
>>> used.
>>>
>>> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
>>>
>>> ---
>>> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-mai=
racanal@riseup.net/
>>> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit confusing=
 (Jani Nikula).
>>=20
>> I appreciate it's a bit of a bikeshed but I disagree with this. The
>> majority of the kunit tests already out there start with the framework
>> name, including *all* the examples in the kunit doc. Plus, it's fairly
>> obvious that it's a test, kunit is only about running tests in the first
>> place.
>
> Would it be better to keep it as "drm_"?

That's not "keeping". That's renaming igt to drm.

> Currently, I don't think it is appropriate to hold the "igt_" prefix, as
> the tests are not IGT exclusive, but I don't have a strong opinion on
> using the "drm_" or the "test_drm" prefixes.

I repeat my stance that "drm_" alone is confusing. For the reason alone
that it pollutes the code tagging tools, mixing actual drm_ types and
functions with unit test functions.

BR,
Jani.



>
> Best Regards,
> - Ma=C3=ADra Canal
>
>>=20
>> Maxime
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
