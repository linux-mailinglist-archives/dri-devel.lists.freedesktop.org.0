Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5588B1E8DE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4948210E92A;
	Fri,  8 Aug 2025 13:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=braiins.cz header.i=@braiins.cz header.b="EDOVY3nQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60E410E92A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 13:03:47 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-72c47631b4cso1459174a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braiins.cz; s=google; t=1754658227; x=1755263027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gJQ66qOgvXI5E58tCgDsFvkP4zxbUmcjup2XcvOA/I=;
 b=EDOVY3nQLeC0pOLMDmSapozuA35om++5TUTT0uNiJifDbY74VXzKo4UX4f5mAn+2Ec
 8htQ8afhSunYU0Jygn/xQJKeNHd3Ryaxa3YPAv4PnmYPUp8YhmGc6R6wrx4j6qG9COgt
 YSHw56HalJLY99xB5Sx9j1Ypx/nGopeP+nHooCVGlnk5FD/m4PRbjhCyHBUaheBgqRNO
 xgdMfjYfGzt/glsYIMi6LQzdwXPlqvZw26csBXgGToOonVyPTjHanFmujTeEYZ+puySy
 CTGIpof+01DvzMNX2SfB3otuwS+pwUVVEepy36I+adfoYsNWxf+PPqXErTW2TqxUDtNb
 v68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754658227; x=1755263027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1gJQ66qOgvXI5E58tCgDsFvkP4zxbUmcjup2XcvOA/I=;
 b=hUsLCBAlM+xLzo/9dUCEZUCXe8lTI5Ne1i9y6Z5Qrz4hSZIAKWAUQqiSKhxaHA2K7C
 1olaUy3Pu03fWYkKQBuA8dj1xXj6RNc1Pdt9E06MHT/62tobma38nSwBnMwaXm8Bhznv
 RtX1dNZPhH+68l1IRd+kK7cd8lXYXzspsQ/e3+7odfgElpTVmto8y8BK7m5VjLfRq5GU
 nztM0nrCEgWTD/wXJpPTBsSHc5vVKAutcCSJuCnga5OfVOCCecHLHNFPWSPTIH56sNM+
 zhYS/ukG64bqe8/4w+FyY14m3jS7eM9GIr4wGZTWTtAFr5dNhm2d22d/mtjQgZ+VNJax
 N7QQ==
X-Gm-Message-State: AOJu0Yxw6TGAPTjsinFqPXVoKvo3sYcSsz3zGcO3/WrIv4lxMqeqgiDl
 frrGJICY6GJa67FgNggnhr1RxWmH7m1mGAE5HcVJaf58Ssm3I63btI9TwY8A3oy5NTlBz9aFUd3
 FZBbUIypNfpYpTXTeeYGY5BcUsINwHfcb0o/syS6HtQ==
X-Gm-Gg: ASbGncuM6s1iYQ7aQAQS4OvDi4oqMvwRCFMs1FcUsAY/EkE2Smi7UmmmWaQ3owPRu2b
 LIsgu/hvyNQnns0d5nm0E8EwopYd4F9t0qtvmVRATmZ3+v09gOFhRcUd2QHziR4JarCaOnYSDYl
 6gRgZY/G1ouaGlskqZHGv6RQIfh4e9Da3LCqn3y8frDWqVebKZFiQn6o+xtxWUcz0n74jzULMcs
 zchdFuoF7fWwn5W3XHjIW/D41QOAJSWaQe4hpCr
X-Google-Smtp-Source: AGHT+IEyPTW3KaL5C5MbxPV/DvPs/rbWjl8QRr3B5dDiyWziw2HAQV4wh/QlHPh0Yb4Buw7wmgl4YmIMxeJ3ieEmXZA=
X-Received: by 2002:a05:6830:4d84:20b0:741:bf2f:ee88 with SMTP id
 46e09a7af769-7432c85d5dfmr1068687a34.24.1754658226596; Fri, 08 Aug 2025
 06:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <CACnTymakHbAH1eSP8y99_yOp08R4mV=M922ym9YGdT-V-xdKfQ@mail.gmail.com>
 <127b677c-505b-43b8-a05e-58e13592e5cb@tronnes.org>
