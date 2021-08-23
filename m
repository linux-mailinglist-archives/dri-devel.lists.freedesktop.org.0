Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44A33F44AB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 07:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E2689DF9;
	Mon, 23 Aug 2021 05:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E1589C52;
 Mon, 23 Aug 2021 05:42:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="280758823"
X-IronPort-AV: E=Sophos;i="5.84,343,1620716400"; d="scan'208";a="280758823"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2021 22:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,343,1620716400"; d="scan'208";a="525806156"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2021 22:42:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 22 Aug 2021 22:42:23 -0700
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 22 Aug 2021 22:42:22 -0700
Received: from bgsmsx602.gar.corp.intel.com ([10.109.78.81]) by
 BGSMSX602.gar.corp.intel.com ([10.109.78.81]) with mapi id 15.01.2242.010;
 Mon, 23 Aug 2021 11:12:20 +0530
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>, "Srivatsa, Anusha"
 <anusha.srivatsa@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Navare, Manasi D"
 <manasi.d.navare@intel.com>
Subject: RE: [PATCH 50/53] drm/i915/display/dsc: Add Per connector debugfs
 node for DSC BPP enable
Thread-Topic: [PATCH 50/53] drm/i915/display/dsc: Add Per connector debugfs
 node for DSC BPP enable
Thread-Index: AQHXbrc9eoGcrg6t/E6j0LW+n5yCuqsu/HaAgFHpCWA=
Date: Mon, 23 Aug 2021 05:42:20 +0000
Message-ID: <3becc90fd8a2409ba79b496a580a4464@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-51-matthew.d.roper@intel.com>
 <8735sxqg9c.fsf@intel.com>
In-Reply-To: <8735sxqg9c.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now, this change and changes from patch 51 of this series is taken care as =
part of the below series
https://patchwork.freedesktop.org/series/92750/
and merged.

