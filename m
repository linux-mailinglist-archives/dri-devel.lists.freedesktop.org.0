Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E28A4684
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 03:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7E710ECBF;
	Mon, 15 Apr 2024 01:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BDPEej/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9389D10ECBF;
 Mon, 15 Apr 2024 01:18:44 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-570175e8e6fso1062510a12.3; 
 Sun, 14 Apr 2024 18:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713143923; x=1713748723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+XqQYX6j74TVTNZkVvf9TiEg5jTs7E3pT/qOHAJIRE=;
 b=BDPEej/04lLoVcgOuf6huOp5cTCWlMDwKlamxv3U0uGXjO9qb2cNKxgcAMioz2U+JC
 UXucVggJvHseCB6KtqN8GbAZ8vbwf53e8XamN/rz1N1voDGdAZnTbnlambq8MDbCa6va
 OeMHpKNQ9cgUNhYtNg1AUwAY1/H2iiIhD8e9Ncm4DfCHs7fSeRb2TiGs/kKPJ7pLwQYv
 atqogjDHtK0LgxvTga02FkNzXhvph7b7fzCQvkDEIhf33NRjQ/nk0zTFgRK7s1MliC3s
 xMQmsR/RKbCBG1ruEL4oWEVTWXTEr04YYoAgFku8MXMQUN04Pe42H+TFfe3XvzQydOJG
 QYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713143923; x=1713748723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+XqQYX6j74TVTNZkVvf9TiEg5jTs7E3pT/qOHAJIRE=;
 b=CmFv4qLOt4kt26ter6J8kFOUBe4SW3fD0E4nS9l6ERBbjWsXT1O/4IHEn5R0e7izEw
 bi9I/Rotpd+iFjTpC8bADGyMboVwv4fZTA9F3C4ugv831b9rtxP7HFyFma0u4bdb+ws6
 icbTMNsLE6kcdo5I9eDnmM6G8lb1PLJQ+xKPInAfhk7K5RAbj9Opoq7xiLT2vS1Us9m5
 EmLGiLtC1bvGXhS+V01YMc2XFH/Wy058tYy0QeDs+gFmttcw2zrohCtmcVVqPcKFuZKh
 UAGnSpHs/g67KEJA0Du/QqUxXZzcg6aE0OkS6EZHk2A4WfKY1wHx9HWzXjnoOsEXtcn0
 JzuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN4gMR12X8+Dc9afyPYtEm6IXu5hRDNIPIwo9rN4rYlOSw8VU6hnTfa4gyFn9YfhJvWerf6kT4gOK2jCDOh8/CT0A5L5rJgGxedl+a1OvUSAOwmpIM+kSI/HRwmxxUZ3BdPbnGa3DWDh7swQ==
X-Gm-Message-State: AOJu0YzHVOnZLu2AzUPDcgMyHyrtZn25t+wXk5LjPVyOtF0hu1T1P530
 aebAjiMH/RGt1KRGvqj6xbSJSmTnVh16LKALy1JRybqkapf2ZH7CFeco08xUuGSyiaFpRADbVtV
 bwqa3uOzmX5cyJiMJam06dB6QGm2x7j8F
X-Google-Smtp-Source: AGHT+IGnYT7NaV2BdrGRbTU3oSvqLMFMCJ66KWPYOl5ZrgmLYsx69G0pKUpgkJ8G+ZYW51R1IrNjaxVD/ur8UtaMQso=
X-Received: by 2002:a17:906:b2d8:b0:a52:5925:2a31 with SMTP id
 cf24-20020a170906b2d800b00a5259252a31mr513102ejb.29.1713143922536; Sun, 14
 Apr 2024 18:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240405152951.1531555-1-nunes.erico@gmail.com>
 <CAKGbVbszmRpWfaXVjQ83RiFBapjent9UKM=JcGTMVsOk3bqJkQ@mail.gmail.com>
In-Reply-To: <CAKGbVbszmRpWfaXVjQ83RiFBapjent9UKM=JcGTMVsOk3bqJkQ@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 15 Apr 2024 09:18:30 +0800
Message-ID: <CAKGbVbvoBf79NZFHiKJHKvOn5qqKYCy4JTEgSYj1uzJZmKAdAw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/lima: fix devfreq refcount imbalance for job
 timeouts
To: Erico Nunes <nunes.erico@gmail.com>
Cc: anarsoul@gmail.com, dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 christian.koenig@amd.com, megi@xff.cz, linux-kernel@vger.kernel.org
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

applied to drm-misc-next

On Sat, Apr 6, 2024 at 3:32=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrote:
>
> Serial is Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> On Fri, Apr 5, 2024 at 11:31=E2=80=AFPM Erico Nunes <nunes.erico@gmail.co=
m> wrote:
> >
> > v1 reference:
> > https://patchwork.freedesktop.org/series/131902/
> >
> > Changes v1 -> v2:
> > - Split synchronize_irq of pp bcast irq change into (new) patch 2.
> >
> > Erico Nunes (3):
> >   drm/lima: add mask irq callback to gp and pp
> >   drm/lima: include pp bcast irq in timeout handler check
> >   drm/lima: mask irqs in timeout path before hard reset
> >
> >  drivers/gpu/drm/lima/lima_bcast.c | 12 ++++++++++++
> >  drivers/gpu/drm/lima/lima_bcast.h |  3 +++
> >  drivers/gpu/drm/lima/lima_gp.c    |  8 ++++++++
> >  drivers/gpu/drm/lima/lima_pp.c    | 18 ++++++++++++++++++
> >  drivers/gpu/drm/lima/lima_sched.c |  9 +++++++++
> >  drivers/gpu/drm/lima/lima_sched.h |  1 +
> >  6 files changed, 51 insertions(+)
> >
> > --
> > 2.44.0
> >
