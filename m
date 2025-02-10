Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A90A2E5CB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 08:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C78510E4BC;
	Mon, 10 Feb 2025 07:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AHeoe9EO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C8F10E4BC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:52:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso45067245e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 23:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739173974; x=1739778774; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qkfv43O1g5zvAJXOqIcSrZ8ndK2BrDyyauC15WFvoaQ=;
 b=AHeoe9EOwfbcLffUrIudojX21tRFAI9hZ7unqUPIWVjKXfC2vbpVZLmo+t7mT3N2Bl
 CTQHSN3na9mhlyOgeg29wdstknIGKQ2Nzeia5DCwboDM4PkrHn/2f+NhGXB17JetgRI4
 g5yh3eLLYN1dPjDiBbOXs9aeC0YLakvjIBujw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739173974; x=1739778774;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qkfv43O1g5zvAJXOqIcSrZ8ndK2BrDyyauC15WFvoaQ=;
 b=ZRrG8lup58WHFkaywpKIKAhStivkTyEx7m23LmJh29QjNapdKyBWsYxnnwHn92tsRx
 gbAEOev4jlk7fnhuZWcwiq56fC3AK5f7n/Ee3Ey+qaTl9pBR+lJtihGNoHYbHfk7h/N4
 c+mazbmO0raQeMyS/am/a+URU73orPzHOhLWbWUE53ow5tfs08T+0o+foto8as5ok+qZ
 jwjzbZoJLSuDv+x2Nfpc6KHnJ8QX/XopBWsUtdMJ7AgATKho9pxRfkY4IU4UF5YfWK+3
 e+XC/O1DuPJX0Fvi+JLzVtHNeJ0bYDrqGfRV3s/U8b0SWrFvUYhiIvsWsR85A2lpY1yp
 VMwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEnwEK0Pd99n99vruNEjqQ0Tt9iXlenjtGg0GNKf11ZWTiRwlpDqEX6Eim2fym7RXtdUKQHOT0qtk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn3IWrkHE+b3KpBXSuKnqF2LXuV/kwlpKVMTMu0XCtkf5JFbxd
 AcB1AJs+IS8uRVRddu7/cz8kRs/2sjve/tyGV+KbkOkCi2yX9Wy4hgK/R6sbt+Q=
X-Gm-Gg: ASbGncuAhztf7xcFYQRDFvEwvSLvXFXcs+kmp+GIPJMZ94ow6XmJZ3XxCRfD6Bo4ZrE
 WH0sjYT3ZqU26+c2WGmoJRgE2piuN6/c7ca4gWi7Z2Hp9WEYYMY2mlLUH0xWlp6qxy4A5wvXlgY
 reCnWm1OE1jYEbSNUjSWQfhmjkCTBIZ4dmKWQBRT8W+2Jgk7r8KpHHFiDl0nNlGuR8bWeHH1BIY
 9M9bqgUc5I15265uBm7xc7JmPV8Bd6QOBJDbtDUQjPx0tNfRVxVDnveDNwBhXbHyIucCXCExcCg
 3xQa6QV3cF1Aawsi0oWQhjDFIVw=
X-Google-Smtp-Source: AGHT+IFDgbl8wGVpble5Zv0abCqTht8o2Ov+/uOG64czyzOx5fpcCwEyGABd1B3TPwQLwmivIDhgfQ==
X-Received: by 2002:a05:600c:4f8e:b0:434:a7e3:db5c with SMTP id
 5b1f17b1804b1-43924989dbbmr123507065e9.11.1739173973845; 
 Sun, 09 Feb 2025 23:52:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc565d62dsm10287702f8f.93.2025.02.09.23.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 23:52:53 -0800 (PST)
Date: Mon, 10 Feb 2025 08:52:51 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Hector Martin <marcan@marcan.st>, Simona Vetter <simona@ffwll.ch>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z6mwU1Yiy-PQ4lXb@phenom.ffwll.local>
Mail-Followup-To: Hector Martin <marcan@marcan.st>,
 Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20250130154646.GA2298732@nvidia.com>
 <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <4c143b85-063a-4413-a6ca-e9d80e26da96@marcan.st>
 <c5a49bcb-45cf-4295-80e0-c4b07083df00@marcan.st>
 <Z6YPfsDSNdRUskvp@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6YPfsDSNdRUskvp@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.11-amd64
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

On Fri, Feb 07, 2025 at 02:49:50PM +0100, Simona Vetter wrote:
> When you're that harmful with your calling out, eventually I'm going to be
> fed up, and you get a live round shot across your bow. And if that then
> causes you to ragequit, because you can't actually deal with the heat
> you've been dishing out coming back around the corner:
> 
> Fuck off.

With some sleep, a w/e and slightly less ill temper: As I'd say in Swiss
German, this was suboptimal wording. Or in plain English, a disaster, I
screwed up.

I do not rescind the sentiment I expressed though. I cannot stand people
who punch where they're stronger, and eschew conflict and fold the moment
someone hits back.

> Or as Dave Airlie put it upthread in this conversation:
> 
> "Being toxic on the right side of an argument is still toxic, [...]"

The irony has not entirely escaped me. Oh well.

Remorsefully, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
