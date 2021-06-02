Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54A399448
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3276E0CC;
	Wed,  2 Jun 2021 20:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A146E0CC;
 Wed,  2 Jun 2021 20:08:53 +0000 (UTC)
IronPort-SDR: 9flLxt0Hs/tD5COcCaJGSb2XWths45TGTQpiBmwUex4NLVrcqkCY9x8U2w+wJykEmQg00+nCCU
 5SITQwNSUSDg==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="184252888"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="184252888"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 13:08:53 -0700
IronPort-SDR: 5QC3Z/kp1H75cPcFYOtySyRL6VUn/zONtJZozxe8j/Qc17SJ99F/O/hK+qASaavm2m9G8jxamh
 BNr4Qe5TS7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="400171499"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 02 Jun 2021 13:08:53 -0700
Received: from bgsmsx603.gar.corp.intel.com (10.109.78.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 2 Jun 2021 13:08:52 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX603.gar.corp.intel.com (10.109.78.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 3 Jun 2021 01:38:50 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.008;
 Thu, 3 Jun 2021 01:38:50 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: RE: [PATCH 5/9] drm: Add Client Cap for advance gamma mode
Thread-Topic: [PATCH 5/9] drm: Add Client Cap for advance gamma mode
Thread-Index: AQHXVs21LcwFW5MFE0CqXw2b4Q+s5asAEn4AgAEVilA=
Date: Wed, 2 Jun 2021 20:08:49 +0000
Message-ID: <bddfc43f3a124868ac87187d1216b55b@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
 <20210601104135.29020-6-uma.shankar@intel.com>
 <20210602120328.6ad60a2e@eldfell>
In-Reply-To: <20210602120328.6ad60a2e@eldfell>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem, 
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Pekka Paalanen <ppaalanen@gmail.com>
> Sent: Wednesday, June 2, 2021 2:33 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Mod=
em,
> Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: Re: [PATCH 5/9] drm: Add Client Cap for advance gamma mode
>=20
> On Tue,  1 Jun 2021 16:11:31 +0530
> Uma Shankar <uma.shankar@intel.com> wrote:
>=20
> > Introduced a client cap for advance cap mode capability. Userspace
>=20
> Typo: "cap mode" should be "gamma mode"?

Yeah, will fix this.

> > should set this to get to be able to use the new gamma_mode property.
> >
> > If this is not set, driver will work in legacy mode.
> >
> > Note: This is suggested by Ville and based on his idea, the new gamma
> > mode handling is designed.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c | 3 +++
> >  drivers/gpu/drm/drm_ioctl.c       | 5 +++++
> >  include/drm/drm_atomic.h          | 1 +
> >  include/drm/drm_crtc.h            | 8 ++++++++
> >  include/drm/drm_file.h            | 8 ++++++++
> >  include/uapi/drm/drm.h            | 8 ++++++++
> >  6 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index a5470a0ebbe6..7ee35bc14455 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -1036,6 +1036,8 @@ int drm_atomic_set_property(struct drm_atomic_sta=
te
> *state,
> >  			break;
> >  		}
> >
> > +		crtc_state->advance_gamma_mode_active =3D
> > +					state->advance_gamma_mode_active;
> >  		ret =3D drm_atomic_crtc_set_property(crtc,
> >  				crtc_state, prop, prop_value);
> >  		break;
> > @@ -1372,6 +1374,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
> >  	drm_modeset_acquire_init(&ctx,
> DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
> >  	state->acquire_ctx =3D &ctx;
> >  	state->allow_modeset =3D !!(arg->flags &
> > DRM_MODE_ATOMIC_ALLOW_MODESET);
> > +	state->advance_gamma_mode_active =3D
> > +file_priv->advance_gamma_mode_active;
> >
> >  retry:
> >  	copied_objs =3D 0;
> > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > index 53d314103a37..d51f72213882 100644
> > --- a/drivers/gpu/drm/drm_ioctl.c
> > +++ b/drivers/gpu/drm/drm_ioctl.c
> > @@ -361,6 +361,11 @@ drm_setclientcap(struct drm_device *dev, void *dat=
a,
> struct drm_file *file_priv)
> >  			return -EINVAL;
> >  		file_priv->writeback_connectors =3D req->value;
> >  		break;
> > +	case DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES:
> > +		if (req->value > 1)
> > +			return -EINVAL;
> > +		file_priv->advance_gamma_mode_active =3D req->value;
> > +		break;
> >  	default:
> >  		return -EINVAL;
> >  	}
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h index
> > ac5a28eff2c8..5a398a249c80 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -379,6 +379,7 @@ struct drm_atomic_state {
> >  	 * states.
> >  	 */
> >  	bool duplicated : 1;
> > +	bool advance_gamma_mode_active : 1;
>=20
> "advance" is a verb. Did you mean "advanced"?

Right, will rename it.

>=20
> >  	struct __drm_planes_state *planes;
> >  	struct __drm_crtcs_state *crtcs;
> >  	int num_connector;
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h index
> > 5a594f134a81..f4339fbad086 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -170,6 +170,11 @@ struct drm_crtc_state {
> >  	 */
> >  	bool color_mgmt_changed : 1;
> >
> > +	/**
> > +	 * This is to indicate advance gamma mode support
> > +	 */
> > +	bool advance_gamma_mode_active : 1;
>=20
> Same here.
>=20
> > +
> >  	/**
> >  	 * @no_vblank:
> >  	 *
> > @@ -1036,6 +1041,9 @@ struct drm_crtc {
> >  	 */
> >  	bool enabled;
> >
> > +	/** To handle advance gamma mode support */
> > +	bool advance_gamma_mode_active : 1;
>=20
> Same here.
>=20
> > +
> >  	/**
> >  	 * @mode:
> >  	 *
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h index
> > b81b3bfb08c8..4af3e1a2a158 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -201,6 +201,14 @@ struct drm_file {
> >  	 */
> >  	bool writeback_connectors;
> >
> > +	/**
> > +	 * This is to enable advance gamma modes using
> > +	 * gamma_mode property
> > +	 *
> > +	 * True if client understands advance gamma
> > +	 */
> > +	bool advance_gamma_mode_active : 1;
>=20
> Same here.
>=20
> > +
> >  	/**
> >  	 * @was_master:
> >  	 *
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h index
> > 67b94bc3c885..661efdf0c969 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -816,6 +816,14 @@ struct drm_get_cap {
> >   */
> >  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
> >
> > +/**
> > + * Add support for advance gamma mode UAPI
> > + * If set to 1, DRM will enable advance gamma mode
> > + * UAPI to process the gamma mode based on extended
> > + * range and segments.
> > + */
> > +#define DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES     6
>=20
> Same here.
>=20
> > +
> >  /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */  struct
> > drm_set_client_cap {
> >  	__u64 capability;
>=20
>=20
> Thanks,
> pq
