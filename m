Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6BEA40168
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3080410EB2E;
	Fri, 21 Feb 2025 20:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G3r9NyhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC3110E2E7;
 Fri, 21 Feb 2025 20:55:09 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fbfa7100b0so590996a91.0; 
 Fri, 21 Feb 2025 12:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740171309; x=1740776109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3aO+dMCpz/Nf7Np+szReM6sUn+gNhJfqLLBVYXAo68=;
 b=G3r9NyhO7jdS1JzwXhfdWIHrtIL3+hfjw3R/Rw8BS2jBBUXkZs1peydigdmMSPiHcM
 5gfhOY5BauGz+nnXkK+TSMzJtmZRjG3wP0G8QajztMoAcTxOACwkB1BUAxEbhQn58JnJ
 e3wJLEY2GS/KZqevWN6JX4exKd6At2iuIAuRv/AvKJqIlw6GcsPaIGcLdWhwc/N8ebXc
 eGuxzbbPxjKINy6y/zqn7fnJOPX3Dohr6FglAj7rBuU5HF1pSXoUFn9Ue4CMeG1Lr810
 nZsXS25+ze98AWIJ6jKuhKUsGgPgI1f0qOqJ7677LE1vkGkiMeCZ3Ov48Ez96jAdI7NH
 MbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740171309; x=1740776109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y3aO+dMCpz/Nf7Np+szReM6sUn+gNhJfqLLBVYXAo68=;
 b=AspgimM/8aMEVrjzinQBAJnbwj1BixDRKW2JN/eXjKSr9u5Y1M+8ea5vlx1Qt+q5QZ
 V3ltl2yX41/OvkbWmInePe2CaOjX2fuMsO0BknfIfFxoeGlDUvi4sDSr0aQAFtIfpKh3
 ZVtTqtQx+YhXMVa3qx7SbLHY1vCmRwdPNfiI4jmH+qCli3kn90WGxnsd619mH+pNRGAf
 H3btSlE9WSNf/xGQxfudqaXT9V1LU4cWjYeHARLtboOQdKJs248CxY+P67BpffnOyjcc
 T39f1P5SmonGHcrlPX0OwhLVa0ZcXDylSBf3LOMm8azqeGnddimVGufifNJKDny4KavS
 D0lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4C9TBhQlO/vuOE1/Ic46J6pYeBHLjy65kuvKRyCuQXfjEytXpllnXpCrh5tcvXgEfqygcNNRu@lists.freedesktop.org,
 AJvYcCUwtl7UnpiAkPDaFEfprMmBR2tB3jW+P+BFlk+AoYcz1p/cLnUwhKc6+qBWVPUE4Vz02j6DWfvS6oSA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtvCAOsa1u/5qfIgb9DVsoip17O1IrCWup5LC/T8G/G99W5yOT
 9P0EegpBercMdmOt8efM9razGvHzhWgh/ZKJWoDntn0aDxy6VhM95OJa/SnwqAd2J1XvkWsXjtc
 YRm+sssiuOjlpGmNlA+OsF1gCN4U=
X-Gm-Gg: ASbGncuNGUId0VAUjfYmp1V6xL9/eFWW4MA3BqCiG5XyxfAyS1rOPpkP8Y9Q/P/9ZsY
 biY7WnnFm2LZZS9jx9YfKpl970mztURsqUfbGL89RZlOkE2XlranLumjPKwc2TYxQI2PFOA1x74
 itakHChGQ=
X-Google-Smtp-Source: AGHT+IFOkPj/fHc+rIs3RdFSM/ahZ75cv+Q/yymIpzhu+NvlXw1oS9nalsfIUbXyZjoE51xkq1jpuwDIstG5vTx3ujE=
X-Received: by 2002:a17:90b:3b8e:b0:2ee:d372:91bd with SMTP id
 98e67ed59e1d1-2fce77a6618mr2864624a91.2.1740171309015; Fri, 21 Feb 2025
 12:55:09 -0800 (PST)
MIME-Version: 1.0
References: <20250215211549.79832-1-mwen@igalia.com>
 <b6466238-42dd-4de4-9c95-ba3c019a6b21@amd.com>
