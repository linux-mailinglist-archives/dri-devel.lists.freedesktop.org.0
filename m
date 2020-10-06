Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1F285155
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 20:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781066E4F8;
	Tue,  6 Oct 2020 18:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137A6E4F3;
 Tue,  6 Oct 2020 18:02:58 +0000 (UTC)
IronPort-SDR: 4s9W5dd8xcr5+TDsl/5ITxgejyDwb2q9tixg/clXrtTb8VFq8DC1utR3jtARpJpect7kTZaynm
 1fZjn0wXw4jQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249318248"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="249318248"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 11:02:49 -0700
IronPort-SDR: 3HhHpV7oZNfZCDY39mZ7OqD50LEkGC+YyX/sCR3RQNPTY9CP/7oTK7ZCZrRtqUmbni1GpHoN6Y
 1p5oH5pM57kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="517350660"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 06 Oct 2020 11:02:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 11:02:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 11:02:46 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Tue, 6 Oct 2020 11:02:46 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "chris@chris-wilson.co.uk"
 <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Index: AQHWm/Fk90H9Qy56XkSH4h+5RqsAv6mLT7oA////iICAAAIGAIAAAu0A
Date: Tue, 6 Oct 2020 18:02:46 +0000
Message-ID: <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
In-Reply-To: <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <B9D12F80D52D2947930B85A4065E1D64@intel.com>
MIME-Version: 1.0
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "K,
 SrinivasX" <srinivasx.k@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-10-06 at 10:55 -0700, Vivi, Rodrigo wrote:
> 
> > On Oct 6, 2020, at 10:48 AM, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > 
> > Quoting Souza, Jose (2020-10-06 18:46:45)
> > > +Rodrigo and Jani
> > > 
> > > On Tue, 2020-10-06 at 14:56 +0000, Kamati Srinivas wrote:
> > > > Removing force probe protection from EHL platform. Did
> > > > not observe warnings, errors, flickering or any visual
> > > > defects while doing ordinary tasks like browsing and
> > > > editing documents in a two monitor setup.
> > > 
> > > One of the requirements was also to have CI BAT all green and shards as green is possible but EHL don't show up in CI results, we actually have one
> > > single EHL machine in CI but I guess it is not able to run all tests that shards do:
> > > https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9097/filelist.html
> > 
> > https://intel-gfx-ci.01.org/tree/drm-tip/drmtip-alt.html
> 
> we are really close to that point. We just need to fix some w/a and rc6 issues
> before applying this change.
> 
> > -Chris
> 

Huum okay we have drm-tip results for EHL but if someone sends a patch that breaks EHL it will not be caught in pre-merge testing.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
