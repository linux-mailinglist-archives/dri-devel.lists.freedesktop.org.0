Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C29CE1DC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 15:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A5510E153;
	Fri, 15 Nov 2024 14:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IxblZI+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F65110E153
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731682146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnrOH4g3Pnk//pdFIBPOS1961zpQDfYUNTogF7p3bfY=;
 b=IxblZI+0vnCbQeqJ1+XKFhG0Z0ZVOqgSaLmVLOtcHbPHs4kHEvgr6Q7J0w18WJ/JS2P+jp
 dB3LwPWCv3RiK7Eccs5vZvtTWQWgjIJ4GqaV/f6aO8MtaCOuij3gsA9MnV5sWgqdSVXOiQ
 66GXF6L/N0IsMPG85+KFO3nRYHJDeFo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-x6pTV8MBNiyNnn2ck2J2vQ-1; Fri, 15 Nov 2024 09:49:05 -0500
X-MC-Unique: x6pTV8MBNiyNnn2ck2J2vQ-1
X-Mimecast-MFC-AGG-ID: x6pTV8MBNiyNnn2ck2J2vQ
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4316300bb15so13317895e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 06:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731682144; x=1732286944;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5Do3JqWDb2S1+eiYjx9JK17DIj5oi9k/6ivbe46PRo8=;
 b=rFuGPW78ZcJ8g6R5kB+5OX04ZUJK6P2M7p3ccWTROsSfS6kiRPMdAsAig2nJjTWEMo
 ujiGcQNToIAHnX/FTMX6hqDxPhmfLhN5CEGmHuCBrS12eTsWP8mqejyJJRkz2fkWdK7j
 NNpnb+vMfVzVUx/GqUu1lks1gdbrllFGd30NVkAi18UBer0zmpRHh2l3S7Afw1mS5V5r
 2rZCZJL0G9iCwQgFHA+B9+5z0BfKOjpAQgWYvauuPR2jfJUSUsY/SBHxHVKvaL/VPDc6
 u5a3/HmhfyTDtgyO9N4XjFp2hU2EoeVSQon/jjH0nlc/+o+yGdwmt60rkkO9EPy9pT/c
 yZsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLZgs/AGxA6ztBsDXdtNkIxu5L7j9i+GkVAAHWu4dBvyibQOgsqR3GGuDKukA9F/SWJPdfh0vZQsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8xLURFiUdqFInhNDkQzIst3a9jqGDMIW6JOA44vc55M565TtN
 I+NGfGXgejZHWM8XbCrlNTGieKer/mLjnhQ5vG3Qn6IRoXw1vK1g456KAvdf5GogD0mpOON1OSu
 Du4HVzudHizmmN5Qz2eEt3OAXuRcxsXEqA/kNTrphJfqSn5cOiwWpxW1BGQ5bjxiclw==
X-Received: by 2002:a05:600c:34d0:b0:42f:823d:dde9 with SMTP id
 5b1f17b1804b1-432df77c758mr21412165e9.21.1731682144027; 
 Fri, 15 Nov 2024 06:49:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJimGBb/+aCfuBO5wqEncvfw/f5WSNrbmBntMTb+k+jxaLpzVc4h5GybOVPMlBxBnMCPMWFw==
X-Received: by 2002:a05:600c:34d0:b0:42f:823d:dde9 with SMTP id
 5b1f17b1804b1-432df77c758mr21411745e9.21.1731682143613; 
 Fri, 15 Nov 2024 06:49:03 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da28b698sm59203355e9.27.2024.11.15.06.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 06:49:03 -0800 (PST)
Message-ID: <d1cb97640f8c2845b88fd41f72b2e818a908041c.camel@redhat.com>
Subject: Re: [PATCH v6 1/7] drm/debugfs: output client_id in in
 drm_clients_info
From: Philipp Stanner <pstanner@redhat.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com,  rostedt@goodmis.org,
 l.stach@pengutronix.de, matt.coster@imgtec.com,  frank.binns@imgtec.com,
 yuq825@gmail.com, robdclark@gmail.com, kherbst@redhat.com, 
 lyude@redhat.com, boris.brezillon@collabora.com, steven.price@arm.com, 
 mwen@igalia.com, mcanal@igalia.com, thomas.hellstrom@linux.intel.com, 
 tvrtko.ursulin@igalia.com
