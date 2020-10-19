Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9284E292D84
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 20:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4C96EA2D;
	Mon, 19 Oct 2020 18:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248456EA2D;
 Mon, 19 Oct 2020 18:28:01 +0000 (UTC)
IronPort-SDR: kcC8Iqek9n9RuDcCNmz52CrD/an9YE93ODQ2dyu7XRNqF0FFWYiokyS2dh+Bo7SwXl0BNNgHzt
 USd/ZlnmfrFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="167194306"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="167194306"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 11:27:57 -0700
IronPort-SDR: ktLzjKeaAoDz2BNAfWhK/gUblzupON97p5vn8Z1gPdviW3G1MnCL+Kz+kGJgrWltD1sj0A0oLl
 pUZ0035G2+hA==
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="320371067"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 11:27:55 -0700
Date: Mon, 19 Oct 2020 14:29:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "K, SrinivasX" <srinivasx.k@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Message-ID: <20201019182936.GA3149316@intel.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
 <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
 <BYAPR11MB3014087624B8206C05362830F9080@BYAPR11MB3014.namprd11.prod.outlook.com>
 <B6C174E8-161A-43BD-AFDA-21C94F6D56E3@intel.com>
 <BY5PR11MB44341733BF4A7CCB79861322F6080@BY5PR11MB4434.namprd11.prod.outlook.com>
 <BYAPR11MB30149153D9229142DD2CF96BF9020@BYAPR11MB3014.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR11MB30149153D9229142DD2CF96BF9020@BYAPR11MB3014.namprd11.prod.outlook.com>
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


I just checked the CI picture and it looks much better indeed.

Only bad case being the gt_pm, which is also failing on other platforms.

So,

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



On Thu, Oct 15, 2020 at 08:41:32AM +0000, K, SrinivasX wrote:
> Hi Hariom,
> 
> With Sunil's help was able to see EHL achieving rc6 state. 
> Verified from sys entries, under no load to gpu rc6_residency_ms counter is changing.
> Also ran all the Rodrigo mention tests and I see them passing. But with i915_selftest dmesg warnings are still seen.
> 
> Thanks,
> Srinivas
> 
> -----Original Message-----
> From: Pandey, Hariom <hariom.pandey@intel.com> 
> Sent: 09 October 2020 23:39
> To: K, SrinivasX <srinivasx.k@intel.com>
> Cc: Souza, Jose <jose.souza@intel.com>; chris@chris-wilson.co.uk; Ausmus, James <james.ausmus@intel.com>; Nikula, Jani <jani.nikula@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: RE: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe protection
> 
> Hi Srinivas,
> 
> Take Sunil's help who has recently validated RC6 on EHL DRM tip and found to be passing. If the WA were sporadically failing and if you confirm that RC6 is passing, this patch can be proceeded with. 
> 
> Thanks
> Hariom Pandey
> 
> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> Sent: Friday, October 9, 2020 7:09 PM
> To: K, SrinivasX <srinivasx.k@intel.com>
> Cc: Souza, Jose <jose.souza@intel.com>; chris@chris-wilson.co.uk; Ausmus, James <james.ausmus@intel.com>; Nikula, Jani <jani.nikula@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe protection
> 
> 
> 
> > On Oct 9, 2020, at 1:31 AM, K, SrinivasX <srinivasx.k@intel.com> wrote:
> > 
> > Hi Rodrigo,
> > 
> > How do we get W/A and rc6 changes in, do you have any details?
> 
> I told based on what I was seeing on https://intel-gfx-ci.01.org/tree/drm-tip/drmtip-alt.html?
> focusing on the issues that are exclusively for ehl and not happening on other platforms.
> 
> It looks like workarounds are fine there now. so I'm not sure if it was sporadic thing that day.
> 
> for the rc6 there are a few testcases failing around it:
> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_675/fi-ehl-1/igt@i915_pm_rc6_residency@rc6-fence.html
> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_675/fi-ehl-1/igt@i915_pm_rc6_residency@rc6-idle.html
> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_675/fi-ehl-1/igt@i915_selftest@live@gt_pm.html#dmesg-warnings415
> 
> > 
> > Thanks,
> > Srinivas
> > 
> > -----Original Message-----
> > From: Souza, Jose <jose.souza@intel.com>
> > Sent: 06 October 2020 23:33
> > To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; chris@chris-wilson.co.uk
> > Cc: Ausmus, James <james.ausmus@intel.com>; Nikula, Jani 
> > <jani.nikula@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>; 
> > Roper, Matthew D <matthew.d.roper@intel.com>; 
> > intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; K, 
> > SrinivasX <srinivasx.k@intel.com>; Surendrakumar Upadhyay, TejaskumarX 
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove 
> > require_force_probe protection
> > 
> > On Tue, 2020-10-06 at 10:55 -0700, Vivi, Rodrigo wrote:
> >> 
> >>> On Oct 6, 2020, at 10:48 AM, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >>> 
> >>> Quoting Souza, Jose (2020-10-06 18:46:45)
> >>>> +Rodrigo and Jani
> >>>> 
> >>>> On Tue, 2020-10-06 at 14:56 +0000, Kamati Srinivas wrote:
> >>>>> Removing force probe protection from EHL platform. Did not observe 
> >>>>> warnings, errors, flickering or any visual defects while doing 
> >>>>> ordinary tasks like browsing and editing documents in a two 
> >>>>> monitor setup.
> >>>> 
> >>>> One of the requirements was also to have CI BAT all green and 
> >>>> shards as green is possible but EHL don't show up in CI results, we actually have one single EHL machine in CI but I guess it is not able to run all tests that shards do:
> >>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9097/filelist.html
> >>> 
> >>> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip-alt.html
> >> 
> >> we are really close to that point. We just need to fix some w/a and
> >> rc6 issues before applying this change.
> >> 
> >>> -Chris
> >> 
> > 
> > Huum okay we have drm-tip results for EHL but if someone sends a patch that breaks EHL it will not be caught in pre-merge testing.
> > 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
