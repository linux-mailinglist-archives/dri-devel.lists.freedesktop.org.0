Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5906A5AF7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 15:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D33E10E4C1;
	Tue, 28 Feb 2023 14:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C03010E4BB;
 Tue, 28 Feb 2023 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677595236; x=1709131236;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4sm65TMH5MjyGreElQY1h0SASUznAfh0ajh5+jpTnIw=;
 b=VFeph9C3ozjqnfjZaQBtt7HcPP7jyG2cnzk+UDVeUPq4DZ5Qe332TJCU
 snR5+iHn5FyxsA2k2m/itiYjKObjU5mt8o7wg3f207lWigehlnzhLzbAu
 S6qgAtocKE2Lbk+DeZ7hpFMyTKYt6EIJWftN3huBIQkXCQw/v1wrKtuEl
 AdEUEi4Qy3gT4sXhop4ma5pLes1KQicQpksPc1dy9KpAGM+EaUbkR3/8h
 Di5EQiSLw1GD5RuzPrFTr+2TkThHr2m0bGngoaZxEAFqmTwmxuRCWOk0u
 fXzN+FanRRlCPqtDULGxUR92ii7A2iqS86fh9tD0JO9SLBeg415qsB8uI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="336437561"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="336437561"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 06:40:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="817092941"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="817092941"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.26])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 06:40:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/shmem-helper: Fix compile error
In-Reply-To: <Y/4OrBltJz1J0qxe@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230228125054.1952657-1-andi.shyti@linux.intel.com>
 <71dee5cf-3c12-8d5f-5d2a-be0a39647d8c@collabora.com>
 <Y/4AMJ/+3BhTa+FF@ashyti-mobl2.lan> <87bkldzxv1.fsf@intel.com>
 <Y/4OrBltJz1J0qxe@ashyti-mobl2.lan>
Date: Tue, 28 Feb 2023 16:40:28 +0200
Message-ID: <877cw1zwdf.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Asahi Lina <lina@asahilina.net>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi,
>
>> >> > Commit 67b7836d4458 ("drm/shmem-helper: Switch to reservation
>> >> > lock") removes the drm_gem_shmem_get_pages_locked() and
>> >> > drm_gem_shmem_put_pages_locked().
>> >> > 
>> >> > But then commit ddddedaa0db9 ("drm/shmem-helper: Fix locking for
>> >> > drm_gem_shmem_get_pages_sgt()") reintroduces it.
>> >> > 
>> >> > Somehow these two commits got mixed up and produce the following
>> >> > compile error:
>> >> 
>> >> The 67b7836d4458 goes after ddddedaa0db9 in misc-next. It was a bad
>> >> merge conflict resolution in drm-tip that was fixed yesterday, there is
>> >> no problem in misc-next. Where do you see this error?
>> >
>> > yes, indeed! I was indeed surprised to see this mismatch.
>> >
>> > I see it in the Intel's drm-tip branch[*]
>> 
>> To set the record straight, drm-tip isn't Intel's, it's an integration
>> branch shared by the drm community.
>
> yes of course... it's a matter of fast writing :)
>
>> Looks like the same bad merge resolution has resurrected itself somehow,
>> maybe Thomas'
>> 
>> commit 418ce969b4c8533c7c76cc0b7adeb432ccdc137e
>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>> Date:   Tue Feb 28 10:03:24 2023 +0100
>> 
>>     2023y-02m-28d-09h-02m-44s UTC: drm-tip rerere cache update
>>     
>>     git version 2.39.2
>> 
>> in drm-rerere brought it back.
>> 
>> And the build is indeed currently broken.
>> 
>> Moreover, when the build was fine for a while, apparently the changes in
>> shmem broke a bunch of machines in Intel CI. And due to this, we aren't
>> getting any CI results for incoming patches right now.
>
> Is there any plans for fixing it?

Someone(tm) needs to step up and do it. Personally, I'm clueless.

The whole thing is made worse by the conflict and the various
resolutions. At this time, I'm not certain whether the whole thing was
broken to begin with, or if it's just the conflict resolution that
caused the issues.

I'll just note that for future reference, Cc'ing intel-gfx for anything
non-trivial touching the guts of drm will be useful for running CI on
our test farm pre-merge. Now, we don't know.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
