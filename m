Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA8BC204D
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E5D10E1CE;
	Tue,  7 Oct 2025 16:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mhb5xvGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEDD88A3E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:02:55 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso5632906f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759852974; x=1760457774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n4PmXw+t4eyfqIclsgOdvNmiteqEthYNwo+QzRmYvOU=;
 b=mhb5xvGz0fEUqHC09Phc7ucR+APE4LGVuS53MGF6nBADQO7bDxNLdAANPJZQcOFzpA
 9zYdmg0Ue6g+OBXU1rx1t/DVsKEFt28mahwkq2DGZaV074BoPdH+necgkh9tQKf0JoPp
 OHvxN7F6pWN+0pfrYBmNXwfY97e3q991x4fer1d0gIUFk8mqVDmcmfze3CCHvcw/wkHj
 dffLtV7teCxxE01KfyDh/Iysn27CbTywLia9QTFCTxl+SmSz+z4JXFp1DPCom/4NpiEF
 0hVknb1P+BFHPZFpu9tBkKL9nbgIooHIPGleq5AcmSm1WE2yT0DuuUf1bMP2Nau794Yp
 CqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759852974; x=1760457774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n4PmXw+t4eyfqIclsgOdvNmiteqEthYNwo+QzRmYvOU=;
 b=mxfFVI5EX+hiapQAWkCWGt2s5AiKqYkWma/PtmkfyBOvpOLdqaw7pqlDGmJnCq4W9c
 xmYPQBy+nBYpbpdemRFaQUgBhrs3i67Xne2NQlStu6gsYLB+Hi1x57p9cMfc5qPC9wNB
 +URbOxhWzSoKJqnS/W13G+UySCBKgaLZmbAmFr23DMDn4AQziPig2PdLXY9pIqKCPMzy
 vVpF6yJmK06KbYV3Tuzeu4rAu4mz7KTJqsMbmgz7GyDn6bHtaelqzUWk1uUuEGqms/Zm
 VsTLIYY46HsoDL5LyEjV1yZgCXtRiqXf5KIzEjMvO/gS1rCRWSJGBI4jYrS28+goM6Vx
 JiUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGq9LaEr1IZbO4lqvGFyRPQW3vU+IT8T6m2+DE2xZ5thGL0QunFHTysNQnHrgmzguz420bsHwV2IA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZLtMgFbsmqU35yANXlVacJ/0rXCQldyN9X6n6InEOReLl0l7p
 wJFYPg7G5eVNCupWJv9uHiqJ+mJAiQ2Z6lOc8Pf9bOtyC3QdobGbiPOKrfPRDbsnnUQs4IbEUo0
 OCu/3ADtb3J6Ms2wVRYq0VW17ha50X5I=
X-Gm-Gg: ASbGncuHOe6tYLkG47QwKPSD7AJZdLk7IFIFgLXXFbVBfn0x2BLUWEcyPzOLu1KOsN5
 8T2nUr0xLbgnGeI0d7NwOaFWUD8IN4PWVmTXpcSboTk9jgh8Yks7ZpVXmG8nKHFxdrSC3KzTX+T
 EiZyCeDo7Z+2cinVBg88CVQcKUGExRbqLXolEEMjTqVhzLzWU+LxSQKZjIiTcRQFKZuV5v6VWax
 x7ehPu3JJ+KtTzCbMtTtddA5ZIP82I+
X-Google-Smtp-Source: AGHT+IHPiGma+g9SGHGjEWg4n/9lGyovmyEGrAEuRu7FYqeClC1xj+DQW9WgaUsZaZ919iLvptfJi5Wpw0gBngpF0QA=
X-Received: by 2002:a05:6000:26cc:b0:3ec:d740:a72b with SMTP id
 ffacd0b85a97d-425671bf3e0mr10964826f8f.42.1759852973374; Tue, 07 Oct 2025
 09:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com>
 <3665995.U7HbjWM52l@senjougahara>
 <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com>
 <3862885.G96rZvMJ2N@senjougahara>
 <CAPVz0n2shn41h4z4PoMdtCXzj+96ak69TCqt7Ag5qpqdWi6UWA@mail.gmail.com>
 <DDBGU9ELXIAW.1RLHSNOPVR9B3@bootlin.com>
In-Reply-To: <DDBGU9ELXIAW.1RLHSNOPVR9B3@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 7 Oct 2025 19:02:41 +0300
X-Gm-Features: AS18NWB8Gbllc1ZtoSEL2LuStkUA7Ll89S2q913cljwsgWixJe1BcsNEJhM9egs
Message-ID: <CAPVz0n3EB-tw0af+O4acmbvXNHkH62t5v3r3O0nedLs_XJ39PA@mail.gmail.com>
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

=D0=BF=D0=BD, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 21:55=
 Luca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Thu Oct 2, 2025 at 8:20 AM CEST, Svyatoslav Ryhel wrote:
> >> > > > 12 represents amount of bits used per pixel, 8 for Y plane, 2 fo=
r U
> >> > > > plane and 2 for V plane, total is 12. "but explainable with a co=
mment
> >> > > > and improve-able later" why then we cannot use 12 with a comment=
? this
> >> > > > is all arbitrary. Downstream is not wrong from this perspective,=
 you
> >> > > > don't take into account that YUV420 is planar and it uses 3 plan=
es a
> >> > > > whole Y plane and 1/4 of U and V which in total results in wigth=
 + 2 *
> >> > > > 1/4 width which is width * 3/2
> >> > >
> >> > > Yes -- but AIUI, the only thing the bpp value is used for the byte=
sperline calculation. When we add the special case for planar formats, whic=
h doesn't use the bpp value, then the value 12 is never used anywhere. We s=
hould at least have a comment saying it is unused. (At that point, we could=
 just hardcode the bpp values in the fmt_align function -- but I don't mind=
 either way.)
> >> > >
> >> > https://ffmpeg.org/pipermail/ffmpeg-user/2023-June/056488.html
> >>
> >> I understand very well that for YUV420, each pixel has 12 bits of colo=
r information. But how many bits of color information each pixel has is not=
 useful in the context of this driver. The number of bytes per line is not =
related to how many bits of color information each pixel has for planar for=
mats.
> >
> > No, it has direct impact. This is how buffer size / image size is
> > calculated since we place each plane consecutive. And bytes per line
> > is used specifically in image size calculation. This is common part
> > with non-planar formats. Then since Tegra provides a dedicated
> > channels/buffers for each plane, configuration of planar format
> > includes an additional step with calculation for each plane.
>
> Sorry, I haven't followed the discussion in detail, but I tested you seri=
es
> on Tegra20 VIP and capture does not work, with a SIGSEGV in
> gstreamer. Bisecting pointed to this as the first commit where the issue
> happens.
>
> I compared the input and output values of tegra20_fmt_align() at this
> commit and at the previous one, and this is the result:
>
>                        before this patch     with this patch
>   At function entry:
>   bpp                        1                     12
>   pix->width                 640                   640
>   pix->height                480                   480
>
>   On return:
>   pix->bytesperline          640                   960
>   pix->sizeimage             460800                460800
>
> I hope these info will help.

Which command did you use? I have tested with ffmpeg and
yuv422/yuv420p and it worked perfectly fine.

> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
