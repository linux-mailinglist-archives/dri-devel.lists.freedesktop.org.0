Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383C493FD1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 19:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3912B10E443;
	Wed, 19 Jan 2022 18:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B1F10EB81
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 18:25:10 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id 23so10068962ybf.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qhZUjSqSQkfhZLoYn5e7bhCr/SYhnGpXe4Qg5Zbv7IY=;
 b=KcjIc7Fy7AyXlztjvbf4TXqfnkrciDNXOMtpFzvtF3QorWdBdCJcZNxXQir+xqCgM/
 vhWvU4puaDNNHZIf8tBZKxSuEwQBcTPRaILKpqqMlp0EO0agvObWm58HneQ/F52afxd+
 6yk9sB6uJI4kgfYa9xXzLl1IhZoi8Xr/g+mGUrRUzF3gyQ9ppLz97Lc6tXjX5m/whFY+
 ECRNg2HIhE2665MiG3OSXjnIgdouodrSJyK4mwNzw4KfTZvN2jBb+EzlnKNLhNJrQzDp
 62ZPButvLcfnCM8PWDujKudROIKqyKSbycC36/wmwUvk0cT2ZnfhnIf8hQfmUytuiq2F
 Dvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qhZUjSqSQkfhZLoYn5e7bhCr/SYhnGpXe4Qg5Zbv7IY=;
 b=w2kkMlvTPO+6rIBczgXZ4/o+eC4Wr1vb1pqEezbB+q/Q+BsAC27lZMz8QmNg96oUmQ
 obE3llhXzx9LZ5lPlYiCfiKWXWk278sKUuXuWGU9m5gp0Ze3odOPNrVZmleEVjMEc9wv
 5TkdwEupz6ZhPsCgAUAww1zPlxYtgzsZOVmSZNFwyJHT5zer1u+oZ7AwwlGe51vBYBcF
 pOe6QdvoWAQH9KYOitX4eGXa4HsVH5iwilHldLNWKdEN9ay7P7GX2Yn+zxjdi/VllI3h
 FT317riSxbq9CsYuBal/varMo0NUF8hLkumKSUvsUA4FUy3biPxSwNbbGm/d8IY9Hx5w
 WImQ==
X-Gm-Message-State: AOAM531KwsOpbkcFuG+J2HENQGmX4gil35C7+BQmFCtJdRVgyJgEha/u
 Au6o8t8F8HkyjPrnZhiyIHYAb/e/Ye0qIC8+fV4sRA==
X-Google-Smtp-Source: ABdhPJyn4giiiq8ubwJREn+9rcxttcLhxnSzBFBbGPyp4Qw1J6vVVbQT+Fu9+AYAHNXgggW+6+BF7t8OrokPelbULGw=
X-Received: by 2002:a5b:586:: with SMTP id l6mr28353208ybp.322.1642616709101; 
 Wed, 19 Jan 2022 10:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20220115010622.3185921-1-hridya@google.com>
 <20220115010622.3185921-3-hridya@google.com>
 <aea5b741-c994-4007-156e-d8a3a5b9bbcc@infradead.org>
In-Reply-To: <aea5b741-c994-4007-156e-d8a3a5b9bbcc@infradead.org>
From: Hridya Valsaraju <hridya@google.com>
Date: Wed, 19 Jan 2022 10:24:33 -0800
Message-ID: <CA+wgaPNqXSCxhby8xzQGCZ-GGJQ475Nx==ki63=DR_i25P_PiA@mail.gmail.com>
Subject: Re: [RFC 2/6] cgroup: gpu: Add a cgroup controller for allocator
 attribution of GPU memory
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>, Kees Cook <keescook@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>, Kenny.Ho@amd.com,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Matthew Auld <matthew.auld@intel.com>, Miguel Ojeda <ojeda@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Laura Abbott <labbott@redhat.com>,
 Marco Ballesio <balejs@google.com>, linux-media@vger.kernel.org,
 Li Li <dualli@google.com>, Todd Kjos <tkjos@android.com>,
 Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>,
 Vipin Sharma <vipinsh@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, tjmercier@google.com,
 Christian Brauner <christian@brauner.io>, linaro-mm-sig@lists.linaro.org,
 Hang Lu <hangl@codeaurora.org>, daniels@collabora.com,
 Chris Down <chris@chrisdown.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 7:40 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi--
>
> On 1/14/22 17:06, Hridya Valsaraju wrote:
> > diff --git a/init/Kconfig b/init/Kconfig
> > index cd23faa163d1..408910b21387 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -990,6 +990,13 @@ config BLK_CGROUP
> >
> >       See Documentation/admin-guide/cgroup-v1/blkio-controller.rst for more information.
> >
> > +config CGROUP_GPU
> > +       bool "gpu cgroup controller (EXPERIMENTAL)"
> > +       select PAGE_COUNTER
> > +       help
> > +     Provides accounting and limit setting for memory allocations by the GPU
> > +     and GPU-related subsystems.
>
> Please follow coding-style for Kconfig files:
>
> (from Documentation/process/coding-style.rst, section 10):
>
> For all of the Kconfig* configuration files throughout the source tree,
> the indentation is somewhat different.  Lines under a ``config`` definition
> are indented with one tab, while help text is indented an additional two
> spaces.

Thanks Randy, sounds good! Will fix it in the next version!

>
>
> thanks.

>
> --
> ~Randy
