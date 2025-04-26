Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86058A9D8D8
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 08:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B3010E9DE;
	Sat, 26 Apr 2025 06:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JoLF9yRW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CC410E9DE
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 06:54:24 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso520215966b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 23:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745650463; x=1746255263; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8WoCmUis8Ol6Z+c7rTs6b7qBE/ahNLhfc6fAQ3sAHhQ=;
 b=JoLF9yRWolomnkACelBZStsqMj15OHq8S+b3MvjxsGXWrHJLe+RKv9KIOAr77Rkb+E
 dbpp7xEIrqFDS+QrN+EJolg+rfeHRCemi4zfSR0UxCc1HUeuiyNzmDYY9gDaHeuu9Nh3
 mUyMkJKZLBkbMLjDdZF+ykr46EewH6W/Q/LaAXIklYyZHXk7RAyfsykDSpFeXLdc9J3I
 se5QnP9lfwtwU3tB5GnI5U9dZul8SXMZO2tlK8paoe9IjhlP06HQtg7lXgPpK6xkd195
 MyO9naQ4cAxflgo7ga+FxrkVgpsR3OtQNG8/bwKgHO8p3GBLW/yFjNB7IfFtkA3blDYC
 cT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745650463; x=1746255263;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8WoCmUis8Ol6Z+c7rTs6b7qBE/ahNLhfc6fAQ3sAHhQ=;
 b=MiALG0s5JVS0Cx/nFObzM8GjwMToWkJ6HTcrPY2ubZDQsraqGtDRpWUGM1T0e5ZE+f
 dsxfW1BCFrxbKph/ISBQYP+yWnDSSGkgsO80DGTcji8+hiauzgQIUzDez0U29ZTsxd3a
 oeHMbN4AjyoEEmOiLWhvkBxGNTmztFUNG4Y30dVxIuMIiCCH4Jzx3znpvm88ug3tio8F
 4gnzWFOfcxsL+IjrG01dd5WlB1aO1Yhj5v3OnCKpz6EbyB3vp9JcElAUISa82aO6GyF2
 76krY/v6aFRxlV9EenwF9YyckB9o9+HfTwsztY6PyqJWq0EvG4J9xaWRMmEnXN8+9TYZ
 Iv4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiNlkSkVtvIHqErnt/XRuEsXMdiL1/Oz4OZ4h8rxg6xq+6bdhNUOYZNDa91zjEbB9dR7R0Qg6o3UA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhtCOE3Hsn4Z1uukZteVzy2iJQsCAywGnM+mZ1YFXm0OVTUy86
 Z5v9lKIzTHCMebKGenJNOGXZpq/Mknv1ELd/Dzh2sjJvrFzcMVrYxF0ep15tREbjVaElCz8cb0e
 mKF0RooCpXB5EIG/439yHEvyFN18=
X-Gm-Gg: ASbGncsQGZA1DFexakm47LR1d+36WvuUPAoZX6jUyC98ap73EwUQRWOAGe2skmTCKl4
 m0RsDFVuTAwqBNVpnju4qc5fWZ0A2jwRO6bdCeAh2HOjIb3om6ki4Ql91KclLYwiSTUOZNoRRCp
 jPoezBcCKbObansQAqlPxD
X-Google-Smtp-Source: AGHT+IGC0uvpV3EDS4q705RyZRePh5QkNiJf6PrdO99FXottogwNk+Gb4LWLNJ1XHzSx+9giL/LPUBOCImqGbG+Ekd4=
X-Received: by 2002:a17:906:db04:b0:ace:6a10:aba2 with SMTP id
 a640c23a62f3a-ace73b46db5mr372271066b.57.1745650462894; Fri, 25 Apr 2025
 23:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
 <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
 <CAPM=9tx2XsDNFDWkxndpFPNihgf18CK7Ps85vE4ZRvuLBG35UA@mail.gmail.com>
In-Reply-To: <CAPM=9tx2XsDNFDWkxndpFPNihgf18CK7Ps85vE4ZRvuLBG35UA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 26 Apr 2025 16:54:11 +1000
X-Gm-Features: ATxdqUE73n1-4m37EOUkbbFZ1-rjlaR3nnvcNv5GqEIbodg1glh8xu1Pail9vBI
Message-ID: <CAPM=9tzh5sdpfDXQgLymXKn2_qf7ccN4EsAEaYTNEY=hWNbGNw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, bentiss@kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 26 Apr 2025 at 16:44, Dave Airlie <airlied@gmail.com> wrote:
>
> On Sat, 26 Apr 2025 at 10:56, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, 25 Apr 2025 at 16:12, Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > Weekly drm fixes, mostly amdgpu, with some exynos cleanups and a
> > > couple of minor fixes, seems a bit quiet, but probably some lag from
> > > Easter holidays.
> >
> > Hmm. Is freedesktop.org feeling a bit under the weather?
> >
> > I'm getting
> >
> >   remote: GitLab is not responding
> >   fatal: unable to access
> > 'https://gitlab.freedesktop.org/drm/kernel.git/': The requested URL
> > returned error: 502
> >
> > and when I look at it with a web browser, I get
> >
> >     HTTP 502: Waiting for GitLab to boot
> >
> > and it talks about it taking a few minutes, but it's been going on for
> > longer than "a few minutes" by now..
>
> Indeed between me pushing this branch and you trying to pull it, it
> does seem to have died, I've pinged the appropriate authorities.
>
> I've pushed the same branch to
>
> https://github.com/airlied/linux.git drm-fixes
>
> I can try to create a pull request from that if gitlab isn't back tomorrow.

It seems to have recovered now, but not sure how stable is it, please
repull the original PR when you get a chance.

Thanks,
Dave.
>
> Dave.
