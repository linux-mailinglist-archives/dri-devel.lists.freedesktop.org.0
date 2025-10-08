Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CCCBC3646
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 07:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554D10E757;
	Wed,  8 Oct 2025 05:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JBWfZwD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4106810E1A7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 05:45:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so76697025e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 22:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759902307; x=1760507107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMrA9ECVAZwUgiOwDSSBvdQk3vkFdAvd5oJUQqsaClA=;
 b=JBWfZwD3WZFHZPF0pl25SwbUqBwriCCAZ4LRxFwsKtSG71C1A7e99ewQJVj94zM0gh
 NiUrrqg7VAeoD+AcNyZ/mK8OEd7qiI1zPNbWHSbjuZF1zztLuwc5sDCemQrGN5M4Mx/O
 tcrXOVgJezXC0mgKVhbiGP/Nk/Piv9Z7tk4yckpk4Zn8PH7zC/buXy26qcL7POmPXfT9
 qjuOLFJGgNg1GKT69OQn0ttV+2LsPc9MDQXAMCRI5aenuoj5eJ+WzHb+ig5bdnwXgJ+9
 q1/4lAl2WzbCDpof7F3l46Y5Yp8jnU70RMKZ32tgld1Igo2dFoeiOyzDMzbkeAwVe/J3
 T5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759902307; x=1760507107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMrA9ECVAZwUgiOwDSSBvdQk3vkFdAvd5oJUQqsaClA=;
 b=LTMcepnQ05LBSpCZY3/qz6HrcKfE9wkB4QaEjtBwarT/YSzZdyd1jzL94Op0RiyKFz
 r+NTRnvhH06/jdtN4VgTz5ahSfIhvLgo6JycXg2FmiR/1FcI3Ck5Z47g4q58ukiCLvFb
 iio8IPWOePq5ZVM6nlzciSPhhmuRS8KTE/9KqryI8/xdKakkP/XT5VXwu2s0av2Xrsc6
 OC7yLwrnVlzJvbodD5n82ciJ9mArejNHR1Y8IOfsHF27yj/793p9ZvnMc4os+06SzQdE
 VjXuNtPu1L69tHTWEWKgWsDiXOU/dBiPmaZ4t8jCpjtdwWAbf3D0pmYn8Vyml4noxqIL
 xxvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJh1H2LWV7sRDlwFbmsw8ktFtj8VFNDLWOaqWYrT8JeHg61jq++uHL6KdT1IprAyDWxyaxRDX8i7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcHw4xUuWndyfzJ5X+S7AzAQ/PY9TYj/xHMe3uH+V2nbSKtWFc
 9YPvOf6TKWjcXNzmmrDIrvkhvRQUBE4z2QsVgP2W6+m2LJZRwMsmrUqPU0F8M4uuW/PwDdaqgJ4
 t+EJzJ1JeUkR8nQnox1lCAtiyL3TYBvU=
X-Gm-Gg: ASbGncv5U2FKsNTQFMW1kPQS44aqAs3K2hFjT0u/T9+vXPSSjEpeTa1GVMlLgka3+CS
 yFqKU0OueAYPpaLSxUBQSBgBKJlr3DvT08uuPrTOEqs0B7epuZfMVi/LrTL7sV29We9ifEi2xUg
 lH67kfCkX83dFUUMvKypi5BMfiG7hhZemAdMOmDJ/cW5iaYGqV1SnZ71wpdrnM37WfiedbtOHkc
 yyKR9Axg/gl3mPs0d/X4iUoeaYlRATSjhnqVZmH/Pw=
X-Google-Smtp-Source: AGHT+IGztvS3EO/cNIRYVGvR4DZ8zwLuITrFfy/EcAWJFbzbd68GMfyHQ8W0cNkfgVipNkMiDx6l2VYQHC3kXlqK76Q=
X-Received: by 2002:a05:600c:34cc:b0:46e:3550:9390 with SMTP id
 5b1f17b1804b1-46fa9af18ffmr13448945e9.20.1759902306398; Tue, 07 Oct 2025
 22:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com>
 <3665995.U7HbjWM52l@senjougahara>
 <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com>
 <3862885.G96rZvMJ2N@senjougahara>
 <CAPVz0n2shn41h4z4PoMdtCXzj+96ak69TCqt7Ag5qpqdWi6UWA@mail.gmail.com>
 <DDBGU9ELXIAW.1RLHSNOPVR9B3@bootlin.com>
 <CAPVz0n3EB-tw0af+O4acmbvXNHkH62t5v3r3O0nedLs_XJ39PA@mail.gmail.com>
 <DDCCDQMTQG55.1K25Y3U0JE15Q@bootlin.com>
