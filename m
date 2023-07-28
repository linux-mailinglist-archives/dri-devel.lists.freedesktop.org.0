Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC0766F8F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D32310E129;
	Fri, 28 Jul 2023 14:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F2410E129
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:35:17 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fdd31bf179so3779679e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690554916; x=1691159716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMuycaeSJH1VFjMWMvqrIqowm0hdXJu+J1st1dRELqA=;
 b=o91cpNFyJtd7GEOdBjAxmF6SHMLE92gyF8LhyyX7fSuAE7/avPMZWwx56RIO6wcD1C
 +UQ5zMA55EMzaj/ngEpgkPm4Ck8+vy568ey8zYObaHymUmHEqzagAUmVxLvNgv161YlH
 lAQKLDQ8bg1MOJ3z++XCCGuVFgk9FU4yNmQLxcbvk4RQergxJ2XgEUIkKLq2p0+GRPHt
 BFMcb/b4naIt/bh/pZN5RJXCN/PHpzQ5m+Hu9JXrbPdjTWUcRjKbNjT4jUrz8RRtRXmc
 L59prj0oUilc+Abw0fKwrDYVkU6Z3j5r1G3+VotlloQ147ualYyB3XPcK5+ggYfhqCYO
 r8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690554916; x=1691159716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PMuycaeSJH1VFjMWMvqrIqowm0hdXJu+J1st1dRELqA=;
 b=TFnLC8x7vQKDfuFBIm7gVh7942Vxhu65JcMR9f8KxIJrVyNASJwX0Q7z3YCYeuIVMA
 Nh0TCF8K4sZh+fNzGG/Pyl/mVirbLZnTgJ4cEPZyZuA+u2JZZC1GXEaiY2lmF+dbddUZ
 wBT8PwHnowNCeAjHGGELp4ndQnXv+lHX4RIC/lrcAsoQM+bbJX6kdfQoJgyeS8Drhld5
 KH9Fq0YTnLB7UWxEH+hVHQeVMMwduhk7tm0NSxwacYmKWW9flhgaAdIKWUDot7fcn2fn
 yCA2da+Cel7gNRLK1zUITdu9uZDG2zgo+phJdJwBNhGf43KHwxcoJcYEMlNRbfinZxrX
 X82Q==
X-Gm-Message-State: ABy/qLaVFvWsKaSBWCmrbCgzfsqcc2ahEsCc6YRBSuDHSn1y7TaZzCpa
 ZybLNxYKSqaVKGlwVDupH4dw01VI/bQiF/qwY54=
X-Google-Smtp-Source: APBJJlHbbc2pkRsGbibMdugwgFkM/BYBuhD5N2wwPh1UH2r4Iq0x6U/J8z1mmnSJwx41VQDKG12K+y3WpJeUFNuaKY0=
X-Received: by 2002:a05:6512:34c9:b0:4fb:7b50:3fc9 with SMTP id
 w9-20020a05651234c900b004fb7b503fc9mr1695293lfr.58.1690554915712; Fri, 28 Jul
 2023 07:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Pr8Z=vNO3iEpHNqkV0mb8gNzN7Zvf9HSW0Sf3Q0yy=Pw@mail.gmail.com>
 <9b86526b-7afd-6335-e68f-3f390f1c3266@linux.intel.com>
In-Reply-To: <9b86526b-7afd-6335-e68f-3f390f1c3266@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Jul 2023 07:35:04 -0700
Message-ID: <CAF6AEGvC-1SFrmBY+mitpGPcHNBrJri4HMFXmXMkb4=G3Zrwcw@mail.gmail.com>
Subject: Re: CPU overhead for drm fdinfo stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 1:36=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 27/07/2023 21:58, Alex Deucher wrote:
> > We have a number of customers using these stats, but the issue that
> > keeps coming up is the CPU overhead to gather them, particularly on
> > systems with hundreds of processes using the GPU.  Has anyone given
> > any thought to having a single interface to get this information for
> > the entire GPU in one place?
>
> Could I have a framed told you so certificate please? :D
>
> Well at least it depends on how much CPU overhead would your users be
> happy to eliminate and how much to keep. So maybe no need for that
> certificate just yet.
>
> I was raising the issue of exponential complexity of walking "total
> number of processes" x "total number of file descriptors" on a system
> from the inception of fdinfo.
>
> So for that issue the idea was to perhaps expose a list of pids with DRM
> fds open somewhere, maybe sysfs.

We do have something in debugfs (ie. $debugfs/dri/n/clients), would that do=
?

BR,
-R

> That would eliminate walking _all_ processes and trying to parse any
> their file descriptor.
>
> But it would still require walking all file descriptors belonging to
> processes with DRM fds open.
>
> If that wouldn't be enough of a saving for your users then no, I am not
> aware it was discussed. Assuming at least you were suggesting something
> like "read all fdinfo for all clients" in one blob. Also in sysfs? I
> think it would be doable by walking the dev->filelist and invoking
> drm_show_fdinfo() on them.
>
> Out of curiosity are they using the fdinfo parsing code from IGT or
> something of their own?
>
> Regards,
>
> Tvrtko
