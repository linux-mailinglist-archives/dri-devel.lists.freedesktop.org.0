Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83621636E9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 15:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F9A89CAF;
	Tue,  9 Jul 2019 13:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0972389CAF;
 Tue,  9 Jul 2019 13:26:45 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id p17so19597519ljg.1;
 Tue, 09 Jul 2019 06:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=E3i2aCwQ36MVr/I5AlOzMy2Jo9FpPt//+Zt9nWE32kI=;
 b=MkyX1+j7JHzXc8M3jxxRC8XqnA6qr5kK9oB3/yUysf11t/NTse1XapD9ZfirTPxHRy
 vifMhuYZn99mE90EKJ9RuTHq1lBy5TspED1UElG89MoVbzq1kytfLCQJIxis4w8jk55s
 MbYMVjKjc5yi+RKP6L/S51ljPd+pgpH+opnYk8k/pUJyfBKTA9vzFk7hED0lec9jU1NS
 qoOq0+v0mJZUsVZMnpBgSKSy7e67WNne1bAv09Pt+jwnkbD316xddvSvASFbsvIC9BZB
 +JrBUO5MlMQPkCXzliMUUZ3H6qZU5YSttD+kaMMGA4fWV1dkoDHhfNqZZJ0LOS2lRGR2
 5oag==
X-Gm-Message-State: APjAAAXJA7o52aCiCT0v6CoUCXpKDeHSUC5GSNEi5clZRUcvIecOA9VM
 xBwdUcpEfBW+LCc6nVbyGBY=
X-Google-Smtp-Source: APXvYqye1M0gbrNpLulgI9QS009y1bbW9QRJt6g9JcsHz29ZRmMSWJtQL/Snrp8CbQOpDlwVJCOG+A==
X-Received: by 2002:a2e:8801:: with SMTP id x1mr4687718ljh.1.1562678804214;
 Tue, 09 Jul 2019 06:26:44 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w1sm3334339lfe.50.2019.07.09.06.26.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 06:26:43 -0700 (PDT)
Date: Tue, 9 Jul 2019 16:26:31 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v8 1/6] drm: Add Content protection type property
Message-ID: <20190709162631.42bdcb06@eldfell.localdomain>
In-Reply-To: <20190708091229.GA31930@intel.com>
References: <20190705004642.15822-1-ramalingam.c@intel.com>
 <20190705004642.15822-2-ramalingam.c@intel.com>
 <20190708125217.6bc8dc27@eldfell.localdomain>
 <20190708125959.3f35c23e@eldfell.localdomain>
 <20190708091229.GA31930@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=E3i2aCwQ36MVr/I5AlOzMy2Jo9FpPt//+Zt9nWE32kI=;
 b=AMu1bUWURANvTIgvYVwNvq/Jg9w4+k4xem3lkl8b5RXjtBTfYnOqSVIvIQuf0oZiyJ
 emJFaRbHoEgZ9OVctq/Ph3yni1YTEKAm6jrAaGa+yFsA3Sx21rH7Q0yXO4rScrFRHB+T
 vdLapmoqKS9DMoC90trKYBROWyYSVyMWtMfysOmo/fACe/hWyvNqnpji2KQnCJ4dkDml
 V3FGjIrFrUh6qSNlcW76estcSlfYEOIPPrPUQ3nO7IShAMmdKX6caTtDOvIcMae7mD1b
 SbFAXiNnwZIkI/Yc4KRmhlR5b+mppguuJSGBgaxx3I1nJbXrSVmy+UGe5YCvvHwa++hE
 cyeA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0204858795=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0204858795==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//b6RABxmdrvfIriaOtHTDBG"; protocol="application/pgp-signature"

