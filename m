Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C341352E371
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 06:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520EB11B03D;
	Fri, 20 May 2022 04:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6871811B03A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 04:01:52 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h14so9793809wrc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 21:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lX20NL3YNPaKjNecI4oDdq3acoU2kOL0ZbPMHMv9mB0=;
 b=QUhqUNwjiYBBL+Gfy7USDRKlfhCB5po25WZwgPlSiSkUXf8omWvdSvXZzxRV41w1tT
 d5C/MVpxWJNzqMqMn4BsGlEqIb6rOVIxP+yf5DJ3CcD/CMFR7a+o3Nxfo0tiHS41+QJx
 1G0voWhXE97nNh8TDu9IYnnRSfvefCogP4VsB5M0y74VMQ5qGopMDi1VQqUGm6PnvD78
 YluERYOhs/tCKgwebfwVE2yQreNBgLUaB4ZY4z6xzZTQ7LXJk9AbCoT54oExEPxtuCAM
 DF3gvipca18rnRT53tde7E+gUZik7VP0hR/Z6h4m5Gl7iRVkpIrQcRhWqQ2jBr0jnUJX
 zgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lX20NL3YNPaKjNecI4oDdq3acoU2kOL0ZbPMHMv9mB0=;
 b=4bDrHjaBOT5tD7cCeoEql6zL0rQOPyFpcMO/ZnyAbg/hvjlJruAmkusSKOW2k4RkJp
 ZWPruwALGAL0GLi18P+PznlM2azKEn6HkG6xEDShsxzwX9dy6xEyGS4kO5+VhWkyVjbF
 uvZleLLchMLcOmgt637STl9TS4QBKvzqMicwrB9o8c+NvnE3h8i8suIqm1qV0wRa0VoQ
 Vrur8oe+V9QDkQEQTCdbVTtzX4wpBa8AAjwUgXKzlF6IfDuM1seTPD/nLieUPT7TG/r/
 CmHlIwj81LXyN7TnxSROSk25m+MkbKpPMXkTkqr7usCE0I7pYqLH18AdUBu9iNtv4PM0
 6+Dg==
X-Gm-Message-State: AOAM533hzE5kpj0Etp+B9i0Ch8WRIQksCbqNPZW0V0thcZht6Pl0f9B6
 TaCd0M6tct2y2zVWT+FaHZ0uw6zI/OCeDffXZ6Q8rg==
X-Google-Smtp-Source: ABdhPJzdvVJxxqGLhr1D82HU8Nge0YZ/NcyQRTLRKVqI4Jh/02FF2nx30JgW9qrXm/uIf/Cxvut3pYr3QoTiG9nq0a4=
X-Received: by 2002:a5d:5846:0:b0:20c:7407:5fa1 with SMTP id
 i6-20020a5d5846000000b0020c74075fa1mr6448325wrf.116.1653019310813; Thu, 19
 May 2022 21:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220519214021.3572840-1-kaleshsingh@google.com>
 <202205191848.DEE05F6@keescook>
In-Reply-To: <202205191848.DEE05F6@keescook>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 19 May 2022 21:01:39 -0700
Message-ID: <CAC_TJve0iyPU0uKoKOi_qcwgxPkgNKgirBcMJ=oYBqhRC3a_+Q@mail.gmail.com>
Subject: Re: [RFC PATCH] procfs: Add file path and size to /proc/<pid>/fdinfo
To: Kees Cook <keescook@chromium.org>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ioannis Ilkos <ilkos@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Colin Cross <ccross@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mike Rapoport <rppt@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 19, 2022 at 6:50 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, May 19, 2022 at 02:40:15PM -0700, Kalesh Singh wrote:
> > [...]
> > +     seq_file_path(m, file, "\n");
> > +     seq_putc(m, '\n');
> >
> >       /* show_fd_locks() never deferences files so a stale value is safe */
> >       show_fd_locks(m, file, files);
>
> This comment implies "file" might be stale? Does that mean anything for
> the above seq_file_path()?

Hi Kees.

Thanks for taking a look. The comment above says the "files" pointer
can be stale. It doesn't affect our use of "file" here. seq_show()
takes the reference with get_file() so "file" wouldn't be destroyed
from under us.

Thanks,
Kalesh
>
> --
> Kees Cook
