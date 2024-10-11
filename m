Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572C2999DB6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD54410EA5D;
	Fri, 11 Oct 2024 07:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MezPVHEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA4E10EA66
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:18:48 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-71e0c3e85c5so1502972b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728631128; x=1729235928;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqeSOp6U1ubWdAbk9muDn1+4rdKST6F5CQZPcgI8Das=;
 b=MezPVHEh3aY88ZckkGr3LcCscTw1PLEFe5dIOYUUiZ+wwAPnMvjVl6hvr3phGlRCPu
 DvsJ6WvYR7WELxF6W51UyxG4fugCZTNISmIMSguBYZ3uKTrq3iuprBogHmHoakPpXJfJ
 UpZ+L2XfUjKoDn/hNAfsfZvEIh1woHqd4DstqQkDjc3Uh4SMIZKxCYmn9fcxa/i1s0O2
 +d7Rs+eiBTujDgb8w1qcxjBriqnaCJOn67fXfhCJfFn/vLcM17gVjBIOxoJf4KSIR0Wx
 6kPrPLl8W8HPgJ4zbFsycBwcrbBalhT2RYen5SAm6WryUJuTD7PQ9KXZxgHKX8Daa257
 BJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728631128; x=1729235928;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NqeSOp6U1ubWdAbk9muDn1+4rdKST6F5CQZPcgI8Das=;
 b=mXmDk4IhMM2PcxCc69M9HfUapdN0halrlZKyptCHIhZl5RzIz0f6gnKotRPEJt5/fc
 AJzHSEKlCy8c0T6nxM5wL2LzOLATeUrw2JdbOUmG2zbg4sr7D5jfO7aSS8Wqwm9P53MD
 pI25YzVLf2w7WSlHQQRTUzVMORARW8NvKa0anXPy+MWsA+ZzEhZGQjVX5LyZf1fWaaBl
 pO5p7afnN+YLsA+vuzPw6ZO5OmYOGBRN/unj2A34vdwNdzvrdC/ZZSGAXNsERcSy+JRp
 9zF24LetJyogGCSl+BpGvdZcTNduKqo1o0ubpiCyVaEyFvgPvTiSS7ltYbH/76p6goPU
 HENQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOf3oUTllI1ITrqAnrC+q3R5B2YrIgI4rgGyL7+lToRlmmHE/uhJBkJjA275ihnoHQomRQA8e7GIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL6s/buprZrGjWygsXHilT9IE4fZis04NTjMbiD+U/5gVZJuri
 vrPhXGQ8J5Yvbeui41ZLLr/LBvxT/kuGc/GW4uczcICYXgVpx6/jWVW9VjiPYiBM6n+x1R2rW3m
 MNod5ubYcg9keE8m7J8x8JzlDlidH43j71udbJg==
X-Google-Smtp-Source: AGHT+IE/aLEcA9c1ck8SdATXXYWWtkP2N4A4yV5C1J0Qjm4MBU//5axfgShXiyi4jwZ2Z7IA+xzupEWqrWv8mYxT6Ls=
X-Received: by 2002:a05:6a00:3ccc:b0:71e:f57:f2e3 with SMTP id
 d2e1a72fcca58-71e37e4c7f7mr2612179b3a.5.1728631127797; Fri, 11 Oct 2024
 00:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241011020819.1254157-1-yangcong5@huaqin.corp-partner.google.com>
 <CACRpkdZR0UxF69rcuSpcfYR69FC-rGOakeOiUUbzJH6BWGVh=Q@mail.gmail.com>
In-Reply-To: <CACRpkdZR0UxF69rcuSpcfYR69FC-rGOakeOiUUbzJH6BWGVh=Q@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Fri, 11 Oct 2024 15:18:36 +0800
Message-ID: <CAHwB_NJJrXQ6aLTO2_eHx5qmEQB9ME5icZUiZmeLQmX6rR-L8A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83102: Adjust power and gamma to
 optimize brightness
To: Linus Walleij <linus.walleij@linaro.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, dianders@chromium.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi,

Linus Walleij <linus.walleij@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=9C=881=
1=E6=97=A5=E5=91=A8=E4=BA=94 15:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Oct 11, 2024 at 4:08=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
>
> > The current panel brightness is only 360 nit. Adjust the power and gamm=
a to
> > optimize the panel brightness. The brightness after adjustment is 390 n=
it.
> >
> > Fixes: 3179338750d8 ("drm/panel: Support for IVO t109nw41 MIPI-DSI pane=
l")
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> If you look in panel-samsung-s6e63m0.c you can see how that driver actual=
ly
> uses a set of gamma+power (ACL) settings to regulate the "backlight",
> i.e. the brightness of the OLED display. You might want to implement
> something similar in your driver to actually provide the user with a
> brightness setting.
>
> It's a bit unfortunate that this is for historical reasons called "backli=
ght"
> but the usecase is definitely the same.

Thank you for your suggestion. As far as I know, there are some differences
between OLED panel and our current panel. OLED emits light through the
panel itself.
while the panel we are using now actually drives the LED lights in the
panel through PWM
control of the driver IC.

Usually the brightness is controlled by PWM and exposed to the user space.
Modifying gama here is more about optimizing the gama curve to further impr=
ove
the contrast, brightness and detail presentation.

>
> Yours,
> Linus Walleij
