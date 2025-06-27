Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8EBAEB6C1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061CD10E9DC;
	Fri, 27 Jun 2025 11:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eHQsza1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D4110E9DC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:44:20 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-313dc7be67aso290512a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751024659; x=1751629459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pS+ZPyznlJ3iS5vNN9mSK0o3DY38FMnpY0fJETaSO/s=;
 b=eHQsza1FTTT8KHhfprJQeHvpVUfMwIH+1DlzTQylMLLfEi987w5CXEuC+pQUvBHHvt
 8AIc87A9+28O36YotufeTuhJhdBEnd/nC5fb6YVmAqePrHWJA59rfSh/X/TZ8cflliX9
 BD5eplXr2Mu58BxpP7D0FMjAr/0RrGMc5SZTm3Zq6R5XW05L9jX4xNSOpEmGaBd2yb7o
 pkwQsLIQ2dZUmatzVkofaiILDvmlFsHp4gIcarRd5u+geKlCxRgZomBKqHYq+E7pbA1i
 R+nMNNrR47NOMgUKu18Kg80BFrer7/M9bPDeso55mG5hyIk2wyIYwehSuqf/YOe4JSZm
 TWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751024659; x=1751629459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pS+ZPyznlJ3iS5vNN9mSK0o3DY38FMnpY0fJETaSO/s=;
 b=DUPCNpnc8yJhxdhMmHVJ9pUxpzQILKjVSbyDi6UvCmgQKsHNPfMUog/Nt7ppzlQ+y4
 K+uHGKw1ad0C/3XFH0e9BPQE081To826xZH3yyR2Zxgg3449pizbz+XJJDfPEKUHTgLi
 vwN4YqMcLVxVGcL4wJGEEcAhM8uya2kGNsxDPvbRXtsSyLOavG25XAkzXr79a+TwD4Zu
 e2nkhrYXieIbXVn3YdPYy9DNaCZoyzQskIfHkZpiYDvFaNBRmbOXRUtJV/+bUbalV9KN
 tQTvhv5M1oEZU4wbUeYS6ue92hZF7nsxdI/o1VaESY14RarUc/HyfnpTFKp7g9ezkV1L
 NPdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw6z+eMot028xxvRewUuco8PXhbIEBm6ZERl4CYA4REYqeC5TBx03YD6ez5FGnhBKIo1NLB73SWQA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCf6xAeOYpLMufvXEm76C3pEQILn8deCRxtUYrjhfGNzjyhh1D
 2nfTcy+y9xPhlF+fMvhdZAOVp82sQPZKZoAq34nP7Nw80qe7h+ndqQh+x9DuT85nFooZhWw/jQ7
 0JSfu71DfAljyIIIfxAJn8K4K9RzSEa4=
X-Gm-Gg: ASbGnctSakujHNclCdZK13ld+QLR0DLcc/RNj3qAWcAUR2j3Z+TwwKVyYcFH3Rl82Uk
 CJptPgT/UmPHGGJsSUGw2SsnQ2+Kbo3T4v9QO0CKJxvYWwDe5V8ezJQn4qNRzMHA0BSaCs0Y+ja
 nLurLNAlC45sTuQIK9HD1zKb46lggzTLnZHcv6OIvokXI=
X-Google-Smtp-Source: AGHT+IE366TUu7KMH/hZ3aJAQfk1MJ2VG8O3hymjtiBQTP+jBFFLF0J1kyJhKcyp/4h7ZGpYnNpQeVzFO4P2hKv7u9M=
X-Received: by 2002:a17:90b:3d85:b0:313:14b5:2521 with SMTP id
 98e67ed59e1d1-318c92af3a7mr1613655a91.5.1751024659411; Fri, 27 Jun 2025
 04:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250627094102.770689-1-jfalempe@redhat.com>
In-Reply-To: <20250627094102.770689-1-jfalempe@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Jun 2025 13:44:06 +0200
X-Gm-Features: Ac12FXx-5LTvv9I-ZDb9-nivG3KWk1kM0W75cZm76TLxZSE56N1ptu8fSUOgiIc
Message-ID: <CANiq72=aiAnn3n7ADgmKUNNSp7HfBjRc1ftG2qSD4EFUkS3jqw@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
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

On Fri, Jun 27, 2025 at 11:41=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> +/// On arm32 architecture, dividing an u64 by a constant will generate a=
 call
> +/// to __aeabi_uldivmod which is not present in the kernel.
> +/// So use the multiply by inverse method for this architecture.

This sounds more like a normal comment instead of function docs, no?

By the way, formatting:

    `u64`
    `__aeabi_uldivmod`

Thanks for fixing this! It is nice seeing 32-bit arm taking shape.

Cheers,
Miguel
