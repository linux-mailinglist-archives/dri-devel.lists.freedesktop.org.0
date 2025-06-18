Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E76ADF4D4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3539610E8F7;
	Wed, 18 Jun 2025 17:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MAbH26SI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE34A10E90C;
 Wed, 18 Jun 2025 17:50:20 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-313756c602fso1093016a91.3; 
 Wed, 18 Jun 2025 10:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750269020; x=1750873820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8FicD/fgNk5GmRRD6awNlCWX8z/26EGV8z9+xgODLg=;
 b=MAbH26SIUbMljNbM1phrDIl5M+EnKnsAsfhseHf+oCmJKj3/JLTGdtDSmnhG1xWcxR
 vnwLIm5MxV+WXawgz/5/Ne+RZa3waVayN8ivyPYt08vG0ED+WIc0DYoXohAzmoM+ZzWj
 ku8oiVwAqVFrVoWrhIH+xnH4i+3bRhEMIbHzTL5GfkS3d3Ul9ehI/Tyb3Sxt9PtFXKrk
 FpbTSRR0mTOHYadKCrQmzNBv2aHbdWAFOsjtV7WpC5NXAem7i5SJhPjvIBYK/MC59CL/
 5790kzUhJefviFhJrv6dK3hblOjN2OHFtbglK1uWq822GtgqJHh4GivpkUMZJEYWZk31
 TQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750269020; x=1750873820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8FicD/fgNk5GmRRD6awNlCWX8z/26EGV8z9+xgODLg=;
 b=apKvDTM/t0uG7/uTnUanWSp+/wUtJ6QZJAoam5qYNT6U0nNnoJTYiWS3u9JFUv5IRY
 7OKersKlZrDatEIeJQ42JRW9NNcOUu0mnl53GtORm0K3qetqxqzzHbDPReU7gLidcy/x
 huFeAHVeQM5wQR3GxAYMSpV2LUGa1UbKFkUl/ANZXSS877qclNmoXIVdqUVAjy9E0Urg
 DpD6oAx8hyeCDdkwNDcFYx3fgf0Lei0w8HcOqnh0ny8Vn7tbKsZMqa/CnBQ3wx1zlc/m
 O3CKcdY/6anMM3A21/P+bDAS7B2rrh3bFUJ7CTBcTajMwsowN2jnNLMZSMAUdOQRJZ+2
 OOBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+7bUDm0xKyEmGEAjuOfRSKk2WD7UQmv8FbpdGaOjPG4HMeKqv74tLmA1A3xaCmEpIC/e/29sNzFg=@lists.freedesktop.org,
 AJvYcCXLDDLJ0KE/vbQwFL/2yJYqq3BVZWM4LMjYSyetDUe/TaGKVB+qZ+lXB5Swb/UR6TiP50Tq4lvl2w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/NETvbA7cl+DlQRwm2yFf2P70uhWjYxopv+AWow3p/j5XVAHU
 Af1lBexNKqx24Ld/Pxg2E/QELYX9kDTBSBy7br2Hw3/L9I+4ApLwi11UtrG8hnUa5zykNqrLUd9
 UBmh1MbxstHVxIGhwO0M6LR6T509PK60=
X-Gm-Gg: ASbGnctuc9q+Cnwn9onaAUPRPrJ5COtjRsVZjSqgmGf9Ady6tovzOtscDTz64Vys27v
 2BzH+P+Sx7IQ9qmyYysABmOskFdY6TwAXGFT26S8pZ+R+aM2WNoi4Tx2JfnlF8Pq8aqzAgvlbH3
 Xs/CvDXRq/XI7SEeRVCono6sbKOIe5633a89zRO2yXoQ8=
X-Google-Smtp-Source: AGHT+IGwBEuoz7ZkZcRjBpUqCxdbqSbY0pSB/07XdCAmHEONw2uE7rmOXu2mtjhcBLdh+UgbAYF1+iUixf8L1GxnymM=
X-Received: by 2002:a17:90b:3d82:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-3158bfee2acmr131081a91.5.1750269019586; Wed, 18 Jun 2025
 10:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-4-f43b024581e8@gmail.com>
 <de30bc80-3dc9-4fac-afe8-bf6b0df42ea9@kernel.org>
In-Reply-To: <de30bc80-3dc9-4fac-afe8-bf6b0df42ea9@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 19:50:06 +0200
X-Gm-Features: Ac12FXzgdlmcKkLec41X9ZU6lwhGyCLefBHdsMy9eFFNw8WZHynLVcdkmU58X90
Message-ID: <CANiq72mOHbxt3xOJw8f=j184TRYs9y3wvcopH-h6P2SLe4jVNQ@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] rust: enable `clippy::as_underscore` lint
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
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

On Wed, Jun 18, 2025 at 7:38=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Shouldn't this be `c_long`?

Yeah, agreed, it is clearer -- I mentioned that for similar ones in a
previous version.

Cheers,
Miguel
