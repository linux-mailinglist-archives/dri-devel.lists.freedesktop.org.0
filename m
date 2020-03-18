Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E304918A003
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872CC89CC4;
	Wed, 18 Mar 2020 15:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BE689A62;
 Wed, 18 Mar 2020 15:56:32 +0000 (UTC)
IronPort-SDR: lauhFlcTzhTOkNXmd3fhx9MdtbqqF6QaPUClxq4VvG6PaeqjeQ8QAWA5G/LfgCsIRSIsP4XfJb
 CdDvYr7zsOOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 08:56:31 -0700
IronPort-SDR: d4sMqXC+8h/F9/o/nmCYm47VMGE4+GKhBKPxjjfQaZBiRn+TVGcq9O0SXVNMtt0r3P+viZk4Fp
 /aIdB+AWzu9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="324228078"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 18 Mar 2020 08:56:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Mar 2020 17:56:28 +0200
Date: Wed, 18 Mar 2020 17:56:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/9] drm: Constify topology id
Message-ID: <20200318155628.GA13686@intel.com>
References: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
 <20200313162054.16009-2-ville.syrjala@linux.intel.com>
 <CADnq5_OsVawW3RV+8UhSf-wF0eG4Tp-fOMzsuLfJGJj_aPu-HA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_OsVawW3RV+8UhSf-wF0eG4Tp-fOMzsuLfJGJj_aPu-HA@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 13, 2020 at 04:05:00PM -0400, Alex Deucher wrote:
> On Fri, Mar 13, 2020 at 12:21 PM Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> >
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > Make the topology id const since we don't want to change it.
> >
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Series is:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks. Series pushed to drm-misc-next.

> =

> > ---
> >  drivers/gpu/drm/drm_connector.c | 4 ++--
> >  include/drm/drm_connector.h     | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 644f0ad10671..462d8caa6e72 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -2392,7 +2392,7 @@ EXPORT_SYMBOL(drm_mode_put_tile_group);
> >   * tile group or NULL if not found.
> >   */
> >  struct drm_tile_group *drm_mode_get_tile_group(struct drm_device *dev,
> > -                                              char topology[8])
> > +                                              const char topology[8])
> >  {
> >         struct drm_tile_group *tg;
> >         int id;
> > @@ -2422,7 +2422,7 @@ EXPORT_SYMBOL(drm_mode_get_tile_group);
> >   * new tile group or NULL.
> >   */
> >  struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *d=
ev,
> > -                                                 char topology[8])
> > +                                                 const char topology[8=
])
> >  {
> >         struct drm_tile_group *tg;
> >         int ret;
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 19ae6bb5c85b..fd543d1db9b2 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -1617,9 +1617,9 @@ struct drm_tile_group {
> >  };
> >
> >  struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *d=
ev,
> > -                                                 char topology[8]);
> > +                                                 const char topology[8=
]);
> >  struct drm_tile_group *drm_mode_get_tile_group(struct drm_device *dev,
> > -                                              char topology[8]);
> > +                                              const char topology[8]);
> >  void drm_mode_put_tile_group(struct drm_device *dev,
> >                              struct drm_tile_group *tg);
> >
> > --
> > 2.24.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
