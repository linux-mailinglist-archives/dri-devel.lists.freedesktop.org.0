Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81DFA83360
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 23:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370BC10E320;
	Wed,  9 Apr 2025 21:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AFiZTJNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10C710E320
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 21:29:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5f0c8448f99so362241a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744234182; x=1744838982; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=koGM74J+N8JShynrhnHBSSHsTPgOKyKEVI65TwosR3w=;
 b=AFiZTJNXlpECZZHy1XaqJMEUfGYFNG3eErmShhvu8JXrkEER/hFcufruvIhoDcLFJj
 Qb44hh+YzEucfVyL4yiqvPB3bS6v6VRUTVdIqReO8d2oMR1lTZn8Zf4KwgvZp0QNUKo7
 cFmX/1PlLOa9t5XcKcDDkWwqLaWSDEe5NxOJzD+MFJX+TVNvfQc9dnU5M8kuGNQoWL3/
 FIkAuzch55b0fPvFZSOLJ4ak0iDNOQkulW+ABzRcMNIJhVbJS9nzu7e1pAZGSE1zb+Bs
 cPkM6q3oJ/66FmEM0FKgLkJ1vMCxNXQec2ljYin5M3MYQWU1ouysMRCWXLOH79aIGpZh
 YK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744234182; x=1744838982;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=koGM74J+N8JShynrhnHBSSHsTPgOKyKEVI65TwosR3w=;
 b=e0YS1nNghYqmPhHUw66hAVCslAgwrF6RGp3vZkgD58iqdutfCVIOCyxxWE1IVIjuCp
 E6nI4kyd0fB7jHgNOMFQwB3i4nfF70bHAtXXAQbWIJiBPrdpVZemI3KkmOmFGq8M5+Np
 NUSiaAYGFlYf9KdXRTEB5Uzlq8cxZRlIQaZOuw0Kl/dArjdQaWcTlgOE+I4ythGpi5ij
 WkbPTc+Imh/IyQe1yiN2TfmtU0Tm+s7i+EgrM+DLsTdcNpqgf7gpmYjW4kcteTuwAeO4
 fQZeCQvYgjXgQx6TCQAjuwxNHo4Px4uuBq+EkMgXMpDdwE23IXR56GYbxw/EJwXfRlfL
 XceQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo3AnNVjMddWr8GwwpWVjmnR81fA8zXG1bExMm7AtOkq+EfEOZd+oMvOobQLhxK8WlWGICDDyer5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8ghqYoJEjU9LIj7bEkkmn4ncJOrlDnjGw+pXGZ6qnzqcQs9wS
 lmKo8vcnHNRUoZS6KXkLeNrrDlh+aXuhNrQImPTjD7I83NHyjFCl29ce8OdsNmHi/lI3AENGVj+
 al/kUbpJYxCO/p3nAWDMP0yH9/uI=
X-Gm-Gg: ASbGncsnHSIJmYP1BpsxoPF2u7XuHe7MhWozKBHGe72DLWdKHgtAMIjw1uNKcV1b0ho
 c2HkoNwm19Lq0XfzGQBNpExpNlziY/UzhCRVKw/IB+Eo7xDZlAsbdqQ/lhWfQ1f3RTVl2j4LVPN
 yZseee5huyC4SZtxqkNUOrlraoJyUTFTg=
X-Google-Smtp-Source: AGHT+IGFFZh9CR3JVR2kr7210edumrEN7ufj3tHQiSmNhz5qN+39RgQmEwEJ1jfeQuDKFqO6lrZPO1cA6shionAYv3g=
X-Received: by 2002:a17:907:60d1:b0:ac6:b8de:1a74 with SMTP id
 a640c23a62f3a-acabd195381mr19484966b.15.1744234182018; Wed, 09 Apr 2025
 14:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250325235522.3992-1-dakr@kernel.org>
 <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae>
 <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
 <Z_V2ZxIZxI_HiHM5@cassiopeiae>
 <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
In-Reply-To: <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 10 Apr 2025 07:29:30 +1000
X-Gm-Features: ATxdqUHdpRBr2tCbnMtfupehKqCWRVz9idzezedVWo9GJjW0jOJ9n8I1deM8TMg
Message-ID: <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
Subject: Re: [PATCH 0/8] DRM Rust abstractions
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@kernel.org>, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, 
 daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
 aliceryhl@google.com, tmgross@umich.edu, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Apr 2025 at 17:49, Asahi Lina <lina@asahilina.net> wrote:
