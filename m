Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D896F6A5B62
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C275110E4D8;
	Tue, 28 Feb 2023 15:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C7310E4CD;
 Tue, 28 Feb 2023 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677596910; x=1709132910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=suf+043MpXfh3Qxlp15y70W+s4ItbYxGwryo7qe/z8M=;
 b=Lm5mU5oEDab2GRmQ1e78QlXtSrX75i4NsmZWUHCAL3klOwTU2qiLQmMv
 xWpnzoyvns9vF0CjBn2HaBUjRsJx6b1/JHWyzrmG/CmOV+Yd+YDgxuuSo
 yjpDjNVTEyn9iANIbM0OdqgDdtPDKfNrLurIGwmDDLV9u0f53bH0p04bb
 GEpgk8yIbqBLH2A9RaBB3JtizM8I3VG1h5a7vtBjvKuWDVeW0onFaL3WF
 3vW/IwTrQ1Kd9rQvEscVSR5Pg0dvR/MFU/0R7ulRfY/pzl6TsKWsJS/f8
 vmvrHaFuBNHa3XvizX4duCTF0SVHHYqE/lsBvybXAP0sXckYxJi+/fy8D g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="331635390"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="331635390"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 07:08:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="651634301"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="651634301"
Received: from gsavorni-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.82])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 07:08:22 -0800
Date: Tue, 28 Feb 2023 16:08:11 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Saarinen, Jani" <jani.saarinen@intel.com>
Subject: Re: [PATCH] drm/shmem-helper: Fix compile error
Message-ID: <Y/4Y29GoAOctF+dW@ashyti-mobl2.lan>
References: <20230228125054.1952657-1-andi.shyti@linux.intel.com>
 <71dee5cf-3c12-8d5f-5d2a-be0a39647d8c@collabora.com>
 <Y/4AMJ/+3BhTa+FF@ashyti-mobl2.lan> <87bkldzxv1.fsf@intel.com>
 <Y/4OrBltJz1J0qxe@ashyti-mobl2.lan> <877cw1zwdf.fsf@intel.com>
 <DM8PR11MB5655820080C7190C2934A7F6E0AC9@DM8PR11MB5655.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5655820080C7190C2934A7F6E0AC9@DM8PR11MB5655.namprd11.prod.outlook.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Intel GFX <intel-gfx@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Asahi Lina <lina@asahilina.net>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> > >> >> > Commit 67b7836d4458 ("drm/shmem-helper: Switch to reservation
> > >> >> > lock") removes the drm_gem_shmem_get_pages_locked() and
> > >> >> > drm_gem_shmem_put_pages_locked().
> > >> >> >
> > >> >> > But then commit ddddedaa0db9 ("drm/shmem-helper: Fix locking for
> > >> >> > drm_gem_shmem_get_pages_sgt()") reintroduces it.
> > >> >> >
> > >> >> > Somehow these two commits got mixed up and produce the following
> > >> >> > compile error:
> > >> >>
> > >> >> The 67b7836d4458 goes after ddddedaa0db9 in misc-next. It was a
> > >> >> bad merge conflict resolution in drm-tip that was fixed yesterday,
> > >> >> there is no problem in misc-next. Where do you see this error?
> > >> >
> > >> > yes, indeed! I was indeed surprised to see this mismatch.
> > >> >
> > >> > I see it in the Intel's drm-tip branch[*]
> > >>
> > >> To set the record straight, drm-tip isn't Intel's, it's an
> > >> integration branch shared by the drm community.
> > >
> > > yes of course... it's a matter of fast writing :)
> > >
> > >> Looks like the same bad merge resolution has resurrected itself
> > >> somehow, maybe Thomas'
> > >>
> > >> commit 418ce969b4c8533c7c76cc0b7adeb432ccdc137e
> > >> Author: Thomas Zimmermann <tzimmermann@suse.de>
> > >> Date:   Tue Feb 28 10:03:24 2023 +0100
> > >>
> > >>     2023y-02m-28d-09h-02m-44s UTC: drm-tip rerere cache update
> > >>
> > >>     git version 2.39.2
> > >>
> > >> in drm-rerere brought it back.
> > >>
> > >> And the build is indeed currently broken.
> > >>
> > >> Moreover, when the build was fine for a while, apparently the changes
> > >> in shmem broke a bunch of machines in Intel CI. And due to this, we
> > >> aren't getting any CI results for incoming patches right now.
> > >
> > > Is there any plans for fixing it?
> > 
> > Someone(tm) needs to step up and do it. Personally, I'm clueless.

yeah... I think we either need to fix the rerere branch (which,
allow me, is like talking to an angry wife without knowing why
she's angry) or just take my patch and have it fixed right away
(with some bisect broken in between, I guess).

I don't know what's the best approach and in any case I don't
have the power to fix it (let me know, in any case, if I can
help).

> > The whole thing is made worse by the conflict and the various resolutions. At this
> > time, I'm not certain whether the whole thing was broken to begin with, or if it's
> > just the conflict resolution that caused the issues.
> > 
> > I'll just note that for future reference, Cc'ing intel-gfx for anything non-trivial
> > touching the guts of drm will be useful for running CI on our test farm pre-merge.
> > Now, we don't know.

Yes, fully agree!

Andi

> Yeah, and sad story can be seen from https://intel-gfx-ci.01.org/tree/drm-tip/index.html? .
> All systems now abort on BAT run. 
> Just to pick one: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12789/fi-tgl-1115g4/igt@gem_exec_fence@basic-busy@vecs0.html
> Please fix asap. Or revert from tree asap. 
> 
> > 
> > 
> > BR,
> > Jani.
> > 
> > 
> > --
> > Jani Nikula, Intel Open Source Graphics Center
