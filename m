Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96103A501CC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF1710E66C;
	Wed,  5 Mar 2025 14:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="w0UB8plp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33D810E66C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 14:24:38 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Z7FDd3f5Gz9tSK;
 Wed,  5 Mar 2025 15:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741184673; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2q8nN7MJqKtl0tkmVtTko+Pdx9YkiqMB2pBCshcSF8=;
 b=w0UB8plpsorn3H+FrZOy8xDThKUE2U/4U1gEWfHRW4c3kUg6sC9+TO3LA7nExq+r5cCS3a
 TRgCq336KD75Ygv1iI2vM/sBvPIdmAVgarB8UFzauPkqyPZOlCFrL9ar8KJK2BVG3+AN/Q
 Q0Xqw8L7VvnsJOrHDcMZHv4FS3ytXhP7BOAhU2ATJu7g4ms2WpOHKYv7hf2osI4t7aO+ya
 lBjyk0NyfUGSd78dubk67BH8ODwVPOHwql/DZcjq7zH48WkOjEy3N7dusLL841LId4Pus1
 2NjDtmMwTJLAaccnMYBOejbnanEnXQpEr37fAeXVAs6Rpb3wQk65itDy/YOdTQ==
Message-ID: <063480578505f633baf9025348c7ca96a4816602.camel@mailbox.org>
Subject: Re: [PATCH v7 1/3] drm/sched: Adjust outdated docu for run_job()
From: Philipp Stanner <phasta@mailbox.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Philipp Stanner
 <phasta@kernel.org>,  Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 05 Mar 2025 15:24:29 +0100
In-Reply-To: <Z8hVlc0AgQkNqSGL@archie.me>
References: <20250305130551.136682-2-phasta@kernel.org>
 <20250305130551.136682-3-phasta@kernel.org> <Z8hVlc0AgQkNqSGL@archie.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 919b855d1da4a7cc1d9
X-MBO-RS-META: nj16m44ourjngaxxn1ekcaky1yq917s1
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-03-05 at 20:45 +0700, Bagas Sanjaya wrote:
> On Wed, Mar 05, 2025 at 02:05:50PM +0100, Philipp Stanner wrote:
> > =C2=A0	/**
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @run_job: Called to=
 execute the job once all of the
> > dependencies
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * have been resolved.=
=C2=A0 This may be called multiple times,
> > if
> > -	 * timedout_job() has happened and
> > drm_sched_job_recovery()
> > -	 * decides to try it again.
> > +	 * @run_job: Called to execute the job once all of the
> > dependencies
> > +	 * have been resolved.
> > +	 *
> > +	 * @sched_job: the job to run
> > +	 *
> > +	 * The deprecated drm_sched_resubmit_jobs() (called by
> > &struct
> > +	 * drm_sched_backend_ops.timedout_job) can invoke this
> > again with the
> > +	 * same parameters. Using this is discouraged because it
> > violates
> > +	 * dma_fence rules, notably dma_fence_init() has to be
> > called on
> > +	 * already initialized fences for a second time. Moreover,
> > this is
> > +	 * dangerous because attempts to allocate memory might
> > deadlock with
> > +	 * memory management code waiting for the reset to
> > complete.
> > +	 *
> > +	 * TODO: Document what drivers should do / use instead.
>=20
> No replacement? Or bespoke/roll-your-own functionality as a must?
>=20
> Confused...

We will document this in a follow-up. I'm trying for 2 months now [1]
just to fix up some broken, outdated documentation =E2=80=93 and that in a
component that *I* am maintaining.

It's very difficult to reach the relevant stakeholders, and I really
want to unblock this series.

Feel free to provide a proposal for the TODO based on this series or
jump into the discussion here [2].

Otherwise I will propose a fix for the TODO some time the next weeks.

P.


[1] https://lore.kernel.org/dri-devel/20250109133710.39404-2-phasta@kernel.=
org/
[2] https://lore.kernel.org/dri-devel/688b5665-496d-470d-9835-0c6eadfa5569@=
gmail.com/


