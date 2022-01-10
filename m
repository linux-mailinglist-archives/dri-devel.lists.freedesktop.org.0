Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF6C48A18C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 22:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826A210E21B;
	Mon, 10 Jan 2022 21:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7BD10E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 21:10:42 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id 30so57255342edv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 13:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CzOkmxOBSV9Ezr9QPrNTkWoWCCkUbqzV84f/9/7plj0=;
 b=HeusBfk0oTBDWgN3Pioj3BEB2suB3d5lKrRk/Ukp7jPRk/AxG1lrmE9nQ7kYEV8933
 Q5JqEBNN8aiGOkfspYZ61c6tdx2GgWSRszMJCSfzh5RmSWk5l3lewXQqwcuPK92M87dN
 DMElE/fUtk/3I51/41iqEN4Yw9EJtZ7e1i2Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CzOkmxOBSV9Ezr9QPrNTkWoWCCkUbqzV84f/9/7plj0=;
 b=rQLIVioUVbxuUWYgUJrjgBNF0gOx2rwCifolHmwgwaqlRJI3riv8vuLGQuLmpqoQAR
 Q+EJU1lkKxES3OC78syRwqEn3JhGcu9+tBX2hFzlf61iD4caC5zhAqGV22Sr6HV4+L25
 uqL33Vd/1RgUw7FS2awJrKyKgik8q2uIfKqtZGS7ykfnduR1GOxY31sIEyKQPkp/PNLm
 gItLTKFHrYy/dVm5uWAzZ8C/pTTQW7j8tb9KAVmTJLhifz3E1PvNyjCHKRfLaIxKjqT9
 2l/lNMj8vS6kbniMQ5sXCfdz1ZlXA9Ot4LLOGLuyAIR46W4/TqE62JicClxoHY/SbqgK
 dccg==
X-Gm-Message-State: AOAM533crCXxvRqXf+Mu60AhWDsIuBth095foIJmXhE902Z8YwFW6ncm
 YnYr3g+2y+J4wmV4IU4mM7ALH6PHKkOP55v/1XY=
X-Google-Smtp-Source: ABdhPJw9YEyOyKgf6+SDIQrKHGzVtJXfKk56t/HHza3h0wu+CVBIN9UGhvrOdhc6AY2MOxjAyHf47Q==
X-Received: by 2002:aa7:df13:: with SMTP id c19mr1426672edy.233.1641849041040; 
 Mon, 10 Jan 2022 13:10:41 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
 by smtp.gmail.com with ESMTPSA id a2sm4046537edr.65.2022.01.10.13.10.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 13:10:40 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso652178wmd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 13:10:40 -0800 (PST)
X-Received: by 2002:a05:600c:4f49:: with SMTP id
 m9mr23532863wmq.8.1641849040053; 
 Mon, 10 Jan 2022 13:10:40 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
In-Reply-To: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Jan 2022 13:10:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjpsnsZwxNZoRRSocuKFJegvxYmz1+7X7WMAw=qN4ywRQ@mail.gmail.com>
Message-ID: <CAHk-=wjpsnsZwxNZoRRSocuKFJegvxYmz1+7X7WMAw=qN4ywRQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 6, 2022 at 10:12 PM Dave Airlie <airlied@gmail.com> wrote:
>
> nouveau_fence.c is the only conflict I've seen and I've taken the result from
> our rerere cache in the merge above. It's non trivial, would be good to have
> Christian confirm it as well.

Thanks, that conflict really ended up being one that I would have done
very differently without having had that pointer to your reference
merge. And I would almost certainly have messed it up in the process.

So what I did was to look at your merge resolution (or possibly
Christian's? I don't know how you guys share your trees and the origin
of that rerere), and tried to understand it, and basically recreate
it.

It's not exactly the same (different whitespace and variable
lifetimes), but I think I got the gist of it.

Thanks for the pointer, and hopefully I didn't mess it up _despite_
your merge showing me what I should aim for ;)

               Linus
