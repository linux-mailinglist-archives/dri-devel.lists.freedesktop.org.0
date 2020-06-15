Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392F1FA304
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 23:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E11D6E51A;
	Mon, 15 Jun 2020 21:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DCD6E51A;
 Mon, 15 Jun 2020 21:47:02 +0000 (UTC)
IronPort-SDR: jZajlAkGIIaKPjb3uIW9PjBCRZS2bF/HVGNrcdUndnqIr3o1fM2QcOmW+ytmxDgdE2UgzdE8iW
 saYRcee3yyLA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 14:47:01 -0700
IronPort-SDR: vrLN12SKSKdHKRJMFTF72BJlpnJwYW/OfP+90ZgqAnKl/MpRtdoajlpvb3BzbeLcQD9AY7onJk
 VZOMWuDRKRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,516,1583222400"; d="scan'208";a="476177176"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2020 14:47:01 -0700
Date: Mon, 15 Jun 2020 14:48:09 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v7 3/3] drm/i915/dp: Expose connector VRR monitor range
 via debugfs
Message-ID: <20200615214809.GA4334@intel.com>
References: <20200612230444.10121-4-manasi.d.navare@intel.com>
 <20200612235606.25120-1-manasi.d.navare@intel.com>
 <CACvgo522mYhCRkNXuwJDCt2fh4-Piq9ZOH9rNbO+HrcbrytJgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo522mYhCRkNXuwJDCt2fh4-Piq9ZOH9rNbO+HrcbrytJgQ@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 10:36:28PM +0100, Emil Velikov wrote:
> Hi Manasi,
> =

> On Sat, 13 Jun 2020 at 00:55, Manasi Navare <manasi.d.navare@intel.com> w=
rote:
> >
> > From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> >
> > [Why]
> > It's useful to know the min and max vrr range for IGT testing.
> >
> > [How]
> > Expose the min and max vfreq for the connector via a debugfs file
> > on the connector, "vrr_range".
> >
> > Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> >
> > v7:
> > * Fix cmpilation due to rebase
> > v6:
> > * Rebase (manasi)
> > v5:
> > * Rename to vrr_range to match AMD debugfs
> > v4:
> > * Rebase
> > v3:
> > * Remove the unnecessary debug print (Manasi)
> > v2:
> > * Fix the typo in max_vfreq (Manasi)
> > * Change the name of node to i915_vrr_info so we can add
> > other vrr info for more debug info (Manasi)
> > * Change the VRR capable to display Yes or No (Manasi)
> > * Fix indentation checkpatch errors (Manasi)
> >
> Nit: generally revision log is listed in v2 -> v6 order.

Okay point noted. Will update this in the next rev

> =

> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Tested-by: Manasi Navare <manasi.d.navare@intel.com>
> > ---
> >  .../drm/i915/display/intel_display_debugfs.c  | 22 ++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/dri=
vers/gpu/drm/i915/display/intel_display_debugfs.c
> > index 28dd717e943a..2921f7d2a26e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > @@ -2185,6 +2185,21 @@ static const struct file_operations i915_dsc_fec=
_support_fops =3D {
> >         .write =3D i915_dsc_fec_support_write
> >  };
> >
> > +static int vrr_range_show(struct seq_file *m, void *data)
> > +{
> > +       struct drm_connector *connector =3D m->private;
> > +
> > +       if (connector->status !=3D connector_status_connected)
> > +               return -ENODEV;
> > +
> > +       seq_printf(m, "Vrr_capable: %s\n", yesno(intel_dp_is_vrr_capabl=
e(connector)));
> > +       seq_printf(m, "Min: %u\n", (u8)connector->display_info.monitor_=
range.min_vfreq);
> > +       seq_printf(m, "Max: %u\n", (u8)connector->display_info.monitor_=
range.max_vfreq);
> > +
> > +       return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(vrr_range);
> > +
> >  /**
> >   * intel_connector_debugfs_add - add i915 specific connector debugfs f=
iles
> >   * @connector: pointer to a registered drm_connector
> > @@ -2220,10 +2235,15 @@ int intel_connector_debugfs_add(struct drm_conn=
ector *connector)
> >         if (INTEL_GEN(dev_priv) >=3D 10 &&
> >             ((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_Displ=
ayPort &&
> >               !to_intel_connector(connector)->mst_port) ||
> > -            connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP))
> > +            connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)) {
> >                 debugfs_create_file("i915_dsc_fec_support", S_IRUGO, ro=
ot,
> >                                     connector, &i915_dsc_fec_support_fo=
ps);
> >
> > +               if (INTEL_GEN(dev_priv) >=3D 12)
> > +                       debugfs_create_file("vrr_range", S_IRUGO,
> > +                                           root, connector, &vrr_range=
_fops);
> > +       }
> > +
> =

> I think this should be added by core drm. Ideally drm will add it
> automatically for each connector that the driver has called
> drm_connector_attach_vrr_capable_property() upon.
>

But in this case drm_connector_attach_vrr_capable_property() is called by i=
ndividual
driver since its an optional connector property. So we call this inside i91=
5.
Also currently AMD sets this debugfs inside AMD IMO, so setting this here f=
or now.
But I agree that can be moved to drm core may be when drm_display_info gets=
 populated
with min and max, thats where drm can add this?

Manasi
  =

> -Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
