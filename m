Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE2CA2AF8A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95F610E8F4;
	Thu,  6 Feb 2025 17:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BYr8G18+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8F310E0C6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:58:54 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ab737e5674bso224287366b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1738864733; x=1739469533;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5VkJ1I/mpTOj70lVolwV2vn4N+hDhU0UEmqKxlKybuw=;
 b=BYr8G18+emry+uBJrVKBlzdDLouDfsPs2+EGErqpASfyAwyjiwWwCThYWupRKSCBLB
 Wg6kmJgFm5rEdpDMUz6/NS8qFJzetBf2SmwGp/yDuOMH6vXyOtV9eGbKVlqmjpRHpFVr
 ljOK8dU327S4msf2soc7mo0d2+WEeZ5pYiKKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738864733; x=1739469533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5VkJ1I/mpTOj70lVolwV2vn4N+hDhU0UEmqKxlKybuw=;
 b=GKV6riitoLm3AMUFIwkE0mBQW8rJnIIOqGdf6EI2UFZGHTmCT5vx0PHPmhdKH2d+VC
 0tt4Us3wHmvAoVgbRqEymjLJhFvzX2tjN9CcR9XTbFpCnvE4j54DNrqbGPEKJYzKDRjo
 tXaGx8kzI1sadcEEynVoRY/bExiq5fFQ5PsoZtC4qIwrKvg2WjPLEqomMMFfEytkXaWw
 GxXApo39gS6ZDd0O03jhje42Jmk/N57Yf0gULTNSYo58NE10bdJ5+Ge/Kptal7NXth0R
 4cL4MleeIwtz7KDDGJ6qIPX4v8P12zLhzsQRsrotPJ6mnNINJ3Xdmz+E1NjQUvOfgGkn
 7ftw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpteqof6d1L9zxmej0GlJcLvnIv53zGZpV2yb75x2kHrRHlsBDMmy6S3XwnCGZ2QS4Vd28XX4ZSfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM3F7klHiCagDzOHjrimWoagUsG7OlZzuRXSFS2c1/p/czVBxc
 mWvCnKnxQK+ZKe8Mtu554YJ82S0SpbXfHtDxCLOy4TXIXdH0I+QpTTWJzJvEknYomPKBHFsuRHZ
 /490=
X-Gm-Gg: ASbGncvx2VjBTuGkYUnsQm/oqpB+i3YyWSyiIlGYtJzALKKsiaaVWlyJRi01s72+/pS
 jrZZX0kWbevl6JyNvs3PActXKTthNKtiHz2NjR6XNAQOEm6wasDhcVG1fjfbTuZUQT5n+yh4zSD
 gLyKRVQv6VZg4/9+2uxSviwx/FAOnpcniCJ1Haf8xPA7z1U/AGRFqksjnOu//+XxVKh7et69E12
 WWqR+53Aji/nzk4JcLPS7EaefHolOS8NMlwkS6cS3aUIVxWJiH47/ty0TJm/i567Av3hnWb23iX
 mEyfSOjxVVM76pyxZBxCL/pcbz/tX0/N3s9ExHYJ7POaIEdrwJ5Hu4A40lw8hlkmXQ==
X-Google-Smtp-Source: AGHT+IGqAnAvCjPEubKGzjJnaPJujluYZVnjJ2GlJn/s/XuxGyTopTie+2UutG1FW55qfOMAtmq1/Q==
X-Received: by 2002:a17:907:9688:b0:aa6:7a81:3077 with SMTP id
 a640c23a62f3a-ab75e322c85mr907896866b.54.1738864732899; 
 Thu, 06 Feb 2025 09:58:52 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab779832909sm96054266b.49.2025.02.06.09.58.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 09:58:52 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ab737e5674bso224284366b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:58:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVsP0Dn4/pHyls7Wch5K/cZOK4yep2IaOwMf/vI+6sgB9AhRzmLpmfB+79VUcy1ui+aQmBXKLqYgts=@lists.freedesktop.org
X-Received: by 2002:a17:907:7f0f:b0:ab6:d6c3:f1e4 with SMTP id
 a640c23a62f3a-ab75e2f2393mr881845566b.38.1738864732223; Thu, 06 Feb 2025
 09:58:52 -0800 (PST)
MIME-Version: 1.0
References: <Z4D5a5NYrAbNxUL6@pollux> <Z4kG5AcVeQKegLnb@pollux>
 <20250128092334.GA28548@lst.de>
 <293df3d54bad446e8fd527f204c6dc301354e340.camel@mailbox.org>
 <20250130154646.GA2298732@nvidia.com> <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com> <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
In-Reply-To: <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Feb 2025 09:58:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
X-Gm-Features: AWEUYZkS6oHFUn-g-IGnkz4FJ-irLv59VoaubaKbNOcXpu9gE5INymKIQSe6irw
Message-ID: <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Hector Martin <marcan@marcan.st>
Cc: Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org, 
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
 aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 airlied@redhat.com, "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, 
 DRI Development <dri-devel@lists.freedesktop.org>
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

On Thu, 6 Feb 2025 at 01:19, Hector Martin <marcan@marcan.st> wrote:
>
> If shaming on social media does not work, then tell me what does,
> because I'm out of ideas.

How about you accept the fact that maybe the problem is you.

You think you know better. But the current process works.

It has problems, but problems are a fact of life.  There is no perfect.

However, I will say that the social media brigading just makes me not
want to have anything at all to do with your approach.

Because if we have issues in the kernel development model, then social
media sure as hell isn't the solution. The same way it sure as hell
wasn't the solution to politics.

Technical patches and discussions matter. Social media brigading - no
than\k you.

                 Linus
