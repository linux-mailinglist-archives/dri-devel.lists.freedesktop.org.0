Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A3C39CA4
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120A610E855;
	Thu,  6 Nov 2025 09:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nMclLQ3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3751810E119
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 03:24:26 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-429b9b6ce96so350009f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 19:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762399465; x=1763004265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XWriRyYYR8ghNgV297L9OCEioZWlmVeoKEJ1s2bnlQ8=;
 b=nMclLQ3oGVdqvBGPHEPJYEMA6hEVfr9gO+p+Hd6A4qzwpMeIuSZRVGhn5IzV6JWwd7
 Y0KG/n+zfMARyUSahsM4hW40IVSonBIRHFVLRiGu7ttIIlDR4rmr73SCLfVcnPaIgkXB
 CQVyAEwdNw/Yy+cbyeolkf/CiCrRUzeasY6GyUlvLsCS0jFNdbBytKxSfLj5s/6F4pLf
 jkWbyHOBfU4ZW8vLQej+f2CIEkPktvIDrL9Z/y0UrFf4uo1vE3ykTYyAlm2KjL2OIQpK
 FFyO1E1EU9a9pdbcLB4RaiYNmvn3tX0c1LquXbKHk/3AHOzTDtSpPFoz5DQ7+eT7dhWu
 1qqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762399465; x=1763004265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XWriRyYYR8ghNgV297L9OCEioZWlmVeoKEJ1s2bnlQ8=;
 b=ruaunybZz6553Wq07qdpc5TbeaHoTkn+7ccgOPrfBq7pRQ0FvbHWWstXxBBnhW2+Xh
 TYbHCoac8mpnuLRk3PCbOliwLn3Cjp7b8Lla9vq1/WmiwTrqRM4DVamvBK2TT67U+9z9
 6YhMTfPnOalUsB5pCeC2HWRh0mDd4xyIldC9RY6MBl+rZVsC8Vmz17DxU2dicC6ObmLV
 gJW1+sBF9jBz14rmOl1PgjG1Ia+bCKL9OO4LaznZAfd8XyraHnUjWz56iuLi2ccys8ld
 8utxF04gTVabKakatT1Gpgd/7rmdGOnhQJpVSAqRE6rrpDwOv7u2dRzS52h14SA81HcS
 vqPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOoHgFPWYXwlD06liSUTR53KjfkO83DtiAqeyaP5FwNz46cAKhgyVBwsA3nO71tikM2rxXFa5EDvw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr9/dqcLau0wxCZDZNtk8OuFNnEUu9G8erGNCknm+WvqOYMLOd
 J3Uw48bHmWoC6i91DWiJ6EQ1j8IErPaWG4/wBwI8Z1TDz3qbp1CZ0Ya+8oRrogthcpxqjZ/gG2b
 AKyGkNP913yC+TJyR7nQmttRBBX2LNwc=
X-Gm-Gg: ASbGnctw9VoKhfd0mnBXrT1UXFWDjlWwWxLFD6HmuGyugoTJoCgPZQx6zweXXHtI56g
 WV8QABVCu5CKy//7Qt1LD7Je1v9XVrzt6GpFPyCD0lGagUNPZOmRbDFRInmcjOgidwWb+bmwmEV
 SgPr4PernGJ9zV7Z7WrYWxORaFNQGT0K8/TemzD+OjJR16ghj+UUz5bfG8wuDThu3GYJImCPMyS
 zh2BIpYwxu5ViV6UQey62TnqDhbJilFrqvmSNy3QSeP9Avv4OW72PHruNwk
X-Google-Smtp-Source: AGHT+IH0vBqmN+LTAnJJzTmqxPzFdBvxXGxIJUipsj9IOUkXfyL3ZCw2Oj0hPsddXQWER7iw5AD7RTA8CqGrUJA6+tI=
X-Received: by 2002:a05:6000:184a:b0:426:ff8f:a0a3 with SMTP id
 ffacd0b85a97d-429e33079d0mr4277837f8f.34.1762399464476; Wed, 05 Nov 2025
 19:24:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Nov 2025 19:24:22 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Nov 2025 19:24:22 -0800
