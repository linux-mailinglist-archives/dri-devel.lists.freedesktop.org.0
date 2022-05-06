Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217951DE9B
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 20:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCCA10F020;
	Fri,  6 May 2022 18:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32F10F020
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 18:04:28 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g23so9558016edy.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q6cV3MY08Q5J5EMqd7RYTn/K8x3EoQFULKeiQvTiDEg=;
 b=T2HDqLM0GDt44cOJq5nd/iZFwFe1nypV9GZH3QUrdg9Kzx3Cu242a610phGvfuyACC
 YjCrruvvXl6Wj8zAKANgpfjxzm74bIibd0RK+vOzDhlyICWgQztSY0d9A1KwMt2x1YYS
 5n7z1HFAbOkVNrCvKtGhcvdCF9Rg9OmAoACykcvr5eV5pcoqHw2R7ZI8d+l8lmBKVjQr
 zG2T4IIyMfTz4aK4Q9RfqMIz5PLSfiZxu0A1WJEWvpVWc44AnUVHrJ22U7zxiY2o56pC
 BMLQkBtp0YhKo9aEdwpcc+yDCxjUDM+k81sCwyBFxlvuhcU6nx/Ie34KNcM4CWWO1US3
 mzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q6cV3MY08Q5J5EMqd7RYTn/K8x3EoQFULKeiQvTiDEg=;
 b=G3zHxJ5JzCtugu/3+VLXTqNIwgKeutLCA/mEltKQWabIQlYm0IIXf058n8nLYwuzVv
 giZOn/cOE2tY/CO+cIvysWvnoiJXvBF22/cg4/+PeT7yBtQuj6RGfYhTXvXhUeJotOYn
 3DFwkvcRWeRpmYZ9ima5GTrg1h/KKWGRu0j7BwwSx2P2qOb/sTRaqT3keYNqJVZjU1eA
 REXFClvWhY3npJ5L+1hx5M0flkoGswt7YRSMzoIiP9jkwDvgQ+aSqS6FCUmOKug71v8f
 mmWIK9RA4bXPaKlEyVwxUs+i8mYuaURkKfzBpq5SIY0kPD+jqV2hGszcbhF2JUbEOwqK
 kANg==
X-Gm-Message-State: AOAM532h6Q/XeXVFyuhEnN0JUVFZ0jur371IQZwxjAvbS1+2eGlg3STE
 2Y2EnbCshZ1NpDxiUttbhyFuRKPMBMVZodeCLG0=
X-Google-Smtp-Source: ABdhPJwXEqZpCx25tK13QTqbjFhsfW3K4TjOOqyGoUK/Rt7XPD+Wd9WrJFUT7OGgDT/FLCXxCU2lkTuCiJ3xVZ4VuqA=
X-Received: by 2002:a05:6402:d52:b0:425:dda4:b676 with SMTP id
 ec18-20020a0564020d5200b00425dda4b676mr4595071edb.277.1651860266859; Fri, 06
 May 2022 11:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyaQ8RSYwuh4muEefV3fbjio5gVvYipWVaKjqUycRkS+A@mail.gmail.com>
 <CAHk-=wjtEptPBvJtdbezMLJh6k3O7Y-on=tbC31z4e+ksLda1w@mail.gmail.com>
In-Reply-To: <CAHk-=wjtEptPBvJtdbezMLJh6k3O7Y-on=tbC31z4e+ksLda1w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 7 May 2022 04:04:15 +1000
Message-ID: <CAPM=9txZv6tvFxQptYdwdyeyTs+rUZmm9K_D1f+4SFV_bOb-KQ@mail.gmail.com>
Subject: Re: drm pull request (was Re: )
To: Linus Torvalds <torvalds@linux-foundation.org>
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

On Sat, 7 May 2022 at 02:50, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, May 5, 2022 at 9:07 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > pretty quiet week, one fbdev, msm, kconfig, and 2 amdgpu fixes, about
> > what I'd expect for rc6.
>
> You're not getting the automated pr-tracker-bot response, because your
> subject line was missing...
>
> Just a "how did that happen" together with a "here's the manual
> response instead".

I just forgot to type it in, I send the email from gmail manually
pasting in the contents from the PR.

Dave.
