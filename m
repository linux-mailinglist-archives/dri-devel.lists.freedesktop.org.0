Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735CE27B782
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 01:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D40089D56;
	Mon, 28 Sep 2020 23:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AAF89D52;
 Mon, 28 Sep 2020 23:10:24 +0000 (UTC)
IronPort-SDR: gAROvgnnTOKncwufqneR67LGQWW+L3iZFYCqkWeUJiQQhd4yj+OPlomBwdr32AKJz9/P/bcZhU
 Kqa0dde1n9SA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="246817862"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="246817862"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 16:10:23 -0700
IronPort-SDR: jzzB2ktw+5o9UilhvKjWJ6uYd6yq1BpHpPLyEHNdX0M5ASEIiNL8oqeVQlfsxn+nq4yEki9aY6
 sNlJlaGid8LQ==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="350003184"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 16:10:23 -0700
Date: Mon, 28 Sep 2020 16:10:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/edp/jsl: Update vswing table
 for HBR and HBR2
Message-ID: <20200928231022.GF2157395@mdroper-desk1.amr.corp.intel.com>
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200928080931.246347-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <87a6xaow40.fsf@intel.com>
 <SN6PR11MB3421725FE60CC7930FC02AB6DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
 <871rilq0um.fsf@intel.com>
 <20200928230739.vpj22bwebqhtehuk@ldmartin-desk1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928230739.vpj22bwebqhtehuk@ldmartin-desk1>
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
 James" <james.ausmus@intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 04:07:39PM -0700, Lucas De Marchi wrote:
> On Mon, Sep 28, 2020 at 08:15:29PM +0300, Jani Nikula wrote:
> > On Mon, 28 Sep 2020, "Surendrakumar Upadhyay, TejaskumarX"	<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> > > This is a good example of a potential trap that having
> > > IS_ELKHARTLAKE() cover both ELK and JSP creates. An unsuspecting coder
> > > might change the if ladder to have IS_ELKHARTLAKE() first, and the
> > > subsequent IS_JASPERLAKE() branch would never be taken.
> > > 
> > > BR,
> > > Jani.
> > > 
> > > Tejas : In that case I will put attention note in comment about
> > > platform checks such that ladder distrubance can be avoided. What you
> > > suggest?
> 
> > The solution is to make IS_ELKHARTLAKE() mean ELK and only ELK.
> 
> Since we are talking about the TLA for JSL in the other patch, for
> elkhartlake it is EHL, not ELK. ELK is something else, but I'm not sure
> what:
> 
> $ git grep -w ELK -- drivers/gpu/drm/
> drivers/gpu/drm/i915/gem/i915_gem_stolen.c:             IS_GM45(i915) ? "CTG" : "ELK", reg_val);
> drivers/gpu/drm/i915/gem/i915_gem_stolen.c:      * Whether ILK really reuses the ELK register for this is unclear.
> drivers/gpu/drm/i915/intel_pm.c:         * Not 100% sure which way ELK should go here as the
> drivers/gpu/drm/i915/intel_pm.c:         * assume ELK doesn't need this.

Yeah, ELK = Eagle Lake, CTG = Cantiga.  Both are old gen5 platforms IIRC.


Matt

> 
> Lucas De Marchi
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > -- 
> > Jani Nikula, Intel Open Source Graphics Center

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
