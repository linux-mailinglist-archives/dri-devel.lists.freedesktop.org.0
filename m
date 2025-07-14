Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF03B0434A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0893610E4BD;
	Mon, 14 Jul 2025 15:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HxzCBDI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1EA10E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:17 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-31305ee3281so834147a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752506297; x=1753111097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2Vfa1hTNVLtaQ3ZfRlV+2JX86DONilPDV8aWr5D5/E=;
 b=HxzCBDI3CWjoVXQNcOa5HMRWUsgeHXOafKPwASMn9ivDS9SU8u74qKCpiHh4VQiLpJ
 xexvbtWLixrMcNIg1+tmuBBOHn0KgqbqVL88T4wwyXckb5vO2d/pd9Djc0FGzEYVPUZr
 WSrX694zdxUMJmClmXory4kHgN6pgVJ7di/K9W4yhYDmlpfxXViSezdWJaUl3KGzCab/
 aR5KygdpEeiedIsvqtbDH1xOeaf/h+tfWhM77PcjYx3H5fpQsmBT0A19sRTY9amFoeqb
 m7xEewo0EEFryTQoeoOMoz9Ki4oYcTkhaFRO301tNMVOpnjooVVG1t6Q1tn6Bcl1NJ8B
 A+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752506297; x=1753111097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H2Vfa1hTNVLtaQ3ZfRlV+2JX86DONilPDV8aWr5D5/E=;
 b=uEWxubp0I+9pMvVQwsKjo/3QmN4+rqOjgInUMpIMwwcl5ux1JFTHFq8lAkSTjbVr1t
 4wJE0TxriG4Kq0DdM2klQRIhiHPfbRC4b3w62G3Mi6EXfsml7ZztM1xhA64EDFpOD/CA
 xh9/iYTfnltaEcDBM9U5ZA7JlRRfAC2xc5fOl6ygB1hlZNnjEBJuztXF+UU8HujYV4S7
 t3/KQ3piedCn4651nQ44YPCjOswbX27arfwmNkH5ol1M/MBWY5f0QoDZNUM76LoTtBi8
 ikfJ05sb0YbxkAWEe1Trl9gjWu3h4uBCLQKLHaDC5yxCRYB5rr7m5hPyanMBY23Q4Ulp
 zzxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi7mNYhWltKgqYDrx9aC9zxhWxu0KMvHDAZfkEspVQNHcWM5t4xBudYd66Y0hQv81ymLzmnqI5uFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFyof2eKpzYLeBd3v65OQVuUKt6hM4BdmkRfDOHWa6/WOUiTRm
 cW7kpx8/s+OzpCGQhoZPMnnif16gJ7/otkZeA2s8jbG3IMN1rparIsEEY5HtoDOMnpsDMp8lFjW
 H+peKPpaMI/Z1UdOZTIC6L9bQcRwqWQ0=
X-Gm-Gg: ASbGnctk2B0CueEp+uvmUgbtFPn56FKv27uKGKWhdDzRa8b7q6bW2Xn5PaNUaCxBeI3
 NP2bltb3NhEWclpgsJROVcKG4mcgY4mO2iESLpjE56hitVlKAE/2rexr4CS6jLWuAAySnzlePId
 FaplitC7sGcqii1cZsfwKUb4CCkF4qahH3m+15BRvj2NpYM3N8I8iWRY/kbCTT9R2hA92Db1m09
 fXwf7Url5kKWfGb4ro=
X-Google-Smtp-Source: AGHT+IEAaevWA3THWIOPb1Ft9IVMbazdTZ0Roc9iuvAoj1b5HTax5adhB7GCfo0cZ1I1i+dSyxYRJQcg/1n6uYcNd6A=
X-Received: by 2002:a17:90b:558f:b0:313:f9fc:7214 with SMTP id
 98e67ed59e1d1-31c4ca77626mr8723572a91.1.1752506296678; Mon, 14 Jul 2025
 08:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
 <20250709-core-cstr-fanout-1-v1-1-fd793b3e58a2@gmail.com>
 <DBBQE3GJ0CHT.5PEF7RLS6C33@kernel.org>
 <CAJ-ks9=ZHtzeyyFSZaVuA1t-3C8-hc40n6r8qFWxn628qT-OeA@mail.gmail.com>
In-Reply-To: <CAJ-ks9=ZHtzeyyFSZaVuA1t-3C8-hc40n6r8qFWxn628qT-OeA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Jul 2025 17:18:04 +0200
X-Gm-Features: Ac12FXzX4FOFR5k7wOozEqN2_nmttthJfs0me70_TpwVT6YUdkB9gcZMGomkNT4
Message-ID: <CANiq72kyQQMutGDkHH=McRQens+V+wkHLpiSfivmnAwwgXE62w@mail.gmail.com>
Subject: Re: [PATCH 01/10] gpu: nova-core: use `core::ffi::CStr` method names
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
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

On Mon, Jul 14, 2025 at 2:35=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> How should I respin this one? the subject should be drm/panic, I think.

I would mimic what the previous commits did, i.e. drm/panic indeed.

(If I happen to pick it up before a resend, I could fix it on my side)

Cheers,
Miguel
