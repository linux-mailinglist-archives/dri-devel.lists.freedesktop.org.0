Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6937167A0E9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 19:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC58110E095;
	Tue, 24 Jan 2023 18:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED2C10E095
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 18:08:55 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id 5so10218879plo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wgYgzfR3+OynP8cMOsk/q5F0cHBnok//aWwAPG3DTWA=;
 b=m9+9ne3EvvdnJ5eqGLlh3J+I5Ls1sGe9rfp3BELPb/i2u6B/voU/b7eedCURjD8jE6
 1UVEpsRaLMkrI8r8/suRgtu/PO/9s1OFbdXJSwiKe1pEF4AWlquE7XAmT4EflbFtmSiv
 8sseq4sG7M2WAQqmgMlfudkEqp9EGttuTR5Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wgYgzfR3+OynP8cMOsk/q5F0cHBnok//aWwAPG3DTWA=;
 b=jBJ8up97Behqwk4S4OubCqH2jTq3932QtIuS6WngscLxpt8VNHd955WR9jTeLI9izF
 ikXl/+Y+IlsSTevf62qsot2IJCF84RJAjXM4JG1s2jAWvje8TYpUrZqijqzSOIl9rujV
 7qXgCzQ00+dBeeoVXYJLlGhnahNzm6phyZzQRD2UoheMhSruIqLeM37TDT17ejZ8QYAO
 Iz3sT/dFUKVWjrYRe5m3Nfu7ZqCWHqEolIoqyv7RK24a0CQWjf3qJ5IfpA3EgVIYhnFt
 WEA1L6r8CFzA/xpPCOm8FSn80HbMbZI+EnBudH7ahH64gzTgT0YShBZOlbepabX5FR/T
 yg+w==
X-Gm-Message-State: AO0yUKWG6NXqi6iDcM2W1UT0VPCCarUCpu1ZZDSz9m+VV8tjMgg3rzNs
 68jW+/CnBft9nGKhcpynCbZOgg==
X-Google-Smtp-Source: AK7set99tCwP+rPNJQ9KCuU8vwT6nSyGGdh9oMzTQXZ/ovRpuZdqjMGYlceJR+u5Rlqxk6CIIr/jPQ==
X-Received: by 2002:a17:902:f550:b0:196:1682:6fe with SMTP id
 h16-20020a170902f55000b00196168206femr2813374plf.64.1674583735433; 
 Tue, 24 Jan 2023 10:08:55 -0800 (PST)
Received: from ?IPv6:2620:15c:90:200:7ed:e6f9:bf19:76a3?
 ([2620:15c:90:200:7ed:e6f9:bf19:76a3])
 by smtp.gmail.com with ESMTPSA id
 j75-20020a636e4e000000b00476c2180dbcsm1742555pgc.29.2023.01.24.10.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:08:54 -0800 (PST)
Message-ID: <8fcafb5a34aba0a0080cd19a3a6c01ed8af1d3b8.camel@chromium.org>
Subject: Re: [PATCH v6 5/6] drm/i915/pxp: Trigger the global teardown for
 before suspending
From: Juston Li <justonli@chromium.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
Date: Tue, 24 Jan 2023 10:08:52 -0800
In-Reply-To: <Y8/2iTQ1t3siFHKx@intel.com>
References: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
 <20230124053150.3543928-6-alan.previn.teres.alexis@intel.com>
 <Y8/2iTQ1t3siFHKx@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-1 
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Vivi@freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-01-24 at 10:17 -0500, Rodrigo Vivi wrote:
> On Mon, Jan 23, 2023 at 09:31:49PM -0800, Alan Previn wrote:
> > A driver bug was recently discovered where the security firmware
> > was
> > receiving internal HW signals indicating that session key
> > expirations
> > had occurred. Architecturally, the firmware was expecting a
> > response
> > from the GuC to acknowledge the event with the firmware side.
> > However the OS was in a suspended state and GuC had been reset.
> >=20
> > Internal specifications actually required the driver to ensure
> > that all active sessions be properly cleaned up in such cases where
> > the system is suspended and the GuC potentially unable to respond.
> >=20
> > This patch adds the global teardown code in i915's suspend_prepare
> > code path.
> >=20
> > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > Reviewed-by: Juston Li <justonli@chromium.org>
>=20
> it should probably contain some revision history above so the
> reviewer can know what changed from the time he reviewed and now.
>=20
> it looks we have another function that I don't remember...
> Juston, could you please confirm your review stands in this version?
> if so feel free to add my ack with that.

Sure, v6 is:
Reviewed-by: Juston Li <justonli@chromium.org>

Appreciate the reviews/revisions Rodrigo and Alan!

>=20
> > ---
> > =C2=A0drivers/gpu/drm/i915/pxp/intel_pxp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 65
> > +++++++++++++++++---
> > =C2=A0drivers/gpu/drm/i915/pxp/intel_pxp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/i915/pxp/intel_pxp_pm.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/i915/pxp/intel_pxp_session.c |=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/i915/pxp/intel_pxp_session.h |=C2=A0 5 ++
> > =C2=A05 files changed, 66 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> > b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> > index cfc9af8b3d21..9d4c7724e98e 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> > @@ -270,6 +270,60 @@ static bool pxp_component_bound(struct
> > intel_pxp *pxp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return bound;
> > =C2=A0}
> > =C2=A0
> > +static int __pxp_global_teardown_final(struct intel_pxp *pxp)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!pxp->arb_is_valid)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * To ensure synchronous and=
 coherent session teardown
