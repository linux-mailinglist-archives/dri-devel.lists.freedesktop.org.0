Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C575499E627
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 13:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC4D10E56D;
	Tue, 15 Oct 2024 11:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cR4fPoKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2424010E023
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728992342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpsDNCZ1eZFZ9EexISZS/sPfqVGFIKyLibyDTZSykfM=;
 b=cR4fPoKM8kJnGDliCRc98gtYbtdlaj2aYa2rgnCLGB41Gwdco3u8WLq8SorzywBR4zta2a
 BmCu86oxYL/nT1f44TqflAU+jtT9DlX/Q6acIjAMIWJaabXeOj2RTd/rK536/X96Deq+Jc
 bDH3Zj1dypODfXjpqlzkahEb9r2UciY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-ZMid23DjN8O_-TxwOz9d9g-1; Tue, 15 Oct 2024 07:39:01 -0400
X-MC-Unique: ZMid23DjN8O_-TxwOz9d9g-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7b114c0b155so1233836985a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 04:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728992341; x=1729597141;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tpsDNCZ1eZFZ9EexISZS/sPfqVGFIKyLibyDTZSykfM=;
 b=ULS9ofBADbp/jhlqAC/IoPTmCoLObBvAzbyU5oLrddzbxcgQkw+ImSZl55B8Aio/9Q
 1fsdEj1SzxV3J86+svDuugV496ll6SxFq9pU6WUlDYgdTzKh4ryUhL60saN1JkMASkHZ
 v2a8L8TOOaDDFVY1IQVdy2OOrZQEMt9Df6NYJSJThDBza+wgdTmmR79vixRgwuKfUupq
 3K+M4+lwcj3InFhX31De/pGlYfbsNTRWVZ8xv7Rk0X+CFnXKQaBGV3NJGEV2hTcF0yja
 qV6eXI8E/TtqliPBfgaROqCCRnDxmJ0/GI5l+pA0FJ0dA8LnWipmktB52FOImQvQYxpp
 MZXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoEve0cKCbYfzY+HFJGwDzP0viHET4nOjVKNEJ9+rGKEqYSfLNlEeJG+8w2yV/hTKoYCiPLMneGCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYJH8por0Kz1zDmwYVyqJVs0RfTJMFFJ7FPi/IjwzuiPrP+SYo
 OPqceaBGweMuLNwG6/M15yr1ihs9w2MzjYc+pa7IvLL3IcuH17FdQRj1LIHEmcDD/bMX9nxiTx1
 e8TORAk6ewa7MNqCl+jipvcca9+xLvarRZCeVKK8iEJQEWP1WvgSNjNdhUfNvgv3DYg==
X-Received: by 2002:a05:620a:2944:b0:7a9:b71c:82b3 with SMTP id
 af79cd13be357-7b120fce1c3mr1724982385a.36.1728992340724; 
 Tue, 15 Oct 2024 04:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpzaOG/W7GgnDcUGKwqqqUfjwSnehiyL/FkIf06rghDKxSI4ki2HL2Elaq18kGKunCSdpXuQ==
X-Received: by 2002:a05:620a:2944:b0:7a9:b71c:82b3 with SMTP id
 af79cd13be357-7b120fce1c3mr1724978385a.36.1728992340306; 
 Tue, 15 Oct 2024 04:39:00 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b136167139sm59907285a.26.2024.10.15.04.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 04:38:59 -0700 (PDT)
Message-ID: <33ebe52c5df76611451685261f046d77efc44134.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/sched: Optimise drm_sched_entity_push_job
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Tvrtko Ursulin
 <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Luben
 Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Date: Tue, 15 Oct 2024 13:38:57 +0200
In-Reply-To: <a3cb9eba-a13e-4f56-8e81-7a06eb655e3b@igalia.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-2-tursulin@igalia.com>
 <0df6b855b0974a88a3f6af42108e2596bd285898.camel@redhat.com>
 <8c038f91-716c-4a3d-8c70-10859d28d77f@igalia.com>
 <587ac0260e9c843ccd0e7d449fc6b6c9270ec741.camel@redhat.com>
 <a3cb9eba-a13e-4f56-8e81-7a06eb655e3b@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Tue, 2024-10-15 at 09:12 +0100, Tvrtko Ursulin wrote:
>=20
> On 15/10/2024 08:11, Philipp Stanner wrote:
> > On Mon, 2024-10-14 at 13:07 +0100, Tvrtko Ursulin wrote:
> > >=20
> > > On 14/10/2024 12:32, Philipp Stanner wrote:
> > > > Hi,
> > > >=20
> > > > On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
> > > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > >=20
> > > > > In FIFO mode We can avoid dropping the lock only to
> > > > > immediately
> > > > > re-
> > > > > acquire
> > > > > by adding a new drm_sched_rq_update_fifo_locked() helper.
> > > > >=20
> > > >=20
> > > > Please write detailed commit messages, as described here [1].
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 1. Describe the problem: current state and=
 why it's bad.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 2. Then, describe in imperative (present t=
