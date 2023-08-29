Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8A478C9A4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BB710E440;
	Tue, 29 Aug 2023 16:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051E910E433;
 Tue, 29 Aug 2023 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693326534; x=1724862534;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=h/5BDWoQsp2hHLilfpVN+Q6p4cj5EVTT59zqkxA8gw0=;
 b=ZNcTCsRQoYlJOMG+EpzZrHsMODgDAHm6IrhPJOPFxP2/fuLhAfGtvch+
 xEfWpe5EVYBFMuhf2e1rRdW1WHClJkHVl2QVhEGDJ79trKLsoG2I0i58N
 oXx2RIIvBtfsiYSlwf2s+B2BGPenG7Cz996noRgGyq/JKYzI3UeXqo9iP
 2j6uX+Q45Ysr0T4a1A7pCXRbFpfBJJTnV1aTr2AldmQUc/JMxWfeOatCM
 tmSOqjcsVRa8YKG7z+oyEmzQt/aKhLE3OPlln83kYV46/3ATWAZ0aTmLx
 TkFd40G2XVD6VAaNMUYu2/nii+cyYdd6bk5RKxPN/TO5VFvyta9gHAlwP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461791274"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="461791274"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="808749426"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="808749426"
Received: from mnefedov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.32.206])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:20:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
In-Reply-To: <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com> <87il965gob.fsf@intel.com>
 <871qfm2kg1.fsf@intel.com>
 <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
Date: Tue, 29 Aug 2023 19:20:28 +0300
Message-ID: <87o7ip252r.fsf@intel.com>
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
Cc: Alex Hung <alex.hung@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Tue, Aug 29, 2023 at 6:48=E2=80=AFAM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> > On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
>> >> On 2023-08-22 06:01, Jani Nikula wrote:
>> >>> Over the past years I've been trying to unify the override and firmw=
are
>> >>> EDID handling as well as EDID property updates. It won't work if dri=
vers
>> >>> do their own random things.
>> >> Let's check how to replace these references by appropriate ones or fo=
rk
>> >> the function as reverting these patches causes regressions.
>> >
>> > I think the fundamental problem you have is conflating connector forci=
ng
>> > with EDID override. They're orthogonal. The .force callback has no
>> > business basing the decisions on connector->edid_override. Force is
>> > force, override is override.
>> >
>> > The driver isn't even supposed to know or care if the EDID originates
>> > from the firmware loader or override EDID debugfs. drm_get_edid() will
>> > handle that for you transparently. It'll return the EDID, and you
>> > shouldn't look at connector->edid_blob_ptr either. Using that will make
>> > future work in drm_edid.c harder.
>> >
>> > You can't fix that with minor tweaks. I think you'll be better off
>> > starting from scratch.
>> >
>> > Also, connector->edid_override is debugfs. You actually can change the
>> > behaviour. If your userspace, whatever it is, has been written to assu=
me
>> > connector forcing if EDID override is set, you *do* have to fix that,
>> > and set both.
>>
>> Any updates on fixing this, or shall we proceed with the reverts?
>
> What is the goal of the reverts?  I don't disagree that we may be
> using the interfaces wrong, but reverting them will regess
> functionality in the driver.

The commits are in v6.5-rc1, but not yet in a release. No user depends
on them yet. I'd strongly prefer them not reaching v6.5 final and users.

The firmware EDID, override EDID, connector forcing, the EDID property,
etc. have been and somewhat still are a hairy mess that we must keep
untangling, and this isn't helping.

I've put in crazy amounts of work on this, and I've added kernel-doc
comments about stuff that should and should not be done, but they go
unread and ignored.

I really don't want to end up having to clean this up myself before I
can embark on further cleanups and refactoring.

And again, if the functionality in the driver depends on conflating two
things that should be separate, it's probably not such a hot idea to let
it reach users either. Even if it's just debugfs.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
