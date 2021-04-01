Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D86135135F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 12:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E286E3CE;
	Thu,  1 Apr 2021 10:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3B46E3CE;
 Thu,  1 Apr 2021 10:24:12 +0000 (UTC)
IronPort-SDR: hH2TZJSIqyvLh/gvmD9wH79/AHeKBrEtcLX/vXk/nHTI281tGnfd8K+4a9zb12hJYcE98vYjPs
 /Ez6Ucob3NoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="192239059"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="192239059"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 03:24:11 -0700
IronPort-SDR: a5s6imG5vUgp0T1OyYliwsLs3ei0ef2O30ZsknUHYPz5EneSWLvc7P3NThX9GnFHy0hjPh6yjd
 CWiKeDWT73fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="610869807"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2021 03:24:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 1 Apr 2021 03:24:10 -0700
Received: from irsmsx604.ger.corp.intel.com (163.33.146.137) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 1 Apr 2021 03:24:09 -0700
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137]) by
 IRSMSX604.ger.corp.intel.com ([163.33.146.137]) with mapi id 15.01.2106.013;
 Thu, 1 Apr 2021 11:24:07 +0100
From: "Tamminen, Eero T" <eero.t.tamminen@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Check actual RC6 status
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/pmu: Check actual RC6 status
Thread-Index: AQHXJhdDw+++OHmraUq3uCaTYHTytaqfUyuAgAAFWICAAAShgIAACDMA
Date: Thu, 1 Apr 2021 10:24:07 +0000
Message-ID: <a6d8cdfca6c642ef441c6ec104c8cf74b378bc02.camel@intel.com>
References: <20210331101850.2582027-1-tvrtko.ursulin@linux.intel.com>
 <YGWQB+8gWgmZ/6Mg@intel.com>
 <2c813fb2-6836-1888-f606-25ef1321a366@linux.intel.com>
 <YGWYZffWGb6zPvzj@intel.com>
In-Reply-To: <YGWYZffWGb6zPvzj@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.253.164]
Content-ID: <E2559CDB57F75049962A65C45E5F3C1C@intel.com>
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
Cc: "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 2021-04-01 at 05:54 -0400, Rodrigo Vivi wrote:
> On Thu, Apr 01, 2021 at 10:38:11AM +0100, Tvrtko Ursulin wrote:
...
> > I think it is possible to argue both ways.
> > 
> > 1)
> > HAS_RC6 means hardware has RC6 so if we view PMU as very low level
> > we can
> > say always export it.
> > 
> > If i915 had to turn it off (rc6->supported == false) due firmware or
> > GVT-g,
> > then we could say reporting zero RC6 is accurate in that sense. Only
> > the
> > reason "why it is zero" is missing for PMU users.
> > 
> > 2)
> > Or if we go with this patch we could say that presence of the PMU
> > metric
> > means RC6 is active and enabled, while absence means it is either
> > not
> > supported due platform (or firmware) or how the platform is getting
> > used
> > (GVT-g).
> > 
> 
> yeap, these 2 cases described well my mental conflict...
> 
> > So I think patch is a bit better. I don't see it is adding more
> > confusion.
> 
> As I said on the other patch I have no strong position on which is
> better,
> but if you and Eero feel that this works better for the current case,
> let's do it...

IMHO seeing case 1) i.e. zero RC6 could be slightly better from user
point of view than not seeing RC6 at all, because:

A) user then knows that GPU is not entering RC6, and

B) then the question is why it's not going to RC6 => one can see from
sysfs that it has been disabled


Whereas in case 2), the question is why there's no RC6 info, and user
doesn't know whether GPU is suspended or not (i.e. why GPU power
consumption is higher than expected).  It would help if i-g-t could show
e.g. "RC6 OFF" in that case.


	- Eero

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