ense) form what
> > > > the
> > > > commit
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does about the problem.
> > >=20
> > > Both pieces of info are already there:
> > >=20
> > > 1. Drops the lock to immediately re-acquire it.
> > > 2. We avoid that by by adding a locked helper.
> > > > Optionally, in between can be information about why it's solved
> > > > this
> > > > way and not another etc.
> > > >=20
> > > > Applies to the other patches, too.
> > > >=20
> > > >=20
> > > > [1]
> > > > https://www.kernel.org/doc/html/latest/process/submitting-patches.h=
tml#describe-your-changes
> > >=20
> > > Thanks I am new here and did not know this.
> > >=20
> > > Seriosuly, lets not be too blindly strict about this because it
> > > can
> > > get
> > > IMO ridiculous.
> > >=20
> > > One example when I previously accomodated your request is patch
> > > 3/5
> > > from
> > > this series:
> > >=20
> > > """
> > > Current kerneldoc for struct drm_sched_rq incompletely documents
> > > what
> > > fields are protected by the lock.
> > >=20
> > > This is not good because it is misleading.
> > >=20
> > > Lets fix it by listing all the elements which are protected by
> > > the
> > > lock.
> > > """
> > >=20
> > > While this was the original commit text you weren't happy with:
> > >=20
> > > """
> > > drm/sched: Re-order struct drm_sched_rq members for clarity
> > >=20
> > > Lets re-order the members to make it clear which are protected by
> > > the
> > > lock
> > > and at the same time document it via kerneldoc.
> > > """
> > >=20
> > > I maintain the original text was passable.
> > >=20
> > > On top, this was just a respin to accomodate the merge process.
> > > All
> > > approvals were done and dusted couple weeks or so ago so asking
> > > for
> > > yet
> > > another respin for such trivial objections is not great.
> >=20
> > I understand that you're unhappy, but please understand the
> > position
> > I'm coming from. As you know, since you sent these patches within a
> > different series (and, thus, since I reviewed them), I was trusted
> > with
> > co-maintaining this piece of shared infrastructure.
> >=20
> > And since you've worked on it a bit now, I suppose you also know
> > that
> > the GPU Scheduler is arguably in quite a bad shape, has far too
> > little
> > documentation, has leaks, maybe race conditions, parts *where the
> > locking rules are unclear* and is probably only fully understood by
> > a
> > small hand full of people. I also argue that this is a *very*
> > complicated piece of software.
>=20
> We already went over that and agreed. Not least I agreed the base is=20
> shaky since few years=C2=A0 ago. :)
>=20
> Btw if things align, I hope you will at some point see a follow up=20
> series from me which makes some significant simplifications and=20
> improvements at the same time.

Cool, good to hear!
(Would be even cooler if simplifications and improvements can be
delivered through separate patch series to be easier to review etc.)

> > So I might be or appear to be a bit pedantic, but I'm not doing
> > that to
> > terrorize you, but because I want this thing to become well
> > documented,
> > understandable, and bisectable. Working towards a canonical, idiot-
> > proof commit style is one measure that will help with that.
> >=20
> > I want to offer you the following: I can be more relaxed with
> > things
> > universally recognized as trivial (comment changes, struct member
> > reordering) =E2=80=93 but when something like a lock is touched in any =
way,
> > we
> > shall document that in the commit message as canonically as
> > possible,
> > so someone who's less experienced and just bisected the commit
> > immediately understands what has been done (or rather: was supposed
> > to
> > be done).
>=20
> So how would you suggest to expand this commit text so it doesn't
> read=20
> too self-repeating?

My issue with this particular commit message is mainly that it doesn't
make it obvious what the patch is supposed to do. So one can make it
quicker and better to review by detailing it a bit more, so the
reviewer then can compare commit message vs. what the code does. It
seems to me for example that the actual optimization is being done in
drm_sched_entity_push_job(), and drm_sched_entity_pop_job() had to be
ported, too, for correctness

Another small thing that might be cool is something that makes it a bit
more obvious that this is an optimization, not a fix.

So I would probably write:

"So far, drm_sched_rq_update_fifo() automatically takes
drm_sched_entity.rq_lock. For DRM_SCHED_POLICY_FIFO, this is
inefficient because that lock is then taken, released and retaken in
drm_sched_entity_push_job().

Improve performance by moving the locking out of
drm_sched_rq_update_fifo()."

Not that much longer but makes it far more obvious what shall be
achieved where :]


(Let me read through the other patches briefly. Then we should be good
with v2 of this series.. or would it be v3 then?)

Thanks,
P.


>=20
> Regards,
>=20
> Tvrtko
>=20

