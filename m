Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F4B45948
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFB910E0CC;
	Fri,  5 Sep 2025 13:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="bxLavD/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F34F10E0CC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 13:39:40 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e9e87d98ce1so324314276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 06:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1757079579;
 x=1757684379; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QS92WKR70glXKDxwb7gpv6vYCrnQlNSeR6V3mFeP7Fo=;
 b=bxLavD/a/kNfH/J6TvNkuECBJArKj5pt/o+LZdPOKXJCv0XrhAQWD1Zvdvj0ef1rwV
 37Xmi24kiRhpoAksALyRbBDu4X+KwT3JzwRKI26j9bBJ9w8ZE2YqYsP6gm5z3gnYmWwy
 8DwLRlTQcdvk+y5RV3kPBFMPJUPCmvLet9jxAF8tl7LMEWTE4b8Bd7u5RPj8Vcur7K+L
 4e4I/e8SVQa9ZvDwTY/VEb5j0xeQeQrcJaPuhenkONZBPlIZ9cjH+SGQbrRAl87YBeUq
 bAbXnBB76CAiAdxPM3SaBG8EAf7knCVsZ53Vg0Vu07EVoFXoFSyyHtCqYVnT/AdO+f4+
 yzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757079579; x=1757684379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QS92WKR70glXKDxwb7gpv6vYCrnQlNSeR6V3mFeP7Fo=;
 b=cQ2ngJq8aVr90Mwk42If4S87ZM3b0WROByNvA+njxs/U7cS2Uft6mA+fa5gdTm6fJ5
 Kb7pjIjUeWGte959b9ROH5eSrfFURr3DzvEC81uNmphGGZX0OMURA6qXrgAvBhO7TVfY
 NBW3Kts3FDoHsyMBN+gYv08EWXPftmXGi0dQmXoDNadqTaFFqvNviWVPuZCFCaY49RUn
 4p0skic51T8L8wvwVV3Wo3wmpl9n6xc2SUu1WI3YEt4ux+a4ygGJCmTU9H3y4Kl1GRyP
 EFvL1PcuI8g+AJHjb2H3kzW0S3EQHfba9zvouHSOs/VowCBCQDxKPqe/SeD3pvAd86uJ
 N96w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWok4bIbKybAhvw4JYXYvVtc9zZfZZTa7xHlKVNdODwUqw2WCWdcpX1wPmnBU4VMrSeDvE1P/ZSn6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxayJ+MO5H0kmtdJBJlDQ8z8Z/YJLUJcb6Catu1vi5nX+SuOdBA
 hn094YijtG/7Tpbb77Q7flex7KuipT1ZVGFVqCJi9ILHbmMC/AxyBuEBnosS6Zr9kVIeqXj1U6/
 eTsMa6u68Tg==
X-Gm-Gg: ASbGncsnEMxPz4lHStkunuLV4ZCjEz2Glei8Nf62APodRMPmr+EDdvjTrKiRPAuI2B/
 hMKwDF1hTMuCgPUtdC1NQXhMXS7FROMb4E952x7LsjS/TOdH34d+W/GBnER6u55Yfz9ntBqkIMu
 /jjHF6yfTd5k6lKWAFSpxO+joPuZG2bN1k59ykzotW6mrVV7oSNOCs+r/77Bw1cvZd1VMd0jbSX
 XQW/Ombr/h1R6LJ/9RX1Zd/TfCaBfHvlIcBeY7NLdNWRubBAlDdOnM8KTJ83UMbW9kGLO9rxltq
 ROlXicGOnAcfQQJCtPaYxs5MmDRaeKvD+UPUI6ygcRtCb6+cIXuaVJJts55ixDF/xuMH2oI10YD
 rxGvhjhxfhDzj/T+oSCg+pASGJ+kT8ukuLTwGliK+gaoLCdX0gKZqbSDK5kR4kV65PQ==
