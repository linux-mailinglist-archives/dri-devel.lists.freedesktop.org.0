Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6E6201BC9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 22:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50E46E9FF;
	Fri, 19 Jun 2020 20:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B0E6E9CC;
 Fri, 19 Jun 2020 20:00:15 +0000 (UTC)
IronPort-SDR: 1eGFD29wUed6qHiU+zmom1/7vGJ7iZVMd0JLRtEHnLsmzd+RSyH/Ar8JnTRyVMYCQdq8Xhvvo6
 AEahVKaMHR9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="123351124"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="123351124"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 13:00:14 -0700
IronPort-SDR: W2gxCsYArRQcXRbwOLwu1mc5vZfC8+81wADMAroNc9Kj3E7giWmNua/j4sf0+fgV5X+cr2hZdX
 mmXyZ8l+pfsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="383930726"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2020 13:00:13 -0700
Date: Fri, 19 Jun 2020 13:01:28 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [Intel-gfx] [v6 1/3] drm/dp: DRM DP helper for reading Ignore
 MSA from DPCD
Message-ID: <20200619200126.GA4176@intel.com>
References: <20200619212356.19285-1-bhanuprakash.modem@intel.com>
 <20200619212356.19285-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619212356.19285-2-bhanuprakash.modem@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the review, pushed to drm-misc

Manasi

On Sat, Jun 20, 2020 at 02:53:54AM +0530, Bhanuprakash Modem wrote:
> From: Manasi Navare <manasi.d.navare@intel.com>
> =

> DP sink device sets the Ignore MSA bit in its
> DP_DOWNSTREAM_PORT_COUNT register to indicate its ability to
> ignore the MSA video timing parameters and its ability to support
> seamless video timing change over a range of timing exposed by
> DisplayID and EDID.
> This is required for the sink to indicate that it is Adaptive sync
> capable.
> =

> v3:
> * Fi the typo in commit message (Manasi)
> v2:
> * Rename to describe what the function does (Jani Nikula)
> =

> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  include/drm/drm_dp_helper.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> =

> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 1165ec105638..e47dc22ebf50 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1457,6 +1457,14 @@ drm_dp_alternate_scrambler_reset_cap(const u8 dpcd=
[DP_RECEIVER_CAP_SIZE])
>  			DP_ALTERNATE_SCRAMBLER_RESET_CAP;
>  }
>  =

> +/* Ignore MSA timing for Adaptive Sync support on DP 1.4 */
> +static inline bool
> +drm_dp_sink_can_do_video_without_timing_msa(const u8 dpcd[DP_RECEIVER_CA=
P_SIZE])
> +{
> +	return dpcd[DP_DOWN_STREAM_PORT_COUNT] &
> +		DP_MSA_TIMING_PAR_IGNORED;
> +}
> +
>  /*
>   * DisplayPort AUX channel
>   */
> -- =

> 2.20.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
