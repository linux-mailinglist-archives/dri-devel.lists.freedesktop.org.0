Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19875A127CE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 16:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019EF10E722;
	Wed, 15 Jan 2025 15:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VlLOEJJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1FF10E73D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 15:47:36 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4678cd314b6so65088541cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 07:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736956056; x=1737560856;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/jr6KBLHNTX9a5zOtlZSAW+n3vs5Rh17Yo7aqrlbhI=;
 b=VlLOEJJeSvpxqTmnRE34mu0cFbKatbv7jIr4x39IclXPWXBmvRgFOxNHFzbn70iWD2
 uLFn45Wh1tc7u5kW4vF6+1YUBBif4dHTWnYlqFjeOKwk5IyMUv5ADHRGsVlkaEWYw1cw
 0wopDWhHXR586oIECVusfqgo6rf3pFSVFkIBXilf+fV3+s3s4SHgW04Jk7LJr85I13uD
 qEOvJ0ULaI3G9BexmBw5B4nXMLdqTHirtjhkdabWy46WYT80lQOnIMaObMcu3oEqvgH9
 JFef5HyvG4SpDafQ+7cJ3t9Rpg4r7NbYsUcOZzS5jwDfeO093FHGhWJh1lE+1ivHSk4c
 WZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736956056; x=1737560856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/jr6KBLHNTX9a5zOtlZSAW+n3vs5Rh17Yo7aqrlbhI=;
 b=R90SIyWnVPAOq0vb7yy2nG2yYVQQ2WzeRf0FpORVZTau4eveycIvNtiPUIeah0qgLU
 eMvd87qwzYVULRPnlMQV8MZM1//HyGQpw/3HiuV94BloUgcvTDOXflrdWgZxFM9kdG/k
 yVA/WH4oFxW0fLexmKL2acjTVuRZtFh9HAxrNTXqrtxq4qa1Wlg1BwzrbtZJECvH3fOO
 xqJ6BU0+qGsH9RKZ2jMl0h8gKNQtfmnJ0FCohSE6YHoKJ5aJhS1cvXdfGa0dJRhBaMvs
 bNFjOdJNGJ0N7o/PqFvzreIZzDWI9ycMuOH6EXdvMDxnv7pQYPz350D5K5HCggjgbbej
 V8BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrrlkfR9yBfv58GrlEunHHvh/dBua26UaIColLtjxnkKYYZFXZclu6fgvww9SVhEP1THJFl9qKlSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDKI2wVC9G5DkDTG8UwmdRfjiuevvT+auxRn68TzTG/riWE7AE
 C2s1dsfg2+M1NmwjYmjCj8Nxb8oQ5BhkF74bR4nxL6WfRWpvbGv5PPPJRIN4o0zxnhnXHdOEpKN
 wluBSbGQ2xopBEtyGzKgB+8fAgL/yj/E6XYph
X-Gm-Gg: ASbGncsuaD9mNIiN7AJXiwq6UrWV92TfKeEmzr1JHOXbZT/VEqyZL96b/IpbSkbOTSu
 IZP1ZzEvP/rgz2FxKxWt3L5m1fqudZceNxF6BqEh/A3okeDhCIfGBviX92MwCiOhxwUxxTwg=
X-Google-Smtp-Source: AGHT+IEF5CwAQomz3z3LH/vZ9FSFCgUWfRJMnul51Jr50q1PvNBGuzqUvdKZoOWXXlUqRF8fC77GCzWZc712CcnUFak=
X-Received: by 2002:ac8:7d43:0:b0:46c:86d8:fb7 with SMTP id
 d75a77b69052e-46c86d81111mr375797091cf.34.1736956055548; Wed, 15 Jan 2025
 07:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
 <87a5bsh27o.fsf@intel.com>
In-Reply-To: <87a5bsh27o.fsf@intel.com>
From: Jonathan Denose <jdenose@google.com>
Date: Wed, 15 Jan 2025 09:47:24 -0600
X-Gm-Features: AbW1kvaecP3PP2esGnv9CK3Rxi1Sub0FNVZqrE1NDM9-dHv3kjfpc7HrkxwE8rM
Message-ID: <CAMCVhVOagmBOj5UOr_HdohPApSAuprsObBm107X0q_1UfvSU_w@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/display: Add skip link check quirk
To: Jani Nikula <jani.nikula@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, imre.deak@intel.com
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

