Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E8B47A89
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 12:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965A210E0DC;
	Sun,  7 Sep 2025 10:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SQQK5O5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3267210E0DC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 10:54:39 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3e1260394dcso1713997f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 03:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757242477; x=1757847277;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Fm92e08KH4OnBIzsiipqMiydD9ZOdg2vH6XrUgmumFg=;
 b=SQQK5O5vMhk2R9EtVWmdp5toeysBF8dj5v+kH5Izct2GOfIOy+iqzE4pjak2tslbna
 QTPqVlmtpCgBPoFTAMlzqZSFIdGrFEnle5rc1QoHQlhjwrgPxghmosLKkmy2FbEnRiIx
 uLxCDIt3gDjAkjm9j7X1170Kafrt0GBB/m4GQbI7dq/YWNgUfhQjVcC3jxTLf1fVcPN+
 j1cbkaVQWfSv9NiYxs47i1q7b9vAJ0F8ejjBtcQHED6WwMGAr8RSJNMD8DbAb6x6eAQT
 METJJQl8FDwgcGlzWLA+ClnQSVpPDk3bRq1QTVEoHjOiRC1HmDfis3hlFg6cfjz0uUvl
 cwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757242477; x=1757847277;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fm92e08KH4OnBIzsiipqMiydD9ZOdg2vH6XrUgmumFg=;
 b=Ym9v627Phkf4zmu6zPkJfJGX6d88ukJHdoiLvNqkXRdDFcA7I5g5lfUUYPhUeuZmky
 jyx5Q0cmBBHOy2qoK6IL8cyHD3DanKdV3uubvgWnZDJQDUCX1oVuof0OuSaOdgZ2j5Dm
 1TOjCyC/Sedyw7+2mY/KREGerJpqzXUFRr4/uFByU6YuKRk3q0hgR1r4LObRvizrvYTp
 CA6OzJ9S4s+77sZH9ymaK0m/G1E+7NPhEKUf8urrck2lUiLi+Qgjm5zM3HweNK2Lbj6E
 Ks+rO3fYyex1E03lco7xHlQR0YJw/gyB3uJ0fL4lkCCP8ep5ozDUj/2zrnqQWoyFxQF/
 5l5w==
X-Gm-Message-State: AOJu0Ywp5ezXVLLzcOWBa32KqZNDrVeJNN56G7aDkhVrmnwuKbI4K8ot
 PkpDYcqdAliVWUPMgD95S7OLnRdUcq0xBzDh7GP9obacdsNdz+kZZu0Gw3zeN732AVCTYhdLowe
 wVI7HuA7CvE3fJ9kKeQ==
X-Google-Smtp-Source: AGHT+IGwczkNJ4NDT8jycdLKjKbJyfREabPo6DFwIEEwqw+DK/OSgFh7CarHw7NidqX/vyfwf7K8GuXRp9GGNlE=
X-Received: from wmbdq15.prod.google.com
 ([2002:a05:600c:64cf:b0:45b:81de:b730])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584e:0:b0:3e5:2d1d:3a2b with SMTP id
 ffacd0b85a97d-3e64bde928bmr2809860f8f.39.1757242477540; 
 Sun, 07 Sep 2025 03:54:37 -0700 (PDT)
Date: Sun, 7 Sep 2025 10:54:36 +0000
In-Reply-To: <20250827082015.959430-5-apopple@nvidia.com>
Mime-Version: 1.0
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-5-apopple@nvidia.com>
Message-ID: <aL1kbG0YYy0FQCGM@google.com>
Subject: Re: [PATCH 04/10] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
From: Alice Ryhl <aliceryhl@google.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
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

On Wed, Aug 27, 2025 at 06:20:01PM +1000, Alistair Popple wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
> 
> A data structure that can be used to write across multiple slices which
> may be out of order in memory. This lets SBuffer user correctly and
> safely write out of memory order, without error-prone tracking of
> pointers/offsets.
> 
>  let mut buf1 = [0u8; 3];
>  let mut buf2 = [0u8; 5];
>  let mut sbuffer = SBuffer::new([&mut buf1[..], &mut buf2[..]]);
> 
>  let data = b"hellowo";
>  let result = sbuffer.write(data);
> 
> An internal conversion of gsp.rs to use this resulted in a nice -ve delta:
> gsp.rs: 37 insertions(+), 99 deletions(-)
> 
> Co-developed-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

This seems like duplication of the logic in rust/kernel/iov_iter.rs [1].

Alice

[1]: https://lore.kernel.org/r/20250822-iov-iter-v5-0-6ce4819c2977@google.com
