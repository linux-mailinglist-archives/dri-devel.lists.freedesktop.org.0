Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430FA0B179
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CEE10E5B3;
	Mon, 13 Jan 2025 08:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xs+WvjW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E005B10E5B3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736757806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//d5wi9/EdmI+fVVzxJHzPhIlbwreeTF/f4oDiSFxCE=;
 b=Xs+WvjW09QevcAbtEQdqTQvKopo/kUp6QFgcPFxUEK/vYwwxNCEmUd/D23jJYtyaVE64RW
 R8TesvhJcOMdN4dr8jojoJM6oINA8qkug2Zo21xpOg+Z1/9wtk3FWFY4dpokTggrktjSXt
 s1bKuuImVcQG6JrI7qJ94kZ1C8deJcY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-DEpYAQ5zMvSwGEwbVlP74w-1; Mon, 13 Jan 2025 03:43:23 -0500
X-MC-Unique: DEpYAQ5zMvSwGEwbVlP74w-1
X-Mimecast-MFC-AGG-ID: DEpYAQ5zMvSwGEwbVlP74w
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-216728b170cso76400205ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 00:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736757802; x=1737362602;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//d5wi9/EdmI+fVVzxJHzPhIlbwreeTF/f4oDiSFxCE=;
 b=uBZdPxTj4QkhwiLhhm5iSuQsHM1Y8T2qlk4czTQwBU/bWgDnukvoDCukFSwaW5Qv8z
 AGi++x98A9OlZFB681uNFl1qAclkeqTws2ucrVHGkLH6Hlcv3SPkEUwgdgIaG+v5CI4a
 bFdKP/g4sDnKVIFrf0dSaPLt5pP50QM6/yQsqgN5l89WF1TSzIXIgQProDZSW56sXtGy
 NBfQINJDchVpYnQnpmi3+Jhbs38Jqxq28OIg3PS5wroGMrP5KGfuFzqGekmaGLhibtck
 yWsM7En9xWu+FaKtrnpr3yD8rBWKiMF8qcYh2A0NSeFcuIqVT4TxVO7Jp5A/JqZO8akg
 odQQ==
X-Gm-Message-State: AOJu0YxcUWADeijR24Af8eZ4JWh2xJ6/RNjP0Y53GlhsIadgDrFizR2E
 1H6yt/18CH6hugnRotrxILhHXLvQSCocNrub36NI1ROimFsIzLo3WCVSy0hDnAspX/Jjoaq1lgr
 bzgqaNxQ+rg0JgxuT2SJdQ7WJjXh+zJHyIbCwCOO3bSz6qS6HPdayMLXdXbB3wsjz4w==
X-Gm-Gg: ASbGncvp+herk9zTK83iY8djdaC5baVeJwtQkVahiep/MpEVSAIgWZSFvHm9t11QbFN
 XghXK/sR/WtO66Jr1gWu3VwWN+kLvEGfVHyrDykiQwbX8VJ/RNEnq0Vu52ZfMpxx3k7DpXGCNod
 cMjcHpmepqdDFSWHXBEcBsb9mHZ311yNE6uGEf9K8dMX9W2Z7t2pCZnAR1ucH6XLLgJYGYi+VTV
 Dxuy7171Ue1Wdzc4a232ZN6h+D7zai6tZhfa7kxwJ6cQxolHmoKtADmJ5I88lOjOTUtnOnymgEq
 sABAaxk=
X-Received: by 2002:a17:902:f70f:b0:216:2a36:5b2a with SMTP id
 d9443c01a7336-21a83fcc890mr310103925ad.47.1736757802060; 
 Mon, 13 Jan 2025 00:43:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET7vlOZMmOlKp79sXTHWskQAC0dSlxlxxL5k3Rks0LDtj7tszxra4guuOgbVOVGjZY/gcMAg==
X-Received: by 2002:a17:902:f70f:b0:216:2a36:5b2a with SMTP id
 d9443c01a7336-21a83fcc890mr310103685ad.47.1736757801731; 
 Mon, 13 Jan 2025 00:43:21 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f22ef8fsm48838635ad.198.2025.01.13.00.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 00:43:21 -0800 (PST)
Message-ID: <582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Reisner <philipp.reisner@linbit.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Simona
 Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>
