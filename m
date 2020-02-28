Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23663173021
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 06:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265976EDD3;
	Fri, 28 Feb 2020 05:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68316EDD0;
 Fri, 28 Feb 2020 05:02:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 21:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="257001294"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga002.jf.intel.com with ESMTP; 27 Feb 2020 21:02:30 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Feb 2020 21:02:29 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Feb 2020 21:02:29 -0800
Received: from bgsmsx153.gar.corp.intel.com (10.224.23.4) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 27 Feb 2020 21:02:28 -0800
Received: from BGSMSX107.gar.corp.intel.com ([169.254.9.58]) by
 BGSMSX153.gar.corp.intel.com ([169.254.2.145]) with mapi id 14.03.0439.000;
 Fri, 28 Feb 2020 10:32:25 +0530
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>
Subject: RE: [Intel-gfx][PATCH 01/10] drm/i915: Add i915 device based
 MISSING_CASE macro
Thread-Topic: [Intel-gfx][PATCH 01/10] drm/i915: Add i915 device based
 MISSING_CASE macro
Thread-Index: AQHV6+ORF98y/9Y/3EqxiyZJG7rk3agrlFCAgAL+ieD//8lTAIABtD/g
Date: Fri, 28 Feb 2020 05:02:25 +0000
Message-ID: <E92BA18FDE0A5B43B7B3DA7FCA03128605778994@BGSMSX107.gar.corp.intel.com>
References: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225134709.6153-2-pankaj.laxminarayan.bharadiya@intel.com>
 <158263931977.26598.171017617509031302@skylake-alporthouse-com>
 <E92BA18FDE0A5B43B7B3DA7FCA03128605776BFE@BGSMSX107.gar.corp.intel.com>
 <87mu94qvpd.fsf@intel.com>
In-Reply-To: <87mu94qvpd.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: 27 February 2020 14:00
> To: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>; Chris Wilson <chris@chris-
> wilson.co.uk>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; David Airlie
> <airlied@linux.ie>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi,
> Rodrigo <rodrigo.vivi@intel.com>; daniel@ffwll.ch
> Subject: RE: [Intel-gfx][PATCH 01/10] drm/i915: Add i915 device based
> MISSING_CASE macro
> 
> On Thu, 27 Feb 2020, "Laxminarayan Bharadiya, Pankaj"
> 	<pankaj.laxminarayan.bharadiya@intel.com> wrote:
> > Hi Chris,
> >
> >> -----Original Message-----
> >> From: Chris Wilson <chris@chris-wilson.co.uk>
> >> Sent: 25 February 2020 19:32
> >> To: David Airlie <airlied@linux.ie>; Joonas Lahtinen
> >> <joonas.lahtinen@linux.intel.com>; Laxminarayan Bharadiya, Pankaj
> >> <pankaj.laxminarayan.bharadiya@intel.com>; Vivi, Rodrigo
> >> <rodrigo.vivi@intel.com>; daniel@ffwll.ch;
> >> dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> >> jani.nikula@linux.intel.com
> >> Cc: Laxminarayan Bharadiya, Pankaj
> >> <pankaj.laxminarayan.bharadiya@intel.com>
> >> Subject: Re: [Intel-gfx][PATCH 01/10] drm/i915: Add i915 device based
> >> MISSING_CASE macro
> >>
> >> Quoting Pankaj Bharadiya (2020-02-25 13:47:00)
> >> > Now that we have struct drm_device based drm_WARN, introduce struct
> >> > drm_i915_private based i915_MISSING_CASE macro which uses
> >> drm_WARN so
> >> > that device specific information will also get printed in backtrace.
> >> >
> >> > i915_MISSING_CASE macro should be preferred over MISSING_CASE,
> >> > wherever possible.
> >>
> >> Whatever for? MISSING_CASE() itself should be a complete picture for
> >> the forgotten code.
> >
> > Are you saying, no need to have a new device specific macro?
> >
> > We want convert all the calls of WARN* with device specific drm_WARN*
> > in i915, hence I introduced new i915_MISSING_CASE macro.
> >
> > Jani, Will you please share your opinion on this?
> 
> In general, many or most WARNs are device specific, and the device information
> is useful. However MISSING_CASE is about the *code*. That was the intent
> anyway. Perhaps there are cases where the device information might be useful,
> but for most cases probably not.

Thanks for clarification. Please ignore this patch series then.

Thanks,
Pankaj 
> 
> BR,
> Jani.
> 
> 
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
