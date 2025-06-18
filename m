Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52429ADF359
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACF610E1F0;
	Wed, 18 Jun 2025 17:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iV6NFl/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97F310E1F0;
 Wed, 18 Jun 2025 17:04:25 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-31384c8ba66so1295491a91.1; 
 Wed, 18 Jun 2025 10:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750266265; x=1750871065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzVpmXFF+T69S76tPY21hKIVM7O6QGPZHJ4LN2Hdnks=;
 b=iV6NFl/4eIFX+e/CuR0zNnwZPxvq1vopVSHEPzSzM99PvIep2dmJpwdWPDGPP1c/RQ
 8g0oTrv+sBcIG3mL8g9HYZAPcHqzQIRaLuLXQB9NzTQdF1pEdgbRHKz7sR9ucv9gdInv
 rpjS55Kq8NFm/1xuyPZ7YmKwOQoMT5ioMTR1cudnqCpPcf9csE+CKzF/9NrxIaeYnyfa
 e0NGFChUKP/bwsIxmBn8rZvZT1WKIft1uhaw4Go605UgJgo+6AOsAGibnW+Sb8dH63Ld
 Wdr0MpPbo7jLK6apzFzCiN9cO/UWL+dkxWW9i3BUVeO2na/B6KYcorAYB9/ElUvQPdU0
 g47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750266265; x=1750871065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzVpmXFF+T69S76tPY21hKIVM7O6QGPZHJ4LN2Hdnks=;
 b=T9Euf8Mjfid9UUX0sMQJ+2gnyRmKMnXo09wv1AHsl04700Mw5WScSCSxgpUuvkOfI6
 fnaSYu8lQ5x8giBSUfTgYVC5d8BM0Cu6uqzDwH7P1gHCxbcd7p9LnnOZpXNEI8+Fngf3
 dWYXcf6YjxahGNzC19m/SP08a01cQ2SLFgEVV0y7c+uTjCf8ABTggTXsY8UAl46iqnDf
 DK9qe0OZpQMdaKxsEq9lUmFgo/XB0c3CIeJTozfEEa0qrH01cctTPCLzfHDlWSUpN1qz
 HTbhy4AFO0riTTZn0eLn6UnLBA7wam89oLv9pkYlxf0oOhcazOt02CaSFZfVwMvpJWRS
 ZQYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbPBn4qcfD/BeyHvRXMjpoNuxhVOw1WG+WXesui9TEV+Y/VjpTVgpQrlKwTo5WYAIgM5Fvkt3Rtg==@lists.freedesktop.org,
 AJvYcCX2ffE6HtCqxZHy67gDOcrfqEud3G2f1q3lxj1ID4+lnZdxZ3IjP2QPZqEfNJTJZdW5R84nTkK3M4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCwIgmwziJWCkFfYyEelVFoEAUbfts/DF0zuvg+o3JwJmjmYNa
 g6fk2PAXI+BON1bOUbtdSXZsFM6/075R9fyU08pbL3WdAN4NPCXfEE02ps0bW9guy/tcJgmnBxr
 ftC8w1lYMNeRlo84LB0Db1/UI9mqN8qs=
X-Gm-Gg: ASbGncv+Zt/n3vawQdB26vlybtxR9DXXTfFdmkC0SeT/FRPFy/6o4claZT0MJhlO0Sb
 faiILCVlEorV3daBIRSDQcJR/xLo/Wy87qDzGSZysLWrlItEqeTR6e7fYxKXJpEWswhb6jy2fbm
 lqQuGQiTLWEOiHQ0NUYdCOZnKUeh6NOUiZkXryLW54U+U=
X-Google-Smtp-Source: AGHT+IGLPSVFYPhvf1j/K9i5Ol5itQWfSDa0TfKsaOdtXXSM6IGI5PpH0AQX2y0lYKJIABjfvnv4mQ4chj2kWgpmo4Q=
X-Received: by 2002:a17:90b:4d12:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-31425ae54f4mr4444282a91.4.1750266265350; Wed, 18 Jun 2025
 10:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-4-f43b024581e8@gmail.com>
 <CAJ-ks9k0vAw9UHx-s9uD9u0LufvgnojtrFoG=AH40Gp9HnxEDg@mail.gmail.com>
In-Reply-To: <CAJ-ks9k0vAw9UHx-s9uD9u0LufvgnojtrFoG=AH40Gp9HnxEDg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 19:04:11 +0200
X-Gm-Features: Ac12FXzqpoYx_1GdDyAZ3UU1L_A1NGXd58Gt0NSR1KeeHmAk1xTtSvY9Na-qvaw
Message-ID: <CANiq72n4rr-S5NtFECxpd8FzkZvE8mg++p0qWDLK7+C0ru1Tew@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] rust: enable `clippy::as_underscore` lint
To: Tamir Duberstein <tamird@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
 Christian Brauner <brauner@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Greg KH <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
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

On Wed, Jun 18, 2025 at 3:51=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> @Danilo Krummrich could you please have a look for nova?

Alice, Christian, Danilo, Greg, Tejun: it would also be nice to get
Acked-by's for your (other) bits.

Thanks!

Cheers,
Miguel
