Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198327B2E2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 19:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D2589FD7;
	Mon, 28 Sep 2020 17:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E44489F55;
 Mon, 28 Sep 2020 17:15:19 +0000 (UTC)
IronPort-SDR: CzkHPyk5Y0va+IYn37xNcDCt5cDJfG7SMtQOiqWM/D8WpTCI2J/RxmbqY7Qk9/0LakNq5R/kar
 Z04ZftGuxInQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="223624475"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="223624475"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 10:15:17 -0700
IronPort-SDR: sdwvITrZwIodaSl3A6uuocAozDR0/EXh0gkaRVGOgxYVobRJFQGzIM/fU9bE8PaJdxtkLclvpe
 Ra48h5Rv71UA==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="338261563"
Received: from lizwalsh-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.251.86.12])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 10:15:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Surendrakumar Upadhyay\,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>, "airlied\@linux.ie" <airlied@linux.ie>,
 "daniel\@ffwll.ch" <daniel@ffwll.ch>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Ausmus\,
 James" <james.ausmus@intel.com>, "Roper\,
 Matthew D" <matthew.d.roper@intel.com>, "Souza\, Jose" <jose.souza@intel.com>,
 "ville.syrjala\@linux.intel.com" <ville.syrjala@linux.intel.com>, "De Marchi\,
 Lucas" <lucas.demarchi@intel.com>, "Pandey\, Hariom" <hariom.pandey@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/edp/jsl: Update vswing table for
 HBR and HBR2
In-Reply-To: <SN6PR11MB3421725FE60CC7930FC02AB6DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200928080931.246347-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <87a6xaow40.fsf@intel.com>
 <SN6PR11MB3421725FE60CC7930FC02AB6DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
Date: Mon, 28 Sep 2020 20:15:29 +0300
Message-ID: <871rilq0um.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Sep 2020, "Surendrakumar Upadhyay, TejaskumarX"	<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> This is a good example of a potential trap that having
> IS_ELKHARTLAKE() cover both ELK and JSP creates. An unsuspecting coder
> might change the if ladder to have IS_ELKHARTLAKE() first, and the
> subsequent IS_JASPERLAKE() branch would never be taken.
>
> BR,
> Jani.
>
> Tejas : In that case I will put attention note in comment about
> platform checks such that ladder distrubance can be avoided. What you
> suggest?

The solution is to make IS_ELKHARTLAKE() mean ELK and only ELK.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
