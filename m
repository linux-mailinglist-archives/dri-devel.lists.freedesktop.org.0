Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A915A73C268
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9215C10E0F5;
	Fri, 23 Jun 2023 21:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329B910E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 21:16:41 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-562f36eaba9so803591eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687555000; x=1690147000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZQjsSh8xdWQ7cPSJtrniG176fZtuSK++L5k+xgsmZik=;
 b=ESpvJyVDoB79drIjOoAJ7jJmROWECWJhuY5F5jyzXynNOhh11WpPYLogcylvclyOJ7
 8V3Ahhb1JbiMsfuGm4wi8DnoRbsrMF+JujJB4pAl4Vp3mKrus4tCH4p1qpfXXBILGOLg
 UKRO4DguHNL9cYyvRCefJVd86PI7PDDAFP7eCnFL/bh6OWp3N/ymtdkFn9/ujPX6hRlY
 8gsOKZJT2C+WKBQm8AnGJWkPBJd1tv99Gazdjj6HH1CuEBWA8rn/ens7O21TFtiOT+Xt
 w7sUVCB/Gr1ni0xYvw1YHdhlI+aGyrQCidT0fvtsMeXluncZONwucVTjGToyS2FZLH1+
 l93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687555000; x=1690147000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZQjsSh8xdWQ7cPSJtrniG176fZtuSK++L5k+xgsmZik=;
 b=iuFLJdMY35ghvs+e0FOhwE3mJuIW2AGBVCEWxJe0P0XpBIbjvKa/a3rHcL+pnrl7Jc
 0Py0zga9kkBEle0kxxQQmWNIy5zLno5KrOgPmdfHy/7XuVK05iiWXPJe4ZYAuTZZm1mY
 gUkLCnhKg14zC+h3Vh2U+i70ZUolZSn5Vd7UppDxtqLNGSSs0B9P9lqqCd1Ur2bu5mO+
 TItgaRDW7yTbM0wsEpgalveYkr/k+c1v5oItz/ocgJ2DG59C9CKH8iPyZGqhvvyAA3Jz
 Z+QQ/KJUc8MPbGQrEhH/e/tWtm4oTGSvHQIVmWSLq9/ShbYrTb7s+qNS8zA0jKGcjmqc
 amNQ==
X-Gm-Message-State: AC+VfDx82hQ1PbTZoY9Daqt+/YyE5BjhCbJmw8eawTayBSX/vqShY5Vx
 kxBPgAcgbcrLhzTqe7e4uD/Bpuogds08Bhbt/VYt5y1j
X-Google-Smtp-Source: ACHHUZ6M+mrqYMfIbhI/K065uI8kB0wZnxk/Y3/Ahj8C7M5Dpjc3wCkpsuKvLxkPy8+BBPcAo/JugzNTgGVqabTNcXo=
X-Received: by 2002:a4a:b6c2:0:b0:560:cb1c:1534 with SMTP id
 w2-20020a4ab6c2000000b00560cb1c1534mr3630658ooo.2.1687554999957; Fri, 23 Jun
 2023 14:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twXadK-V1qttzJV3ks8hZu7jY3Nswzw6EgGADnJZF2+fA@mail.gmail.com>
In-Reply-To: <CAPM=9twXadK-V1qttzJV3ks8hZu7jY3Nswzw6EgGADnJZF2+fA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jun 2023 17:16:29 -0400
Message-ID: <CADnq5_NmQdzpmuG+UtQTW3+MLp6em+M7dCQ2ZiAv0_HvM6cU9g@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.4 final
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 2:49=E2=80=AFAM Dave Airlie <airlied@gmail.com> wro=
te:
>
> Hey Linus,
>
> very quiet last week, just two misc fixes, one dp-mst and one qaic.
>
> Should be all ready for the merge window next week.

Was out of the office this week and didn't get to -fixes until today.
Will send the PR to everyone now.

Alex


>
> Dave.
>
> drm-fixes-2023-06-23:
> drm fixes for 6.4 final
>
> qaic:
> - dma-buf import fix
>
> dp-mst:
> - fix NULL ptr deref
> The following changes since commit 45a3e24f65e90a047bef86f927ebdc4c710eda=
a1:
>
>   Linux 6.4-rc7 (2023-06-18 14:06:27 -0700)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-06-23
>
> for you to fetch changes up to 9bd9be5cbaf8a8faa175ef4fba04a5623281debe:
>
>   Merge tag 'drm-misc-fixes-2023-06-21' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-06-23
> 12:16:48 +1000)
>
> ----------------------------------------------------------------
> drm fixes for 6.4 final
>
> qaic:
> - dma-buf import fix
>
> dp-mst:
> - fix NULL ptr deref
>
> ----------------------------------------------------------------
> Dave Airlie (1):
>       Merge tag 'drm-misc-fixes-2023-06-21' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
>
> Jeff Layton (1):
>       drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2
>
> Pranjal Ramajor Asha Kanojiya (1):
>       accel/qaic: Call DRM helper function to destroy prime GEM
>
>  drivers/accel/qaic/qaic_data.c                | 4 ++--
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