> > completion
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * in response to suspend or=
 shutdown triggers, don't use a
> > worker.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_pxp_mark_termination_i=
n_progress(pxp);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_pxp_terminate(pxp, fal=
se);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!wait_for_completion_tim=
eout(&pxp->termination,
> > msecs_to_jiffies(250)))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -ETIMEDOUT;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > +}
> > +
> > +static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (pxp->arb_is_valid)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The arb-session is curren=
tly inactive and we are doing a
> > reset and restart
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * due to a runtime event. U=
se the worker that was designed
> > for this.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pxp_queue_termination(pxp);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!wait_for_completion_tim=
eout(&pxp->termination,
> > msecs_to_jiffies(250)))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -ETIMEDOUT;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > +}
> > +
> > +void intel_pxp_end(struct intel_pxp *pxp)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_i915_private *i91=
5 =3D pxp->ctrl_gt->i915;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_wakeref_t wakeref;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!intel_pxp_is_enabled(px=
p))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0wakeref =3D intel_runtime_pm=
_get(&i915->runtime_pm);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&pxp->arb_mutex);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (__pxp_global_teardown_fi=
nal(pxp))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0drm_dbg(&i915->drm, "PXP end timed out\n");
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&pxp->arb_mutex=
);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_pxp_fini_hw(pxp);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_runtime_pm_put(&i915->=
runtime_pm, wakeref);
> > +}
> > +
> > =C2=A0/*
> > =C2=A0 * the arb session is restarted from the irq work when we receive
> > the
> > =C2=A0 * termination completion interrupt
> > @@ -286,16 +340,9 @@ int intel_pxp_start(struct intel_pxp *pxp)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&pxp->arb_mu=
tex);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (pxp->arb_is_valid)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto unlock;
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pxp_queue_termination(pxp);
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!wait_for_completion_tim=
eout(&pxp->termination,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0msecs_to_jiffies(250))) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D -ETIMEDOUT;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D __pxp_global_teardow=
n_restart(pxp);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto unlock;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* make sure the compil=
er doesn't optimize the double
> > access */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0barrier();
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > index 9658d3005222..3ded0890cd27 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > @@ -27,6 +27,7 @@ void
> > intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
> > =C2=A0void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32
> > arb_session_id);
> > =C2=A0
> > =C2=A0int intel_pxp_start(struct intel_pxp *pxp);
> > +void intel_pxp_end(struct intel_pxp *pxp);
> > =C2=A0
> > =C2=A0int intel_pxp_key_check(struct intel_pxp *pxp,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
struct drm_i915_gem_object *obj,
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > index 892d39cc61c1..e427464aa131 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> > @@ -16,7 +16,7 @@ void intel_pxp_suspend_prepare(struct intel_pxp
> > *pxp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!intel_pxp_is_enabl=
ed(pxp))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pxp->arb_is_valid =3D false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_pxp_end(pxp);
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_pxp_invalidate(px=
p);
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > index 74ed7e16e481..448cacb0465d 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > @@ -115,11 +115,11 @@ static int
> > pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > =C2=A0}
> > =C2=A0
> > -static void pxp_terminate(struct intel_pxp *pxp)
> > +void intel_pxp_terminate(struct intel_pxp *pxp, bool
> > post_invalidation_needs_restart)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pxp->hw_state_invalidated =
=3D true;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pxp->hw_state_invalidated =
=3D
> > post_invalidation_needs_restart;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * if we fail to submit=
 the termination there is no point
> > in waiting for
> > @@ -167,7 +167,7 @@ static void pxp_session_work(struct work_struct
> > *work)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (events & PXP_TERMIN=
ATION_REQUEST) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0events &=3D ~PXP_TERMINATION_COMPLETE;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pxp_terminate(pxp);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0intel_pxp_terminate(pxp, true);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (events & PXP_TERMIN=
ATION_COMPLETE)
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> > b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> > index 903ac52cffa1..ba5788127109 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
> > @@ -12,9 +12,14 @@ struct intel_pxp;
> > =C2=A0
> > =C2=A0#ifdef CONFIG_DRM_I915_PXP
> > =C2=A0void intel_pxp_session_management_init(struct intel_pxp *pxp);
> > +void intel_pxp_terminate(struct intel_pxp *pxp, bool
> > post_invalidation_needs_restart);
> > =C2=A0#else
> > =C2=A0static inline void intel_pxp_session_management_init(struct
> > intel_pxp *pxp)
> > =C2=A0{
> > =C2=A0}
> > +
> > +static inline void intel_pxp_terminate(struct intel_pxp *pxp, bool
> > post_invalidation_needs_restart)
> > +{
> > +}
> > =C2=A0#endif
> > =C2=A0#endif /* __INTEL_PXP_SESSION_H__ */
> > --=20
> > 2.39.0
> >=20

