Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4C9CF0F3E
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 13:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29B710E19B;
	Sun,  4 Jan 2026 12:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pkM+Tuvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9757610E19B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 12:53:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5F266013B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 12:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60338C2BC9E
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767531207;
 bh=2GkzvGGqfZL3bh5RhRzSvXBiSCt9ARZL8lfTivCCq5c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pkM+Tuvpq6xh9kXttjJxkeslslJivLTlCSRMs84VQyRYRU1/foHgO/txmsnJzqpIN
 dRJvrnlD0DVgb85tn3YJbL/nG7xmpS68eCiwVoxDVXO7XYHvdEtKx50TzM3z1sNVBj
 Szlc0XXcR0SMy1mRU7UGLjOdkY7oGuxHzlB3+LLjfFjk0osP32pXrQr5ndEkFjTCeG
 M3ENSwqh0j7zyLEhxW5lBwhLXE/oilGDaZO/Z+oyN14vMpE882PvV4fyDz/5jR5gsX
 qzv0gq8Q9crOJ/S+NBTCvlyL8myvm3acbUv9pnPgWLQFBlNEZOH0FAs6uvporBDCAS
 YjyPvb3UgF0iA==
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-6466d8fd383so10672419d50.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jan 2026 04:53:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXNKuwNw+8Vighad6w5JfojJcSpr7nwFOP6MPq1EVTv4yEHAouq/I5gg40M39CJ8uEpOzw3j5oFDSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlFo4pBLN2w+VT1ASwJ3t0pmI8zkqvbKq5njfaIqVqeE3nBqQg
 VB97x05SBKawgkyVjbWlZeRqDW6/VRmMjanbHUgdxKwTDU51dqkni0ajtUvLnI4eMjoNKAzcTht
 GZK4Ini28Y7+r0A5tWrWrjT834HwXcYo=
X-Google-Smtp-Source: AGHT+IEEB7mYuC/Sl5fgzqaCiKNvdcmDS04XEpUyWSPYmEeov9tXdUFy1CVORLpLNjlmR+GxJnX9QZRks9ks0p9OK54=
X-Received: by 2002:a05:690e:1689:b0:63f:9a63:46e5 with SMTP id
 956f58d0204a3-6466a899154mr37803010d50.28.1767531206677; Sun, 04 Jan 2026
 04:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20251223214915.503913-1-arnd@kernel.org>
In-Reply-To: <20251223214915.503913-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 13:53:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLkcm8GfaKR73AjDmA5gBgp3Z+LX7khqLGgPGj2_s+oPRg@mail.gmail.com>
X-Gm-Features: AQt7F2pUejdd99TBXw4TR4GtIkvYObIwTNgcH1-Xd0hxL5BVKIwzpDUdpfs9IMo
Message-ID: <CAD++jLkcm8GfaKR73AjDmA5gBgp3Z+LX7khqLGgPGj2_s+oPRg@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: fix build regression
To: Arnd Bergmann <arnd@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Eslam Khafagy <eslam.medhat1993@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Dec 23, 2025 at 10:49=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The drm_info() function requires the drm/drm_print.h header to be include=
d
> first:
>
> In file included from drivers/gpu/drm/pl111/pl111_nomadik.c:7:
> drivers/gpu/drm/pl111/pl111_nomadik.h:11:32: error: 'struct drm_device' d=
eclared inside parameter list will not be visible outside of this definitio=
n or declaration [-Werror]
>    11 | void pl111_nomadik_init(struct drm_device *dev);
>       |                                ^~~~~~~~~~
> drivers/gpu/drm/pl111/pl111_nomadik.c: In function 'pl111_nomadik_init':
> drivers/gpu/drm/pl111/pl111_nomadik.c:34:9: error: implicit declaration o=
f function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declara=
tion]
>    34 |         drm_info(dev, "set Nomadik PMU mux to CLCD mode\n");
>       |         ^~~~~~~~
>       |         pr_info
>
> Fixes: a1542b8ca6ed ("drm: pl111: replace dev_* print functions with drm_=
* variants")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied to drm-misc-next where the offending patch is.

Thanks!
Linus Walleij
