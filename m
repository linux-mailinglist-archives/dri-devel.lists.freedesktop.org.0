Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E63A404F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 12:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD2D6E049;
	Fri, 11 Jun 2021 10:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FDA6E102
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 10:39:59 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id u66so1749485vkb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FkcofOGDJi9oIlaEvzAGB9zRciBPy8sFmu3ZRYj+1N4=;
 b=rvznpUz/5ewqIJLjjzTPkl/dC+nHtSoMKeDkdm3leQX74IwHpYX+/D70bAD3kWP1+8
 GmMm2cHEp2WbGotYYqzDavOU/B+i+S9drx5gJhUMdfM/Dhoh3HIM74iQ2cNeFggPv/qW
 h5XFd+/KUnIzUOIFwUrn2aMAuuqdxltvwya4GuWuCJJuouMq4xkffXs2IKFcnnC6WCnk
 zOpj8i1GH2Ec6UBGFXwxX+HroQKQapTOiUcNo0CgkiGlZJ78SKuNvWgtN3znC19Bniou
 ieDHaiEHrWXPcr3OMCf1HCDLVTt7tGAiub+X96Qy3KutXakg8kF5rae22U9dt/BYwVgW
 aj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FkcofOGDJi9oIlaEvzAGB9zRciBPy8sFmu3ZRYj+1N4=;
 b=QDD9z3DWWAUGc/BxvocTa5Oo+4RfpsbxFj5ahJNT++na/pMgzFHGfDYQ3LdnasynOR
 IT2gCZhMoslKEciqC4yifeJz5eoJzPB3Agl/LTJgflrAH8YVNArIy/W1QgAXHE2QCVoG
 s0IxR/6IMsZIoJ58HNnf9ozAaTVawCbiDosV8Qnm01D4sCNSuRxLYn0MmUQzHI99rFa/
 Jb0cdbNeykiz26OCADzGDyErwZBWAnEElEv/O4/WB+8Sjfp9FQin13T7Z5OQfr1xeS4s
 krp8ZHLFqZh7eEvryGHCaPYtU1fSJZx1VGcB65ANCfMrmjyGrnYaEzSt35d+wR+LkZz+
 SSlw==
X-Gm-Message-State: AOAM5330sOD67W5z+tdJQW6SJrrLEhh85zPoH6UfCtMur4YPJtv2ILEi
 /y1wvbXdgJCc0Dgn4jpwN3liEfIJaXGd8zmnZUs=
X-Google-Smtp-Source: ABdhPJw66RtL6vybeTb5zhEFvxVBrFO/btDW0p7KjhimWJWtMvLFUKR7EEairRSOGpLXM/P716tfWzO3VUglDgH++ME=
X-Received: by 2002:a1f:3888:: with SMTP id f130mr8023400vka.8.1623407998363; 
 Fri, 11 Jun 2021 03:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210610213659.22728-1-dongwon.kim@intel.com>
 <YMMxFHvRCp+u5GvX@phenom.ffwll.local>
In-Reply-To: <YMMxFHvRCp+u5GvX@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 11 Jun 2021 11:39:46 +0100
Message-ID: <CACvgo503NE61XOZQ3V8PVVTeMM2TVJonAL+ob80EgOhOVOu4HA@mail.gmail.com>
Subject: Re: [PATCH] drm: set DRM_RENDER_ALLOW flag on
 DRM_IOCTL_MODE_CREATE/DESTROY_DUMB ioctls
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Jun 2021 at 10:47, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jun 10, 2021 at 02:36:59PM -0700, Dongwon Kim wrote:
> > Render clients should be able to create/destroy dumb object to import
> > and use it as render buffer in case the default DRM device is different
> > from the render device (i.e. kmsro).
> >
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>
> Uh no.
>
> Well I know everyone just hacks around this, but the idea behind dumb
> buffer objects is that they're for kms scanout only. Furthermore on many
> drivers they allocate a limited resource like CMA memory. Handing that out
> like candy isn't a great idea.
>
> And it's exactly those drivers that kmsro currently is used for where the
> display driver needs special memory.

Couldn't agree more. Perhaps we should add an inline comment and/or
reference to a thread why?

-Emil
