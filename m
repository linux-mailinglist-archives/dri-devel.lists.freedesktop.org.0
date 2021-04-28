Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4D336DEDD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 20:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14D16E091;
	Wed, 28 Apr 2021 18:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB3F6E091
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 18:14:43 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso45118931otm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 11:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lRZo4tjbQkODypjbD5IbSY7MNhOk04d/kV8UYGlt1QI=;
 b=Rh2Uy9oDFm5EBMMlX5tL/ldVgHDZJGjFlBPv4AZ5gqrBe2bvOlRcrf0kv4KuNhcKbB
 VA9D9rfuD/VUU0KCBQuMkjph6NSOR3Lr2ZL9q+L9K58HSbsnuID1A3b3+UbtYwhkBxPZ
 tEv11MQd3M6D87nXhTBq11NTpCj0Hhk4/kHfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRZo4tjbQkODypjbD5IbSY7MNhOk04d/kV8UYGlt1QI=;
 b=WWB0RJk5YMP0s4S/v79989FqNREXIf5R0M5YOthFveY8evAdlnS8w6LhQvgMgmVyIp
 XNwmB7bZKVD/luiD6cs3ZGZVGKwZISm17GXzSgXY8D+1E38Urg8LjvwzWXWJBcQ4vTmb
 4M4oC3yzYcBr5ErIoEN4TEWrr0ZlWHkydUFJNCxGUpCVNq4gthC6SJGGt4I4nohbeBem
 NGLAQvPxcKEGos1kIuWH1wEFJP/YTbgcj2yMGxOUbYA85fcOGiEAddYYu+xyamMYVa3c
 6nKtqszknctE8nm+FymOADxDWVTXGxMvCz8Xrhf4D8mhZfVKggnheGq0NZpUzoFhF+c8
 e9Lg==
X-Gm-Message-State: AOAM530IdRTshSvjLFNoZ+7WYXjpoMxVis838K/s1vbYNrO3CdNHwIEu
 zU3NnZO682gWHS/ssJdBmznpthXXS1i9zNmF7Hu3RA==
X-Google-Smtp-Source: ABdhPJzzjgjH88cyHmwoGyK2rHu9q5UGZGkY5dVGMsZTRqHr3GgmcBCSxPnhoq6A/5JPNueu4u3jDlfWM8pC7Hg0uxQ=
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr24767663otc.303.1619633682393; 
 Wed, 28 Apr 2021 11:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
 <CAHk-=wh22MOMM5Paw-dHVvkp6W+UKx8mv_TNJ1TY9iaAMS1rLQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh22MOMM5Paw-dHVvkp6W+UKx8mv_TNJ1TY9iaAMS1rLQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 28 Apr 2021 20:14:31 +0200
Message-ID: <CAKMK7uHn_qFrfK9Dkd41NdXd-VHFsbH4gdnX3+J=0GQ_H0C0Mw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.13-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 7:07 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Apr 27, 2021 at 8:32 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > There aren't a massive amount of conflicts, only with vmwgfx when I
> > did a test merge into your master yesterday, I think you should be
> > able to handle them yourself, but let me know if you want me to push a
> > merged tree somewhere (or if I missed something).
>
> The conflict was easy enough to resolve, but was unusual in that my
> tree had vmwgfx fixes that weren't in the development tree (ie that
> commit 2ef4fb92363c: "drm/vmwgfx: Make sure bo's are unpinned before
> putting them back").
>
> Usually when I merge stuff, I can see that the fixes that were pushed
> to my tree are also in the development branch. Not so this time.

Maybe we're overdoing it a bit, but we're trying to not backmerge all
the time for no reason at all. Only when someone requests it due to
more more patches for the dev tree that need both stuff from -fixes
and -next. Also keeps you entertained during the merge window :-) Plus
I think it keeps us more honest with really just pushing minimal
bugfixes to -fixes to keep conflicts reasonable and all that.

But if it's a bit overdone I guess we can backmerge a bit more often.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
