Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B1414A5E8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 15:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAA06EBBA;
	Mon, 27 Jan 2020 14:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E41B6EBB6;
 Mon, 27 Jan 2020 14:21:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t23so6979549wmi.1;
 Mon, 27 Jan 2020 06:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKnIL8EznGpC0KQWDMPKOuMPAxhSeEe8qhrbYqE6CQY=;
 b=RUX/sOjgQ1jZoREisYUFitYlWAl7/CF1nFvZSmHx5XRGeaGRzKcN05QNHpG5H47Zkk
 y9t1Gk0AsKDSEYN7mh0RTt1TqhDTuKk5WQ30kZqihTLxEVHpR39+zj+z6NBavNxGGFvU
 VvxGE/nkHryM+gAxf8AdHCZNZcSmZuubD9cfrhH4y5TvvgbvxQEMjOOCTaOjaVTBVsJq
 rDxNba2KpSh7Qh10UOkChgcbfnQzbPukq3LDECMDwKJt730xOAYeQBbCLWEPYQ43Vlj4
 S9HfJ5Zcp3o351qGxHPFH2k33S4UoM7cOWW8W6jWe00RAjMTTgSH4EzWZvjaqkJIByIe
 E7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKnIL8EznGpC0KQWDMPKOuMPAxhSeEe8qhrbYqE6CQY=;
 b=d69rjFw+vNv2yRJk0FKvMTePfTvMCzCgm2vKRdb4xQ/F+r3DE1g6KvFl5D7vCL1U0/
 dzXMzrKEw3GYMcQNm/Mf78ygtoF0mMenTYlCvM/R5rjln+wyqD5Kvf2Voyh/HoawkB6r
 tKEjzDwADGR/50m4zVkBJXvI2ztw7WZTXZtUfTpLUIhbswducB2IQKdzew6u1mIFCob7
 B1pQAdv2Qbec23QEDU9rF5NQhS30b7HTTotqjqKCp7jlu2zJ2qul+MPuPwG25N5E7owa
 qjU+ZPx/P17sSdb62yA7Sai+BKuDnAqxZiC0woo1fNJ0JsBg/QPzvg+cgfv4p67YPQIs
 avGQ==
X-Gm-Message-State: APjAAAWS8u6078PNWJTP8fmIwtB52BWk7vUxG61NHcusStKyP4i+teHh
 Mcn8joVeaBI3Zb8Tqsg5MXuPByAuuv7f2MQCTLY=
X-Google-Smtp-Source: APXvYqxPj//Y4FVgb2Vp5c1cA+Tm96SYiYn3nwYdv/7p0d/7obKo7d01rHXKnO6fs74XiMx5a+vn9zNQIfZ9KE+yfAI=
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr14568087wmk.50.1580134900793; 
 Mon, 27 Jan 2020 06:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20200116131157.13346-1-yuq825@gmail.com>
 <ba4969a0-4abf-9749-49a2-5b842544b95a@imkreisrum.de>
In-Reply-To: <ba4969a0-4abf-9749-49a2-5b842544b95a@imkreisrum.de>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 27 Jan 2020 22:21:29 +0800
Message-ID: <CAKGbVbt-_mD39gtD64q4HagutbBJCHLgHAF-wYgai7---7pGLQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/lima: add heap buffer support
To: Andreas Baierl <list@imkreisrum.de>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, applied to drm-misc-next.

Regards,
Qiang

On Mon, Jan 27, 2020 at 6:21 PM Andreas Baierl <list@imkreisrum.de> wrote:
>
> Am 16.01.2020 um 14:11 schrieb Qiang Yu:
> > Support heap buffer allocation which can grow the back memory
> > size when GP has an out of memory interrupt so that user don't
> > need to allocate a very large buffer at the beginning.
> This was
>
> Tested-by: Andreas Baierl <ichgeh@imkreisrum.de>
>
> together with https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3264.
> > Qiang Yu (5):
> >    drm/lima: update register info
> >    drm/lima: add lima_vm_map_bo
> >    drm/lima: support heap buffer creation
> >    drm/lima: recover task by enlarging heap buffer
> >    drm/lima: increase driver version to 1.1
> >
> >   drivers/gpu/drm/lima/lima_drv.c   |  16 +++-
> >   drivers/gpu/drm/lima/lima_drv.h   |   1 +
> >   drivers/gpu/drm/lima/lima_gem.c   | 130 ++++++++++++++++++++++++++++--
> >   drivers/gpu/drm/lima/lima_gem.h   |   4 +
> >   drivers/gpu/drm/lima/lima_gp.c    |  51 +++++++++++-
> >   drivers/gpu/drm/lima/lima_mmu.c   |   5 ++
> >   drivers/gpu/drm/lima/lima_mmu.h   |   1 +
> >   drivers/gpu/drm/lima/lima_regs.h  |   1 +
> >   drivers/gpu/drm/lima/lima_sched.c |  35 ++++++--
> >   drivers/gpu/drm/lima/lima_sched.h |   6 ++
> >   drivers/gpu/drm/lima/lima_vm.c    |  44 +++++++++-
> >   drivers/gpu/drm/lima/lima_vm.h    |   1 +
> >   include/uapi/drm/lima_drm.h       |   9 ++-
> >   13 files changed, 284 insertions(+), 20 deletions(-)
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
