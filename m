Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08EAC39CA1
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2410510E854;
	Thu,  6 Nov 2025 09:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N3ZT/YcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D1E10E311
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 03:32:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so5002555e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 19:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762399935; x=1763004735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yrEk/Xf2Q2n9dlGq6cH1zvZkMfQfJdDOTEouv0yhkfE=;
 b=N3ZT/YcGn+ie03ugx0xGzl2euQBqZdo1DsETOflJei8wRkWBnGTLGaSR2DULucN04L
 p7N91fn9PXCBScAwGm/oXybCgB5lXCWFPbVCMvee5n1GRwFQlU2NKiDAy6FoA1Y2wYxq
 Bz3MTmlH+DkGfjY2QqoJZNQddQXCPBcBQwNQA83z8VDfBaHNlpe/l6lWow5umxZ+adDP
 q4QSmay1xgwPXAg+/dsIBsJf1qnwSsh/OEnUwH2aIXmrt+xno3ec78yLGG8Cpzv8qQIw
 CH4wO+p5Dg4EdOumcuml1yIBOyH3rmwEAKsNiLoNF3H9PjktwY2u5Z7As1eZW6kZmQWZ
 OPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762399935; x=1763004735;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yrEk/Xf2Q2n9dlGq6cH1zvZkMfQfJdDOTEouv0yhkfE=;
 b=Acm0rzR0wZ30COfk133+2/lZYvqlkDTc1LcibSYVZubMbwd3iJ5g4KYxnUzAGsMczh
 lzthqUF7H+LCMIQI0HW8t7SSPEezSZ+CXfN6tk0CLvOKhTGtWbkcwy4P9zzGQR3qpvjP
 zVsWvNMI8AQ2ffiTp88ih8wYxfMHfiwOQwCO6mi7jJtyeqWrl/9n9C4wzN0nroTPbnuF
 FIoc4/jbP5gVdig1QqzIuYxmtmWy851FqXoV/CUJoll3fjgZfSza7HigUv6atxsWDnFZ
 nAEfyZfPPmcioxb9SEyNADpj2K3s0zLMpkao+f7jwqE7Yg9E7aTPQyVzK4xbYLCIk6l0
 TsVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMopQBvtHwp8lLiTEH91p80ndRXV15Ir1VitP2hlbD6eD3VPHjWrS3+cmbRxTF16LDhmg+Q+mVv3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxrf/qja62ImC8Q/ToAb8RlptENGBxicxpDPheGdY7JupLlVwoQ
 MT4debCtD3tJqtSTNWleWbEdbiWXR+cUCx6vtYj6djlDDI0pqEvNUqrOunku7o4sS6ooc+5/opD
 xNMIWpkIE3WH5KqE5yJupL7OdNXIiAwc=
X-Gm-Gg: ASbGncsfjmfrFtp8GQu+uFSe6CM6m5PzUDpJkH95+nAEDZe1sgUWpC6Q7se2xnPfejy
 HmB75Y7bSElItbqcO60gKJHgWo5Vry9Gv0ekXzkDtC9HibA3UYOlQ/owdlCeoMsc9mSiR9Zt+u/
 48M6k7LJ/xMOtp3sZ87P9y22aufI6CSsR7SaPuWMi3zk+UO9B+TLq89w/6+JgsfqFakPlInm+Ri
 nskjlR8hHReTZ61bnhCjWfLh53XAcUC/pJJ9zHaZ3Z1d1oz/DrnRVbNpERU
X-Google-Smtp-Source: AGHT+IFrfGKqaeGd0M4rahJWdXYrfC2f9U8PYeDUdpZcxXT+BGPgGV/ia28mdz/Wa5fqNR6TklX63VW1vOs+z/WpW7g=
X-Received: by 2002:adf:9dcc:0:b0:3eb:2428:4a05 with SMTP id
 ffacd0b85a97d-429e35d2979mr3812837f8f.3.1762399935152; Wed, 05 Nov 2025
 19:32:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Nov 2025 19:32:12 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Nov 2025 19:32:12 -0800
From: Amit Dhingra <mechanicalamit@gmail.com>
References: <1043551.1761844832@turing-police>
 <32ed124e9d603cad950c4836c7a14a3ba8bc2068.camel@gmail.com>
 <1296761.1762045181@turing-police>
 <CAFF-SiU3XL5pZAzsB=eXi7e1LKzx5XwiNOyfGpPXOnnc6uo2cw@mail.gmail.com>
 <CAO=gReF+sWpKZFa+wbtGxa3+wSjAQG1UMG3iJaDt2EOPmH-7mQ@mail.gmail.com>
 <149f5bb52a21becedc17a5b0bf1a586672940af6.camel@gmail.com>
 <CAO=gReERBacxH6SjLrcCNcStiAzMosR=aW5D4W925CJ_yjzbhA@mail.gmail.com>
 <867953df79b54037ce91cf1886b09ec5c30f7442.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <867953df79b54037ce91cf1886b09ec5c30f7442.camel@gmail.com>
