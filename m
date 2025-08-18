Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F2BB29883
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 06:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E473910E18C;
	Mon, 18 Aug 2025 04:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SYeiqha8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC95D10E18C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 04:42:33 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-74381f217e7so2603920a34.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 21:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755492152; x=1756096952;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfsQWtM9zlBkMaLNEqnp5wSBhlrCP40LK6Q9xsKtZy4=;
 b=SYeiqha8ef/aOs497xT5C1cZJRTk/4zYzZaD2RCM8XJo1waAlISimhYUH3O/AHnzCc
 z6Lbwgw7plY6QPTqJtrDLaoYGARc/dWEgkNhPD1ivYdfGwQcZfOM8vnhpz8ec2flTT4Q
 PJH9wupFTTWYe0n65mZVSg/tP7wJ0kecKFPZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755492152; x=1756096952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfsQWtM9zlBkMaLNEqnp5wSBhlrCP40LK6Q9xsKtZy4=;
 b=ZLjYdMvqlzgXsWUos92687faaBDNcrFocY+4MhudRJXWgHsD31SLzHeGDL7C+g8v7o
 NSHFJv1iq/rAHXwkB11TvEjkZo3eANnhlSeKh3id0yJ3bufCLP/LGxQXlh0P6ro/fh1X
 h+8HO+S3uJYZ4ZjqOH3u9YQTs5WVkFwbvGPbSw7JOcRwrz31x5sAQrBHxHCIIIFc/rA9
 Tu23ygzzra0Et44z1zD2wGxvu/Gli8dcupBSlU1V+nvkb++KiyDESVtUb/QVvj4khZsA
 7LsIxmZpGjS7isz3vba3Zt/7dB7CI8e+0yyq7Q3qhWwlLPp7SHmPHpzK/ZAyj5N9hK4g
 XNLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY5WsHpuvB8aUEbUUVRf3FLs5tfljkQtiTgki3c78/N7zxk2S64bBJLWJSeXVTHFHUJckFSXayLLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykTogitI1AccukmY2WoTB3pweV3J+1NgKkNRDhlWhJVJW+xSdE
 5HBggFhNCzUPkPI7/WZ60ep3rY03w93PMl35UDIR4qEz/imTLr/7m/2uTbvMDBnihNnOD1Z2FVQ
 R4E8qdrK5r2fy1r+ODkxsfZTLjwD/9UsTP5cCAnrF
X-Gm-Gg: ASbGncvc1N7yKq1jhYB3B7QWPdh5RCMorwNHiM7LsJl1DvLrS4STOp/GDpCXvw60Z5/
 Xl83sHt4oPXs7vx9b9NqDYXnuBS2MYWCL9cf/46stsq0ZMMzJmrsTBtqbAuU3Zg84JFYdWLbLm0
 zmc99k5dskbI6+6w3IDJ+08dsqpaGU/RSJzRmFHDYHTu7mwFqoPlmiSqWaBrIPr4eZ9GaYeGFSq
 pF+N5v0LlV8kqN+Wkh63g9KxgJ8ClAzAVc=
X-Google-Smtp-Source: AGHT+IF/RhLz2fIw1VbTnK6kOfNHtaBYI/Gt5l9e8XL0REmA8tvh4RTpWjRQOCaWMMFqwIexvepYVZNLyvLCWG85f6w=
X-Received: by 2002:a05:6830:3148:b0:727:3439:5bdf with SMTP id
 46e09a7af769-7439bab7241mr4262682a34.13.1755492152672; Sun, 17 Aug 2025
 21:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <c8a64686-f1a2-44f1-9d13-fd5b4f923e0f@molgen.mpg.de>
 <CAAOTY_8vLqU30L3+ijYJPLrioRsUwVwJAeumtVYfRJ9e5tjp4A@mail.gmail.com>
In-Reply-To: <CAAOTY_8vLqU30L3+ijYJPLrioRsUwVwJAeumtVYfRJ9e5tjp4A@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 18 Aug 2025 12:42:21 +0800
X-Gm-Features: Ac12FXz5rMxf27QySQIDZc7iDa9NZ942iMQjso7rsmfG9duoC6kvEJjFLzERuyU
Message-ID: <CAEXTbpd=-mB-n1EVb4Y7RDxkJ86b-HrFWyErgTE_FYoViZRdpw@mail.gmail.com>
Subject: Re: MT8183: Only maximum resolution 1280x720?
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
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

Hi CK and Paul,

On Mon, Aug 18, 2025 at 12:39=E2=80=AFPM Chun-Kuang Hu <chunkuang.hu@kernel=
.org> wrote:
>
> Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2025=E5=B9=B45=E6=9C=8825=
=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=882:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > Dear Linux folks,
> >
> >
> > On the older MT8183 device Lenovo IdeaPad Duet Chromebook, running
> > ChromeOS with their Linux 5.10.x, connecting a 1920x1080 Dell monitor t=
o
> > a USB-C adapter using HDMI, only the resolution of 1280x720 is
> > configured, although the adapter also support 1920x1080. It happens wit=
h
> > all adapters, for example, LMP USB-C mini Dock [1].
> >
> > I reported it to the Chromium OS issue tracker [1], and the last commen=
t is:
> >
> > > It seems the display pipeline for the internal display (DSI) has
> > > higher clock rate. Also, the resolution support depends on the
> > > refresh rate as well, so the claimed 2400x1080 might only work on
> > > lower refresh rate.
> > >
> > > For the external display, the display modes are mostly rejected by
> > > the pre-defined max_clock_khz in mtk_dpi.c:
> > > https://elixir.bootlin.com/linux/v6.11.4/source/drivers/gpu/drm/media=
tek/mtk_dpi.c#L940
> >
> > Can you confirm this? The font rendering seems not so good in the lower
> > resolution, and strangely, playing movies these seem to be rendered in
> > higher resolution (or the monitor or hardware does a good job in
> > up-scaling).
>
> 8183 max_clock_khz is defined in patch [3] by Rex, but this is a
> prepare patch for mt8192 [4].
> I'm not sure that Rex has test it for mt8183.
> Maybe you could try to enlarge 8183 max_clock_khz and see.

I found the internal discussion about this (back in 2018), and the
owner had confirmed MT8183 DPI only supports up to 100Mhz. They also
clearly stated that 1080p@60 is not supported by MT8183.
>
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/drivers/gpu/drm/mediatek/mtk_dpi.c?h=3Dv6.17-rc1&id=3D44b07120291c4b7a=
6722ccb7149f6b9d938cf5a2
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/drivers/gpu/drm/mediatek/mtk_dpi.c?h=3Dv6.17-rc1&id=3D38eaef2dca4ec8df=
b9ea84d9dde0f76da5c8caaa
>
> Regards,
> CK
>
> >
> >
> > Kind regards,
> >
> > Paul
> >
> >
> > [1]: https://lmp-adapter.com/product/lmp-usb-c-mini-dock/
> > [2]: https://issuetracker.google.com/issues/295666708

Regards,
Pin-yen
