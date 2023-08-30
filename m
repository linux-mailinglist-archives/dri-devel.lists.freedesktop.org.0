Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D1078D397
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801C310E10A;
	Wed, 30 Aug 2023 07:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1782310E109;
 Wed, 30 Aug 2023 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693380595; x=1724916595;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xrwROHZASAr2PwJ1YgIJlLvQMRhDiDKMqicU04oRlKY=;
 b=KCckaSFURZyOK51EZVeqOWMdkZd5kXAJZsohr3LBa7+jpsnshCThbdb3
 wvrv3rf5+7oX3AAyJNFJq1OcjVmYoZf76FoDNzVDqhqw/mjLdQ3saFUhi
 Li2NwwtDEPYpjjtV6LXgUviS1LgfXdTU4as9aAN6DyKR5vEEEdIsii1qx
 r5w9hRLv7mHmlQHIByMaFXRJhkhEhxIDPpoF04bp8NGtNJ9NmgoEkiT4C
 V8SgFKt35qeYWJIgH529Nnd+5KAohIOyB0eeJdnRpl7kezTgbnbKTvu2c
 32tfNkjcxTBt8hxWXGjMJoAWLv/h6S4qbk3pliKxDJMcvrqB2N0s3xlhS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360570109"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="360570109"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 00:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="882622351"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 00:29:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
In-Reply-To: <1e6aa1ff-9aa9-6b2f-84f4-e0304205085c@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com> <87il965gob.fsf@intel.com>
 <871qfm2kg1.fsf@intel.com>
 <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
 <87o7ip252r.fsf@intel.com> <87jztd2332.fsf@intel.com>
 <1e6aa1ff-9aa9-6b2f-84f4-e0304205085c@amd.com>
Date: Wed, 30 Aug 2023 10:29:46 +0300
Message-ID: <87h6oh0yz9.fsf@intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 "Wang, Yu
 \(Charlie\)" <Yu.Wang4@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
> On 2023-08-29 11:03, Jani Nikula wrote:
>> On Tue, 29 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>> On Tue, 29 Aug 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
>>>> On Tue, Aug 29, 2023 at 6:48=E2=80=AFAM Jani Nikula <jani.nikula@intel=
.com> wrote:
>>>>>
>>>>> On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>>>> On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
>>>>>>> On 2023-08-22 06:01, Jani Nikula wrote:
>>>>>>>> Over the past years I've been trying to unify the override and fir=
mware
>>>>>>>> EDID handling as well as EDID property updates. It won't work if d=
rivers
>>>>>>>> do their own random things.
>>>>>>> Let's check how to replace these references by appropriate ones or =
fork
>>>>>>> the function as reverting these patches causes regressions.
>>>>>>
>>>>>> I think the fundamental problem you have is conflating connector for=
cing
>>>>>> with EDID override. They're orthogonal. The .force callback has no
>>>>>> business basing the decisions on connector->edid_override. Force is
>>>>>> force, override is override.
>>>>>>
>>>>>> The driver isn't even supposed to know or care if the EDID originates
>>>>>> from the firmware loader or override EDID debugfs. drm_get_edid() wi=
ll
>>>>>> handle that for you transparently. It'll return the EDID, and you
>>>>>> shouldn't look at connector->edid_blob_ptr either. Using that will m=
ake
>>>>>> future work in drm_edid.c harder.
>>>>>>
>>>>>> You can't fix that with minor tweaks. I think you'll be better off
>>>>>> starting from scratch.
>>>>>>
>>>>>> Also, connector->edid_override is debugfs. You actually can change t=
he
>>>>>> behaviour. If your userspace, whatever it is, has been written to as=
sume
>>>>>> connector forcing if EDID override is set, you *do* have to fix that,
>>>>>> and set both.
>>>>>
>>>>> Any updates on fixing this, or shall we proceed with the reverts?
>
> There is a patch under internal reviews. It removes calls edid_override=20
> and drm_edid_override_connector_update as intended in this patchset but=20
> does not remove the functionality.

While I am happy to hear there's progress, I'm somewhat baffled the
review is internal. The commits that I suggested to revert were also
only reviewed internally, as far as I can see... And that's kind of the
problem.

Upstream code should be reviewed in public.


BR,
Jani.


>
> With the patch. both following git grep commands return nothing in=20
> amd-staging-drm-next.
>
> $ git grep drm_edid_override_connector_update -- drivers/gpu/drm/amd
> $ git grep edid_override -- drivers/gpu/drm/amd
>
> Best regards,
> Alex Hung
>
>>>>
>>>> What is the goal of the reverts?  I don't disagree that we may be
>>>> using the interfaces wrong, but reverting them will regess
>>>> functionality in the driver.
>>>
>>> The commits are in v6.5-rc1, but not yet in a release. No user depends
>>> on them yet. I'd strongly prefer them not reaching v6.5 final and users.
>>=20
>> Sorry for confusion here, that's obviously come and gone already. :(
>>=20
>>> The firmware EDID, override EDID, connector forcing, the EDID property,
>>> etc. have been and somewhat still are a hairy mess that we must keep
>>> untangling, and this isn't helping.
>>>
>>> I've put in crazy amounts of work on this, and I've added kernel-doc
>>> comments about stuff that should and should not be done, but they go
>>> unread and ignored.
>>>
>>> I really don't want to end up having to clean this up myself before I
>>> can embark on further cleanups and refactoring.
>>>
>>> And again, if the functionality in the driver depends on conflating two
>>> things that should be separate, it's probably not such a hot idea to let
>>> it reach users either. Even if it's just debugfs.
>>>
>>>
>>> BR,
>>> Jani.
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
