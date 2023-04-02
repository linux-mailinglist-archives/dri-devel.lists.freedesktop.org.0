Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10126D373F
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 12:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A9810E24D;
	Sun,  2 Apr 2023 10:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B1B10E24D;
 Sun,  2 Apr 2023 10:22:46 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id b6so19679481vsu.12;
 Sun, 02 Apr 2023 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680430965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cqt+0LvMfoOorBMYDQIvk68awcF7EkMGpn308vi5jnw=;
 b=brx3cOmlB4NB4+SUVwPr+emDg5TQr/ONpS5B8DUZRYWlO1uvY/dKBcOb7pC2LbmKWe
 JbOFn5/rn+y5GXpqkkCUcI/6nWhm0kWBW6d8MZACls2lIs7NR1HPalwiewRK4PGEGLa+
 bepbf/yicz9/7OStMoiM1JKU/a5Vdl9qivte0gAx/ibgZyzR2y/rilZIBypec4i5T6C/
 FEutBpVI2gaSupLDpdEJHTgP4z4wW7j4X3qg3C2xz2ZDCzUhoJ8qQ0eftwGWr8CJhIL+
 aFHVsuebelAYLOuZBpQ4HIIMU7mm3oiy0DGlI4JMHnPO2d5yxsc8QQTl6xaIaZlkCJ8E
 62tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680430965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cqt+0LvMfoOorBMYDQIvk68awcF7EkMGpn308vi5jnw=;
 b=n5utzpEXGzdEbJD6mKZalpbuLLZLDMj4G/NmB3arBoJXKbLX0nOC5WkWEfmffHGrXd
 8rpne9xFBBgcrizL1f8t+AT0jVf621joctJz+26OUmQVJa/OcU0Op7P7KQrGkWaH+VZx
 I/FGbyV/tlVkT/L4UgrvOp5g72RcFjVJW6RdtPxjzy5gCZneIOhxdSKUg2tCpSjpsOsU
 p891PzviltNfRjyAW2Buob/K3mv728YffG1JYF127AnnVw+f6EKiwl3K15CXWnJzQw8T
 Lo8jmnA0N4IojSVoI8oIZbxPooKkM6eisAoz+P2B3UvpRuZjs1jQxxICp2Gl6+Y2Yfu5
 hWYQ==
X-Gm-Message-State: AAQBX9dVKUQGYFd4UOJ+dbsSX605ldccfEsZ2fowHLfr0smT7YEupQlJ
 3XRUpguQLxhTyExgMe6dX+zR6S8RcM+xHFtggxM=
X-Google-Smtp-Source: AKy350YzdAw3jPa3CDdSsbjfA/b0tMJpyuWevQVxE21HvuJBKce7SK45DmepJXZm1Jg8tIkEDKwYyHK2M++Y5gNzzXY=
X-Received: by 2002:a67:e116:0:b0:426:df00:9b12 with SMTP id
 d22-20020a67e116000000b00426df009b12mr6160727vsl.1.1680430965370; Sun, 02 Apr
 2023 03:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230312233052.21095-1-nunes.erico@gmail.com>
 <CAKGbVbs2ZRGyYOy9yYUMJ+apQm=NaXXb58C-97CaoTe5KPNqgw@mail.gmail.com>
In-Reply-To: <CAKGbVbs2ZRGyYOy9yYUMJ+apQm=NaXXb58C-97CaoTe5KPNqgw@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 2 Apr 2023 18:22:34 +0800
Message-ID: <CAKGbVbtb-cKv2Fb1x91vZssZxayxciSp3RLJeVsn0z1JhvT6QQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/lima: expose usage statistics via fdinfo
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

On Mon, Mar 13, 2023 at 11:09=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrote:
>
> Patch set is:
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> Looks like drm-misc-next does not contain "df622729ddbf drm/scheduler:
> track GPU active time per entity" yet.
> Will apply later.
>
> Regards,
> Qiang
>
> On Mon, Mar 13, 2023 at 7:31=E2=80=AFAM Erico Nunes <nunes.erico@gmail.co=
m> wrote:
> >
> > Expose lima gp and pp usage stats through fdinfo, following
> > Documentation/gpu/drm-usage-stats.rst.
> > Borrowed from these previous implementations:
> >
> > "df622729ddbf drm/scheduler: track GPU active time per entity" added
> > usage time accounting to drm scheduler, which is where the data used
> > here comes from.
> >
> > Then the main implementation is based on these etnaviv commits:
> > "d306788b6e1b drm/etnaviv: allocate unique ID per drm_file" and
> > "97804a133c68 drm/etnaviv: export client GPU usage statistics via
> > fdinfo"
> >
> > Also "874442541133 drm/amdgpu: Add show_fdinfo() interface" since lima
> > has a context manager very similar to amdgpu and all contexts created
> > (and released) at the ctx_mgr level need to be accounted for.
> >
> > Tested with the generic "gputop" tool currently available as patches to
> > igt, a sample run with this patchset looks like this:
> >
> > DRM minor 128
> >     PID               NAME             gp                        pp
> >     4322   glmark2-es2-way |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=8A                  ||=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88      |
> >     3561            weston |=E2=96=8E                       ||=E2=96=88=
=E2=96=88=E2=96=88=E2=96=8C                    |
> >     4159          Xwayland |=E2=96=8F                       ||=E2=96=89=
                       |
> >     4154          glxgears |=E2=96=8F                       ||=E2=96=8E=
                       |
> >     3661           firefox |=E2=96=8F                       ||=E2=96=8F=
                       |
> >
> >
> > Erico Nunes (3):
> >   drm/lima: add usage counting method to ctx_mgr
> >   drm/lima: allocate unique id per drm_file
> >   drm/lima: add show_fdinfo for drm usage stats
> >
> >  drivers/gpu/drm/lima/lima_ctx.c    | 30 ++++++++++++++++++++-
> >  drivers/gpu/drm/lima/lima_ctx.h    |  3 +++
> >  drivers/gpu/drm/lima/lima_device.h |  3 +++
> >  drivers/gpu/drm/lima/lima_drv.c    | 43 +++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/lima/lima_drv.h    |  1 +
> >  5 files changed, 78 insertions(+), 2 deletions(-)
> >
> > --
> > 2.39.2
> >
