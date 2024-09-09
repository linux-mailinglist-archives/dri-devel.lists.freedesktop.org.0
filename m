Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A597141E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B7310E027;
	Mon,  9 Sep 2024 09:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QeAGfLPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B2210E027
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725875081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZVI1jZHb9jVRGGrMda0+KrbMXRWm8VcX6bzSY/oYE4=;
 b=QeAGfLPUmMHlAB0HrGfGNKK7WO4Q1wJRIExuAmWoham9lcOvJWj+9FYPQBn8POmj840v0E
 L55K0da1qtAkVoqmRHlJqkjvuIkql5oT1TJMJsEiFRhoGv+p8BSRW8C4aZj2nXkqoXT/RN
 rULukbkDEcdWAEu8sQycj3YetHTK4wo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-l8rgffKWPd-CxyYdvj_pSw-1; Mon, 09 Sep 2024 05:44:40 -0400
X-MC-Unique: l8rgffKWPd-CxyYdvj_pSw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374c960ee7aso3086992f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 02:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725875079; x=1726479879;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lVm8c6/Sqrp3TPhfrJ3lOZfRVhjrw6Pp99SGfZDmV7c=;
 b=IvybjfA5pcQ1i/AK7Ajjsc5qODxpQwQTXbCTnosfFMyhJNUnjgkQ2BXc2uL1nIRXEk
 GmVvLpY12kVBfCvQzsHfyQzG0iiCK190RjUpmkomrS47hc4FOa9yWY9WL+kEKX8bCwVc
 Jnw/C34aekIwXSFAAIkf3KLHmKyuj2RawDcGHJxwroeYCYqFPNsyRANNkdBE7vAP0A5c
 irL9wM32JBFBm+lSWAYiMxFXAHPswH5hy/H8lfORNLaK0/ypb+/pX4UAxFAwA0xHyqXR
 fvNhT+dvBK0+UOEMXTSvpN5bW44jCKYrlkk/7kGVTeakCAdRf6GT/UYBUFYuWt90JT+S
 EbCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJj3Ue8cnKhcVGuC7q6PHGTCLUf9WSRhiFWChXf2SfE4Xqbb1mvILfEBB8YZWIUbml8Km27gjoP4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0ipJrefSKt/KRAoNgJtHL5eNRWQxfvwpuYiXLmgz0/duDRJPb
 4g2+1rx9tFBkQ6n3igRgQDNq/7ecgRbmX0ACrX5LwcJWfiyAS2iVJDNkorlAysm+NWoP3bAXrIt
 7SpJc5UGuC/uo1f6SJG/9Uh+HUshpIyHS7aFqV6k6FPDSD6hjnBt4lkECnmTyEpvb+Q==
X-Received: by 2002:a5d:5cce:0:b0:374:bec7:8f with SMTP id
 ffacd0b85a97d-378922b7691mr4984480f8f.28.1725875078960; 
 Mon, 09 Sep 2024 02:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHGK2Xu8mRHpEjTebQMfnfsEbelIPzvsXlp8WnWNlp+vzax9rKo9hm67Y9/zhgSmtVdtsggA==
X-Received: by 2002:a5d:5cce:0:b0:374:bec7:8f with SMTP id
 ffacd0b85a97d-378922b7691mr4984463f8f.28.1725875078446; 
 Mon, 09 Sep 2024 02:44:38 -0700 (PDT)
Received: from dhcp-64-8.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956650f2sm5549862f8f.26.2024.09.09.02.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 02:44:38 -0700 (PDT)
Message-ID: <8d763e5162ebc130a05da3cefbff148cdb6ce042.camel@redhat.com>
Subject: Re: [RFC 1/4] drm/sched: Add locking to drm_sched_entity_modify_sched
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
Date: Mon, 09 Sep 2024 11:44:36 +0200
In-Reply-To: <20240906180618.12180-2-tursulin@igalia.com>
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-2-tursulin@igalia.com>
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

On Fri, 2024-09-06 at 19:06 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Without the locking amdgpu currently can race
> amdgpu_ctx_set_entity_priority() and drm_sched_job_arm(),=C2=A0

I would explicitly say "amdgpu's amdgpu_ctx_set_entity_priority() races
through drm_sched_entity_modify_sched() with drm_sched_job_arm()".

The actual issue then seems to be drm_sched_job_arm() calling
drm_sched_entity_select_rq(). I would mention that, too.


> leading to the
> latter accesing potentially inconsitent entity->sched_list and
> entity->num_sched_list pair.
>=20
> The comment on drm_sched_entity_modify_sched() however says:
>=20
> """
> =C2=A0* Note that this must be called under the same common lock for
> @entity as
> =C2=A0* drm_sched_job_arm() and drm_sched_entity_push_job(), or the drive=
r
> needs to
> =C2=A0* guarantee through some other means that this is never called whil=
e
> new jobs
> =C2=A0* can be pushed to @entity.
> """
>=20
> It is unclear if that is referring to this race or something else.

That comment is indeed a bit awkward. Both drm_sched_entity_push_job()
and drm_sched_job_arm() take rq_lock. But
drm_sched_entity_modify_sched() doesn't.

The comment was written in 981b04d968561. Interestingly, in
drm_sched_entity_push_job(), this "common lock" is mentioned with the
soft requirement word "should" and apparently is more about keeping
sequence numbers in order when inserting.

I tend to think that the issue discovered by you is unrelated to that
comment. But if no one can make sense of the comment, should it maybe
be removed? Confusing comment is arguably worse than no comment

P.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify
> sched list")
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.7+
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..ae8be30472cd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -133,8 +133,10 @@ void drm_sched_entity_modify_sched(struct
> drm_sched_entity *entity,
> =C2=A0{
> =C2=A0=09WARN_ON(!num_sched_list || !sched_list);
> =C2=A0
> +=09spin_lock(&entity->rq_lock);
> =C2=A0=09entity->sched_list =3D sched_list;
> =C2=A0=09entity->num_sched_list =3D num_sched_list;
> +=09spin_unlock(&entity->rq_lock);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_modify_sched);
> =C2=A0

