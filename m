Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD6501F21
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 01:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5523F10E182;
	Thu, 14 Apr 2022 23:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7C510E182
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 23:32:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b21so11628788lfb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sa7u+ZRCHDwKgHlQLbM1vs4Jt2a53sPV1j8OeRq25D8=;
 b=eglZIE9MXugBNIfsVulolUvIIy8x+cjwaIDOUhzKbQivLhVwRamN5vM+bF4TeAuN5W
 K12uHIOCK7sGxGm+PUsF6/cUldQ+eDw7biDzolA0vbKfaF0aFR2xzUnniUfH1LQTu2R1
 vAf2hqcuUX7GHVmi3S2z8la2ROdTYKQsPich8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sa7u+ZRCHDwKgHlQLbM1vs4Jt2a53sPV1j8OeRq25D8=;
 b=UC0lNCKFuijPOkd7xF7M4bWvqZgbVU37iE+EZlQmGEDAv6crIa7F6MOrE0jtd+FB5c
 UJPC7onn+0Zca+FeYO13U6KPWWuo+uZdWugzZmcJ2t0nIkfHZKmL8gcLQEDXqttSkegm
 /CL0vS1YzN6usEaOKzH7H7ql0MKyO3PgcB/GfqeJiYE69Kfts3tTShYb8RSU1D193Ul5
 Du0jcuhYPYYHD8aZSTIKozVY06KBVdmDfhxm2zGn2Y8NYJQXbn7GIxOmx6HCCh/Hy2Pc
 Jr20yPbbjO0VN+gcnteTUXgJIU6serPWwDEpa+KocYcyg/ewvJH663ClwF6V0fBNF6Ct
 Xrog==
X-Gm-Message-State: AOAM530s3PhYaNzVrbdTXsuLrHpsLQoVkM3OWc4iJdBgO4fankstdVh6
 LTbNuYQAnilji9QNIxTVePNUpYrYTu0BFPwV
X-Google-Smtp-Source: ABdhPJxQRfiztvVLR7R1Sl3X/8prHDOQoJmXI8TRbtXyN490r+jO5u738cOFmkzAe+MYf0bDdKHxEg==
X-Received: by 2002:a05:6512:31d1:b0:46b:b213:2f26 with SMTP id
 j17-20020a05651231d100b0046bb2132f26mr3142399lfe.583.1649979169777; 
 Thu, 14 Apr 2022 16:32:49 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 h14-20020ac24d2e000000b0046bbb877e41sm139502lfk.245.2022.04.14.16.32.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 16:32:49 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id v13so1739594ljg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:32:48 -0700 (PDT)
X-Received: by 2002:a2e:a78d:0:b0:24b:62bc:28ab with SMTP id
 c13-20020a2ea78d000000b0024b62bc28abmr2836956ljf.164.1649979167688; Thu, 14
 Apr 2022 16:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzmeDfgQ3VhutQWLcgVhodHJhGmzrjMTB=yvXOhwnw0CA@mail.gmail.com>
In-Reply-To: <CAPM=9tzmeDfgQ3VhutQWLcgVhodHJhGmzrjMTB=yvXOhwnw0CA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 14 Apr 2022 16:32:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh2kmGysfLOUHpWZXDEM6oNAQZw9k8pfbQgWg1conE66A@mail.gmail.com>
Message-ID: <CAHk-=wh2kmGysfLOUHpWZXDEM6oNAQZw9k8pfbQgWg1conE66A@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.18-rc3
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 2:33 PM Dave Airlie <airlied@gmail.com> wrote:
>
>   git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-04-15

.. and since I'm  now back home, I can confirm that my boot-time splat
I saw before is all gone.

It presumably went away with the previous pull request already, but I
hadn't remembered to check the issue until this pull reminded me about
the issue.

Thanks,
                    Linus
