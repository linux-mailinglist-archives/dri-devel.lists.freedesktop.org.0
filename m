Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C19A201B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 12:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A76210E31D;
	Thu, 17 Oct 2024 10:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D6RTzHnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CE710E31D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729161365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hcIHQahFGgUyLt3qPGHmx/4cqcVWif++b7j7/G2cbU=;
 b=D6RTzHnzX7yJw3Zvcx2mieNCplJbqGXgGFr7lqjKtnP4y3u80ufBn99rNofn9zH9Nzv1N5
 OkJ1MzeWiVJqvzIlspuP1iljmVpg3Q7owcVlY0RMC778ZwLBd8ggwsd8p5LTsDx9u23b8y
 TcSYZGE7gIIO7R1MNz/dblzcn0aUQQ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-sTyHtRkTMpyd0z_PIiSYvg-1; Thu, 17 Oct 2024 06:36:04 -0400
X-MC-Unique: sTyHtRkTMpyd0z_PIiSYvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43151a9ea95so7910585e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 03:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729161362; x=1729766162;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+hcIHQahFGgUyLt3qPGHmx/4cqcVWif++b7j7/G2cbU=;
 b=KtzRcdt4w0Rm1/lvmEXcj6RY/k4P0Evh0P7QynAn3AUG6YScYad7pCELC5BctqUmEC
 W40mFMznuFT0ibJ7llyThTz9hurvWb3eU4C5dV++v4k3G8V1MFOO1K+XMlBKDUJUTKrV
 +fdUl2pI85Em172Xv7U3JNDFvIB78Yq6wQgWhDQcl/ekOtvhfLCt9dbA0LVLx/UqC7E/
 28p6FrNQP17h9f8v7Bh9rv9Rwo4TEJNKTHvzwVnERg8skpkkpUjzt7qJqag4/BlbfRFz
 /cIsgRi7aKqJ2zbnRk+v24MsD3adzaOmwKqNA1nLXaZ06XudhCKR3SFWljqj5S0LvVGV
 iF3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG6NXn5cEE233moM4VZGPHCmmxdlcmmJw5YocHQS6IkSTSqPfPQWaA9xPC0a9wo2P6oEhO2/9sdYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy+EPQWK+ljyXvNvUote2WPlaquF6CDS0iTVKV8llFaJwmDIHp
 6nXhpOxojn8PNYESu3Daf1ZPSeiBN7fPCnS87xH5KYg4YsvRcUqm8dX4Sl+lPnIufp7YRng3VoT
 91gQmBPgaCGK8wNqq3vN5vKaC6qcZiky5Lch/g9C7NkcNVGUaiwvhiV/ilimNRyPAQFTEO3xFkK
 ZV
X-Received: by 2002:a05:600c:b9a:b0:431:559d:4103 with SMTP id
 5b1f17b1804b1-431587307b8mr16273585e9.7.1729161362665; 
 Thu, 17 Oct 2024 03:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKNSGOU/ecLiPwc/hGmuW7bd1SRSIwmBSQBPWxgHwBduCtj9n1FG+ET4L0tZo6JtHSXzkQnA==
X-Received: by 2002:a05:600c:b9a:b0:431:559d:4103 with SMTP id
 5b1f17b1804b1-431587307b8mr16273415e9.7.1729161362264; 
 Thu, 17 Oct 2024 03:36:02 -0700 (PDT)
Received: from dhcp-64-113.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c3d9f2sm21536145e9.24.2024.10.17.03.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 03:36:01 -0700 (PDT)
Message-ID: <4501489be983c5cd2cf4c947731a2c8b17ce0736.camel@redhat.com>
Subject: Re: [PATCH v2 0/5] Small DRM scheduler improvements
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Thu, 17 Oct 2024 12:36:00 +0200
In-Reply-To: <20241016122013.7857-1-tursulin@igalia.com>
References: <20241016122013.7857-1-tursulin@igalia.com>
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

On Wed, 2024-10-16 at 13:20 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Leftovers from the earlier "DRM scheduler fixes and improvements"
> series.
>=20
> It looks the fixes have now propagated back to drm-misc-next so this
> should now
> be mergeable.
>=20
> It also needed a small rebase to account for one revert and one
> spelling fix
> which landed in the meantime.
>=20
> As a reminder, what remains are kerneldoc improvements, struct layout
> tweaks for
> clarity, one trivial cleanup for the FIFO mode, and most importantly
> two spin
> lock-unlock cycles are removed from the push job path by pulling
> taking of the
> locks one level up.
>=20
> I smoke tested it on the Steam Deck and lockdep seems happy.
>=20
> v2:
> =C2=A0* Tweaks to commit messages and rename of some leftover rq_lock
> naming inside
> =C2=A0=C2=A0 kerneldoc.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
>=20
> Tvrtko Ursulin (5):
> =C2=A0 drm/sched: Optimise drm_sched_entity_push_job
> =C2=A0 drm/sched: Stop setting current entity in FIFO mode
> =C2=A0 drm/sched: Re-order struct drm_sched_rq members for clarity
> =C2=A0 drm/sched: Re-group and rename the entity run-queue lock
> =C2=A0 drm/sched: Further optimise drm_sched_entity_push_job
>=20
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 42 +++++++++++++++------=
-
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 32 +++++++++--=
-------
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 34 ++++++++++---------
> =C2=A03 files changed, 61 insertions(+), 47 deletions(-)
>=20

Applied to drm-misc-next

Thank you,
P.