>
>
>
> On 4/9/25 4:17 AM, Danilo Krummrich wrote:
> > On Wed, Apr 09, 2025 at 03:06:38AM +0900, Asahi Lina wrote:
> >> On 4/9/25 2:04 AM, Danilo Krummrich wrote:
> >>> On Wed, Apr 09, 2025 at 01:29:35AM +0900, Asahi Lina wrote:
> >>>> On 3/26/25 8:54 AM, Danilo Krummrich wrote:
> >>>
> >>> You said "use it/submit it in any way".
> >>
> >> I thought keeping authorship is an implied part of kernel etiquette.
> >> Usually when you submit code someone else wrote, you keep them as
> >> primary author... I want you and others to use the code, that doesn't
> >> mean I want you to put your name on it as if you wrote most of it.
> >
> > The broader context of the private mail was about you stepping back on kernel
> > development. You did so with a few more details (which I'm not going to
> > disclose), that made it clear to me that you don't want to be bothered with
> > kernel development any more.
> >
> > In combination with you giving permission to "use it/submit it in any way", I
> > thought it's better to just pick a safe path to not misrepresent you given all
> > the changes I made.
> >
> > I do still credit you on all corresponding patches though.
> >
> >>>> I'm really tired of kernel politics and I don't want to spend more brain
> >>>> cycles looking at all the other patches or having to argue (in fact I
> >>>> usually don't look at patch emails at all recently), but I would
> >>>> appreciate if you keep my authorship for files that I did largely author
> >>>> myself. After everything I've been going through the past weeks (some of
> >>>> the people on Cc know what that's about...) this feels like yet another
> >>>> slap in the face.
> >>>
> >>> As mentioned, please diff the correct thing and then just tell me where you'd
> >>> like to have primary authorship changed.
> >>
> >> I don't even know what tree this series is supposed to apply onto (tried
> >> drm-misc next, torvalds/master, v6.15-rc1) so I'm just going to take
> >> drm-misc/topic/rust-drm and assume that's what this series includes.
> >>
> >> $ diff -urN rust/kernel/drm/drv.rs ../uplinux/rust/kernel/drm/driver.rs
> >> | grep '^+' | wc -l
> >> 45
> >>
> >> So I'm diffing the correct thing now and the result is essentially
> >> identical.
> >>
> >> Meanwhile, device.rs has many additions... but a big chunk of those is
> >> code that was just moved from drv.rs (like drm_legacy_fields and the
> >> code that uses it).
> >
> > Except drm_legacy_fields! and VTABLE (which is just trival boilerplate code)
> > device.rs changed fundamentally, i.e. I switched the device abstraction to use
> > the subclassing pattern.
> >
> > If you look further you will find that I really changed a lot of things.
> >
> > I have *nothing* to hide, here's the overall diff for all the changes I made:
> >
> >       [1] https://pastebin.com/FT4tNn5d
> >
> >>
> >> Again, I don't have the spoons to make some deep analysis here, you
> >> should know how much of the code you changed, added, or just moved
> >> around. I'm not going to litigate this further. If you think splitting
> >> up a commit into multiple commits and moving code around warrants taking
> >> over primary authorship of a project I've been working on for years now,
> >> so be it.
> >
> > You just said you "don't have the spoons to make some deep analysis here" and
> > right below you acuse me of just "moving code around".
> >
> > Which means that you do so *without* evidence. And again, I have *nothing* to
> > hide, see [1].
> >
> > Besides that I also told you that I'm fine to change primary authership, if you
> > tell me where you think it would be appropriate (even though I do think my
> > changes do justify how things are currently).
> >
> >> I'm just disappointed.
> >
> > That's where you are maneuvering *yourself* into.
> >
> > You could have easily just asked me to change things for patch #X, #Y and #Z.
> >
> > Instead you outright started with accusing me of things. I also feel like you
> > intentionally try to misrepresent what I am doing and what my intentions are.
> >
> > I neither have the time, nor am I willing to deal with random drama like this.
> >
> > If you want something changed, just go ahead and tell me what, *without* more
> > drama and without more accusing me of things.
> >
>
> Alright, then please remove my authorship entirely from this series,
> including Co-developed-by and signoff lines. I hereby release my code as
> CC-0, which means you don't need the signoffs, it's yours now. The same
> applies to any future code submitted that I originally authored as part
> of the Asahi kernel git tree. That way we don't need to argue about any
> of this.
>
> I thought asking for patches that I mostly authored to keep my Git
> authorship would be an uncontroversial request (and not unreasonable to
> ask you to figure out which those are, since you made the
> changes/splits, and #3 clearly is one), but apparently even that gets
> you flamed on Linux threads these days.
>
> I regret having been part of this community.

Look, this isn't Crank or Speed, there is no need to keep the drama
level above 50 to sort this out.

This also isn't exactly how best to relicense code, so I think we
should abstain from doing anything to help promote more drama.

The project will maintain authorship/signoffs on any patches that are
clearly still authored by you, we will err on the side of caution and
on rewritten patches which share some decent amount of history shall
retain your authorship. In this case it does appear instead of putting
in the 5 minutes of looking at Danilo's reasoning and supplied diff,
and either saying "my bad, this is sufficiently new code and I don't
feel I wrote it" or "I'd still prefer to retain authorship despite
your changes", both of which Danilo indicated would be respected you
somehow picked door number 3 which probably took more time and effort
than either of the above options. Again no need to pick door number 3
here, you can let the bus go below 50, it won't explode.

Dave.
