Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F5B080AC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 00:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CE110E28A;
	Wed, 16 Jul 2025 22:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WSfx9jsn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99310E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 22:49:45 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b31d4886c50so49070a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752706185; x=1753310985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v//3UBkCMbiLFLeuBtGql5RmFNCDtwUoFx4ncSofsIg=;
 b=WSfx9jsnjZCJRt/NXwvdiIYPoS2OXYuwZ60pGjFZwgy3BuuxxsKNLLn4WbcsH27KbH
 ku5gn9XY4vR2UtSO2u1LDdR3R/JruW3sx/RD+tM8JGhLMoFinJd8jCmQmHHR4u3jIV3/
 SLBN/WkFXFDiiR3IBg2G2D2wpksAtLnBS2wFxHtTQi+TclqyPdlGJW7q9lJMJ0xGFq7s
 mV4EkzSQLVpr6SD+t0I1ve9lnYKhWHtf/JZ3SqRHUFjSZiWSi0idFkDbewDqNqeP2XbP
 +TfNT2bm0PNLPPbu2uUm8X7V5BUa6nQuDnBe3bZCF73MsdLsIsZu/Fi6qBRLNvkb9tcg
 NcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752706185; x=1753310985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v//3UBkCMbiLFLeuBtGql5RmFNCDtwUoFx4ncSofsIg=;
 b=quuNFZ0viGLVdULcbzOXOUCUfmQ4ZkzxN+xTCyKt7Yq7lzVtw/mb4h6WfUKDJZyrFY
 I3ea5nZCBdpIEVNhQJiYcmmwTMBIU/pKSCRR4vprR4R16w2msw3E8CdTXQNtfUKNamg1
 7zkobbZ5ElruN/cL0UW+pisDRbHMWPbF7QZIpAub+T/wJ7T0SYWiK46LSTPxDeGQfsIR
 24WmWckJs/ckJP9/vHjSnmCSUXbCn98qIrMaQim7BkfTw/pQ5FpytAIRNM096fkAkiTm
 JZA7AMU4avh+ScvOHkrvi8rN97oTFiaTfI+e82Dl9NuUSf7HQmd2cKP4NxknxDfytidu
 rxrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgYOfNmy7RMfVvkeed79i3G2MlwMx0K13uF+9KO/KNhdwpAjo6ARgXlWeAwmEsmUFzQg7IMclMnuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4yAe10wOjToH+cHZACee5pkjmi17PTdOdv6X3uQg7UiA7zRtf
 peYIVrqJDfzNPhhNNCQZCPZGqarQqJlndfbUZg7x0ZcyQ2BKEbYQm4u4lQOnx9qetppHgRyKpe5
 vV2Ooey2f5q41ZbDd9dKJcVH6O8U+1Zfwskql
X-Gm-Gg: ASbGncvGcUdx4Uqrai0oeuHp6srNJo+gk2h8yKYH/BEgjMVnywU35Izmjl336YlVrIL
 jLVusCIgb+BF7vvb/0bthjZv1adHyrxLzmeMF1NDqq8mne45ijz5JpXwT/GBN373f8h8fKzk6VL
 ghFsC0kCdRfTzjMqzW/etW8NjzmTUigSprqFtfa88FTtGXoNbevu2LtSDoz1ipif5ebSbPeecOZ
 knwtg==
X-Google-Smtp-Source: AGHT+IF2FyfdRt4/WjI7YWqu6cvz+ZQn0OnT19l1sxu4Z2oAw3gTfBbYI/cvlgLvUs3kU5QRfXuJ8gwGg8NFl38Sk+I=
X-Received: by 2002:a17:903:1a68:b0:236:71f1:d345 with SMTP id
 d9443c01a7336-23e24ecb7damr28125495ad.1.1752706185220; Wed, 16 Jul 2025
 15:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
In-Reply-To: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Jul 2025 00:49:32 +0200
X-Gm-Features: Ac12FXz9BaX-Wl5vT6RJ3n-TUcpyTsdzFMKNs4pOPLbp14a-OstkS9DkN8Ggm-c
Message-ID: <CANiq72kyhTMkZxizgL0Uu1NEbeGP=G09VP+Evb47mg4FyxZJZQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add Opaque::cast_from
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Jun 24, 2025 at 5:28=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
>
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
>
> To help catch this kind of mistake, add a new Opaque::cast_from that
> wraps a raw pointer in Opaque without changing the inner type. Also
> rename raw_get() to cast_into() for naming consistency.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied (yesterday) to `rust-next` -- thanks everyone!

    [ Removed `HrTimer::raw_get` change. - Miguel ]

Cheers,
Miguel
