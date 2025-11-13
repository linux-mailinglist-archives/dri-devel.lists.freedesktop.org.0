Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF86C57069
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 11:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F7910E632;
	Thu, 13 Nov 2025 10:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N9klvBWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB66010E632
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763031367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mh9t0LuoGDAh8OeZZtLCfs0pFp/6Mdmy4en1BoiJC9M=;
 b=N9klvBWC2d2EX725OscbnPUshissVycg76cldroFMWEqZ/H+oPnpyCpRoNwCfZ0jvWYogz
 F7rphVjG6YXCuo4k9KtWpsFQNBTtijX/n1e4GYtBlx6iFX68dXBhm2kXengim4U1/sbqic
 Bmxs5rgGCew7BmmmR+kgZCNl73qQYLw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-cjtEQAhiPMazN28frAIZTg-1; Thu, 13 Nov 2025 05:56:06 -0500
X-MC-Unique: cjtEQAhiPMazN28frAIZTg-1
X-Mimecast-MFC-AGG-ID: cjtEQAhiPMazN28frAIZTg_1763031365
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-429c7b0ae36so376737f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 02:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763031365; x=1763636165;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4fztXb/U7u/bbSmJaptgoHkzXEQww2bfP3rM1LntGtc=;
 b=fKtoOkKjkPl3CTAmtBw5Y3eZrQJ9TlO6+TVVuMud0PhA3eoRvhalDfGgKo6Txbca9i
 Zg6ojc250Hwxu9jhfiEYS30Oe9KkKf/Wq+Cp9sH1erkNRSryIOPNrOiigaeEQO7HP2p1
 cfI9NUaMV8VEYmlquLtgSWLqoicdfnKWfH21g0HJWVK+AfYG5dT8U8fbAjHHDaQGyDyf
 6qsD1mp/Mo/RPh4P/o1ptm+jKs+w/pmSf3rjGv8lqSmlpYn7ivVyCsJMORZOLsL2TfE/
 tyuDbq0Nbs0Q2BAPerQvarbBWLQ8xTcxrOT153na4QoSXFhCbeMKV/gG+pQCjyv08mqf
 neaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp6Pg5/lJLehYhhp1N9cbiRvhQobt7oQQko9BzLcR6Rg7CLRzvfDZ4gKxjnXQJly6IvkTbHpLR8kU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyAXA2c9hW4VwysC5Zdt2LoN7PiFeLZSH3OI3pkOadoskkSVuh
 0LpObbvbixS9QtVk7dpGeIkLphnP47HlsqZekYha28MgNGymw+9kgbhb/SrAHgwTm2XAmD36VAv
 tGDAtnrLcFR9WSXyLAMphVJS1pYR07fGALjtYr1isLnsWmaL75Jq+haAckszKJK12aSIfTA==
X-Gm-Gg: ASbGnctYJ1u3+8RorbLDywCbXASBhKihfIChfbQ12vmiav40WCORf7h+S0IsOfWcqkQ
 C0vmhvtlVum0XWSY5uuIf17ZfsieWMHtdxprI9L3LDVSsR8W2u8gpv7O4Z5R7IOhc90of3lny7V
 OzIfmV2jEghi2Hu+muT3UBnlS412YBM3ZIs68woFP4OBcqcxOmTSiuuGfT1S3mk6IFs2op4CuOQ
 pui+c/vqpWj7NK5pVbSIqKiWXHUR3i/HG8NE6jwAHp4ugrPnyE13YuF0zZ3DdE3q0AIOyiIhYNy
 FvBmeiORQwzewowxb1iwc/iB0t9oxGGJ7HfiEK13Z6xkwDfZX/+pSNWi699vlz1n1ntPAjFN0rk
 gOrToHMOr9Tpbye3G9a43rLj9ZG8Z6lHmyygxOKOzAsn6L7Y=
X-Received: by 2002:a05:6000:24c4:b0:42b:2eb3:c92a with SMTP id
 ffacd0b85a97d-42b527e209cmr2748436f8f.12.1763031365258; 
 Thu, 13 Nov 2025 02:56:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhu1XClEw6G6pj5WAebr61Q9NWy1VIHy3wmxWG5yVF01CRoHfe4AZUaRcmGMQkzAevtRzy9Q==
