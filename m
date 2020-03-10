Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFCC1807AC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 20:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EA36E8CB;
	Tue, 10 Mar 2020 19:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1496E8CA;
 Tue, 10 Mar 2020 19:09:51 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 12:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,538,1574150400"; d="scan'208";a="441406891"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga005.fm.intel.com with ESMTP; 10 Mar 2020 12:09:50 -0700
Date: Tue, 10 Mar 2020 12:11:09 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 1/2] drm/edid: Name the detailed monitor range flags
Message-ID: <20200310191109.GB717@intel.com>
References: <20200309213940.27965-1-manasi.d.navare@intel.com>
 <20200310162027.GL13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310162027.GL13686@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kazlauskas Nicholas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 06:20:27PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Mar 09, 2020 at 02:39:39PM -0700, Manasi Navare wrote:
> > This patch adds defines for the detailed monitor
> > range flags as per the EDID specification.
> > =

> > v2:
> > * Rename the flags with DRM_EDID_ (Jani N)
> > =

> > Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Clinton A Taylor <clinton.a.taylor@intel.com>
> > Cc: Kazlauskas Nicholas <Nicholas.Kazlauskas@amd.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > ---
> >  include/drm/drm_edid.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > =

> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index f0b03d401c27..34b15e3d070c 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -91,6 +91,11 @@ struct detailed_data_string {
> >  	u8 str[13];
> >  } __attribute__((packed));
> >  =

> > +#define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00
> > +#define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01
> > +#define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02
> > +#define DRM_EDID_CVT_SUPPORT_FLAG           0x04
> =

> No indication what flags thse are. Also missing the
> actual change to use them in drm_edid.c.
>

The name of the flag in #define indicates what flag it is, how else do you
want me to add teh indication?

I have done the change in my second patch to use this flag #define =

Use of these flags in other places in drm_edid.c will be follow up patches

SOunds good?

Manasi
 =

> > +
> >  struct detailed_data_monitor_range {
> >  	u8 min_vfreq;
> >  	u8 max_vfreq;
> > -- =

> > 2.19.1
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