Date: Wed, 5 Nov 2025 19:32:12 -0800
X-Gm-Features: AWmQ_bnotwgT6unc_-gxGV9K6-s_IBREkpHZkpHK4M-tvSqJlBDCl1SbJWJwBdI
Message-ID: <CAO=gReE5LThojtkZx3+6aJYuB7UpRs1tHVnvma+BynFduA_9Zg@mail.gmail.com>
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

On Thu, Nov 06, 2025 at 04:29:05AM +0100, Timur Krist=C3=B3f wrote:
> On Wed, 2025-11-05 at 19:24 -0800, Amit Dhingra wrote:
> > On Thu, Nov 06, 2025 at 03:40:52AM +0100, Timur Krist=C3=B3f wrote:
> > > On Wed, 2025-11-05 at 18:34 -0800, Amit Dhingra wrote:
> > > >
> > > > >
> > > > > What do I need to do to trigger the warning?
> > > > >
> > > > I have the same problem.
> > > >
> > > > linux-next on Arch Linux
> > > > GCC : 15.2.1 20250813
> > > >
> > > >
> > > > Steps to reproduce the error
> > > > - make mrproper
> > > > - make allmodconfig
> > > > - make drivers/gpu/drm/amd/amdgpu/
> > > >
> > > > Turns out its due to randconfig, See [1]
> > > >
> > > > Setting RANDSTRUCT_NONE=3Dy seems to stop the error.
> > >
> > > Can you please try and see if this fixes the warning?
> > > https://pastebin.com/raw/b8j3UABj
> >
> > The patch above defining all fields seems to fix the error.
> >
> > >
> > > Alternatively, if anyone has other recommendations on how to fix
> > > it,
> > > I'm also open to suggestions.
> > >
> >
> > What seemed to also work for me is to defining the struct as below
> > without an initialization.
> >
> > static const struct stream_encoder_funcs dce110_an_str_enc_funcs;
> >
> > Its static so should be initialized zeroed out. objdump shows correct
> > size
> > allocation.
> >
> > objdump -x dce_stream_encoder.o
> >
> > =C2=A0 0000000000000b60 l=C2=A0=C2=A0=C2=A0=C2=A0 O .rodata	00000000000=
00130
> > dce110_str_enc_funcs
> > =C2=A0 0000000000000a00 l=C2=A0=C2=A0=C2=A0=C2=A0 O .rodata	00000000000=
00130
> > dce110_an_str_enc_funcs
> >
>
> Thanks! This looks even cleaner.
>
> I will submit a patch to fix the warning next week.
> Can I add your name and email to the Suggested-by tag?

Certainly. Thank you!!

>
> Thanks,
> Timur
>
>
>
> >
> > > Thanks,
> > > Timur
> > >
> > >
> > > > >
> > > > > Valdis Kl=C4=93tnieks <valdis.kletnieks@vt.edu> ezt =C3=ADrta (id=
=C5=91pont:
> > > > > 2025.
> > > > > nov.
> > > > > 2., Vas 1:59):
> > > > >
> > > > > > On Thu, 30 Oct 2025 19:05:30 +0100, Timur Krist=C3=B3f said:
> > > > > >
> > > > > > > Can you say how to reproduce that?
> > > > > > > I use the same version of GCC but it hasn't given me any
> > > > > > > warning or
> > > > > > > error for that patch.
> > > > > >
> > > > > > Upon further testing,
> > > > > >
> > > > > > [/usr/src/linux-next] make
> > > > > >
> > > > > > is sufficient on my system. Turns out that it errors out even
> > > > > > without W=3D1.
> > > > > > My
> > > > > > next guess was that it had to do with -Werror, which would
> > > > > > cause
> > > > > > warnings
> > > > > > to
> > > > > > be treated as errors, but my .config has
> > > > > >
> > > > > > # CONFIG_WERROR is not set
> > > > > > # CONFIG_DRM_WERROR is not set
> > > > > > # CONFIG_DRM_AMDGPU_WERROR is not set
> > > > > >
> > > > > > Do you perhaps have patches in your tree that aren't in next-
> > > > > > 20251029?
> > > > > >
> > > > > > I wonder if Fedora's build of gcc 15.2.1 is different somehow
> > > > > > from the
> > > > > > build you're using....
> > > > > >
> > > > > >
> > > > > >
> > > > > >