Date: Fri, 15 Nov 2024 15:49:01 +0100
In-Reply-To: <20241114100113.150647-2-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-2-pierre-eric.pelloux-prayer@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vjd3nUk3uMKUkXagae9fv5u_13x2NnJcpnDJ073V8Sg_1731682144
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

On Thu, 2024-11-14 at 11:01 +0100, Pierre-Eric Pelloux-Prayer wrote:
> client_id is a unique id used by fdinfo. Having it listed in
> 'clients'
> output means a userspace application can correlate the fields, eg:
> given a fdinfo id get the fdinfo name.
>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0drivers/gpu/drm/drm_debugfs.c | 10 ++++++----
> =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_debugfs.c
> b/drivers/gpu/drm/drm_debugfs.c
> index 536409a35df4..4c0bd0cb5480 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -77,14 +77,15 @@ static int drm_clients_info(struct seq_file *m,
> void *data)
> =C2=A0=09kuid_t uid;
> =C2=A0
> =C2=A0=09seq_printf(m,
> -=09=09=C2=A0=C2=A0 "%20s %5s %3s master a %5s %10s %*s\n",
> +=09=09=C2=A0=C2=A0 "%20s %5s %3s master a %5s %10s %*s %20s\n",
> =C2=A0=09=09=C2=A0=C2=A0 "command",
> =C2=A0=09=09=C2=A0=C2=A0 "tgid",
> =C2=A0=09=09=C2=A0=C2=A0 "dev",
> =C2=A0=09=09=C2=A0=C2=A0 "uid",
> =C2=A0=09=09=C2=A0=C2=A0 "magic",
> =C2=A0=09=09=C2=A0=C2=A0 DRM_CLIENT_NAME_MAX_LEN,
> -=09=09=C2=A0=C2=A0 "name");
> +=09=09=C2=A0=C2=A0 "name",
> +=09=09=C2=A0=C2=A0 "id");
> =C2=A0
> =C2=A0=09/* dev->filelist is sorted youngest first, but we want to
> present
> =C2=A0=09 * oldest first (i.e. kernel, servers, clients), so walk
> backwardss.
> @@ -100,7 +101,7 @@ static int drm_clients_info(struct seq_file *m,
> void *data)
> =C2=A0=09=09pid =3D rcu_dereference(priv->pid);
> =C2=A0=09=09task =3D pid_task(pid, PIDTYPE_TGID);
> =C2=A0=09=09uid =3D task ? __task_cred(task)->euid :
> GLOBAL_ROOT_UID;
> -=09=09seq_printf(m, "%20s %5d %3d=C2=A0=C2=A0 %c=C2=A0=C2=A0=C2=A0 %c %5=
d %10u
> %*s\n",
> +=09=09seq_printf(m, "%20s %5d %3d=C2=A0=C2=A0 %c=C2=A0=C2=A0=C2=A0 %c %5=
d %10u %*s
> %20lld\n",
> =C2=A0=09=09=09=C2=A0=C2=A0 task ? task->comm : "<unknown>",
> =C2=A0=09=09=09=C2=A0=C2=A0 pid_vnr(pid),
> =C2=A0=09=09=09=C2=A0=C2=A0 priv->minor->index,
> @@ -109,7 +110,8 @@ static int drm_clients_info(struct seq_file *m,
> void *data)
> =C2=A0=09=09=09=C2=A0=C2=A0 from_kuid_munged(seq_user_ns(m), uid),
> =C2=A0=09=09=09=C2=A0=C2=A0 priv->magic,
> =C2=A0=09=09=09=C2=A0=C2=A0 DRM_CLIENT_NAME_MAX_LEN,
> -=09=09=09=C2=A0=C2=A0 priv->client_name ? priv->client_name :
> "<unset>");
> +=09=09=09=C2=A0=C2=A0 priv->client_name ? priv->client_name :
> "<unset>",
> +=09=09=09=C2=A0=C2=A0 priv->client_id);

Similarly to Tvrtko's comment on the other patch: drm_file.client_id is
a u64, so we don't have to print it signed with %20lld, do we?

P.

> =C2=A0=09=09rcu_read_unlock();
> =C2=A0=09=09mutex_unlock(&priv->client_name_lock);
> =C2=A0=09}

