Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1319F38E4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361FF10E3FB;
	Mon, 16 Dec 2024 18:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O5PPqABY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7712B10E1F2;
 Mon, 16 Dec 2024 18:27:04 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2162b5d2e1fso6213495ad.3; 
 Mon, 16 Dec 2024 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734373624; x=1734978424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RORr4BwXDZK3mrhMObHgV1fmSWfT3pszlCMMq/K/uwU=;
 b=O5PPqABYx1rsmtL4LR3exEN75pJvF7E0vV40n3Jues8CRRvKm98UkTWJQLmRlZpjtR
 fp00D+3G1AqnkZeOD73sAkM9E3PQiLbJDC20IuE6iYR6G7Db8KP+zSV4a1LPeM0Vns2t
 jbecAFBTlcdvndIso8QXEvVEg5m2f3tLf1B+VTFOn01yWHj4gPkG1wwOqxJVmfc3Ozsa
 z3aMgHc1C5kM2D+n8/vTvqwI174XKp0YJrLWt4hc2ZgIW9k2rAiE/sqasOJBwHl2NYrj
 3wI0jK+2Fi3+g/rR4UrXWHbT7jb5QqQhFU8rV1unpTCFCtrLkKzWz5DkCt7XHpSZSKac
 VMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373624; x=1734978424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RORr4BwXDZK3mrhMObHgV1fmSWfT3pszlCMMq/K/uwU=;
 b=CtMxf0oQ+KozPzgwmpP+uZUg4Sgk+WzytrZ9+GixNVkbQ/S10yD7hiESTFXSsl9BAv
 thWtuj0OODJOoSdAh1wPSXRh7sDn/qww434NiEYnwbExs2Lupf0d8Oy8RLn/I6oosMnf
 9pgAa1pyw5dH3I2P0o7XTfPZD57krQ+h6I6ntRiGhI0JhgFT2rL5xzlN/n3scOHgQfW1
 eNuQnnAEr4KWFTwNUlSrtZekxEQiGqHc0tXZDeg0RdG8ZVRR0T8hL8nXHmWfERVRr7LW
 IdWqW+Lirx96cU0VyKIQ1Jep3ItjSIEo4VNrS879M4Pop4lSelFGFRm057sjkX6GtNLO
 L0BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN4Hbx+K3LirZEMO0VUYKMkcxmpkGDY7YEBHGm9iB6C98/Fb0hmX/F1sIda5vbORBvpIypNEUUPQI=@lists.freedesktop.org,
 AJvYcCUhb1uWX5l/iPY1LBfAuG0s/MpnwdpsZSkcTdE0Z6meb3OOtYqJjQxLriOCGlxahI8LRdx145QNF9iS@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywiump5ubpgyodH/wkkSKubqmsoX2wWLAAsNg/WVz1btEXf48sr
 dPSeNE1MHE3mLg+B/r8oM/o0mpp0FQI8/L/C9a50KBOsk8CCejzyMOGyF7LHfSpfvNb6AHqvXPu
 387u17o8CAfhqEUUsQtyKZUpa+GM=
X-Gm-Gg: ASbGnctXu/x/o9roWMRWldIS79kMpjp64dY4yqzxtXWSPxkmywZsmexD4En4jtKTvHR
 FmQoI9yoSc8NiLN8gXbwA12DhOdOcJvXKZY49JQ==
X-Google-Smtp-Source: AGHT+IE0VkxvsWhx4fWLXGL+jQqle1J+9zDKXSefQQsKjN90yKq+Rk4/gDc4MOzAnfWaVNL8Wrup5gfPXtGybKyZKLg=
X-Received: by 2002:a17:902:d488:b0:216:42fd:79d8 with SMTP id
 d9443c01a7336-21892a34260mr74219445ad.12.1734373623947; Mon, 16 Dec 2024
 10:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-7-imre.deak@intel.com>
 <Z2Ag68XqBOZTghHq@ideak-desk.fi.intel.com>
In-Reply-To: <Z2Ag68XqBOZTghHq@ideak-desk.fi.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Dec 2024 13:26:52 -0500
Message-ID: <CADnq5_O40d+7ZgX=VFu+LX6JrFMybPDjesk0xGzHq36XbbxGzQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] drm/amd/dp_mst: Expose a connector to kernel
 users after it's properly initialized
To: imre.deak@intel.com
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
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

On Mon, Dec 16, 2024 at 8:13=E2=80=AFAM Imre Deak <imre.deak@intel.com> wro=
te:
>
> Hi Harry, Leo, Alex, Wayne,
>
> could you please ack this change as well?

Patches 1-9 are:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

Feel free to take this one through whichever tree you are planning to
commit these to.

Alex

>
> Thanks,
> Imre
>
> A typo below in the commit log, can fix it while merging the patch here a=
nd in
> the i915/nouveau patches.
>
> On Thu, Dec 12, 2024 at 01:03:23AM +0200, Imre Deak wrote:
> > After a connector is added to the drm_mode_config::connector_list, it's
> > visible to any in-kernel users looking up connectors via the above list=
.
> > Make sure that the connector is properly initialized before such
> > look-ups, by initializing the connector with
> > drm_connector_dynamic_register() - which doesn't add the connector to
>   ^ should be drm_connector_dynamic_init()
>
> > the list - and registering it with drm_connector_dynamic_register() -
> > which adds the connector to the list - after the initialization is
> > complete.
> >
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Wayne Lin <wayne.lin@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.=
c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 6e43594906130..d398bc74e6677 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -590,11 +590,12 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topolog=
y_mgr *mgr,
> >       amdgpu_dm_set_mst_status(&aconnector->mst_status,
> >                       MST_PROBE, true);
> >
> > -     if (drm_connector_init(
> > +     if (drm_connector_dynamic_init(
> >               dev,
> >               connector,
> >               &dm_dp_mst_connector_funcs,
> > -             DRM_MODE_CONNECTOR_DisplayPort)) {
> > +             DRM_MODE_CONNECTOR_DisplayPort,
> > +             NULL)) {
> >               kfree(aconnector);
> >               return NULL;
> >       }
> > --
> > 2.44.2
> >
