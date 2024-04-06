Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B543089A992
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 09:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EF210E26D;
	Sat,  6 Apr 2024 07:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i4BRM9bS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D3510E75E;
 Sat,  6 Apr 2024 07:32:50 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a51beae2f13so11925066b.1; 
 Sat, 06 Apr 2024 00:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712388769; x=1712993569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=013IZU5d3S0NSE/vfboHFT2kND7XDrhmbJn2/miWjio=;
 b=i4BRM9bSFuDJtkEiSpAOUvXCld84NVOviiNtkbMqPTm3OcbKdFH9rSCGJZpmku9ioR
 ag2lcjkgsERNxun4gEdmmKAaT9nYt5z5QJI3wNZ+2qXtWdHUHnyGihVRkwWzLq1firZn
 zm9Ogvxus6CuXMYdEoUH0l/8Iqs663hF856NT7GqeMMiwi2OZwVIIca7XbNrDuuGsmQ5
 TNZLK/mWQnGI4566VfUxpWPxEaqgHr/TSxpa1o3eknQx+WkiA6CK7BN6Vt4tUvfI15PM
 oucO+QQ9672O9OHjIM1X/xHWqQPkdVdQkj414xOsbMdOyIu1Oz66QcI6Tp0nTf5ytxm2
 8a0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712388769; x=1712993569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=013IZU5d3S0NSE/vfboHFT2kND7XDrhmbJn2/miWjio=;
 b=r8Gb5qSrFdfKkN9s69QV8AfUoDytEy+UsW3Ob/dYVcWaDsWGSGVCqK9i40bI05QczP
 nOdzel2nJbf05UoAHGSLHREHgZiQgau3SvnbORYEu2gEifMxgxeoGSDAFh8RkEO12fUL
 TXEg2W5VKHOPKNixoTBH3z0K7R8N90UMrYhp/gqZSqTFGEDG/k1tiudY6TfzOEKUolU7
 hRtxDtouxhl44aAwEF7I1RZqzq+i2P0f5ZGXK0RJHFHgyCKnh+bYxOJEC4SrmMDQ6ux9
 t9Go71F6jnZ7G4Z9YwRi4TcBfFnXlMHqJrk5sUhBiRsMRgUmOHSzpaXc9hMADoBNzK1a
 bKMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXax0o/DzABbBDPtYId77W3Gwm2TcNCZ5Mj1GYPIVmZZmjs5TI3FJBK63KpjlWOHMmO59MS775qXJAb03XvkIL6lI0ddnX372n/c8AyUfy7Egih4chGP7Crkro5DQsJy0WqLUJswoccNjIOcQ==
X-Gm-Message-State: AOJu0Yx/4KgbQh4ya4dn7ndJhXqneEJmhbkJjDdKVKUj0d7se9NVFBhb
 jKljEE4Ewms/9K1PEj6gRMCMrGaNYJm0NmGAa2XHlgzSBLwP1qlAiPB36q7qyajVFlRbj8YceWa
 R/0jUT7BnqyX+IvSud5ql3ForJNM=
X-Google-Smtp-Source: AGHT+IFfMYPeVHT6k5a4kWIko7MIMciS7wY1H9ZYhRPYpikHEHFMCapwLGgkvsgTPm9GQ6v8k595fKNbEsCUm3U4uEo=
X-Received: by 2002:a17:906:f909:b0:a47:3651:a302 with SMTP id
 lc9-20020a170906f90900b00a473651a302mr2066556ejb.42.1712388768454; Sat, 06
 Apr 2024 00:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240405152951.1531555-1-nunes.erico@gmail.com>
In-Reply-To: <20240405152951.1531555-1-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sat, 6 Apr 2024 15:32:36 +0800
Message-ID: <CAKGbVbszmRpWfaXVjQ83RiFBapjent9UKM=JcGTMVsOk3bqJkQ@mail.gmail.com>
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

Serial is Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Fri, Apr 5, 2024 at 11:31=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> v1 reference:
> https://patchwork.freedesktop.org/series/131902/
>
> Changes v1 -> v2:
> - Split synchronize_irq of pp bcast irq change into (new) patch 2.
>
> Erico Nunes (3):
>   drm/lima: add mask irq callback to gp and pp
>   drm/lima: include pp bcast irq in timeout handler check
>   drm/lima: mask irqs in timeout path before hard reset
>
>  drivers/gpu/drm/lima/lima_bcast.c | 12 ++++++++++++
>  drivers/gpu/drm/lima/lima_bcast.h |  3 +++
>  drivers/gpu/drm/lima/lima_gp.c    |  8 ++++++++
>  drivers/gpu/drm/lima/lima_pp.c    | 18 ++++++++++++++++++
>  drivers/gpu/drm/lima/lima_sched.c |  9 +++++++++
>  drivers/gpu/drm/lima/lima_sched.h |  1 +
>  6 files changed, 51 insertions(+)
>
> --
> 2.44.0
>
