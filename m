Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750658A2F7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 23:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD2AA897E;
	Thu,  4 Aug 2022 21:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F277EA39C4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 21:59:20 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b96so1381211edf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=IcNrO1+0hMqd184OyaCGXcplDsRzgmMXiA2NSTUXMiA=;
 b=DgUfEmbFi+7iccqebXv/ZmxHK9r9RdQFXNZ8Dr8nUqVqSFRu1k1i4dkyHQybTDWbVO
 sp+j5Hqj+Tzo+GWbTEgXuKCuNQljNQ9hMiFfoJp1J9Mgms1GKmSOP/+HzKIHuHs4qy4O
 3hYvbGIWtatQX31kWhmvlVBT2gIyBbOi9AxB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=IcNrO1+0hMqd184OyaCGXcplDsRzgmMXiA2NSTUXMiA=;
 b=VIlZseP2J6xx4d5+9GpLupSK1Zqf16HvKqCd7KW3tXHJ9DW3Eo4MUb5a30IgD9VatT
 1TWjBliYAhIHk1Wmf+k89OUpA61u24vNlziieXJ9GQnKC8cz5eb0ZDwFMOpq60L4hZbW
 f+BehmVAh33fMLE77EW8kJh2uytyg+L04rh3wLSxRQzu1KbiHiPhKUCC5Cr5dLxFm+jW
 lRlXSz6sxspAklboKnzg8AkDLpSzupSXwOcYtR02qeUuUWmFXtGC1LntxvONQ6XjuSPp
 Z2AGtzbR9KHjjEcVmc/VX2OLo+Aaf1M1bLrpHMa21BEbqESc9k6/t5vlmnO9rGr6g09Z
 +KPg==
X-Gm-Message-State: ACgBeo2nWl+gd7jhWvZkiUriRbW/Y8xn7Y9GG6MuClGamkYBx0l0ZzGZ
 SvSC3cETSylUE+rCI2Bpj8y9jNy1kw9w88mC
X-Google-Smtp-Source: AA6agR4ZwRIxS04Tz3ZcmN7NhwKTFJkIwDlM5CkOOuczqFWKW0IqyfVssxC3+xOqmV8Q3jjPBU/Taw==
X-Received: by 2002:aa7:cd99:0:b0:43c:4f9c:4977 with SMTP id
 x25-20020aa7cd99000000b0043c4f9c4977mr3905540edv.303.1659650358933; 
 Thu, 04 Aug 2022 14:59:18 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906218200b006fe8b456672sm792614eju.3.2022.08.04.14.59.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 14:59:18 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id j15so1264406wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 14:59:17 -0700 (PDT)
X-Received: by 2002:a5d:638b:0:b0:220:6e1a:8794 with SMTP id
 p11-20020a5d638b000000b002206e1a8794mr2534090wru.193.1659650357549; Thu, 04
 Aug 2022 14:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <YuwRyQYPCb1FD+mr@debian>
 <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com>
 <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
In-Reply-To: <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Aug 2022 14:59:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whpa_FJjvzWdWdSzecTbVtndbQqg35=_o+ohM3X1_xKTA@mail.gmail.com>
Message-ID: <CAHk-=whpa_FJjvzWdWdSzecTbVtndbQqg35=_o+ohM3X1_xKTA@mail.gmail.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, clang-built-linux <llvm@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 1:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> I do note that commit 1b54a0121dba ("drm/amd/display: Reduce stack size
> in the mode support function") did have a workaround for GCC. It appears
> clang will still inline mode_support_configuration(). If I mark it as
> 'noinline', the warning disappears in that file.

That sounds like probably the best option for now. Gcc does not inline
that function (at least for allmodconfig builds in my testing), so if
that makes clang match what gcc does, it seems a reasonable thing to
do.

            Linus