In-Reply-To: <DDCCDQMTQG55.1K25Y3U0JE15Q@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 8 Oct 2025 08:44:54 +0300
X-Gm-Features: AS18NWDLUfrT6G2ttxsWBntZhVB5Szu88XFWQNFiBezo9FYR32OuHM_dRjRAWzM
Message-ID: <CAPVz0n2y230JejNiTk3yT_6voauX1REu=fx21pFbsBByo=X2aA@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
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

=D0=B2=D1=82, 7 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 22:37=
 Luca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Tue Oct 7, 2025 at 6:02 PM CEST, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 2=
1:55 Luca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> Hello Svyatoslav,
> >>
> >> On Thu Oct 2, 2025 at 8:20 AM CEST, Svyatoslav Ryhel wrote:
> >> >> > > > 12 represents amount of bits used per pixel, 8 for Y plane, 2=
 for U
> >> >> > > > plane and 2 for V plane, total is 12. "but explainable with a=
 comment
> >> >> > > > and improve-able later" why then we cannot use 12 with a comm=
ent? this
> >> >> > > > is all arbitrary. Downstream is not wrong from this perspecti=
ve, you
> >> >> > > > don't take into account that YUV420 is planar and it uses 3 p=
lanes a
> >> >> > > > whole Y plane and 1/4 of U and V which in total results in wi=
gth + 2 *
> >> >> > > > 1/4 width which is width * 3/2
> >> >> > >
> >> >> > > Yes -- but AIUI, the only thing the bpp value is used for the b=
ytesperline calculation. When we add the special case for planar formats, w=
hich doesn't use the bpp value, then the value 12 is never used anywhere. W=
e should at least have a comment saying it is unused. (At that point, we co=
uld just hardcode the bpp values in the fmt_align function -- but I don't m=
ind either way.)
> >> >> > >
> >> >> > https://ffmpeg.org/pipermail/ffmpeg-user/2023-June/056488.html
> >> >>
> >> >> I understand very well that for YUV420, each pixel has 12 bits of c=
olor information. But how many bits of color information each pixel has is =
not useful in the context of this driver. The number of bytes per line is n=
ot related to how many bits of color information each pixel has for planar =
formats.
> >> >
> >> > No, it has direct impact. This is how buffer size / image size is
> >> > calculated since we place each plane consecutive. And bytes per line
> >> > is used specifically in image size calculation. This is common part
> >> > with non-planar formats. Then since Tegra provides a dedicated
> >> > channels/buffers for each plane, configuration of planar format
> >> > includes an additional step with calculation for each plane.
> >>
> >> Sorry, I haven't followed the discussion in detail, but I tested you s=
eries
> >> on Tegra20 VIP and capture does not work, with a SIGSEGV in
> >> gstreamer. Bisecting pointed to this as the first commit where the iss=
ue
> >> happens.
> >>
> >> I compared the input and output values of tegra20_fmt_align() at this
> >> commit and at the previous one, and this is the result:
> >>
> >>                        before this patch     with this patch
> >>   At function entry:
> >>   bpp                        1                     12
> >>   pix->width                 640                   640
> >>   pix->height                480                   480
> >>
> >>   On return:
> >>   pix->bytesperline          640                   960
> >>   pix->sizeimage             460800                460800
> >>
> >> I hope these info will help.
> >
> > Which command did you use? I have tested with ffmpeg and
> > yuv422/yuv420p and it worked perfectly fine.
>
> I have a simple testing script that runs these commands, with
> VNODE=3D"/dev/video0":
>
> v4l2-ctl -d ${VNODE} --set-ctrl horizontal_flip=3D1 --set-ctrl vertical_f=
lip=3D1
>
> gst-launch-1.0 -ve v4l2src device=3D${VNODE} num-buffers=3D500 \
>   ! video/x-raw,width=3D640,height=3D480,framerate=3D50/1,format=3DI420 \
>   ! videorate drop-only=3Dtrue skip-to-first=3Dtrue \
>   ! video/x-raw,framerate=3D50/4 \
>   ! queue \
>   ! avenc_mpeg4 \
>   ! mp4mux \
>   ! filesink location=3D/tmp/grab.mp4
>
> Luca

I can reproduce what you are observing. ok, I will drop this commit.

> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
