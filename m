Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED386CCCCC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16D510E47F;
	Tue, 28 Mar 2023 22:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7845910E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:08:13 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 d22-20020a9d5e16000000b0069b5252ced7so7205362oti.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680041292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cu22PJorCWhuf4vPHhObfoBwmEd2pkkUaFILRb/wiso=;
 b=FTjKF+3odZjYuy9IbTp26OcP+mAuPS0ZT8jODp/+liFC+frLTEcXsn9i4Aip4lE90z
 BQnNxpTLIMOr34Ry8Tn69AMRkskwY/Tg8/FCWNDEe3TZbt080iyDLYbLQCA8M5P6G+Mb
 mxJ1Ur93lItChj9cK1eHf7XbWnfvZu4dJHIsM8s8igdZV2ACaTh88OjQUlD0h7MdoadR
 sThFmrWh3v2YvY83sussBXtb9eDWUUO61Crp4NQ/HwoHD+RZDOI0T3iTwdBxVPqHMoBz
 q/M3SwpdDcw7lHsDph0NBNt271QoXB4KcE1unW+BLDerWljXLbRoIzoJDdpbZ9KxkfbA
 EQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680041292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cu22PJorCWhuf4vPHhObfoBwmEd2pkkUaFILRb/wiso=;
 b=SN23P4hF6KmjSKdls89cL039OfCx6zyjZRAsypCaQ5iWJjAmW2rA5v4G6CLMaR6ECk
 gbwnF8RORoNW6jySDmUKW9w13Z2vKaVdJ7TdQjtmte3LHPtJ5WLqiJuAH8rth1ESGJ0R
 uzeOhr8lkLl/dP88ERnqgzyBWGkK+9e4TqmdI5Qvy5SCUmmNYCrD1JGvqX1UyPvJcV6u
 2lQb02rcyC1vOwPI4jp6HOZ25J+mrjl11VeQfy9eFk/Ahnt5kTInMI1XkUj0WybZDXuB
 P88lXMK5dpMePSLcP27G18XKn2nW2uyeSAgh2WRKNg6Uz7YniDELq/OlZ2ODVrApvr/J
 qELg==
X-Gm-Message-State: AO0yUKXFNzz63K2rWlmi/ZoZnxyoequr2PY1XU8X4jQrNhxxC2ttY32E
 xaB7zrmRkVpsXq24OlkmJHgkIsQlVNmBPatlKsk=
X-Google-Smtp-Source: AK7set9L8A9gT6WeQ9g/Jg/8NHmkFzpvmXfU+fIE8bnirz24mLvXhASqiQxTHsAGcPHDgXpxbBh2hxIfxipz3UZy6vg=
X-Received: by 2002:a9d:7301:0:b0:696:f275:a60d with SMTP id
 e1-20020a9d7301000000b00696f275a60dmr5342452otk.7.1680041292591; Tue, 28 Mar
 2023 15:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGvoP9_FERdL6U8S2O-BVt-oAUgAytbE6RvygsoAOwOHvw@mail.gmail.com>
 <ZCMhhToEdWVAEtBh@phenom.ffwll.local>
In-Reply-To: <ZCMhhToEdWVAEtBh@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Mar 2023 15:08:01 -0700
Message-ID: <CAF6AEGsukWdjzwvcjAk8mqo4CMRvp6Q+K9K=UuJyUEO-y6wa7A@mail.gmail.com>
Subject: Re: [pull] drm: dma-fence-deadline-core for v6.4
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 10:19=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
>
> On Sat, Mar 25, 2023 at 11:24:56AM -0700, Rob Clark wrote:
> > Hi Dave and Daniel,
> >
> > Here is the series for dma-fence deadline hint, without driver
> > specific patches, with the intent that it can be merged into drm-next
> > as well as -driver next trees to enable landing driver specific
> > support through their corresponding -next trees.
> >
> > The following changes since commit eeac8ede17557680855031c6f305ece2378a=
f326:
> >
> >   Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/drm/msm.git tags/dma-fence-deadline-co=
re
> >
> > for you to fetch changes up to 0bcc8f52a8d9d1f9cd5af7f88c6599a89e64284a=
:
> >
> >   drm/atomic-helper: Set fence deadline for vblank (2023-03-25 10:55:08=
 -0700)
>
> Ok apparently there's only igts for the sync_file uabi and the only only
> userspace for syncobj is the mesa mr that is still under discussion :-/
>
> Yes I know there's a clearly established need for something like this, bu=
t
> also in drm we don't merge conjectured uabi. Especially with tricky stuff
> that's meant to improve best effort performance/tuning problems, where yo=
u
> really have to benchmark the entire thing and make sure you didn't screw
> up some interaction.
>
> To make sure this isn't stuck another full cycle, is there a way to wittl=
e
> this just down to the kms atomic flip boosting parts? That way we could a=
t
> least start landing the core&driver bits ...

I can drop the sync_file part for now.  I'm not sure that there is
really any discussion on the mesa MR which would change the kernel or
uapi side of this, but I can re-order things so the syncobj patch is
last in case you want to pull HEAD~1 and hold off for a few days on
the syncobj patch

BR,
-R


> -Daniel
>
> >
> > ----------------------------------------------------------------
> > Immutable branch with dma-fence deadline hint support between drm-next
> > and driver -next trees.
> >
> > ----------------------------------------------------------------
> > Rob Clark (11):
> >       dma-buf/dma-fence: Add deadline awareness
> >       dma-buf/fence-array: Add fence deadline support
> >       dma-buf/fence-chain: Add fence deadline support
> >       dma-buf/dma-resv: Add a way to set fence deadline
> >       dma-buf/sync_file: Surface sync-file uABI
> >       dma-buf/sync_file: Add SET_DEADLINE ioctl
> >       dma-buf/sw_sync: Add fence deadline support
> >       drm/scheduler: Add fence deadline support
> >       drm/syncobj: Add deadline support for syncobj waits
> >       drm/vblank: Add helper to get next vblank time
> >       drm/atomic-helper: Set fence deadline for vblank
> >
> >  Documentation/driver-api/dma-buf.rst    | 16 ++++++-
> >  drivers/dma-buf/dma-fence-array.c       | 11 +++++
> >  drivers/dma-buf/dma-fence-chain.c       | 12 +++++
> >  drivers/dma-buf/dma-fence.c             | 60 ++++++++++++++++++++++++
> >  drivers/dma-buf/dma-resv.c              | 22 +++++++++
> >  drivers/dma-buf/sw_sync.c               | 81 +++++++++++++++++++++++++=
++++++++
> >  drivers/dma-buf/sync_debug.h            |  2 +
> >  drivers/dma-buf/sync_file.c             | 19 ++++++++
> >  drivers/gpu/drm/drm_atomic_helper.c     | 37 +++++++++++++++
> >  drivers/gpu/drm/drm_syncobj.c           | 64 ++++++++++++++++++++-----=
-
> >  drivers/gpu/drm/drm_vblank.c            | 53 +++++++++++++++++----
> >  drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++
> >  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
> >  include/drm/drm_vblank.h                |  1 +
> >  include/drm/gpu_scheduler.h             | 17 +++++++
> >  include/linux/dma-fence.h               | 22 +++++++++
> >  include/linux/dma-resv.h                |  2 +
> >  include/uapi/drm/drm.h                  | 17 +++++++
> >  include/uapi/linux/sync_file.h          | 59 +++++++++++++++---------
> >  19 files changed, 496 insertions(+), 47 deletions(-)
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
