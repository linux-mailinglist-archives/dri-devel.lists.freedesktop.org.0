Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5AB29ECE1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 14:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043A16ECCE;
	Thu, 29 Oct 2020 13:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C06A6ECCE;
 Thu, 29 Oct 2020 13:27:48 +0000 (UTC)
IronPort-SDR: 5gQk/eJ1c2WFbo6PFhiGz40V5uKwqrquYRGNZ6/o2UQAR5mBQ9wcH1MXJ1rl/d09UDUw+xjQu6
 Zg1zlSap+knw==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="253137281"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="253137281"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 06:27:48 -0700
IronPort-SDR: tCx8fBPfk+dxIcMBHFS0/6FZmrAa+Ju2lsYykZeBNKcrzw4fgvTvz+lF73U9W4xNlm9RwAjGwE
 YJ9HraOSkO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="356256540"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 29 Oct 2020 06:27:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 29 Oct 2020 15:27:43 +0200
Date: Thu, 29 Oct 2020 15:27:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zou Wei <zou_wei@huawei.com>
Subject: Re: [PATCH -next] drm/i915: Remove unused variable ret
Message-ID: <20201029132743.GZ6112@intel.com>
References: <1603937925-53176-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603937925-53176-1-git-send-email-zou_wei@huawei.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 10:18:45AM +0800, Zou Wei wrote:
> This patch fixes below warnings reported by coccicheck
> =

> ./drivers/gpu/drm/i915/i915_debugfs.c:789:5-8: Unneeded variable: "ret". =
Return "0" on line 1012
> =

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Thanks. Applied.

> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i=
915_debugfs.c
> index ea46916..200f6b8 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -786,7 +786,6 @@ static int i915_frequency_info(struct seq_file *m, vo=
id *unused)
>  	struct intel_uncore *uncore =3D &dev_priv->uncore;
>  	struct intel_rps *rps =3D &dev_priv->gt.rps;
>  	intel_wakeref_t wakeref;
> -	int ret =3D 0;
>  =

>  	wakeref =3D intel_runtime_pm_get(&dev_priv->runtime_pm);
>  =

> @@ -1009,7 +1008,7 @@ static int i915_frequency_info(struct seq_file *m, =
void *unused)
>  	seq_printf(m, "Max pixel clock frequency: %d kHz\n", dev_priv->max_dotc=
lk_freq);
>  =

>  	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
> -	return ret;
> +	return 0;
>  }
>  =

>  static int i915_ring_freq_table(struct seq_file *m, void *unused)
> -- =

> 2.6.2
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
