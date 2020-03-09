Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E69917EA16
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 21:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E126E584;
	Mon,  9 Mar 2020 20:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C7D6E57A;
 Mon,  9 Mar 2020 20:33:38 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 13:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="245457389"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by orsmga006.jf.intel.com with ESMTP; 09 Mar 2020 13:33:37 -0700
Date: Mon, 9 Mar 2020 13:34:55 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 1/2] drm/edid: Name the detailed monitor
 range flags
Message-ID: <20200309203454.GA12741@intel.com>
References: <20200306014220.20029-1-manasi.d.navare@intel.com>
 <87mu8tojvt.fsf@intel.com> <20200306184048.GA25133@intel.com>
 <87h7yylyc7.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7yylyc7.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Kazlauskas Nicholas <Nicholas.Kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 10:35:52AM +0200, Jani Nikula wrote:
> On Fri, 06 Mar 2020, Manasi Navare <manasi.d.navare@intel.com> wrote:
> > On Fri, Mar 06, 2020 at 12:30:46PM +0200, Jani Nikula wrote:
> >> On Thu, 05 Mar 2020, Manasi Navare <manasi.d.navare@intel.com> wrote:
> >> > This patch adds defines for the detailed monitor
> >> > range flags as per the EDID specification.
> >> >
> >> > Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >> > Cc: Harry Wentland <harry.wentland@amd.com>
> >> > Cc: Clinton A Taylor <clinton.a.taylor@intel.com>
> >> > Cc: Kazlauskas Nicholas <Nicholas.Kazlauskas@amd.com>
> >> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> >> > ---
> >> >  include/drm/drm_edid.h | 5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> >
> >> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> >> > index f0b03d401c27..f89c97623845 100644
> >> > --- a/include/drm/drm_edid.h
> >> > +++ b/include/drm/drm_edid.h
> >> > @@ -91,6 +91,11 @@ struct detailed_data_string {
> >> >  	u8 str[13];
> >> >  } __attribute__((packed));
> >> >  =

> >> > +#define EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00
> >> > +#define EDID_RANGE_LIMITS_ONLY_FLAG     0x01
> >> > +#define EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02
> >> > +#define EDID_CVT_SUPPORT_FLAG           0x04
> >> =

> >> Bikeshed for consideration:
> >> =

> >> drm_edid.h has some macros with DRM_EDID_ prefix, some with EDID_
> >> prefix, and then some with no prefix at all really. Should we start
> >> consolidating on something when we add more?
> >>
> >
> > Yes Jani I did notice the same thing and didnt know which convention
> > to continue to follow but I noticed that majority of the defines were
> > just EDID_ so just used that for these new defines.
> =

> Ah, look again, DRM_EDID_ trumps EDID_ 51 to 15.
> =

> > Is there a particular way you wish to consolidate this and use a specif=
ic
> > convention for #defines?
> >
> > I can atleast change these new defines based on a preferred convention =
and then
> > separate patches to change the rest in .h and corresponding usages in .=
c files.
> =

> I'd suggest DRM_EDID_ for new ones, perhaps eventually rename old ones.

Okay cool, I will rename this to be DRM_EDID_ and then work on renaming oth=
ers later
Thanks for pointing this out.

Regards
Manasi

> =

> BR,
> Jani.
> =

> =

> >
> > Regards
> > Manasi
> >  =

> >> BR,
> >> Jani.
> >> =

> >> =

> >> > +
> >> >  struct detailed_data_monitor_range {
> >> >  	u8 min_vfreq;
> >> >  	u8 max_vfreq;
> >> =

> >> -- =

> >> Jani Nikula, Intel Open Source Graphics Center
> =

> -- =

> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