--Sig_//b6RABxmdrvfIriaOtHTDBG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Jul 2019 14:42:29 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> On 2019-07-08 at 12:59:59 +0300, Pekka Paalanen wrote:
> > On Mon, 8 Jul 2019 12:52:17 +0300
> > Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >  =20
> > > On Fri,  5 Jul 2019 06:16:37 +0530
> > > Ramalingam C <ramalingam.c@intel.com> wrote:
> > >  =20
> > > > This patch adds a DRM ENUM property to the selected connectors.
> > > > This property is used for mentioning the protected content's type
> > > > from userspace to kernel HDCP authentication.
> > > >=20
> > > > Type of the stream is decided by the protected content providers.
> > > > Type 0 content can be rendered on any HDCP protected display wires.
> > > > But Type 1 content can be rendered only on HDCP2.2 protected paths.
> > > >=20
> > > > So when a userspace sets this property to Type 1 and starts the HDCP
> > > > enable, kernel will honour it only if HDCP2.2 authentication is thr=
ough
> > > > for type 1. Else HDCP enable will be failed.
> > > >=20
> > > > Need ACK for this new conenctor property from userspace consumer.
> > > >=20
> > > > v2:
> > > >   cp_content_type is replaced with content_protection_type [daniel]
> > > >   check at atomic_set_property is removed [Maarten]
> > > > v3:
> > > >   %s/content_protection_type/hdcp_content_type [Pekka]
> > > > v4:
> > > >   property is created for the first requested connector and then re=
used.
> > > > 	[Danvet]
> > > > v5:
> > > >   kernel doc nits addressed [Daniel]
> > > >   Rebased as part of patch reordering.
> > > > v6:
> > > >   Kernel docs are modified [pekka]
> > > >=20
> > > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > ---
> > > >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
> > > >  drivers/gpu/drm/drm_connector.c           | 22 ++++++++++++++
> > > >  drivers/gpu/drm/drm_hdcp.c                | 36 +++++++++++++++++++=
+++-
> > > >  drivers/gpu/drm/i915/display/intel_hdcp.c |  4 ++-
> > > >  include/drm/drm_connector.h               |  7 +++++
> > > >  include/drm/drm_hdcp.h                    |  2 +-
> > > >  include/drm/drm_mode_config.h             |  6 ++++
> > > >  include/uapi/drm/drm_mode.h               |  4 +++
> > > >  8 files changed, 82 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/dr=
m_atomic_uapi.c
> > > > index abe38bdf85ae..19ae119f1a5d 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > @@ -747,6 +747,8 @@ static int drm_atomic_connector_set_property(st=
ruct drm_connector *connector,
> > > >  			return -EINVAL;
> > > >  		}
> > > >  		state->content_protection =3D val;
> > > > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > > > +		state->hdcp_content_type =3D val;
> > > >  	} else if (property =3D=3D connector->colorspace_property) {
> > > >  		state->colorspace =3D val;
> > > >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > > > @@ -831,6 +833,8 @@ drm_atomic_connector_get_property(struct drm_co=
nnector *connector,
> > > >  			state->hdr_output_metadata->base.id : 0;
> > > >  	} else if (property =3D=3D config->content_protection_property) {
> > > >  		*val =3D state->content_protection;
> > > > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > > > +		*val =3D state->hdcp_content_type;
> > > >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > > >  		/* Writeback framebuffer is one-shot, write and forget */
> > > >  		*val =3D 0;
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_=
connector.c
> > > > index 068d4b05f1be..17aef88c03a6 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -951,6 +951,28 @@ static const struct drm_prop_enum_list hdmi_co=
lorspaces[] =3D {
> > > >   *	  the value transitions from ENABLED to DESIRED. This signifies=
 the link
> > > >   *	  is no longer protected and userspace should take appropriate =
action
> > > >   *	  (whatever that might be).
> > > > + * HDCP Content Type:
> > > > + *	This property is used by the userspace to configure the kernel =
with
> > > > + *	to be displayed stream's content type. Content Type of a stream=
 is
> > > > + *	decided by the owner of the stream, as "HDCP Type0" or "HDCP Ty=
pe1".
> > > > + *
> > > > + *	The value of the property can be one the below:
> > > > + *	  - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
> > > > + *		HDCP Type0 streams can be transmitted on a link which is
> > > > + *		encrypted with HDCP 1.4 or higher versions of HDCP(i.e HDCP2.2
> > > > + *		and more).
> > > > + *	  - "HDCP Type1": DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
> > > > + *		HDCP Type1 streams can be transmitted on a link which is
> > > > + *		encrypted only with HDCP 2.2. In future higher versions also
> > > > + *		might support Type1 based on their spec.
> > > > + *
> > > > + *	Note that the HDCP Content Type property is introduced at HDCP =
2.2, and
> > > > + *	defaults to type 0. It is only exposed by drivers supporting HD=
CP 2.2.
> > > > + *	Based on how next versions of HDCP specs are defined content Ty=
pe could
> > > > + *	be used for higher versions too.
> > > > + *	If content type is changed when content_protection is not UNDES=
IRED,
> > > > + *	then kernel will disable the HDCP and re-enable with new type i=
n the
> > > > + *	same atomic commit   =20
> > >=20
> > > Hi,
> > >=20
> > > I think this doc covers all my previous comments on this patch now. O=
ne
> > > more thing, the wording here reads as:
> > > - userspace configures the content type
> > > - the kernel transmits the content if the link satisfies the type
> > >   requirement
> > > - if the link does not satisfy the type requirement, the kernel will
> > >   not transmit the content
> > >=20
> > > This is of course false, the kernel transmits anyway, but that is how
> > > the text reads from the "stream's content type" and "can be transmitt=
ed
> > > on". The problem is, that a userspace developer will think the stream
> > > is what he pushes into KMS, not what goes on the wire. The text also
> > > magnifies that misconception because it sounds like the stream is
> > > something different from the link. Actually, I don't understand what
> > > "the stream" is supposed to be here. =20
> Stream is nothing but the any display content that needs the hdcp
> protection.
> > >=20
> > > Instead, I think you should explain how the content type property
> > > guides the kernel driver's attempts in negotiating the link encryption
> > > and how that then reflects in the content protection property (DESIRED
> > > vs. ENABLED). It might be best to not say anything about any "stream"=
. =20
>=20
> I will explain in different and more words, so that this questions wont
> raise.
> >=20
> > Btw. this UAPI has the following fundamental flaws:
> >=20
> > - userspace cannot know which encryption is used on the link =20
> This claim is not true.
>=20
> "HDCP content type" and "content protection" are used
> together in
> 	requesting the HDCP state
> 	confirming that required state is achieved
> For ex:
> The state "HDCP content type" =3D "HDCP Type1" and "content protection" =
=3D
> "DESIRED" stands for userspace has requested for HDCP Type 1 protection
> from kernel.
>=20
> When kernel changes the "content protection" to "ENABLED" when "HDCP
> content type" is "HDCP Type1", kernel indicates the userspace that HDCP
> authentication for Type 1 is successful.
>=20
> I am not sure why do you think that userspace is not knowing link's
> authentication state w.r.t type.

Hi,

if userspace asks for Type0, the kernel is free to use Type1 instead
and switch "Content Protection" to "ENABLED". Userspace has no way of
knowing that the link actually runs with Type1.

You can argue that it does not matter, because Type1 protection is
stronger than Type0, so everybody should be happy, but that does not
change the fact that userspace thinks wrong of what the protection
really is.

> > - userspace cannot force Type0 if the driver succeeds enabling Type1 =20
> When you set Type 0, kernel will authenticate the link for Type 0 only.

Really? Sorry, I have completely missed this. Please make it clear in
UAPI and kAPI docs. This invalidates my comment above as well.

But you are also conflicting with your own doc, which said:

+ *	  - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
+ *		HDCP Type0 streams can be transmitted on a link which is
+ *		encrypted with HDCP 1.4 or higher versions of HDCP(i.e HDCP2.2
+ *		and more).

To me that reads as: if userspace asks for Type0, the kernel is free to
use Type0 or Type1 or anything stronger to say it succeeded.

Hence my confusion.

> Not for Type 1. I guess you are trying to say HDCP1.4 is not possible
> over HDCP2.2.

I wouldn't know what that means.

> I dont see any reason why anyone want this except for testing.
>=20
> Type 0 can be achieved through HDCP2.2 and HDCP1.4. And HDCP2.2 is attemp=
ted
> first and HDCP1.4 will be attempted only if HDCP2.2 is failed for some
> reasons. This is done because HDCP2.2 is preferred over 1.4 due to its
> better crypto algo.=20

I'm running with the assumption that:
- Type0 =3D=3D HDCP 1.4
- Type1 =3D=3D HDCP 2.2
and I have no idea why you are sometimes talking about Type and
sometimes about HDCP version.

Is there any reason to actually talk about HDCP versions at all in the
UAPI doc? I'm starting to suspect that my assumptions are not right,
and the use of dual-terminology in the UAPI doc confuses me.

> Thanks for pointing it out. There is a scope to add all these
> information in the documentation. Which I will do it in the next version
> today.

Awesome, let's see.


Thanks,
pq

--Sig_//b6RABxmdrvfIriaOtHTDBG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0klggACgkQI1/ltBGq
qqfZ0A//WKrCVJxqkuovzsI2fx+NKDFzK56luPa7EIAisapagclUbnAs1jSUqmEG
dm2oY6nvz+/IBfVwzEOr8V6+gww5C9FP7+fv3k7qjK4FW6m8CkT7IlXI7Bqx+nJ6
+W2Mu6DwTaf70gvkng3zxPA8PCvr0UqsB7u8tbj3WX5k6uHdwOfyDkSLTHL0d6Lr
0GP/rsygSqsV77VBrQNxhtd1juF86N9s8+IMu7rFlR/U01KezUm/mO8B/SkP4HnO
8obl6GCtffB2hPg0PvH68+KkMj5ys0l9OCEKSNEx75P9JF6T3fR5bMOC60xSLDL6
VIRidF0D0NefOrUqx8hiyTRA5vUc6VQnU/P9r0k8a/PUTXdMxrdbk1rSYaLT6Ec6
nMO6IReMUlNUm/0iJLNZee3EOoiekGVtjRpoa+re/Vjvst9LQzsCQE/rRVhBP++H
vPYPmY+Wgqz718LUi22r+eMl6sOetOJCuIb+v4LlLOCFZYa0h4xcBQVnYMojbGIv
Z1B9f0K+HuqG9v1tMoWStCX/Jw13IUKxHDkPLEGFRpiNf59IBGJy54GQRiuTkeUo
evVzINcTvp4amQ/0rVNWlysqy0UwKoPWOF5bDY/ZElW/CfqttJhsl06pRBGxojpt
ADp9b+CN1bDapyGhTXkN/0HdFBigwiKheuUge4j887tWOZV5RzE=
=7Vjq
-----END PGP SIGNATURE-----

--Sig_//b6RABxmdrvfIriaOtHTDBG--

--===============0204858795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0204858795==--
