Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF16C6828C1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 10:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0792389196;
	Tue, 31 Jan 2023 09:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FC710E325;
 Tue, 31 Jan 2023 09:25:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gr7so15128846ejb.5;
 Tue, 31 Jan 2023 01:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=z3lSRAvbwEid3dWm8LN9APi25R8vFUmC9/p72SL2jbU=;
 b=OQCpvIkQrrKxUeLwrl7GV8tD3czv2XaXsiLUNVRc2FKIWsqBrhVfA6xahsPH4X8y5c
 rJNjmwiD+THYR6G4adlwMgUIvzw7PWj8mlMvw3QW0VRaNc0l+84haPvqmDj8zqnX0zh4
 YEVNr01ESNoWsshHlkAmZUVbjyTbIGeCERDggz3DbMxwFgL1YuyqAtr0QBA1hQkKp4jN
 pYdiaQ5ZeHkzRgDVlETpTA8up2IDEoNbJz/oTMj6TrgB5uYkOvRjmQWCwKle9A+aISFf
 7zvoPIcbjO0Mvx4NMsIZsoMH375xQBKcFFqBrjxwCBE+ODNmF3D9Yr7xPkJd0kQ8RDNU
 FDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z3lSRAvbwEid3dWm8LN9APi25R8vFUmC9/p72SL2jbU=;
 b=J/alfEDfiKglix3PFIQoTSOvNYNkagqj05eK/wUFKyGITvVCaq0JZ1qJu+xfgTYbNZ
 kq+fgILSeu9C6jSJn3jEcIDZZor1kRw2JqP+mr8VEnllGoeNs5LLQICF5QHpHiPBdL3U
 MxN2wCYmDY5oR4bGM2/JLwL5mDTNEuYoaAUTRz1ua3BYDaEFfgrjAHo97AbaC4hK7wVe
 AMkHbwYTeQ2oeAnU6gt2rYxAqxZe022JXJjrGo1dbcdBU2Bsj1i2VH3qE/pcOzWVL0SB
 vR42X3I9NbFV75WICOZS1n5NrYo7MbRMGjcAY/tXaXmcMz3Z91k+FQR9DM+jTD1UL6kM
 XcaA==
X-Gm-Message-State: AO0yUKXXakl4P1xQYq5qGA9mK6PEjJ/fnGq2HLSMilifzeWr0Rm7n0GA
 dGMQ2Rw7zDjYBPGlbRVYX98=
X-Google-Smtp-Source: AK7set+kiASUQOq0T0JtC7gbUBSERdGrpkoLU7YdjJKyWblBVEulfnlZRbwOs40yi0xsduzM3PZvzA==
X-Received: by 2002:a17:906:470f:b0:878:7cf3:a9e7 with SMTP id
 y15-20020a170906470f00b008787cf3a9e7mr18433711ejq.65.1675157132961; 
 Tue, 31 Jan 2023 01:25:32 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090600c100b0088b24b3aff8sm1489994eji.183.2023.01.31.01.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 01:25:32 -0800 (PST)
Date: Tue, 31 Jan 2023 11:25:27 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <20230131112527.32ab8ba5@eldfell>
In-Reply-To: <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=NBkRHtLwTRad5_VW=k6BOu";
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, Jessica Zhang <quic_jesszhan@quicinc.com>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/=NBkRHtLwTRad5_VW=k6BOu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Jan 2023 23:49:34 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Fri, 6 Jan 2023 at 20:41, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Jan 06, 2023 at 05:43:23AM +0200, Dmitry Baryshkov wrote: =20
> > > On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com=
> wrote: =20
> > > >
> > > >
> > > >
> > > > On 1/5/2023 3:33 AM, Daniel Vetter wrote: =20
> > > > > On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote: =20
> > > > >> Introduce and add support for a solid_fill property. When the so=
lid_fill
> > > > >> property is set, and the framebuffer is set to NULL, memory fetc=
h will be
> > > > >> disabled.
> > > > >>
> > > > >> In addition, loosen the NULL FB checks within the atomic commit =
callstack
> > > > >> to allow a NULL FB when the solid_fill property is set and add F=
B checks
> > > > >> in methods where the FB was previously assumed to be non-NULL.
> > > > >>
> > > > >> Finally, have the DPU driver use drm_plane_state.solid_fill and =
instead of
> > > > >> dpu_plane_state.color_fill, and add extra checks in the DPU atom=
ic commit
> > > > >> callstack to account for a NULL FB in cases where solid_fill is =
set.
> > > > >>
> > > > >> Some drivers support hardware that have optimizations for solid =
fill
> > > > >> planes. This series aims to expose these capabilities to userspa=
ce as
> > > > >> some compositors have a solid fill flag (ex. SOLID_COLOR in the =
Android
> > > > >> hardware composer HAL) that can be set by apps like the Android =
Gears
> > > > >> app.
> > > > >>
> > > > >> Userspace can set the solid_fill property to a blob containing t=
he
> > > > >> appropriate version number and solid fill color (in RGB323232 fo=
rmat) and
> > > > >> setting the framebuffer to NULL.
> > > > >>
> > > > >> Note: Currently, there's only one version of the solid_fill blob=
 property.
