Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7CB18762
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 20:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0047A10E298;
	Fri,  1 Aug 2025 18:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hdgThSDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7508710E298
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 18:34:39 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-332559ace6eso1987991fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754073278; x=1754678078;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CfmmilxacBNB3HQuUVitVRIgdZJYz2bsJ5WOyUMIET8=;
 b=hdgThSDgs4tjHkWYlF6Glp703B/XIcG2tAPEk8cIcukMZIID9gRjvlvOB04LNdSCQa
 nMHYj4ITCNkiEIm5i+JgcQmIfFhMrRkEtrIfal/k0gzu5CJANSN/W/3zjFBjtify8gpi
 ltEeTU76bNN8V1BC/TcPK6a8ucYtAqbmIpuQysQ2Ape4zrS9OMKFYdxjaAbbowwjQsTX
 90uJIZGdCFE7R2DZU33tFRarfgz8JmfRfCW0vgcR/scxwhhsiTtotyQbRJU9vSk6ZAny
 gfTqR7ZctWdXbhlK8Qxv0zk19usUB8oov5yOmWfR2y9pAoz4PKMsEajEVtqGqA2S80dl
 uvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754073278; x=1754678078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CfmmilxacBNB3HQuUVitVRIgdZJYz2bsJ5WOyUMIET8=;
 b=HV1JFqhuFYNhPJ0f7XQiZyiWfkgw41SsDBf3v8mFr1QOM144+bPTnmetzQdC4MMGrJ
 YJtotEp+g4KXjijszrnowlAgZ4m1h3Gb7lVo7SR8ZFb2kl8tZ31154Xw7gGoYbkvKcgB
 mZ9xJQSBZzWX9SV5ZWZekEvcjqPGIpZarM+ws1EFl3GMYp8EVP42E+a5W41lhugtUlJX
 FbnrLqPPNo5jpP1DLvm7ShvQMt4DwgWR62SRlgOCnFRF8Z18DjfuzcfM3dxQLrBRov0L
 jBmSEma1iO3ga7NwtJ0jGdeoAd1YHQx16dsAVbW5CE6G4M8lWMh1neVHBZBoSg9hN4EV
 UlJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlsa8w/jWt5j2F+NqcejGuowZIU7E+px8HYcfww658enRZk1Vd7YilxoQnVIsTy/B2RU9+Ys+XFCQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+mDmhtLG2bGaUxSqWgY8ImtvwBb13g8qOGspjkjZzZwoWVGCH
 ykS/bynjr2BBQA7fnnasIZqu7b7LvysoNChdrwEtluifpo8hCmpGJwyAruJYhMfKlHPzhthoPUL
 viH/NAH5GeA3rAsHMual225DVCBzQapv20bDhsAY=
X-Gm-Gg: ASbGncsr3DMwmoUTwN075fbEyGJpeO0cw8j55jg6DtSkrxIN1eKdOBiXJQmboPgYLpz
 eS0znZ19CyaVC4/8lGjI9tqk56h3NSnBuD5Ge/KzIHNeMrou/zudRo4IvjhK7v0rPlkuxy79lVo
 gGnofvYD/P6DT/MQplOugtjBxFM9xPkV8ZO8UFQEYjku78gh5tI3fkU7I55qcQcaW7yOXYDEOhx
 LM92OYwAeHgzXGzC0M89ueszgqNpCrD9vqq
X-Google-Smtp-Source: AGHT+IFPrpz3YlLTmy9cZZYTjMyKs1oACsMLtHEmi8MsbB6UmvWxU3JCLYrnFV2pZYPjyaD5Q0TTQdIqF+07Z6GOzQQ=
X-Received: by 2002:a05:651c:4003:b0:32c:a006:2a36 with SMTP id
 38308e7fff4ca-332567a28fbmr658461fa.20.1754073277439; Fri, 01 Aug 2025
 11:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <68894443.a00a0220.26d0e1.0015.GAE@google.com>
 <20250731201337.274382-1-jstultz@google.com>
 <2812bdc6-8d7e-48a3-8f5b-a26cd5d18c32@amd.com>
In-Reply-To: <2812bdc6-8d7e-48a3-8f5b-a26cd5d18c32@amd.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 1 Aug 2025 11:34:26 -0700
X-Gm-Features: Ac12FXyDY8rQ-T1hgnVdu7ufq1UAYgfIRJxqNSHSNJPV0SOE_5MSe4NCClZEdvM
Message-ID: <CANDhNCrgxP+Ujvgpvd_0e5TM5Q-UTGfNmv=Lu3kn2MZ6wdS4Kw@mail.gmail.com>
Subject: Re: [RFC][PATCH] locking: Fix __clear_task_blocked_on() warning from
 __ww_mutex_wound() path
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Valentin Schneider <valentin.schneider@arm.com>,
 Suleiman Souhlal <suleiman@google.com>, airlied@gmail.com, 
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, kernel-team@android.com
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

On Thu, Jul 31, 2025 at 10:09=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
> At the very least I think we should make a local copy of "p->blocked_on"
> to see a consistent view throughout __clear_task_blocked_on() - task eith=
er
> sees it is blocked on the mutex and clear "p->blocked_on", or it sees it =
is
> blocked on nothing and still clears "p->blocked_on".
>
> (Tested lightly with syzbot's C reproducer)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 02c340450469..f35d93cca64f 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2165,6 +2165,8 @@ static inline void set_task_blocked_on(struct task_=
struct *p, struct mutex *m)
>  static inline void __clear_task_blocked_on(struct task_struct *p, struct=
 mutex *m)
>  {
>         if (m) {
> +               struct mutex *blocked_on =3D p->blocked_on;
> +
>                 /* Currently we serialize blocked_on under the mutex::wai=
t_lock */
>                 lockdep_assert_held_once(&m->wait_lock);
>                 /*
> @@ -2172,7 +2174,7 @@ static inline void __clear_task_blocked_on(struct t=
ask_struct *p, struct mutex *
>                  * blocked_on relationships, but make sure we are not
>                  * clearing the relationship with a different lock.
>                  */
> -               WARN_ON_ONCE(m && p->blocked_on && p->blocked_on !=3D m);
> +               WARN_ON_ONCE(m && blocked_on && blocked_on !=3D m);
>         }
>         p->blocked_on =3D NULL;
>  }
> ---
>
> End result is the same, only that we avoid an unnecessary splat in this
> very unlikely case and save ourselves some head scratching later :)

Good point. Thanks for suggesting this! I'll rework to include both
this and Maarten's suggestions.

Thank you for the feedback!
-john
