Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E424160413
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 13:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AA76E2B0;
	Sun, 16 Feb 2020 12:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FB16E2B0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 12:46:51 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 66so13491454otd.9
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 04:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hh7uY784ARuEg+WzoT+m4cfAjllASWOC5hRY3D2HNR8=;
 b=idyTsf0P5zaAqhoGw+q7CGf2yUg2AGcPm6niRhvEmC/QIjiptSSYF1QPJL97tnNmwu
 Bp7V1dc7HNZSjvWuLhi8l4idTHysCXfqXd6Mba2M8xWa5S007dyP0Q/CuP+4UhJ3kdQ6
 BaKg52q95/ChnvMBkVTJhtv4DBdOThlNKhfwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hh7uY784ARuEg+WzoT+m4cfAjllASWOC5hRY3D2HNR8=;
 b=DYNNRhS8lBf01hzD7PBLGEnP4K0DjxJMtQIxOOJMihUuTTiRE1PmUxg5jtrvJ60KTy
 Qi8inEALtodhEx6NSC29xYy7VS1WGlcbXyEeTfDBImizvri85uAB6Hgk3zM4Pc/SSOi0
 74xkjsIxKauqeJpLc0PZrWRCnK72HJaNOOVQlkAs49cZ0bxnS6M1xqT/CO+yDiX0hMBf
 SL8B3MnvaOvvbPwvKzhied0rXAWDe0V77qxuTprWc7E7WrZzix0SsmkPFYR3v/xThUYK
 D4lCeoNJ6JTyBW1vhRYiVC8Rvr2aLZBohauM6ravNTX9An1NO2K+8EHhPG6aXTieeJzv
 kUGA==
X-Gm-Message-State: APjAAAV56Ad9Trl1osUagHVy5UFabQHbgxWTM+ANB98jxt9pF7NbdkD2
 w9H7vUx1pwGAuxD9Ppc7Cdxjn2bPWb7bhfzCF+ngrw==
X-Google-Smtp-Source: APXvYqxBd9I/pdAnhUDZ/lvtwvulGVmbQRbtn+e6+M1kbw9/+qoh6rwIwfXOHiEZ5W/yJhwCocR6A13YC4zSeCpdgmo=
X-Received: by 2002:a05:6830:18f1:: with SMTP id
 d17mr8720559otf.303.1581857210572; 
 Sun, 16 Feb 2020 04:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20200215183503.GA17310@ravnborg.org>
 <CAKMK7uFp5AzCxSeRg=ZibVnD0e8EhrsxYnuLeicUgp3gCr3Lpg@mail.gmail.com>
 <20200215200827.GA9276@ravnborg.org>
In-Reply-To: <20200215200827.GA9276@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sun, 16 Feb 2020 13:46:39 +0100
Message-ID: <CAKMK7uGyVo_Psg8XFZoB7vCMMup1vmQr-cVOoqLv4Nj+WfX-ww@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm: drop unused drm_display_mode.private
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 15, 2020 at 9:08 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel.
>
> > > I also checked private_flags - it is used in a few modules.
> > > And it looked legit.
> > >
> > Iirc i915 used this, before we went full overdrive with entire atomic
> > state structure subclassing :-)
>
> $ git grep -l private_flags
> gma500/psb_intel_drv.h
> i915/display/intel_display.c
> i915/display/intel_display_types.h
> i915/display/intel_tv.c
> i915/display/vlv_dsi.c
> i915/i915_irq.c
> msm/disp/dpu1/dpu_encoder.c
> msm/disp/dpu1/dpu_trace.h <= false hit
>
> i915 still has a few uses of private_flags.
> Likewise msm and gma500
>
> Looks doable to address this, but not on my TODO list.

Oh I meant the private pointer, not the flags stuff. And yeah maybe we
could add this as a todo, at least for i915 and msm. For gma500 first
step would be converting that driver over to atomic, which I don't
think will happen.
-Daniel

>
>         Sam
>
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Thanks - applied.
>
>         Sam



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
