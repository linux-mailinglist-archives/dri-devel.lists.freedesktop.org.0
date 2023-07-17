Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C87564C7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA70F10E24E;
	Mon, 17 Jul 2023 13:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A7F10E24D;
 Mon, 17 Jul 2023 13:24:17 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b9b427b4fcso2966641a34.3; 
 Mon, 17 Jul 2023 06:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689600256; x=1692192256;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t5LU01t/vXZm+dDXLFQRH8erMGESttF/4gKz9Yp37p4=;
 b=NDjbN58uA449fhl5HGWbWCXXAlKvT0t3eVhSdqbCXtubHaPQ7WTliO5zEov2cQ0ja1
 E4hVOFSgOqcIo+waoAZXIQBWyq73SGa3xkJ4kGAECDCc4RLnXk3IZq+7qaSwYmvLLJOw
 d3fCBwpB0qQKvdIEMEYubu/d6hIg7JgY2dC0b4OteZkERC4icvkRzRJDYQ5nFJayVsvJ
 n8yw/7Nsb5l6rkXmmlXo3r4ESCMWOgqLeNP8XeygJcb5IzpKxJEZ5iSoS0g/Chfg0VoK
 UzsHEeJN+1XMJMGMnxwxL4C1So1wIl/syHeRhmR1dQYWr2jM4SAg2MCyMa6tl7oHzEkg
 FaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689600256; x=1692192256;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t5LU01t/vXZm+dDXLFQRH8erMGESttF/4gKz9Yp37p4=;
 b=KbmAsz0ipNlqYJYoFCv076COh/VgjQSD/PbVFo6d8EhCFQ6S30YQ0t/+gW6OV0/jXt
 ibZLVkt9ksQ5v69MO9gE8LHoSiJFFu6ZyszNqJz0nAut9FnKMFm/lH2IpOKPy2gLuva3
 zs/N6GoGypdmy0hUavs8CCCB41vDq4TOa8RFgs0JS4WsgGglTuMR/XjUfzx6ZbZMj0Zp
 XwDg+KEbKTOLVzCe2w+NH/0T9jT5EH/jd2FQsJEkooeXzAa/ifAngDxBtMq3tPtne/Y+
 WjPTfG4+fvz/MbOVIVSXHYMgGnOCAdGbq9SAUCf452+AXABMDKfuwPVM5nGxCIxB5HJQ
 kyCQ==
X-Gm-Message-State: ABy/qLbhE9W+5zGJ0i4fQ4rzIYkC7o0rgSIBB1AGFjTIHQtpfR09fkPv
 wL5by6X+goFxYQxUgdpHSBTsWwBMpxUDPy1obro=
X-Google-Smtp-Source: APBJJlFCzZTtfuPwE7KhKNcqVkxLyngMk+SnrjTQTDLGqouhl5hHzg2NZf2F0fBfd/iOxM+67wgB2yeWs7gxfRLlL6M=
X-Received: by 2002:a05:6358:2485:b0:135:85ec:a080 with SMTP id
 m5-20020a056358248500b0013585eca080mr9696631rwc.32.1689600255581; Mon, 17 Jul
 2023 06:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230630115651.354849-1-James.Zhu@amd.com>
 <wBFta68Nq7iIaszeM9WT6v04l1DSIEs2cM-dOQ3uMWbFM2B74j43LU4Vm3VvzLrTfJRtZ8zM2c3AAxtMsqKcVlNtBuaJlITqtIRZzBuT56M=@emersion.fr>
 <CACvgo50YDLkavfidjQAmrsxHWJEtCD6QrC8duuz4F-C144RtDw@mail.gmail.com>
 <PguMcqMlRDvAT5fdpZfgyOWT8DQ1ZLXhgLD0puLL8l0ZYj0UiBvDclFp54l3ov1vH9A7whpUQhY4H65Fh3u6a4aXZzK5a_6fgSKpi4_PXx8=@emersion.fr>
In-Reply-To: <PguMcqMlRDvAT5fdpZfgyOWT8DQ1ZLXhgLD0puLL8l0ZYj0UiBvDclFp54l3ov1vH9A7whpUQhY4H65Fh3u6a4aXZzK5a_6fgSKpi4_PXx8=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 17 Jul 2023 14:24:03 +0100
Message-ID: <CACvgo51i9nBodn6wcxEXQ3Aty+LtHF-5=5owGKtVvbhHqGdHqw@mail.gmail.com>
Subject: Re: [PATCH] drm: support up to 128 drm devices
To: Simon Ser <contact@emersion.fr>
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
Cc: jamesz@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Zhu <James.Zhu@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jul 2023 at 10:45, Simon Ser <contact@emersion.fr> wrote:
>
> On Monday, July 17th, 2023 at 09:30, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > > I'm worried what might happen with old user-space, especially old libdrm.
> >
> > I also share the same concern. Although the bigger issue is not libdrm
> > - since we can update it and prod distributions to update it.
> > The biggest concern is software that cannot be rebuild/updated -
> > closed source and various open-source that has been abandoned.
>
> Well. Now that we have Flatpak and AppImage and friends, we're really likely
> to have old libdrm copies vendored all over the place, and these will stick
> around essentially forever.
>

The flatpak devs have been very helpful. So I'm pretty sure we can get
those updated - even for older flatpaks.
For AppImage, I have no experience.

> > For going forward, here is one way we can shave this yak:
> >  - update libdrm to max 64 nodes
> >  - roll libdrm release, nag distributions to update to it // could be
> > folded with the next release below
> >  - update libdrm to use name driven type detection
> >  - roll libdrm release, nag distributions to update to it
> >  - once ^^ release hits most distributions, merge the above proposed
> > kernel patch
> >    - the commit message should explain the caveats and fixed libdrm version
> >    - we should be prepared to revert the commit, if it causes user
> > space regression - fix (see below) and re-introduce the kernel patch
> > 1-2 releases later
>
> That sounds really scary to me. I'd really prefer to try not to break the
> kernel uAPI here.
>

With part in particular? Mind you I'm not particularly happy either,
since in essence it's like a controlled explosion.

> The kernel rule is "do not break user-space".

Yes, in a perfect world. In practice, there have been multiple kernel
changes breaking user-space. Some got reverted, some remained.
AFAICT the above will get us out of the sticky situation we're in with
the least amount of explosion.

If there is a concrete proposal, please go ahead and sorry if I've
missed it. I'm supposed to be off, having fun with family when I saw
this whole thing explode.

Small note: literally all the users I've seen will stop on a missing
node (card or render) aka if the kernel creates card0...63 and then
card200... then (hard wavy estimate) 80% of the apps will be broken.

HTH
Emil
