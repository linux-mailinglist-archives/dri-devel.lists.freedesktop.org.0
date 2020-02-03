Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42402151115
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 21:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4BC6ECF3;
	Mon,  3 Feb 2020 20:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C986E431;
 Mon,  3 Feb 2020 20:34:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 12:34:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="378203033"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2020 12:34:20 -0800
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 12:34:20 -0800
Received: from bgsmsx106.gar.corp.intel.com (10.223.43.196) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 12:34:19 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.36]) by
 BGSMSX106.gar.corp.intel.com ([169.254.1.198]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 02:04:16 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Alex
 Deucher" <alexdeucher@gmail.com>
Subject: RE: [Intel-gfx] [PATCH 7/8] drm/edid: Constify lots of things
Thread-Topic: [Intel-gfx] [PATCH 7/8] drm/edid: Constify lots of things
Thread-Index: AQHV1WKIj6kdMwrl8E+wln+6XVdglaf/mveAgAparXA=
Date: Mon, 3 Feb 2020 20:34:16 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823AA04F@BGSMSX104.gar.corp.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-7-ville.syrjala@linux.intel.com>
 <CADnq5_Pare=s7H4qw6aM1bUJMjKHRQq2Pw6_-oChqd-Du-R4cA@mail.gmail.com>
 <20200128114917.GH13686@intel.com>
In-Reply-To: <20200128114917.GH13686@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODdmYjcyN2YtZmYyMi00MGQxLWJkZjQtYmZjYjI1YTViNDY0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTFg1ZFYzeXhmbTVwV2FlbU8yc3BRYWtxSGVnVVNmZG55bm5GejJ2S1ZJZ3RnbkZzTGpNaTlidmxrVEJmWEpOciJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Maling
 list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Vi=
lle Syrj=E4l=E4
> Sent: Tuesday, January 28, 2020 5:19 PM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>; Maling =
list - DRI
> developers <dri-devel@lists.freedesktop.org>
> Subject: Re: [Intel-gfx] [PATCH 7/8] drm/edid: Constify lots of things
> =

> On Mon, Jan 27, 2020 at 05:38:15PM -0500, Alex Deucher wrote:
> > On Fri, Jan 24, 2020 at 3:03 PM Ville Syrjala
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > Let's try to make a lot more stuff const in the edid parser.
> > >
> > > The "downside" is that we can no longer mangle the EDID in the
> > > middle of the parsing to apply quirks (drm_mode_detailed()).
> > > I don't really think mangling the blob itself is such a great idea
> > > anyway so I won't miss that part. But if we do want it back I guess
> > > we should do the mangling in one explicit place before we otherwise
> > > parse the EDID.
> > >
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > I generally agree, but are there any userspace expectations that they
> > will be getting a corrected EDID in some cases?
> =

> Not sure. I think the the only thing we're fixing up is some DTDs so at l=
east there's a
> better way for userspace to get the fixed information (getconnector ioctl=
). I guess
> Xorg is still parsing the EDID though, but it should have more or less th=
e same quirks
> in its parser.

Theoretically, there may be a possibility of userspace getting out of sync =
in case EDID exposed
to user is different to the quirked version getting used in kernel. I feel =
what you said in commit
message looks good, where we can do the quirks at one place and share the s=
ame to userspace.
Later just use that to proceed with parsing with constantifed edid in kerne=
l.

Regards,
Uma Shankar

> >
> > Alex
> >
> > > ---
> > >  drivers/gpu/drm/drm_connector.c |   4 +-
> > >  drivers/gpu/drm/drm_edid.c      | 303 ++++++++++++++++++------------=
--
> > >  include/drm/drm_connector.h     |   4 +-
> > >  3 files changed, 176 insertions(+), 135 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_connector.c
> > > b/drivers/gpu/drm/drm_connector.c index f632ca05960e..92a5cd6ff6b1
> > > 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -2377,7 +2377,7 @@ EXPORT_SYMBOL(drm_mode_put_tile_group);
> > >   * tile group or NULL if not found.
> > >   */
> > >  struct drm_tile_group *drm_mode_get_tile_group(struct drm_device *de=
v,
> > > -                                              char topology[8])
> > > +                                              const u8 topology[8])
> > >  {
> > >         struct drm_tile_group *tg;
> > >         int id;
> > > @@ -2407,7 +2407,7 @@ EXPORT_SYMBOL(drm_mode_get_tile_group);
> > >   * new tile group or NULL.
> > >   */
> > >  struct drm_tile_group *drm_mode_create_tile_group(struct drm_device =
*dev,
> > > -                                                 char topology[8])
> > > +                                                 const u8
> > > + topology[8])
> > >  {
> > >         struct drm_tile_group *tg;
> > >         int ret;
> > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > > index fd9b724067a7..8e76efe1654d 100644
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -88,7 +88,7 @@
> > >
> > >  struct detailed_mode_closure {
> > >         struct drm_connector *connector;
> > > -       struct edid *edid;
> > > +       const struct edid *edid;
> > >         bool preferred;
> > >         u32 quirks;
> > >         int modes;
> > > @@ -1584,8 +1584,8 @@ MODULE_PARM_DESC(edid_fixup,
> > >                  "Minimum number of valid EDID header bytes (0-8,
> > > default 6)");
> > >
> > >  static void drm_get_displayid(struct drm_connector *connector,
> > > -                             struct edid *edid);
> > > -static int validate_displayid(u8 *displayid, int length, int idx);
> > > +                             const struct edid *edid); static int
> > > +validate_displayid(const u8 *displayid, int length, int idx);
> > >
> > >  static int drm_edid_block_checksum(const u8 *raw_edid)  { @@
> > > -2207,41 +2207,41 @@ static bool is_detailed_timing_descriptor(const =
u8 d[18])
> > >         return d[0] !=3D 0x00 || d[1] !=3D 0x00;  }
> > >
> > > -typedef void detailed_cb(struct detailed_timing *timing, void
> > > *closure);
> > > +typedef void detailed_cb(const struct detailed_timing *timing, void
> > > +*closure);
> > >
> > >  static void
> > > -cea_for_each_detailed_block(u8 *ext, detailed_cb *cb, void
> > > *closure)
> > > +cea_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void
> > > +*closure)
> > >  {
> > >         int i, n;
> > >         u8 d =3D ext[0x02];
> > > -       u8 *det_base =3D ext + d;
> > > +       const u8 *det_base =3D ext + d;
> > >
> > >         if (d < 4 || d > 127)
> > >                 return;
> > >
> > >         n =3D (127 - d) / 18;
> > >         for (i =3D 0; i < n; i++)
> > > -               cb((struct detailed_timing *)(det_base + 18 * i), clo=
sure);
> > > +               cb((const struct detailed_timing *)(det_base + 18 *
> > > + i), closure);
> > >  }
> > >
> > >  static void
> > > -vtb_for_each_detailed_block(u8 *ext, detailed_cb *cb, void
> > > *closure)
> > > +vtb_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void
> > > +*closure)
> > >  {
> > >         unsigned int i, n =3D min((int)ext[0x02], 6);
> > > -       u8 *det_base =3D ext + 5;
> > > +       const u8 *det_base =3D ext + 5;
> > >
> > >         if (ext[0x01] !=3D 1)
> > >                 return; /* unknown version */
> > >
> > >         for (i =3D 0; i < n; i++)
> > > -               cb((struct detailed_timing *)(det_base + 18 * i), clo=
sure);
> > > +               cb((const struct detailed_timing *)(det_base + 18 *
> > > + i), closure);
> > >  }
> > >
> > >  static void
> > > -drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void
> > > *closure)
> > > +drm_for_each_detailed_block(const u8 *raw_edid, detailed_cb *cb,
> > > +void *closure)
> > >  {
> > > +       const struct edid *edid =3D (struct edid *)raw_edid;
> > >         int i;
> > > -       struct edid *edid =3D (struct edid *)raw_edid;
> > >
> > >         if (edid =3D=3D NULL)
> > >                 return;
> > > @@ -2250,7 +2250,7 @@ drm_for_each_detailed_block(u8 *raw_edid,
> detailed_cb *cb, void *closure)
> > >                 cb(&(edid->detailed_timings[i]), closure);
> > >
> > >         for (i =3D 1; i <=3D raw_edid[0x7e]; i++) {
> > > -               u8 *ext =3D raw_edid + (i * EDID_LENGTH);
> > > +               const u8 *ext =3D raw_edid + (i * EDID_LENGTH);
> > >                 switch (*ext) {
> > >                 case CEA_EXT:
> > >                         cea_for_each_detailed_block(ext, cb,
> > > closure); @@ -2264,81 +2264,105 @@ drm_for_each_detailed_block(u8
> *raw_edid, detailed_cb *cb, void *closure)
> > >         }
> > >  }
> > >
> > > +struct bool_closure {
> > > +       bool ret;
> > > +};
> > > +
> > >  static void
> > > -is_rb(struct detailed_timing *t, void *data)
> > > +is_rb(const struct detailed_timing *t, void *c)
> > >  {
> > > -       u8 *r =3D (u8 *)t;
> > > +       struct bool_closure *closure =3D c;
> > > +       const u8 *r =3D (const u8 *)t;
> > >
> > >         if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
> > >                 return;
> > >
> > >         if (r[15] & 0x10)
> > > -               *(bool *)data =3D true;
> > > +               closure->ret =3D true;
> > >  }
> > >
> > >  /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess,
> > > badly. */  static bool -drm_monitor_supports_rb(struct edid *edid)
> > > +drm_monitor_supports_rb(const struct edid *edid)
> > >  {
> > >         if (edid->revision >=3D 4) {
> > > -               bool ret =3D false;
> > > -               drm_for_each_detailed_block((u8 *)edid, is_rb, &ret);
> > > -               return ret;
> > > +               struct bool_closure closure =3D {
> > > +                       .ret =3D false,
> > > +               };
> > > +
> > > +               drm_for_each_detailed_block((u8 *)edid, is_rb,
> > > + &closure);
> > > +
> > > +               return closure.ret;
> > >         }
> > >
> > >         return ((edid->input & DRM_EDID_INPUT_DIGITAL) !=3D 0);  }
> > >
> > > +struct data_closure {
> > > +       const u8 *data;
> > > +};
> > > +
> > >  static void
> > > -find_gtf2(struct detailed_timing *t, void *data)
> > > +do_find_gtf2(const struct detailed_timing *t, void *c)
> > >  {
> > > -       u8 *r =3D (u8 *)t;
> > > +       struct data_closure *closure =3D c;
> > > +       const u8 *r =3D (const u8 *)t;
> > >
> > >         if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
> > >                 return;
> > >
> > >         if (r[10] =3D=3D 0x02)
> > > -               *(u8 **)data =3D r;
> > > +               closure->data =3D r;
> > > +}
> > > +
> > > +static const u8 *
> > > +find_gtf2_descriptor(const struct edid *edid) {
> > > +       struct data_closure closure =3D {};
> > > +
> > > +       drm_for_each_detailed_block((u8 *)edid, do_find_gtf2,
> > > + &closure);
> > > +
> > > +       return closure.data;
> > >  }
> > >
> > >  /* Secondary GTF curve kicks in above some break frequency */
> > > static int -drm_gtf2_hbreak(struct edid *edid)
> > > +drm_gtf2_hbreak(const struct edid *edid)
> > >  {
> > > -       u8 *r =3D NULL;
> > > -       drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> > > -       return r ? (r[12] * 2) : 0;
> > > +       const u8 *r =3D find_gtf2_descriptor(edid);
> > > +
> > > +       return r ? r[12] * 2 : 0;
> > >  }
> > >
> > >  static int
> > > -drm_gtf2_2c(struct edid *edid)
> > > +drm_gtf2_2c(const struct edid *edid)
> > >  {
> > > -       u8 *r =3D NULL;
> > > -       drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> > > +       const u8 *r =3D find_gtf2_descriptor(edid);
> > > +
> > >         return r ? r[13] : 0;
> > >  }
> > >
> > >  static int
> > > -drm_gtf2_m(struct edid *edid)
> > > +drm_gtf2_m(const struct edid *edid)
> > >  {
> > > -       u8 *r =3D NULL;
> > > -       drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> > > -       return r ? (r[15] << 8) + r[14] : 0;
> > > +       const u8 *r =3D find_gtf2_descriptor(edid);
> > > +
> > > +       return r ? (r[15] << 8) | r[14] : 0;
> > >  }
> > >
> > >  static int
> > > -drm_gtf2_k(struct edid *edid)
> > > +drm_gtf2_k(const struct edid *edid)
> > >  {
> > > -       u8 *r =3D NULL;
> > > -       drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> > > +       const u8 *r =3D find_gtf2_descriptor(edid);
> > > +
> > >         return r ? r[16] : 0;
> > >  }
> > >
> > >  static int
> > > -drm_gtf2_2j(struct edid *edid)
> > > +drm_gtf2_2j(const struct edid *edid)
> > >  {
> > > -       u8 *r =3D NULL;
> > > -       drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> > > +       const u8 *r =3D find_gtf2_descriptor(edid);
> > > +
> > >         return r ? r[17] : 0;
> > >  }
> > >
> > > @@ -2346,7 +2370,7 @@ drm_gtf2_2j(struct edid *edid)
> > >   * standard_timing_level - get std. timing level(CVT/GTF/DMT)
> > >   * @edid: EDID block to scan
> > >   */
> > > -static int standard_timing_level(struct edid *edid)
> > > +static int standard_timing_level(const struct edid *edid)
> > >  {
> > >         if (edid->revision >=3D 2) {
> > >                 if (edid->revision >=3D 4 && (edid->features &
> > > DRM_EDID_FEATURE_DEFAULT_GTF)) @@ -2381,8 +2405,9 @@
> bad_std_timing(u8 a, u8 b)
> > >   * and convert them into a real mode using CVT/GTF/DMT.
> > >   */
> > >  static struct drm_display_mode *
> > > -drm_mode_std(struct drm_connector *connector, struct edid *edid,
> > > -            struct std_timing *t)
> > > +drm_mode_std(struct drm_connector *connector,
> > > +            const struct edid *edid,
> > > +            const struct std_timing *t)
> > >  {
> > >         struct drm_device *dev =3D connector->dev;
> > >         struct drm_display_mode *m, *mode =3D NULL; @@ -2500,7 +2525,7
> > > @@ drm_mode_std(struct drm_connector *connector, struct edid *edid,
> > >   */
> > >  static void
> > >  drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
> > > -                           struct detailed_pixel_timing *pt)
> > > +                           const struct detailed_pixel_timing *pt)
> > >  {
> > >         int i;
> > >         static const struct {
> > > @@ -2543,12 +2568,12 @@ drm_mode_do_interlace_quirk(struct
> drm_display_mode *mode,
> > >   * return a new struct drm_display_mode.
> > >   */
> > >  static struct drm_display_mode *drm_mode_detailed(struct drm_device =
*dev,
> > > -                                                 struct edid *edid,
> > > -                                                 struct detailed_tim=
ing *timing,
> > > +                                                 const struct edid *=
edid,
> > > +                                                 const struct
> > > + detailed_timing *timing,
> > >                                                   u32 quirks)  {
> > >         struct drm_display_mode *mode;
> > > -       struct detailed_pixel_timing *pt =3D &timing->data.pixel_data;
> > > +       const struct detailed_pixel_timing *pt =3D
> > > + &timing->data.pixel_data;
> > >         unsigned hactive =3D (pt->hactive_hblank_hi & 0xf0) << 4 | pt=
->hactive_lo;
> > >         unsigned vactive =3D (pt->vactive_vblank_hi & 0xf0) << 4 | pt=
->vactive_lo;
> > >         unsigned hblank =3D (pt->hactive_hblank_hi & 0xf) << 8 |
> > > pt->hblank_lo; @@ -2590,9 +2615,9 @@ static struct drm_display_mode
> *drm_mode_detailed(struct drm_device *dev,
> > >                 return NULL;
> > >
> > >         if (quirks & EDID_QUIRK_135_CLOCK_TOO_HIGH)
> > > -               timing->pixel_clock =3D cpu_to_le16(1088);
> > > -
> > > -       mode->clock =3D le16_to_cpu(timing->pixel_clock) * 10;
> > > +               mode->clock =3D 1088 * 10;
> > > +       else
> > > +               mode->clock =3D le16_to_cpu(timing->pixel_clock) * 10;
> > >
> > >         mode->hdisplay =3D hactive;
> > >         mode->hsync_start =3D mode->hdisplay + hsync_offset; @@
> > > -2613,14 +2638,14 @@ static struct drm_display_mode
> *drm_mode_detailed(struct drm_device *dev,
> > >         drm_mode_do_interlace_quirk(mode, pt);
> > >
> > >         if (quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
> > > -               pt->misc |=3D DRM_EDID_PT_HSYNC_POSITIVE |
> DRM_EDID_PT_VSYNC_POSITIVE;
> > > +               mode->flags |=3D DRM_MODE_FLAG_PHSYNC |
> DRM_MODE_FLAG_NVSYNC;
> > > +       } else {
> > > +               mode->flags |=3D (pt->misc & DRM_EDID_PT_HSYNC_POSITI=
VE) ?
> > > +                       DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> > > +               mode->flags |=3D (pt->misc & DRM_EDID_PT_VSYNC_POSITI=
VE) ?
> > > +                       DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
> > >         }
> > >
> > > -       mode->flags |=3D (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> > > -               DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> > > -       mode->flags |=3D (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> > > -               DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
> > > -
> > >  set_size:
> > >         mode->width_mm =3D pt->width_mm_lo | (pt->width_height_mm_hi =
& 0xf0)
> << 4;
> > >         mode->height_mm =3D pt->height_mm_lo | (pt->width_height_mm_hi
> > > & 0xf) << 8; @@ -2644,7 +2669,7 @@ static struct drm_display_mode
> > > *drm_mode_detailed(struct drm_device *dev,
> > >
> > >  static bool
> > >  mode_in_hsync_range(const struct drm_display_mode *mode,
> > > -                   struct edid *edid, u8 *t)
> > > +                   const struct edid *edid, const u8 *t)
> > >  {
> > >         int hsync, hmin, hmax;
> > >
> > > @@ -2661,7 +2686,7 @@ mode_in_hsync_range(const struct
> > > drm_display_mode *mode,
> > >
> > >  static bool
> > >  mode_in_vsync_range(const struct drm_display_mode *mode,
> > > -                   struct edid *edid, u8 *t)
> > > +                   const struct edid *edid, const u8 *t)
> > >  {
> > >         int vsync, vmin, vmax;
> > >
> > > @@ -2677,7 +2702,7 @@ mode_in_vsync_range(const struct
> > > drm_display_mode *mode,  }
> > >
> > >  static u32
> > > -range_pixel_clock(struct edid *edid, u8 *t)
> > > +range_pixel_clock(const struct edid *edid, const u8 *t)
> > >  {
> > >         /* unspecified */
> > >         if (t[9] =3D=3D 0 || t[9] =3D=3D 255) @@ -2692,11 +2717,12 @@
> > > range_pixel_clock(struct edid *edid, u8 *t)  }
> > >
> > >  static bool
> > > -mode_in_range(const struct drm_display_mode *mode, struct edid *edid,
> > > -             struct detailed_timing *timing)
> > > +mode_in_range(const struct drm_display_mode *mode,
> > > +             const struct edid *edid,
> > > +             const struct detailed_timing *timing)
> > >  {
> > >         u32 max_clock;
> > > -       u8 *t =3D (u8 *)timing;
> > > +       const u8 *t =3D (const u8 *)timing;
> > >
> > >         if (!mode_in_hsync_range(mode, edid, t))
> > >                 return false;
> > > @@ -2738,8 +2764,9 @@ static bool valid_inferred_mode(const struct
> > > drm_connector *connector,  }
> > >
> > >  static int
> > > -drm_dmt_modes_for_range(struct drm_connector *connector, struct edid
> *edid,
> > > -                       struct detailed_timing *timing)
> > > +drm_dmt_modes_for_range(struct drm_connector *connector,
> > > +                       const struct edid *edid,
> > > +                       const struct detailed_timing *timing)
> > >  {
> > >         int i, modes =3D 0;
> > >         struct drm_display_mode *newmode; @@ -2773,8 +2800,9 @@ void
> > > drm_mode_fixup_1366x768(struct drm_display_mode *mode)  }
> > >
> > >  static int
> > > -drm_gtf_modes_for_range(struct drm_connector *connector, struct edid=
 *edid,
> > > -                       struct detailed_timing *timing)
> > > +drm_gtf_modes_for_range(struct drm_connector *connector,
> > > +                       const struct edid *edid,
> > > +                       const struct detailed_timing *timing)
> > >  {
> > >         int i, modes =3D 0;
> > >         struct drm_display_mode *newmode; @@ -2801,8 +2829,9 @@
> > > drm_gtf_modes_for_range(struct drm_connector *connector, struct edid
> > > *edid,  }
> > >
> > >  static int
> > > -drm_cvt_modes_for_range(struct drm_connector *connector, struct edid=
 *edid,
> > > -                       struct detailed_timing *timing)
> > > +drm_cvt_modes_for_range(struct drm_connector *connector,
> > > +                       const struct edid *edid,
> > > +                       const struct detailed_timing *timing)
> > >  {
> > >         int i, modes =3D 0;
> > >         struct drm_display_mode *newmode; @@ -2830,11 +2859,11 @@
> > > drm_cvt_modes_for_range(struct drm_connector *connector, struct edid
> > > *edid,  }
> > >
> > >  static void
> > > -do_inferred_modes(struct detailed_timing *timing, void *c)
> > > +do_inferred_modes(const struct detailed_timing *timing, void *c)
> > >  {
> > >         struct detailed_mode_closure *closure =3D c;
> > > -       struct detailed_non_pixel *data =3D &timing->data.other_data;
> > > -       struct detailed_data_monitor_range *range =3D &data->data.ran=
ge;
> > > +       const struct detailed_non_pixel *data =3D &timing->data.other=
_data;
> > > +       const struct detailed_data_monitor_range *range =3D
> > > + &data->data.range;
> > >
> > >         if (!is_display_descriptor((const u8 *)timing,
> EDID_DETAIL_MONITOR_RANGE))
> > >                 return;
> > > @@ -2868,7 +2897,8 @@ do_inferred_modes(struct detailed_timing
> > > *timing, void *c)  }
> > >
> > >  static int
> > > -add_inferred_modes(struct drm_connector *connector, struct edid
> > > *edid)
> > > +add_inferred_modes(struct drm_connector *connector,
> > > +                  const struct edid *edid)
> > >  {
> > >         struct detailed_mode_closure closure =3D {
> > >                 .connector =3D connector, @@ -2876,18 +2906,20 @@
> > > add_inferred_modes(struct drm_connector *connector, struct edid *edid)
> > >         };
> > >
> > >         if (version_greater(edid, 1, 0))
> > > -               drm_for_each_detailed_block((u8 *)edid, do_inferred_m=
odes,
> > > +               drm_for_each_detailed_block((const u8 *)edid,
> > > +                                           do_inferred_modes,
> > >                                             &closure);
> > >
> > >         return closure.modes;
> > >  }
> > >
> > >  static int
> > > -drm_est3_modes(struct drm_connector *connector, struct
> > > detailed_timing *timing)
> > > +drm_est3_modes(struct drm_connector *connector,
> > > +              const struct detailed_timing *timing)
> > >  {
> > >         int i, j, m, modes =3D 0;
> > >         struct drm_display_mode *mode;
> > > -       u8 *est =3D ((u8 *)timing) + 6;
> > > +       const u8 *est =3D ((const u8 *)timing) + 6;
> > >
> > >         for (i =3D 0; i < 6; i++) {
> > >                 for (j =3D 7; j >=3D 0; j--) { @@ -2912,7 +2944,7 @@
> > > drm_est3_modes(struct drm_connector *connector, struct
> > > detailed_timing *timing)  }
> > >
> > >  static void
> > > -do_established_modes(struct detailed_timing *timing, void *c)
> > > +do_established_modes(const struct detailed_timing *timing, void *c)
> > >  {
> > >         struct detailed_mode_closure *closure =3D c;
> > >
> > > @@ -2931,7 +2963,8 @@ do_established_modes(struct detailed_timing *ti=
ming,
> void *c)
> > >   * (defined above).  Tease them out and add them to the global modes=
 list.
> > >   */
> > >  static int
> > > -add_established_modes(struct drm_connector *connector, struct edid
> > > *edid)
> > > +add_established_modes(struct drm_connector *connector,
> > > +                     const struct edid *edid)
> > >  {
> > >         struct drm_device *dev =3D connector->dev;
> > >         unsigned long est_bits =3D edid->established_timings.t1 | @@
> > > -2962,19 +2995,19 @@ add_established_modes(struct drm_connector
> > > *connector, struct edid *edid)  }
> > >
> > >  static void
> > > -do_standard_modes(struct detailed_timing *timing, void *c)
> > > +do_standard_modes(const struct detailed_timing *timing, void *c)
> > >  {
> > >         struct detailed_mode_closure *closure =3D c;
> > > -       struct detailed_non_pixel *data =3D &timing->data.other_data;
> > > +       const struct detailed_non_pixel *data =3D
> > > + &timing->data.other_data;
> > >         struct drm_connector *connector =3D closure->connector;
> > > -       struct edid *edid =3D closure->edid;
> > > +       const struct edid *edid =3D closure->edid;
> > >         int i;
> > >
> > >         if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_ST=
D_MODES))
> > >                 return;
> > >
> > >         for (i =3D 0; i < 6; i++) {
> > > -               struct std_timing *std =3D &data->data.timings[i];
> > > +               const struct std_timing *std =3D
> > > + &data->data.timings[i];
> > >                 struct drm_display_mode *newmode;
> > >
> > >                 newmode =3D drm_mode_std(connector, edid, std); @@
> > > -2994,7 +3027,8 @@ do_standard_modes(struct detailed_timing *timing, =
void
> *c)
> > >   * GTF or CVT. Grab them from @edid and add them to the list.
> > >   */
> > >  static int
> > > -add_standard_modes(struct drm_connector *connector, struct edid
> > > *edid)
> > > +add_standard_modes(struct drm_connector *connector,
> > > +                  const struct edid *edid)
> > >  {
> > >         int i, modes =3D 0;
> > >         struct detailed_mode_closure closure =3D { @@ -3023,18
> > > +3057,18 @@ add_standard_modes(struct drm_connector *connector,
> > > struct edid *edid)  }
> > >
> > >  static int drm_cvt_modes(struct drm_connector *connector,
> > > -                        struct detailed_timing *timing)
> > > +                        const struct detailed_timing *timing)
> > >  {
> > >         int i, j, modes =3D 0;
> > >         struct drm_display_mode *newmode;
> > >         struct drm_device *dev =3D connector->dev;
> > > -       struct cvt_timing *cvt;
> > >         const int rates[] =3D { 60, 85, 75, 60, 50 };
> > >         const u8 empty[3] =3D { 0, 0, 0 };
> > >
> > >         for (i =3D 0; i < 4; i++) {
> > >                 int uninitialized_var(width), height;
> > > -               cvt =3D &(timing->data.other_data.data.cvt[i]);
> > > +               const struct cvt_timing *cvt =3D
> > > +                       &timing->data.other_data.data.cvt[i];
> > >
> > >                 if (!memcmp(cvt->code, empty, 3))
> > >                         continue;
> > > @@ -3072,7 +3106,7 @@ static int drm_cvt_modes(struct drm_connector
> > > *connector,  }
> > >
> > >  static void
> > > -do_cvt_mode(struct detailed_timing *timing, void *c)
> > > +do_cvt_mode(const struct detailed_timing *timing, void *c)
> > >  {
> > >         struct detailed_mode_closure *closure =3D c;
> > >
> > > @@ -3083,7 +3117,8 @@ do_cvt_mode(struct detailed_timing *timing,
> > > void *c)  }
> > >
> > >  static int
> > > -add_cvt_modes(struct drm_connector *connector, struct edid *edid)
> > > +add_cvt_modes(struct drm_connector *connector,
> > > +             const struct edid *edid)
> > >  {
> > >         struct detailed_mode_closure closure =3D {
> > >                 .connector =3D connector, @@ -3101,7 +3136,7 @@
> > > add_cvt_modes(struct drm_connector *connector, struct edid *edid)
> > > static void fixup_detailed_cea_mode_clock(struct drm_display_mode
> > > *mode);
> > >
> > >  static void
> > > -do_detailed_mode(struct detailed_timing *timing, void *c)
> > > +do_detailed_mode(const struct detailed_timing *timing, void *c)
> > >  {
> > >         struct detailed_mode_closure *closure =3D c;
> > >         struct drm_display_mode *newmode; @@ -3137,8 +3172,8 @@
> > > do_detailed_mode(struct detailed_timing *timing, void *c)
> > >   * @quirks: quirks to apply
> > >   */
> > >  static int
> > > -add_detailed_modes(struct drm_connector *connector, struct edid *edi=
d,
> > > -                  u32 quirks)
> > > +add_detailed_modes(struct drm_connector *connector,
> > > +                  struct edid *edid, u32 quirks)
> > >  {
> > >         struct detailed_mode_closure closure =3D {
> > >                 .connector =3D connector, @@ -3173,9 +3208,10 @@
> > > add_detailed_modes(struct drm_connector *connector, struct edid
> > > *edid,
> > >  /*
> > >   * Search EDID for CEA extension block.
> > >   */
> > > -static u8 *drm_find_edid_extension(const struct edid *edid, int
> > > ext_id)
> > > +static const u8 *drm_find_edid_extension(const struct edid *edid,
> > > +                                        int ext_id)
> > >  {
> > > -       u8 *edid_ext =3D NULL;
> > > +       const u8 *edid_ext =3D NULL;
> > >         int i;
> > >
> > >         /* No EDID or EDID extensions */ @@ -3184,7 +3220,7 @@
> > > static u8 *drm_find_edid_extension(const struct edid *edid, int
> > > ext_id)
> > >
> > >         /* Find CEA extension */
> > >         for (i =3D 0; i < edid->extensions; i++) {
> > > -               edid_ext =3D (u8 *)edid + EDID_LENGTH * (i + 1);
> > > +               edid_ext =3D (const u8 *)edid + EDID_LENGTH * (i + 1);
> > >                 if (edid_ext[0] =3D=3D ext_id)
> > >                         break;
> > >         }
> > > @@ -3196,19 +3232,19 @@ static u8 *drm_find_edid_extension(const
> > > struct edid *edid, int ext_id)  }
> > >
> > >
> > > -static u8 *drm_find_displayid_extension(const struct edid *edid)
> > > +static const u8 *drm_find_displayid_extension(const struct edid
> > > +*edid)
> > >  {
> > >         return drm_find_edid_extension(edid, DISPLAYID_EXT);  }
> > >
> > > -static u8 *drm_find_cea_extension(const struct edid *edid)
> > > +static const u8 *drm_find_cea_extension(const struct edid *edid)
> > >  {
> > >         int ret;
> > >         int idx =3D 1;
> > >         int length =3D EDID_LENGTH;
> > > -       struct displayid_block *block;
> > > -       u8 *cea;
> > > -       u8 *displayid;
> > > +       const struct displayid_block *block;
> > > +       const u8 *cea;
> > > +       const u8 *displayid;
> > >
> > >         /* Look for a top level CEA extension block */
> > >         cea =3D drm_find_edid_extension(edid, CEA_EXT); @@ -4315,28
> > > +4351,30 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector
> > > *connector, const u8 *db)  }
> > >
> > >  static void
> > > -monitor_name(struct detailed_timing *t, void *data)
> > > +monitor_name(const struct detailed_timing *t, void *c)
> > >  {
> > > +       struct data_closure *closure =3D c;
> > > +
> > >         if (!is_display_descriptor((const u8 *)t, EDID_DETAIL_MONITOR=
_NAME))
> > >                 return;
> > >
> > > -       *(u8 **)data =3D t->data.other_data.data.str.str;
> > > +       closure->data =3D t->data.other_data.data.str.str;
> > >  }
> > >
> > >  static int get_monitor_name(struct edid *edid, char name[13])  {
> > > -       char *edid_name =3D NULL;
> > > +       struct data_closure closure =3D {};
> > >         int mnl;
> > >
> > >         if (!edid || !name)
> > >                 return 0;
> > >
> > > -       drm_for_each_detailed_block((u8 *)edid, monitor_name, &edid_n=
ame);
> > > -       for (mnl =3D 0; edid_name && mnl < 13; mnl++) {
> > > -               if (edid_name[mnl] =3D=3D 0x0a)
> > > +       drm_for_each_detailed_block((const u8 *)edid, monitor_name, &=
closure);
> > > +       for (mnl =3D 0; closure.data && mnl < 13; mnl++) {
> > > +               if (closure.data[mnl] =3D=3D 0x0a)
> > >                         break;
> > >
> > > -               name[mnl] =3D edid_name[mnl];
> > > +               name[mnl] =3D closure.data[mnl];
> > >         }
> > >
> > >         return mnl;
> > > @@ -4386,11 +4424,9 @@ static void clear_eld(struct drm_connector
> > > *connector)  static void drm_edid_to_eld(struct drm_connector
> > > *connector, struct edid *edid)  {
> > >         uint8_t *eld =3D connector->eld;
> > > -       u8 *cea;
> > > -       u8 *db;
> > > +       const u8 *cea;
> > >         int total_sad_count =3D 0;
> > >         int mnl;
> > > -       int dbl;
> > >
> > >         clear_eld(connector);
> > >
> > > @@ -4425,8 +4461,8 @@ static void drm_edid_to_eld(struct drm_connector
> *connector, struct edid *edid)
> > >                 }
> > >
> > >                 for_each_cea_db(cea, i, start, end) {
> > > -                       db =3D &cea[i];
> > > -                       dbl =3D cea_db_payload_len(db);
> > > +                       const u8 *db =3D &cea[i];
> > > +                       int dbl =3D cea_db_payload_len(db);
> > >
> > >                         switch (cea_db_tag(db)) {
> > >                                 int sad_count; @@ -4484,7 +4520,7 @@
> > > int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)  {
> > >         int count =3D 0;
> > >         int i, start, end, dbl;
> > > -       u8 *cea;
> > > +       const u8 *cea;
> > >
> > >         cea =3D drm_find_cea_extension(edid);
> > >         if (!cea) {
> > > @@ -4503,7 +4539,7 @@ int drm_edid_to_sad(struct edid *edid, struct c=
ea_sad
> **sads)
> > >         }
> > >
> > >         for_each_cea_db(cea, i, start, end) {
> > > -               u8 *db =3D &cea[i];
> > > +               const u8 *db =3D &cea[i];
> > >
> > >                 if (cea_db_tag(db) =3D=3D AUDIO_BLOCK) {
> > >                         int j;
> > > @@ -4514,7 +4550,7 @@ int drm_edid_to_sad(struct edid *edid, struct c=
ea_sad
> **sads)
> > >                         if (!*sads)
> > >                                 return -ENOMEM;
> > >                         for (j =3D 0; j < count; j++) {
> > > -                               u8 *sad =3D &db[1 + j * 3];
> > > +                               const u8 *sad =3D &db[1 + j * 3];
> > >
> > >                                 (*sads)[j].format =3D (sad[0] & 0x78)=
 >> 3;
> > >                                 (*sads)[j].channels =3D sad[0] & 0x7;
> > > @@ -4635,7 +4671,7 @@ EXPORT_SYMBOL(drm_av_sync_delay);
> > >   */
> > >  bool drm_detect_hdmi_monitor(struct edid *edid)  {
> > > -       u8 *edid_ext;
> > > +       const u8 *edid_ext;
> > >         int i;
> > >         int start_offset, end_offset;
> > >
> > > @@ -4673,7 +4709,7 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
> > >   */
> > >  bool drm_detect_monitor_audio(struct edid *edid)  {
> > > -       u8 *edid_ext;
> > > +       const u8 *edid_ext;
> > >         int i, j;
> > >         bool has_audio =3D false;
> > >         int start_offset, end_offset; @@ -5017,13 +5053,13 @@ u32
> > > drm_add_display_info(struct drm_connector *connector, const struct ed=
id *edi
> > >         return quirks;
> > >  }
> > >
> > > -static int validate_displayid(u8 *displayid, int length, int idx)
> > > +static int validate_displayid(const u8 *displayid, int length, int
> > > +idx)
> > >  {
> > >         int i;
> > >         u8 csum =3D 0;
> > > -       struct displayid_hdr *base;
> > > +       const struct displayid_hdr *base;
> > >
> > > -       base =3D (struct displayid_hdr *)&displayid[idx];
> > > +       base =3D (const struct displayid_hdr *)&displayid[idx];
> > >
> > >         DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
> > >                       base->rev, base->bytes, base->prod_id,
> > > base->ext_count); @@ -5041,7 +5077,7 @@ static int
> > > validate_displayid(u8 *displayid, int length, int idx)  }
> > >
> > >  static struct drm_display_mode *drm_mode_displayid_detailed(struct
> drm_device *dev,
> > > -                                                           struct di=
splayid_detailed_timings_1 *timings)
> > > +                                                           const
> > > + struct displayid_detailed_timings_1 *timings)
> > >  {
> > >         struct drm_display_mode *mode;
> > >         unsigned pixel_clock =3D (timings->pixel_clock[0] | @@ -5057,6
> > > +5093,7 @@ static struct drm_display_mode
> *drm_mode_displayid_detailed(struct drm_device *d
> > >         unsigned vsync_width =3D (timings->vsw[0] | timings->vsw[1] <=
< 8) + 1;
> > >         bool hsync_positive =3D (timings->hsync[1] >> 7) & 0x1;
> > >         bool vsync_positive =3D (timings->vsync[1] >> 7) & 0x1;
> > > +
> > >         mode =3D drm_mode_create(dev);
> > >         if (!mode)
> > >                 return NULL;
> > > @@ -5086,9 +5123,10 @@ static struct drm_display_mode
> > > *drm_mode_displayid_detailed(struct drm_device *d  }
> > >
> > >  static int add_displayid_detailed_1_modes(struct drm_connector *conn=
ector,
> > > -                                         struct displayid_block *blo=
ck)
> > > +                                         const struct
> > > + displayid_block *block)
> > >  {
> > > -       struct displayid_detailed_timing_block *det =3D (struct
> displayid_detailed_timing_block *)block;
> > > +       const struct displayid_detailed_timing_block *det =3D
> > > +               (const struct displayid_detailed_timing_block
> > > + *)block;
> > >         int i;
> > >         int num_timings;
> > >         struct drm_display_mode *newmode; @@ -5099,7 +5137,7 @@
> > > static int add_displayid_detailed_1_modes(struct drm_connector
> > > *connector,
> > >
> > >         num_timings =3D block->num_bytes / 20;
> > >         for (i =3D 0; i < num_timings; i++) {
> > > -               struct displayid_detailed_timings_1 *timings =3D &det=
->timings[i];
> > > +               const struct displayid_detailed_timings_1 *timings =
=3D
> > > + &det->timings[i];
> > >
> > >                 newmode =3D drm_mode_displayid_detailed(connector->de=
v, timings);
> > >                 if (!newmode)
> > > @@ -5112,13 +5150,13 @@ static int
> > > add_displayid_detailed_1_modes(struct drm_connector *connector,  }
> > >
> > >  static int add_displayid_detailed_modes(struct drm_connector *connec=
tor,
> > > -                                       struct edid *edid)
> > > +                                       const struct edid *edid)
> > >  {
> > > -       u8 *displayid;
> > > +       const u8 *displayid;
> > >         int ret;
> > >         int idx =3D 1;
> > >         int length =3D EDID_LENGTH;
> > > -       struct displayid_block *block;
> > > +       const struct displayid_block *block;
> > >         int num_modes =3D 0;
> > >
> > >         displayid =3D drm_find_displayid_extension(edid);
> > > @@ -5720,9 +5758,10 @@
> > > drm_hdmi_vendor_infoframe_from_display_mode(struct
> > > hdmi_vendor_infoframe *frame,
> > > EXPORT_SYMBOL(drm_hdmi_vendor_infoframe_from_display_mode);
> > >
> > >  static int drm_parse_tiled_block(struct drm_connector *connector,
> > > -                                struct displayid_block *block)
> > > +                                const struct displayid_block
> > > + *block)
> > >  {
> > > -       struct displayid_tiled_block *tile =3D (struct displayid_tile=
d_block *)block;
> > > +       const struct displayid_tiled_block *tile =3D
> > > +               (const struct displayid_tiled_block *)block;
> > >         u16 w, h;
> > >         u8 tile_v_loc, tile_h_loc;
> > >         u8 num_v_tile, num_h_tile;
> > > @@ -5774,12 +5813,12 @@ static int drm_parse_tiled_block(struct
> > > drm_connector *connector,  }
> > >
> > >  static int drm_parse_display_id(struct drm_connector *connector,
> > > -                               u8 *displayid, int length,
> > > +                               const u8 *displayid, int length,
> > >                                 bool is_edid_extension)  {
> > >         /* if this is an EDID extension the first byte will be 0x70 */
> > >         int idx =3D 0;
> > > -       struct displayid_block *block;
> > > +       const struct displayid_block *block;
> > >         int ret;
> > >
> > >         if (is_edid_extension)
> > > @@ -5815,11 +5854,13 @@ static int drm_parse_display_id(struct
> > > drm_connector *connector,  }
> > >
> > >  static void drm_get_displayid(struct drm_connector *connector,
> > > -                             struct edid *edid)
> > > +                             const struct edid *edid)
> > >  {
> > > -       void *displayid =3D NULL;
> > > +       const void *displayid;
> > >         int ret;
> > > +
> > >         connector->has_tile =3D false;
> > > +
> > >         displayid =3D drm_find_displayid_extension(edid);
> > >         if (!displayid) {
> > >                 /* drop reference to any tile group we had */ diff
> > > --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 2113500b4075..c0f9ce3f4b24 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -1580,9 +1580,9 @@ struct drm_tile_group {  };
> > >
> > >  struct drm_tile_group *drm_mode_create_tile_group(struct drm_device =
*dev,
> > > -                                                 char topology[8]);
> > > +                                                 const u8
> > > + topology[8]);
> > >  struct drm_tile_group *drm_mode_get_tile_group(struct drm_device *de=
v,
> > > -                                              char topology[8]);
> > > +                                              const u8
> > > + topology[8]);
> > >  void drm_mode_put_tile_group(struct drm_device *dev,
> > >                              struct drm_tile_group *tg);
> > >
> > > --
> > > 2.24.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> --
> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
