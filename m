Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102C953C5A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 23:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0010E121;
	Thu, 15 Aug 2024 21:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jFvv7fFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F015310E395;
 Thu, 15 Aug 2024 21:08:33 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso159857166b.1; 
 Thu, 15 Aug 2024 14:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723756112; x=1724360912; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+syFCnxE1U7b8EI/rGLJbv3IIK896twBpUqKxQhNqtE=;
 b=jFvv7fFxvfLK7FDdvNXtIE3ENAkpfmPnyb0R2uXr/uC4OFbelLvfsRww4CI8OKd4y4
 ibrBfWE4ksSyGfVpWhDLuqDilo7DMs4vyh+Dw6n4KTy9FhbrYLY/owGJLR9lJMwmV/I0
 mKNfXaafMh9N+kvTfI01iUQGxSxspapb22vvNefrSMLKB13OpSFlnLv+y9UaQ1uI0A67
 8VzuMnXyqhBAGRyE6oiIQuVTGGCIueitdBONREUT3D9fjoAzdZZuRyYQy/hI0+4QJeK1
 e/SqyrgH9kIhSqtleggWO/Q95P9Lk71JKqo3ehhT1kmfvED5YK5FLpVvmLDcSygqQSmA
 DQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723756112; x=1724360912;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+syFCnxE1U7b8EI/rGLJbv3IIK896twBpUqKxQhNqtE=;
 b=UFOIYH9UphXkGkNHAiBW0Mjk+vL7cwtz/8AxZt/E4P4L47lbnjD3mkf0JXlmQjRwqx
 rB8wU7vmEzxt6I2oiwDA0bG9BRCHPZsX8qCyw36levr/Avyxl9CzTkgTbS84+t917e1z
 MjOoXndIAENWfmeWNYRhVIqgLzyM+5a9CRmKB9jgHAEB/3AWZTBLaAzPJ/6y3SXNCvRy
 653oQz/a98if+JCAKCOzWM6nTSM+38JpviEpchRadKYK1b4UB1JWhvKYG1ctvOdfaNs1
 4LJQ4KgcXcNdCwkM5IPaG0DMsC0DT+zcCN9JHjbwY5G7jhwlVPNKM8PqiGZuYH+bR5gE
 3KkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCZyEAphK9t4b8M/s/cy9UzoJcS+R3VGPDfmqoGZPJc5432KoMLf9aWfdKiQpvjaDwD2g+sTP/2gre6JIKkl3VwcoTfv7muRhre6Hqog==
X-Gm-Message-State: AOJu0Yx/s56XbTOZ1IDgkvZs6SkQBOPV8aOHUXRERNdIJN7qP2egpkTr
 FWrD1SKe0lCxMmqIqStailwRJrYBw/Rjn605nQp9OKmQJg+L8gmYR3tbdbW2zcK6Ao0lRcfNok5
 qg6qWOpPoRS+a5jDPHfVT8nPesDI=
X-Google-Smtp-Source: AGHT+IERppop8vve6VITh+2YoCvam6CmzSoxjNMZ65fij59HkNVdpc0y5ROZVj+vrF/Ga1UAFSq5f1SDgz/LqWY6iTc=
X-Received: by 2002:a17:907:c7e4:b0:a77:b01b:f949 with SMTP id
 a640c23a62f3a-a8392953ab4mr60975566b.35.1723756111696; Thu, 15 Aug 2024
 14:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240815201923.632803-1-airlied@gmail.com>
 <cc55ca650cb4c09a6e11a3a80c75a526f34ae6ff.camel@nvidia.com>
In-Reply-To: <cc55ca650cb4c09a6e11a3a80c75a526f34ae6ff.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Aug 2024 07:08:20 +1000
Message-ID: <CAPM=9twHRpDbOPs3sgDFexQpv9rDu7_bJ-GKo_S2gd2sRTieJQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau/firmware: using dma non-coherent interfaces for
 fw loading. (v2)
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
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

On Fri, 16 Aug 2024 at 06:45, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Fri, 2024-08-16 at 06:19 +1000, Dave Airlie wrote:
> > Fix this by using the non-coherent allocator instead, I think there
> > might be a better answer to this, but it involve ripping up some of
> > APIs using sg lists.
>
> Thanks for fixing this, but what is the relationshio between non-coherent
> DMA and sg_set_buf()?   You're still calling sg_init_one() and hitting this
> check:
>
> #ifdef CONFIG_DEBUG_SG
>         BUG_ON(!virt_addr_valid(buf));
> #endif
>
> Does a non-coherent DMA buffer have a different kind of virtual address than
> a coherent DMA buffer?

Yes, it has one that doesn't explode in the check.

We should not be stuffing mapped dma_addr into sg tables at all,
fixing that is a bit messier.

Dave.
