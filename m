Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANi3GqKJqWki+gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:48:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EFE212BED
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDC210EB97;
	Thu,  5 Mar 2026 13:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="J56KQIo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFFC10EB97
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mvhTHlFj/Wn5p75dEmIsaJdwjjPiqG0zPxLcUVvYHKI=; b=J56KQIo+AxfsHjKeEBcFpbp5WV
 04gmg5F2kv+5luNsp/mzFwj94x5AtKRlhRWe654si2XWeUfj3+WC8F7tGoJqUN6yDbjaa6xxaIc4o
 zvQcPPFhLLDfdSipZ7S2ssSgIe8lULaGu4Fr+tvgpcDEjchYGVy4OGWT7WaQIT+wF1Uivl41WAScX
 HTIO9uQQ7asQwBMJ8CQ0Y0zhXJzw1MhrGqrX6ajexH25X+gPlloezce01cZ1aaEqa9zOPUL1D+9/n
 6ZRKUWCUwluSMwuOHvoC9S5UYCxxCH76b2W+nzTBLLM+RW1D+mGEpWCMdas39jmeAL2vZoX/7AUXe
 cI3RYLXg==;
Received: from ip160.dynamic.igalia.com ([192.168.10.160])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vy93f-009Nmt-Ei; Thu, 05 Mar 2026 14:48:07 +0100
Message-ID: <a5b7ea99027b57d175060b9a48938e88730cadb8.camel@igalia.com>
Subject: Re: [PATCH 5/6] drm/v3d: Attach per-fd reset counters to v3d_stats
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Melissa Wen <mwen@igalia.com>, Maxime Ripard
 <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Date: Thu, 05 Mar 2026 14:48:07 +0100
