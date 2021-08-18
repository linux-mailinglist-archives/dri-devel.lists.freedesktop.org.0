Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC03F0A62
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581D36E887;
	Wed, 18 Aug 2021 17:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D5D6E5AB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:02:29 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id y3so2119425ilm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MkYUY8hRWwEu70DXUFF8siW38IO889EQpcP0JG9olHM=;
 b=p816tpeNXiyVNrHjM3CLMARaTaQ9Q1DNkBPMF5S/QiTyS8TtyNuS4uSDtOvWYkZ9DD
 KQs/VrSCx51qbgHOlhlqY+ZKamKhLS30a7nBa0Wn0WLKywG5EDsLvKzBc8Q5yqbovwVx
 JjTa60sLtZoqpUSmCE3n0/wVzWzMxMTWIHpNstWexLoJOQJ+OxMi+XyB3QXEwvmEN+f/
 wXa6Legda4Ugp7uCGvf3V1ZSw2wJsDe8AJmzt4yb1ib7Fzm5YmC5TfAcZFARVI54/XV+
 DmeEiBYBUtdGwSDq+flIDrO71sP+aqrSrFvrxjsUFvpe0gY8Pan4eGGNA/tuXNtoplKZ
 TcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MkYUY8hRWwEu70DXUFF8siW38IO889EQpcP0JG9olHM=;
 b=CtOFWcdmG571X4+lRUxOthqCaGgnzqC63vsMUZ2piU1/euclrkSNOqb56kbfMhJb2m
 kFfCqsV76XOTQhdKvZ3G3Pi+0O9zNvoHV5t2deLwjFVfOuNwkDHi5YQU1YO1r75gjk7g
 Dkpk/1Psrr+NolJMyBWq3kQrfsMBc/pGdrUOJQPk9TB/3l1I2y/2IF0R40mw/VUw/GwM
 TUqwBBjkkkWQhFwNG2V67S2Ms2Juq81lkG/EjJfPa655kyThYPLLICFZL+iNTKgR+S/S
 JNRs1YCg+TbHXO7OUoMWmHH4JgogNH8mV4b9WaBdRqXgr42rylYa3aGML521j2GOmR5f
 1ffw==
X-Gm-Message-State: AOAM531u645aVR6k5IhJh1su/8v7zJ1IWY0Fj2ZCm7dhFJ/XdnGJzzlt
 dnvJilfQ5H0w6qNnvGkcPmr/vf+DFJWAtAgF3ag=
X-Google-Smtp-Source: ABdhPJzz3GCPM+tS9a6+M7GfZUygskgS+S/HcxGkyNlHvv5PJSFF8ixpr8ONuLYhcpUTCbKIGIlu3ps94hS6aZMTaMM=
X-Received: by 2002:a92:b711:: with SMTP id k17mr6012067ili.247.1629291748768; 
 Wed, 18 Aug 2021 06:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-26-keescook@chromium.org>
In-Reply-To: <20210818060533.3569517-26-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Aug 2021 15:02:17 +0200
Message-ID: <CANiq72mQQuwfpFdxeJQoKnfpUFSPuakHRm8RC+eH-xECBjwDkw@mail.gmail.com>
Subject: Re: [PATCH v2 25/63] compiler_types.h: Remove
 __compiletime_object_size()
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Will Deacon <will@kernel.org>, 
 Marco Elver <elver@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, 
 Masahiro Yamada <masahiroy@kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Sami Tolvanen <samitolvanen@google.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, 
 Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 Network Development <netdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 18 Aug 2021 17:40:22 +0000
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

On Wed, Aug 18, 2021 at 8:14 AM Kees Cook <keescook@chromium.org> wrote:
>
> Since all compilers support __builtin_object_size(), and there is only
> one user of __compiletime_object_size, remove it to avoid the needless
> indirection. This lets Clang reason about check_copy_size() correctly.

Sounds good to me, the indirection is making things more complex than
they need to be.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
