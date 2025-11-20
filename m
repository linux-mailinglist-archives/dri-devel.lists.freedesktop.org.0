Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51575C7654E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 22:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2CE10E7D8;
	Thu, 20 Nov 2025 21:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Teso5gjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E87010E7D8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 21:10:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BCB7A443E7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 21:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F00AC19422
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763673018;
 bh=TO5ZlSYR+vXFAZTLgdO27XZTNfldjtuuWh045oi2yvk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Teso5gjfcmDobRb9H8GajE87+VDUCO75k+p/SS7mx6NZLnt8VAX1ICqz2s4GeYMzs
 35T7dZoj2hrX76CKpPdd0pk7s09z0pGkRhYIOcqAdP0UPCEdFaZzZwKhxKkSoSS/rB
 htSVHmYcX5QDlA3gJadtlm61XRsfWqdga1+J8NCA+nRtCoLFvqzZdE8GHxgDCV97De
 26r8dlKSZcoxBPjwduF0OGBGIV6lg/yJmPeqIGbSuZrnjWhS7uJVWgUwYmXOX3ZIR4
 TWWCl+5OVE+aXT9bq5ott7AAih7scENNd3y1SdxYyG9mzdDDzlv30h0ukKCzjBl/N8
 QpGWosf0jjs1Q==
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-786d1658793so12702647b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 13:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWayBSymV7VAH4/PGAWHDp3PwG6UvMa4sk+xBh2FhEpgWLhZIDU2NERjHBFmzbuLrY16nlAJXR8QO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtKrOmeBR9xISCS5xo1laebiQkk/SWGYNE6aCIrTnAQC4lR4H+
 XqM7+H9s7zvKEYxAJgQPO4OY7+0+APaKlGI68fTqcsGJdE2/1P+gEo5zixgW8gKe/82Xo+B8Hfz
 yMW+MhdoK6ljFWuk6LOlzNUTeBXN5fRU=
X-Google-Smtp-Source: AGHT+IEZudifwNOqgis3jmKlimmWAPiJkTPTTiLqjeNfeVyTfv8VPTYcSvS+vYaz9jrIleKmeG3Do8TsPKOS/DIyLkA=
X-Received: by 2002:a05:690c:45c4:b0:786:7a54:4624 with SMTP id
 00721157ae682-78a7955c38cmr81864247b3.7.1763673017764; Thu, 20 Nov 2025
 13:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
 <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
 <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
 <tcu23ayvadb3vtz6vksrrkw6rkngofxnhokaa4khat2grnqgcu@ttmqg6illoz7>
 <5da8f176-4db5-4d2d-a7df-23b8047b293e@ideasonboard.com>
In-Reply-To: <5da8f176-4db5-4d2d-a7df-23b8047b293e@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Nov 2025 22:10:06 +0100
X-Gmail-Original-Message-ID: <CAD++jL=c-87rk7_DqvmhBCOnqP7OkygCPhmBrsw50nDMAFYfhQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnj0c8oHH5Bx83BWdy5etdS3VldniUzdyRs563oFevARZgv26EbaPVq-pM
Message-ID: <CAD++jL=c-87rk7_DqvmhBCOnqP7OkygCPhmBrsw50nDMAFYfhQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

On Thu, Nov 20, 2025 at 6:08=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> In any case, it makes sense to fix these in the respective drivers (with
> some core functions exported). It will get the issue sorted out for now,
> without needing elaborate reverts, and without hacking the core.
>
> Linus, Marek, is this ok for you?

Yes sure, I'll take a stab at it and try to fix Marek's regression too.

I guess I should namespace the next exported helpers drm_*
and export them so that will be a separate patch.

Yours,
Linus Walleij
