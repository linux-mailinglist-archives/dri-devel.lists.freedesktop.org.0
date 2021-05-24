Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE9038E609
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 14:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB866E247;
	Mon, 24 May 2021 12:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114DD6E241;
 Mon, 24 May 2021 12:00:32 +0000 (UTC)
IronPort-SDR: WdCgc2l6/0u2Gly1mfd1ko33QvUrmu+Olnyi9LIxvMuv3jOVIMS8g1L5WE4KbH7AEL7MRMAIsP
 reiDKZXCYD7A==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="223070025"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="223070025"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 05:00:32 -0700
IronPort-SDR: DmVkewsTc8dFClVYojFAJXpmArmJaA3AtFzd9tiyoFt0F1U75giPzrozdamwBvm1F6aX3cj4oZ
 CcwzVx8BybIg==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="475838436"
Received: from jaherrex-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.50.169])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 05:00:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Deucher\, Alexander" <Alexander.Deucher@amd.com>,
 "dim-tools\@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>
Subject: RE: [drm-rerere PATCH] nightly.conf: drop amd branches from drm-tip
In-Reply-To: <MN2PR12MB44884924C665EE6EDF3E17A2F72B9@MN2PR12MB4488.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210519084932.8666-1-jani.nikula@intel.com>
 <MN2PR12MB44884924C665EE6EDF3E17A2F72B9@MN2PR12MB4488.namprd12.prod.outlook.com>
Date: Mon, 24 May 2021 15:00:26 +0300
Message-ID: <87h7iscpet.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 May 2021, "Deucher, Alexander" <Alexander.Deucher@amd.com> wrote:
> [AMD Public Use]
>
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@intel.com>
>> Sent: Wednesday, May 19, 2021 4:50 AM
>> To: dim-tools@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
>> jani.nikula@intel.com; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> Daniel Vetter <daniel.vetter@ffwll.ch>
>> Subject: [drm-rerere PATCH] nightly.conf: drop amd branches from drm-tip
>>=20
>> We've had a stale repo for amd in drm-tip since around v4.15 i.e. for mo=
re
>> than three years. Nobody seems to notice or care. Drop the amd branches
>> from drm-tip.
>>=20
>> Having the current amd branches in drm-tip would be nice to have, if onl=
y to
>> have a common drm integration tree. However, maintaining that has a cost
>> due to the inevitable conflicts. We can add the branches back if and when
>> there's interest in sharing the burden.
>>=20
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks, pushed out and rebuilt drm-tip.

BR,
Jani.


>
>> ---
>>  nightly.conf | 9 ---------
>>  1 file changed, 9 deletions(-)
>>=20
>> diff --git a/nightly.conf b/nightly.conf index 9211550ef75c..35fb1d9ba600
>> 100644
>> --- a/nightly.conf
>> +++ b/nightly.conf
>> @@ -40,12 +40,6 @@ git://anongit.freedesktop.org/drm-misc
>>=20
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fano
>> ngit.freedesktop.org%2Fgit%2Fdrm%2Fdrm-
>> misc&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7C5903896cf
>> 2e642afb05408d91aa30f6d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7
>> C0%7C637570109906926805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
>> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
>> p;sdata=3DespN%2BoIX9SjLh2Py%2FkqlVsi0p9Ru%2Fet2M11XWqJ5eUQ%3D&a
>> mp;reserved=3D0
>>=20
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fano
>> ngit.freedesktop.org%2Fgit%2Fdrm%2Fdrm-
>> misc.git&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7C590389
>> 6cf2e642afb05408d91aa30f6d%7C3dd8961fe4884e608e11a82d994e183d%7C0
>> %7C0%7C637570109906926805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC
>> 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&
>> amp;sdata=3DE5cwRH0Pr9JkIfIMNkNzjlLn5hN6k0inxBkk%2Bwhd1lk%3D&amp;r
>> eserved=3D0
>>  "
>> -drm_tip_repos[drm-amd]=3D"
>> -ssh://git.freedesktop.org/git/drm/drm-amd
>> -git://anongit.freedesktop.org/drm/drm-amd
>> -
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fano
>> ngit.freedesktop.org%2Fgit%2Fdrm%2Fdrm-
>> amd&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7C5903896cf
>> 2e642afb05408d91aa30f6d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7
>> C0%7C637570109906926805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
>> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
>> p;sdata=3D1kQe4t89CyANqRhNUpQ2RP3Ndz7A3sdd%2FiWZ7FmKHM4%3D&a
>> mp;reserved=3D0
>> -
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fano
>> ngit.freedesktop.org%2Fgit%2Fdrm%2Fdrm-
>> amd.git&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7C590389
>> 6cf2e642afb05408d91aa30f6d%7C3dd8961fe4884e608e11a82d994e183d%7C0
>> %7C0%7C637570109906926805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC
>> 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&
>> amp;sdata=3DvVqMWMbdJFHJW8j09tn1m7ItGSL0RmfeDbJZFWoYBf4%3D&am
>> p;reserved=3D0
>> -"
>>  drm_tip_repos[drm]=3D"
>>  ssh://git.freedesktop.org/git/drm/drm
>>  git://anongit.freedesktop.org/drm/drm
>> @@ -76,17 +70,14 @@ drm_tip_config=3D(
>>  	"drm			drm-fixes"
>>  	"drm-misc		drm-misc-fixes"
>>  	"drm-intel		drm-intel-fixes"
>> -	"drm-amd		drm-amd-fixes"
>>=20
>>  	"drm			drm-next"
>>  	"drm-misc		drm-misc-next-fixes"
>>  	"drm-intel		drm-intel-next-fixes"
>> -	"drm-amd		drm-amd-next-fixes"
>>=20
>>  	"drm-misc		drm-misc-next"
>>  	"drm-intel		drm-intel-next"
>>  	"drm-intel		drm-intel-gt-next"
>> -	"drm-amd		drm-amd-next"
>>=20
>>  	"sound-upstream		for-linus"
>>  	"sound-upstream		for-next"
>> --
>> 2.20.1

--=20
Jani Nikula, Intel Open Source Graphics Center
