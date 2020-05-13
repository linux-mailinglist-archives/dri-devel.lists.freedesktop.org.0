Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E8F1D1D55
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 20:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5466EA94;
	Wed, 13 May 2020 18:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093716EA91;
 Wed, 13 May 2020 18:20:19 +0000 (UTC)
IronPort-SDR: qZib36lSUNTGHiXRoqzXCkxtJTHnLZyslEP0q+AV1kqKPdOIP+4g9aQBFz0jXlTh6gtAPdb93i
 wZ6u+m9r+AvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 11:20:19 -0700
IronPort-SDR: MwdRx6MaJM0UeC13eZtEG6vfsmezOahXxDUiAE7auPfxbYulnZfAf2VAgPnhpA0IB6eaB90JEx
 +hXQc/td5xGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; d="scan'208";a="251846789"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga007.fm.intel.com with ESMTP; 13 May 2020 11:20:18 -0700
Date: Wed, 13 May 2020 11:21:22 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH v5 3/3] drm/i915/dp: Expose connector VRR info via debugfs
Message-ID: <20200513182122.GA4591@intel.com>
References: <20200513053431.2138-1-manasi.d.navare@intel.com>
 <20200513053431.2138-3-manasi.d.navare@intel.com>
 <SN6PR11MB3327309E56F7C172263CFE088DBF0@SN6PR11MB3327.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR11MB3327309E56F7C172263CFE088DBF0@SN6PR11MB3327.namprd11.prod.outlook.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 04:08:38AM -0700, Modem, Bhanuprakash wrote:
> -----Original Message-----
> From: Navare, Manasi D <manasi.d.navare@intel.com>
> Sent: Wednesday, May 13, 2020 11:05 AM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Navare, Manasi D =
<manasi.d.navare@intel.com>; Jani Nikula <jani.nikula@linux.intel.com>; Vil=
le Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Subject: [PATCH v5 3/3] drm/i915/dp: Expose connector VRR info via debugfs
> =

> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> =

> [Why]
> It's useful to know the min and max vrr range for IGT testing.
> =

> [How]
> Expose the min and max vfreq for the connector via a debugfs file on the =
connector, "i915_vrr_info".
> =

> Example usage: cat /sys/kernel/debug/dri/0/DP-1/i915_vrr_info
> =

> [Bhanu]: Can you please fix the commit message? 's/i915_vrr_info/vrr_rang=
e/'
> =

> v5:
> * Rename to vrr_range to match AMD debugfs
> v4:
> * Rebase
> v3:
> * Remove the unnecessary debug print (Manasi)
> v2:
> * Fix the typo in max_vfreq (Manasi)
> * Change the name of node to i915_vrr_info so we can add other vrr info f=
or more debug info (Manasi)
> * Change the VRR capable to display Yes or No (Manasi)
> * Fix indentation checkpatch errors (Manasi)
> =

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Tested-by: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  .../drm/i915/display/intel_display_debugfs.c  | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drive=
rs/gpu/drm/i915/display/intel_display_debugfs.c
> index 70525623bcdf..a0d680c13e0d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -2185,6 +2185,21 @@ static const struct file_operations i915_dsc_fec_s=
upport_fops =3D {
>  .write =3D i915_dsc_fec_support_write
>  };
> =

> +static int vrr_range_show(struct seq_file *m, void *data) {
> +struct drm_connector *connector =3D m->private;
> +
> +if (connector->status !=3D connector_status_connected)
> +return -ENODEV;
> +
> +seq_printf(m, "Vrr_capable: %s\n", yesno(intel_dp_is_vrr_capable(connect=
or)));
> [Bhanu]: As we can read "vrr_capable" property from DRM_IOCTL_MODE_OBJ_GE=
TPROPERTIES ioctl, I think we don't need to expose "vrr_capable" through de=
bugfs.

Yes we can get it with the Get prop IOCTL, but having it in debugfs will st=
ill be a good debug info without
needing to call the ioctl

Manasi

> +seq_printf(m, "Min: %u\n", (u8)connector->display_info.monitor_range.min=
_vfreq);
> +seq_printf(m, "Max: %u\n",
> +(u8)connector->display_info.monitor_range.max_vfreq);
> +
> +return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(vrr_range);
> +
>  /**
>   * intel_connector_debugfs_add - add i915 specific connector debugfs fil=
es
>   * @connector: pointer to a registered drm_connector @@ -2219,10 +2234,1=
5 @@ int intel_connector_debugfs_add(struct drm_connector *connector)
> =

>  if (INTEL_GEN(dev_priv) >=3D 10 &&
>      (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
> -     connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP))
> +     connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)) {
>  debugfs_create_file("i915_dsc_fec_support", S_IRUGO, root,
>      connector, &i915_dsc_fec_support_fops);
> =

> +if (INTEL_GEN(dev_priv) >=3D 12)
> +debugfs_create_file("vrr_range", S_IRUGO,
> +    root, connector, &vrr_range_fops);
> +}
> +
>  /* Legacy panels doesn't lpsp on any platform */
>  if ((INTEL_GEN(dev_priv) >=3D 9 || IS_HASWELL(dev_priv) ||
>       IS_BROADWELL(dev_priv)) &&
> --
> 2.19.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
