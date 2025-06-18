Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ADFADF536
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2575610E8F4;
	Wed, 18 Jun 2025 17:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IZBEqLe7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1C810E8E9;
 Wed, 18 Jun 2025 17:58:47 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-313dc7be67aso961997a91.0; 
 Wed, 18 Jun 2025 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750269527; x=1750874327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FkPigFeNGfIgRpgDFtGW/mxVfhQYOSm7TXujD5qRUiQ=;
 b=IZBEqLe7x9/4CIdTXk5OpXfiWnsjTzavuw/U/GRPQBeA3toVRHYte9hYm0RUHLbNP/
 n7WzcWYefnBzcEbs3hZUoKFWk+aVGjIlsxVofChcD8QlOBokENaArTRc+8uI8Jaeg1ab
 uAJaF3JWqcGq4ed+TrlYOA2ZCdfyUAWvs+n0cTFfVqA+X1twdqzo6O4aCNnb5eYxgjaN
 hdCHZ1X+/PaN0ihFNDhThqyJzqayTYLNVyLZVcqv9BK6BIQ48zMmqsnNVP3C0x17qVRO
 zE/qaYfgO0tbme9AP2/e58XZ72i3MoR2bt2i5klkDKoAE0qzN3bkLFrIs/3S0NZdRSlQ
 OZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750269527; x=1750874327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FkPigFeNGfIgRpgDFtGW/mxVfhQYOSm7TXujD5qRUiQ=;
 b=QqbBSAn2gSTnjilBMnBcdlUiqKnBdfPTLtoeHbtquUL2085PYS10NdmC5hhfbAbcxU
 2ZJpIp3gnoWB0ui27x7yAAKBkJVhzVDuxEnrhLW8MmAi6FJhxc2grwgQUcdzvH3P5733
 kcFMDZ7he0Xqr03nYVoo53ZN9qS/dlYaxLyZISvyOmkCO8LvTgMPKKgQSIngKMf/2nH/
 Flf68yq8H0Nm5VANtOxH273Iz+W95Kmb9inFME/DnQycYdWvcV3tS/w3SubfBGAVPltu
 AFU7PSRy+FaChYz9G88gvplxcnZh2hdGNi6TsBekl7WE2iLV/q2xYlqCBaLNZArgTa+5
 sL1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmGIdD2IQ+qV+1FC1SH481G/yFPI5Iwr2fn6lP92LHbUQsL/i4hE4xd+BrEwoPtOBJCxpbzjY5aQ==@lists.freedesktop.org,
 AJvYcCWAApd0sRPsENoJU2A3Ww2pxG43A89RumYdU9WZJ38kmjCTpzi/0a+xnbc0a2xmVQDYtJBTyRD83qs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi+hgXvuvUwhhj28YUA4vQtUiA3iZj35415+8W8UHePcwiEEfh
 1ndm6GuYCq62CGUfoHUSZwMo/gfdl4ZZKZJKAQH2kcpEWbTyxo9MwSYnH1IfsNbsCNrCFORNrKo
 yibkScxlR5iYNvTwGMGMpSYZweUh4X1U=
X-Gm-Gg: ASbGncvyn1cQzrLMxd3Nr4C6IhkEApVbLhUbbOPJaFOw/bslnFdMJw9FYjdNgJOqH/p
 HkNH+mW14Sl1SFmFaH+o9wlq4LlVxsxbjdf0VmnMguHy+GoLqKLHPENJtZA1B/eKFKx9wCsV62L
 RqMx5LXfsKxZARPphxEad9j9+sFRhsR5iahtuch6W3Mp0=
X-Google-Smtp-Source: AGHT+IHQA2vB+4lILhLPisOadhxH9fnkiGb8fP5PoJh3YCmrD5jDUJpuN04m9Eq8KLRXTUak2OObg3c6xBn/ciPLwLY=
X-Received: by 2002:a17:90b:2889:b0:312:db8:dbd3 with SMTP id
 98e67ed59e1d1-3158bfeae60mr147244a91.6.1750269527292; Wed, 18 Jun 2025
 10:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-4-f43b024581e8@gmail.com>
 <de30bc80-3dc9-4fac-afe8-bf6b0df42ea9@kernel.org>
 <CANiq72mOHbxt3xOJw8f=j184TRYs9y3wvcopH-h6P2SLe4jVNQ@mail.gmail.com>
 <CAJ-ks9nnNjBfzCasOtFZGXBj=UKqZxuyh3-Emj3yFrz=9f8tmg@mail.gmail.com>
In-Reply-To: <CAJ-ks9nnNjBfzCasOtFZGXBj=UKqZxuyh3-Emj3yFrz=9f8tmg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 19:58:35 +0200
X-Gm-Features: Ac12FXyGUkldbEIksi1ogTddUr_YiD6acvLXBSTJ1-Ey0i-LXdAiD6xde1bhgwA
Message-ID: <CANiq72=9VyakSh_bXJjPPeXJP80OtB7iqKBM-p3bEMX3TYF5WQ@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] rust: enable `clippy::as_underscore` lint
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
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

On Wed, Jun 18, 2025 at 7:56=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Miguel, would you mind taking care of this on apply? Quite a big
> series to send again.

Yeah, of course.

Cheers,
Miguel
