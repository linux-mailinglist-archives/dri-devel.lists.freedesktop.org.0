Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF4FAC671B
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 12:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C870A10E5E7;
	Wed, 28 May 2025 10:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TD9gTz+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A020C10E202
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 10:38:05 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3a4dde7eec6so1807506f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 03:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748428684; x=1749033484;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IeeR9yH0GpAyOFZydrFxToBZKNrKT1e0eUyjOqJKqG0=;
 b=TD9gTz+qERgHmlhnORovKbQKPmsi167OFCEf7GNgKLTzC7+m2x1K2QnnzKx7Mtbkfb
 TSg2/ug8Jre2RpxwStX/VseEqGL/R9hV3b2ZXyFErcbefsMmPtyYY9v7ne43EUVFbQWc
 izihSuGk7pSSmbUYFAwDMzcjsp0nQdaacPeN09kQfqpFdNtcwvCxFXvQgSDE/kOUdek1
 SP8Xz0MijR8MRrgIcdMoq4w93Gc0nAPvR01NNu/cwy6wX2rTQYVXU85VtzNKEQIrEAqI
 YQlJwmE/eNxNKJvnalesjVtH2EHGxIhFfSwnZZ3d9drFCIme9koiWIpTazTzapTmGYQS
 VjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428684; x=1749033484;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IeeR9yH0GpAyOFZydrFxToBZKNrKT1e0eUyjOqJKqG0=;
 b=TYZg/1t6lDYdd/ULboJ9hq5rNtL8FZeJm+JrUzN7jXLQxBPNtk7KNHw0VpmzkVSrsg
 ZFbtMRgoJvEINzntnV7u44Py3/g15ieoWe4ZXWbXTUrlPN0C1WRfj8V2+jLLYiX/tKxb
 Xmv4Z/6kRic5fuzcfbDbDOijUZX4S4CqLPiIAWjsTN0h68PHtZOQLiYIGUe4JcS79MFJ
 /nMecCEXreFw4fJnBlBeWCapfTqB7ZRV2ot0RbFR0qoJmtkVgmDJL5f8Sr2j27/SGtCS
 BGjzv4CzBrrnIDOwh614APnWbTQL2WKzYLT2G/znHjF6Zjd/EUurJzavbQfN543mFw8J
 7ftg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt6usPaDBCq7sRHobXRSGcUwPae64eNNQ3fIyKxnEZFlR0D7d+MoJsBfyvZlTCllBhkOC0IUhcr/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeefWPdSH1GBNnU+vi88Gbq3CGuidbk1LdOaCe5UK+pQg+5bT1
 64ccPXrMpFYrxvErBVO+DpCtnzR9hqHwl4v4KvgtDpfkKZ08M1Gm9pZH3MNPr8hsllOV7OeTzOs
 T/MB8ylhQQC9/GC7puw==
X-Google-Smtp-Source: AGHT+IEQyiB/rjNjbMrROAYgPHAOQltkjwgoUsDbxSNhCEmiFFBD4KxkcRnm6cL1n1mzqucg+R5Lc+Nr+C90dyo=
X-Received: from wmbdv21.prod.google.com
 ([2002:a05:600c:6215:b0:450:5dbe:5f11])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f8b:0:b0:3a4:c95f:c1d1 with SMTP id
 ffacd0b85a97d-3a4cb428313mr13345804f8f.4.1748428683991; 
 Wed, 28 May 2025 03:38:03 -0700 (PDT)
Date: Wed, 28 May 2025 10:38:01 +0000
In-Reply-To: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
Mime-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
Message-ID: <aDbniZzL1ZOSnfVi@google.com>
Subject: Re: [PATCH v10 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>,
 Benno Lossin <lossin@kernel.org>, 
 "Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org
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

On Sat, May 24, 2025 at 04:33:00PM -0400, Tamir Duberstein wrote:
> This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> have omitted Co-authored tags, as the end result is quite different.
> 
> Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Overall LGTM, thanks! Left a few comments on individual patches, but I
can probably give a RB when those a fixed. :)

Alice
