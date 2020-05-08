Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3141CA8E8
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 13:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033BE6EAE3;
	Fri,  8 May 2020 11:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5AE6EAE3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 11:03:13 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id s11so810528vsm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xsARK8m2kbq0Zr2zKJTKwOxWZK2b9prwvHMpuqEUsJE=;
 b=cGnZ0+ZF/Dx8pTwaHccjYE+sv8QDNdIrTeTdUueGoQQpqwxEgD5P7spn5lqDL3T1hH
 xBOYz3suUIVyNyxUDjr8ENFzWCf3sAXP0EVlb2ffYYGcMmrVYiBOq/bGK2BK+rK7Wxat
 PoU+z0UDXSKIyAazVWK9/DCKfYG+BfW4vJA9lTuY5hE+aFHmAW40owKTeex1dG/pCzF7
 s4SSf2tm22GeMEPSNCHjiuajvOWvwZZ/GOpprxHSTGHDIuQqf/XJ2pK1xH5HHlyAXNTA
 xWybVQHKdZzobYQC9NCErKI763B0iuHm6wB7NPY3StdLFxY/75nDf0ircWN/9p1uOetI
 7rNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xsARK8m2kbq0Zr2zKJTKwOxWZK2b9prwvHMpuqEUsJE=;
 b=UVGKO9foWFE+klA9SjsYadByr/2b3Ca+J0KkmUguZse1one9/rLBA3uDcLWIG42EaD
 fzeYp0WmP4u9UnkNOlkRFKr6lFVSrpRcm3BBRTbg3cOK3EU0QGkTbVi82s5DbUxDzj5B
 onXFTV5NStPvWBvy9Rd589BcRgMqqYGHdo/fs6v9ZYpW4yaQUwbwdS29ssjpostu5Ioq
 LYudsP9jsxeGjJZaAAZi5/wBQkNw0kZpR4OWpa8Y8jeHFEz5TXzs+6h5/iUKx2jsb+/T
 oQghqkOX7d3QTY+T430MgoLOFffE14JMHpeAcG402xD4tc7mt+SicEU6pYR9ZK3/Rd3u
 VgQQ==
X-Gm-Message-State: AGi0PuY0/TaQgdtHYabDsO2okIbd0wU5bhnqpV9e1RNWCHu3izYzDSWK
 0LfpzaejUPGJDibkt+6m8a1bwHwbna/s9smEzVqpRA==
X-Google-Smtp-Source: APiQypLg2nw5JS30eG8gfMVjlZF4wIipc4S2/yOsZLaXmtS+vGoewtpS8IoEdUfGSOrd+rZntJigiKbfMoHIRnpR+68=
X-Received: by 2002:a67:2c16:: with SMTP id s22mr1247832vss.85.1588935792154; 
 Fri, 08 May 2020 04:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-11-emil.l.velikov@gmail.com>
 <20200508064053.GB1383626@phenom.ffwll.local>
In-Reply-To: <20200508064053.GB1383626@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 12:00:40 +0100
Message-ID: <CACvgo53fa1R3gD8hCg+Ch2Tj0ZnDVScNXiZO5FbGfK_VbAP_nQ@mail.gmail.com>
Subject: Re: [PATCH 10/36] drm/gem: add _locked suffix to drm_object_put
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 May 2020 at 07:40, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, May 07, 2020 at 04:07:56PM +0100, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > Vast majority of DRM (core and drivers) are struct_mutex free.
> >
> > As such we have only a handful of cases where the locked helper should
> > be used. Make that stand out a little bit better.
> >
> > Done via the following script:
> >
> > __from=drm_gem_object_put
> > __to=drm_gem_object_put_locked
> >
> > for __file in $(git grep --name-only --word-regexp $__from); do
> >   sed -i  "s/\<$__from\>/$__to/g" $__file;
> > done
> >
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
>
> Since
>
> commit 48e7f18392c66f9b69ebac11c54f1a2e033ced54
> Author: Kristian H. Kristensen <hoegsberg@gmail.com>
> Date:   Wed Mar 20 10:09:08 2019 -0700
>
>     drm/msm: Implement .gem_free_object_unlocked
>
> msm doesn't need the struct_mutex in the bo_put anymore, the only reason
> we had to use the _locked version here is historical accidents I think.
>
> I think you could convert these all to the _unlocked variant and then
> entirely drop the _locked version.
>
Did not check the msm driver closely, but it makes sense. Let's keep
that as follow-up series?
We're already at 36 patches, plus mixing mostly mechanical and locking
changes doesn't sound wise.

> Once we have that we could move struct_mutex into each driver (at least
> for msm and i915) since it's purely internal, and then wrap it in an
> #ifdef CONFIG_DRM_LEGACY to gloriously sunset it all :-)
>
Indeed, we're nearly there.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
