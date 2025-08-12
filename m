Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD48B23948
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 21:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF90D10E137;
	Tue, 12 Aug 2025 19:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JbMH8MTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A4E10E137
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 19:52:57 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-24050da1b9eso5307385ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 12:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755028377; x=1755633177; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/aLjDLfTvyKnPGOQdgq0rcqlXVBr/0vWvH6zLMPvLs=;
 b=JbMH8MThIJzrnzLh36rJiOqhTTW92g69WBHkxug3+UScQcNLHt+pdOf0kzc8UQ39wh
 giocWRfcMXTgGIDjL+UCZ6O/HvpXyF/qANZmQtbhhQ45e39VacSH3oPcplw9lzNiWqqu
 KSwzrsDKhCUsHC5jBHcYRnKnDdZyK4vBKw4fGyw7eXtoqQGgL5FtJQ+cIeKI3HfC8C4x
 QD9pHV41Zi+4nC+s4ZI/MkUO30Sr1c08bNRsuYle1f/sjzYTQYbzkjyzDd94W919an+q
 vpk9C/710Lt0arbg86vmo6zBOz0KO0XJo0RXqfuaJJqYpvJMLo5bqqyaid8E1qWw8FuB
 E6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755028377; x=1755633177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/aLjDLfTvyKnPGOQdgq0rcqlXVBr/0vWvH6zLMPvLs=;
 b=laYQYtBJ7/MEUir/75/HU4JSEL14rA55K5m4u3dGP87MW5yMYm0lwdQJ6hRy4y1Izx
 0ZhQeYZUauOJ8zfu7w1URvGbAgdEt+CbmhB7T+w9NXOZaOyv4WNXIHlUOk58AN+Xi3LC
 JiE7NGcX2xNmeLeyHIiskFqa4zN7P0d0OzX7lX0qEDb72RbPdFYrIvW720nLaGNUy7Bu
 NzCdbDGtAsQSDf6GHsQu6B9y1trVnGHe9jDRFwVRIv1679Wcq57YnGB6zjuYNqqf2t6w
 ZftEHagmLF3GBrWYcXDIIPoRAGvIb6Z/wctEhuFaJoI4K+jgy/+JiRSz8qsd9Ak7lyaH
 JKHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuMx0reKtKDW6BonlEP/TdZmZEvCuziNie6Ec3OLLxAdFHax9R1GtUv+240TuZJ7UpVGH9FNL7q0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgVLuFZA1MejpXDXBbO8Jzjy1VDrFrW2nBnIjqsXZt2D+S+m/C
 TFKKQDEzd8R1XSsHyfG2OAyL6Nx0I8Wp0Sggk7sD+a4F00wjdbmYrsarxGOoScDjSPVGvxckIu5
 QApCiYSKVcljiUZIeN8+K21U60EO69vs=
X-Gm-Gg: ASbGncviRtQTcIkvG1gbTWyxDDPQNTmX+ociEePb7D06xbML8CzICockLKK3Bg7t5sW
 kpajrWHg++eM0JPHtW1QEzZiPFoWYtzDW4VUR41mN0Jc6ZH9OCdG3ZvB9ckavVldG+HPI8HR5rz
 0813IttFJMUmFZ89/uGkwYhcz0JBUGZic6QdKNgnha/THaWW4EAHyWDI1cyEPVlYYib+qL6p/+f
 ++EO7DI
X-Google-Smtp-Source: AGHT+IGp2dikV2vxjvTnzDsMEmpfe17vDuKqbKTf/CZzTpQPjGrvZF5vqCTO61EiCku5j1w4GqjR19wPBunrAjI29rI=
X-Received: by 2002:a17:902:ea0c:b0:240:729c:a022 with SMTP id
 d9443c01a7336-2430d32b8a7mr2923825ad.11.1755028377016; Tue, 12 Aug 2025
 12:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-2-dakr@kernel.org>
In-Reply-To: <20250731154919.4132-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 21:52:44 +0200
X-Gm-Features: Ac12FXwx1OhTXBSqNTxWMSI4678VquyiqAavjpkw2PB14JZbF78QjVQ8X5t3gEY
Message-ID: <CANiq72mWVmso1yMYGYih-NDwjB9E1iVE=_oSpPiSvqTu5mkE0g@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: alloc: replace aligned_size() with
 Kmalloc::aligned_layout()
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
 tmgross@umich.edu, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
> aligned_size() dates back to when Rust did support kmalloc() only, but
> is now used in ReallocFunc::call() and hence for all allocators.
>
> However, the additional padding applied by aligned_size() is only
> required by the kmalloc() allocator backend.
>
> Hence, replace aligned_size() with Kmalloc::aligned_layout() and use it
> for the affected allocators, i.e. kmalloc() and kvmalloc(), only.
>
> While at it, make Kmalloc::aligned_layout() public, such that Rust
> abstractions, which have to call subsystem specific kmalloc() based
> allocation primitives directly, can make use of it.
>
> Fixes: 8a799831fc63 ("rust: alloc: implement `ReallocFunc`")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Did this need Cc: stable or was it skipped since it is just extra padding?

(i.e. not sure what you usually do for DRM, but I was looking at this
since it is alloc since I would normally pick it.)

Thanks!

Cheers,
Miguel
