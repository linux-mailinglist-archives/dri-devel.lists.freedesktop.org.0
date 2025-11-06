Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8AC39C9E
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1068010E853;
	Thu,  6 Nov 2025 09:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D+u6JNu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A7410E7E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 02:34:07 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-88f239686f2so43735885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762396446; x=1763001246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eT7eRw9/5ISp15CGBzCrhGE2pmdJMgXW2DzUMkcebuc=;
 b=D+u6JNu5QKnTF9ou5+7/ipuLVtyECnn53+2ru7IvCkpdzrUL3TuWlOKQpgl4srnEXQ
 q8o1sCX76Kxic1xm8L7JnelHks6JJybyV4rtYP22tLxAR8gl1B5G+EcMX4uUlpLjrDfF
 D3xLSVmEKckxyMsxk0ZdDgU/dp7ofvgjJmmlLm3I2Y7zcxCocYDazaxEF+YalxTxTl2F
 2Ngh3qgn9sgREYp4gO3a0JXoM4pxWmhxm4cBbou1JCiiEXFVvQB0Idj/wu45Du3dKTWU
 HedlqYdbRAIhucdpQ+vdQAs9nY6Gm58zmZoLEkel1jQUfevY/46kxwyBUVFvJgPl6hKC
 r12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762396446; x=1763001246;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eT7eRw9/5ISp15CGBzCrhGE2pmdJMgXW2DzUMkcebuc=;
 b=ra/4BzpaHBWx2S+fYKEMyBiqp+zuowYKo+vGuAfx87E+SAqwvuklkOOCPu5Qnz5BxB
 wkMgpJYqU37RCNEjmBC4f4xLwEk8aVrEBIxyZhfTFigNtqVPNyw6RuxA77UhPQ7WBMvr
 3TTAPp45iRj0M9saAh5A5voh530V/XFGpTn2739yl/fRr3o4OjamAQa9Kl/S6vKz+V82
 Vagr4W979sYVqBJ8ccplUFjte32NDC8vDoLWlhXFaNIjWmxLMWmo8BokIxPn0AMb5d5C
 O8aiyaZj9kRVY2emdyyRMdwkP7pptMcguX2lj2e1eVKl1Zdp08ld/n+uHVMtA+WM2wop
 SZRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVluQ+IXesvRAlhwSG6VLXa3h2husF34Mn3EID/kTCtjWxh09mkmt+vqYmwIq0YwIaKDdpN72ky7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKh8MiuEJJeWakNevWDoCVtR4LEFUGFPPkIXZUJV0H9U5rhnLf
 ZiUPEqSGZG0ICY5tqWr1QmCKtH8p9Yv4kgyydIEd/IMtZebOWUeOK021SnDX8yWdUcv2vrOBbX9
 v51zZaI9Lua3My/DtfzS9bO0499G05w8=
X-Gm-Gg: ASbGncv5GHxdVcngUebdDZuEF6H3okcYN0hgBC0nVOG5ITEjK+JlTcml6E080WwoTBs
 IQt2hoEvICEEaBG5ErL39TRFsBMaziMhbEsp1+ibkNymacCLbxAXfkX2q9zWSG0GDvBdanz1PQ7
 powlvm4EZyFjjyDsHqfOiBqHzUm59dYUzwosHQ08xxx5wooycyDaI8R8HGOREaMqpX69XTjtBin
 Tv1YxIa+aquFgr2qTiGy6cEHh1QznQpE5NNw24IyHovGuZSokLxeUzIOtWHjivYwto4G1I=
X-Google-Smtp-Source: AGHT+IH2ISUQbjAz5ENjJq/uEOXvU62m10as471BmbjyWcmy6OOBDzk9WNfXvUmmHlsJmOVTi0GMIAjSy9tbtMgo0v0=
X-Received: by 2002:a05:620a:2892:b0:86e:ff4e:d55e with SMTP id
 af79cd13be357-8b220add1a4mr678564185a.39.1762396446056; Wed, 05 Nov 2025
 18:34:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Nov 2025 18:34:05 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Nov 2025 18:34:05 -0800
From: Amit Dhingra <mechanicalamit@gmail.com>
References: <1043551.1761844832@turing-police>
 <32ed124e9d603cad950c4836c7a14a3ba8bc2068.camel@gmail.com>
 <1296761.1762045181@turing-police>
 <CAFF-SiU3XL5pZAzsB=eXi7e1LKzx5XwiNOyfGpPXOnnc6uo2cw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFF-SiU3XL5pZAzsB=eXi7e1LKzx5XwiNOyfGpPXOnnc6uo2cw@mail.gmail.com>
Date: Wed, 5 Nov 2025 18:34:05 -0800
X-Gm-Features: AWmQ_bmTHJ5o4ky7tugyGqg4q6fbF3cBYHNJw35f2J6kkB6wRtQdQHP2gUMWv7g
Message-ID: <CAO=gReF+sWpKZFa+wbtGxa3+wSjAQG1UMG3iJaDt2EOPmH-7mQ@mail.gmail.com>
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

On Sun, Nov 02, 2025 at 10:27:54AM +0100, Timur Krist=C3=B3f wrote:
> Hello Valdis,
>
> I use Fedora and I developed that patch on Fedora, using the same GCC
> version. It did not give me an error or warning when I wrote the patch. I=
t
> is still not giving me an error or warning about that code now.
>
> I am working with the amd-staging-drm-next branch.
>
> What do I need to do to trigger the warning?
>
I have the same problem.

linux-next on Arch Linux
GCC : 15.2.1 20250813


Steps to reproduce the error
- make mrproper
- make allmodconfig
- make drivers/gpu/drm/amd/amdgpu/

Turns out its due to randconfig, See [1]

Setting RANDSTRUCT_NONE=3Dy seems to stop the error.

[1] https://lore.kernel.org/all/2025062439-tamer-diner-68e9@gregkh/

- Amit

> Thanks & best regards,
> Timur
>
> Valdis Kl=C4=93tnieks <valdis.kletnieks@vt.edu> ezt =C3=ADrta (id=C5=91po=
nt: 2025. nov.
> 2., Vas 1:59):
>
> > On Thu, 30 Oct 2025 19:05:30 +0100, Timur Krist=C3=B3f said:
> >
> > > Can you say how to reproduce that?
> > > I use the same version of GCC but it hasn't given me any warning or
> > > error for that patch.
> >
> > Upon further testing,
> >
> > [/usr/src/linux-next] make
> >
> > is sufficient on my system. Turns out that it errors out even without W=
=3D1.
> > My
> > next guess was that it had to do with -Werror, which would cause warnin=
gs
> > to
> > be treated as errors, but my .config has
> >
> > # CONFIG_WERROR is not set
> > # CONFIG_DRM_WERROR is not set
> > # CONFIG_DRM_AMDGPU_WERROR is not set
> >
> > Do you perhaps have patches in your tree that aren't in next-20251029?
> >
> > I wonder if Fedora's build of gcc 15.2.1 is different somehow from the
> > build you're using....
> >
> >
> >
> >