X-Google-Smtp-Source: AGHT+IGNxalRq+eM3xy0mAcejLgzjiVVQKlj6O41Qx6TwdwAwhyZpPGTEzwteivQfodXMjONrYr2tA==
X-Received: by 2002:a05:6902:2491:b0:e9d:6c55:b932 with SMTP id
 3f1490d57ef6-e9d6c55bb99mr6666813276.5.1757079579252; 
 Fri, 05 Sep 2025 06:39:39 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e9bbe05caf7sm3094422276.18.2025.09.05.06.39.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 06:39:37 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e96d8722c6eso2350194276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 06:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXhXYSmVSa2+V0EJ+dr8qF8+q/qi0tPaeewAtErkE6Psb9rL/Y2s41MQTZyuiASy7uVHqBN6V2hnAs=@lists.freedesktop.org
X-Received: by 2002:a05:690e:15d3:b0:5fc:1baf:eaf8 with SMTP id
 956f58d0204a3-6017609e045mr4653419d50.13.1757079577439; Fri, 05 Sep 2025
 06:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
 <20250822134348.6819-2-pierre-eric.pelloux-prayer@amd.com>
 <abb776bc-5b13-4db7-9421-59259119b859@ursulin.net>
In-Reply-To: <abb776bc-5b13-4db7-9421-59259119b859@ursulin.net>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 5 Sep 2025 15:39:25 +0200
X-Gmail-Original-Message-ID: <CAAObsKBi9i3SKbWKsbkzX+pZcaa=UggwE=b5Yh19A+Wf3OM7QA@mail.gmail.com>
X-Gm-Features: Ac12FXzX5ADfZYxyJV2zTT7vkoFYEHBEAkT5kW_j772qczG1lJB5zDw-0vxN7ZY
Message-ID: <CAAObsKBi9i3SKbWKsbkzX+pZcaa=UggwE=b5Yh19A+Wf3OM7QA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/sched: limit sched score update to jobs change
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
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

On Mon, Sep 1, 2025 at 11:20=E2=80=AFAM Tvrtko Ursulin <tursulin@ursulin.ne=
t> wrote:
>
>
>
> + Tomeu and Oded
>
> On 22/08/2025 14:43, Pierre-Eric Pelloux-Prayer wrote:
> > Currently, the scheduler score is incremented when a job is pushed to a=
n
> > entity and when an entity is attached to the scheduler.
> >
> > This leads to some bad scheduling decision where the score value is
> > largely made of idle entities.
> >
> > For instance, a scenario with 2 schedulers and where 10 entities submit
> > a single job, then do nothing, each scheduler will probably end up with
> > a score of 5.
> > Now, 5 userspace apps exit, so their entities will be dropped. In
> > the worst case, these apps' entities where all attached to the same
> > scheduler and we end up with score=3D5 (the 5 remaining entities) and
> > score=3D0, despite the 2 schedulers being idle.
> > When new entities show up, they will all select the second scheduler
> > based on its low score value, instead of alternating between the 2.
> >
> > Some amdgpu rings depended on this feature, but the previous commit
> > implemented the same thing in amdgpu directly so it can be safely
> > removed from drm/sched.
> >
> > Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@a=
md.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 5a550fd76bf0..e6d232a8ec58 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *r=
q,
> >       if (!list_empty(&entity->list))
> >               return;
> >
> > -     atomic_inc(rq->sched->score);
> >       list_add_tail(&entity->list, &rq->entities);
> >   }
> >
> > @@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq=
 *rq,
> >
> >       spin_lock(&rq->lock);
> >
> > -     atomic_dec(rq->sched->score);
> >       list_del_init(&entity->list);
> >
> >       if (rq->current_entity =3D=3D entity)
>
> LGTM.
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Only detail is, I did a revisit of the scheduler users and it looks like
> the new rocket driver is the only one other than amdgpu which passes a
> list of more than one scheduler to drm_sched_entity_init. I don't
> *think* it would be affected though. It would still pick the least
> loaded (based on active jobs) scheduler at job submit time. Unless there
> is some hidden behaviour in that driver where it would be important to
> consider number of entities too. Anyway, it would be good for rocket
> driver to double-check and ack.


Hello,

thanks for pinging. I think it should be fine for Rocket.

Acked-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Regards,

Tomeu
