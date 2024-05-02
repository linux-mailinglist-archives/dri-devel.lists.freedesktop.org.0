Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FE8B949D
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 08:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A48D10EC09;
	Thu,  2 May 2024 06:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cp1UMP0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E8E10E9DC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 06:20:06 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-6f42924ca64so890036b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 23:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714630806; x=1715235606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgakmapef0h80N+jtF51dv68wB35uuo/PTTHrmoZruM=;
 b=cp1UMP0zlu6IcCfGnshmIIOIFOz/f57Yp++fr5f8RcpPXkML5URnh5ZrfdzXL5QnAZ
 HYQ3VdXVxHAbHKdkfzbdfh5q656cmWEoQoqLpEGbGIn58OGGlkCa00ErhqPC0RAaTb2O
 EKL/TWzmHZoui78GpnPfsh0ADJ8FpAa7/9o8Ep7viIcJ8OOJCkpGiP6xisbegi9Jhg0M
 nkMmRAoK960+/lshJdS5e7+yFYVMoL7+8x7HdTdxoJr9/0ClpCfViQ9bUyjGBS8PmLsO
 1jyqvCtJ4R4JS2NWZovUjIfwpg5V7oElP0Y6SzlWzdi+B4IYnQMUlEUKorlwCke3QoQd
 AWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714630806; x=1715235606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgakmapef0h80N+jtF51dv68wB35uuo/PTTHrmoZruM=;
 b=SRA6tCVmuFdksG2iDLoIg17l5nUx8cdZotbCUo82FDOIiVS1djnrBbpAc80qJlXO61
 awf6VpcJbJjuhGtmdoL3s1ra0SNKzvCRl3XJOSl9K9myRPHJN8WkdGI/LyzFZWxnXCvr
 TxQo8iPHkdEBBucoS9KHqGkSJjI3FsSkyStVMNBhHe9X8UXhkDUQM/Q28jFXArsnrn5F
 I1llKmxmJrnC6/OPgU3KW9sxK+PY5rorGNAAbOgBysMGtqaQE3SqLo3XsP5kbd92VJRo
 O+ACGAbLNoF2Utjsv27iZZ7HeawskwSu+6CC40lWPLKrn2uJtKUMiZblaAbgkjaygO4t
 d1Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP8CooMnSf0dE1PSip7If74ea5F2sN12jWs8eCY2BGoJ20VV/3R4U1+8jKnhjxqBsyM8mXYPUqw3Papm8hSjJ+UbCfm8M9V3CyZ8jugt+H
X-Gm-Message-State: AOJu0YxdkWP5Yn4SkIWuTuGa7ws+UMdgo/aql7/K0z65O7yE0VLtsl75
 RWFx1vjlh+k7Obdeo73PZUazOrR/hMaCLAdnXOdNx+zWfG585Shy9UYqIa0QRnv2nxxNZ3kKcIW
 xuNjcrNacenhPyQcaSVLORuJp1XM=
X-Google-Smtp-Source: AGHT+IGw7RzP7UzHjMbV/OepNR4EpONmEDOtas5IFiGjBTRnwEvzrxz/pCfwVHCFI9ryiW74MuQPtzxxUTUbsrc7WiM=
X-Received: by 2002:a05:6a21:6d8b:b0:1a3:ae75:d6f5 with SMTP id
 wl11-20020a056a216d8b00b001a3ae75d6f5mr6426998pzb.20.1714630806165; Wed, 01
 May 2024 23:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240501125146.33648-1-prosunofficial@gmail.com>
 <20240501140144.GA10180@aspen.lan>
 <alpine.DEB.2.22.394.2405011618351.3278@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2405011618351.3278@hadrien>
From: Shresth Prasad <shresthprasad7@gmail.com>
Date: Thu, 2 May 2024 11:49:54 +0530
Message-ID: <CAE8VWiLZvmeMdR5rsJ7vugXPyW6ABMZZwPRhJ=iU-KXqOJZ77w@mail.gmail.com>
Subject: Re: [PATCH] backlight: sky81452-backlight: replace of_node_put with
 __free
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 R Sundar <prosunofficial@gmail.com>, 
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 javier.carrasco.cruz@gmail.com
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

I'll remove the unnecessary braces and resend the patch.

Regards,
Shresth

On Wed, May 1, 2024 at 7:49=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Wed, 1 May 2024, Daniel Thompson wrote:
>
> > On Wed, May 01, 2024 at 06:21:46PM +0530, R Sundar wrote:
> > > Use the new cleanup magic to replace of_node_put() with
> > > __free(device_node) marking to auto release when they get out of scop=
e.
> > >
> > > Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> > > Signed-off-by: R Sundar <prosunofficial@gmail.com>
> >
> > Thanks for the patch but I think this one is a more appropriate
> > solution to this issue:
> > https://lore.kernel.org/all/20240421104916.312588-2-shresthprasad7@gmai=
l.com/
>
> Maybe neither one is perfect?  The one I see at that link has:
>
>         if (!pdata) {
> -               of_node_put(np);
>                 return ERR_PTR(-ENOMEM);
>         }
>
> which has unneeded {}
>
> julia
>
>
> >
> >
> > Daniel.
> >
