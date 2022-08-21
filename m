Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3435E59B532
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 17:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F188DE03;
	Sun, 21 Aug 2022 15:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820C68DDBA
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 15:46:35 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a16so3881140lfs.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 08:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9TLK9+BKc8g3xh6woROpKXcoWuAUhsb5dRPXMyeVb9M=;
 b=AoDBQUrx0Ddz9SmudCqABl8d002BLNU64PNtItlOIrKtiQVoRXuPwBHuJCCdsXjHbZ
 SCafJu11IRbEDfvgiA45dxI8RREko1FBY+KpLAjdIjbppPk0V66EnEAO3GLpBoWq+9ix
 I1J3fCTPpM8heCMiUbigEGZNmg+w/DUNCEyx58zL6SqVaiHH2tCaB5gkhLHp3i/986NK
 DnjSXAO/gCLrpPKBQAUa5bcxFufNF6dZhdPYEjxMZhHam/Aa67KqjEIlS3bJHEAugDGe
 7O9euuLHWs/53C5H3MdFKXu31NDxSogke/c7ru2dJ7QcjLiktNm7vQCgYQvh9Md/ZILR
 u48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9TLK9+BKc8g3xh6woROpKXcoWuAUhsb5dRPXMyeVb9M=;
 b=QZp+hYwefXw8zGza7OcftWl3sMK9U7TsIrQgdyWIg96pccFN3zbw1jUuKzbpDdNDGM
 Xq4pEFam0XGxfeoZz9f56shEr6OZu/KRHFaXFkHUykziwFf3cC0XeHNs7Io4CYGOmTqj
 9mWE8aQ4Zwc5pQBjkItfioASka19zPP5xPw4ri8ViXL15lvkaGLVu/Qzp0p1LAPqTDl+
 MmIQ11NwPSknev4TKUetfoKnx/PCdP01pdtcQgHAmRAwvWypSPZCvKTnaw3Ef9SgVZdU
 HnmD6lypBsTZ/8Pd1WQMVfOH5kgRrKAMdqDTODjpVjXfsu8XLTiBC21hb3Af6byHGZ9g
 6GxA==
X-Gm-Message-State: ACgBeo1gmhAfyrgdzf0fn552Jo/nit6yB8PRhPJEadVAZIX7JPqPKM6Q
 70uflbTdxS8TiO7KJ9uCOK7+dQLTXhD2CrK8mNc=
X-Google-Smtp-Source: AA6agR4M39kCwEMKVBj9sahO7jkfPBJBkL19nOL9WunoLz6gSf0YK5m7IknyMzEk2ZTefMdTRSC2aARZ/OcBq4c+OCI=
X-Received: by 2002:a05:6512:32c7:b0:491:e313:544c with SMTP id
 f7-20020a05651232c700b00491e313544cmr6389409lfg.477.1661096793444; Sun, 21
 Aug 2022 08:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tspZpSCE7U1WB2QRExXe=C8E51Vj3Ss9=K71QWqP8MxHA@mail.gmail.com>
In-Reply-To: <CACO55tspZpSCE7U1WB2QRExXe=C8E51Vj3Ss9=K71QWqP8MxHA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 21 Aug 2022 08:47:06 -0700
Message-ID: <CAF6AEGtb5TNXj4Eo3ACUc_AG_iDeQroeKnN9RPPcBeNaWORsfg@mail.gmail.com>
Subject: Re: Rust in our code base
To: Karol Herbst <kherbst@redhat.com>
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
Cc: jason.ekstrand@collabora.com, marek.olsak@amd.com,
 dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 20, 2022 at 5:23 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> Hey everybody,
>
> so I think it's time to have this discussion for real.
>
> I am working on Rusticl
> (https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15439)
> which I would like to merge quite soon.
>
> Others might also plan on starting kernel drivers written in Rust (and
> if people feel comfortable to discuss this as well, they might reply
> here)
>
> The overall implication of that is: if we are doing this, people (that
> is we) have to accept that touching Rust code will be part of our
> development process. There is no other sane way of doing it.
>
> I am not willing to wrap things in Rusticl so changing gallium APIs
> won't involve touching Rust code, and we also can't expect people to
> design their kernel drivers in weird ways "just because somebody
> doesn't want to deal with Rust"
>
> If we are going to do this, we have to do it for real, which means,
> Rust code will call C APIs directly and a change in those APIs will
> also require changes in Rust code making use of those APIs.
>
> I am so explicit on this very point, because we had some discussion on
> IRC where this was seen as a no-go at least from some people, which
> makes me think we have to find a mutual agreement on how it should be
> going forward.
>
> And I want to be very explicit here about the future of Rusticl as
> well: if the agreement is that people don't want to have to deal with
> Rust changing e.g. gallium, Rusticl is a dead project. I am not
> willing to come up with some trashy external-internal API just to
> maintain Rusticl outside of the mesa git repo.
> And doing it on a kernel level is even more of a no-go.
>
> So what are we all thinking about Rust in our core repos?

I think there has to be willingness on the part of rust folks to help
others who aren't so familiar with rust with these sorts of API
changes.  You can't completely impose the burden on others who have
never touched rust before.  That said, I expect a lot of API changes
over time are simple enough that other devs could figure out the
related rust side changes.

As long as folks who want to start introducing rust in mesa and drm
realize they are also signing up to play the role of rust tutor and
technical assistance, I don't see a problem.  But if they aren't
around and willing to help, I could see this going badly.

I do also wonder a bit about code tooling (indexers, etc).. I'm not
sure what the state of things when it comes to cross c<->rust
integration.  Ie. it is usually straightforward enough to track down
all the spots in C code which would be affected by some change.  It
might be easier to overlook things on the rust side.  On the mesa
side, pre-merge CI jobs help to catch these issues.  Less sure about
how to handle that on the kernel side.

BR,
-R

> CCing a bunch of people who think are the most impacted by it either
> from a reviewer/maintainer or developer perspective. If you think some
> others should be explicitly aware of this, please point them to this
> discussion here.
>
> Karol
>
