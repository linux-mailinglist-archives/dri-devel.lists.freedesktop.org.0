Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58BFAF9B25
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 21:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492BE10EA6F;
	Fri,  4 Jul 2025 19:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="co4RHL4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AE210EA6F;
 Fri,  4 Jul 2025 19:38:49 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-32b78b5aa39so12427991fa.1; 
 Fri, 04 Jul 2025 12:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751657928; x=1752262728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1vlZgumgifEwNecl68EJAlB8Sprq//BvrO4WzNYsMM=;
 b=co4RHL4J4HQvFukPXlwEQT+8IWjOS3EzyB4yzKshxR0MXUTe/21q+CsTkwxW5BhOIR
 OhXbZznbrb4D3tt47kR0UBwifCjZejyFoebWb/7sdLx98cb8FHOaNyOI77WBNu8haJmi
 lqhbZ40rF6PFQHIYy3YiaCGZY9bju/MM3Gxmb9Y38P9hBfrdxnaYTHMSfjZNDwruuyXw
 9PwCfbczUklpGpDUY01UtEysteN4v8Ltokn/A/J8ZsZeLxehrkTNK60Kj91Prq4vEUqR
 4PCQVZX3s/s2VWZiYsAQhGAFCW2XNM7wtSZoa/HRBhhMSPZWnelqH6NXg2MDmRFa+Poq
 c00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751657928; x=1752262728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1vlZgumgifEwNecl68EJAlB8Sprq//BvrO4WzNYsMM=;
 b=jp2/IxR/ES/xchOMXU49sU7YsSG15dJEfnW+jTQ5vwG9mdi7F2DEySHIb7Ze67jbcW
 7cfa/Fxcea1MdxsSdplOYzE6P8hsw4zpARY0jkKbo6dZqZxFTXrbRLMM2QEjZVU0mipQ
 f3hbJktVWZ/obL+pj6Cp2bW+83B1KL3MDUhMCfTaSMdya1ZKVwN5sqv+6UhcuKD0BJIA
 F/Z0ManxNnZqKTps/1y8+KbDegcfivc9Jh9nyQX/o2ZCaDbvUQiNZkxLQEUJH6zicuG6
 YhXQdpz7RMy4tDQq4KrODctHStsnGpniuHqD0836/ybJudiwPBIkV0Dn2omxB18SkmQn
 WZtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGnVUhnYALkedrd2RNiyJAiRio+MnTKIIeZAJsC4HHfrD9y7IfTZqKIYEFFC4ZsEL/vsNnPr4DpPQ=@lists.freedesktop.org,
 AJvYcCWoOfQ2RuIm2e4YMHgFmSS6pelzM9DjSywXTL+gbloT7/2Ag8V9WXR1p3ENKp4JvuxW85tap35s5w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAZGVpIiehC6J/ZZZLAdP/mbNfRIQ9vTDqdPtJhHRu+on8yuZ9
 6Oe4+h6/hxn8PRmNCJVkWdzCfmCo214T00uTbHoV2oMhyBRYXJEJ8JQzN5s3SDJLzsvjg0i6Cnz
 S0WvUJIBwi3O2aj3qD/xt+uOhADVE9/o=
X-Gm-Gg: ASbGncvL5uuB/be4GRs61/N9mYFB+ApjGogCLUZwX+UNccvf8aOwBbtj0KOrxCwVOTU
 m+o+VE2LAi9Suk23LmQ4wZMejRccK5E1WLj91U1ngvkUdjKHhnjFgmGxgKZayY6RUSoQrVAKQW4
 w+ZsMvZomyYledupE0vrtgWPK264+giO1BtuYeSu2om79f9dHz/AKQdq53iOKtLtqDxtH+6484y
 tvc3eBmUS+6lLPH
X-Google-Smtp-Source: AGHT+IEtZIZHyQdOcRcbH+zRF5QnKwCn2iKXPxprHvYuNR2jSg6UqBw9KbMdEWrPUWxqoAE0oN54aToeuNsJtUiGyRY=
X-Received: by 2002:a05:651c:542:b0:32c:a097:4198 with SMTP id
 38308e7fff4ca-32f00c63744mr9980551fa.1.1751657927846; Fri, 04 Jul 2025
 12:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <DB2PIGAQHCJR.3BF8ZHECYH3KB@kernel.org>
 <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
 <CAJ-ks9kNiOgPO7FF3cAbaSNtTWs0_PzQ4k4W0AxjHNFuMJnDcQ@mail.gmail.com>
 <DB36T5JWBL10.2F56EDJ1XKAD0@kernel.org>
 <CAJ-ks9=Jutg+UAwCVER_X91BGxWzmVq=OdStDgLZjTyMQSEX6Q@mail.gmail.com>
 <CANiq72nZhgpbWOD4Evy-qw2J=G=RY4Hsoq9_rj6HGWMQW=2kTw@mail.gmail.com>
In-Reply-To: <CANiq72nZhgpbWOD4Evy-qw2J=G=RY4Hsoq9_rj6HGWMQW=2kTw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Jul 2025 15:38:11 -0400
X-Gm-Features: Ac12FXw768F_Lk3HRxkz7eCyR4EleC6ZiRWgAxdQvNU_x7ZQ7VCNlmwZ-Al3Xv8
Message-ID: <CAJ-ks9m4S1jujQvyt9TOvNMewjNSztps8vayGga+MnNU+0YUcQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
 Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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

On Fri, Jul 4, 2025 at 8:15=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jul 4, 2025 at 1:59=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > That would probably work. We will probably see regressions because we
> > can't just replace `core::fmt` imports with `kernel::fmt`, so new code
> > may appear that uses the former.
>
> That is fine -- it happens all the time with this sort of approach.

OK, with all the splitting requested, this comes out to ~54 patches.
I'll send the first bit (which can go in cycle 0) as v14.