Thanks,
Vandita
> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Friday, July 2, 2021 1:50 PM
> To: Roper, Matthew D <matthew.d.roper@intel.com>; intel-
> gfx@lists.freedesktop.org
> Cc: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>; Srivatsa, Anush=
a
> <anusha.srivatsa@intel.com>; dri-devel@lists.freedesktop.org; Navare,
> Manasi D <manasi.d.navare@intel.com>; Kulkarni, Vandita
> <vandita.kulkarni@intel.com>
> Subject: Re: [PATCH 50/53] drm/i915/display/dsc: Add Per connector debugf=
s
> node for DSC BPP enable
>=20
> On Thu, 01 Jul 2021, Matt Roper <matthew.d.roper@intel.com> wrote:
> > From: Anusha Srivatsa <anusha.srivatsa@intel.com>
> >
> > DSC can be supported per DP connector. This patch creates a per
> > connector debugfs node to expose the Input and Compressed BPP.
> >
> > The same node can be used from userspace to force DSC to a certain
> > BPP.
> >
> > force_dsc_bpp is written through this debugfs node to force DSC BPP to
> > all accepted values
>=20
> I think this patch needs rework, and it's independent of the rest of the
> series. Please just drop this one and the next.
>=20
> BR,
> Jani.
>=20
> >
> > Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  .../drm/i915/display/intel_display_debugfs.c  | 103 +++++++++++++++++-
> >  .../drm/i915/display/intel_display_types.h    |   1 +
> >  2 files changed, 103 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > index af9e58619667..1805d70ea817 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > @@ -2389,6 +2389,100 @@ static const struct file_operations
> i915_dsc_fec_support_fops =3D {
> >  	.write =3D i915_dsc_fec_support_write
> >  };
> >
> > +static int i915_dsc_bpp_support_show(struct seq_file *m, void *data)
> > +{
> > +	struct drm_connector *connector =3D m->private;
> > +	struct drm_device *dev =3D connector->dev;
> > +	struct drm_crtc *crtc;
> > +	struct intel_dp *intel_dp;
> > +	struct drm_modeset_acquire_ctx ctx;
> > +	struct intel_crtc_state *crtc_state =3D NULL;
> > +	int ret =3D 0;
> > +	bool try_again =3D false;
> > +
> > +	drm_modeset_acquire_init(&ctx,
> DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
> > +
> > +	do {
> > +		try_again =3D false;
> > +		ret =3D drm_modeset_lock(&dev-
> >mode_config.connection_mutex,
> > +				       &ctx);
> > +		if (ret) {
> > +			ret =3D -EINTR;
> > +			break;
> > +		}
> > +		crtc =3D connector->state->crtc;
> > +		if (connector->status !=3D connector_status_connected ||
> !crtc) {
> > +			ret =3D -ENODEV;
> > +			break;
> > +		}
> > +		ret =3D drm_modeset_lock(&crtc->mutex, &ctx);
> > +		if (ret =3D=3D -EDEADLK) {
> > +			ret =3D drm_modeset_backoff(&ctx);
> > +			if (!ret) {
> > +				try_again =3D true;
> > +				continue;
> > +			}
> > +			break;
> > +		} else if (ret) {
> > +			break;
> > +		}
> > +		intel_dp =3D
> intel_attached_dp(to_intel_connector(connector));
> > +		crtc_state =3D to_intel_crtc_state(crtc->state);
> > +		seq_printf(m, "Input_BPP: %d\n", crtc_state->pipe_bpp);
> > +		seq_printf(m, "Compressed_BPP: %d\n",
> > +				crtc_state->dsc.compressed_bpp);
> > +	} while (try_again);
> > +
> > +	drm_modeset_drop_locks(&ctx);
> > +	drm_modeset_acquire_fini(&ctx);
> > +
> > +	return ret;
> > +}
> > +
> > +static ssize_t i915_dsc_bpp_support_write(struct file *file,
> > +						const char __user *ubuf,
> > +						size_t len, loff_t *offp)
> > +{
> > +	int dsc_bpp =3D 0;
> > +	int ret;
> > +	struct drm_connector *connector =3D
> > +		((struct seq_file *)file->private_data)->private;
> > +	struct intel_encoder *encoder =3D
> intel_attached_encoder(to_intel_connector(connector));
> > +	struct drm_i915_private *i915 =3D to_i915(encoder->base.dev);
> > +	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
> > +
> > +	if (len =3D=3D 0)
> > +		return 0;
> > +
> > +	drm_dbg(&i915->drm,
> > +		"Copied %zu bytes from user to force BPP\n", len);
> > +
> > +	ret =3D kstrtoint_from_user(ubuf, len, 0, &dsc_bpp);
> > +
> > +	intel_dp->force_dsc_bpp =3D dsc_bpp;
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*offp +=3D len;
> > +	return len;
> > +}
> > +
> > +static int i915_dsc_bpp_support_open(struct inode *inode,
> > +					   struct file *file)
> > +{
> > +	return single_open(file, i915_dsc_bpp_support_show,
> > +			   inode->i_private);
> > +}
> > +
> > +static const struct file_operations i915_dsc_bpp_support_fops =3D {
> > +	.owner =3D THIS_MODULE,
> > +	.open =3D i915_dsc_bpp_support_open,
> > +	.read =3D seq_read,
> > +	.llseek =3D seq_lseek,
> > +	.release =3D single_release,
> > +	.write =3D i915_dsc_bpp_support_write
> > +};
> > +
> >  /**
> >   * intel_connector_debugfs_add - add i915 specific connector debugfs f=
iles
> >   * @connector: pointer to a registered drm_connector @@ -2427,9
> > +2521,16 @@ int intel_connector_debugfs_add(struct drm_connector
> *connector)
> >  				    connector,
> &i915_hdcp_sink_capability_fops);
> >  	}
> >
> > -	if ((DISPLAY_VER(dev_priv) >=3D 11 || IS_CANNONLAKE(dev_priv)) &&
> ((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort &&
> !to_intel_connector(connector)->mst_port) || connector->connector_type
> =3D=3D DRM_MODE_CONNECTOR_eDP))
> > +	if ((DISPLAY_VER(dev_priv) >=3D 11 || IS_CANNONLAKE(dev_priv)) &&
> > +	    ((connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort &&
> > +	      !to_intel_connector(connector)->mst_port) ||
> > +	     connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP))
> {
> >  		debugfs_create_file("i915_dsc_fec_support", S_IRUGO,
> root,
> >  				    connector, &i915_dsc_fec_support_fops);
> > +		debugfs_create_file("i915_dsc_bpp_support", 0444,
> > +				    root, connector,
> > +				    &i915_dsc_bpp_support_fops);
> > +	}
> >
> >  	/* Legacy panels doesn't lpsp on any platform */
> >  	if ((DISPLAY_VER(dev_priv) >=3D 9 || IS_HASWELL(dev_priv) || diff
> > --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 29ae1d9b5abc..00320d89d266 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -1627,6 +1627,7 @@ struct intel_dp {
> >
> >  	/* Display stream compression testing */
> >  	bool force_dsc_en;
> > +	int force_dsc_bpp;
> >
> >  	bool hobl_failed;
> >  	bool hobl_active;
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
