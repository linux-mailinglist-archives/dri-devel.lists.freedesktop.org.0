Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B141DAFEECA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 18:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C4210E2DE;
	Wed,  9 Jul 2025 16:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JeHFsHVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042710E0A7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 16:19:01 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-237311f5a54so627545ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 09:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752077940; x=1752682740;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WB0cSlpgHObUJTPQDLX4QuR9PrmDikXz04vEGr/TQgo=;
 b=JeHFsHVs+jgcD4u5LKa99Y0MDHai+PShXXwMyLPx9iFtevBbPZ2Lf6B00c2eTCwTrX
 ols4i1/3PQlWzKfsVmdHuIf6u/daseBdV+h3dVVyjMbga0TyAdb8QIIhqPiP3eV/SqqH
 df+VXOzDxMpWFspUI5wlrzyrSAi/nRu6e1rrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752077940; x=1752682740;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WB0cSlpgHObUJTPQDLX4QuR9PrmDikXz04vEGr/TQgo=;
 b=UPk7KKJKbzchyQt3RpY9IW+bNKQPQpwluNj6DmwiC29lk7b5C3EKMHqRNRE17Ls+h5
 0QczgO49rDzKRtQz+aqjT1ct19Tc9C4YpJ08kHlmbVH0s+SXFBa4C0y4+AhZ1ZwmmkmU
 /ZmQRbPMnn+rrPVJV96pukYq/qgskgqVtpiydmVojsCAumIzvXS8Fe92tguPKjSInxqA
 sM9NViGcDQCJKD17HPTQQepp2vB2hG5XULFAGk19+nKVOk0QB58/MLHD/NyHfYiEAGhl
 ZQynDEuudgpnses6//UU9tLknkg5A15toPSJN5VstwkLHHfOuKDKsf0ccgZRiPTC/DlI
 2PtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVpEyWmUajN/QDCDk0QcgMpcEmtuovk0znll6JGwk1CxmWgPRAyM1hRR5xQITQamJ2Nc4RjWwqPy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycjRMJVxRjofTaLGxKoglVI0DGqFOGHaI7DFSi0tU+DPmx7Bjs
 Gr96068kiLmHNraNQceydaSOSWuQdpTPiKlc3hLrxF0wZN/hu8i+sI/mh03psFHjOJ8bTn6lDHh
 0dk4=
X-Gm-Gg: ASbGnctz3dSTmLYDkDpbtCKDMeaUeD4cAdOuL1RFKpF2N80WWvwpvkX6oiu5f6DH0zV
 jnV4iO0/jQUpnmuQZFW+CSMHghO0vmUjdKZxKEKFi0NA5E4vdq7vwWfd8k2XNHt8ODp/Fk9Rs/W
 9gWUuBeYqDAK+TwsROTyMaguoOFdhaPjbK0ktMLvnZ3BYibPtJlGM3KuBbODha+C0Jnix2KXXm0
 owDRRGLRRVLrRUmlbzfBj1OS+Yu2qiN7xnMfbW8sBygnp7+WVekLo/Xm/+/iHLnEbx5+8C+Z0fy
 rh6lRTGDj1XpXusp9IfKw0NHy4qi3s57fpkTigUSOX8t4ED77aEiXmtYIjmep+lcUUKgjzHZFjY
 /1nib+as/HGfyam31pvOOK45CIGUp+cA7KIHGaabHEhNvZV3V
X-Google-Smtp-Source: AGHT+IFke1rWcERTnVfsNfizWhdI48Cb7B3RZHpWRa/Xxw+Wp8UABWvnwAmyc1QGgSwsUq1m6VPQow==
X-Received: by 2002:a17:90b:4d07:b0:313:1e9d:404b with SMTP id
 98e67ed59e1d1-31c2fd26befmr5297301a91.2.1752077940381; 
 Wed, 09 Jul 2025 09:19:00 -0700 (PDT)
Received: from justonli3.c.googlers.com
 (206.138.168.34.bc.googleusercontent.com. [34.168.138.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8455babasm140538685ad.107.2025.07.09.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 09:18:59 -0700 (PDT)
Message-ID: <858a70c5779027572476e02fb7aa580cf7e829f9.camel@chromium.org>
Subject: Re: [PATCH v5 2/2] drm/xe/bo: add GPU memory trace points
From: Juston Li <justonli@chromium.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko
 Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang	 <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 09 Jul 2025 09:18:58 -0700
In-Reply-To: <dqatebbwn3ek7nfguu2l2b4awc7a4pqlizuh5cvaa5jfqmiakv@z3voepobjgul>
References: <20250707203849.545312-1-justonli@chromium.org>
 <20250707203849.545312-2-justonli@chromium.org>
 <dqatebbwn3ek7nfguu2l2b4awc7a4pqlizuh5cvaa5jfqmiakv@z3voepobjgul>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-07-08 at 15:29 -0500, Lucas De Marchi wrote:
> On Mon, Jul 07, 2025 at 01:38:23PM -0700, Juston Li wrote:
> > Add TRACE_GPU_MEM tracepoints for tracking global GPU memory usage.
> >=20
> > These are required by VSR on Android 12+ for reporting GPU driver
> > memory
> > allocations.
> >=20
> > v5:
> > - Drop process_mem tracking
> > - Set the gpu_id field to dev->primary->index (Lucas, Tvrtko)
> > - Formatting cleanup under 80 columns
> >=20
> > v3:
> > - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
> > =C2=A0 per-driver Kconfig (Lucas)
> >=20
> > v2:
> > - Use u64 as preferred by checkpatch (Tvrtko)
> > - Fix errors in comments/Kconfig description (Tvrtko)
> > - drop redundant "CONFIG" in Kconfig
> >=20
> > Signed-off-by: Juston Li <justonli@chromium.org>
> > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > ---
> > drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 22 ++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 8 ++++++++
> > 2 files changed, 30 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 4e39188a021ab..950eef514c11c 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -19,6 +19,8 @@
> >=20
> > #include <kunit/static_stub.h>
> >=20
> > +#include <trace/events/gpu_mem.h>
> > +
> > #include "xe_device.h"
> > #include "xe_dma_buf.h"
> > #include "xe_drm_client.h"
> > @@ -418,6 +420,24 @@ static void xe_ttm_tt_account_subtract(struct
> > xe_device *xe, struct ttm_tt *tt)
> > 		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt-
> > >num_pages, 0);
> > }
> >=20
> > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > +static void update_global_total_pages(struct ttm_device *ttm_dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long num_pages)
> > +{
>=20
> wouldn't it be better to move the ifdef inside the function?
> Any compiler would remove the empty call regardless of the inline
> annotation, so I think this would make it less error prone if we
> change
> function signature.
>=20
> No need to send a new version, I can move that while applying
> if agreed.

SGTM, thanks!

Juston

> Lucas De Marchi