In-Reply-To: <973825be-0a26-45ac-b855-f16a47c9ae7e@igalia.com>
References: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
 <20260217-v3d-reset-locking-improv-v1-5-0db848016869@igalia.com>
 <3c27ff4ab7e18c7d2d3208a46f18ced2d2ca6957.camel@igalia.com>
 <73c11615-a459-40a4-be5d-8535040753d5@igalia.com>
 <052f80f50c0f6e57f5b3b5c3494fb70651ef22bf.camel@igalia.com>
 <e7c2447d-d19c-4e67-a4e5-eec6ced0fbda@igalia.com>
 <b61de2d523fc2b981eb969f50abc9174c0a17c03.camel@igalia.com>
 <5de3b3a5-2467-41a4-9865-1d939bbae831@igalia.com>
 <37df79b2681f4e503bdd8a94f8836b653d0bd749.camel@igalia.com>
 <973825be-0a26-45ac-b855-f16a47c9ae7e@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
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
X-Rspamd-Queue-Id: C2EFE212BED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:tvrtko.ursulin@igalia.com,m:mwen@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[itoral@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.943];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[itoral@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action

El jue, 05-03-2026 a las 09:16 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Hi Iago and Tvrtko,
>=20
> Thanks for the reviews!
>=20
> On 05/03/26 08:21, Iago Toral wrote:
> > El jue, 05-03-2026 a las 10:50 +0000, Tvrtko Ursulin escribi=C3=B3:
> > >=20
> > > On 05/03/2026 10:35, Iago Toral wrote:
> > > > El jue, 05-03-2026 a las 10:25 +0000, Tvrtko Ursulin escribi=C3=B3:
> > > > >=20
> > > > > On 05/03/2026 10:18, Iago Toral wrote:
> > > > > > El jue, 05-03-2026 a las 09:34 +0000, Tvrtko Ursulin
> > > > > > escribi=C3=B3:
> > > > > > >=20
> > > > > > > On 05/03/2026 09:15, Iago Toral wrote:
> > > > > > > > El mar, 17-02-2026 a las 09:18 -0300, Ma=C3=ADra Canal
> > > > > > > > escribi=C3=B3:
> > > > > > > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > > > >=20
> > > > > > > > > To remove the file_priv NULL-ing dance needed to
> > > > > > > > > check if
> > > > > > > > > the
> > > > > > > > > file
> > > > > > > > > descriptor is open, move the per-fd reset counter
> > > > > > > > > into
> > > > > > > > > v3d_stats,
> > > > > > > > > which
> > > > > > > > > is heap-allocated and refcounted, outliving the fd as
> > > > > > > > > long as
> > > > > > > > > jobs
> > > > > > > > > reference it.
> > > > > > > > >=20
> > > > > > > > > This change allows the removal of the last
> > > > > > > > > `queue_lock`
> > > > > > > > > usage
> > > > > > > > > to
> > > > > > > > > protect
> > > > > > > > > `job->file_priv` and avoids possible NULL ptr
> > > > > > > > > dereference
> > > > > > > > > issues
> > > > > > > > > due
> > > > > > > > > to
> > > > > > > > > lifetime mismatches.
> > > > > > > > >=20
> > > > > > > > > Also, to simplify locking, replace both the global
> > > > > > > > > and
> > > > > > > > > per-fd
> > > > > > > > > locked
> > > > > > > > > reset counters with atomics.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Tvrtko Ursulin
> > > > > > > > > <tvrtko.ursulin@igalia.com>
> > > > > > > > > Co-developed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > > > > > > > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > > > > > > > ---
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_drv=
.c=C2=A0=C2=A0 | 20 ++++-------
> > > > > > > > > -----
> > > > > > > > > ----
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_drv=
.h=C2=A0=C2=A0 | 14 ++++-------
> > > > > > > > > ---
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_sch=
ed.c |=C2=A0 9 ++-------
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A03 files changed, 10 inserti=
ons(+), 33
> > > > > > > > > deletions(-)
> > > > > > > > >=20
> > > > > > > > > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> > > > > > > > > b/drivers/gpu/drm/v3d/v3d_drv.c
> > > > > > > > > index
> > > > > > > > > aafb402c6ac3118a57df9fc0a0d21d35d48e3b2c..4e77f480814
> > > > > > > > > 5df2
> > > > > > > > > 1746
> > > > > > > > > ff4b
> > > > > > > > > 7058
> > > > > > > > > 089d0d161e3fc 100644
> > > > > > > > > --- a/drivers/gpu/drm/v3d/v3d_drv.c
> > > > > > > > > +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> > > > > > > > > @@ -110,13 +110,13 @@ static int
> > > > > > > > > v3d_get_param_ioctl(struct
> > > > > > > > > drm_device *dev, void *data,
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0		args->value =3D
> > > > > > > > > !!drm_gem_get_huge_mnt(dev);
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0		return 0;
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	case DRM_V3D_PARAM_GLOBAL_=
RESET_COUNTER:
> > > > > > > > > -		mutex_lock(&v3d->reset_lock);
> > > > > > > > > -		args->value =3D v3d->reset_counter;
> > > > > > > > > -		mutex_unlock(&v3d->reset_lock);
> > > > > > > > > +		args->value =3D atomic_read(&v3d-
> > > > > > > > > > reset_counter);
> > > > > > > >=20
> > > > > > > > Don't we still need to take the reset lock here?
> > > > > > > > Otherwise
> > > > > > > > there
> > > > > > > > would
> > > > > > > > be a chance that we read the counter while a reset is
> > > > > > > > in
> > > > > > > > flight,
> > > > > > > > no?
> > > > > > >=20
> > > > > > > I don't see that it would make a difference but maybe I
> > > > > > > am
> > > > > > > not
> > > > > > > seeing
> > > > > > > your concern. It uses atomic_t so the increment versus
> > > > > > > read
> > > > > > > is
> > > > > > > fine.
> > > > > > > Are
> > > > > > > you maybe saying the v3d ABI guarantees reset is 100%
> > > > > > > done
> > > > > > > (so
> > > > > > > not in
> > > > > > > progress, for some definition of progress, because
> > > > > > > hardware
> > > > > > > reset
> > > > > > > is
> > > > > > > done by then, only re-submit and re-start of the software
> > > > > > > state
> > > > > > > is
> > > > > > > poending) if userspace observes an increased global reset
> > > > > > > counter?
> > > > > > > That
> > > > > > > would be surprising and I don't see how it could make a
> > > > > > > practical
> > > > > > > difference, but perhaps could be mitigated by moving the
> > > > > > > atomic_inc
> > > > > > > to
> > > > > > > the end of v3d_gpu_reset_for_timeout(). Or still taking
> > > > > > > the
> > > > > > > lock
> > > > > > > as
> > > > > > > you say.
> > > > > >=20
> > > > > > My concern is just that it is possible for the query and
> > > > > > the
> > > > > > reset
> > > > > > to
> > > > > > race and that I think it would make sense for the counter
> > > > > > query
> > > > > > to
> > > > > > include in-flight resets (since what apps really care about
> > > > > > is
> > > > > > whether
> > > > > > a GPU reset happened not if it completed the reset
> > > > > > process).
> > > > >=20
> > > > > Then there is no problem I think. Mutex lock or not, in both
> > > > > cases it
> > > > > is
> > > > > not guaranteed reset either is not in progress at the time of
> > > > > the
> > > > > ioctl.
> > > > > Even if the ioctl does not return an increased counter
> > > > > perhaps
> > > > > the
> > > > > reset
> > > > > handler is running but hasn't grabbed the mutex yet.
> > > > >=20
> > > > >=20
> > > >=20
> > > > That's true, but then I wonder: what is the rationale for still
> > > > taking
> > > > the lock when resolving the DRM_V3D_PARAM_CONTEXT_RESET_COUNTER
> > > > query?
> > >=20
> > > Good question and I asked myself the same this morning. For full
> > > disclosure I wrote this patch back in Sep'25.. so between then
> > > and
> > > now I
> > > forgot a thing or two.
> > >=20
> > > In the latest local branch that I can find I had it without the
> > > mutex
> > > even for DRM_V3D_PARAM_CONTEXT_RESET_COUNTER. Maira, was there a
> > > newer
> > > version somewhere which I forgot about?
> > >=20
> > > Mutex would make sense if there was any chance for paired jobs
> > > across
> > > two engines to get reset at the same time. I think Maira was
> > > explaining
> > > to me that could be a possibility, maybe with some future rework.
> > > Unless
> > > I am confusing things.
> > >=20
> > > In any case, in the current upstream v3d it indeed looks to be
> > > safe
> > > with
> > > no mutex.
> >=20
> > Ok, thanks for checking the history here! Let's see if Ma=C3=ADra has
> > anything to add to this so we have the full picture and then we can
> > decide if we can also drop the remaining lock (and I guess in that
> > case
> > the reset mutex too).
>=20
> Initially, I was trying to make sure we had some consistency between
> queues, so that the result for the user is a reliable snapshot from
> all
> queues. So, for example, let's say we are iterating the loop and we
> reached q=3D3 (CSD) and the BIN queue reset counter is incremented. In
> such scenario, the user would get an outdated information.

I am not sure that we strictly need to handle this scenario, but I am
okay with keeping the lock for this. Maybe we can add a small comment
explaining the rationale. With that patch 5 is also:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>


>=20
> If we take the lock, this scenario wouldn't happen, as the timeout
> hook
> wouldn't be able to take the lock. Feel free to correct me if this
> train
> of thought is mistaken (or if you believe this level of consistency
> is
> not needed).
>=20
> About removing the reset mutex, I don't believe it's possible, as we
> need it to make sure that two queues are not resetting at the same
> time.
> Also, I'll use this mutex (and the reset counter) in a future patch
> to
> address redundant resets that happens when two queues are competing
> for
> the `reset_lock`.

Makes sense, thanks Ma=C3=ADra.

Iago

>=20
> Best regards,
> - Ma=C3=ADra
>=20
>=20
>=20

