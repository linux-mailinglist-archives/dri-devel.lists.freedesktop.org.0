Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F12A09425
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 15:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1C610E06B;
	Fri, 10 Jan 2025 14:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KGaPsN5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C57F10E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 14:49:10 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2162b5d2e1fso4504765ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 06:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736520550; x=1737125350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pF0QqRiYb+t89Y14vjV3xIjbTiJIgrQImj25kdk3bBw=;
 b=KGaPsN5TeCkO8hPPb1Zt3jQFcMgBdLY1oUoYLU4rVUAuMdxcWdNEE+l/bvdpdi+baM
 nuugiqIf1ZJkxUjdhpn/EUDT4gDXOjl9q6xhoBMuAFkWg1a0Xrf3Tntdi0oCUk9I5D+B
 EgbkXB2xRWZqQ3pY6BPbmiadUGSS8M9vic0WG6KU+hPKVkXgKAJENnsuWugG/ICquJUc
 cMeTt0rclSZIdlpHkxuKRgocF0hjSq298yLcrB0nlauS8w9CXm6vOgAG7qy8PNbtUIjy
 pYWG7/M7MrbgUBQSCYObX7wARfLrb5fd9sIknvZOHmsPg59g0B+7Mz5eKCVIygFSvi6N
 4IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736520550; x=1737125350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pF0QqRiYb+t89Y14vjV3xIjbTiJIgrQImj25kdk3bBw=;
 b=Ue04BiVPTPQQNizR8/p30GNVW+MIh3J0aU/WoKA6eXQo5zkPMgjVuIKgpZAxU+vSVI
 rgF9pYCM/Dn1hhrWNkfJtxwDZ3DKLJlAhlNEnuGv4XcJBw7opJ+4LpBMV2tE+/r93VIv
 wZw5OHU24WiMRpbLUUNoVOeEFmJht6DZ4QUWUN8QuFTXFvjnHnUjC0QCHfwZ+mekDfmS
 MJeER8CCRSwy7XqSVS87sXRpedDprX+kd3GL0RrToBeJ++o+BJWEw6bJvgABcWEI+x+d
 IGFW/r5t62UKLUjkg3+FqKL7EjNymMLN33CiJLtqnMOHBJV4nJoEoyJdKE0ItupGszCe
 UkUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRhhtQbGMnPBzbVjg6IJW09fqBEl5yq9kQg3IKcagt2gg/rFFmT6Mt3Q4qZXrCUgiLMAzSS13VzoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo63kGBp+I+UEAy+F3lnwiCSWCo1wNyYvuAuJvBDU0J6qV6gUR
 ptC8OI+ovS8j2hSonYLdbGrNL+9hbynTxjC0KiRevjS8Cfdbeiz3qdHyxf4Ip33nXKH0UElfsf6
 4kj3xC0yz7CBM349jVbwWD/8AQz0=
X-Gm-Gg: ASbGncs9E2NT0tZ/CM1+9MQ3bnL76mhhXrX1m3KLZRBavU8Q+7YYvE1yMdDXJvBue21
 nOPvLNeNhVpKaV4JDN4z8GaCVt7m6rLMhYmrtiA==
X-Google-Smtp-Source: AGHT+IHg56qHA67g/o4p0pJ+7zzVC5QwPKvVKgu1UUlAj6/Y0Bu0hB+dSUaAiWagMOxWaslnGgJ4y5YMmzBcJLGv0qY=
X-Received: by 2002:a17:902:c945:b0:215:2bfb:3cd7 with SMTP id
 d9443c01a7336-21a83fad103mr65034525ad.10.1736520549675; Fri, 10 Jan 2025
 06:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-2-tvrtko.ursulin@igalia.com>
 <48e3b200-39e5-4e54-ba05-de72c627d876@amd.com>
 <6affb6c3-0335-46cf-9276-92222afac907@igalia.com>
In-Reply-To: <6affb6c3-0335-46cf-9276-92222afac907@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jan 2025 09:48:57 -0500
X-Gm-Features: AbW1kvbxB-kUZhlTJ_k9IlHhHNBUpVGvgG4jH-xum92CKC5jemSHRUtZ-aXRR_c
Message-ID: <CADnq5_P_g14TqM4pjgyr2T=QnYaj2c+3ayhaGdQJrACAS5xpnQ@mail.gmail.com>
Subject: Re: [RFC 01/18] drm/amdgpu: Use DRM scheduler API in
 amdgpu_xcp_release_sched
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>, 
 Philipp Stanner <pstanner@redhat.com>
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

On Fri, Jan 10, 2025 at 5:52=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
>
> On 09/01/2025 12:30, Christian K=C3=B6nig wrote:
> > Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
> >> Lets use the existing helper instead of peeking into the structure
> >> directly.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Cc: Danilo Krummrich <dakr@redhat.com>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Philipp Stanner <pstanner@redhat.com>
> >
> > Grr, I can't count of how many of those I already fixed :(
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Thanks!
>
> + Alex
>
> I forgot to cc amd-gfx for this one. Can you take it from here or I can
> send it standalone?

Will pick it up today.  Thanks,

Alex

>
> Regards,
>
> Tvrtko
>
> >
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> >> index e209b5e101df..23b6f7a4aa4a 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> >> @@ -427,7 +427,7 @@ void amdgpu_xcp_release_sched(struct amdgpu_device
> >> *adev,
> >>           return;
> >>       sched =3D entity->entity.rq->sched;
> >> -    if (sched->ready) {
> >> +    if (drm_sched_wqueue_ready(sched)) {
> >>           ring =3D to_amdgpu_ring(entity->entity.rq->sched);
> >>           atomic_dec(&adev->xcp_mgr->xcp[ring->xcp_id].ref_cnt);
> >>       }
> >
