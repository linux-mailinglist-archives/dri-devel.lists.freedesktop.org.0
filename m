Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5492A70B69
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E031E10E5F9;
	Tue, 25 Mar 2025 20:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BzT/POto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F7210E5F9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:23:07 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-301b4f97cc1so1814173a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742934187; x=1743538987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9m4c+ltknJRhsCeFee0yb6mvCAQkizSHg5zSHgmmSSI=;
 b=BzT/POto/U4TMVMqcQUix2l2XvpRmyxkhPS4daejDl38bDwhlJsxWJ0DX08lvUPmoV
 LgZgAMKnbyGiPWBxGO6I8SGNvBstQPRLI3ge/v+fNU+M4QS+6u1NrLBKrAhRRD6ldHNu
 VVPGBew1AMrp6S6+6gGr7AC7TOtD3PiAZR/f+tt9XIFM4Fl1kJptlOzJq68wZq+g5W52
 ITfFsKour3OUcklN64DCFdid29XlWYCXvbAmgkVRVepBFRRUrvlRfExtVps2k5jj9u61
 4he1Jfk7ifhPokb1iYEynZ8zB8xbtlqVp2Lf0EXu9ky0AOsnlnxc144v0TMOf9A79fOF
 LKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742934187; x=1743538987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9m4c+ltknJRhsCeFee0yb6mvCAQkizSHg5zSHgmmSSI=;
 b=fXKUZx5IEtoI7VP1R2sKbDHlfHhg1Hm43QweHGsaDYNRXqlzkLUVft2+kUE632u6lk
 pXbQmLj16+mo4Zkx3E259rfIOdy/HgOkwslhsosL6ELDbtP3s/5iZtlqGfaj+zx8lwgo
 qusN6iswQVVSw6Yaje5rRRIRDFcpgO1Iq+J0IlGNQ31zAZy7klIHBfGFnGU99ujHbl/h
 hFPyoOVXPtffQIuNpidvTFVJSziCv0w4e0gzRDEUe7VZQg+r2S3vPTFj2FrYRNBLRyFT
 UJe3ZqhMYnXlHL0TI6QoYBkrdyfE35ZQXFUX7cKf+MF4ttTu321GSyO2sVr0i8hkqUve
 bdWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7V8ECcEl3p1qmvoVm9Qz6NRDtVDfRmRT6CDDGmAhQRz4cJNFMt40XiFhtfCd/6nyoi/n7JTY3z8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxipwfAZm+ACxyk9yr/1yqTn0oaOBBld5IWp4ZGszibl2mTZKcu
 Zag72i3HmoKjQUioDNFIgjWYrZbzCZoc+5778ZXo8wBs/S/87vwcQikac6BWH52PgQtRmKFbLVo
 cjZ1GuLM4oPOkXQUbF0a3dgBW8tM=
X-Gm-Gg: ASbGncvv89n/AtP4Q1I104Hqo31k09pz5KNFJkPdXXxbdRXsQ2E2rsFSbRz9HDtfL44
 J2koq2G00NwnwzsAuXyatDRnvs4DInrD6geE4dkgjvKd1uGD4nx/m5mrZoNSF6Ohs6TcZOQyvT0
 IH+GtFAcnb0OYMsaAv17CcbSgHuQ==
X-Google-Smtp-Source: AGHT+IEhNTmCEBNikpL5wyZ2DVQHHugAAT1FYw9OchvAu8+NGxkGVMrvRknFmmmgMZIQgi/rXF6MkJKMwODDmz2eQNM=
X-Received: by 2002:a17:90a:e7cc:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-3030fb1fff3mr10744610a91.0.1742934186972; Tue, 25 Mar 2025
 13:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
In-Reply-To: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Mar 2025 21:22:54 +0100
X-Gm-Features: AQ5f1JorhdRCr-c46B2u1qRGJPY1gFSB7x1PVMmzGDnN5Cs2g1bq7fSKadEMtFA
Message-ID: <CANiq72kYt2mYG8FA=U6C4CPUGfAwDFZ8Jji5SH2Yt2NnOHua0w@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] rust: reduce `as` casts, enable related lints
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
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
 FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org
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

On Tue, Mar 25, 2025 at 9:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Changes in v7:
> - Add patch to enable `clippy::ref_as_ptr`.
> - Link to v6: https://lore.kernel.org/r/20250324-ptr-as-ptr-v6-0-49d1b7fd=
4290@gmail.com

Please slow down -- at least wait a few days between revisions (unless
there is a particular reason that requires it, of course).

We are in the merge window anyway, so there is no urgency to resend
since these cannot go in, and you may want to rebase on top of -rc1
when it gets released so that you can cover most/all cases added by
then.

Thanks!

Cheers,
Miguel
