Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273EBF7E67
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 19:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722F210E628;
	Tue, 21 Oct 2025 17:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XJacVvzl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6D310E628
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 17:28:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47117e75258so27352765e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 10:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761067723; x=1761672523;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIvt0VE6pDtBysMBb+7V61rpjoqPHiE6K3Jjom9GL2o=;
 b=XJacVvzlmQkXDa5+1QNCFY+0G29moW5Fr/TzT1t1PoSu4CcEpHJWTnF3WPofgbG3cQ
 ixXG660ss80uchyZnNKRZrFs+jf5o1rIsVZewzoW8P1bULvXJTEHJVaoRyXnX+RBaamK
 xZpuRxkwMYgkrdHc+8qKV2qV4lsqiOEK6dD8Q7Qfe2hR114bogWJyXTFjbERQit3trO1
 TLzLO+2ezbkd0e8o/YK5SN9eMeQSnHzB0IldKcd8Pv2v8Y6Bbg3PhqKINXZaz7/3/d2q
 yMl1WSyFwCfv+/E2UheSwS3Oj/+VkKcUBC0b2C1ustVDyvZQfCJol9Ano0ZwApZYAwyy
 z9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761067723; x=1761672523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sIvt0VE6pDtBysMBb+7V61rpjoqPHiE6K3Jjom9GL2o=;
 b=efT1Mh3rrNQSXIcjkLzEWHfbw0FXmnIv2jphzWSMlbXxzqBPuIzneLhxIAjgCUc7o1
 mOM97wVwiYfsTlfcM6CJgNDt5QYDTKWpjwj3mrODVYZBnWTeBW3lUfYRk7pWd1yjNHb9
 JdfHPKO/QoJrVHuB7pJHvVeTLyaYmlUO55A11LlC4C3wkV4Ms9Pe8mDGkU9EiWhSNvrJ
 AgIrUIqGir6iMJySNVTfpDe15etWfXvq4hytL56Z0ujfw6UCBxsCuaDKGM0RPv5DCs1e
 7Peg6hJBdjkcKVwb8GssIWd5slc8dERwQwQ0WOud9N2FxHaGXhGnGhQTfZgJEbGGIiWy
 Bjsg==
X-Gm-Message-State: AOJu0YydOtfxWZXspS490MmlaWGhcKDIjfu8zewrwibYVjbpr7W91Z8V
 YGO8TTb+LyZPoLEVz9U8V+j3zXHWnaW4F8fUQ91E6xgX5A24YpFR1rcKTwJ5M/nQ8XgA12AFVJm
 kvI5fTyODIdRBJKyN43Lr1MrLlljugqtC1+CtgA50
X-Gm-Gg: ASbGncvGvzgxoaOpUUnJdKT7jRcRrMioHp3IZoaz+AiFrbEy/eZ1EFejKIwy4c7vJFR
 VAMS5WcuewQ0+ArOlzzbuUEi27WTi17plASxfqQ68OWa6QVBT3fYu9dd7kHIPxvjJz5OVUPHJ4u
 MMJZ2TfbpojJRqZl4bGeiniIgxAI9v/pbft4g/7mQueNMWbRAQV82gTBLZEhYduSXfQ2rMBbXWO
 TH9XXXY5/x3nZWjKhvdy61NJE01Yx47kQzQqqRoi9bHvzrdcHNfTSaowxaZ9O/j5UdkXu2j9Puq
 4Dk+8Lo=
X-Google-Smtp-Source: AGHT+IEL8TSxmx+ByEqq5v/d3QwgwT+yuicIxnSrNoU89up9h0ClDt25qfzL+RROhLL5BGgQE8K9DsiKX1F8eaxX3sU=
X-Received: by 2002:a05:6000:2089:b0:427:608:c660 with SMTP id
 ffacd0b85a97d-4270608c8b7mr11588746f8f.59.1761067723329; Tue, 21 Oct 2025
 10:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251021172220.252558-1-lyude@redhat.com>
In-Reply-To: <20251021172220.252558-1-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 21 Oct 2025 19:28:30 +0200
X-Gm-Features: AS18NWDyAysQ4Z6TjDjvO3tfSPAMTRUY6vagZwaabzt8xQyZFFpYe2ktJ7q2CKk
Message-ID: <CAH5fLgjXF2D+498Y2-ayjmNJrQEc3iGDPSQUjinPE6GdWmiWFQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: drm/gem: Remove Object.dev
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>, 
 open list <linux-kernel@vger.kernel.org>
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

On Tue, Oct 21, 2025 at 7:22=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> I noticed by chance that there's actually already a pointer to this in
> struct drm_gem_object. So, no use in carrying this around!
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
