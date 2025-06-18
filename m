Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008BADF3C1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90AC10E1B7;
	Wed, 18 Jun 2025 17:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YlMBmcrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FA810E1B7;
 Wed, 18 Jun 2025 17:29:38 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-313067339e9so1190702a91.2; 
 Wed, 18 Jun 2025 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750267778; x=1750872578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QHUg/jv+8yS9h0AdG3R183q7U86xb8yvD43XyhKBDE4=;
 b=YlMBmcrV6CU1EuX2Vnxkx8uDDlTJhsCGSHjuCil+cwMZpOu4duFHLoDNb+uB3omioS
 Tx0JvoEToLQ7x9N+pOpzwF0SWUysoQK/k3VGv5nQP+oSUT2bTT1Z1wAZ5IxfKf07sSJL
 rsrqVBnva4qXr8eU/WlEnyBVnwNm10KiPbzEa5mKV8pcdddejaYYqgB+mj0C9yxcIcGL
 iWD6Y6DsllILGkmu3aab4Z+k8F1gzKlSL/JXsNn7hgZNIrgcuHKkv35QpDJTdz170laK
 rxx1JerFng82apomHc/1VzdtsCsbjqve25UEadQoMzmFPc59Rew01eFhQyOgBzEp3XNO
 nrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750267778; x=1750872578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHUg/jv+8yS9h0AdG3R183q7U86xb8yvD43XyhKBDE4=;
 b=RNLDbZqgZBlkq4EYwwBqJNecPXhEPFaIffIF23NOTFbdt60ZK8xFzKYyfLIWJwqyV0
 AXhqOVaspZVyQKQS7nhN+quUpJ7w9emr/f9cTaxyaaQ0QQVSuoyrElLfg/dt9ZIKpJW6
 6wHazn9qtWmb7C9xmOagPJlKtgP+rXFqqkuMKx9a23WrQhZ3HC3u7pquinTpy+pAE6p2
 fBEMIBOuz2eBE5mIm9X0gInKq+6+jubMEkwPQQnKtWXlC6BTkK9CteugMoZLrviGQiJ4
 b71Emla6o0sGPkyb+pE6MQG8HGTJpe7QmUOqpqGWZRbSfqI43OTfXUw0vPrbpHXeorRM
 JTBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe5Y8h2spEqwUtaf/JKY5BZB7jrivhA2L6FZuCBtwhGaZWur/t7hiz7D7nmkmJC8KoSC/E+qL/LxQ=@lists.freedesktop.org,
 AJvYcCUsQNYVX+s+tOQLIVVqlCBN6St/KD6Ed1weAVCh17ntztoAECiCtrZe4lJ2RKYrdJtVOgUfYREjrw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCX5xY+B1/nAZevL36WZTWZvQ70IMVyn2SCjEJSDBRXZxq3bDO
 47m4i54vQCuk4xHSUysWE84ZKWb++tSS+LXmkrN0vudBfzzLZN0MwvTdg/IYRpyYEBPZGPrnSeP
 y+IG/JTpb6jgSf5jXK3w16BIkTTPesSg=
X-Gm-Gg: ASbGncuF7ZLgpfHzIlW6pDAahB9HGwrQKjQcJBmMCz3VpzkRIYBo2KUj3PW/KtdrvrQ
 +5l1fP15LbPdiC3JJQik9j/B4M+6Vq3aA4MJB1dDQYnDZ9l/HtnSHnqsi3oBV41QJ1opVAf/Zfc
 UXvVb2jb/vVM+B8ndR2RjR3/3tLp1OcfaOdi5XNLXkBZo=
X-Google-Smtp-Source: AGHT+IFq9ZRT8EBGthi7dxIDQNclEwdJhDhFsEYu8DFI7x0ubODZrG0p5NckRqPFYz4ild8B+/dW6oREHry5ELX+Kuw=
X-Received: by 2002:a17:90b:4a07:b0:313:151a:8653 with SMTP id
 98e67ed59e1d1-3158c004765mr67329a91.8.1750267777769; Wed, 18 Jun 2025
 10:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-3-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-3-f43b024581e8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 19:29:25 +0200
X-Gm-Features: Ac12FXxIuJv_kMbDdBqAZBwk2iCsUdqf0pxgEqDUQ6dB6Y-mWXL8-29ebiQ2HSg
Message-ID: <CANiq72mn6fFL86-7XjsovdjQ2ySiNNviP4dvE170FmK_4E19OQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/6] rust: enable `clippy::as_ptr_cast_mut` lint
To: Tamir Duberstein <tamird@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 Greg KH <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
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

On Sun, Jun 15, 2025 at 10:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
>  rust/kernel/devres.rs | 2 +-

Danilo, Greg: for completeness: if you don't want this, please shout. Thank=
s!

Cheers,
Miguel
