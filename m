Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1727FB3B0CA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 04:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7C110E090;
	Fri, 29 Aug 2025 02:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JFn4yMSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D655810E090;
 Fri, 29 Aug 2025 02:17:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-afefc7be9d4so65605366b.1; 
 Thu, 28 Aug 2025 19:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756433861; x=1757038661; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2zNq7nTrPyuvfyWDRfXFepylMjeAYocF2SPbgXmN+NY=;
 b=JFn4yMSUJ77p6/W25emwJ6KEmhoREUdb51V/vN4grIR0xLEtgybOZpBawFbNLFKTNq
 z8tdQ6v+JUPDD3gS3TbzxzpxAllelsVbLYI09EZAzG3gR1dJpWik1grXk2jQ9SHuywnc
 iQL4z1kI2NDWnGH6+y5HcaEUVeeys9cABWg/MKJEgGmowoqmSX0h2jExPLDABLwrYGjz
 NyM2GLZ+FGqmF0kIL5Hfrgn76YfAC8DMNKHmV0NfYwEDe07GKwtF868faHmY80BRCCkf
 mMh+wgAAkBda+b3spYe9WdVumFeROCTSP4US3LC9PvWEuB3tZELX8iWaryKXHI2AblUB
 dAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756433861; x=1757038661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2zNq7nTrPyuvfyWDRfXFepylMjeAYocF2SPbgXmN+NY=;
 b=tYGkXZLPCh47N8eZlquXmaV6WsVuBtr0NuEI645GINdhME1sJnKWNrvbZWrg3t9rJD
 PqMDsfUm7CjEIkv0Cgl6YpO8KU4+9RdrrPgFHYQGZbGXKLQ+M//EpqVuHKDryr6yTYjZ
 b3YBM/jJ5rmrzEWCJfE+QozGK1xEetTGYUFQBOAgjCwUROT3Eld2ZdZIXqE4cy0GA1BD
 uDKsyqsY2FIkTuuLO+1ew47JarhnImgJVXrdw5vjxC0lGSsOFuXUG4XF0Wqc2upQ17z8
 9AgMhgCQ41pJvKNDMDQO6DIKaR0O4lri2GxQvVXBltu1ys6tdlUG9enaLMM8cx0TZe9J
 uBxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXke+YwMn8Mfdk87DJahx5q5FNj81a0MONLuOgLH1P2X+F7FAgfkivCmzelvU3hQyJRBOtvfUN+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1f7kMD6tNv0LMo9uS2iIHGUdFeeuQtRmrtQwSEpFl7z5Ifk4T
 MMUd9TrGl499b65XiYpwd63C19Vn4x4olWmf8/zh/ZAQNcU0tpvauk4aHns+fiyHS8t51H1CEe7
 D5hWm96Xd0pigA7GJ7MJZDUzWNFP5ztg=
X-Gm-Gg: ASbGncsTLSR07PWfWOp+Sp3or2NNS3A3meHqJguKPwAhyBC/olF/Rd4d5OqtyBfQwZV
 MVVGZurnIfqsy8/kcmVMA0Gsl0Tq0fk+j06Tbtu+IhWcc0ssHaChZWqX6l54ctAOnKsJAZLZh7I
 EosWKQO+j0vu6C1q80LGh4IByK+9Llysse/BMsSi8N9oVWDc7zEkr/X7AFApRa+pdXNeqUlWfpO
 MQw2Q==
X-Google-Smtp-Source: AGHT+IHXFQhjHCz4WRh3Z6nwd1kt85DmecDfzWJx/U2I59eH5vdudxcMKiNPeYrOPOCwuNRjHx4BglqZ4CqT80/chds=
X-Received: by 2002:a17:907:e895:b0:afe:d499:a450 with SMTP id
 a640c23a62f3a-afed499a769mr567379466b.64.1756433861163; Thu, 28 Aug 2025
 19:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250828205517.1553768-1-airlied@gmail.com>
 <CAOFGe94kJQfGirjjyDCAD-Ryc7N=U4exd10rTWy_YhiemkZW3Q@mail.gmail.com>
In-Reply-To: <CAOFGe94kJQfGirjjyDCAD-Ryc7N=U4exd10rTWy_YhiemkZW3Q@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 Aug 2025 12:17:30 +1000
X-Gm-Features: Ac12FXwILmhT4Tjt0Pef5kwUx2JqQ_VQ8dGk_ebDd7LFjxOhqYVeL3eMfC6KmUk
Message-ID: <CAPM=9tw8fsJHEBJbahACLqmjVOFxLqx1LeLFosUu-EdAAYyCYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] nouveau: fix disabling the nonstall irq due to storm
 code.
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

> > +}
> > +
> >  int
> >  ga100_fifo_runl_ctor(struct nvkm_fifo *fifo)
> >  {
> > @@ -599,6 +604,7 @@ ga100_fifo = {
> >         .runl_ctor = ga100_fifo_runl_ctor,
> >         .mmu_fault = &tu102_fifo_mmu_fault,
> >         .nonstall_ctor = ga100_fifo_nonstall_ctor,
> > +       .nonstall_dtor = ga100_fifo_nonstall_dtor,
>
> You're missing the corresponding update in ga102.c, which is what
> actually covers most of the drivers.  Honestly, I'm not even sure why
> there are two files. They look identical to me.

Indeed, the r535 change is all that really matters since it's the GSP
path, and we shouldn't use non-gsp on these paths.

I've fixed it up anyways in a v2.

Thanks,
Dave.
