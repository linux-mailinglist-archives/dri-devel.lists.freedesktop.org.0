Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F4971FB4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 18:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFCE10E5B3;
	Mon,  9 Sep 2024 16:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mdtnZz1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B0310E5B3;
 Mon,  9 Sep 2024 16:58:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-20549ca1fe3so3548075ad.1; 
 Mon, 09 Sep 2024 09:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725901117; x=1726505917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Z/Zmz3De11vyisbj+Q2ARtW63b37+kmAlBmPvyR7Bs=;
 b=mdtnZz1M6cBJNx900EBwW0PCQqqX2EsknMu4HJapjMQ0AcKALWaqNMNm4v7EL7cchj
 l7StJ8iVaNHmFY7g+AYVu2MTMmb9pBAbIw+gwpVdMN/BgPo6hvhE2B/HCPltz9uvpdci
 4SJfa2tl5yiFCeYWgyVYFay1LVRhSX+sSSpvACC8INGZqckb8lXafGh+QNGe7WYWrKjo
 m0yYDLGTlwK5qoQSmh/8yUwqnpHS5F5ytdyfUcNukVqLJ8MFM2aQ5VNqvR7QpRRmoMVw
 lsFgy3toAPfz7zT3mFFU2SxjZb+SHoYJmX5x5IdGo9W0E9y0S026X+K9PVxA26pm9hQg
 vpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725901117; x=1726505917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Z/Zmz3De11vyisbj+Q2ARtW63b37+kmAlBmPvyR7Bs=;
 b=gGVdNvAFEXy9n5UQUX1OHyU4ps6yczMKG54oHfvd2mFfDKw3zfVM0BnFPOlGW4J98a
 21uTfL4nJ+APOUz5pbaYRWJllqZ9UK2ilSQYFsPJNR5T1LUOsDmrIvfn07AI3sXZCglq
 dT3kSfHCLyFetYbbsqWVlm3dvIHExYIW8Ama2Ha8Qgmdc2/Yx/tokFbDrFv+FAaoxxZp
 dcSn0cYnsR3aGCOOCnn+PaB9QA/rTIlCaDA9cECMQhThnE3wG/m9Ti0VsQM4OmwpT9QT
 d5QeqJxHn6Hn9kxrBfc4NnpxGy+BQd5CvNqk/TlIuyVRwB+Em8I+UsgGTxWe9NHn4AZN
 FsmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa0BLZ1HKzjJVIXxhL8sMeOOPfjt+KSjhFJ6IZtz9uoqpz7K72QBrr5KJEPgeBhG+5nZxq2HKD@lists.freedesktop.org,
 AJvYcCXLTygAhdcK1J7yYowui+U4VdvFQMPfMGb+J+nfZE9XxZffWgsnW0UaMO7/6EPOB72a20FnBU6JZMWX@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjc8Nam8Y8TY0Qn/j1IQORXqewq2Zk+ZWzELw/NBvFCTNdcwgh
 JPjHSE4YAgIz6Ccd9D9b7xJZl4v/paGoZnr43aFHoEUgScGgisdN8cwemZcgkp0H7yAYuB2n+02
 XS4QwJXw7ggXJs0UZKz82Pevg6pg=
X-Google-Smtp-Source: AGHT+IHR4IMr5l8ZLxuTjRXrGMkIcSTm0H7iaKz7vtpvFpFXHbr7unRpDow6oHXr0Ku4H9nFYIUlp6a2xsxYej2hLBY=
X-Received: by 2002:a17:902:d4cf:b0:1fd:7b9a:188c with SMTP id
 d9443c01a7336-206f0682d20mr58049895ad.9.1725901117167; Mon, 09 Sep 2024
 09:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240906180639.12218-1-tursulin@igalia.com>
 <20240906180639.12218-2-tursulin@igalia.com>
 <7f2a3c3d-b6c6-43f5-bd39-28203df28750@amd.com>
In-Reply-To: <7f2a3c3d-b6c6-43f5-bd39-28203df28750@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Sep 2024 12:58:25 -0400
Message-ID: <CADnq5_OAbQqFRANHNTFAJy0j0p8vyQUJVOhpg44jc_4Khb599w@mail.gmail.com>
Subject: Re: [RFC 1/2] drm/amdgpu: Remove dynamic DRM scheduling priority
 override
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, "Liu, Leo" <Leo.Liu@amd.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>
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

On Mon, Sep 9, 2024 at 8:23=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Adding Leo as well.
>
> Am 06.09.24 um 20:06 schrieb Tvrtko Ursulin:
> > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >
> > According to Christian the dynamic DRM priority override was only
> > interesting before the hardware priority (dona via
> > drm_sched_entity_modify_sched()) existed. Furthermore, both
> > overrides also only work somewhat on paper while in reality they are on=
ly
> > effective if the entity is idle, which is something userspace is unawar=
e
> > of when using the AMDGPU_SCHED_OP_*_PRIORITY_OVERRIDE uapi.
> >
> > Therefore follow Christian's advice and remove this call completely.
>
> The only potential use case I can come up with would be for multimedia
> engines since we never implemented the hardware priority handling for the=
m.
>
> @Leo do we have any use case relying on that? As far as I know it
> doesn't work for UVD/VCE anyway because those engines can't switch loads
> and for VCN we should probably just implement different hw priorities.

VCN has moved away from multiple queues to a single queue; and the
next iteration is user queues.  On the older hardware, there was a
high priority queue, but IIRC, the firmware just prioritized fetches
from that queue; there is still only one engine that can process the
work.  As such, I'd expect it to operate similarly to the drm
scheduler.  For both GFX and VCN, having a high priority queue, even
if it was just in the drm scheduler, helped at least some workloads we
had in the past.

Alex

>
> Christian.
>
> >
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 4 ----
> >   1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ctx.c
> > index c43d1b6e5d66..2480b3227dad 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> > @@ -820,10 +820,6 @@ static void amdgpu_ctx_set_entity_priority(struct =
amdgpu_ctx *ctx,
> >       struct drm_gpu_scheduler **scheds =3D NULL;
> >       unsigned num_scheds;
> >
> > -     /* set sw priority */
> > -     drm_sched_entity_set_priority(&aentity->entity,
> > -                                   amdgpu_ctx_to_drm_sched_prio(priori=
ty));
> > -
> >       /* set hw priority */
> >       if (hw_ip =3D=3D AMDGPU_HW_IP_COMPUTE || hw_ip =3D=3D AMDGPU_HW_I=
P_GFX) {
> >               hw_prio =3D amdgpu_ctx_get_hw_prio(ctx, hw_ip);
>
