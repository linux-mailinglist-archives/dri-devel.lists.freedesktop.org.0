Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C6973008
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 11:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0638910E123;
	Tue, 10 Sep 2024 09:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K6U3jAGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318DA10E754
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725962227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PiDJuasXThJ7vbj/ldyoca5Jl01N0InxFIbiVHzjY0=;
 b=K6U3jAGZGX5LUaZBveIAzmwkC1ae12iCazwBOfDHqqdqhzUQqkmgEZK7/K8N1nXG+H1901
 9O8Gg9lCp/IbTk4JxQQa24tZQHd4cVZMDQKWBluXvbT9CD+Fyi9MCdkdMBKOPauIUXQnJZ
 diiKPhT8uY4csebCkRowaqEbgcE+s00=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-pl5R_gdLOESRc_tvNDarjw-1; Tue, 10 Sep 2024 05:57:04 -0400
X-MC-Unique: pl5R_gdLOESRc_tvNDarjw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374bfc57e2aso3269598f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 02:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725962223; x=1726567023;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6xmJDJHCrFEJG1w4322U2zHbVoLSbOK3ERE+KWCaag8=;
 b=trziozLTCPb/QIqUeijM4RJALRhzkMbMeAnh+hoPMzk0eIENJe0shvJ9B1vzIL6nic
 bS+R8LehZ8TGtrzrgkZwMWrvXCKmDUb1PcZbmkzkD57Ip0fXI6ZxSguO+HNCQIrBTefP
 MJo9mqKJowQFq9smhRmKScqIWJgLOro2uoaQUfC2tailZTCkc02TGJydZmwRTPpqqnIC
 KSUFkCVCy8YsyVxBnX2cYGflxsKt79NLsgH6GqtXOjPuJID+izwB+IjuG5/e3xU1DVa4
 PMCPmQCszCnI1GxAoKCrlHXhisivRbhhnfUBWCvY6Jp8Rhr1qrW/+y9ks2Lc7euqQWjH
 IHwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF/Ixt7+w2+q6Odmi510EffPTFZjJTRgaWBp2Hb6mahHdbI/4+wvS7xVU7A+FGhTTWmlHnkCDgQek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYcqsVxkiKjkQ6Ic4ibXP9V1k9mZX5dXtmst3//hi3uUzsJL/d
 SVFVL/Uxs86tnRIlyBhLTvWaaDzLvSN7teVTmDeD3CLHNBXlnCwVxtQiI3THGmcu/L5BIgZseHB
 LtSR+lPA/UTcfM8ZQUvX8YkiEIsoXkFYcXAPu1RybwSmXr8OYmZfDEVj+4mLGXZB9kQ==
X-Received: by 2002:adf:a407:0:b0:374:c318:2188 with SMTP id
 ffacd0b85a97d-37889670950mr8629342f8f.42.1725962222727; 
 Tue, 10 Sep 2024 02:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQFd5NJamzzjdq+dxtvPLXnw545coT4h9RSKBn5pqWHp/OzlFLx8WTZz6cV76JxVC0FLq4dg==
X-Received: by 2002:adf:a407:0:b0:374:c318:2188 with SMTP id
 ffacd0b85a97d-37889670950mr8629320f8f.42.1725962222149; 
 Tue, 10 Sep 2024 02:57:02 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dba:4b00:6ba1:ad1b:2dfb:e2a2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956dbf42sm8366725f8f.102.2024.09.10.02.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 02:57:01 -0700 (PDT)
Message-ID: <0f3309f2fee746879a941e45e63a67facbc98f6d.camel@redhat.com>
Subject: Re: [PATCH 5/8] drm/sched: Stop setting current entity in FIFO mode
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Tue, 10 Sep 2024 11:57:00 +0200
In-Reply-To: <20240909171937.51550-6-tursulin@igalia.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-6-tursulin@igalia.com>
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

On Mon, 2024-09-09 at 18:19 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> It does not seem there is a need to set the current entity in FIFO
> mode
> since ot only serves as being a "cursor" in round-robin mode. Even if
> scheduling mode is changed at runtime the change in behaviour is
> simply
> to restart from the first entity, instead of continuing in RR mode
> from
> where FIFO left it, and that sounds completely fine.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I went through the code and agree that this looks good.

Reviewed-by: Philipp Stanner <pstanner@redhat.com>

> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 10abbcefe9d8..54c5fe7a7d1d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -356,7 +356,6 @@ drm_sched_rq_select_entity_fifo(struct
> drm_gpu_scheduler *sched,
> =C2=A0=09=09=09=09return ERR_PTR(-ENOSPC);
> =C2=A0=09=09=09}
> =C2=A0
> -=09=09=09rq->current_entity =3D entity;
> =C2=A0=09=09=09reinit_completion(&entity->entity_idle);
> =C2=A0=09=09=09break;
> =C2=A0=09=09}