X-Received: by 2002:a05:6000:24c4:b0:42b:2eb3:c92a with SMTP id
 ffacd0b85a97d-42b527e209cmr2748407f8f.12.1763031364879; 
 Thu, 13 Nov 2025 02:56:04 -0800 (PST)
Received: from ?IPv6:2001:16b8:3dc8:8f00:8ef8:1e5c:2111:d63d?
 ([2001:16b8:3dc8:8f00:8ef8:1e5c:2111:d63d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b62dsm3200681f8f.24.2025.11.13.02.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 02:56:04 -0800 (PST)
Message-ID: <fb6a92b02e4d6bf96b998a47184efb55fd4f952f.camel@redhat.com>
Subject: Re: [PATCH v7 1/2] drm/panthor: Make the timeout per-queue instead
 of per-job
From: Philipp Stanner <pstanner@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?ISO-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Detlev Casanova
 <detlev.casanova@collabora.com>, Ashley Smith <ashley.smith@collabora.com>,
 kernel@collabora.com
Date: Thu, 13 Nov 2025 11:56:03 +0100
In-Reply-To: <20251112151253.7cfba768@fedora>
References: <20251112121744.1356882-1-boris.brezillon@collabora.com>
 <20251112121744.1356882-2-boris.brezillon@collabora.com>
 <7cea7efb7ff0ab34ab7352158ecce731a3f714d8.camel@redhat.com>
 <20251112143104.2cabebb9@fedora>
 <0558310f433debe93dddee0b6373bcb406b8bd62.camel@redhat.com>
 <20251112151253.7cfba768@fedora>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MwSvqjhybrDix0l_u36tPhgqDkdCsyt5IJChr2fOgLo_1763031365
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

On Wed, 2025-11-12 at 15:12 +0100, Boris Brezillon wrote:
> On Wed, 12 Nov 2025 14:48:51 +0100
> Philipp Stanner <pstanner@redhat.com> wrote:
>=20
> >=20

[=E2=80=A6]

> > > =C2=A0=20
> > > >=20
> > > > You could write a proper drm_sched API function which serves your
> > > > usecase.=C2=A0=20
> > >=20
> > > It's not really lack of support for our usecase that drives this
> > > change, but more the fact the current helpers are racy for drivers th=
at
> > > have a 1:1 entity:sched relationship with queues that can be schedule=
d
> > > out behind drm_gpu_scheduler's back.=C2=A0=20
> >=20
> > And you also can't stop drm_sched to prevent races?
>=20
> That's the thing, I don't want to stop the drm_gpu_scheduler attached
> to a panthor_queue, I want new jobs to be queued to the ring buffer
> until this ring buffer is full (which is controller with the
> ::credit_limit property), even if the group this queue belongs to is
> not currently active on the FW side. Those jobs will get executed at
> some later point when the group gets picked by the panthor scheduler.

Ah, OK! Understood.

> >=20
> > As you know I only learned a few weeks ago about your group scheduler
> > on top of drm_sched. I wish I had heard about it when it was
> > implemented; we might have come up with the idea for drm_jobqueue
> > sooner.
>=20
> Might have simplified things, I guess, but that's life, and I'm happy
> to transition to drm_jobqueue when it's deemed ready.

JQ is in Rust, potentially one day with a C ABI. So that could only
happen if your driver's users are OK with relying on LLVM for building
the kernel.

BTW would be interesting for me to know to what degree that's a problem
for common distributions and users.

>=20
> >=20
> > > =C2=A0=20
> > > >=20

[=E2=80=A6]

> > >=20
> > >=20
> > > =09queue->scheduler.timeout =3D MAX_SCHEDULE_TIMEOUT;
> > >=20
> > > is a leftover from a previous version. We shouldn't have to modify th=
at
> > > here because the timeout is initialized to MAX_SCHEDULE_TIMEOUT and
> > > never touched again.=C2=A0=20
> >=20
> > So you agree that it can be removed in v8?
>=20
> Yep, I think it can go away. I'll make sure it still works without it,
> and also get the wq from some driver fields instead of going back to
> drm_gpu_scheduler::timeout_wq.
>=20

I saw your other reply.

I mean, it's all not ideal, but as already stated timeout_wq is
intended for sharing and, furthermore, we have so many users of interna
by now that it often can't even be determined anymore what's legal and
what's not. Let's live with it for now.


P.

