Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D874920A86D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 00:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602E76E11A;
	Thu, 25 Jun 2020 22:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642B06E11A;
 Thu, 25 Jun 2020 22:54:29 +0000 (UTC)
IronPort-SDR: dQSEoK2bMvODv7uUc9WUfzWialowNLEN69S/ihmdvGrghgC9SZH9hJ51ouJDxEuDJ6hl++aoGE
 TQmLZ2FuIBwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="229853355"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="229853355"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 15:54:29 -0700
IronPort-SDR: 0cR7pbJQawxdi0f5CLpbhUbYqXTZTgljHYykd8Tf37crk1ickacoM5mggt+IbwSOqbFqxGsEuW
 w/UPf/1IeD4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="479639589"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jun 2020 15:54:28 -0700
Date: Thu, 25 Jun 2020 15:55:55 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [v9 2/3] drm/debug: Expose connector VRR monitor range via debugfs
Message-ID: <20200625225555.GE30431@intel.com>
References: <20200622142519.16214-1-bhanuprakash.modem@intel.com>
 <20200622142519.16214-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622142519.16214-3-bhanuprakash.modem@intel.com>
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

Thanks Bhanu for the patch, merged to drm-misc

Manasi

On Mon, Jun 22, 2020 at 07:55:18PM +0530, Bhanuprakash Modem wrote:
> [Why]
> It's useful to know the min and max vrr range for IGT testing.
> =

> [How]
> Expose the min and max vfreq for the connector via a debugfs file
> on the connector, "vrr_range".
> =

> Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> =

> v2:
> * Fix the typo in max_vfreq (Manasi)
> * Change the name of node to i915_vrr_info so we can add
> other vrr info for more debug info (Manasi)
> * Change the VRR capable to display Yes or No (Manasi)
> * Fix indentation checkpatch errors (Manasi)
> v3:
> * Remove the unnecessary debug print (Manasi)
> v4:
> * Rebase
> v5:
> * Rename to vrr_range to match AMD debugfs
> v6:
> * Rebase (manasi)
> v7:
> * Fix cmpilation due to rebase
> v8:
> * Move debugfs node creation logic to DRM (Emil)
> * Remove AMD specific logic (Emil)
> v9:
> * Seperate patch for removal of AMD specific logic (Manasi)
> =

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> CC: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index bfe4602f206b..3d7182001004 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -376,6 +376,24 @@ static ssize_t edid_write(struct file *file, const c=
har __user *ubuf,
>  	return (ret) ? ret : len;
>  }
>  =

> +/*
> + * Returns the min and max vrr vfreq through the connector's debugfs fil=
e.
> + * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> + */
> +static int vrr_range_show(struct seq_file *m, void *data)
> +{
> +	struct drm_connector *connector =3D m->private;
> +
> +	if (connector->status !=3D connector_status_connected)
> +		return -ENODEV;
> +
> +	seq_printf(m, "Min: %u\n", (u8)connector->display_info.monitor_range.mi=
n_vfreq);
> +	seq_printf(m, "Max: %u\n", (u8)connector->display_info.monitor_range.ma=
x_vfreq);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(vrr_range);
> +
>  static const struct file_operations drm_edid_fops =3D {
>  	.owner =3D THIS_MODULE,
>  	.open =3D edid_open,
> @@ -413,6 +431,10 @@ void drm_debugfs_connector_add(struct drm_connector =
*connector)
>  	/* edid */
>  	debugfs_create_file("edid_override", S_IRUGO | S_IWUSR, root, connector,
>  			    &drm_edid_fops);
> +
> +	/* vrr range */
> +	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
> +			    &vrr_range_fops);
>  }
>  =

>  void drm_debugfs_connector_remove(struct drm_connector *connector)
> -- =

> 2.20.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
