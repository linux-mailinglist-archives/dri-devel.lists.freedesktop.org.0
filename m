Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A12BB587DF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 00:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A4C10E5BF;
	Mon, 15 Sep 2025 22:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fkQa1e/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A172810E5BF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 22:52:05 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-336c86796c0so38221221fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757976724; x=1758581524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cm0/mnzPsesUmIeJ98TzZwQ2Akz/kNDhyhWBAXtAXDw=;
 b=fkQa1e/rVPdlv+8XiSStrAKRcRv45moqLUhxeyiaDESaWA+0FBv5AzS6ozJtCW7/Yy
 6P6zRSpxulPM2P+O1L4tvrI51haAhKyyDE2A2dq9WKYFIhe+nm9PlHQ7tstnZeE/Kroq
 aSWwobe/19QvvUUAjviXZV2Rvgw7xX14BPtR5HEYNhzbebonQqoAS9W3nIRmoE157D42
 hk3BxIECrOl3ZJ2B5vpjtz6IJwmQ8cRyC1bXdG+KNGsDA7DEwj4syOUtEZCwbyD80O/2
 Eb2LfDzS9m2J+EqUAzszJdMQ2QprUuVFnvEcjk/7C+N9WHAyqky8jITV8rakwOIyHcFg
 m0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757976724; x=1758581524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cm0/mnzPsesUmIeJ98TzZwQ2Akz/kNDhyhWBAXtAXDw=;
 b=wzcsN6R/ufW1yqDkmzMQdPeIpWDcDvl6uRU6uKfQ1643vh0h0Me9+Y7YSOf5864E6j
 EWw4NGiiU5LeGTUvtHXUo1Ax9dP5WTKqm5T1qkgXXcB/4Syvc68p7liLKMZXOml95vm5
 fcAeYCR9x2EqjMLfjxICIn26vxF13zwm4axXyUKEyT2DyReJiwuMcdADv6barGcrItX8
 on5vLNAiGaC7f+8AqtLURds7vXqThPe7dF7cEx9tWQm7d5sjNogRMA16d0xNe/ls5VKL
 nBM+iNJQ3BL5HEKyPOmXi4rtYdtYeoA1xEWthNBhvNYmEKYtIULrCAg8g9lBP/alh6+w
 Dxfg==
X-Gm-Message-State: AOJu0YziL+LbURoleUFcCSyIlPO81jW3aVavLdvNv5MCSQ03aNqL743Z
 /989vDGepwMLaUwRirWUUF2bnjMEm9RYgQAF/G9+xfMRIZcDm7Ute7/LuN1ezfGlSUhgKeegPZp
 HROPjv8hUFHJbzjBaQc58nLOYJvjIzhA=
X-Gm-Gg: ASbGncuxYO0pF/993tLzEaLYTUOxCu4bhPqYQgFFQ6rZH52fZJ0TSJsM9LWt8YTSfO4
 LhyQGr57C7L6LdTle/sTuFBebSrxUwVNAx+dE3V3svw0L2KI/I9cZ3f+9s/msGdntg6MyDsPhYU
 cER+e9SOy6tymGiXv+ZJR4jvZo7/06bO/uMCFynjUn/onoT8W1bUdvXhGY9VviAFQBw2XGQsSCm
 FSAHcY=
X-Google-Smtp-Source: AGHT+IHDRvcV0dV9VDhAcAMEZ21dqvL1noGOj01MZ+sfLv+YYHw5oyhSI+Q1GgqRspon0xC83RYI98h95ffW6T3retY=
X-Received: by 2002:a2e:a016:0:20b0:336:7e31:6708 with SMTP id
 38308e7fff4ca-351403eccb1mr33364351fa.37.1757976723624; Mon, 15 Sep 2025
 15:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250912134406.221443-1-onion0709@gmail.com>
 <62842992a3f18ca7c11e4887d3eced69644793ae.camel@mailbox.org>
In-Reply-To: <62842992a3f18ca7c11e4887d3eced69644793ae.camel@mailbox.org>
From: Luc Ma <onion0709@gmail.com>
Date: Tue, 16 Sep 2025 06:52:19 +0800
X-Gm-Features: AS18NWBzVkhxcm04lwXZqplHOT5g0VGEYgD3MlvxyGFbkTaem_RX_Qsv2EDXZCg
Message-ID: <CAB3Z9RJPdCu50esK2mg9NkVihuWmZn7hpDdxeMEN1FBNpFtBrg@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: struct member doc fix
To: phasta@kernel.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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

Hi,

On Mon, 15 Sept 2025 at 20:12, Philipp Stanner <phasta@mailbox.org> wrote:
>
> On Fri, 2025-09-12 at 21:44 +0800, Luc Ma wrote:
> > The mentioned function has been renamed since commit 180fc134d712
> > ("drm/scheduler: Rename cleanup functions v2."), so let it refer to
> > the current one.
> >
> > Signed-off-by: Luc Ma <onion0709@gmail.com>
>
> Thx for the patch.
>
> > ---
> >  include/drm/gpu_scheduler.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 323a505e6e6a..6c4d0563e3d7 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -546,7 +546,7 @@ struct drm_sched_backend_ops {
> >   * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_=
COUNT,
> >   *           as there's usually one run-queue per priority, but could =
be less.
> >   * @sched_rq: An allocated array of run-queues of size @num_rqs;
> > - * @job_scheduled: once @drm_sched_entity_do_release is called the sch=
eduler
> > + * @job_scheduled: once @drm_sched_entity_flush is called the schedule=
r
>
> The change itself looks correct to me; however, a function must be
> cross-referenced with parenthesis: "once drm_sched_entity_flush() =E2=80=
=A6"
>
> '@' is used for function parameters.
>
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#highligh=
ts-and-cross-references
>
> Please provide that change in a v2.
Thank you for pointing out that, I'll send v2.

>
> Thank you,
> P.
>
>
> >   *                 waits on this wait queue until all the scheduled jo=
bs are
> >   *                 finished.
> >   * @job_id_count: used to assign unique id to the each job.
>


--=20
Luc
