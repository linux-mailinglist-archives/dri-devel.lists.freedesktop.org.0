Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC42285144
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 19:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38736E4F1;
	Tue,  6 Oct 2020 17:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0221B6E128;
 Tue,  6 Oct 2020 17:57:56 +0000 (UTC)
IronPort-SDR: 262hNujycrOxsK+o71KO9X7K4Pu0KmJhwIUjP48ZceOHhn7QFBnZ2+8KXSbW6pUEjfLVQhnlwQ
 n9hsoj+wIJhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249315380"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="249315380"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 10:55:46 -0700
IronPort-SDR: 5XZjHKuWkm9mxqmiA8rHOWJRhlkekJAUS6kshduXMS39RCu5khumkOX7BWLOrNUmPXGYp31Y0H
 YZKaIj6Schng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="348592117"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 06 Oct 2020 10:55:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 10:55:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 10:55:44 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Tue, 6 Oct 2020 10:55:44 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Index: AQHWm/FceboB2e8wtEe68XkD/d20damLTsaAgAAAfICAAAIFgA==
Date: Tue, 6 Oct 2020 17:55:44 +0000
Message-ID: <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
In-Reply-To: <160200650945.2919.11750150118902885340@build.alporthouse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <5A894805A902024396094664C386774A@intel.com>
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
Cc: "Pandey,
 Hariom" <hariom.pandey@intel.com>, "Ausmus, James" <james.ausmus@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "K,
 SrinivasX" <srinivasx.k@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Oct 6, 2020, at 10:48 AM, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> 
> Quoting Souza, Jose (2020-10-06 18:46:45)
>> +Rodrigo and Jani
>> 
>> On Tue, 2020-10-06 at 14:56 +0000, Kamati Srinivas wrote:
>>> Removing force probe protection from EHL platform. Did
>>> not observe warnings, errors, flickering or any visual
>>> defects while doing ordinary tasks like browsing and
>>> editing documents in a two monitor setup.
>> 
>> One of the requirements was also to have CI BAT all green and shards as green is possible but EHL don't show up in CI results, we actually have one
>> single EHL machine in CI but I guess it is not able to run all tests that shards do:
>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9097/filelist.html
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip-alt.html

we are really close to that point. We just need to fix some w/a and rc6 issues
before applying this change.

> -Chris

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