On Wed, Jan 15, 2025 at 3:10=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Tue, 14 Jan 2025, Jonathan Denose <jdenose@google.com> wrote:
> > The display on the Advantech UTC124G3PWWW0E-ES worked fine until commit
> > "drm/i915/dp: Recheck link state after modeset" was introduced. After
> > this commit the display flickers intermittently as the driver code
> > initiates the delayed link recheck in an infinite loop.
> >
> > To resolve this issue for the Advantech device, add a quirk to skip ove=
r
> > the delayed link recheck.
>
> It would be better to try to get at the root cause first, instead of
> blindly skipping required parts. The code's complicated enough without
> quirks, and removing them afterwards is very difficult.
>
> Please file a bug according to [1], and attach full dmesg with debugs
> enabled.

I filed a bug with the full dmesg a few weeks ago:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13344

> Cc: Imre
>
> BR,
> Jani.
>
>
>
> [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.ht=
ml
>
>
>
> >
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > ---
> >
> >  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 +++-
> >  drivers/gpu/drm/i915/display/intel_quirks.c           | 8 ++++++++
> >  drivers/gpu/drm/i915/display/intel_quirks.h           | 1 +
> >  3 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/dr=
ivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index 397cc4ebae526..7804ad38b00cd 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -32,6 +32,7 @@
> >  #include "intel_encoder.h"
> >  #include "intel_hotplug.h"
> >  #include "intel_panel.h"
> > +#include "intel_quirks.h"
> >
> >  #define LT_MSG_PREFIX                        "[CONNECTOR:%d:%s][ENCODE=
R:%d:%s][%s] "
> >  #define LT_MSG_ARGS(_intel_dp, _dp_phy)      (_intel_dp)->attached_con=
nector->base.base.id, \
> > @@ -1622,7 +1623,8 @@ void intel_dp_start_link_train(struct intel_atomi=
c_state *state,
> >               lt_dbg(intel_dp, DP_PHY_DPRX, "Forcing link training fail=
ure\n");
> >       } else if (passed) {
> >               intel_dp->link.seq_train_failures =3D 0;
> > -             intel_encoder_link_check_queue_work(encoder, 2000);
> > +             if (!intel_has_quirk(display, QUIRK_SKIP_LINK_CHECK))
> > +                     intel_encoder_link_check_queue_work(encoder, 2000=
);
> >               return;
> >       }
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/=
drm/i915/display/intel_quirks.c
> > index 28f497ae785bb..d472a5f21f8b9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> > +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> > @@ -78,6 +78,12 @@ static void quirk_fw_sync_len(struct intel_dp *intel=
_dp)
> >       drm_info(display->drm, "Applying Fast Wake sync pulse count quirk=
\n");
> >  }
> >
> > +static void quirk_skip_link_check(struct intel_display *display)
> > +{
> > +     intel_set_quirk(display, QUIRK_SKIP_LINK_CHECK);
> > +     drm_info(display->drm, "Applying skip link check quirk\n");
> > +}
> > +
> >  struct intel_quirk {
> >       int device;
> >       int subsystem_vendor;
> > @@ -229,6 +235,8 @@ static struct intel_quirk intel_quirks[] =3D {
> >       { 0x3184, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
> >       /* HP Notebook - 14-r206nv */
> >       { 0x0f31, 0x103c, 0x220f, quirk_invert_brightness },
> > +     /* Advantech UTC124G3PWWW0E-ES */
> > +     {0x5a85, 0x8086, 0x2212, quirk_skip_link_check},
> >  };
> >
> >  static const struct intel_dpcd_quirk intel_dpcd_quirks[] =3D {
> > diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/=
drm/i915/display/intel_quirks.h
> > index cafdebda75354..9e8f2816a4fba 100644
> > --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> > +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> > @@ -20,6 +20,7 @@ enum intel_quirk_id {
> >       QUIRK_LVDS_SSC_DISABLE,
> >       QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
> >       QUIRK_FW_SYNC_LEN,
> > +     QUIRK_SKIP_LINK_CHECK,
> >  };
> >
> >  void intel_init_quirks(struct intel_display *display);
>
> --
> Jani Nikula, Intel
--=20
Jonathan
