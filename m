Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873B8270B4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 15:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D652310E251;
	Mon,  8 Jan 2024 14:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443B410E251
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 14:08:34 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dbd029beef4so2051134276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 06:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704722913; x=1705327713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdHl7md1Zkmv60g30fUAOV7PYkRMYcjuuSdDFpSytAY=;
 b=LkUfLraUCE39626qqtNQCMctLaDObSUKawwNEzi+DpoSn6FfAhEj9JEhWTI6bJIlsN
 RKJVgZDNHwMFY7kM30YLW4F2oBTfdjgzp4hqRMXDQDP0zGvBQW3bdsbxHq4gh9XoBdZF
 tqNW415Mrc/H+fwwys9FRd2ozsgf0T0UB2zquxj8IWrx9CIWOUm6vDqLhxF1J32CuSVh
 0R8TekVw0qNMWnxSq3+aI1w1bd0S1AlsfZh8YhrY0ygwhOl71xuCbSFGE0+hMTQTTklE
 zNafKHNhCq+mWeOhNWKUrx665BCfJ7iAOdjYsSFNHgtd15EoivWB4tJDo4YEPFLdjIR9
 UkSg==
X-Gm-Message-State: AOJu0YzyaWGvsnC0HwsYLVVgxcxhI3Caulo6w1WDcY2MOoy8NLVq5VAn
 yLJyZLK+2xiEzXEP2d18dc9wARMbht/bLQ==
X-Google-Smtp-Source: AGHT+IEw0HveO38E+JhoBXGvkm/3/gd08UieM0p8czYfUNeGps/CsJfLyfIiHELaDVe5/vPJBq9kug==
X-Received: by 2002:a25:73cd:0:b0:dbd:5bb6:ff49 with SMTP id
 o196-20020a2573cd000000b00dbd5bb6ff49mr4400029ybc.61.1704722912940; 
 Mon, 08 Jan 2024 06:08:32 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 c5-20020a25f305000000b00dbcb76343a1sm2124099ybs.25.2024.01.08.06.08.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 06:08:32 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5e784ce9bb8so13430527b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 06:08:32 -0800 (PST)
X-Received: by 2002:a81:570b:0:b0:5f8:fc22:93f5 with SMTP id
 l11-20020a81570b000000b005f8fc2293f5mr128986ywb.26.1704722911972; Mon, 08 Jan
 2024 06:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20240108134102.601-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20240108134102.601-1-lukas.bulwahn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jan 2024 15:08:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXW0bU3KO+-S+jZDGUDkb0Nxg6EQUdc_uKTCs8jj6VOLg@mail.gmail.com>
Message-ID: <CAMuHMdXW0bU3KO+-S+jZDGUDkb0Nxg6EQUdc_uKTCs8jj6VOLg@mail.gmail.com>
Subject: Re: [PATCH] vt: remove superfluous CONFIG_HW_CONSOLE
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 8, 2024 at 2:41=E2=80=AFPM Lukas Bulwahn <lukas.bulwahn@gmail.c=
om> wrote:
> The config HW_CONSOLE is always identical to the config VT and is not
> visible in the kernel's build menuconfig. So, CONFIG_HW_CONSOLE is
> redundant.
>
> Replace all references to CONFIG_HW_CONSOLE with CONFIG_VT and remove
> CONFIG_HW_CONSOLE.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

>  arch/m68k/amiga/config.c        | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
