Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C3BE3EA8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 16:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16B410E06D;
	Thu, 16 Oct 2025 14:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AF310E06D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:32:16 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-54aa0792200so557756e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 07:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760625135; x=1761229935;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7OKo+B/N8OpvVSgOheqCo9k1dnTlp+LYue6K4y6i8Mc=;
 b=DU6AuMWWpt+qaqu6uwbEb4NtzcTRJmHonOc16NUsIhWHOqYAhjiN+uyoKcDgECjuv+
 VY3q4mw6Ex75Dzo6bkmJwgeVwjUiJyBtUE4aCEvh7c/925a7+UQDxwNY+CaO8108cVG4
 tXGXjBbQIOnL1IDKXrLZJlBBCvBvEe+NDvkYIt/MzHhK8H/WP+St3PKKy0Nhn5G7dalI
 llEmD8+wkNykMg/PUwFWPU3g8d92RajW7N4HAr5NpkSxbssmZV/4GPnCLUbQy2vJnCOM
 op29ScXCt7li1cMjKfiAOZ5qYV+Mg8wL/DuUl1mFr3tIujW6KgPfHuFFRpJXlWKUX3zY
 Hcqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVciNdt2CllIQrxPZatb2795vMMv47kGERG/hmRK+G6+4iP7EmDArmJrJ+CapwyFRNdT/B3/xuz52I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK4UVJeuW5QGrBrRrU0OVPVin9E9X+3Wo7V1RV1TpJxNngFbbk
 JPaksuD5Puc26bkR3r9G0JypeNWPNYNE3eiRp8iEiII690tU8UDd53sU6Yi7cUQE
X-Gm-Gg: ASbGncsOVl1FkvUn3Ds5+Dyg31Jfu0cdlQFTLVw46LDEbhURdhZqa9YrMx1WRPIlj6+
 Bod7DPJvcfbewEyIsnPzAfWKpFNF0/u8OIDXZF946E6FSJtbqBdWuhqVQ3Xgz0tPA/xq7T6TBG8
 o+CFBh7NnBblKxY9rdG59vWyasOmHCXVxf4KmFOcUb43bDPO1W8NmX2Cxq2TrSa2qyg4E41eCpl
 4NWqZ7vFBdM0JliLSc1sVXo68DdewGR8++YTH31XZoP09A0QkBsZqVrBI2l++FtJgBRewSPPRPu
 HD2PZOSR325utwCj53/R5uwX4D6PvPQNrhSRWeBAGclwgoMm7HCSUfLrIHIu3BldKuxIWOaCzun
 4shsKrtUhKwCbhQMFG+W+E3TEND9enZWxUXLDYtDVeof3jBX/HtiOUWaEKne5sq4rZSmi/8LdZW
 wBNk+m6KxGC9WFlEchq3QuSfHU/vfPIM+DmRM0uX3uzGtT66x8
X-Google-Smtp-Source: AGHT+IE6hN/KGPoUyINx9P6//IkZEB9otPJk9uXDb0tZb78BJdrvteJC8rkYfZv2J20pjVnjKxu5uw==
X-Received: by 2002:a05:6122:1789:b0:54a:a251:ad48 with SMTP id
 71dfb90a1353d-5564ee90c0fmr241672e0c.7.1760625134793; 
 Thu, 16 Oct 2025 07:32:14 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55634adad1asm1717182e0c.6.2025.10.16.07.32.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 07:32:13 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-5d3fb34ba53so637603137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 07:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWlxPjZc9CdfpH48xkZlBFEXCa725CblVZBMzIYvUkQXWCVY5D4u7tYHxCLNLIVLsaZ2/yqoTn6Xag=@lists.freedesktop.org
X-Received: by 2002:a05:6102:54aa:b0:5a1:3bcf:a93f with SMTP id
 ada2fe7eead31-5d7dd555922mr220616137.4.1760625133095; Thu, 16 Oct 2025
 07:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
 <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
 <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
 <6f29d7af-a2e5-4412-9575-6368621c1178@mailbox.org>
In-Reply-To: <6f29d7af-a2e5-4412-9575-6368621c1178@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 16:32:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9xSeFtLB-jUSUnJb1JHxYDXLe91GhZbT7QVGzYCXkRw@mail.gmail.com>
X-Gm-Features: AS18NWBZ0iJCimoz06t01ILJ3nlCiaOTwnBjpX9tKhkz8DwVN2SfgQuIjQCiZ2I
Message-ID: <CAMuHMdU9xSeFtLB-jUSUnJb1JHxYDXLe91GhZbT7QVGzYCXkRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

Hi Marek,

On Thu, 16 Oct 2025 at 16:13, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/25 12:14 PM, Geert Uytterhoeven wrote:
> >> which are also never disabled, do we want to disable the GPU by default
> >> and enable per-board ?
> >
> > Yes please. We do the same with renesas,*-mali GPU nodes.
> > The board may not even have graphical output.
> > Or do you envision using the GPU for more general and headless operation?
>
> The GPU does have GP-GPU compute shader, so even headless system can do
> compute on the GPU.

How is this handled on other SoCs?

> >> I would argue the GPU should be enabled by default, so the GPU driver
> >> can do a proper power management of the GPU. If firmware is missing, at
> >> least power it off on failed probe, if nothing else.
> >
> > The *_PD_3DG_* domains are powered down anyway when unused.
>
> If the driver was bound to the GPU node, then the domain would be surely
> powered down in control of the Linux kernel driver, without depending on
> the prior stage to leave it powered down.
>
> I think it is in fact better to bind the GPU driver to the GPU IP and
> let the GPU driver power manage the GPU in a well defined manner,
> instead of depending on the prior stage to leave the GPU in some
> specific state ?

The domains are powered down by the rcar-sysc PM Domain driver,
hence the system does not rely on any prior stage taking care of that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
