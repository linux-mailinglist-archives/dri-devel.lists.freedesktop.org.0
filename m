Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9078E973A72
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 16:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E694210E84A;
	Tue, 10 Sep 2024 14:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Vkfjpxk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BFD10E84E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:48:08 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4582b71df40so262061cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725979687; x=1726584487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXuvHsDaQa5JaJy5jQ+KF3M9U1DYD4thlJa2X3LO3FE=;
 b=Vkfjpxk+jNm4FCjpgCHhvxTYrOdAXJzOlG3jrD9snRwCrKbYX4Sb5oud8be5N7+FsC
 DcrfZUIuTpqhQzpaHPSXzXzA8CKLbVLxH4/jUh/ooTGsZjjQIUnJ5psH/2dzpJtLdZX/
 WEdGNFJfarr0nXdqrcKVabJOvXWvUkJunE6TFssGH4bnn3A4g89nNTUkQkabhA1DDi+o
 cDqdzuktFTife0wTOkmD2SqoSr7G+LoHL+I5U26LfGVhvk9k1FcxpFWhcnrUQPy5/l/P
 ynZ0Z+9W8S/LJpnKNtSJcqpR5cVodjpF/oN9bhRil9/Y3ZszNt6dWaeZgjsPj56Ot+P4
 pMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725979687; x=1726584487;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXuvHsDaQa5JaJy5jQ+KF3M9U1DYD4thlJa2X3LO3FE=;
 b=ijipUoCc5zWjp49W2kXCpqaf1Ksn34F3dkFhJVFurTeoC4N5VaS9AekRuSKo7vQDbx
 fOCQWA2YOZ/7rPiIJpFlZ5woRkT1yZSIeKPAKcv+AdxnGCg1c59iWXEZ+/fgyiyn6aKR
 iiiT3i6780979WwBrhQvHTWO6V4z9AJQi/fbQ47TfrQ5UKIBPcEFhauu2gN76mNMyfTf
 A0fjdl94rkYfNWD66pNjk8eIgA6JMrjrvWQ6Uchw8A5jYGFbBrDpRYYAiIXwxmBMdPTi
 Q7pW2Wdy8QZU5b8ehaH65Bxo6/VehGVgapLvM8AjgyKeYADIvfE+6Gv1w1F3Cj3RSvFI
 XpcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW8Lrcqy114mo6NOPbpC7yB6Rz3xr0CF7Z0ak/gAKySJ7kLSPKStN6QKUJ4a5vghKP2MsDfAqhfjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCVqcW54ZUc1nKIYwpJPobUIXQ8074b/e3MLTmTwvKVtdP1P2+
 A4+qPCAoFTORchA8IYm49NRUIQeTsoiQ03IVw45ytHnsxcsBPtpJofdbQmUOWsLMG/VShkRkkQj
 JgDaB/iD7QHmbnugXsJl6zFFgqxG53foNb110
X-Google-Smtp-Source: AGHT+IEq/HMZp5o3EyXBDHxohcy+QIAG1sIzXY3bhN/i50uhErJAdEz/UfNt8X3xCTRPtpghCBVQVMyvOC3kysU9hnI=
X-Received: by 2002:ac8:5dc6:0:b0:456:7ef1:929d with SMTP id
 d75a77b69052e-4583d0600f1mr4023421cf.12.1725979687336; Tue, 10 Sep 2024
 07:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240909205400.3498337-1-tjmercier@google.com>
 <c970dfb2-078c-4bf1-8b50-6e535cf4adf7@ursulin.net>
 <7aef07b2-9859-40a8-ba5b-22aba68c2d9c@amd.com>
In-Reply-To: <7aef07b2-9859-40a8-ba5b-22aba68c2d9c@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 Sep 2024 07:47:54 -0700
Message-ID: <CABdmKX2JRi-7x_pkSrkuwjzzjDnDQyMEcZmfWrn2AXLuOHQ6Qw@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Fix syncobj leak in drm_syncobj_eventfd_ioctl
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Xingyu Jin <xingyuj@google.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Sep 10, 2024 at 12:30=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.09.24 um 09:26 schrieb Tvrtko Ursulin:
> >
> > On 09/09/2024 21:53, T.J. Mercier wrote:
> >> A syncobj reference is taken in drm_syncobj_find, but not released if
> >> eventfd_ctx_fdget or kzalloc fails. Put the reference in these error
> >> paths.
> >>
> >> Reported-by: Xingyu Jin <xingyuj@google.com>
> >> Fixes: c7a472297169 ("drm/syncobj: add IOCTL to register an eventfd")
> >> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >> ---
> >>   drivers/gpu/drm/drm_syncobj.c | 17 +++++++++++++----
> >>   1 file changed, 13 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_syncobj.c
> >> b/drivers/gpu/drm/drm_syncobj.c
> >> index a0e94217b511..4fcfc0b9b386 100644
> >> --- a/drivers/gpu/drm/drm_syncobj.c
> >> +++ b/drivers/gpu/drm/drm_syncobj.c
> >> @@ -1464,6 +1464,7 @@ drm_syncobj_eventfd_ioctl(struct drm_device
> >> *dev, void *data,
> >>       struct drm_syncobj *syncobj;
> >>       struct eventfd_ctx *ev_fd_ctx;
> >>       struct syncobj_eventfd_entry *entry;
> >> +    int ret;
> >>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
> >>           return -EOPNOTSUPP;
> >> @@ -1479,13 +1480,15 @@ drm_syncobj_eventfd_ioctl(struct drm_device
> >> *dev, void *data,
> >>           return -ENOENT;
> >>         ev_fd_ctx =3D eventfd_ctx_fdget(args->fd);
> >> -    if (IS_ERR(ev_fd_ctx))
> >> -        return PTR_ERR(ev_fd_ctx);
> >> +    if (IS_ERR(ev_fd_ctx)) {
> >> +        ret =3D PTR_ERR(ev_fd_ctx);
> >> +        goto err_fdget;
> >> +    }
> >>         entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
> >>       if (!entry) {
> >> -        eventfd_ctx_put(ev_fd_ctx);
> >> -        return -ENOMEM;
> >> +        ret =3D -ENOMEM;
> >> +        goto err_kzalloc;
> >>       }
> >>       entry->syncobj =3D syncobj;
> >>       entry->ev_fd_ctx =3D ev_fd_ctx;
> >> @@ -1496,6 +1499,12 @@ drm_syncobj_eventfd_ioctl(struct drm_device
> >> *dev, void *data,
> >>       drm_syncobj_put(syncobj);
> >>         return 0;
> >> +
> >> +err_kzalloc:
> >> +    eventfd_ctx_put(ev_fd_ctx);
> >> +err_fdget:
> >> +    drm_syncobj_put(syncobj);
> >> +    return ret;
> >>   }
> >>     int
> >
> > Easy enough to review while browsing the list:
> >
> > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Looks reasonable to me as well.
>
> Reviewed-by. Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks!

> CC: stable?

Yes, I think we should. 6.6 and 6.10

> Let me know when you need someone to push it to drm-misc-fixes.

Anytime is good, no rush for this one.

>
> Regards,
> Christian.
>
> >
> > Regards,
> >
> > Tvrtko
>
