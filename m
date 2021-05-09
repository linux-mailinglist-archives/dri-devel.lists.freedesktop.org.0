Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92781377897
	for <lists+dri-devel@lfdr.de>; Sun,  9 May 2021 23:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA2689B7B;
	Sun,  9 May 2021 21:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A94089AB5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 21:08:30 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z13so20404537lft.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 14:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KEUReX21G5VTsk66AMRVB4ZwxsVW0bIo9WW4NuchitU=;
 b=LOwp2B4SstGoCbPt6x0msPL/aLEWhPJ1iETDlaaFGcwh62xXbi1VsWQ9zdBfhBJtz2
 cwPztAFCK56zT+OQKqFs62RzTHBn84W7ZtGbU5ec9YO1FtHUunzFoUve/A1VtpZKCc5Q
 HPKFBzVOs+hZDFjz8xN8NJ1nuEDHGes74KzNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEUReX21G5VTsk66AMRVB4ZwxsVW0bIo9WW4NuchitU=;
 b=of4gY58la1aFEDnPwMBGQ5dZJo+oQCl427CywEIZ2yfmHVtUwtLWTFkjmnkUMYXCUK
 laqrL1HHwl1N3j6E/RZOTxBGkzGLv21/TNMJL7qDywD6bngzYXF3HfJkdrvwhC/edU5Z
 SXwETAkjTl9hYgDc42KM1qOJ/vxqbooCY3DEziyYJWydMsWuH2AJhUnXxlfmlTIiefvT
 DCMzjosyrVdFURZlKGEjPrd/jVoJnXDVHyBEfdel9oi99ELMbMPFCUpFUbzpRcbkA/Fq
 Xar38X0LPVsxBQf+H9rB9MqXYMCKDIIZgMI1LYjC9w7Pc3Rw//dBTj1lMXYXb8KiqLM6
 ynug==
X-Gm-Message-State: AOAM533XKmlxdKLswvqCWZiT35Y4Qd+K9aHsaJYFL6ttQJe8KMcaZ8jv
 kRuLFJ8NCL1zzShIOUkUzQMTHKKxzDmMN3FRu8M=
X-Google-Smtp-Source: ABdhPJzrfPkfWcmlv1JEXDkC+D5Bm3VNj856tG3HEyfifknvUVeiPZyjkbE8eQSd685wNy/mZdhe4Q==
X-Received: by 2002:ac2:42ca:: with SMTP id n10mr14313185lfl.330.1620594508720; 
 Sun, 09 May 2021 14:08:28 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id f29sm2880867ljo.69.2021.05.09.14.08.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 14:08:28 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id r5so3178516lfr.5
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 14:08:27 -0700 (PDT)
X-Received: by 2002:ac2:5e6e:: with SMTP id a14mr14085253lfr.201.1620594507715; 
 Sun, 09 May 2021 14:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twAN82gkzrfc2CGQopjkjEdWtBKMF2DgBOtw+6RsZ++fw@mail.gmail.com>
In-Reply-To: <CAPM=9twAN82gkzrfc2CGQopjkjEdWtBKMF2DgBOtw+6RsZ++fw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 May 2021 14:08:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgf+kHeSZbpkZumWcTXUD7ordqTMvPRNL6aQVG1DSBDnQ@mail.gmail.com>
Message-ID: <CAHk-=wgf+kHeSZbpkZumWcTXUD7ordqTMvPRNL6aQVG1DSBDnQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes round two for 5.13-rc1
To: Dave Airlie <airlied@gmail.com>, Guenter Roeck <linux@roeck-us.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 9, 2021 at 11:16 AM Dave Airlie <airlied@gmail.com> wrote:
>
> Bit later than usual, I queued them all up on Friday then promptly
> forgot to write the pull request email. This is mainly amdgpu fixes,
> with some radeon/msm/fbdev and one i915 gvt fix thrown in.

Hmm. Gcc seems ok with this, but clang complains:

   drivers/video/fbdev/core/fbmem.c:736:21: warning: attribute
declaration must precede definition [-Wignored-attributes]
   static const struct __maybe_unused seq_operations proc_fb_seq_ops = {
                       ^

but I noticed it only after I had already pushed out the pull.

I'm actually surprised that gcc accepted that horrid mess: putting
"__maybe_unused" between the "struct" and the struct name is very very
wrong.

I fixed it up after the merge due to not noticing earlier..

Maybe the drm test robots should start testing with clang too?

           Linus
