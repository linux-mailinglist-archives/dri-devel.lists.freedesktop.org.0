Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25A4750020
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 09:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9266610E49F;
	Wed, 12 Jul 2023 07:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151CE10E49F;
 Wed, 12 Jul 2023 07:35:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so10829343e87.0; 
 Wed, 12 Jul 2023 00:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689147331; x=1691739331;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/PE2l96LFO78ASyoK1rIpXPjUnfUbV0qJEzUZeBNGTE=;
 b=Bx3Ueff9WHXlKvS/70TUr1hwkp9KgqrIJ/VQXFUzEq9WtJpNgByppCFtNqcWpKAm+W
 GVOFUQjPUlazNF8aTjULXG0U1Q56yADKq4tlhQQqPfntdy8qkbOS8qCOyWiH8BUFvk7H
 uQbkpBOEpbvjcUuRi/KCCAoaf8x1klSRh/KFkN3pnV0Nii/y9rU7Wv8fLAt1ll8FY8Rp
 YnkzVcYkJej49Xe7MoODZaSLL8T00AmdP5g8LbZPt0Vjna76FCYVG0vbG6k75fET3I3p
 aV2hDbNDywu0oWjqXD/NbzNEiDowiuqIccux1+7I4x2CX41e27mZh0CdV4SKdeLF8nLC
 +fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689147331; x=1691739331;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/PE2l96LFO78ASyoK1rIpXPjUnfUbV0qJEzUZeBNGTE=;
 b=GpC+vLCvKOnr9PmhpY1xIPxR7tiNKrImGkbMUKrD7olXOY/bjIK6C3m7xiqrsakIU/
 SNh0sonQc1Sg1RMpuo8dCdDEL2WcHCZ0vRtvTMvKQJ8GV7JrNpGvdSMdv5qi/kepQV3y
 6QRAYZ5hIyplPHwICTV0SBRnoO+ik3AGwIwA/PiBPnz04//pLgqN95dmIvIHvUV3xNNI
 Z4TCBRqFC46Tj1D2S+A/EJzJzhHpqKnt4PkqS9GLLPJOocgW+FXIfHxr1cNedTzo7Rw5
 1/GT02l+t/EmDgKzSSYJDFSTmzDhWMxIZMRU7Vq8mw4c4on92RW2/sf27VcrI21VHFCC
 Jvtw==
X-Gm-Message-State: ABy/qLbd3YwlXCZ+m1LbugBjoaFL1DIg8TR2FGbRzxn+18Cr5KcIykXt
 JIaczdC2CUN+faVjTDxowdA=
X-Google-Smtp-Source: APBJJlECOmtP22hrQRQPHUAyhMTCH4MMW99NWkLufXU/36WFrjC0ehSY2SUAZ6vxYmQzgTOmL8legA==
X-Received: by 2002:a05:6512:3d28:b0:4fb:8802:9554 with SMTP id
 d40-20020a0565123d2800b004fb88029554mr18715169lfv.6.1689147330175; 
 Wed, 12 Jul 2023 00:35:30 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o1-20020ac24341000000b004eff1163c37sm588675lfl.308.2023.07.12.00.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 00:35:29 -0700 (PDT)
Date: Wed, 12 Jul 2023 10:35:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
Message-ID: <20230712103519.1a941d26@eldfell>
In-Reply-To: <79eb29b5-f018-d92c-b514-5ae0c954ff46@quicinc.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
 <6e3eec49-f798-ff91-8b4d-417d31089296@linaro.org>
 <20230630112708.4d3a08a7@eldfell>
 <eb78b4d6-6da2-1cb5-5fab-01d7bf233111@quicinc.com>
 <e17db728-d91b-a2b3-08a9-1dd1fde9c727@linaro.org>
 <53ca10d5-c1e0-285a-30b9-4e9a2a1b70c9@quicinc.com>
 <916d6b67-0f37-3814-4a15-d4a6fd6891ab@linaro.org>
 <79eb29b5-f018-d92c-b514-5ae0c954ff46@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Koo4mZ9l75IMKSB1KGUOoX.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, wayland-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Koo4mZ9l75IMKSB1KGUOoX.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Jul 2023 15:42:28 -0700
Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:

