Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4961AA4EA7B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 19:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16B410E67C;
	Tue,  4 Mar 2025 18:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pQUqobuZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BB510E67A;
 Tue,  4 Mar 2025 18:06:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B4714A45B9D;
 Tue,  4 Mar 2025 18:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ECAC4CEE7;
 Tue,  4 Mar 2025 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741111564;
 bh=rq2hw62C/iomJY2eV4t9Q+xeodTS1c6P3hXEivlFZaE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pQUqobuZ+oUKsiCMPlgLJrHW83+iPIOTHm+QIhvntUHq57Q8QlgLrTnR42f+gqglh
 9HRaOvE9zne9KQRCvKKpQCzAg/GlxcH1fLADPInuNqPD73H4uILK++N1ZWYagMmpHE
 AGlLhzTRFwQxGq8ptYvI1M3FyLZ6V0MYUuh5/Gzigj2uJqRa2N9EFVSe8N6lwb972P
 MfjzG7kDSFFXuM75ETYgKF8GQZHwBw2azaV6L2da9er3I+WijT0/nYVeYmO86jQNJv
 LeC6GSPxe7zWyv8IfEChb/DWqZrsxh5Ja33qY79n8dQ3002u9TWbtYHqAZNmfRpCC1
 REPuHkMeHgj6w==
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5493b5bc6e8so7017665e87.2; 
 Tue, 04 Mar 2025 10:06:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWf+5ftjY/3ERaJH0//eNMckUSSWs02Kdd7k0Y9tW+x5FpDhYQT8xpx/DrvT0s+OcD6JFBVybC8q54=@lists.freedesktop.org,
 AJvYcCXelCwWrNmG5N0g0vSVIVqKjnzV1FnpcvjfLOULgnssR6edU0bqhY+ELjTeBfPBm8+rii8PfJlUueQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCxNqKrHgKJjDWot7j4FLwnkUoyG7pHIm2v1Jvnl77L0yJKYv6
 ocijvgHeBm8ESgxqefgtBhALZomfXUpiQck+haRBRqaAtxfmEbU6+hb3s8Nkp9Kr5fmVYXtf2/l
 oArKZO9YKZtt0SfnTkVG5Y4Ly/6o=
X-Google-Smtp-Source: AGHT+IFvojviNxX6+WTNTuXzl3V0smRmSFMKNWKMZYz09CSX0eIPt5GxP/sjNq677YEJ+NdDtJCoLd0NcKx/KVKRw4c=
X-Received: by 2002:a05:6512:3193:b0:53e:3a7c:c0b5 with SMTP id
 2adb3069b0e04-5497d331fc8mr43130e87.10.1741111562840; Tue, 04 Mar 2025
 10:06:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737556766.git.jani.nikula@intel.com>
 <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
 <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
 <87r03e1lft.fsf@intel.com>
 <CAK7LNARYBtpwkJxbf84+bzBYn05Kk2zvdVLDZMMBg=B_zzFokg@mail.gmail.com>
 <8734fu1arq.fsf@intel.com>
In-Reply-To: <8734fu1arq.fsf@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 5 Mar 2025 03:05:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNATu9OLEANiSzY3Smo=Bm_9M75EDyvmD6HT5kaS2sxRorw@mail.gmail.com>
X-Gm-Features: AQ5f1JoVLfM4XuoDnol9gNUYCBtXc4ZnVSnHOaMLd5wP_nOkh25Ymu6a3Zn58eA
Message-ID: <CAK7LNATu9OLEANiSzY3Smo=Bm_9M75EDyvmD6HT5kaS2sxRorw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
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

On Mon, Mar 3, 2025 at 10:53=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Mon, 03 Mar 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > On Mon, Mar 3, 2025 at 7:02=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
> >>
> >> On Mon, 03 Mar 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
> >> And one of the underlying goals is to make for minimal headers with
> >> minimal includes and minimal dependencies, preferring forward
> >> declarations over includes, splitting functionality by header, etc. It=
's
> >> just that doing that often leads to broken headers, unless you actuall=
y
> >> build test them... and here we are.
> >
> >
> > What I learned from my last attempt is that we cannot avoid
> > false positives without adding a lot of exceptions.
>
> All of the drm core, xe and i915 headers build fine without
> exceptions. There are no false positives. (*)
>
> > We can never be certain whether you are making DRM headers
> > self-contained for valid reasons or for hypothetical, invalid ones.
>
> Please enlighten me. What are hypothetical, invalid reasons for making
> headers self-contained?

See this thread:
https://lore.kernel.org/all/20190718130835.GA28520@lst.de/

When CONFIG_BLOCK=3Dn, it does not make sense to
ensure <linux/iomap.h> is self-contained.
This is just one example.

I am pretty sure I observed more false-positives
in header compile tests.

>
> IMO headers should almost invariably be self-contained, instead of
> putting the burden on their users to include other headers to make it
> work. It's a PITA in a project the size of the kernel, or even just the
> drm subsystem, to track these cases when you modify includes in either
> users or the headers being included.
>
> The exception to this are headers that are not to be included directly
> by users, but rather by other headers as an implementation detail. There
> may be such cases in include/linux, but not under include/drm.

This results in a false check for include/linux/.

I don=E2=80=99t see much sense in doing this exceptionally for include/drm/
after we've learned that it doesn't work globally.





>
> BR,
> Jani.
>
>
> (*) Fine, there's one *intentional* special case in i915.
>
> --
> Jani Nikula, Intel



--=20
Best Regards
Masahiro Yamada
