Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B07C8FDF4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 19:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D5810E856;
	Thu, 27 Nov 2025 18:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gSBD+MFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEC710E856
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 18:08:58 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-640d43060d2so882263d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 10:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764266938; x=1764871738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OlwM0z5g5v7473A/Nkt5Kn67SOBhmdJC6vwSe3FEQo=;
 b=gSBD+MFNCmZADQS5O31sjNqBfsWFld23hsD/q26HJj6uHnlmfnCvGwPjlHVgNnfUP8
 Now6o5sh0LWbxlEJb+Uuu+GFa8vc7ajh+aVc6gU0fuPJIDSfHdlGj6WC8WPXfgRhF1lQ
 FkRHE148jjCVZWY64p37PwToHtjTzMjxofL2cK2+1b0InNu5KKLKq+LsbGwDNTDvXLj9
 Q5JP0SWbof1gGdlKbJ+dMHzJTKyCZgZSksqhTLm151YGBdAe9lHJWFCt2iq+DA12B3Ex
 R56YiNBVbSDna5bopGu8WVLyNQs8Gt5PFQuY9Gqh/0PlVw9apSCC8D+ZyuerZIxcYpQE
 VpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764266938; x=1764871738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5OlwM0z5g5v7473A/Nkt5Kn67SOBhmdJC6vwSe3FEQo=;
 b=ZH7M4ZKKhldcXjvWEzFmcCaC9GSw6q2Q9Fb5Nnh63hWiVj26q1u8DHVs5kl6VV3sIp
 r5sGYE7nSm2/fopU+x31QzQSM8IUWL0m/ZQEI7ULi8udbFUGUd1VFiRgCtFl3GF516nq
 tcyRgTWpOQt7n9iovqO+5Pr6CvxCQ3qfOYzpd/bYGJ/ecTVrmvVZIHtoPAFKWLMhMMyM
 0YQ0pPghmAR6jvZ/6Zs43GAizboMwBjXpzhS5qe8eJtYS0kUUh/uKcP3FKNfqGdKjMv0
 LFgQJS4hYv/fXumh0sMCQk3tV/jm66wVhJkK5f7HG5TA/bn5MhoC5KFFOkj5qjeg/IxM
 l0Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlLx9SOWwxGpLRAUlnopTcTHONmK9WJnh22Q99z+iIokhBk3xsu6UnHGfUrl872ZACjEm8fTC42qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbonnwOXxE89nYCnMTowWwE7O9QjexNFMg7S8DFXHyJzb5K6k0
 8ywKd3jHCRCTM6D1/hXCgdIqR3dMpKdX9z0nqbeCskbBdXT8R7AjgA/tokFN57lFPhUIzEW1WzW
 4gMdZ62OZ4UAlANieFAAH9ZAmFgAmfaI=
X-Gm-Gg: ASbGnctJvw5F435prbV8XYjvnhNU9ujvZr6zQclxsG4FKXO2tjys2jTN7uHlrZVqp7+
 BVxI+4bjVzGiQEcq/BEYq3vHw17IULyyHGldibcgr+8CX3wkbeNLFn/oRjl3rNvjIIN48f9BegO
 a+JUw2Fq9ijfrc4ckL6lTOeh1IJSRrlVcOx68wxD78avX2w81E69yRVjog0imIe0IWywc8A2MI1
 GnisRlgHJyJYOHAtsT/InIwI43YOcdZnQnC5m+WP5QC+gBbx4E6M4fgJ4OGO2UTv/vImcORV4sk
 TZ7i/02b/x+kg19V8PlxS+ah
X-Google-Smtp-Source: AGHT+IG25jJ4rxIEzwV4LKMF9Y24Dh3uJtJaNu/juLt2IazvsAauBTtSqva3mB5ZbU3yyo8nJI8MxgWPJLViMiBxETA=
X-Received: by 2002:a05:690e:191:b0:63f:b446:7019 with SMTP id
 956f58d0204a3-64302acdb13mr13598091d50.64.1764266937868; Thu, 27 Nov 2025
 10:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
 <20251112115142.1270931-8-boris.brezillon@collabora.com>
 <CAPaKu7SDz8MjHdpEUGBmNfh6Z2EC4CB6vXo74ZzVQUOC_=9nHg@mail.gmail.com>
 <20251127154658.4b90cc57@fedora>
In-Reply-To: <20251127154658.4b90cc57@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 27 Nov 2025 10:08:46 -0800
X-Gm-Features: AWmQ_bkcWmSZ7NKCPcVWHMsfRDOaYYKwgGJKOl-Yz-kqisbineee6dl8AmtB6Rw
Message-ID: <CAPaKu7TL9VFCBxk+rXhGw7jmMMbWQO=CE00fB3h0=JMNCnDUtw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/panthor: Make sure we resume the tick when new
 jobs are submitted
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>, 
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
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

On Thu, Nov 27, 2025 at 6:47=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 26 Nov 2025 14:57:32 -0800
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > >  static void queue_stop(struct panthor_queue *queue,
> > > @@ -3202,6 +3215,18 @@ queue_run_job(struct drm_sched_job *sched_job)
> > >
> > >                 group_schedule_locked(group, BIT(job->queue_idx));
> > >         } else {
> > > +               u32 queue_mask =3D BIT(job->queue_idx);
> > > +               bool resume_tick =3D group_is_idle(group) &&
> > > +                                  (group->idle_queues & queue_mask) =
&&
> > > +                                  !(group->blocked_queues & queue_ma=
sk) &&
> > > +                                  sched->resched_target =3D=3D U64_M=
AX;
> > The logic here should be the same as the first part of
> > group_schedule_locked. I wonder if we can refactor that as well.
>
> I addressed everything you pointed out, except for this. The tests in
> group_schedule_locked() are two intricated with the rest of the logic to
> be easily extracted into some helper. I'm happy to review such a patch
> though.
Sounds good.
>
> >
> > > +
> > > +               /* We just added something to the queue, so it's no l=
onger idle. */
> > > +               group->idle_queues &=3D ~BIT(job->queue_idx);
> > group->idle_queues &=3D queue_mask;
Right, should have been "group->idle_queues &=3D ~queue_mask;".

> >
> > > +
> > > +               if (resume_tick)
> > > +                       sched_resume_tick(ptdev);
> > > +
> > >                 gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1)=
;
> > >                 if (!sched->pm.has_ref &&
> > >                     !(group->blocked_queues & BIT(job->queue_idx))) {
