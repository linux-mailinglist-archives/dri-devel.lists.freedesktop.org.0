Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74526FBE7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 13:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585276ECDC;
	Fri, 18 Sep 2020 11:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283496ECDC;
 Fri, 18 Sep 2020 11:58:48 +0000 (UTC)
IronPort-SDR: 4UqgQ9mHOOp3RW0G0Rj33Bn88luMLqurqk2CZkQqVifr9qx2KZL0hIXEENW3QwBYAtpM14bb26
 JDaZIquAYD2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147600237"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="147600237"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 04:58:44 -0700
IronPort-SDR: WY4k54HzVIXNKadB77dJ6hO7rFoaqefjzF8OUJRW+dpJ7JrvqxgjEjHIQ7yZBQslRUuv+enHFV
 oS56rhoJgZWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="344721374"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 18 Sep 2020 04:58:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Sep 2020 14:58:40 +0300
Date: Fri, 18 Sep 2020 14:58:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v9 7/8] Documentation/gpu: Add asynchronous flip
 documentation for i915
Message-ID: <20200918115840.GL6112@intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
 <20200916150824.15749-8-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916150824.15749-8-karthik.b.s@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 08:38:23PM +0530, Karthik B S wrote:
> Add the details of the implementation of asynchronous flips for i915.
> =

> v7: -Rebased.
> =

> v8: -Rebased.
> =

> v9: -Rebased.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  Documentation/gpu/i915.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 33cc6ddf8f64..84ead508f7ad 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -118,6 +118,12 @@ Atomic Plane Helpers
>  .. kernel-doc:: drivers/gpu/drm/i915/display/intel_atomic_plane.c
>     :internal:
>  =

> +Asynchronous Page Flip
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_display.c
> +   :doc: asynchronous flip implementation

A bit weird having this in one patch but the actual docs in the other.
I guess just squash them together, or extract the docs from the other
patch into this one?

Either way
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +
>  Output Probing
>  --------------
>  =

> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
