Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E4B17EFD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A5D10E302;
	Fri,  1 Aug 2025 09:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LARUAiPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D639610E302
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:14:55 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3b78a034d25so1443389f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754039694; x=1754644494;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IpQjiOjYgpF0fuxQTSWWz9JedYu06n/jjylXo74pt70=;
 b=LARUAiPt0nC3/jkWy54twylalIW8WJmbWfUVXMcDJ0oxwHp28FeXFUzOrQ+VbXMPg7
 L+wAmi7qsM0Y7EVWs4P69eVN4K2BCR6KcijoYh1zvGCvv5m3vAYFaCl6lIEb9aAvuTKJ
 KStQ+Ey2QaHRhFGlyEelsKYfHEmMjk21AJaTDwj7WLVz/JyiNX/jXZzSyLLNWYfOCaIZ
 I9UZ5q7Nut1lut2WTW237TBwbGmh9FBF7uOGiF9KmzNn4pBKDK+h/uV6NIg8JW6jx/hZ
 u1A6o+/j3HIXsx3xhJZf8n7Y4zB8efXp7DZg9pIbf1gFR+gnjuC8KhneqPb/vhvynQuq
 tXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754039694; x=1754644494;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IpQjiOjYgpF0fuxQTSWWz9JedYu06n/jjylXo74pt70=;
 b=TUeoCsH8KPdI1ebqS3BV7VutBAVx15g9cQaljYd/ClUjWtG/GtJ6LWfN70ngSkwwnb
 gMXxUVFuTKYhAfN5GLyXVLgJNxpb8Gw8BsSLpSEhrvXZ9V9XZ2FNGBeQ+Nlj8hIwCwdU
 GodOMWo/cXO4WAAdSpjwehbmPj4fZIYfjE39JlegskKrVImGnW+D7Nqi0nLzI67/5+2V
 /6vV2k2RmxtHSmvW9RPaHhLQtSXJTLrkxQDq9Cjp3cy2gfI3VPeZGXy+T2jOJmQQs/j3
 EovI8VRCvBuLn2lDkYU1thy0UfCOwxzQlZE1sN1ADIv6XSqt0m5MH1VPRolxCIDqHDyH
 Ac2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF5ivFOyZwpkA6LJoSdNGuVtrRrPlROd7z4Lc8GE5H5LzAB2iXLNbEtkKPoo/d/QE/aG28JRE7sxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxt8kogS2E5F3C9EQ+0sJuZaac0s+FtqeqKkx3U3JTKJ9HsXfRe
 8JuGgNxRJuGATH6LfR7bi+LHpedo1Y5RI8nrer0Q0+xKpCbMPwVUQmR19YSstZM/DYSR2AR4m+F
 b41CZTDgJanSJTgrdWA==
X-Google-Smtp-Source: AGHT+IESDRZCEwF7SL8d5dASeF7/YHXUd7DUV9ClWEwuYXtRvBgcLkdVZT/KeZok9+iJf2HhJER5jHKLA9aDBQY=
X-Received: from wmbhj23.prod.google.com
 ([2002:a05:600c:5297:b0:456:21f4:7a98])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2907:b0:3b8:893f:a184 with SMTP id
 ffacd0b85a97d-3b8893fa74bmr4215393f8f.52.1754039694365; 
 Fri, 01 Aug 2025 02:14:54 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:14:53 +0000
In-Reply-To: <20250731154919.4132-2-dakr@kernel.org>
Mime-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-2-dakr@kernel.org>
Message-ID: <aIyFjU67jPkK1BUt@google.com>
Subject: Re: [PATCH 1/4] rust: alloc: replace aligned_size() with
 Kmalloc::aligned_layout()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 31, 2025 at 05:48:06PM +0200, Danilo Krummrich wrote:
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

I guess vmalloc handles alignment in a different way ... ok makes sense
to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
