Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC92AC6B6D
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8727010E5DA;
	Wed, 28 May 2025 14:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jbJ7xGC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C1D10E638;
 Wed, 28 May 2025 14:10:47 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-32a6083ef65so27150231fa.2; 
 Wed, 28 May 2025 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748441446; x=1749046246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SH5cP+3YWmXs8/zc7fXq9BP075bBVMwRnqEHsDoMzq4=;
 b=jbJ7xGC5vt5Oq/SebwGFr6I6CaTYy9vsX1LhiJCVmwCSsU3IoZF1EuyzTBlElNtOxR
 qKzV41qL9y1yxIMxCkaB8AeOF8UTbzO+CrOL9vUtW61rzrrUVFZxQ0JEvc/M6gkEHB80
 DQX9IQQ4n2Uzv/jMghufZreW1+4EWqqA5qoZOb4lQ5suZmxn2bC6Ob9oeWXKxM4gxjUf
 QXI/rYJ86uu4VLx974RACxGCledO/Fhb3hTmxUPQcDsZUOoucLz6796u9hnWVZ8KUMBX
 JN35Sqj2YRx3GDftmBJjk9Cts/pH/3UKHXR1z8/nMDq1cVSgQYVe9wKXkOyIUljsV5Gh
 6z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748441446; x=1749046246;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SH5cP+3YWmXs8/zc7fXq9BP075bBVMwRnqEHsDoMzq4=;
 b=xJTn2uKxGpqyvnpAGjuW8Wn8HNV+p2g5/fo5nkkh65QumMnOWFRZ8vaGPk8MRBuQkb
 RkI2kFbdCNMTBz0JAb6cvQ5gYbOp9eCSkfVF3nr35UoLIcbRb+OCK2Xys8rsw2HgLs0B
 inp/TrMmZUt56u6A1RWoE1kSMiGnbBLqCh+zIRU2Eo//oQIsjLfC6ld6h50Argip2AZ+
 rkzMc0BEoAqxUBEh0VSXaUB1pcQO1EM+gJS7AjuS7f36iJIqnY+dde5iPaDpnxPJyoOG
 uLBvvg//6K9DD/SvIB4KVc3LTOAdV2mACbssynlg/zW7soH1JuElJCbArJLU27lXOhLF
 f7dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmXLVSkgNYSrT+t2aAKNfyLzHPNJ2NeJ75705G6/oNL3AqwlF9KcDj6xvrcCxS50sXFPe1VHkmFyw=@lists.freedesktop.org,
 AJvYcCXaDMBBDArGrwEyvJ6YeSFP15tvCMML14xjsca53rPikR+KwTfJz/MiR32tWTfd476KQk/e6p7cfQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTyvZaSAMfSAp3nlBZ92MWoaxJtvGWA4bfKzZijOlMprmUuGxA
 kJfL43soDfp6+/lYs2knY0wXmEDCcZjpCqQ5s1e2hocn+wJavJbVRNHeZAOTHhHlmRR/P2zjyZB
 3tkADzGSsBtlCUpnxDlsXOrKuWuaSmB4=
X-Gm-Gg: ASbGncvOv0ARr4cfb84gTKEC0zfZKnSFj1XU/bxWbO8GkwpVorEEndAPr1w/kN8SiOY
 ugaV93GBYt73+N2lja5svxyoUOA7Ingi6hS2zQKxv4vUt7xPPAdevPpexmRnLrKAe7foxgZju45
 xbxKXE4P1QTuHLXjNRnezXKmhxfcuf6+nhlnYkyHyEl3QWsGOr
X-Google-Smtp-Source: AGHT+IG3dTRzhOJeaA21sQ8Cl6CUs5QffL1O5Hi46hlWsg6xnHSKewHgYxirdmC8QSEO4fDwgYnRgzhaJUbQ8K+6RKc=
X-Received: by 2002:a05:651c:1469:b0:32a:7122:58cc with SMTP id
 38308e7fff4ca-32a71225a60mr20885251fa.6.1748441445644; Wed, 28 May 2025
 07:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <aDbniZzL1ZOSnfVi@google.com>
In-Reply-To: <aDbniZzL1ZOSnfVi@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 28 May 2025 10:10:09 -0400
X-Gm-Features: AX0GCFtCzkUkdNofO07GNzu_PibpIwzD2C0rC3Syu4m48_lWgFYSC9rhS2sdGcs
Message-ID: <CAJ-ks9mcPd+-tFRuhxVGrYRPFEtJa3nQTdkvTtzLppqitVfaLg@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
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

On Wed, May 28, 2025 at 6:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Sat, May 24, 2025 at 04:33:00PM -0400, Tamir Duberstein wrote:
> > This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> > have omitted Co-authored tags, as the end result is quite different.
> >
> > Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vad=
orovsky@protonmail.com/t/#u [0]
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Overall LGTM, thanks! Left a few comments on individual patches, but I
> can probably give a RB when those a fixed. :)

Thanks for looking! You say a few comments, but I only saw one. Did
some get lost?