In-Reply-To: <127b677c-505b-43b8-a05e-58e13592e5cb@tronnes.org>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Date: Fri, 8 Aug 2025 15:03:35 +0200
X-Gm-Features: Ac12FXwgQbUL15qlHvLS1mky8tsLls2D2mb_YCxZ6d3X38anhhHiNrHev1wRg_Q
Message-ID: <CACnTymaNYdeNUE4Gf+zJ96B6pY5iNke0EtwLVjQmKTAW9nxVkw@mail.gmail.com>
Subject: Re: GPU acceleration with SPI displays (TinyDRM)
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org, Alex Lanzano <lanzano.alex@gmail.com>, 
 Lucas Stach <l.stach@pengutronix.de>
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

Hello Noralf,
thank you for your reply and for the debugging info.

Meanwhile I got reply from Lucas,
and figured out that on the display with 320x480 and 16bpp:
with 32MHz the theoretical maximum is 32000000 / (320*480*16) =3D 13 fps
and kmscube renders at 11 fps.

With 50MHZ it is 50000000 / (320*480*16) =3D 20.3 fps, and I kmscube
rederns at 17 fps.

I did not know that the rendering frame-rate is limited by the screen
refresh rate,
because when I tried to run some EGL demo in Weston, it renders around 60 f=
ps,
but my understanding is that the Weston output itself gets limited in this =
case.

Best regards
Josef

On Wed, Aug 6, 2025 at 11:15=E2=80=AFPM Noralf Tr=C3=B8nnes <noralf@tronnes=
.org> wrote:
>
> Hi,
>
> At what speed are you running the SPI bus?
>
> Theoretical fps for a 176x220 RGB565 display at 32MHZ:
> 32*1024*1024/176/220/16 =3D 54fps
>
> Try modetest to see max fps:
> https://github.com/notro/panel-mipi-dbi/wiki/Debugging#modetest
>
> I don't remember the command line switch to have it run continously
> showing the fps.
>
> Noralf.
>
>
> Den 04.08.2025 09:54, skrev Josef Lu=C5=A1tick=C3=BD:
> > Hello,
> > is it possible to use GPU acceleration with TinyDRM drivers?
> > I am testing on STM32MP157c SoC with Vivante GC400 GPU and I use
> > Mesa3D 24.0.9 (rootfs generated with Buildroot 2025.02.3) and kernel
> > 5.10.176.
> >
> > To compare, I also have the same system but with a MIPI DSI display.
> > While kmscube renders at 60 fps with the MIPI DSI display, I get only
> > 11 fps with the SPI display (TinyDRM driver).
> >
> > Is there some architectural limitation, either in Mesa, kernel, or HW-r=
elated?
> > I suppose both setups use kernel's KMS as renderer only (kmsro), thus
> > it should render at the same framerate into framebuffer.
> > The difference in HW is the peripheral the displays use - MIPI DSI
> > display utilizes LTDC peripheral (kmscube loads
> > /usr/lib/dri/stm_dri.so) vs. SPI display uses just SPI (ksmcube loads
> > /usr/lib/dri/ili9225_dri.so). Both .so files are hard links.
> > Both open /dev/dri/renderD128 (GPU).
> >
> > The MIPI DSI display is connected to the DSI Host peripheral which
> > just transcodes the parallel RGB pixel stream from the LTDC (LCD
> > Timing Display Controller) peripheral of the STM SoC.
> > The display driver is drivers/gpu/drm/panel/panel-sitronix-st7703.c (DR=
M panel).
> >
> > The SPI display driver uses the kernel's TinyDRM API and its driver is
> > drivers/gpu/drm/tiny/ili9225.c , but I can change to any other driver
> > if needed (eventually to the generic panel-mipi-dbi-spi).
> > Could rewriting the TinyDRM driver to a panel driver in
> > drivers/gpu/drm/panel/ help?
> >
> > I also tried software rendering "softpipe" (disabled GPU in
> > device-tree) and it renders 7 fps on both systems. Thus, I suppose,
> > that some form of GPU acceleration is already used.
> >
> > Mesa reports the same loaded GL-extensions on both systems and apart
> > from loaded .so files everything seems to be the same.
> >
> > Best regards
> > Josef Lusticky
