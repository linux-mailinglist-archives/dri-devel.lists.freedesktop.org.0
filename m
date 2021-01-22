Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D532FFF69
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 10:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E566E9CB;
	Fri, 22 Jan 2021 09:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041036E9D2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 09:44:22 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m4so4431221wrx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VQ+aJWE+kih/P1Crt7BrsZ+5tAJWlnpU9eq5uMiGLMQ=;
 b=FLnzp2HEQFRGu61rDKanyDSNLnPdDQUzcE78NfbUqu8N6LkQHMeIyPkLL4YHMjFvfW
 f3+hPzvZVuMnliLe5EgJLy+3rOYC4o6XaTjyOWB0CV6GBavkkMXkSbTqRrUCkt5KLT5v
 l4Af4oJMw9SE7hmeOOFRE0OSSVH/UI8ltmryM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VQ+aJWE+kih/P1Crt7BrsZ+5tAJWlnpU9eq5uMiGLMQ=;
 b=epbOQDtPEMnvkA5hBA+tYKcKW5hYzX81J0hJWgvn2yR81dyfd8trcIJDPfsUl8GrSh
 /ct2VePkBmSaUuZG0SMEjnQ4ugpaGuiEfmD2EMMdD5MTfA/Y9kSXs9HqyGCQBjQRwCA0
 Q5dsycr0dH5NmkKEjj6LWIoz+o8faRW0bEwbT5hm07nTER1SuFLU3YWEArshwPE7U49e
 dtx8wyS1IOs+KTsi5wIOa0A7VrUJhJ6VoquJeZb4z/2jshO8VcOur67ByIjz8Rk1ffiu
 I1Eq31DqTMyv41EslsNMX9VK2CdRzFyUTa7SqZwPN3q5a3TF0ZaaTviq2F/cfV28+jnc
 q0aQ==
X-Gm-Message-State: AOAM5308cSDvaYmZtBp8HLDQCmyonBcL1BDuILja552XmPnjMP5e/Lop
 xbsIb29wUMCq0ZAfmAAISwDgsA==
X-Google-Smtp-Source: ABdhPJw3Lo94m4WFc/9PY8B6GE6YnReIsCkY9g0pal/Gec1YI36rMpcqFd3Fn701B+pF1208hjezUQ==
X-Received: by 2002:adf:8145:: with SMTP id 63mr3527171wrm.8.1611308661691;
 Fri, 22 Jan 2021 01:44:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k6sm233384wro.27.2021.01.22.01.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 01:44:21 -0800 (PST)
Date: Fri, 22 Jan 2021 10:44:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 0/3] Experimental freesync video mode optimization
Message-ID: <YAqec2/YTOTicjZC@phenom.ffwll.local>
References: <20210119155029.18943-1-aurabindo.pillai@amd.com>
 <20210122103248.779e70bf@eldfell>
 <YAqeHZlDBrgALLo9@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAqeHZlDBrgALLo9@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: stylon.wang@amd.com, thong.thai@amd.com, shashank.sharma@amd.com,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 wayne.lin@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 10:42:53AM +0100, Daniel Vetter wrote:
> On Fri, Jan 22, 2021 at 10:32:48AM +0200, Pekka Paalanen wrote:
> > On Tue, 19 Jan 2021 10:50:26 -0500
> > Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:
> > 
> > > Changes in V5
> > > =============
> > > 
> > > * More info in commit messages on the rationale of changes being added
> > > to the kernel.
> > > * Minor fixes
> > 
> > Hi,
> > 
> > thank you for adding the explanations in the commit messages I asked
> > for. It is now up to DRM maintainers to determine if this is
> > conceptually fine.
> > 
> > I do see that apparently setting the opt-in option does not yet taint
> > the kernel although Daniel Vetter suggested it might be a good idea. I
> > guess tainting the kernel would make it easier to remove this feature
> > in the future because it would be easier to dismiss people that claim a
> > kernel regression due to the removal.
> 
> Reading the descriptions I'm honestly not sure why this isn't enabled by
> default?
> 
> Maybe the explanations should also capture why this is maybe not a good
> idea ...

And also, if this is a bad idea uapi-vise, then it definitely needs to be
behind the tainting module option until we've sorted it out (and then just
enable it by default once that's done).
-Daniel

> -Daniel
> 
> > 
> > 
> > Thanks,
> > pq
> > 
> > 
> > > --
> > > 
> > > This patchset enables freesync video mode usecase where the userspace
> > > can request a freesync compatible video mode such that switching to this
> > > mode does not trigger blanking.
> > > 
> > > This feature is guarded by a module parameter which is disabled by
> > > default. Enabling this paramters adds additional modes to the driver
> > > modelist, and also enables the optimization to skip modeset when using
> > > one of these modes.
> > > 
> > > --
> > > 
> > > Aurabindo Pillai (3):
> > >   drm/amd/display: Add module parameter for freesync video mode
> > >   drm/amd/display: Add freesync video modes based on preferred modes
> > >   drm/amd/display: Skip modeset for front porch change
> > > 
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 401 ++++++++++++++++--
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
> > >  4 files changed, 382 insertions(+), 35 deletions(-)
> > > 
> > 
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
