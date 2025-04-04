Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB76A7C06F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 17:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313E10EBF2;
	Fri,  4 Apr 2025 15:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NZqdoljc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C662810EBF2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 15:19:22 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id
 38308e7fff4ca-30effbfaf61so22581831fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743779961; x=1744384761; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7iWccUiw/ID8NYLVkhb9PSyPwcEt5/Y/IQ2ZtQH16c=;
 b=NZqdoljcotq7dDmeBTKidKjWKMxXL5J9wBH9HNsrsDW2IJ4+OlvJ1YlH7/afjL08k5
 5BIFtELm17YIGA3lj1jcWsm23tZi5TMQhs6aOKfsLgdsDFyOwr5j8KNham3VHV6vYU/x
 yZ6SiXk0mf08uHGQ8DSqPE6BGqeAeU4l5WRniLJS8oRCG627SCvLF025Nb/9x12MDB7m
 Kf/mPdnoHk/gzLgzzFZ6xV5AcBmGi8fJY+ZuYo881vQsaz/0gY9f2zCF3NQH4ptSuuFS
 5igN+rrhfjKoFl703T0HXeAMtwWdIScYY+nDtRttgZl2N7I6/Yaba0HNjwIyY+xCkNxv
 j/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743779961; x=1744384761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7iWccUiw/ID8NYLVkhb9PSyPwcEt5/Y/IQ2ZtQH16c=;
 b=aGeHvNx1qSJB6wM/2AyZAdvCJUUFpk8EfJXZzTUNPExBptIOpxWvb9rtMkBgt2VDLx
 yvGYlJn8FxMggtn6LUp9D8pPZEP9TmCN2qVR9xqIE/ByG3DpW61QpNt4EOTyPzySrKLW
 9416I67aE6JntR6vhjYUYhzrclUwbuwzK2zTg3ITB+Gij3YWKX+X+XTDvoUtgAQkym90
 0q9jLq9djGpz9OmPS+YUUbOchD6h/ZJkWP/ZB/PGRnwwgUC9o4pgcpVll1qAwKusnF6W
 r+WoNCmL/nhouhgDWjy73aFHzap6hiZtNb5KxgweeotUcu86YiZXYt1xrSPSc5KqLTb/
 tWww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZKBGKNfQLeHfie8qWRH8mUYLI/oVwzCR/hx//AuAgwIuZ034B12bhJn6OgzTmVghEnP4U6T72aaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvUg0+jiLKXiTfh9o4jKvgkGqbdg9zMv+CU7Wv9dtJqKA9elo7
 pUySmYhriuqGdRokMuDD7PTd36YWGBETi7lYi4e+OAQiHLhnZhshoZan+Evk1WdqQ2v6iAeP5AW
 yjRh6AD5rvvbmIqA+S+yOU8bx6tdr3RQugkxwMSJ+
X-Gm-Gg: ASbGncvo/LnGJIQ//V9su0EMu6ftXdqWIppDG/JkZNG3x4kXi0DxQBbI6qaS24JyqZz
 WY+xBjnDsBXd8nn3hkxYp63ZXVCLcY8dWN91Rvd3zZIwfvSKGuVVOIlMUMkZGZAy5kicugCpe7N
 ccctLyTAix2yYSXAUV1ec3bybHqW8=
X-Google-Smtp-Source: AGHT+IEXx6acthjgAn6//pGGjgLYBD1HWjhVlOep3HaA55zS/PUR37+AJSk2OPFw/dPZLEdIcG0O31KhRGxGnR7OnQE=
X-Received: by 2002:a05:651c:1449:b0:30d:c4c3:eafa with SMTP id
 38308e7fff4ca-30f0a6672c6mr13405141fa.7.1743779960600; Fri, 04 Apr 2025
 08:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <Z-uqpxcge0J99IPI@aspen.lan>
 <20250401091647.22784-1-bsdhenrymartin@gmail.com>
 <174377951404.402191.3996310155954584937.b4-ty@kernel.org>
 <20250404151300.GD372032@google.com>
In-Reply-To: <20250404151300.GD372032@google.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Fri, 4 Apr 2025 23:19:09 +0800
X-Gm-Features: ATxdqUEtLv1VLfi6vRSrJH5UTl_kVLlPCY8-xy9xcLIwMYM5iu9pWJ5-wcimQ4I
Message-ID: <CAEnQdOpWrZPor9WMtEfub5qJFT98rrsN_A6jb_a-JqSjd9tihw@mail.gmail.com>
Subject: Re: (subset) [PATCH v4] backlight: pm8941: Add NULL check in
 wled_configure()
To: Lee Jones <lee@kernel.org>
Cc: danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

Noted, thanks for the feedback! I=E2=80=99ll send subsequent versions as
independent patches in the future.

Best regards,
Henry


Lee Jones <lee@kernel.org> =E4=BA=8E2025=E5=B9=B44=E6=9C=884=E6=97=A5=E5=91=
=A8=E4=BA=94 23:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 04 Apr 2025, Lee Jones wrote:
>
> > On Tue, 01 Apr 2025 17:16:47 +0800, Henry Martin wrote:
> > > devm_kasprintf() returns NULL when memory allocation fails. Currently=
,
> > > wled_configure() does not check for this case, which results in a NUL=
L
> > > pointer dereference.
> > >
> > > Add NULL check after devm_kasprintf() to prevent this issue.
> > >
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] backlight: pm8941: Add NULL check in wled_configure()
> >       commit: b0fdeb96ead46de57a6226bc3a3ac7f9b50c0ace
>
> Next time, please send subsequent patch versions independently.
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
