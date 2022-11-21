Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE646328CF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 16:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B167510E06A;
	Mon, 21 Nov 2022 15:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DC710E06A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:58:39 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id q83so12918801oib.10
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G4Q+0MfaVGvddTD+8xtgNvdChtHP9WL1IrfM4mIdp8U=;
 b=eskIWZFK5N+Qzhoa5iX5oKoPLHzl9CG4du3z7W8zDsQjUFBgsOUXcaP0To7YMUy59z
 Pkj6PGk5z1bWu8Izb2p0b/L57NDJmJBVCvf7nCtc6fDgW/Jl2e+q4WZJx51flkH056sB
 n0j8SgTngmuljV9XEQsoldmpHYGrPm0yorH9j7NL1cm+K2NOWEyNmWaxHeltFf8EdmVQ
 3xcsLsGC9guCb1FXMomdTkp+0v9j8NxcnWin+Cd8ohRcsZneBfFyUNoSnLw/1IRP6399
 6DbdcuLrSIqXoqAdrHcTgMX+OxJQKvFzJlVqa0sjXpQtH6TOJiPrNV1Lc55IfNJszjF0
 lJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G4Q+0MfaVGvddTD+8xtgNvdChtHP9WL1IrfM4mIdp8U=;
 b=lr89oYF11q8Fc0BuKG5JYdKwCPAS0Kz2epCmrfrsKWngiY8BAW7dPJoVqUi2ZJiqME
 gzgcM3sGTzdJo4YW2ImLvglcSOIrb7jxwOCzjOy+lzQqEqT2GZF1y0Gq5DApZCJ8WPGr
 ZE5iaGdxH+qRlguLP4tkKpQwbaWHB3wzibBblU2m7T0OC/REnptroj2GoGwsOXAahf4W
 XxH5EHzJUmyUvk4IuVKkGGsAcUD7yx/Pzo1aZJohamJYfV4zAtvAr6lIMNVL/qZyEHUT
 kaa58D1q492ZtuOqiWeUZWu7QaNtJKbGdLO9rW/mPGFVZRbdW+IXa7xI3YdRaQZ2njE/
 4mIQ==
X-Gm-Message-State: ANoB5pkGMC8f4xP8MdQjDo2qF4i+RTvbEfY+5LlEFan6oSER8bVbXiFr
 UK118zbfepX/qtRd7L08LuPIWRRQhXcObM0Yl1o=
X-Google-Smtp-Source: AA0mqf6I4jr6wT+uWfZSCYLVdC4qM8crbZNH3OaqBsBu/hYhf35OlR2tPJqrzPCmaDoivSfOY1IqIpAKwXiBEGfS0vc=
X-Received: by 2002:a05:6808:295:b0:357:670f:9e4e with SMTP id
 z21-20020a056808029500b00357670f9e4emr12430765oic.46.1669046318747; Mon, 21
 Nov 2022 07:58:38 -0800 (PST)
MIME-Version: 1.0
References: <20221119204435.97113-1-ogabbay@kernel.org>
 <CADnq5_MimkbzXXs+kwNTLSzLrcqpm+-7w3gZA8UiJVxQ8aapOg@mail.gmail.com>
In-Reply-To: <CADnq5_MimkbzXXs+kwNTLSzLrcqpm+-7w3gZA8UiJVxQ8aapOg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Nov 2022 10:58:27 -0500
Message-ID: <CADnq5_MS_SGqTfA7v31TVBb6Fv_TZM=+jnJoAMJzJWjEL=4_2g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
To: Oded Gabbay <ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 10:57 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Sat, Nov 19, 2022 at 3:44 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> >
> > This is the fourth (and hopefully last) version of the patch-set to add the
> > new subsystem for compute accelerators. I removed the RFC headline as
> > I believe it is now ready for merging.
> >
> > Compare to v3, this patch-set contains one additional patch that adds
> > documentation regarding the accel subsystem. I hope it's good enough for
> > this stage. In addition, there were few very minor fixes according to
> > comments received on v3.
> >
> > The patches are in the following repo:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4
> >
> > As in v3, The HEAD of that branch is a commit adding a dummy driver that
> > registers an accel device using the new framework. This can be served
> > as a simple reference.
> >
> > v1 cover letter:
> > https://lkml.org/lkml/2022/10/22/544
> >
> > v2 cover letter:
> > https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/
> >
> > v3 cover letter:
> > https://lore.kernel.org/lkml/20221106210225.2065371-1-ogabbay@kernel.org/T/
> >
>
> With the understanding that individual drivers can choose to use
> either classic drm or accel, whichever makes the most sense to them,
> this series is:
> Acked-by: Alex Deucher <alexander.deucer@amd.com>

and not typo my email:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> > Thanks,
> > Oded.
> >
> > Oded Gabbay (4):
> >   drivers/accel: define kconfig and register a new major
> >   accel: add dedicated minor for accelerator devices
> >   drm: initialize accel framework
> >   doc: add documentation for accel subsystem
> >
> >  Documentation/accel/index.rst         |  17 ++
> >  Documentation/accel/introduction.rst  | 109 +++++++++
> >  Documentation/admin-guide/devices.txt |   5 +
> >  Documentation/subsystem-apis.rst      |   1 +
> >  MAINTAINERS                           |   9 +
> >  drivers/Kconfig                       |   2 +
> >  drivers/accel/Kconfig                 |  24 ++
> >  drivers/accel/drm_accel.c             | 323 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/Makefile              |   1 +
> >  drivers/gpu/drm/drm_drv.c             | 102 +++++---
> >  drivers/gpu/drm/drm_file.c            |   2 +-
> >  drivers/gpu/drm/drm_sysfs.c           |  24 +-
> >  include/drm/drm_accel.h               |  97 ++++++++
> >  include/drm/drm_device.h              |   3 +
> >  include/drm/drm_drv.h                 |   8 +
> >  include/drm/drm_file.h                |  21 +-
> >  16 files changed, 711 insertions(+), 37 deletions(-)
> >  create mode 100644 Documentation/accel/index.rst
> >  create mode 100644 Documentation/accel/introduction.rst
> >  create mode 100644 drivers/accel/Kconfig
> >  create mode 100644 drivers/accel/drm_accel.c
> >  create mode 100644 include/drm/drm_accel.h
> >
> > --
> > 2.25.1
> >