Date: Mon, 13 Jan 2025 09:43:12 +0100
In-Reply-To: <eb5f3198-7625-40f4-bc23-cac969664e85@amd.com>
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADGDV=U_7CdkdEiLX9kj9yHsXhwb5zP_eGXpwmrj20cmgzMAtA@mail.gmail.com>
 <eb5f3198-7625-40f4-bc23-cac969664e85@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TUAco38JFZtR9A-iZPVMQSIbvcmnU6VSqlSSq0EkeI8_1736757802
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

+cc Danilo
+cc myself

On Wed, 2025-01-08 at 09:19 +0100, Christian K=C3=B6nig wrote:
> Am 07.01.25 um 16:21 schrieb Philipp Reisner:
> > [...]
> > > > The OOPS happens because the rq member of entity is NULL in
> > > > drm_sched_job_arm() after the call to
> > > > drm_sched_entity_select_rq().
> > > >=20
> > > > In drm_sched_entity_select_rq(), the code considers that
> > > > drb_sched_pick_best() might return a NULL value. When NULL, it
> > > > assigns
> > > > NULL to entity->rq even if it had a non-NULL value before.
> > > >=20
> > > > drm_sched_job_arm() does not deal with entities having a rq of
> > > > NULL.
> > > >=20
> > > > Fix this by leaving the entity on the engine it was instead of
> > > > assigning a NULL to its run queue member.
> > > Well that is clearly not the correct approach to fixing this. So
> > > clearly
> > > a NAK from my side.
> > >=20
> > > The real question is why is amdgpu_cs_ioctl() called when all of
> > > userspace should be frozen?
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > Could the OOPS happen at resume time? Might it be that the kernel
> > activates user-space
> > before all the components of the GPU finished their wakeup?
> >=20
> > Maybe drm_sched_pick_best() returns NULL since no scheduler is
> > ready yet?
>=20
> Yeah that is exactly what I meant. It looks like either the suspend
> or=20
> the resume order is somehow messed up.
>=20
> In other words either some application tries to submit GPU work while
> it=20
> should already been stopped, or it tries to submit GPU work before it
> is=20
> started.
>=20
> > Apart from whether amdgpu_cs_ioctl() should run at this point, I
> > still think the
> > suggested change improves the code. drm_sched_pick_best() can
> > return NULL.
> > drm_sched_entity_select_rq() can handle the NULL (partially).
> >=20
> > drm_sched_job_arm() crashes on an entity that has rq set to NULL.
>=20
> Which is actually not the worst outcome :)
>=20
> With your patch applied we don't immediately crash any more in the=20
> submission path, but the whole system could then later deadlock
> because=20
> the core memory management waits for a GPU submission which never
> returns.
>=20
> That is an even worse situation because you then can't pinpoint any
> more=20
> where that is coming from.
>=20
> > The handling of NULL values is half-baked.
> >=20
> > In my opinion, you should define if drm_sched_pick_best() may put a
> > NULL into
> > rq. If your answer is yes, it might put a NULL there; then, there
> > should be a
> > BUG_ON(!entity->rq) after the invocation of
> > drm_sched_entity_select_rq().
> > If your answer is no, the BUG_ON() should be in
> > drm_sched_pick_best().
>=20
> Yeah good point.
>=20
> We might not want a BUG_ON(), that is only justified when we prevent=20
> further damage (e.g. random data corruption or similar).
>=20
> I suggest using a WARN(!shed, "Submission without activated
> sheduler!").=20
> This way the system has at least a chance of survival should the=20
> scheduler become ready later on.
>=20
> On the other hand the BUG_ON() or the NULL pointer deref should only=20
> kill the application thread which is submitting something before the=20
> driver is resumed. So that might help to pinpoint where the actually=20
> issue is.

As I see it the BUG_ON() would just be a more pretty NULL pointer
deref. If we agree that this is effectively a misuse of the scheduler
API we probably want to add it to make it more pretty, though?

@Philipp:
BTW, I only just discovered this thread by coincidence. Please use
get_maintainer. The scheduler currently has 4 maintainers, and none of
them is on CC.

Danke,
P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > That helps guys with zero domain knowledge, like me, to figure out
> > how
> > this is all
> > supposed to work.
> >=20
> > best regards,
> > =C2=A0 Philipp
>=20

