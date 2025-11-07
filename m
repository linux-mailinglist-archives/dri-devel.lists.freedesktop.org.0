Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCDBC3F05D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 09:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7515910EA41;
	Fri,  7 Nov 2025 08:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7C610EA4E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 08:48:18 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-54aa789f9b5so294111e0c.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 00:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762505297; x=1763110097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UZwIVFjGTkbkhy7kyec25PERQm26PyO71+gNhhmUlYE=;
 b=l+210vMdDEfiB1f9rhE8cbdwgHCkSx8CxnCCESDHDUrbH071+qwCyQg1EfgfoKuD+Y
 2w0mEJqZeiehRxJO2snShWLUC8gEWMfYbSZcWwPsk9B5hjhB0MxNU/DN67WEMQ8dJYqm
 oNB9Gp2brFCmQohwPALCls6HqrGLJiGSB4Rl8wZCanGM4Is33Fmlm5NzKNK8+PnuaONT
 WC0FYVoagckkQ0T+gTm+2o/uc2WBmhPg+qJ8Req5aWzKL/tNlRXPMORzxWBRo1m/KzgN
 1m+/780UTbUTc7Aie7PRvrkNheSuMk2dDIj95MSeV7ggHHrjOAALgbXZsvgl2EHrZzso
 V7Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbyUNwT/+aoar5ru/vgBjhx3zmH0bWOfhmBhmipptas0nH6K16pRShbuo+a8dubHFiLvwLN3EXHZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx20Rx/Z9IqoP4ohpeNyP/1tE7X0vZwlEmXHrpB+f+PphJFpUxA
 Z+STH6MivhvroG4NT85diC/iw9d6ZjgPwx1tiUuewjmm1T53EkRw55r/HEwylppvznQ=
X-Gm-Gg: ASbGncsYGQhPUhR8YtsGF/GRQiCFwaNqwBFbWsFLeyZn/FtsW74dhsYw5eBcX8CzbhV
 FArfB0ZNIUx2xf1unnyyjEzcmLAuI01ur+oLJOW9P2tMDF2xuPqRYeSK7cqPVMa+YC5hQwaTi+x
 t0ycPZEVljLz2vucAavA1yL91gJanptq+KtwU9eNjRKpH5J3KG9Yn3SM5F2+Os7ypctjH9eR7li
 dE4rwwD+lMIvnr2b36N12YJJKWUwhzOOKpr6eHpHhEZrKVZp0RcbBx6jNKjuU4s47a+AK7fUyAd
 bg98tx2Oev0ALAnleM/F+dsHPD7bAV4Ahh1uUzz5Y6+WzJcZ9hlQBT5hoc33LfacZbmjsQff0Ws
 r1wyd69SprsQYXg0XvuSyk2dGnlvaK9iO8y38rYvOTqP0IV90c946J9YsiHJLW2uMl7VWbDkpTG
 Uum8x95EltQEMh40nDjO/TLtijL5PRKZy3F94ETuJlG6CSZsKQ
X-Google-Smtp-Source: AGHT+IFNirdkSBjBkUlHUc+l36/gFmhgY4hgphmMHspZTEvK4+KbZwRackw8T4NRE3dFiAhCPZzpgw==
X-Received: by 2002:a05:6122:2a47:b0:559:83be:69c5 with SMTP id
 71dfb90a1353d-559a3c34febmr860509e0c.10.1762505297322; 
 Fri, 07 Nov 2025 00:48:17 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55996babaedsm2369022e0c.23.2025.11.07.00.48.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 00:48:17 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-5dbd3dbbde3so396976137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 00:48:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUa+L54eV61YDc9mkn2becOofl4SdM1hzAgzkPoAMExSDWxn4Zd2vSfi3kzoz2/ClKU3q6aErlyCrI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:f11:b0:5db:28ef:3dfb with SMTP id
 ada2fe7eead31-5ddb229b50dmr897200137.34.1762505297024; Fri, 07 Nov 2025
 00:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20251106212342.2771579-1-niklas.soderlund+renesas@ragnatech.se>
 <20251106212342.2771579-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106212342.2771579-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:48:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGGw9VN3=zJ4FYzAeYSOrOGoSOzDUMTkNF5GF8C=XVAQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnj_wKfSmmHTUuO5_DYWTiuoJbMwmZEgTT9nGkrPatgnEe5zw26ykSXS40
Message-ID: <CAMuHMdVGGw9VN3=zJ4FYzAeYSOrOGoSOzDUMTkNF5GF8C=XVAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
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

On Thu, 6 Nov 2025 at 22:24, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> * Changes since v1
> - Rename node gpu from gsx.
> - Fix sort order (by unit address) in DTS file.

Thanks, will queue in renesas-devel for v6.19.

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