> On 7/11/2023 3:19 PM, Dmitry Baryshkov wrote:
> > On 12/07/2023 01:07, Jessica Zhang wrote: =20
> >>
> >>
> >> On 7/10/2023 1:11 PM, Dmitry Baryshkov wrote: =20
> >>> On 10/07/2023 22:51, Jessica Zhang wrote: =20
> >>>>
> >>>>
> >>>> On 6/30/2023 1:27 AM, Pekka Paalanen wrote: =20
> >>>>> On Fri, 30 Jun 2023 03:42:28 +0300
> >>>>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >>>>> =20
> >>>>>> On 30/06/2023 03:25, Jessica Zhang wrote: =20
> >>>>>>> Add support for pixel_source property to drm_plane and related
> >>>>>>> documentation.
> >>>>>>>
> >>>>>>> This enum property will allow user to specify a pixel source for =
the
> >>>>>>> plane. Possible pixel sources will be defined in the
> >>>>>>> drm_plane_pixel_source enum.
> >>>>>>>
> >>>>>>> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB =
and
> >>>>>>> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB. =
=20
> >>>>>>
> >>>>>> I think, this should come before the solid fill property addition.=
=20
> >>>>>> First
> >>>>>> you tell that there is a possibility to define other pixel=20
> >>>>>> sources, then
> >>>>>> additional sources are defined. =20
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> that would be logical indeed. =20
> >>>>
> >>>> Hi Dmitry and Pekka,
> >>>>
> >>>> Sorry for the delay in response, was out of office last week.
> >>>>
> >>>> Acked.
> >>>> =20
> >>>>> =20
> >>>>>>>
> >>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>>> ---
> >>>>>>> =C2=A0=C2=A0 drivers/gpu/drm/drm_atomic_state_helper.c |=C2=A0 1 +
> >>>>>>> =C2=A0=C2=A0 drivers/gpu/drm/drm_atomic_uapi.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> >>>>>>> =C2=A0=C2=A0 drivers/gpu/drm/drm_blend.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 81=20
> >>>>>>> +++++++++++++++++++++++++++++++
> >>>>>>> =C2=A0=C2=A0 include/drm/drm_blend.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0 2 +
> >>>>>>> =C2=A0=C2=A0 include/drm/drm_plane.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 21 ++++++++
> >>>>>>> =C2=A0=C2=A0 5 files changed, 109 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c=20
> >>>>>>> b/drivers/gpu/drm/drm_atomic_state_helper.c
> >>>>>>> index fe14be2bd2b2..86fb876efbe6 100644
> >>>>>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> >>>>>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> >>>>>>> @@ -252,6 +252,7 @@ void=20
> >>>>>>> __drm_atomic_helper_plane_state_reset(struct drm_plane_state=20
> >>>>>>> *plane_state,
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plane_state->alpha =3D DRM_B=
LEND_ALPHA_OPAQUE;
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plane_state->pixel_blend_mod=
e =3D DRM_MODE_BLEND_PREMULTI;
> >>>>>>> +=C2=A0=C2=A0=C2=A0 plane_state->pixel_source =3D DRM_PLANE_PIXEL=
_SOURCE_FB;
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (plane_state->solid_fill_=
blob) {
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_=
property_blob_put(plane_state->solid_fill_blob);
> >>>>>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c=20
> >>>>>>> b/drivers/gpu/drm/drm_atomic_uapi.c
> >>>>>>> index a28b4ee79444..6e59c21af66b 100644
> >>>>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >>>>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >>>>>>> @@ -596,6 +596,8 @@ static int=20
> >>>>>>> drm_atomic_plane_set_property(struct drm_plane *plane,
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_=
property_blob_put(solid_fill);
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn ret;
> >>>>>>> +=C2=A0=C2=A0=C2=A0 } else if (property =3D=3D plane->pixel_sourc=
e_property) {
> >>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state->pixel_source =
=3D val;
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (property =3D=3D p=
lane->alpha_property) {
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stat=
e->alpha =3D val;
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (property =3D=3D p=
lane->blend_mode_property) { =20
> >>>>>>
> >>>>>> I think, it was pointed out in the discussion that=20
> >>>>>> drm_mode_setplane()
> >>>>>> (a pre-atomic IOCTL to turn the plane on and off) should also reset
> >>>>>> pixel_source to FB. =20
> >>>>
> >>>> I don't remember drm_mode_setplane() being mentioned in the=20
> >>>> pixel_source discussion... can you share where it was mentioned? =20
> >>>
> >>> https://lore.kernel.org/dri-devel/20230627105849.004050b3@eldfell/
> >>>
> >>> Let me quote it here:
> >>> "Legacy non-atomic UAPI wrappers can do whatever they want, and progr=
am
> >>> any (new) properties they want in order to implement the legacy
> >>> expectations, so that does not seem to be a problem."
> >>>
> >>> =20
> >>>>
> >>>> I'd prefer to avoid having driver change the pixel_source directly=20
> >>>> as it could cause some unexpected side effects. In general, I would=
=20
> >>>> like userspace to assign the value of pixel_source without driver=20
> >>>> doing anything "under the hood". =20
> >>>
> >>> s/driver/drm core/
> >>>
> >>> We have to remain compatible with old userspace, especially with the=
=20
> >>> non-atomic one. If the userspace calls=20
> >>> ioctl(DRM_IOCTL_MODE_SETPLANE), we have to display the specified FB,=
=20
> >>> no matter what was the value of PIXEL_SOURCE before this ioctl. =20
> >>
> >>
> >> Got it, thanks the clarification -- I see your point.
> >>
> >> I'm already setting plane_state->pixel_source to FB in=20
> >> __drm_atomic_helper_plane_reset() and it seems to me that all drivers=
=20
> >> are calling that within their respective plane_funcs->reset().
> >>
> >> Since (as far as I know) reset() is being called for both the atomic=20
> >> and non-atomic paths, shouldn't that be enough to default pixel_source=
=20
> >> to FB for old userspace? =20
> >=20
> > No, this will not clean up the state between userspace apps. Currently=
=20
> > the rule is simple: call DRM_IOCTL_MODE_SETPLANE, get the image from FB=
=20
> > displayed. We should keep it so.
> >  =20
>=20
> Ok, so you are considering a use-case where we bootup with a userspace=20
> (which is aware of pixel_source), that one uses the pixel_source to=20
> switch the property to solid_color and then we kill this userspace and=20
> bootup one which is unaware of this property and uses=20
> DRM_IOCTL_MODE_SETPLANE, then we should default back to FB.

Not even that complex. There is no need to reboot and no need to kill
anything to hit this. A simple VT-switch can switch between two
different KMS clients, one could be using atomic with solid_fill, and
the other is an old legacy UAPI user. If the atomic client leaves stuff
up in KMS state, it would be nice if the legacy app still worked.

Or, maybe it's not a VT-switch but switching from, say, a graphical
login manager to a desktop or back. The same thing, different KMS
clients. But in this case it is more likely that userspace follows
common play rules, so it's less likely to have problematic left-over
KMS state.

Or, maybe you simply quit the atomic KMS client and expect fbcon to
successfully take over. I don't know what APIs fbcon uses inside the
kernel, but it definitely should clean up any mess left over by an
atomic (or legacy) KMS client to make sure it shows itself.
Traditionally it has failed to do that though, I don't know if things
are better nowadays (GAMMA_LUT, HDR_OUTPUT_METADATA, probably more).

Switching between two KMS clients is fundamentally problematic. If both
old and new KMS client are atomic, the kernel cannot simply go
resetting any KMS state automatically, because the kernel does not
know which part of state is good to reset and which would just cause
unwanted flicker and delays. That means that it is up to the two atomic
KMS clients to agree on common play rules and not leave funny state up.
IOW, not the kernel's problem, by what I have understood from kernel
developer opinions.

However, legacy KMS clients are different. As legacy clients, they may
not even have access to the properties they might need to clean up
after a previous atomic KMS client. The legacy UAPI is expected to
be slow and glitchy, but also Just Work(TM), so the kernel can reset
everything a legacy KMS client would not have access to when a legacy
KMS client issues drmModeSetPlane or drmModeSetCrtc (pardon for using
libdrm API functions for the ioctls whose names I never memorised).


Thanks,
pq

--Sig_/Koo4mZ9l75IMKSB1KGUOoX.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSuV7cACgkQI1/ltBGq
qqe1bhAAjr/t3vy/wQYTZoNif5ySebXZ0/JcaGv9X5OWb6H3K3IgxruypCHW+Qzu
fgYX+fFAxl58FaqnMu4USebdshELA9FFrq3dbrNeSWvo9/AzdTeoNhhYatcMlgJq
H0f5Gs+h2/va7PIav3guMlyVcJYRIT8mzjE5SUrVPDnF8t7lyqbYmdBXE59dEvFD
xpMP2aRjtEyu4zqP7q9VjK63QddhlOgo/Fl6+3zuaPH0mdEOnO4ZssC2zGB7OL0l
DwSh6QR7R+os+WVdPFyCZVlp0FbGltSK5UdcsArHKhgNVjwtETrTJHZYmRMmzFzy
VVez22vHgdijfAsmLG+GHG0eQYkOu8MDujaIi1UooEAa6AGQvvsji9jWfglnN6z6
+bQLYif2JVhawUc3T/+8+ey5gMDIgRyUzRGv1pa3Z2bUGVRLYtdTQ75POlYtkZM0
bBK4QKjV8rXVEJ9JTS7ElB6tesFrPSHdQinoAHU3YB4ZPkxksQiLdBfDtnp/4Tca
p7tFuSVjg1zwWyoUHTADVlgG7BF4IcW6FjeeC657+2S3XFhXSOEV2RE1A+zGICnK
K2BpLuWqFLepK+LESBfQvKV5plFWrLpIM+5HNIaPt1lwNF4AFVPVGLowOt0oGU0f
LcKiJzDn6moVLQc5fU8nPrQD9rseXyG2Y6kDSdDC3OFCrSj2jnw=
=nBtI
-----END PGP SIGNATURE-----

--Sig_/Koo4mZ9l75IMKSB1KGUOoX.--