From: Amit Dhingra <mechanicalamit@gmail.com>
References: <1043551.1761844832@turing-police>
 <32ed124e9d603cad950c4836c7a14a3ba8bc2068.camel@gmail.com>
 <1296761.1762045181@turing-police>
 <CAFF-SiU3XL5pZAzsB=eXi7e1LKzx5XwiNOyfGpPXOnnc6uo2cw@mail.gmail.com>
 <CAO=gReF+sWpKZFa+wbtGxa3+wSjAQG1UMG3iJaDt2EOPmH-7mQ@mail.gmail.com>
 <149f5bb52a21becedc17a5b0bf1a586672940af6.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <149f5bb52a21becedc17a5b0bf1a586672940af6.camel@gmail.com>
Date: Wed, 5 Nov 2025 19:24:22 -0800
X-Gm-Features: AWmQ_bm9b1RXq8yhr8e0aiNKvpL0O5UD001Mf3JquUOc7CURAMP3z_K9Ea3kHh0
Message-ID: <CAO=gReERBacxH6SjLrcCNcStiAzMosR=aW5D4W925CJ_yjzbhA@mail.gmail.com>
Subject: Re: linux-next-20251029 - build error in amdgpu
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, 
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 David Airlie <airlied@gmail.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 06 Nov 2025 09:19:30 +0000
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

On Thu, Nov 06, 2025 at 03:40:52AM +0100, Timur Krist=C3=B3f wrote:
> On Wed, 2025-11-05 at 18:34 -0800, Amit Dhingra wrote:
> >
> > >
> > > What do I need to do to trigger the warning?
> > >
> > I have the same problem.
> >
> > linux-next on Arch Linux
> > GCC : 15.2.1 20250813
> >
> >
> > Steps to reproduce the error
> > - make mrproper
> > - make allmodconfig
> > - make drivers/gpu/drm/amd/amdgpu/
> >
> > Turns out its due to randconfig, See [1]
> >
> > Setting RANDSTRUCT_NONE=3Dy seems to stop the error.
>
> Can you please try and see if this fixes the warning?
> https://pastebin.com/raw/b8j3UABj

The patch above defining all fields seems to fix the error.

>
> Alternatively, if anyone has other recommendations on how to fix it,
> I'm also open to suggestions.
>

What seemed to also work for me is to defining the struct as below
without an initialization.

static const struct stream_encoder_funcs dce110_an_str_enc_funcs;

Its static so should be initialized zeroed out. objdump shows correct size
allocation.

objdump -x dce_stream_encoder.o

  0000000000000b60 l     O .rodata	0000000000000130 dce110_str_enc_funcs
  0000000000000a00 l     O .rodata	0000000000000130 dce110_an_str_enc_funcs


> Thanks,
> Timur
>
>
> > >
> > > Valdis Kl=C4=93tnieks <valdis.kletnieks@vt.edu> ezt =C3=ADrta (id=C5=
=91pont: 2025.
> > > nov.
> > > 2., Vas 1:59):
> > >
> > > > On Thu, 30 Oct 2025 19:05:30 +0100, Timur Krist=C3=B3f said:
> > > >
> > > > > Can you say how to reproduce that?
> > > > > I use the same version of GCC but it hasn't given me any
> > > > > warning or
> > > > > error for that patch.
> > > >
> > > > Upon further testing,
> > > >
> > > > [/usr/src/linux-next] make
> > > >
> > > > is sufficient on my system. Turns out that it errors out even
> > > > without W=3D1.
> > > > My
> > > > next guess was that it had to do with -Werror, which would cause
> > > > warnings
> > > > to
> > > > be treated as errors, but my .config has
> > > >
> > > > # CONFIG_WERROR is not set
> > > > # CONFIG_DRM_WERROR is not set
> > > > # CONFIG_DRM_AMDGPU_WERROR is not set
> > > >
> > > > Do you perhaps have patches in your tree that aren't in next-
> > > > 20251029?
> > > >
> > > > I wonder if Fedora's build of gcc 15.2.1 is different somehow
> > > > from the
> > > > build you're using....
> > > >
> > > >
> > > >
> > > >
