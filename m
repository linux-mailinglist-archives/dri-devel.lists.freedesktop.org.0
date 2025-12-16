Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4657CCC32D9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 14:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D21410E331;
	Tue, 16 Dec 2025 13:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FhRmTTh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0D10E331
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 13:24:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C860C4360E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 13:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85A7C4CEF5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765891496;
 bh=OFjOLDZ+Htljn9mhZJvvPB7mxrz5xHNxpULHvNFA274=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FhRmTTh36eu/CDwWZvZ8g1ZMnmXK4TNT7d8kqvd3AXwlEMzVxvhjTJy9oNeMNuxxc
 i2CCxCgtSbdslnAyzHb90nB2i6xvGUquyHJS///EGp9fGqGdo6ofHb0d9uLg1d+SsI
 kIWYXD4Xg0Js+FMLncUZHECabbtZoPl29Cr6sIcgNRjdM3I84TgVaYfNS4Nodw3kAF
 tGsWfFk9e6jdQ85hXHahi7aZqH/HYf8wr/gyorAAkAQ64yhqr+jHMkERqV721N1fM3
 NUgqHEuIuxyvJzlUHnetEezk9F/IoVTkH3RsZPjSuoOKCQ/YmjIagbUuWr32pzeJpj
 inRWN94XFn2qw==
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-34c363eb612so3087590a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 05:24:56 -0800 (PST)
X-Gm-Message-State: AOJu0YxJ3XmQtedVQN716gkJxn4sM3VhBjyPLTUc9lYslTOhAAq+CcEZ
 5w4RpIzBthBXrwKtREEo9dICRQPGxP8UOr943WlkIu1lRpzdqUFi8VvZhFzY7utvc47nuSwnB8C
 QF+JKOkFcHMtnP4t9dawwnmIgj+Io3Eo=
X-Google-Smtp-Source: AGHT+IExnmvm24wckON7fJ9fYhZ0zYkTc+hqMRfIglpWonig7OEYfvLFTC7+mFwSOqtbgqRAHyvY2+x9TLgJ4A7eNZQ=
X-Received: by 2002:a17:90b:1fc6:b0:339:cece:a99 with SMTP id
 98e67ed59e1d1-34abd6dd2fcmr14151922a91.13.1765891496308; Tue, 16 Dec 2025
 05:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20251208193925.7449-1-tursulin@igalia.com>
 <CAMj1kXFZD+No6C4MEpmSY5Ha0DtJH+kHfTiO02By4ejUekLaRA@mail.gmail.com>
In-Reply-To: <CAMj1kXFZD+No6C4MEpmSY5Ha0DtJH+kHfTiO02By4ejUekLaRA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 16 Dec 2025 14:24:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHWWzqVKDO81+d6RAZrmZuLcoBhKNqCGJwX1bRyYkXVjQ@mail.gmail.com>
X-Gm-Features: AQt7F2qNW4SGOOjvSMv4uZLdKi0bWBL2AdBxefzKOS2b3E8LsGGZNjLFauQjcoo
Message-ID: <CAMj1kXHWWzqVKDO81+d6RAZrmZuLcoBhKNqCGJwX1bRyYkXVjQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] EFI fbcon fixes etc
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
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

On Tue, 9 Dec 2025 at 03:05, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 9 Dec 2025 at 04:39, Tvrtko Ursulin <tursulin@igalia.com> wrote:
> >
> > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >
> > Two generic fixes split out for easy review, one refactoring as requested, and
> > then the last patch is the panel/mode quirk to allow for corruption free fbcon
> > with simpledrmfb and efidrmfb on the Valve Steam Deck.
> >
> > v2:
> >  * s/unsigned/unsigned int/
> >  * s/pitch/linelength/
> >  * Removed comment explaining the Steam Deck quirk.
> >  * Added patch to refactor quirk application via callbacks.
> >
> > v3:
> >  * Added forgotten __initconst.
> >  * Use separate callback for the fixup quirk.
> >
> > v4:
> >  * Use __screen_info_lfb_bits_per_pixel() instead of accessing lfb_depth directly.
> >
> > v5:
> >  * s/lfb_width/bpp/.
> >  * Grammar and typo tidy in the last patch.
> >
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Melissa Wen <mwen@igalia.com>
> > Cc: linux-efi@vger.kernel.org
> >
> > Tvrtko Ursulin (4):
> >   efi: sysfb_efi: Replace open coded swap with the macro
> >   efi: sysfb_efi: Fix lfb_linelength calculation when applying quirks
> >   efi: sysfb_efi: Convert swap width and height quirk to a callback
> >   efi: sysfb_efi: Fix efidrmfb and simpledrmfb on Valve Steam Deck
> >
> >  drivers/firmware/efi/sysfb_efi.c | 73 ++++++++++++++++++++++++++++----
> >  1 file changed, 65 insertions(+), 8 deletions(-)
> >
>
> This looks fine to me now. Unless there are more comments, I intend to
> get this queued up as soon as -rc1 comes around.
>

Queued up now, thanks.
