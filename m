Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947519846F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 21:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7706E1BA;
	Mon, 30 Mar 2020 19:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DAE6E1BA;
 Mon, 30 Mar 2020 19:29:36 +0000 (UTC)
IronPort-SDR: 1uBgFHUZ/oxE19hM667S/vM9kXZR9s5+RRBRz/1Kvi6omJmVi4AiRPOvb69Rzkd/ikUiPAkPgb
 U87N7lhCu8YQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 12:29:36 -0700
IronPort-SDR: 8Te4C4VmobDWHrepX/2Svyi/fuL62SPRSPNs8+WW+XKO5lQgBxX7U3YR1f7OCiYX8weAlJmde5
 RnCFwGN0iQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; d="scan'208";a="251987549"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga006.jf.intel.com with ESMTP; 30 Mar 2020 12:29:35 -0700
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 30 Mar 2020 12:29:35 -0700
Received: from BGSMSX108.gar.corp.intel.com (10.223.4.192) by
 fmsmsx122.amr.corp.intel.com (10.18.125.37) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 30 Mar 2020 12:29:35 -0700
Received: from BGSMSX107.gar.corp.intel.com ([169.254.9.15]) by
 BGSMSX108.gar.corp.intel.com ([169.254.8.19]) with mapi id 14.03.0439.000;
 Tue, 31 Mar 2020 00:59:32 +0530
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH] drm/todo: Add todo to make i915 WARN* calls drm device
 specific
Thread-Topic: [PATCH] drm/todo: Add todo to make i915 WARN* calls drm device
 specific
Thread-Index: AQHWBsjgM9IiKpzLM0aGZ0DrALY5GahhKLSAgABckRA=
Date: Mon, 30 Mar 2020 19:29:31 +0000
Message-ID: <E92BA18FDE0A5B43B7B3DA7FCA031286057DD6B8@BGSMSX107.gar.corp.intel.com>
References: <20200330191524.14676-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200330192723.GA22772@ravnborg.org>
In-Reply-To: <20200330192723.GA22772@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: 31 March 2020 00:57
> To: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Cc: jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@linux.ie>;
> Jonathan Corbet <corbet@lwn.net>
> Subject: Re: [PATCH] drm/todo: Add todo to make i915 WARN* calls drm device
> specific
> 
> Hi Pankaj.
> 
> On Tue, Mar 31, 2020 at 12:45:24AM +0530, Pankaj Bharadiya wrote:
> > With below commit, we have new struct drm_device based WARN* macros,
> > which include device specific information in the backtrace.
> >
> > commit dc1a73e50f9c63d4dd928df538082200467dc4b1
> > Author: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> > Date:   Wed Jan 15 09:14:45 2020 +0530
> >
> >     drm/print: introduce new struct drm_device based WARN* macros
> >
> > Majority of the i915 WARN* are already converted to use struct
> > drm_device specific drm_WARN* calls.Add new todo entry for
> Add space after '.'
> 
> > pending conversions.
> >
> > Signed-off-by: Pankaj Bharadiya
> > <pankaj.laxminarayan.bharadiya@intel.com>
> > ---
> >  Documentation/gpu/todo.rst | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 37a3a023c114..0cb32df89784 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -575,6 +575,18 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
> >
> >  Contact: Harry Wentland, Alex Deucher
> >
> > +Make i915 WARN* Calls struct drm_device Specific
> > +------------------------------------------------
> > +
> > +struct drm_device specific drm_WARN* macros include device
> > +information in the backtrace, so we know what device the warnings
> > +originate from. Convert all the calls of WARN* with drm_WARN* calls
> > +in i915. While at it, remove WARN* which are not truly valid.
> > +
> > +Contact: Jani Nikula
> > +
> > +Level: Starter
> > +
> >  Bootsplash
> >  ==========
> >
> > @@ -595,7 +607,7 @@ Level: Advanced
> >  Outside DRM
> >  ===========
> >
> > -Convert fbdev drivers to DRM
> > +Convert fbdev drivers to
> Unrelated change?
> 
> Please fix and re-submit.
Ah, my bad. Thanks for pointing out.

Thanks,
Pankaj
> 
> 	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
