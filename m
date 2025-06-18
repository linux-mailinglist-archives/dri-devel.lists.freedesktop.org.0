Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C209ADF2D9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 18:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F8B10E8E2;
	Wed, 18 Jun 2025 16:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DC88gEaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20EE10E8EB;
 Wed, 18 Jun 2025 16:46:10 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-313dc7be67aso951738a91.0; 
 Wed, 18 Jun 2025 09:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750265170; x=1750869970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWzALV9LPqlus+Az62QmQW8i9ILqyK/dHFh5EdSLL0k=;
 b=DC88gEaz4FbljrHpFPJ4FydAjhly7JsrzavqICNFEqj7kzpfDdUfPIhcURbWNC0j3T
 jit+1jyN+PzFE0A7Pgfh15vY55HQKndEqrWxdDbmnsOHhqZmxzqRrTACqPt0OLGyeGbs
 cEgQ6bun2PYdtdqmpCqNxJ0YKTLQY2QxZgjMh9kS9dTSLfjPCwB23fDdqc0cXGL10n7J
 kedvnkO2gj1ri1HYahxUVTU/LQ21xdGcUm7w3abuiakngejKbfwMJqXFlxdXsw4LSOj/
 PIwN1S+Tw154IadEPdlK/E4QEIJqbeEV/22pcudLkRYzXXy8loPyY6mGkvk1JKg8LbpN
 p4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750265170; x=1750869970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWzALV9LPqlus+Az62QmQW8i9ILqyK/dHFh5EdSLL0k=;
 b=tuRRjninHeyXx8pqLO61utPwUNdmHXFedBkJcYQD3SpKD+6YHUjYYe/6rh9t5DjXRG
 un6hjEnkUJOvz6VJ5HUeJjX5oeep6xjSA9Liz8yCKxGUbvbdC+MxoFD8sbyf/tUZsSjs
 N7TBJ10oxD7tgUBcuWKeXlESz4ENiDMklkzAclT3B8D/eQKb8WIO0tPyUY1mLN0UvkwI
 s4BDQ/RiLlogCbKP7IF+9NIfmcd18XdGKJt1ICz32YF3rbQ9+JYH2a6oWHTAzqRs5Jr0
 YnXkbi7Xi4AxYDJTL3xPKVW4Y6rhEbWObxj9fJeZSuKpdkCPyzg0NXLf72b5gGg3zG4K
 p/qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlMShWEvIQ7n3OV550IvtF1sK8u5Re8SQNQ7gImN3zMMgTXgtM4vtxIWeaM8GsiboIh+vD32h5qw==@lists.freedesktop.org,
 AJvYcCWcn0BUmso/XB2HKW2j2QBnEDni4OvIomkdd5fsQnA8WrNOnXdRFy7pxrNeairsdj2aB0J0RGNPgfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfZ0OoQ94ULsp4D+V5RItfYS15Rnf4I9ApZT3jmN754lzHXIKN
 82lLgsaoZOP7zFOO6xTeW2J4UYeMCtHoq4Bo9vIfZPuXpnaXwuhZfCs+HuQOYRdox79jR9b/L1k
 xIQ70SYy7G9RdjLBcyGbGmvkr3NHN0NY=
X-Gm-Gg: ASbGncvL6Ti7MI5l2x37eRW6St2kWV/mKEQ33n/GOVv3Cln/cg4f2KJU8V6E4jfHoGV
 br+Xnl4wfZdGk4Cw6aOYzDqKKpQLeE1NxPZ1tOYJcHX5MHGB9l1YMKU3whRWUTej6uL6EuUfZqv
 ERE5HCLMzSmHP7o1/hktJmr0y1W0xGK/HL0IH0VqFP1UI=
X-Google-Smtp-Source: AGHT+IH4x/Zjj/Cn6AIOjbJXWQhaDWLSiy8g/xgpU0nYUpfFSqLNbZ8aoqW6DTm7BekXvLqQRHOksCgncGYgycyl5qg=
X-Received: by 2002:a17:90b:2dcd:b0:312:e9d:3fff with SMTP id
 98e67ed59e1d1-3158bb43769mr25041a91.1.1750265170069; Wed, 18 Jun 2025
 09:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
 <CAJ-ks9=6RSaLmNmDBv-TzJfGF8WzEi9Vd-s=1wyqBcF7_f7qQQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9=6RSaLmNmDBv-TzJfGF8WzEi9Vd-s=1wyqBcF7_f7qQQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 18:45:56 +0200
X-Gm-Features: Ac12FXwfspeQ5n1WfjhtITwDVCEc5U5DXhUfzAvB1x6rILKw_9XGVLNl3gdX3Es
Message-ID: <CANiq72kgnKH2SSp76EdPeysExBWasqhTyf1JyReR65g6FMsidA@mail.gmail.com>
Subject: Re: [PATCH v12 1/6] rust: enable `clippy::ptr_as_ptr` lint
To: Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, David Gow <davidgow@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Wed, Jun 18, 2025 at 3:54=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> @Andreas Hindborg could you please have a look for configfs?
>
> @Rafael J. Wysocki @Viresh Kumar could you please have a look for cpufreq=
?

Thanks Tamir.

Christian, Danilo, David, Greg, Tejun: It would also be nice to get
Acked-by's for your bits. Thanks!

Cheers,
Miguel
