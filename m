Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11214B1A401
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BC810E362;
	Mon,  4 Aug 2025 14:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iQ5PsSPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E97C10E362
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 14:01:02 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so2552099f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754316061; x=1754920861;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHAJM8FSmnytalA1wMLubAZ/HMmqzJD/2hbTKluoKzQ=;
 b=iQ5PsSPiuc4vFB/G0f6UW351b+d4+nh/NuAvMYETguo5g/TtDQs2kfBRCgeeORzOkz
 eIWdI+o+PE4gOu2osIvoRs+9eTor/XDfT8cpeCm7EOHXZg7RYnw4jTWlglDvR6rgzWg2
 v95mt7r2+GzBpEALL8+MthM2U+kjleB152/Rq9uTEWeOMwC37mXC2IfjvTyE1WGaBKAU
 GFOcPMM9+ZWwlijzgjH4/O9CCGMdWEnCrTqNH3Kpfu/3Z4F9FRmhPx7ViDfyEiJovt+L
 p4sHKWwAw2Ytk4hJDKVSURkWe+cm4s30IfSFAwj92f2P0GaSaBbP2VgY0m9HSHc66KI9
 q1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754316061; x=1754920861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHAJM8FSmnytalA1wMLubAZ/HMmqzJD/2hbTKluoKzQ=;
 b=RlCxSGDhhRndOel0GCBVMcP/I9AMoulmYYjXzvGYNV2XEmYd1sPdyx+jRhNSGiCGot
 rqDrVwqho4m6/Z0nflTI8VTervYbsEx87Ry6muoRN9S2rc6CggppvJJ2B4/e/8Vs09SI
 XFHXPyOKKIcIDQbVzg8roD+We/o1/ohZCh6rmPmCtqj79STbxUxnEOC7PHuRpBqhY1cS
 fYgxov/B2kvVQP7kup9cHAuRi5LiqDCecYrcXlQ0+L138K1Z4ZoaV3UicacbUSOIOPN+
 nZwLE140nI9XAqeJqxE4bYj7a+fX/zX+nVbQzJIo0I4xrLLN8GpqRPrAiVmhdQQAmNTP
 Fi/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9RUB7xkwT+cOq00rWcXqGBCernO81XXo3RSljolfZ6f1KTq3cjRC5te2FJKBR2sNq/QClELm8FTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrvELZgRLw1mYH2J0Rt6+bp3yePBsVFonLcyoJko/Pg0WzN6fE
 TFSNIgc5rtQqvlugUEBolrNpEYsjLbuzX5wZ5I6/fVYjXc8N8bNoysP9uaQrtDnTMmLpKxp8Zom
 Ku+BAFhH7Ah3iNshTNhvAFyWxHXtYVhrsJewYRwxV
X-Gm-Gg: ASbGncu9i4HUa3fJlxPF04gWbtKwOXnryTJ24dyyZRZSN0d/xXOIMfCXdiOZ95F890b
 AMVQvdew6RPkPrKOmg8DGmdy6kwP8QVPtwSu24R25Ei1R4tlHWhR6phdYuoTOEpqva8rqOlMmk6
 BbWuuusHWWrMxjwtZGac/Km0nWIKPbg5it6nPUicRMkZHmfj5EA2agRvBtVikwSb+L18Yh7nEhP
 Z6U9icBfcRNRR+aiUl6dGprbfYbcG3Z95CY
X-Google-Smtp-Source: AGHT+IFUU2uJR3FAMs1rzBe7h/KQbUHKICBqcp27KBBBta/zTdWvcJkLu5KQlclilix6YlZPh1K/rMJS83c3Dckdneg=
X-Received: by 2002:a05:6000:4305:b0:3b8:12a6:36b8 with SMTP id
 ffacd0b85a97d-3b8d94c1dc1mr7155506f8f.46.1754316060342; Mon, 04 Aug 2025
 07:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-3-dakr@kernel.org>
In-Reply-To: <20250731154919.4132-3-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 4 Aug 2025 16:00:48 +0200
X-Gm-Features: Ac12FXwPaFFtfKIfOtRFAm4bgGywLjC6Y0YkcsOWje9_NdO2yRdOYYS_hnAnRbE
Message-ID: <CAH5fLgh6x9FYdURedJJSB1nm9n7=HA7aK3Y741P=1g7cLKEQOg@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: drm: ensure kmalloc() compatible Layout
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 31, 2025 at 5:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> drm::Device is allocated through __drm_dev_alloc() (which uses
> kmalloc()) and the driver private data, <T as drm::Driver>::Data, is
> initialized in-place.
>
> Due to the order of fields in drm::Device
>
>   pub struct Device<T: drm::Driver> {
>      dev: Opaque<bindings::drm_device>,
>      data: T::Data,
>   }
>
> even with an arbitrary large alignment requirement of T::Data it can't
> happen that the size of Device is smaller than its alignment requirement.
>
> However, let's not rely on this subtle circumstance and create a proper
> kmalloc() compatible Layout.
>
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
