Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91101AF8299
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19D410E8F4;
	Thu,  3 Jul 2025 21:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="zLum9vzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B5810E8F4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 21:26:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso3363405e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 14:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1751577989; x=1752182789;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcScF2Li2iE+rzeQj24dXvUmzs1FWMrT/HfRy4nr7Co=;
 b=zLum9vzPQGEGxV7pR0lMS4BOohT0G/Tag9V+3b+jdJ4pHzu37LS1P4pK0icsfyO6Pd
 J6cDvHTGInI65CtuKMjGDl+6u9KaMy6fsi81GGpIMPL+cOemLWd2xyacbBdyuROeCKKN
 xPtrHLrxXPdDYOWuhAaki11EBJ16nj68ji0IIEBRaJvhJjDAdAy7Qu0jfadnrNMIER2W
 h7ztbquy49fZdaY/cv4ZSN69ehxGsMKrKQEPa8IkBQ1ccjGz0TtHN7UJxws/nux1fgHw
 3v3H5Ib6qMseSJ6aLajhwmuX9pc9V3dTocx93lJDxNcT0+6U5oROhDp8lsZJzQhgjrs3
 O2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751577989; x=1752182789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fcScF2Li2iE+rzeQj24dXvUmzs1FWMrT/HfRy4nr7Co=;
 b=N80FlJJiym3ksYTPPCU/Xftu++0Yo2UlmxJMADytv0Gx/8/YjtcsX91Out8wcZJ6cS
 4FYT3B3iUBbckqlKxPDpLRNQyuqxb41MVfpYQ8GDfBnhgCStw0KmOkIMx9MBeWTbOL58
 cUsJBSEdO524y4kWQtIIDdQ9m1ryoOeTSAiPY8AjMVHTysaJfMokRxwH7J/UM4ghXyTz
 6aoF3xFTU6FzEFkMRohlfvWSWEqQSOwpOwtdyla3TxJ5iCEUAlTE4yxIQK8tb0YRdO5h
 6vhkUY+P+HWJyEcvYA2rBMvS1Jy0VVRJ5KL5jnCI+CT6HJ7z6ZfppqgPgPqCIGYXRxrX
 oywg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUujCMmzs8bF95lEPdx3veXwwIL6NftGYeD9xyrMuC64vLqk37b+YWNLFzHqb/fZ4UtJrP5PO3LnDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMFII3nNdVB6IeJX0YVL6hJ6vvhiG7/v8eJyeNomqNCQnWBSNG
 ASjI6hmf7IHvK+zve7OEDVmL39xlitOyvXXaMTvXr9Ngm6zM/zJ825e2A6ssIaaPz3AxLwvJty4
 GRbnoXBrbMHNVTXtc5fqaU9sG/cedMGRi3Xg8/SNe
X-Gm-Gg: ASbGncuO1gDjk+kOXHMFM55TBoLDRmVANlQ2E+ckRWAn8wHeAiRhTSLNL4f/blgnyBC
 42QQUxJNx0Sk0XIvggK8ZpLP5Y65PCCQSiXDi02p27pwXxBCSIHFnnXu/DohsYhRMZ0P083YI6k
 C5nlzywK75T9HVfODdmwcJtdd+lG+Uy4J2IiEOZ5p5rj+2
X-Google-Smtp-Source: AGHT+IG1XAyEUVg2pztxNrKRTh5b09syCpDvfmlq5SM1Ct7agJOSAKKx4USd0rx1a5tClltFn9f3jAuO2suLm6AuLBk=
X-Received: by 2002:a05:600c:8b6f:b0:43c:f44c:72a6 with SMTP id
 5b1f17b1804b1-454b305ac33mr1219305e9.2.1751577988601; Thu, 03 Jul 2025
 14:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250629153747.72536-1-dakr@kernel.org>
In-Reply-To: <20250629153747.72536-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 3 Jul 2025 23:26:15 +0200
X-Gm-Features: Ac12FXyUV-obWXZdLpvBmC6loWxe3pPktRix4vbmOg-M9NjfTWl5JJrUBsohCAM
Message-ID: <CAH5fLgi3muZpf_xPcByEEjVSnXWspmyucVwXGGYQjWn7+7ZoKQ@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: device: drop_in_place() the drm::Device in
 release()
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
 acourbot@nvidia.com, alyssa@rosenzweig.io, lyude@redhat.com, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Sun, Jun 29, 2025 at 5:38=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> In drm::Device::new() we allocate with __drm_dev_alloc() and return an
> ARef<drm::Device>.
>
> When the reference count of the drm::Device falls to zero, the C code
> automatically calls drm_dev_release(), which eventually frees the memory
> allocated in drm::Device::new().
>
> However, due to that, drm::Device::drop() is never called. As a result
> the destructor of the user's private data, i.e. drm::Device::data is
> never called. Hence, fix this by calling drop_in_place() from the DRM
> device's release callback.
>
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
