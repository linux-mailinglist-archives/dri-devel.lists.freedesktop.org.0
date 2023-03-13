Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A3D6B6DD8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 04:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABB710E041;
	Mon, 13 Mar 2023 03:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A9B10E041;
 Mon, 13 Mar 2023 03:09:57 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id s1so9806275vsk.5;
 Sun, 12 Mar 2023 20:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678676997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+psd8R+vmD5RvwTYlxJi1wP8fKpHP1Zmc7TIxsJKEsY=;
 b=N53/ggGiWuPqPDdRDrleVmQHpqQDjdpIzClBdpOvnrvQCwLuZaZKJ+rhC0c2rVybLY
 tbzZgnnkJoKcVeHk7Lzixl0Bug8WOYjc1nbrgHt8BDumgI8aUN00G38xUUo7O9MGXQ4d
 Y/LnnhrXgdv0XCwEhGgzvxX5Y1E+22diMyFyV9nxpWiV8qWSUQgAc2SzSEw9EqrMt0mo
 p/eLJ01lDu5Gcpgv+efW2pkArDOJJe1lncaTHJqauycAbQJG1BtQixYkYgJTknm/tTpE
 v7UFcQmW9bmd1QO5Ouj/iZNYQ/rdkugE/68wW+fOFkI2D9Tuyc6kCgykGK3IBwlrRQEh
 aWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678676997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+psd8R+vmD5RvwTYlxJi1wP8fKpHP1Zmc7TIxsJKEsY=;
 b=sKa1Av4D7/WLyYOFEUSF/MtSCcrb9XH1c9oBhfTbaP4y/XIsgNwSS+HF9Di7Boqtuz
 mH2LvMMId/j1QNQYrl09JwT1ivL9Lfb7ieME3vDIuzKdh9yqGZOOb0743SO/j9Qj0QhM
 iExg4fiWTOP6FnGV0sPQhhnzrhIhJJhqMyUhy6cGtkNZMHmE6TLXxG+pdgapGN0iE7CS
 BkFjOO2x0qo4azCah6FIh6sAMoVhmuTyiaco2R2BQCZ/H0RLcB61uo9GUMYmL/CiIzQx
 ldfaSMm0EBFHIegVqhy8nG91NodYB/Wk1HyVCsfNTJ9LWxfDxLuASzPKPWELqt6iFYY9
 JFjQ==
X-Gm-Message-State: AO0yUKWg4jQOXQTZiILeGZOerkD1htHZS0qWKNB/hhD0xTKYNBO5VB0p
 AHMGjrTo1szkuiO75xRPONXC1t+Du3fcaGqGx9U=
X-Google-Smtp-Source: AK7set+Mgs0Wzj9y04plk97b2hXgIXMfAcRVkPbSLMt3jPbr/TY3cmzFA9SDaxnbZoHhfZwO5l3ePrcLDSxwAToxsfA=
X-Received: by 2002:a67:fe54:0:b0:412:2d80:b0a3 with SMTP id
 m20-20020a67fe54000000b004122d80b0a3mr21468291vsr.4.1678676996739; Sun, 12
 Mar 2023 20:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230312233052.21095-1-nunes.erico@gmail.com>
In-Reply-To: <20230312233052.21095-1-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 13 Mar 2023 11:09:45 +0800
Message-ID: <CAKGbVbs2ZRGyYOy9yYUMJ+apQm=NaXXb58C-97CaoTe5KPNqgw@mail.gmail.com>
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

Patch set is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Looks like drm-misc-next does not contain "df622729ddbf drm/scheduler:
track GPU active time per entity" yet.
Will apply later.

Regards,
Qiang

On Mon, Mar 13, 2023 at 7:31=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> Expose lima gp and pp usage stats through fdinfo, following
> Documentation/gpu/drm-usage-stats.rst.
> Borrowed from these previous implementations:
>
> "df622729ddbf drm/scheduler: track GPU active time per entity" added
> usage time accounting to drm scheduler, which is where the data used
> here comes from.
>
> Then the main implementation is based on these etnaviv commits:
> "d306788b6e1b drm/etnaviv: allocate unique ID per drm_file" and
> "97804a133c68 drm/etnaviv: export client GPU usage statistics via
> fdinfo"
>
> Also "874442541133 drm/amdgpu: Add show_fdinfo() interface" since lima
> has a context manager very similar to amdgpu and all contexts created
> (and released) at the ctx_mgr level need to be accounted for.
>
> Tested with the generic "gputop" tool currently available as patches to
> igt, a sample run with this patchset looks like this:
>
> DRM minor 128
>     PID               NAME             gp                        pp
>     4322   glmark2-es2-way |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=8A                  ||=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88      |
>     3561            weston |=E2=96=8E                       ||=E2=96=88=
=E2=96=88=E2=96=88=E2=96=8C                    |
>     4159          Xwayland |=E2=96=8F                       ||=E2=96=89  =
                     |
>     4154          glxgears |=E2=96=8F                       ||=E2=96=8E  =
                     |
>     3661           firefox |=E2=96=8F                       ||=E2=96=8F  =
                     |
>
>
> Erico Nunes (3):
>   drm/lima: add usage counting method to ctx_mgr
>   drm/lima: allocate unique id per drm_file
>   drm/lima: add show_fdinfo for drm usage stats
>
>  drivers/gpu/drm/lima/lima_ctx.c    | 30 ++++++++++++++++++++-
>  drivers/gpu/drm/lima/lima_ctx.h    |  3 +++
>  drivers/gpu/drm/lima/lima_device.h |  3 +++
>  drivers/gpu/drm/lima/lima_drv.c    | 43 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/lima/lima_drv.h    |  1 +
>  5 files changed, 78 insertions(+), 2 deletions(-)
>
> --
> 2.39.2
>
