Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF34BBFB31F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C970710E723;
	Wed, 22 Oct 2025 09:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C193510E723
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:39:29 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-54a80b26f88so2569593e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761125968; x=1761730768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9oPjoXljJJlUVHMn87s6VhA1+MnxIqFzqOvfh/e2MM=;
 b=UwoUq26wXo/JGn4aQPcpyTt3j4uGokYNDw2/RVqGWYILuCNXhFRZDGkt7Mn0VC5+KW
 HwntyfhEDN5J+UtcYSIRrNXfjS36eMzcn2dLzBGD2qLRP6+OzW4Q/tUHV0zdysy6jcLl
 RJLKFiM+FfVJbbXCI4aX2w29JpI/bct1iGDeQ9i2xE/IAHnA0/S4LcqBg2ZcgiNfRVr3
 1xu1PWPby169B3yUh/9fP/7itiPDN2rgrh+kjLeQxTSrGRsPy4ivc6OxMfuV8KqZhGL+
 FC8SrxLDPAUvX9ii+mnt75Vq9GXP4fexTgSNCoXV1jIoHoHomr1LHRaOFei6HuBEJWeK
 vvWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtTTG9K1Fcm7iu0gid1ukd+9o/Q7ObWdecoEsroRL00kfuCDtAGhNjf9jOyA0YSZbHT8W6HL9tMro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTusrP/r4b1OuHTkJhgMMSIcrZ/hyF6bW+25++yAAmlkY/FvQI
 QYyRpTMOcM3dmGxa0UNy6sJ86DTjRGK5kxA4BwpwTV2tbYQxmoqKFyIDzgZ9W2x6
X-Gm-Gg: ASbGncsYRk5CN2ijufFC1stV2p5fTz4O0fLS+xb4ky1cqCx3GHaLiPwPHNKxwVhoq4K
 YFD/KdxCA0LmNhD9vsI6KM4oNTx3CpOgIOAI0IWsPKEjhffAbJBvdUbN+8JjFVlc8OeTYDl7HiN
 51lETm09QV1LZZ2/ti0K6q9KIz9LaOdntBZvAK3xLpQxCRXj+nGAIOW+MwQF2VFV4HGQ7bjWiob
 1BrAM0WyC8pkgUiTTkawhNXYHcNtKzUBEcgUHZOwTO1r7X9xGORIYTIQ6s4yd3Y67QZ1zbovFCZ
 OF/zgmTEC/p+2IBxFa4I4ohfOevewVrl8feVlS2/aBCwH8ko87Ufej9FCBXE+K5ext+dZPJx9HP
 jE6Mw0AJ1ikj8GY/bPf9W7asYLJ8tx6NRSOYok6ZprgBhhGXv3q9gBzTEfQkXwnP3FrsrAc/RK6
 +nUGSpbXINBeo27klY3jNBOuS5ByEXf0y9CzwMXAcKKj5Z0xCe
X-Google-Smtp-Source: AGHT+IHRT6le/sN7tbF5fBziOcRcoTFGK+roQt5HSycPtKHDgysuezB4QZ9XTN49zR0BqZl/wNPOKw==
X-Received: by 2002:a05:6122:17a1:b0:54a:a782:47c5 with SMTP id
 71dfb90a1353d-5564ef717e3mr5777108e0c.15.1761125968356; 
 Wed, 22 Oct 2025 02:39:28 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5568319eb26sm2142078e0c.25.2025.10.22.02.39.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 02:39:27 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-932cb562289so1142693241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:39:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8hUfE+83wrRP4fcHCE5mhEF6bgd+e0/Q+wh8LGSobL4AMArta35bKCXE6Glfy3as5jWDZmOk5guU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:a4f:b0:523:759e:b0cf with SMTP id
 ada2fe7eead31-5d7dd6ad6bdmr5856194137.21.1761125966715; Wed, 22 Oct 2025
 02:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
 <20251022033847.471106-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 11:39:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpVkvHwihk=jVdq37Xi01oh_6O2p9Z2b645ViiuxpFTw@mail.gmail.com>
X-Gm-Features: AS18NWCLE2aAyAzKtAQbH4VnFmVWNSxcs2C7oaQZc_Iov4xWvW3S_J-Tvmn1Aps
Message-ID: <CAMuHMdVpVkvHwihk=jVdq37Xi01oh_6O2p9Z2b645ViiuxpFTw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
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

Hi Marek,

On Wed, 22 Oct 2025 at 05:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77961 M3-W+ SoC.
>
> Acked-by: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Add AB from Matt
>     - Disable the GPU by default

Thanks for the update!

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v2 is still valid, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
