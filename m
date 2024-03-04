Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15288706CB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAE41122F6;
	Mon,  4 Mar 2024 16:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1QWYB9vZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70511122F6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:17:36 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-428405a0205so1026101cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709569055; x=1710173855;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJO9gacEPP5sFMHLlJa9c2bsoqfYUttJAmzyO8JWUPM=;
 b=1QWYB9vZReuyq1+ilmumwdxCGMmfFlK/X1GgmxHSM7hDAppEMWRgJ4W+tMgMySFxB+
 E0fuzRRYE/vLwDfy5HJKdyh5h0wbHrksQqqvSGCdoSEyETJZcI9YDYkm+ADrpS5oXVio
 q1KGOxjf6K9HvVCeD6EqRYWnsCwl0Mk9FAZTyvUlk1/SyamVvMaps8/rvrDqz9prnXXy
 DINTYFzAMuf63NMnfNQbEwchXhNVWN51NhGrXXaAqcp1HKg3CG52v2EcpJnp82HhFEdY
 eJJdgjcUbNToh+kmzsE2ezgHkWdxKTikXbX40lMnYhukM5lnl5774/7DJeK8qmmBIO6T
 kL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709569055; x=1710173855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJO9gacEPP5sFMHLlJa9c2bsoqfYUttJAmzyO8JWUPM=;
 b=I9So/AFxngcOQw0efF4KhnSGjfExjW/Jt2QufeWHiT48D5Md37oU1S0o02WayhDxSh
 haA/m0k/ZGk5Z3pTUxouDoxctnkhsTCTtyS5jHVFpOJANB7CSN9Ok8SHW8UzdRhSgVLj
 FYO8O0NXLJoFPdXN7ghZBjEejG3JCzOR32B58RlBy5sSqaIsz3Jz7vsSUrtmLVGC/7yR
 nZ4Y6KPM2/QYaFNLyaK1Vtom9QrCOQA6bv5NNmC/awOOkSYpjc4Zkh7xYA4zXfNDQ9hq
 fskBYk2B5xGpFPELUKvrFR7Ns8XRhXF52wKxyliVHvu+raAD/MZOAO6ErsTog9qDHaDh
 nmdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaKHoZ4fhSqbAyA7QcXPa+rCN7Nd0UJoVcVLkGE+bkiVuqdYgwSTQt6UVjcK3CRV1nz4I8868YKDuO6lkP/5x2iI/voYe5RzsP729XAyBQ
X-Gm-Message-State: AOJu0Yx6m6fXoO4+apgfkXifn9mqexHN40qdvbipwhMjGmdIO9pqUfs/
 H8XXk1ya5qXdwwT8Nt0BIRSvgwDdWYh2MA6QiCgorM6ieege5+hJtnIsYs4F29VPfjdtPY68P/+
 7F+Y2BHO7ni/Ct2lmMxCRA1D2wBWIilBqTWI+
X-Google-Smtp-Source: AGHT+IHbFr+UrpkmDyx9eEQjvWp5e9il7+Ss/3DBjwoc6vhBdezPC0MNPvzzn5kv1q0w0+yTuTK/ZwenVZtUrxnT/+s=
X-Received: by 2002:ac8:68a:0:b0:42e:9dd8:4a64 with SMTP id
 f10-20020ac8068a000000b0042e9dd84a64mr708152qth.18.1709569055283; Mon, 04 Mar
 2024 08:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <20240304-rigorous-silkworm-of-awe-4eee8f@houat>
 <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
 <20240304-ludicrous-grinning-goldfish-090aac@houat>
In-Reply-To: <20240304-ludicrous-grinning-goldfish-090aac@houat>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 4 Mar 2024 08:17:22 -0800
Message-ID: <CABXOdTeDydWO9mf2yxWjjebHZ1bE=R2HPs1P4XYwNhzznNKxmw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Maxime Ripard <mripard@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
 Nikolai Kondrashov <spbnick@gmail.com>, 
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 gustavo.padovan@collabora.com, pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org
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

On Mon, Mar 4, 2024 at 8:05=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> On Mon, Mar 04, 2024 at 07:46:34AM -0800, Guenter Roeck wrote:
> > On Mon, Mar 4, 2024 at 1:24=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> > [ ... ]
> > >
> > > If anything, it's more of a side-effect to the push for COMPILE_TEST
> > > than anything.
> > >
> >
> > If the drm subsystem maintainers don't want people to build it with
> > COMPILE_TEST while at the same time not limiting it to platforms where
> > it doesn't even build, I'd suggest making it dependent on
> > !COMPILE_TEST.
>
> I don't think we want anything. My point was that you can't have an
> option that is meant to explore for bad practices and expose drivers
> that don't go through the proper abstraction, and at the same time
> complain that things gets broken. It's the whole point of it.
>
Can we get back to the original problem, please ?

Build errors such as failed 32-bit builds are a nuisance for those
running build tests. It seems to me that an automated infrastructure
to prevent such build errors from making it into the kernel should be
desirable. You seem to disagree, and at least it looked like you
complained about the existence of COMPILE_TEST, or that people are
doing COMPILE_TEST builds. What is your suggested alternative ?
Disabling build tests on drm doesn't seem to be it, and it seems you
don't like the idea of a basic generic CI either, but what is it ?

> > The same applies to all other subsystems where maintainers don't want
> > build tests to run but also don't want to add restrictions such as
> > "64-bit only". After all, this was just one example.
>
> We have drivers for some 32 bits platforms.
>
I said "such as". Again, that was an example. In this case it would
obviously only apply to parts of drm which are not supported on 32-bit
systems (and, presumably, the parts of drm which are supposed to be
supported on 32-bit systems should build on those).

Thanks,
Guenter
