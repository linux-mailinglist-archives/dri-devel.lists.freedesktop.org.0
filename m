Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C541971471
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877410E2F7;
	Mon,  9 Sep 2024 09:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P2yNn4V7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC1310E361
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725875509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ayd7IleCwsO+FnPkJR5KHxukDOZi4foXR3Bb3l4R1g=;
 b=P2yNn4V7Z2/B59LQ0lRkt1yxl9Hwe+tzrI0WZshTaApBwlGINg4wD5yliGhRGiDcPIHD2w
 LQTcLy54LN3hb28ou/kpihmyiZCI1jMi0CImyZoXOXJHBIHDlC5zcRPM3Lb10DU0k7TkDc
 vkmmO01048l13utPrYc+hDu9dswfEXA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-YQkZM4aYNyqIOU_mJPOMWQ-1; Mon, 09 Sep 2024 05:51:48 -0400
X-MC-Unique: YQkZM4aYNyqIOU_mJPOMWQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374cbbaf315so2185384f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 02:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725875507; x=1726480307;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m+Tbw+vwPqAwjyalWaaJ8tVR88aCGFVgkshL4vXUNzo=;
 b=VxUxmelwGtdnEjuWk9CLExL9GuF78ivgNz4VbC/nnxK0XyHQ7wpSdytYbctiKubdkp
 RheM8FVZXS9OUplAHWKpLveh1zkIwxU5d0JMSnfuw409LPIlBzh4BxTfopHxQxyq3l4N
 ttX3iV+BCKqyJ+dMM3USZYrhyY7OTVCqezplYnrt4zzSHefM5iERfAmwuOP/0qTkYb26
 06jUX2ZaykPlYHRtLrV+NjSWYvoKZKD9fMBTZbCfZt1DGY+V1ZotjsJXgtq8wBpf4++6
 cI6V4YJLv9PPfcs7MCirIH3SF1nGb39VT1GuhqrlbqnuRQmZCZMnatfarI8NjXf8l7zT
 dB5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEqdx/tS1SwFh3LjJQ3MWCl6bH3Pj28L8ryRIeaJHP/HjsheC9Gna9PJrXa2NmM73KyC/+7rBw728=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfTqm8Xp6AOvne8mAPcqJFK0+BhuMFcYrEHAO/wiE2FC3WxntX
 uuXk/45FjSFmuR9WoZHwh6gsjTIur2DwoZVquH7MqSgtP0wMUA4kbDHbmADXHH7BQiebNBX+ncD
 z9wTngzMiHhS6RL7t1ecQqhVAuwHtw4TnD/y0oa3wh9T/+shYz0iJMO8WbcxxABN9CQ==
X-Received: by 2002:adf:f2c7:0:b0:374:c157:a84a with SMTP id
 ffacd0b85a97d-378885dfa6dmr6447738f8f.16.1725875507538; 
 Mon, 09 Sep 2024 02:51:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO/5zepFCrbxUqLeH1UXU2lnxmqLq6D4IEGIZA56a9vh4xBHhJLHcdXgd1cWD/A0n6hc7YGA==
X-Received: by 2002:adf:f2c7:0:b0:374:c157:a84a with SMTP id
 ffacd0b85a97d-378885dfa6dmr6447716f8f.16.1725875507060; 
 Mon, 09 Sep 2024 02:51:47 -0700 (PDT)
Received: from dhcp-64-8.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956dd932sm5549616f8f.98.2024.09.09.02.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 02:51:46 -0700 (PDT)
Message-ID: <ee0e0294c2af5a651cc3a28404cde23df764bb43.camel@redhat.com>
Subject: Re: [RFC 2/4] drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
Date: Mon, 09 Sep 2024 11:51:45 +0200
In-Reply-To: <20240906180618.12180-3-tursulin@igalia.com>
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-3-tursulin@igalia.com>
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
> Since drm_sched_entity_modify_sched() can modify the entities run
> queue
> lets make sure to only derefernce the pointer once so both adding and
> waking up are guaranteed to be consistent.
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
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 8 ++++++--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index ae8be30472cd..62b07ef7630a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -599,6 +599,8 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0
> =C2=A0=09/* first job wakes up scheduler */
> =C2=A0=09if (first) {
> +=09=09struct drm_sched_rq *rq;
> +
> =C2=A0=09=09/* Add the entity to the run queue */
> =C2=A0=09=09spin_lock(&entity->rq_lock);
> =C2=A0=09=09if (entity->stopped) {
> @@ -608,13 +610,15 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0=09=09=09return;
> =C2=A0=09=09}
> =C2=A0
> -=09=09drm_sched_rq_add_entity(entity->rq, entity);
> +=09=09rq =3D entity->rq;
> +
> +=09=09drm_sched_rq_add_entity(rq, entity);
> =C2=A0=09=09spin_unlock(&entity->rq_lock);
> =C2=A0
> =C2=A0=09=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> =C2=A0=09=09=09drm_sched_rq_update_fifo(entity, submit_ts);
> =C2=A0
> -=09=09drm_sched_wakeup(entity->rq->sched, entity);
> +=09=09drm_sched_wakeup(rq->sched, entity);

OK, I think that makes sense. But I'd mention that the more readable
solution of moving the spin_unlock() down here cannot be done because
drm_sched_rq_update_fifo() needs that same lock.

P.

> =C2=A0=09}
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_push_job);

