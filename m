Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA81802D7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 17:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D0B6E898;
	Tue, 10 Mar 2020 16:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EFE6E898;
 Tue, 10 Mar 2020 16:08:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 09:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; d="scan'208";a="234391542"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 10 Mar 2020 09:08:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Mar 2020 18:08:25 +0200
Date: Tue, 10 Mar 2020 18:08:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [RFC][PATCH 4/5] drm/i915: Introduce scaling filter related
 registers and bit fields.
Message-ID: <20200310160825.GJ13686@intel.com>
References: <20200225070545.4482-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225070545.4482-5-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225070545.4482-5-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, ankit.k.nautiyal@intel.com,
 mihail.atanassov@arm.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 12:35:44PM +0530, Pankaj Bharadiya wrote:
> Introduce scaler registers and bit fields needed to configure the
> scaling filter in prgrammed mode and configure scaling filter
> coefficients.
> =

> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 34923b1c284c..bba4ad3be611 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7289,6 +7289,18 @@ enum {
>  #define _PS_ECC_STAT_2B     0x68AD0
>  #define _PS_ECC_STAT_1C     0x691D0
>  =

> +#define _PS_COEF_SET0_INDEX_1A     0x68198
> +#define _PS_COEF_SET0_INDEX_2A     0x68298
> +#define _PS_COEF_SET0_INDEX_1B     0x68998
> +#define _PS_COEF_SET0_INDEX_2B     0x68A98
> +
> +#define _PS_COEF_SET0_DATA_1A     0x6819C
> +#define _PS_COEF_SET0_DATA_2A     0x6829C
> +#define _PS_COEF_SET0_DATA_1B     0x6899C
> +#define _PS_COEF_SET0_DATA_2B     0x68A9C
> +

Sourious whitespace.

> +#define _PS_COEE_INDEX_AUTO_INC (1 << 10)

Wrong indentation (though looks like most scaler register
definitions get that wrong already), and the leading '_' shouldn't
be here at all.

> +
>  #define _ID(id, a, b) _PICK_EVEN(id, a, b)
>  #define SKL_PS_CTRL(pipe, id) _MMIO_PIPE(pipe,        \
>  			_ID(id, _PS_1A_CTRL, _PS_2A_CTRL),       \
> @@ -7318,6 +7330,14 @@ enum {
>  			_ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
>  			_ID(id, _PS_ECC_STAT_1B, _PS_ECC_STAT_2B))
>  =

> +#define SKL_PS_COEF_INDEX_SET0(pipe, id)  _MMIO_PIPE(pipe,    \
> +			_ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX_2A), \
> +			_ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX_2B))
> +
> +#define SKL_PS_COEF_DATA_SET0(pipe, id)  _MMIO_PIPE(pipe,     \
> +			_ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2A), \
> +			_ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2B))

Please parametrize by 'set' as well.

> +
>  /* legacy palette */
>  #define _LGC_PALETTE_A           0x4a000
>  #define _LGC_PALETTE_B           0x4a800
> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
