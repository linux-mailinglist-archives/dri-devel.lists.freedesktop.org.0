Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06787AF9B2E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 21:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6868410EA6B;
	Fri,  4 Jul 2025 19:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lM8Sk+FN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCC910EA6B;
 Fri,  4 Jul 2025 19:39:08 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-32b78b5aa39so12429721fa.1; 
 Fri, 04 Jul 2025 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751657947; x=1752262747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q6BEyCDqiSgiBGBJ1ZkhyuwdBxeuGxHXg+GwZGubRJQ=;
 b=lM8Sk+FNBfG+OmNV9nL1GZgvbtozgBmZ2B5FrznMhJkr2ynu9L27WvR/U+08l0keMJ
 NgE0XU5jE7BCX0q2nvNcKIaJWIir6M5MwkW2a7zJ5OBbvSkDFOroTYE9Hor7+ugH/Lcx
 5OB1u5y/nGYeZ1zkmsX85ZVLfF9nJs0+SQmZ06sNssBLpSgR/NBtqbdJ1yeqVuZWWPBh
 BHMj6ABKJMzwyohW95Y3sobINfif8nvscJqNCop5uW2IKNSDMgrViB5RHITC5sJ8L4PG
 jZUSFuwaUp3O1+Q/wwhcB7JvXsUVIhIAFsdrrwSIqUo28DbyvERdU2e/OhWNTPVKk/ww
 7rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751657947; x=1752262747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q6BEyCDqiSgiBGBJ1ZkhyuwdBxeuGxHXg+GwZGubRJQ=;
 b=aaSJf3y1neNxubaD74BM7bCCe++OIMjqu20LfTdI+/EU6R0rxypzwIoRwBVI1orVVi
 Dfu3ioCub3XWsbGvN1VdpYlpdO8/WtgFAL9a6rDG3Ib30fxCp3jdkT+ukbpTVKmcM9z3
 quVgbIrqWNF33zt5UhDGRkhJzu3qnnWg+7tNIPQbIdrdeSl6UYxY7ctoXLxxuhK7nSTa
 LiJN4vk3JxhY9ouveahg8pXQIf6lMs+XXGXXOAlGsEpdUlmp8g+4b9CL4K2pVZo1rDhG
 XlS3DSf6j3j2YuCvD1THTY/oBeLnuL7AP1iBqGkBhdLEBc6NTAJTQO8CwBiVxhCfqor/
 Cagg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUtbu1koLM+QTu8e3j3h1uHNU7PlBx+NoyJ+02qCKk0CVH9sjR0VQTj7KkljmwbU3Jytu+Z4JQJrM=@lists.freedesktop.org,
 AJvYcCX3xriUxWuXX+GEjF72tek8HHoocED6/7x41WvAt9ZSdK1VN/BqgDg0YnLYc9klUaqRsfmE12n06Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2H9ZhwRLUv5KKF2RpJUFqZjRnGoXZCUQZBwfTLwMK7TM52bRN
 mHEgW/4yAtRvS7IEuXFsVR+4yL0l8JtqLe0k48lsmDgiVg4UZkDZD27PHkWFnhqNicAAygGm33W
 elIIcHth1f6gn6yXk+ZbckBLm0JY9ePM=
X-Gm-Gg: ASbGncswuJyrtHFV24/+2dhmHmgbFeJk62l/+i0CY4kXCf/4ufVgfCAp0hscK2i6eMJ
 iW7hZUkmQtkopXKenyWNST+GJ2GhsTZrd6CerLL1ZmKgp4AqpTInWce7/Iph6N9t3KxFsJLHxO1
 wtu/mcctsLCZ1pEFO/QJfmHpPBpSzPt73Ej4BlKZ0R7Pd6P6xd1v45L9Kmpd/Sgnrxr+I1kaoPG
 8b1MQ==
X-Google-Smtp-Source: AGHT+IELI7uW8JvZwN3QEoftXB7GsVNoqVv/ET67tZt2kJkg2u9kQKOlY5/6R0W6vFvmdwe3YBxK7+LcpnDSocUkLi4=
X-Received: by 2002:a2e:a554:0:b0:32b:43a3:68a1 with SMTP id
 38308e7fff4ca-32efb0afa55mr11642311fa.0.1751657946651; Fri, 04 Jul 2025
 12:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-4-29f7d3eb97a6@gmail.com>
 <DB3AGL1QO4M4.2HANWHX9TF9WN@kernel.org>
In-Reply-To: <DB3AGL1QO4M4.2HANWHX9TF9WN@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Jul 2025 15:38:30 -0400
X-Gm-Features: Ac12FXwvxhLPYgvBPM4F9xT26zkuHTZMocL5-5BvcjZhSL1NesztAaUplyK7LaY
Message-ID: <CAJ-ks9kcW8PzUWPmwo-WQ1dJTgoXTvY6G8UppsLKehf9O0bUqQ@mail.gmail.com>
Subject: Re: [PATCH v13 4/5] rust: replace `kernel::c_str!` with C-Strings
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
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
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

On Fri, Jul 4, 2025 at 9:01=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> > C-String literals were added in Rust 1.77. Replace instances of
> > `kernel::c_str!` with C-String literals where possible and rename
> > `kernel::c_str!` to `str_to_cstr!` to clarify its intended use.
>
> These two things can also be split? And it should also be possible to do
> this by-subsystem, right?

Yes.
