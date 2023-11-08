Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD8B7E5973
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 15:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7234310E78E;
	Wed,  8 Nov 2023 14:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565AF10E78E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 14:46:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6E4FFCE100F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 14:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7F5C433CA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699454802;
 bh=ftbvV4bw4hg6PZIt+37fY8xjNWQpXdeki0QzQPnGqHc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hqT/3OUvZUxmY3zU8zNb2cAcCRomxULleME2gYMNCTqcLgZNsc2ziQzfqvtGQn12v
 HypyI+VXxRI2adUhILfPsKOREf3Ml0k9oKzLKLfVfFLC5iy+oPLrXFZxk5XZ/1UqHz
 Vb54JzqcCkqR0VAsBgM+ij/znL1wiRZUcC9C4w5S0+6mr/6iBcud+WW4R7PZ1cX8F0
 tNV25kcWuZO0BuZbSAjOk4X6QuuoVTVQtVOaVw693zFlB9Fz1/4EwTKMUFi5AW2jnj
 N3fzCgILj87LgBpP1TrQrCTmPyHMZYy9neB+Wocam0zNIQkcz0sJ5fymARgR+wrBmd
 kIyINc4G3JStw==
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9c41e95efcbso1048452366b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 06:46:42 -0800 (PST)
X-Gm-Message-State: AOJu0YxIaxlJL0HJXSN66ggALOi5f6ALosHvWr+EAcX2W5/nmGg3pmkj
 Q85pdQeM9/j/5zyNNhJkkzwlTUqTBfG36Tn+Wpg=
X-Google-Smtp-Source: AGHT+IEzBXZM9VPuZhNQkUuqVe/tJD1jYSO+MYcxH2uv+GndLhMX4wwR7upS73a+oZV/qISb1q6+TNlCDEEUrDUgirM=
X-Received: by 2002:a17:907:3d9e:b0:9bf:d70b:9873 with SMTP id
 he30-20020a1709073d9e00b009bfd70b9873mr1723236ejc.39.1699454801198; Wed, 08
 Nov 2023 06:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
In-Reply-To: <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 8 Nov 2023 22:46:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H65OZfZg2jXR+mUWe9gcSZrgoiEJDGU5qaAOyD2by_L5A@mail.gmail.com>
Message-ID: <CAAhV-H65OZfZg2jXR+mUWe9gcSZrgoiEJDGU5qaAOyD2by_L5A@mail.gmail.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Javier,

On Wed, Nov 8, 2023 at 4:24=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello,
>
> On Wed, Nov 8, 2023 at 9:14=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> >
> > Hi,
> >
>
> [...]
>
> >
> > Relying on linking order is just as unreliable. The usual workaround is
> > to build native drivers as modules. But first, please investigate where
> > the current code fails.
> >
>
> I fully agree with Thomas here. This is just papering over the issue.
>
> I'll read the lengthy thread now to see if I can better understand
> what's going on here.
Thank you very much.

Huacai

> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
