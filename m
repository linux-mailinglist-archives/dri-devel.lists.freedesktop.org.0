Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D761145CC5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 20:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1F66F8A3;
	Wed, 22 Jan 2020 19:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A47A6F8A5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 19:57:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 11:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="275707040"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 22 Jan 2020 11:57:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jan 2020 21:57:29 +0200
Date: Wed, 22 Jan 2020 21:57:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 2/2] drm/dp_mst: Mention max_payloads in
 proposed_vcpis/payloads docs
Message-ID: <20200122195729.GI13686@intel.com>
References: <20200122194321.14953-1-lyude@redhat.com>
 <20200122194321.14953-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122194321.14953-2-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 02:43:21PM -0500, Lyude Paul wrote:
> Mention that the size of these two structs is determined by
> max_payloads. Suggested by Ville Syrj=E4l=E4.
> =

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  include/drm/drm_dp_mst_helper.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> =

> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_hel=
per.h
> index bcb39da9adb4..5483f888712a 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -635,11 +635,13 @@ struct drm_dp_mst_topology_mgr {
>  	struct mutex payload_lock;
>  	/**
>  	 * @proposed_vcpis: Array of pointers for the new VCPI allocation. The
> -	 * VCPI structure itself is &drm_dp_mst_port.vcpi.
> +	 * VCPI structure itself is &drm_dp_mst_port.vcpi, and the size of
> +	 * this array is determined by @max_payloads.
>  	 */
>  	struct drm_dp_vcpi **proposed_vcpis;
>  	/**
> -	 * @payloads: Array of payloads.
> +	 * @payloads: Array of payloads. The size of this array is determined
> +	 * by @max_payloads.
>  	 */

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  	struct drm_dp_payload *payloads;
>  	/**
> -- =

> 2.24.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
