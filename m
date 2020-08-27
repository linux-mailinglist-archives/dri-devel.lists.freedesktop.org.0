Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D684254AD7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 18:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66146E328;
	Thu, 27 Aug 2020 16:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B481D6E328;
 Thu, 27 Aug 2020 16:38:56 +0000 (UTC)
IronPort-SDR: uoEXA5t3ZlkhK9+lIobECdBVuaeEuKaTXqGbANi3BmWWArTkmOX+av+q5XXbMTUJOjPhtDypet
 mVzHTA5c7Hjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="174571295"
X-IronPort-AV: E=Sophos;i="5.76,360,1592895600"; d="scan'208";a="174571295"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 09:38:56 -0700
IronPort-SDR: vts0Vlpjg+ajGomCStZRxxeP3u7ckxpaGtCW836r9BjS0dxN3YSHQJb6EVXC1Jv5a6OncUNQuA
 C40x1lJ5VhcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,360,1592895600"; d="scan'208";a="299917319"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 27 Aug 2020 09:38:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 27 Aug 2020 19:38:51 +0300
Date: Thu, 27 Aug 2020 19:38:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/vlv_dsi_pll: fix spelling mistake
 "Cant" -> "Can't"
Message-ID: <20200827163851.GU6112@intel.com>
References: <20200810095952.60968-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810095952.60968-1-colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 10:59:52AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> =

> There is a spelling mistake in a drm_err message. Fix it.

Thanks. Applied to dinq.

> =

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/vlv_dsi_pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c b/drivers/gpu/drm=
/i915/display/vlv_dsi_pll.c
> index d0a514301575..4070b00c3690 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
> @@ -483,7 +483,7 @@ int bxt_dsi_pll_compute(struct intel_encoder *encoder,
>  =

>  	if (dsi_ratio < dsi_ratio_min || dsi_ratio > dsi_ratio_max) {
>  		drm_err(&dev_priv->drm,
> -			"Cant get a suitable ratio from DSI PLL ratios\n");
> +			"Can't get a suitable ratio from DSI PLL ratios\n");
>  		return -ECHRNG;
>  	} else
>  		drm_dbg_kms(&dev_priv->drm, "DSI PLL calculation is Done!!\n");
> -- =

> 2.27.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