In-Reply-To: <b6466238-42dd-4de4-9c95-ba3c019a6b21@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Feb 2025 15:54:56 -0500
X-Gm-Features: AWEUYZlWFJ_0SzgFG-v0O6BzJBhL2Xkgp8f6qrJQD0IcGsin6vc8mZc8a2Ktzqs
Message-ID: <CADnq5_PPZX-=xAGRSJwAyr+3pgJhFW4uyk-tmy9BgE_UwOWt-g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: restore edid reading from a given i2c
 adapter
To: Alex Hung <alex.hung@amd.com>
Cc: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com, sunpeng.li@amd.com, 
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 mario.limonciello@amd.com, Roman Li <Roman.Li@amd.com>, 
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Applied.  Thanks!

Alex

On Fri, Feb 21, 2025 at 3:48=E2=80=AFPM Alex Hung <alex.hung@amd.com> wrote=
:
>
> Reviewed-by: Alex Hung <alex.hung@amd.com>
>
> On 2/15/25 14:15, Melissa Wen wrote:
> > When switching to drm_edid, we slightly changed how to get edid by
> > removing the possibility of getting them from dc_link when in aux
> > transaction mode. As MST doesn't initialize the connector with
> > `drm_connector_init_with_ddc()`, restore the original behavior to avoid
> > functional changes.
> >
> > v2:
> > - Fix build warning of unchecked dereference (kernel test bot)
> >
> > CC: Alex Hung <alex.hung@amd.com>
> > CC: Mario Limonciello <mario.limonciello@amd.com>
> > CC: Roman Li <Roman.Li@amd.com>
> > CC: Aurabindo Pillai <Aurabindo.Pillai@amd.com>
> > Fixes: 48edb2a4256e ("drm/amd/display: switch amdgpu_dm_connector to us=
e struct drm_edid")
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 +++++++++++++++-=
-
> >   1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index a8421c07b160..142d366e3347 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -7269,8 +7269,14 @@ static void amdgpu_dm_connector_funcs_force(stru=
ct drm_connector *connector)
> >       struct dc_link *dc_link =3D aconnector->dc_link;
> >       struct dc_sink *dc_em_sink =3D aconnector->dc_em_sink;
> >       const struct drm_edid *drm_edid;
> > +     struct i2c_adapter *ddc;
> >
> > -     drm_edid =3D drm_edid_read(connector);
> > +     if (dc_link && dc_link->aux_mode)
> > +             ddc =3D &aconnector->dm_dp_aux.aux.ddc;
> > +     else
> > +             ddc =3D &aconnector->i2c->base;
> > +
> > +     drm_edid =3D drm_edid_read_ddc(connector, ddc);
> >       drm_edid_connector_update(connector, drm_edid);
> >       if (!drm_edid) {
> >               DRM_ERROR("No EDID found on connector: %s.\n", connector-=
>name);
> > @@ -7315,14 +7321,21 @@ static int get_modes(struct drm_connector *conn=
ector)
> >   static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
> >   {
> >       struct drm_connector *connector =3D &aconnector->base;
> > +     struct dc_link *dc_link =3D aconnector->dc_link;
> >       struct dc_sink_init_data init_params =3D {
> >                       .link =3D aconnector->dc_link,
> >                       .sink_signal =3D SIGNAL_TYPE_VIRTUAL
> >       };
> >       const struct drm_edid *drm_edid;
> >       const struct edid *edid;
> > +     struct i2c_adapter *ddc;
> >
> > -     drm_edid =3D drm_edid_read(connector);
> > +     if (dc_link && dc_link->aux_mode)
> > +             ddc =3D &aconnector->dm_dp_aux.aux.ddc;
> > +     else
> > +             ddc =3D &aconnector->i2c->base;
> > +
> > +     drm_edid =3D drm_edid_read_ddc(connector, ddc);
> >       drm_edid_connector_update(connector, drm_edid);
> >       if (!drm_edid) {
> >               DRM_ERROR("No EDID found on connector: %s.\n", connector-=
>name);
>
