Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C0B489C48
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 16:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F33910E9EF;
	Mon, 10 Jan 2022 15:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5901121AA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 15:36:20 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 s21-20020a05683004d500b0058f585672efso15412078otd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 07:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ATxtiYXvw3f0w5oe53WLDKO2TXCGgBhdfvvMrUcEva8=;
 b=RVKy991vsKZPUqeSDvtT2c9YiyufQrUJFAro3GIl16zm2A1XBsIfj41jeCAJyNNvZX
 fJWenSLCEqON+23Z9Fgua1U/hnSfW9NSgCEYmivvAwGhsdRW5Be2MM7+ME6WxDWUSnKz
 w0/63zBwzHpVY4Vyh6NTnG4VEau6+75eZO6VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATxtiYXvw3f0w5oe53WLDKO2TXCGgBhdfvvMrUcEva8=;
 b=kqARBNiEFJAwsbFC2NIBHoCMbUDwZOOij6KZGK7HQ0SexudiQOlzdm6SIaqTxKIxKv
 b/9d5YyynzsMvas94VhRN3xQWDIiH8a+F8yNtdu8ffdIAjoVYPZ3WAmToyrZ6YhqHK7F
 FxF6g+kbV/QSW3avfAwPYjBOjWaJWkB3JW6l8ARYrsFSQo4FLYlQ2cKCn46XvIYfvyxd
 GBrD/bMxY+26WLNzXhzTNkJ4f7EajS545ZUOep2WU/SxyaJoaK2HhwvNH3lt00xBIBIi
 bgccoiq9EIEZ8hjZPMz2yvIVqo//YRlZ8YCkbyFg4BWliJueAs26v3algQ8kIylCTECt
 Mvmw==
X-Gm-Message-State: AOAM533Yh8B2VRe1ynttv6hBzEfQKBA8nlzBUT37fBhx2VclU+7SBzqR
 p28gbemEmTWzqbycyZjWPBJRR+T3kO2dsG/Cr08C3g==
X-Google-Smtp-Source: ABdhPJw01Lr6GKe3wvkwZbJM4Hvg5bnDiT/nQ6OYafRt8sdo7mWRLMgoKS0pl4fnXWSVt3gc0IRwJu6VUhJw8/ztu9Y=
X-Received: by 2002:a9d:685a:: with SMTP id c26mr217105oto.239.1641828979718; 
 Mon, 10 Jan 2022 07:36:19 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twnYJ8SrVzJEEH+Vksibomvk5CE+Nn6BXKYwLG_8r=GJQ@mail.gmail.com>
 <CAHk-=wiyfiVoci-LHaY=e70zOpAoUqwoaFF4iD3xm847PkK1CQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiyfiVoci-LHaY=e70zOpAoUqwoaFF4iD3xm847PkK1CQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 10 Jan 2022 16:36:08 +0100
Message-ID: <CAKMK7uE_89hiD=C4z9i_XBPCqCAnL1SzXbzHqwOrCphFZKtUWg@mail.gmail.com>
Subject: Re: [git pull] drm final fixes for 5.16
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 7, 2022 at 6:42 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Jan 6, 2022 at 7:23 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > There is only the amdgpu runtime pm regression fix in here.
>
> Thanks, from a quick test it works for me - the backlight actually
> does eventually go away.
>
> It does so only on the second time the monitors say "no signal, going
> to power save", but that has been true before too.
>
> So I think there's still some confusion in this area, but it might be
> elsewhere - who knows what Wayland and friends do. At least it doesn't
> look like a regression to me any more.

Well it's not a true fix, just a "go back to exact old behaviour, but
limited to relevant gpus for amdgpu only" so that i915 doesn't
regress. I think there's some more debug to do here and
Alex/Harry&team can look at leisure now :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