> > > > >> However if other drivers want to support a similar feature, but =
require
> > > > >> more than just the solid fill color, they can extend this featur=
e by
> > > > >> creating additional versions of the drm_solid_fill struct.
> > > > >>
> > > > >> Changes in V2:
> > > > >> - Dropped SOLID_FILL_FORMAT property (Simon)
> > > > >> - Switched to implementing solid_fill property as a blob (Simon,=
 Dmitry)
> > > > >> - Changed to checks for if solid_fill_blob is set (Dmitry)
> > > > >> - Abstracted (plane_state && !solid_fill_blob) checks to helper =
method
> > > > >>    (Dmitry)
> > > > >> - Removed DPU_PLANE_COLOR_FILL_FLAG
> > > > >> - Fixed whitespace and indentation issues (Dmitry) =20
> > > > >
> > > > > Now that this is a blob, I do wonder again whether it's not clean=
er to set
> > > > > the blob as the FB pointer. Or create some kind other kind of spe=
cial data
> > > > > source objects (because solid fill is by far not the only such th=
ing).
> > > > >
> > > > > We'd still end up in special cases like when userspace that doesn=
't
> > > > > understand solid fill tries to read out such a framebuffer, but t=
hese
> > > > > cases already exist anyway for lack of priviledges.
> > > > >
> > > > > So I still think that feels like the more consistent way to integ=
rate this
> > > > > feature. Which doesn't mean it has to happen like that, but the
> > > > > patches/cover letter should at least explain why we don't do it l=
ike this. =20
> > > >
> > > > Hi Daniel,
> > > >
> > > > IIRC we were facing some issues with this check [1] when trying to =
set
> > > > FB to a PROP_BLOB instead. Which is why we went with making it a
> > > > separate property instead. Will mention this in the cover letter. =
=20
> > >
> > > What kind of issues? Could you please describe them? =20
> >
> > We switched from bitmask to enum style for prop types, which means it's
> > not possible to express with the current uapi a property which accepts
> > both an object or a blob.
> >
> > Which yeah sucks a bit ...
> >
> > But!
> >
> > blob properties are kms objects (like framebuffers), so it should be
> > possible to stuff a blob into an object property as-is. Of course you n=
eed
> > to update the validation code to make sure we accept either an fb or a
> > blob for the internal representation. But that kind of split internally=
 is
> > required no matter what I think. =20
>=20
> I checked your idea and notes from Jessica. So while we can pass blobs
> to property objects, the prop_fb_id is created as an object property
> with the type DRM_MODE_OBJECT_FB. Passing DRM_MODE_OBJECT_BLOB would
> fail a check in drm_property_change_valid_get() ->
> __drm_mode_object_find(). And I don't think that we should break the
> existing validation code for this special case.
>=20
> If you insist on using FB_ID for passing solid_fill information, I'd
> ask you to reconsider using a 1x1 framebuffer. It would be fully
> compatible with the existing userspace, which can then treat it
> seamlessly.

Hi,

indeed, what about simply using a 1x1 framebuffer for real? Why was that
approach rejected?

Is there some problem with drivers just special-casing 1x1 framebuffers
and hitting the solid-fill hardware path instead of
framebuffer-with-scaling hardware path?

If needed, the KMS plane could have a property that tells userspace
that if you set a 1x1 RGB FB here without any color ops, I am able to
scale that to *any* size without any limits very efficiently.


Thanks,
pq

> > > > [1]
> > > > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/=
drm/drm_property.c#L71 =20
>=20


--Sig_/=NBkRHtLwTRad5_VW=k6BOu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPY3ocACgkQI1/ltBGq
qqfpNxAAhJjm3nkVlZjBZRlKkf7EIyci/P9Cz/kSSiMmw7UC9TIlRYs3CnhAfH+i
9gtV17UIoqBGNKsUuE04hg2lt7whI5ReDOYy2suyS6DXluhnjbmkXYxPsEDpNqgN
1Vj3DGqU8DQ7aJoRNJokLGmjiMFfRQtFjw9xIMjtCZPTJUQQvfLgBnG1yuERROSJ
KTxYHb28hq0/V7B0fNaAwDeJ+thNYa2VVW2llj2au+/tGjTEiM9Dfs9EPBMVPGy7
NYl5qtfjeSCWEUvpTOH3wUa4/G2EeqhWQek5r2wxEjFOwEmLYk1APZUn23qJU89u
A8ic951gNf7xmaHet/vHj10UP46vWep9BwnqZ6L60x3ERJpFhHdfriNFH1L5b/Af
+btvSc5fhaLeHd4JZuq7014g85EtIBoP0NITFauUd50uuGll7o8HNo6x3v7NA/gW
8+AU1aAJ0ovEVMqsPPi9thzmfH1ABjgMPuR2aS5o0/5sANCwAVLmvzxoB8DGJJyq
PtqHcjJyYNP6R39ZI8LQJJzrjmN4bViDoRRYU9tJlz0hfe2nBopmtj1F+dTQkCpX
rYdbkkj8FIw9xvKB8hDGJIqD1F4elwxSH/7wiUPScfhA38Hr1/n67SJvB+UVM0fq
UF4a5GracO6NTaIRmG5AkrHYL8UXAepFpen8/HyZHo3GDMedsBI=
=X1wC
-----END PGP SIGNATURE-----

--Sig_/=NBkRHtLwTRad5_VW=k6BOu--
