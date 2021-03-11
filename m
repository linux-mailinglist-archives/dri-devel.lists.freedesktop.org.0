Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC37337684
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 16:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE416ED9A;
	Thu, 11 Mar 2021 15:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534286ED9A;
 Thu, 11 Mar 2021 15:09:16 +0000 (UTC)
IronPort-SDR: +N7cAcW0uRirE29hp4GRYLZBPBFn58tCEXMbI6T2AiJf0zYagK35lCAPV/cWOBQng1EZKetWZt
 lOLsmCK7rMSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="167954143"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="167954143"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 07:09:15 -0800
IronPort-SDR: eNtpzg7rAFrl+bX/Socp269G+W1brgZYn7N+ROYC1oH4h/gy/FB520phv6zicMrSkHjt3hJ8KX
 y7swO4peDVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="438728955"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 11 Mar 2021 07:09:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Mar 2021 17:09:12 +0200
Date: Thu, 11 Mar 2021 17:09:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/dp_link_training: Add newlines
 to debug messages
Message-ID: <YEoymIV6CJUtO3EH@intel.com>
References: <20210310214845.29021-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310214845.29021-1-sean@poorly.run>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 10, 2021 at 04:47:56PM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> =

> This patch adds some newlines which are missing from debug messages.
> This will prevent logs from being stacked up in dmesg.
> =

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index 892d7db7d94f..ad02d493ec16 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -29,7 +29,7 @@ static void
>  intel_dp_dump_link_status(const u8 link_status[DP_LINK_STATUS_SIZE])
>  {
>  =

> -	DRM_DEBUG_KMS("ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x=
%x adj_req2_3:0x%x",
> +	DRM_DEBUG_KMS("ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x=
%x adj_req2_3:0x%x\n",
>  		      link_status[0], link_status[1], link_status[2],
>  		      link_status[3], link_status[4], link_status[5]);
>  }
> @@ -731,7 +731,7 @@ intel_dp_link_train_phy(struct intel_dp *intel_dp,
>  =

>  out:
>  	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
> -		    "[CONNECTOR:%d:%s] Link Training %s at link rate =3D %d, lane coun=
t =3D %d, at %s",
> +		    "[CONNECTOR:%d:%s] Link Training %s at link rate =3D %d, lane coun=
t =3D %d, at %s\n",

Looking through some ci logs we do get the newline here somehow. A bit
weird.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
