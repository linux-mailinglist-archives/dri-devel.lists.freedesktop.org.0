Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE32A57C34
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 18:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743CD10E257;
	Sat,  8 Mar 2025 17:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DRsKL1aW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E270410E214;
 Sat,  8 Mar 2025 17:05:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 17EBC5C6203;
 Sat,  8 Mar 2025 17:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1719BC4CEE4;
 Sat,  8 Mar 2025 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741453538;
 bh=spD0x337wJctW2/W0LOakh/QP95xehRUlEjwpgN4CeM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DRsKL1aWZPZ4nMoNZ3J3eN8DotDY0BGtTXEwgYFrVNmy0XbHxLwOAZnaAUhLMeRY9
 Dnzn2SaziUAUZXBjpp0NLQffUHZ+bvIYTTq03tMnlx7BnuVBS2SuQ2RSe9gIZdZDgR
 K2pLKJXdnTJJPbiwfoB/sNtB6RF6gDc0npT7+3Cql76HguGqZqefhaYO5PyGrfy914
 fOtnqZUfEqWy/WOz13/P8V63coMmY9PLApxpWx+jX6yx9hW7hQad5Mw1bwJiSfOI3k
 ztYC5gW/7vH6lHUaAu1yC41I+Hkcy4rTDiK6BdjVIf+YsgyiziTCJyY7fOKdrW3P4q
 r85ItPhaP09qg==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5499da759e8so237232e87.0; 
 Sat, 08 Mar 2025 09:05:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/K8UciR6lVrocK3+umgbmAnHpdl+x9M1TCAZIPuSh0yagJJG+gz+yajmQcQbjzzUTpGswqhO5Tb0p@lists.freedesktop.org,
 AJvYcCW2+UVeNsT89S8ohmcrvZOBePe98Q9BgSzpw0LJT6NipcnD6Ap+j5wdetBdnZjSfkR4z73P9EYKEpQ=@lists.freedesktop.org,
 AJvYcCWRM6KZz/ltqE5rAzpU/xSzZOGJMi/NWQAebUfBsskNooiRbS2SjPfcojxfJHQJVhYHDo/+FKRDdxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAKg5eaToQWsSW2EQmi8lfWYK6f+TKBp3gd4+h6BVzcQgmwYQi
 cTdI5gRCrKKRKu9jKr3UMsXdCvzOznTlT8V+lqoAt4ZHpJoUGUOMHNLz+MqoyxaTaSDyJhkSlYx
 6lHXeVML9YMWzvEvgGmfsLrui4dw=
X-Google-Smtp-Source: AGHT+IENRDKmWLj+WY1kfGBN4ed7jrzyXk1/GC6kfk4gFHHLgxv9+VUf8rHCwp6m0ZhTErnGKHWA7HZfwQszV/MeyKA=
X-Received: by 2002:a05:6512:b0a:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-54997d99dbemr1648551e87.0.1741453536762; Sat, 08 Mar 2025
 09:05:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737556766.git.jani.nikula@intel.com>
 <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
 <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
 <87r03e1lft.fsf@intel.com>
 <CAK7LNARYBtpwkJxbf84+bzBYn05Kk2zvdVLDZMMBg=B_zzFokg@mail.gmail.com>
 <8734fu1arq.fsf@intel.com>
 <CAK7LNATu9OLEANiSzY3Smo=Bm_9M75EDyvmD6HT5kaS2sxRorw@mail.gmail.com>
 <20250305-modest-finch-of-genius-917605@houat>
In-Reply-To: <20250305-modest-finch-of-genius-917605@houat>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 9 Mar 2025 02:05:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYi5HPR+J0cdS33itHUdq5Qd+543X=z+AFyHxQssSJRw@mail.gmail.com>
X-Gm-Features: AQ5f1JrcpiwPWbOqe8DUcKJzIYj3izGyKq0j-4vGn25dcPlBNvrmPcAy1roUDQ8
Message-ID: <CAK7LNATYi5HPR+J0cdS33itHUdq5Qd+543X=z+AFyHxQssSJRw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 simona.vetter@ffwll.ch, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 5, 2025 at 10:59=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Wed, Mar 05, 2025 at 03:05:25AM +0900, Masahiro Yamada wrote:
> > > IMO headers should almost invariably be self-contained, instead of
> > > putting the burden on their users to include other headers to make it
> > > work. It's a PITA in a project the size of the kernel, or even just t=
he
> > > drm subsystem, to track these cases when you modify includes in eithe=
r
> > > users or the headers being included.
> > >
> > > The exception to this are headers that are not to be included directl=
y
> > > by users, but rather by other headers as an implementation detail. Th=
ere
> > > may be such cases in include/linux, but not under include/drm.
> >
> > This results in a false check for include/linux/.
> >
> > I don=E2=80=99t see much sense in doing this exceptionally for include/=
drm/
> > after we've learned that it doesn't work globally.
>
> As far as I'm concerned, I find this extremely helpful for DRM. If only
> to ensure that the huge amount of work that went into cleaning up our
> headers doesn't get lost.
>
> Nobody here claims that it should be enabled globally, just that it
> should be enabled for DRM. We already have plenty of exceptions like
> that for compiler flags, checkpatch, contribution process, etc. so I'm
> not sure why those would be ok, but additional checks limited to a
> subsystem wouldn't.
>
> Maxime

Because we learned this feature is broken.
It was broken under include/linux/, so it will be broken under include/drm/=
 too.

Headers are included conditionally.
There is no need to make them self-contained in all cases
by compile-testing every header detected by the 'find' command.

I am very negative about this patch.
I hope the upstream maintainers and Linus will not pull this.





--
Best Regards
Masahiro Yamada
