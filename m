Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38B4E6CB5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 04:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F7310E26A;
	Fri, 25 Mar 2022 03:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBD710E26A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 03:01:10 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id j15so12796580eje.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 20:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g/tnBjCQqbz+ipRB4x1lKBYbOrRRjB/fgc1SofcvrKE=;
 b=BpvZWhPub7tbx5LK/ZUdJWfm+Z7LZ3QO2G1RKBupz6bPHTh2VVII8Y+jDNjde2TJWM
 c4EyLL3WySEQ9R2rsW3R4ltk4tsoDBImqjnolJvZPTA2qvSYr8tzbvwMfgnriYP6hnB6
 aN3auJ1Cq2eUs+jrzEiEHPbsnMbEvDgEdXk/F5MW/dHAleJ37M0VLvlE7g49k91mRx/R
 tAbYWvlRL8XTYMfPLKJ4gCd2R0LMCrqUhSOBe6WnyW6Oz71C4+4A5fWHOWurXHtUQVXu
 2ra0VDUKKqcH2buFnPzQKvKn2ppXCgRQ1Nbk7zymgNg9MWVZw7CMt+Hx/ipNxpDIGj8m
 t0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/tnBjCQqbz+ipRB4x1lKBYbOrRRjB/fgc1SofcvrKE=;
 b=IqCzoLirhqe2G/i854SywCcTj7bu19u6ogPWwDYkfzAIeB6SuQT0W41noFB5vDIY85
 WYVNVk6/6rtVedD9sRRFYnRI9cr/KRirwNJKK9wrRoAjrgwz8llxcfaDx/nH3BjcKnu+
 1gRmlrVuw9T0zDjIBaHo/a0K1nTuNYBhxasg5tdkJ5ozJNPhyqYl8np/QS2OeAZ+YLNb
 Cjmhr8eakaLaZ+THugMuETMRqefBxXfP7nlQuIKBZs8xspR9UOanYHNqpgfORA2vWn5R
 /rN4B8+HrOzGIjFFwWsIpcpkOyebJJfMlsBSBxQiVbm++2oj18Y9J2KrUuRh9pthxxxK
 GkkQ==
X-Gm-Message-State: AOAM531ZRiqdAxwQf2DI9R8zQjpvBJex3CCbHXOwvH9VmiGvISWcw0e2
 Ud8MPBWLqx31QoZ82iK6wrMuZd4dcvViW9F/LwE=
X-Google-Smtp-Source: ABdhPJwbVnkv8Pu9ryy6Zf5UnAAyByy4xvpWgaSyHoOsPbh4F5sb6OrhtjuEy8bp8tlmiXKjHM8ylmQW5BZYRl2Dot4=
X-Received: by 2002:a17:906:dc95:b0:6df:d2cf:4d93 with SMTP id
 cs21-20020a170906dc9500b006dfd2cf4d93mr9013969ejc.66.1648177268654; Thu, 24
 Mar 2022 20:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
 <CAL_JsqJqb6HYN5cw7GsyFobZxFmhU-ci8w4HKQEdFsx=bC_F3w@mail.gmail.com>
In-Reply-To: <CAL_JsqJqb6HYN5cw7GsyFobZxFmhU-ci8w4HKQEdFsx=bC_F3w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Mar 2022 13:00:57 +1000
Message-ID: <CAPM=9tx+YeOCBZ0WRcSMKTyUYr5ngySratZ0K8tmRZ0rCaFf8Q@mail.gmail.com>
Subject: Re: [git pull] drm for 5.18-rc1
To: Rob Herring <robh@kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> FYI, this breaks the DT bindings. The relevant patches didn't get
> reviewed nor run thru automated testing because their encoding was
> 'charset=y'[1]. (While email clients seem to just ignore that
> encoding, patchwork and b4 do not.) linux-next is still broken and has
> been since Mar 2[2]. v2 of the fixes[3] have been posted since Mar 9,
> and still aren't in linux-next.
>
> It doesn't have to be fixed in this PR, but it needs to be fixed
> before rc1. Otherwise, no one can test their bindings using rc1. In
> general, there's no reason fixes need to wait until after rc1 as
> Chun-Kuang suggests[4].

With the conflicts that Linus merged, can we get this rebased onto
Linus merge, and submitted to him?

Otherwise Linus I sent you a fix for the fbdev in a separate pull.

Dave.
