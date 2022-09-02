Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAF5AA9EA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 10:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3432D10E7D2;
	Fri,  2 Sep 2022 08:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C658F10E7BE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662107111; x=1693643111;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=H9oHbXM3gEQ38vlwRtxoT0imlgiBARzw4vLE3Lcj4Oo=;
 b=dhDd9PdFdXH8+J0a5rBi16hgd5q0131loWWp7DHnSkhaA0b+RmfHe+Wp
 Qxhd8lOYFA+NhSuAHSs+x3r6uihKWOTZNx2cc2pLJH3h3Cmpyd8ArrqIn
 lYSAOPSQEAVplyEtIHXTeJHB+7KtdXTmPXbBAtQ8EoF0QuxhThrgL1hJs
 3gd4OnpyF3S+YdX45Ea5CYhkkg2rY6ANDRg6rk4e0UiSBPVqNE9q7SD+v
 dIkZq0bBu7ENErx0FY81kiclcOvDPEVgAbCk8Sqh/X4hwOl22F7Qg/D9l
 FEfjtJFDaqLy7phQuCLZftj2LFFGcdvXyj0AOOsiCM4Cu4LKNptabyT7j w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="293509634"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="293509634"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 01:25:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674262908"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 01:25:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mairacanal@riseup.net>
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
In-Reply-To: <20220902080817.is2dqqe5sxxhj6qo@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
 <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
 <20220902080817.is2dqqe5sxxhj6qo@houat>
Date: Fri, 02 Sep 2022 11:24:54 +0300
Message-ID: <874jxqfajt.fsf@intel.com>
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

On Fri, 02 Sep 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> On Thu, Sep 01, 2022 at 07:33:18PM -0300, Ma=C3=ADra Canal wrote:
>> Hi Maxime,
>>=20
>> On 9/1/22 09:55, Maxime Ripard wrote:
>> > Hi,
>> >=20
>> > On Thu, Sep 01, 2022 at 09:42:10AM -0300, Ma=C3=ADra Canal wrote:
>> >> With the introduction of KUnit, IGT is no longer the only option to r=
un
>> >> the DRM unit tests, as the tests can be run through kunit-tool or on
>> >> real hardware with CONFIG_KUNIT.
>> >>
>> >> Therefore, remove the "igt_" prefix from the tests and replace it with
>> >> the "test_drm_" prefix, making the tests' names independent from the =
tool
>> >> used.
>> >>
>> >> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
>> >>
>> >> ---
>> >> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-m=
airacanal@riseup.net/
>> >> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit confusi=
ng (Jani Nikula).
>> >=20
>> > I appreciate it's a bit of a bikeshed but I disagree with this. The
>> > majority of the kunit tests already out there start with the framework
>> > name, including *all* the examples in the kunit doc. Plus, it's fairly
>> > obvious that it's a test, kunit is only about running tests in the fir=
st
>> > place.
>>=20
>> Would it be better to keep it as "drm_"?
>>=20
>> Currently, I don't think it is appropriate to hold the "igt_" prefix, as
>> the tests are not IGT exclusive, but I don't have a strong opinion on
>> using the "drm_" or the "test_drm" prefixes.
>
> Yes, using drm as our prefix everywhere seems like a good idea :)

Disagreed for reasons explained in other mails.

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
